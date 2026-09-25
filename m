Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3500C98306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6smwopks2PJXygtKAHcL+6mCESGQpHs+ktHru5C6inI=; b=Xouqq5E58qi2pkXanvbB2myxGk
	axfTVmgmJTQVVsyYMfnYGmD3H9P4v00WWVRuQIdIiQdo9IPbLCZ2Vgi5L/QEDOLz9a4f9f48MVXbt
	rEeWjKNEK2Xhiw4ovHxSI6WEl+n8tEQEOG2p1FX1ZIewrctgzua4yGP/Q/PWFRDEFoFoT8/C7a6do
	a3XfLU9VmhlrjPatThoKQNRAHt4X1d1xxO8c0ssw7xAHwO54UujVZtNfEfVsaR5dfvmjbJEbgVEQP
	qIRmQCrynWLeKHhdWQuyh4yILaw0FJI2frEgwW3p3nbfjjEGm5NVmVOtiA30StAEXvPAFFtrgp7iI
	J5pU+dBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xO1-0000000CbTu-1eO1;
	Fri, 25 Sep 2026 04:18:13 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xNy-0000000CbT9-0hdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:18:11 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so113018a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790309889; x=1790914689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6smwopks2PJXygtKAHcL+6mCESGQpHs+ktHru5C6inI=;
        b=WjnAFsKz0WH85/he1IxmCpIilmvxoOfW5NASQ10e7dmDMm/X13D74i3nqxcjad35o/
         4u9JhZSnOiSPsdn9dpNdPO14o03nFop7A1CSh/ZLbHwtQ/CNBwY2+0sqNH6eH+WxwiIt
         9Tcd2haFHB4SRlejRQfR4vatHNSrwiTXoyDXXHItNdkuBVXar9cjETisWafrj4PF2y2w
         K407dL9GWy/1CphKNPyZKEAObGoX1HbpoJXC/2PVExRm9Ca6ZwuQAeY6lnBfVDN+RPIE
         WwXOtCrnSqchWMJ/V984LmSeMaPnKJ9Ug6NE3RgT/m9z9HMFLFAeBeo0kfFEspG0Weuo
         /E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790309889; x=1790914689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6smwopks2PJXygtKAHcL+6mCESGQpHs+ktHru5C6inI=;
        b=H3UCmzUfOpB5Gw8mkFz73atBHKKnySrgEHVqkreFf8cn9yUCW5miVm2J+JfvUwaM75
         O6LiuwHaf31R/VKp1dT8kj5bioqkTkTOCGTIwweqyXCQF3sNRA6LYwQ0yLxR+xHd63hp
         0+HfvfDK9ZI43dC+9dvOQIbGgluLKRw8rD25cib0DrG6a8vL7QnZcXVcY7rA54jrh27M
         dWjkDYrbHNXTRneB+2vjElbP+BDQM5vasbp84RD85yWDkjDY2FP1NwmBBwl4cZO9OLt+
         Est6JjeiBKQeJAfUn6Rd4VVjfZrxTkS3qb/RmR3tpvzZd0vnDCZtMJWSZp/zmMi21610
         jHbg==
X-Forwarded-Encrypted: i=1; AKwUvBw3G22UyYztJskLm/J3r4NMj0GeH1F3fqEJq2Zey3/2ddx5ltmExL0OM/cI5wPjX4NclR3BRMNlbBuVMmQ3vYAP@lists.infradead.org
X-Gm-Message-State: AFuF++kRGfjyYrztWW4clOSB3MQEvxy4vwV8WTkthpNELkxdbJL9Evjd
	n9IeahgUh9jwCVjVcz5wfqub9pYJXua3IH7COFkF8jL2BRTGYdsrcojA
X-Gm-Gg: AYBFou2O8HG4g/9Xs9Ye+0FMAQTarjvaPGIuq86l2vZkx0GJV0f23F+mNbslWOjlFC9
	oj4eTAOxhU2X4NAI3GKQq8ZjJ3MpsxtmCJNVfH+oO0vElBPjx31hUiA0rwwY0YYGcbCgBWlaPqj
	hKUoIyMdSq21XnFS3S79VjZGh6mDolnt2Ak1vgj465CC1x/FjNEZW3mKF0Jz5al1hT0EySYamfj
	qp5mds+K4UMt8ywpsByQcdhnBQ+DpuJxagCnG8pDxNb46ltDDekwnblLtAVkDsenp58v9hxajpP
	rPE5QNOfYvXnR5jnWZx/zQAkHRJhUxwW4ZL29ipYNmNUdDNCn0/U3ItSUTpC+A87wuiREyAwFMN
	XjtZVGkbgCziwyRgY+z7wRBk/DJ5psvAyRE3isRVfPugbQzueQt44p+QzlDXEb+fveB6jYW78Ii
	hZVbxCQ2UqcVxC43uE8+0I6nf8nBGANH4vFiAYO2BXTkNZZfIkYI5tHKM7ZKYmYJ0T7FGY
X-Received: by 2002:a17:90b:4ad0:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-3a0985b949fmr4116287a91.17.1790309889066;
        Thu, 24 Sep 2026 21:18:09 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b4983f43sm852262a91.0.2026.09.24.21.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:18:08 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH] pmdomain: rockchip: mark PD_PIPE as active wakeup on RK3568
Date: Fri, 25 Sep 2026 12:17:51 +0800
Message-ID: <20260925041751.495818-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_211810_236513_A873C8FA 
X-CRM114-Status: GOOD (  14.51  )
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

The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
controllers and the SATA controllers.  All of them can act as
wakeup sources for the system:

  - the XPCS for MAC WoL, through the SGMII link
  - the PCIe controllers for PME#
  - the SATA controllers for hotplug wake

The domain is registered with active_wakeup = false, so genpd powers
it down during system suspend even when a consumer is on the wakeup
path.  That kills the XPCS and the SerDes, which breaks MAC WoL on
RK3568 SGMII boards, and it also powers down the PCIe and SATA
controllers while their drivers still expect the link to be alive.

Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
of its consumers.  Consumers that call device_set_wakeup_path() keep
the domain powered; consumers that do not mark themselves as wakeup
sources are unaffected and the domain is still powered down when
nothing needs it.

Several other Rockchip SoCs already mark their PCIe and USB power
domains as active wakeup, for example RK3588's pcie and usb domains
and RK3576's usb domain.  PD_PIPE hosts the same kind of
wakeup-capable controllers on RK3568, so this follows the same
pattern.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index ba66ae719428..16ef0a235f0f 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -1296,7 +1296,7 @@ static const struct rockchip_domain_info rk3568_pm_domains[] = {
 	[RK3568_PD_VPU]		= DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false, false),
 	[RK3568_PD_RKVDEC]	= DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false, false),
 	[RK3568_PD_RKVENC]	= DOMAIN_RK3568("venc", BIT(3), BIT(7),  false, false),
-	[RK3568_PD_PIPE]	= DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, false),
+	[RK3568_PD_PIPE]	= DOMAIN_RK3568("pipe", BIT(8), BIT(11), true, false),
 };
 
 static const struct rockchip_domain_info rk3576_pm_domains[] = {
-- 
2.47.3


