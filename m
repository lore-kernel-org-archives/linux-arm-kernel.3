Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD39C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=su+KvBhgSlwSz8Qo8A5gRsBfuCg0rvVY9PlXRCR9Fas=; b=xJmJVDSb3E8rzdo2Z2dku/zjJs
	kh5WX32O9bxGIUo2wVzfOqajm043Lk8wtZk/jDyms8prSPxFr8fSfZZTxSYzqW+ZQg8AzskA/ALpJ
	hf8yGuzWZ+ZS0I+baY+k5eqrTdm/0eaSMelQcTWa7CUiaNy9oxxaxWYf8PMepsX4L6PzR2RpCGQrp
	rQNAOlzFT/8UbyzFOoy6qZ50sTSd1jJtT4dhNAeTaZDuI1jCY6KarEYtrbUihNVg32q4K6NZpfK8o
	jKR0fpxAhMolsxinP9ttijsowDI13Del2smF899N3rtlSb9hgO8lqqXSk/j4tpjlIK61CCtc2huCm
	/qGGfu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLLf-0000000E9t0-2sYQ;
	Thu, 19 Jun 2025 19:54:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKo2-0000000E4iq-17m6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=su+KvBhgSlwSz8Qo8A5gRsBfuCg0rvVY9PlXRCR9Fas=; b=BJCJXPlqX/CvuG9JVLtzzhnsHP
	xwcSLpGG5pZSHDoDgKGzUEenaERSWBkFJG403Tl2yxvjifQwTkLPhOv14y/Si4BHlxPuqmTcO4Yue
	mcGnSEtA0do5wahQ1uZXQH3vTD5aTgr5JZxvZyfg19SOKa0UnLUarBDve63ZUk1tUnXXdcndNBtDw
	eJlXeMsCziVW/fmHsFpt6Ty0LXDlFndo+glV5Qkul2zzDbwVwBqxE2e64sGNFFoIrHwA/CTWInyJ3
	qiEbfwgaIk2KY8Y9nALf5TwD7jm2kdkUrUOc7MLKpSuZNXLDTl/r+SqmejflSD7q3bwHAzFlPHpPo
	J5POHXCw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKny-00000004YhM-1F7b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=su+KvBhgSlwSz8Qo8A5gRsBfuCg0rvVY9PlXRCR9Fas=;
	b=KHUeytb3+aDr7e971HNaKbNc/GjlXRFj7eP+kV5riORB6xPtWyiolS1ZBSiqkSTmNqxrLI
	5V/MkP+i3R14oe8Zk1JlrxHISo4MGwT+6lXc8K9scWFqZywphf8jMiVNlYsNH+aQeF1i13
	iofRBgKCWJqqFpEecBOh15Af9iigwek=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=su+KvBhgSlwSz8Qo8A5gRsBfuCg0rvVY9PlXRCR9Fas=;
	b=KHUeytb3+aDr7e971HNaKbNc/GjlXRFj7eP+kV5riORB6xPtWyiolS1ZBSiqkSTmNqxrLI
	5V/MkP+i3R14oe8Zk1JlrxHISo4MGwT+6lXc8K9scWFqZywphf8jMiVNlYsNH+aQeF1i13
	iofRBgKCWJqqFpEecBOh15Af9iigwek=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-BrdIiTfMN9aBDxa_eKupnA-1; Thu,
 19 Jun 2025 15:20:06 -0400
X-MC-Unique: BrdIiTfMN9aBDxa_eKupnA-1
X-Mimecast-MFC-AGG-ID: BrdIiTfMN9aBDxa_eKupnA_1750360802
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C9CA18002E4;
	Thu, 19 Jun 2025 19:20:02 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E64CC19560A3;
	Thu, 19 Jun 2025 19:19:52 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:16:08 -0500
Subject: [PATCH v2 16/16] drm/tegra: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-16-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=771;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=OUGP+9Bc5zn706e0s5SjFMKump4OS0LBSwQrlzy2aP8=;
 b=avJnxiZEciA9G70sV2NKBkfKbz54xRs+P5jyouBdV0SNcLqS3cJKy0hqVYnVWDGJW/jjQRzUq
 NDWEDyAhk60CpeImtnfvwtzvcfADtJkVdF/qIT7anuYZnwLT3jZTlf5
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_202010_869354_F538BB06 
X-CRM114-Status: GOOD (  11.16  )
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

Put the panel reference back when driver is no
longer using it.

Patch added in v2.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/tegra/dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index b5089b7722676cfaee5d28216af4ae706a47f895..830e90178302a76e7c091c92b66ce385ad26207e 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1523,6 +1523,7 @@ static int tegra_dsi_host_detach(struct mipi_dsi_host *host,
 
 	if (output->panel && &device->dev == output->panel->dev) {
 		output->panel = NULL;
+		drm_panel_put(output->panel);
 
 		if (output->connector.dev)
 			drm_helper_hpd_irq_event(output->connector.dev);

-- 
2.48.1


