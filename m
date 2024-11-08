Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B461D5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuPtIml5wHuWo9YnYzUt6yEz+G9J8XSUCMyiea4JHFQ=; b=HTd4/Q7vK8SMrUWPaT2LuhEFxI
	A19/MfULn/n+PCKM+KA6wrVPuWoRh254Z6/ml4GFWOljDUoXsT2rYbfO5m2jDMpd6Inlk1kGlxjVo
	w20wnjKU9t7GZ3bdhLsU3ifZCVVQXA9UdtjLICqYdFkprfopkqq5QgzlsdfJytvLLoQRPSzqDQrl0
	Rdr4RWuUOtHXlg+MbUOH7kyLitglWSCuOehLxVRKu/YzsyO1mXZCz+K8x+sA/4UwSdLkDIFLykwNT
	3fsVe0e9Klz0BsW3OcU8iqqRtF/SUs7t/0retlL8m5d3kqdWrpy6MFbG0pt4m9aaGD4Agrlbx9Qux
	UTP+PnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QJ0-0000000AuPB-1N7t;
	Fri, 08 Nov 2024 14:49:46 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PR8-0000000Alcz-020K;
	Fri, 08 Nov 2024 13:54:08 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731074043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuPtIml5wHuWo9YnYzUt6yEz+G9J8XSUCMyiea4JHFQ=;
	b=E1NppOfdtjNHmWn3BSZdNiwXNrn2ZORyh+K6PJpNwqt1Q1g2OsvBkXF3mmqg03vq0I663L
	pfRy9AzYmuKLIYmGcWMtYGAhS/onSQsEwoozQYaUs+lGce7JHPQ+XGEMrki1xfyJTa8sD9
	Adb4jHONBc3/aa8IOpS+ky15AHiuoZF/dWkInNEyPZp3XwX458lFyutgWgub/0faxCciiF
	Gebwlh+rJA6pdFCcStUGeBFNLnixRDiizHD+G0zAKqte0GMppPjKFlLQ445RARS5wOcm5p
	CqLJYZKB9JjOD783nKdZupfeVATRNROze6YWBml2LOCfCbsuNZrsSprS6iZDqQ==
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 2/2] drm/rockchip: dsi: Don't log errors on deferred dphy
Date: Fri,  8 Nov 2024 14:53:58 +0100
Message-Id: <559094275c3e41cae7c89e904341f89a1240a51a.1731073565.git.dsimic@manjaro.org>
In-Reply-To: <cover.1731073565.git.dsimic@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055406_226171_1F3E9B13 
X-CRM114-Status: GOOD (  13.42  )
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

Deferred driver probing shouldn't result in errors or warnings being logged,
because their presence in the kernel log provides no value and may actually
cause false impression that some issues exist.  Thus, let's no longer produce
error messages when getting the dphy results in deferred probing.

This prevents misleading error messages like the following one, which was
observed on a Pine64 PineTab2, from appearing in the kernel log.  To make
matters worse, the following error message was observed appearing multiple
times in the kernel log of a single PineTab2 boot:

  dw-mipi-dsi-rockchip fe060000.dsi: [drm:dw_mipi_dsi_rockchip_probe \
  [rockchipdrm]] *ERROR* failed to get mipi dphy: -517

At the same time, make the adjusted logged message a bit more consistent with
the other logged messages by capitalizing its first word.

Reported-by: Diederik de Haas <didi.debian@cknow.org>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index f451e70efbdd..ffa7f2bc640d 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1387,7 +1387,8 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	dsi->phy = devm_phy_optional_get(dev, "dphy");
 	if (IS_ERR(dsi->phy)) {
 		ret = PTR_ERR(dsi->phy);
-		DRM_DEV_ERROR(dev, "failed to get mipi dphy: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "Failed to get mipi dphy: %d\n", ret);
 		return ret;
 	}
 

