Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BCFCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4y0EJSogwXb/l2ctLCybder9EWKsVTxzS16PIlLrZdk=; b=2wMQWZv7tmQ/kyRJEkZigzzm4x
	ooiUdBg4LEPfJo45VzWCjaYwQd0Y1ZUz1esiEqIlRbz+v/pxYg7zLZtGTCyRDIEFiP9SSGRPrjxgf
	Yx41309Ar5FM7fEjBsLji+XhgmsDHxbPg98PLRvVzMRroF+g+0DUj6D0K9uDHyOmMN/fc9JR4hNNg
	Szqa0TcqBSFfQ7ZcJtSEf23w3ECGJSnYKDP7lk576+d/jRIEZW5a9/HT0moMvIQ+gA9Umla4VGYQ5
	5BmCzbj6nvht7vLAN4tObgYEr0cdDZeHri7tDA6s9iJLLGZE98niiz4dOPZJlrZ1arxF5UatS/abV
	R6JJTOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlqO-0000000GCu4-0n8z;
	Tue, 28 Oct 2025 15:42:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlqI-0000000GCqq-0xIp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:42:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-290deb0e643so57047675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666157; x=1762270957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4y0EJSogwXb/l2ctLCybder9EWKsVTxzS16PIlLrZdk=;
        b=GCaySlGWfP+/WS6ypOZkx/QftfrmyGj/5JXboXJ4vu2L4EWq5a4lO7Kfj1RAtnQTVR
         sBtR/Y7kN9/976ArbBCfM/k5o/zpTuHRbQ1zwDFh9qErhyN7SWXfiuKbYVyVw5WPznuM
         ysh3yfhrlBw3nv7ZLhOfGsIWoe44/uhEmvGCwuQQ0YroMKn/iwW+918k3I3KAnozvUbp
         kg92vo/pia7WU1vT98bajMrb5bDGZ7uMjZOm5QzzgAIquYeGaIsbzqBckGlt6G9l0CMZ
         om3Alh3KLQ58OeCCy7SfmmKyGDeK6jvjXNYgZDTD3mfOMqQQLqDyQX84OLdEfRM/w0P4
         9YyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666157; x=1762270957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4y0EJSogwXb/l2ctLCybder9EWKsVTxzS16PIlLrZdk=;
        b=qOvGS4X2zKaWhACosfxS5EIo9adTooCNWFIMDqVYS3CJOJS2C0cjnL2BE9FXTC2iuB
         bRzmzHNPq/TAqcS3VkhQmMs5eGJ34KK4CH9Q9R26HEV/6Mo6+FoVMQi81jqmM53i74io
         GAxvi1q1D9lpRPP4/zV8R6u4zJ2OrwzGyoJ60JwW7p8UiRaFXKUCEXbEZBj6VHin36f7
         h7v7V11G8xKYvLlL+L7eFgLcS59FlYUf4rrZuXNcMdJbn8a+6dRneOGttzJ8TrQii4b5
         PgEo7fzdprqtUWn2ydsXrrPUgrOhTnsTuj03nweyF80OZKNob3KJ+/z0zkhlWzvOPD3l
         7Yzg==
X-Forwarded-Encrypted: i=1; AJvYcCUrKQMeZ9RJprKl9gp/vevoTi2mLUbs4xscZFsqowr0DrVUBBUp9JKxsDDpve4ildc5iHki7rJ963iHKwNG0wr1@lists.infradead.org
X-Gm-Message-State: AOJu0YwXL+riIOSop5YuUYVBiYr15RBVZXnq6z6VpcxYcoSidM1OTyNT
	rqgAXHqj+GE5pstLWd93uXKAC37B1gtSMGvyLg1CcRVGl8KrHw7JG/Hh
X-Gm-Gg: ASbGncvTjS9glhOFl0rlZIoS0Zbh+Tsi8ZXYyncmxqMPxYfRBxn/9bd6JRdBmbuAmah
	MIhHqbsneG1BABQo4oiEw5mDo+7il+vnqijYRH6qEc/lu4Coj3oNBC2QZHFBFNRMY6yy0Ria8kM
	NbGRVV5twbn0wX4ZahBFG9zIASWtZ10nmfoRcKUlJHT3DGcLeArV1jHdphoZlnDFKx6PV68vB7t
	p2mkDijvmQ+CDQfD7jSu+Bnio1XShjj35ZDan8++fnoXNvdILodFvOIh5iyBTa5qPy4PDuar1J8
	dHS5Frq2YWaPN6bZXgCWe/fzQkl1cHLafcmXRpNoCRNl4F58nWk51TqtYRRmH9rlhsy08ib4hH+
	4wu/2zC2bxD2v1LRHZABr2rPhb8+cZqi+n2WudZF+XE06xoMSyDa0FpweX0/Z0wOGgsFY+jo6ym
	GLepKEPKWb
X-Google-Smtp-Source: AGHT+IEmbuhAY39zkLzLEiO4/3IEI+wJ/XdixLTlEX12sPPCwzL9L/N235oD3a/xqhHcC17poBLbbQ==
X-Received: by 2002:a17:903:384d:b0:276:76e1:2e87 with SMTP id d9443c01a7336-294cb52558cmr46649865ad.44.1761666157092;
        Tue, 28 Oct 2025 08:42:37 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a4d9sm119815145ad.37.2025.10.28.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:42:36 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 0/2] PCI: j721e: A couple of cleanups
Date: Tue, 28 Oct 2025 21:12:22 +0530
Message-ID: <20251028154229.6774-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084240_813179_31F58FA6 
X-CRM114-Status: GOOD (  11.30  )
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

v3  : https://lore.kernel.org/all/20251027090310.38999-1-linux.amoon@gmail.com/
v2  : https://lore.kernel.org/all/20251025074336.26743-1-linux.amoon@gmail.com/
v1  : https://lore.kernel.org/all/20251014113234.44418-1-linux.amoon@gmail.com/
RFC : https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/

Changes
v4  : Improve the commit message.

v2  Drop the dev_err_probe return patch.
    Fix small issue address issue by Dan and Markus.
v1:
   Add new patch for dev_err_probe return.
   dropped unsesary clk_disable_unprepare as its handle by
   devm_clk_get_optional_enabled.

Thanks
-Anand

Anand Moon (2):
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 33 ++++++++--------------
 1 file changed, 11 insertions(+), 22 deletions(-)


base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
-- 
2.50.1


