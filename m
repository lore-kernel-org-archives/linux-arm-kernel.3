Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E6BCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVLSWaWwsAp3+Eeor9R4CziFFyAk8nsobOp1lA8YjmQ=; b=n2jvmKHFgNlIrtCp4RkQRuDcE1
	xCbve/r6xVICI6tVFqGw3l23HhRP3RGM/sbE9tMFOf0yF/9F0e5uh7ItoPnIpPzBabp26+6UCXQEe
	GP/miMvckD+LZ5wKPth2vb0VwqatcknEjugWXQ+cpmciqKSAIGH9redRtg+P+DQUsoaMj5FqM+YsK
	12siJ3H4hC0lvifhuAnDJ01Hi7h/C1xjhzpI71nev6kd5QA3Yu/lZtoUYI43Hho0ThzKZiOa9OQqt
	jOkcPO5kpWfSH0488+1ZmOHx4U7JKquA+beQwSAUxp9eamUsrDPKIvr/Y2r/6n7dclEgW2Cf0ygyf
	QsIk58fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3gh-0000000Gash-3iG2;
	Mon, 17 Nov 2025 18:10:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3ge-0000000GaqV-3klS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:10:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-297ec50477aso33416105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403048; x=1764007848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVLSWaWwsAp3+Eeor9R4CziFFyAk8nsobOp1lA8YjmQ=;
        b=UAqVLspkqcs2m8desE4ijB3zvmZspHKMJSuh0nP63Av+zTfMHFS/YFwQK5zbmu899R
         gjh6jTCwzM0IoXX6eMeN8IcUkZPCeChFOnrHTtYMhXbJC0UEdNCXnSCnVNdYVNNROxyG
         8sCxt2azbp0pdTUaEPT0CjajvBAfwXQzu0ltc3399Wo+aUH2ceSAf3TxXSRREBTRgcu7
         D9FW9deUddWfilW+QslyNQehQd47MQ4fS5kyMg+k+1SkF0a3Inti9BJ76/xYxt5eArOy
         PUZP5F/PsOsbcjlbtoDMd5f1Bj04fuvIVlGIY8SqrbyPolAJytQr2Jb8us4rTshKhb/Y
         LyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403048; x=1764007848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVLSWaWwsAp3+Eeor9R4CziFFyAk8nsobOp1lA8YjmQ=;
        b=AnfPuTzrkEFdXsgAHZeELKHvwimrrSqEy3NkEGUkPH3K0vOiTTtZrkRTKmFzo0+VTp
         HYK2zdbL0WMRWTjqMoyZ9UPjuuMaC/hBywoEhbdyUG1+A9gMDifXtzsB0f0DPfO+MI0p
         m/pFka85h2rMSI+NlskZMEv0K1cRBMWELU4XJVh9MU1+YA/RIxjUK/lx2pAW4LRrFc4l
         JNa0Al1b5mlqSa9vFrE5HgO3f5EW//RsRY/IZW9QMDEssmQxvVBGhLVgNFCkU4Qc2xNX
         fZrW/tVUgpOH454/WLWeuawUOMHgpwKAyyalwSYPuofYREa0hCQVCu4hP17VwLyLfKON
         9RmQ==
X-Forwarded-Encrypted: i=1; AJvYcCULOyCPsI3NIWol3Xj6dPOLxP4LnpgIVrBrnQb6v5cehyNEkbSn+albVtsxvprLziDUTvHFl6JNFS1WMZV4ixoa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3KcKFwPWFqR1eCg5Fo+Fn7K50gD6NnTDlA3BgEDgd1ll7514C
	nG89EoqorNiIHfqGwzbEokvw9edRwrGR6MaqDCe34NPSNU8nQ+YoXPlI
X-Gm-Gg: ASbGncv4Rq8O6FCj5GHNiM1jYZDXFulBKYfotX4wvoXhUZhyLapy/zMlJfaLeGp+pj9
	im2e3OOkZjyZw2BHWMNTKjAf3L7jlEADYdoj5/XK+oxRowcXAUgSCIoI3v2wTnhcVUTDJBZDg9Q
	ERjgdRzLjphEgQL/HMSzHmtwb73ZHrjSsiHzwyklyiSffU8+3tBdo6SHfZIKJsXH7AnKhB69xD5
	1Orj8ZWYQuYbPahpN+R7Tt5mi5CF121CPFcwu7cV/82CnUvwA3gpf2QHVnmJFJq/bbl/91KOL7D
	2CkeJJXzz/BCXhpuAeQXbKdXl+y18/F8MnEf3m5e6PYp3K4msa4jx4Dm6as/OoA+b6FPV4ee/nN
	UVy6CEgN6gRb6DFYDjdVZP0DOOOuXnJO0C4rs8DsG6VK6X6o7yE3H2HdONdB2JdtMzoKh81K9Ad
	V5kc1VVaFzNk1ruo9z2xI=
X-Google-Smtp-Source: AGHT+IFUr6w+luRVnOQpM4WmiMJo7zQ/XIZfnSsFQLDG58hBrdFqWOCIG0FqA/4JweD+fOt7hbYKag==
X-Received: by 2002:a17:903:120a:b0:298:45e5:54a4 with SMTP id d9443c01a7336-299f54f8517mr2495885ad.1.1763403048271;
        Mon, 17 Nov 2025 10:10:48 -0800 (PST)
Received: from rockpi-5b ([45.112.0.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm147237955ad.32.2025.11.17.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:10:47 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci@vger.kernel.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-rockchip@lists.infradead.org (open list:PCIE DRIVER FOR ROCKCHIP),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 3/5] PCI: rockchip: Fix Slot Capability Register offset for slot power limit
Date: Mon, 17 Nov 2025 23:40:11 +0530
Message-ID: <20251117181023.482138-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117181023.482138-1-linux.amoon@gmail.com>
References: <20251117181023.482138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_101048_941245_8CE18A04 
X-CRM114-Status: GOOD (  15.04  )
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

As per 17.6.6.1.32 Slot Capability Register (PCIE_RC_CONFIG_SR) reside
at offset 0xd4 within the Root Complex (RC) configuration space, not at
the offset of the PCI Express Capability List (0xc0). Following changes
corrects the register offset to use PCIE_RC_CONFIG_SR (0xd4) to configure
Slot Power Limit value.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++--
 drivers/pci/controller/pcie-rockchip.h      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index d51780f4a254..d77403bbb81d 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -271,10 +271,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 		power = power / 10;
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_SR + PCI_EXP_DEVCAP);
 	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
 	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_SR + PCI_EXP_DEVCAP);
 }
 
 /**
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index c0ec6c32ea16..4ba07ff3a3cf 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -159,6 +159,7 @@
 #define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
 #define PCIE_RC_CONFIG_DC		(PCIE_RC_CONFIG_BASE + 0xc8)
 #define PCIE_RC_CONFIG_LC		(PCIE_RC_CONFIG_BASE + 0xd0)
+#define PCIE_RC_CONFIG_SR		(PCIE_RC_CONFIG_BASE + 0xd4)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
 #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
-- 
2.50.1


