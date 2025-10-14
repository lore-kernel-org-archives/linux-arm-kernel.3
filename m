Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2682CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h0C3j15Yugc04L5diekbYBCyapTdq2v/4isDBpQOj5g=; b=cOwxMq2UyBed/NXJAn02aBoKf6
	6Pfulb5r5O6MpAA2QTqHj0ZkLC7HtnIZTXw5dV3OorIv10vcG1JjDdrVtepSekAHtoo4XqP9Nv5bx
	NSwe57R7KqvBfBkk5/4/71O1xibbaMe4Z5thIlRSDFp4LMzk0DSsPjbtfEsBV0UMxrTCuroC5Newt
	HATv5Eskx++Ju1ZWwa/9wI1DbokLjwnDrN/Kcfp+mI/s1Zcp+p7FaMocfHmPT2HL9b/QmOcejgVrl
	AJCtyfXfLKOCHfwhb5cW/pVOWU71x+Z6IQkrxynUlLPliXz4+VT7k9ofzW0trxud21sT2/jn+MTYV
	cVsZrzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dGn-0000000G6qN-2v0m;
	Tue, 14 Oct 2025 11:32:45 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dGl-0000000G6pY-2zvB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:32:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so5595994a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441562; x=1761046362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0C3j15Yugc04L5diekbYBCyapTdq2v/4isDBpQOj5g=;
        b=hfAVmKVnRPu3UCrY1l0fdTAz41vd+z7Nop8QuiSQv4nEQ0V0kp9Z8F4yi1/vjtES2N
         4Jv/hyIflZ31Efv2sysE9sFc41hIxzXsLj37J19Lr8PwSs7NKOiESFkL6tWD6NzWxwyl
         /AuBdW4saqb8uFTChhx3897hHdF0HmW/CJtEsZQ3ELDKu9OyQf0i2ME+fPxpe8wfOfgL
         P58XR3n8huDu5ZJw0WCxHxrGlkFbBN5ZJ3DDWI1A2uUzVPaCsOxVaUt8zIx0uU+OvpYE
         05J1OczN3UoUDv/byRjMDiIuWDTLtU6Y56vkqjF+MeN6bijCWZX9RlWfJzBs6/+mHPKN
         8jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441562; x=1761046362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0C3j15Yugc04L5diekbYBCyapTdq2v/4isDBpQOj5g=;
        b=nqu6z9Uj+D17a1RUuklxSS0HLM0ze0sD/DKSbZJmV5zre0Q7uRxYfKY3/rUHhrHmK3
         z0KpW/N/13U7XQtH4bKbZuhCQe9o5LgTwlxBh/0abNbQsnnCdE8jDNxO8Y5RqZ58Vaed
         eV0Jv5R+NKyo+B9svX2HLjoWlCkAF/A9DjeLjgn0U2KfEMwt6metfmqBCep/Tsnz2HBJ
         z/yf4jsVAW5nKKCBKuDMbbR2mQTF0OmPBxlmjqNLHdv5P9NKZP5DsJSSGwwQRQSobW2P
         fyE5u60w7SjtWkDlcDefA9rKmUJh+LFfhGx7BpyWmQjsk1zcKSIvIUghrC8uuQsHEpUm
         kwfA==
X-Forwarded-Encrypted: i=1; AJvYcCXgiGEzUtokYX8qNvEZuSVSGfckGWfoK17S9OErsB94AMbPBhpCXcZloxCvuHoIp2oP4VRq/MPPHBss67wXGel5@lists.infradead.org
X-Gm-Message-State: AOJu0YzR/xZb4itCbru1iOwrWhXh/hf8nsFw5dBveKhwa77ZeVs2mvu5
	7T1ZdMZKJyvr+vj8BPgOWTRBA4etuX/iu/kGO6R60/LPsEyg2X1HmyhU
X-Gm-Gg: ASbGncvuxucAU2LOVJuBOHhkEjrAe7WmyYv0DUdUAYLQovRBDYRkRDlQsZbmiNBLeof
	/4Y8TZBxYYtealcemqf9Y8KLD21xKY5FAy9zu/zwEIRyuLT8eulrIdWnbcQ42Ql+0jHt5+xqRTf
	fMsab1WfzZouDOxso84AfEAL5Jxv2FUoRg9pDyINrXJDJ9iz6u1yCvlJ3b3qlmhZ0DasQPMdsCi
	xhvPVkCiiDDyaxtXG3hlL9j1eU48WcMEPAVuSDebB3X9a4FUYQ1UVMOZVuGTI5HnuLy0TiPIx7o
	M4qPtxc+K5Xo3J6s+jbto55WmAEH65WxQygX3Q8glIQPsVWWJOiRBhALbcC5113UpipcZYQT7hx
	DkRL9o8oW+8GT9/NuQM4LlXtRwZJL3CsJVi6jGic=
X-Google-Smtp-Source: AGHT+IFOXw7annfzhh83UINHXYFo00qKcPjKDkiEC3wElyWcHBIp7o3ZfuqFZw3zUefrPIrk44z91w==
X-Received: by 2002:a17:90b:1652:b0:32d:d4fa:4c3 with SMTP id 98e67ed59e1d1-33b513cd9damr31858712a91.31.1760441562336;
        Tue, 14 Oct 2025 04:32:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm14871383b3a.52.2025.10.14.04.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:32:41 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/3] PCI: j721e: A couple of cleanups
Date: Tue, 14 Oct 2025 17:02:26 +0530
Message-ID: <20251014113234.44418-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043243_759781_69D97F04 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Refactor the J721e probe function to use devres helpers for resource
management. This replaces manual clock handling with
devm_clk_get_optional_enabled() and assigns the reset GPIO directly
to the struct members, eliminating unnecessary local variables.

These patches have been compile-tested only, as I do not have access
to the hardware for runtime verification.

Changes
   Add new patch for dev_err_probe return.
   dropped unsesary clk_disable_unprepare as its handle by
   devm_clk_get_optional_enabled.
    
RFC v1: https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (3):
  PCI: j721e: Propagate dev_err_probe return value
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 39 ++++++++--------------
 1 file changed, 14 insertions(+), 25 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.50.1


