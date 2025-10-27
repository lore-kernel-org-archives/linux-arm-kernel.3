Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7878CCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2Xvuh0I/opmY/ziCGQafTK7nM7PxgpGRf3XOAE2Yhw=; b=IrX4kS0arLtLjl/b0Z7Znb+k4N
	5TPpKfRrPnKBEJBOGNZLoSmoxJSIbBBaY5DJU4qJiRRGyCyYv4C839YRdwBHW/PPEn8xSI2iygePN
	682C2ptjIBimmhVGG3HQdFZVSsYz/u8JfMVmrNw5/Hajn//NNzHs7Oe/zAK9eMcz780AErMaNEZGV
	QPlg/Sov1ym6tP5tZSieHABQNYifzFevLZMv16zgQ+hUa4v77/NQarm21JVTi8EExc5LqXlfhwZNs
	UI8QgB+59t76FwK0//OFh4NqbmRUHDKxdQogcLtSMe3ojW7m3E1Lgkr9R7XcCOWvHYIrzqlw/hh5w
	d21FkryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8L-0000000DTaK-1zmz;
	Mon, 27 Oct 2025 09:03:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ8J-0000000DTZM-03ua
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:03:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7a2738daea2so3619926b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761555798; x=1762160598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G2Xvuh0I/opmY/ziCGQafTK7nM7PxgpGRf3XOAE2Yhw=;
        b=EkBCzMR4PXx9tOE0/yFgpKiJ4XIklFOjV+r4aCFgLeFeDXPUCQJpbxYJGExPldx5xt
         yhiT1ql8sUeBMdlI5wgxmic3jBcNv2srO+4D+ZtlvUw0TAxfMAtuBnDAAmtAh6n1/zLD
         6suJYwGfoUJ0fTkPBrjL+CzsVDSJE+aZKSb1ozno7JRurf5Ek2/XqTO+5M1gdZIs/y6i
         +Ewsc8tmbSp2dky7dUEL/cQvHp492NVesV2A09gv7YnoUPtXWFIB41YnJVnaP+Fmlqow
         /xgX3Vvp5Tni8/C1FLRayeKNpxo8H0Uyzo1YtyfMN/3W2REQgP+jKs0Hi/KPvwsH5kZk
         ah5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555798; x=1762160598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2Xvuh0I/opmY/ziCGQafTK7nM7PxgpGRf3XOAE2Yhw=;
        b=KKgUV1U3RcMO764enZhpO/SO+LV6C+cqKXfRHixzt3FaVg9USlteX809Zip1EPvGMB
         P6Tb3blqeFu1h6sUxokKSssokkJXyx0op9+qVjelNMqXKg0yovYNuxg+VgESMzW9oz8J
         qqZGCJkqaW78Yl63C0XowlE0DVL6+6B4E22I6GlcD7lGnT9+lIdOwK2MwNfzWRWhrREk
         EYiRsk64JR5eXdnz3DXAe2q/hTISM/AaRutrlHquxl/h9rA/H0cfDmeW1UMf9ggPB7I5
         EGofZAXCPuopNTFbPQyDMEMGZEYuApntflpSFmI850kEc8rAgQ/LvXvMh7h8URuPj1sF
         8VHA==
X-Forwarded-Encrypted: i=1; AJvYcCWcFag7UGQmh67UiymT8GZHn8kDit/0lwO3xEJdSNaM+c39mdNyyLsvgxGfPduyJM/JKunzfhQqydfTwOhMNqWD@lists.infradead.org
X-Gm-Message-State: AOJu0YxZJvGuuEMMnOmjsVWSE+ilXBTIDVwXv0rfe6YkIXXG9esKuXNb
	opAPrAudV8AkknfEdzGfOgprfgCBdPW17qivbBF5XWzWdcC3j9oWCb6E
X-Gm-Gg: ASbGnct4vencAbu2fjGMmRhTV8prURNKwDdhbWIBk3TAqaP5o4b7tZPBuiXIpfnRD2o
	0R6Ad13solUzHpZqIGg1HbIPfxC9XC79XKtjup20OtlgL+SisOdo78JLd1tphmveNIpggIHz9/u
	JVOTsfOaKaZWUTPgnK0wbu4CuocAX++gB/KNM/L9kDUq9MUOzPRefnrydMj9OIg3P58memXPuOS
	HHsSJc9MkZoBwykBRZKpTfbnB4c9STGy9GqK/rJ1OTLfAZifFYI1zCQXw6i39bTAGzZo/jPDVx0
	e9X94zdi2E4gfNS7ZHrkGc7RrGLqo0+bUmcRcX1LTkTcXkBNSJDfnguDu4nd1yTGkIQu7JXAEFp
	F6XIPF2543wYYTtAUlr1JK18YkQhJh+j6BeGPIiAkcwEs2IX9aLXyWv4zKRjMY6Q+L99cKj1NJD
	R7M8C02rqf
X-Google-Smtp-Source: AGHT+IGxRWBU+fTBAW0RgqmP8oSsQAfOzUEn3iCBlYhHwERcOsccVd8fAGBDoZpy6feb1Z5JjqF9+g==
X-Received: by 2002:a17:902:e5c2:b0:26d:72f8:8d0a with SMTP id d9443c01a7336-290c9c8c7c2mr441668685ad.12.1761555798089;
        Mon, 27 Oct 2025 02:03:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3433sm73881335ad.21.2025.10.27.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:03:17 -0700 (PDT)
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
Date: Mon, 27 Oct 2025 14:33:04 +0530
Message-ID: <20251027090310.38999-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_020319_058587_0E193B20 
X-CRM114-Status: GOOD (  10.90  )
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

v2  : https://lore.kernel.org/all/20251025074336.26743-1-linux.amoon@gmail.com/
v1  : https://lore.kernel.org/all/20251014113234.44418-1-linux.amoon@gmail.com/
RFC : https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/

Changes
v2  Drop the dev_err_probe return patch.
    Fix small issue address issue by Dan and Markus.
v1:
   Add new patch for dev_err_probe return.
   dropped unsesary clk_disable_unprepare as its handle by
   devm_clk_get_optional_enabled.

Thanks
-Anand

*** BLURB HERE ***

Anand Moon (2):
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 33 ++++++++--------------
 1 file changed, 11 insertions(+), 22 deletions(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.50.1


