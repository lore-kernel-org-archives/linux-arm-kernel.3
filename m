Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72142D4922D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgxpVSt066TUyJCGi3OmDYi9BAgnnOl/eGNX0JHnjDw=; b=zIbtin74MwEyGKafgUhY6x/Faw
	XXCZXsAkNcx/O/oQGnuxvmfONDA9FUoVsWgSNWWITKCgiX52bjgFIwaPNYAYVjDjnxzCFn/OL8DMq
	7J2qDCLaReD14IhuKj2pyCnUYSh6+giSjPq3o0UgPznXvQEFHev9hwXzAjZd3JZirTrx5W0b5L5Nb
	l/+VPwy2Zb3U2oARDF92uYGNqkHm/MdOuv92Y6e3P8Pspj1/JGmTkStRkP3M7Eku+79KHiNCGT8pk
	fVY6GluUWCY0OnSoo+qzoVuB0lCEqLrdEELvQloYmDDbmCMrJ/aKRqlmImqkTkmc/kJ6Mj84aB19u
	Xdno9HCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4gm-00000000eDl-19vd;
	Fri, 12 Dec 2025 15:04:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4gi-00000000eC5-1EKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765551845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rgxpVSt066TUyJCGi3OmDYi9BAgnnOl/eGNX0JHnjDw=;
	b=JyT7KsnVgIWWE8aP2OWeZ1h/C4awlSp9CBnBeP0lm2OuMKSf1XXG2MUPfUtEVukwCMylmO
	443QFCL/Ry2ivhot3UONrT+II6+5u2X8C+PKVY8LMaYwzp2P/2Inqce8SCyVfgMvBj8UCf
	bDek1/vgkKEpTQKHw8wGQd3t4VKXbQk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-CsVrziF2OPaKAH5Sl51Syw-1; Fri, 12 Dec 2025 10:04:04 -0500
X-MC-Unique: CsVrziF2OPaKAH5Sl51Syw-1
X-Mimecast-MFC-AGG-ID: CsVrziF2OPaKAH5Sl51Syw_1765551843
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso2120964b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765551843; x=1766156643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgxpVSt066TUyJCGi3OmDYi9BAgnnOl/eGNX0JHnjDw=;
        b=GSuQHxlY3tmCxxYjELbXbDX/qmXXdtSL+rIiFjHeZDz6c23LWZuL+WvW/z3Xj5MF+n
         mtPFNKkBPUTLu95Pc25RtZIsAkmgzrUuw3PD44VrWotFt39jta7G5mQghDLoeKceK59W
         mKSyKmmZpC4i8Dth8DV3tfDlZZYtmDhzXoS1s/sriAgKvEvzChlr8hY+Yj3h3Qmyt3V+
         qeTwArsaoMhQZwtpY505HxRVOEgKH6xMER/x9HFmGwZnQrDxGK/74PvzhWE4HSCkAlTZ
         txGFmRokPxNA36N9JmDiSBUXxJQsoO19dg98Uq/E8/WfEUu/9AHvBH6kMnCHTlPjdqgO
         VE7g==
X-Forwarded-Encrypted: i=1; AJvYcCV3+Wdw6kjbmjaH23ZYdMNRU0beWmVvUZVwSMz3os5MW4Zv7qCBNb5LbLstSRgobtAIwyO8Bsz48894OyqxrrFd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw84HTfOxIE/ibw41QuFwk0CAyqHGTH/Q8JoY/AgSlU+SycXARE
	bModY3F1H8eK8b5+3ygfpUzQPduEQlCN6mdVOmSgzRvWkDQvVPdpwJLxOua2CUvTpaljLdUaayI
	m++C0BeD3BLf6gJ/6cjJ8yPScQeWo2B0w/J6CMpWLP27GT87TrMwTd5kX+4SccEaXW6+eILYQrZ
	6Z
X-Gm-Gg: AY/fxX6CSc14G7Tpv0AGnhtK+IZeeePHvvWfKwdYLkBvwxeYE0dHnCL0qMZeP4+XLpE
	Rvqf19yfxngOxKG2ukABrNcjtaJEj8qHu5PVpuwDFFZaw3MfOITbSdYyrwlcbrWW8qgrMP0WjQp
	cTmZdTaByGYIkSpigezP0l8G3GY3ZiCNtwA31Fjzk3KFuu+wOXBzRfzc+pX0pPq519lsyqyRmal
	GbjiwpTz6kKUps2dw5FiWjabgiQGSum02ayvz2lT1ugtYNLXUWU95aUZjqQLA34nQM4h50EMB56
	IZip36QWkwySrLxHpxabuqcgkm0UHpRkPQT+dSGrTJmYIjwbvpLe2PScRICazImE5bQlEpxAFdO
	M0WLmb2PEEk5kArllFH6M36ug2aOWmj65T8xwhvBBnA==
X-Received: by 2002:a05:7022:ed02:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-11f34c4ce6dmr1085514c88.28.1765551842649;
        Fri, 12 Dec 2025 07:04:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb1zyrPRFVrIwsGWsg/+MOeas9yeMDNDfquzoK4AyHa02WZnuzqW3kokEIkkaJiXX2KbIydA==
X-Received: by 2002:a05:7022:ed02:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-11f34c4ce6dmr1085495c88.28.1765551841915;
        Fri, 12 Dec 2025 07:04:01 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm1113616c88.7.2025.12.12.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:04:01 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Date: Fri, 12 Dec 2025 07:03:17 -0800
Subject: [PATCH] mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency to
 Kconfig
MIME-Version: 1.0
Message-Id: <20251212-s32g-sdhci-kconfig-v1-1-8e278c8d7f78@redhat.com>
X-B4-Tracking: v=1; b=H4sIALQuPGkC/x3MTQqAIBBA4avErBtIy/6uEi3KRhsCCwcikO6et
 PwW7yUQikwCY5Eg0s3CZ8hQZQF2X4In5C0bdKWN0kqh1NqjbLtlPOwZHHs0vVnboRpctzaQwyu
 S4+efTvP7fgsuFhhkAAAA
X-Change-ID: 20251211-s32g-sdhci-kconfig-585b6909f7b4
To: Ulf Hansson <ulf.hansson@linaro.org>, Haibo Chen <haibo.chen@nxp.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765551836; l=1453;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=fZAcqRD50Wi9zC/Droas8GpHjMnmrcAYigk011caHOo=;
 b=gwmpJ5jaWiW+bNeO8y1ltBZKRvbuoEtgP5r39xeccaPH9fbkH2Wq76atnFsPgELe37jtmkqLJ
 7aWyvSXJ9R0C3SBL3godhPcGZcJ3watT7QPUteYodMwfmQvQaOLRTIQ
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HzRKwRaxZFD1qGT4q0M08o7bqABUtuRHlDmi2K5ZkTQ_1765551843
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_070408_651791_742C923C 
X-CRM114-Status: GOOD (  12.76  )
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

MMC_SDHCI_ESDHC_IMX requires ARCH_MXC despite also being used on
ARCH_S32, which results in unmet dependencies when compiling strictly
for ARCH_S32. Resolve this by adding ARCH_S32 as an alternative to
ARCH_MXC in the driver's dependencies.

Fixes: 5c4f00627c9a ("mmc: sdhci-esdhc-imx: add NXP S32G2 support")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/mmc/host/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 10d0ef58ef493102d3586d7a31d755543297999a..c94ae4794545de1c818ad50be7f91331862b6acf 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -315,14 +315,14 @@ config MMC_SDHCI_ESDHC_MCF
 
 config MMC_SDHCI_ESDHC_IMX
 	tristate "SDHCI support for the Freescale eSDHC/uSDHC i.MX controller"
-	depends on ARCH_MXC || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	depends on OF
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
 	help
 	  This selects the Freescale eSDHC/uSDHC controller support
-	  found on i.MX25, i.MX35 i.MX5x and i.MX6x.
+	  found on i.MX25, i.MX35, i.MX5x, i.MX6x, and S32G.
 
 	  If you have a controller with this interface, say Y or M here.
 

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251211-s32g-sdhci-kconfig-585b6909f7b4

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>


