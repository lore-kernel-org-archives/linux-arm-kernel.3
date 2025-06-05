Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C952BC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 03:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9BkRZbsm8aRk3aSpv0SfOyGwsJsIoOb67KS8j+iekY=; b=RCNecB3fAVF0VDcJLg06JRaQ0H
	khTyuagvAqOj2/aphtKQHLUhZ5T5SzHRLwsa1GFESptF+ekCTy1fd3I9/5HRwYw8uMlNhAN8BlHdQ
	yWNtp1D7tnOWJWepmRmsWCPTK9OvqrMgGXG7RYFN/UioTxkzbW0h4tYzEccUeNfnbOqHhTHKdnd/7
	o806I/yu790VRhPOSN+Vnghr4LPhXMcsPN7Iaulzmw/fll205DuaGAV3RI5PZhpb93ylEomjvd9jS
	fGeSe5JOQUuJKrysnrxGOAMGqmFcxY6Irik9QIJZydnOa2vPQ/ceUI2z+LPAihaCtyx80rTpbS/AT
	yT8aq7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1jW-0000000EfoD-1lXo;
	Thu, 05 Jun 2025 03:57:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1ZV-0000000Eeyq-2mMV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Jun 2025 03:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=G9BkRZbsm8aRk3aSpv0SfOyGwsJsIoOb67KS8j+iekY=; b=mapO/h4QPskx7133GvadfylRDS
	oOS0CkEgmUcOrbKmJK4sDdvxdvexoHQ80S5jso1cOGuCHZi7ZCVwMwYWwErUjW2sfJlzV/JIscp3i
	jA9U1awgIelaC1OteAtj2PLJctmgnvmQi7ohD8SWlLe6xqOxDwoY1gkghsEkKlahNyp4HzJO8WJgR
	I5DldLmmqq5omn6jvM7hCjelnhCucsP50drNnWBhKeA+PN7xOGDXcrYkhGOM9V0DUwlRlDj/7RoId
	dwLhMv8MfwrJEK646Kw4seFbdW9OCfGQosoV3RkZeOSCPGIlHVSsjFVjipt4xKMjI1Zm9a0ZudeB3
	u1CcFDMw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1ZH-000000013Uj-32Qv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 03:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G9BkRZbsm8aRk3aSpv0SfOyGwsJsIoOb67KS8j+iekY=;
	b=Q+0r5H5lxuvkksjTLVC/4E9vZdKl47zmL1PwkFfEqlXcvWJEVnq78gi/7ELGJI9iIfv271
	qinJtT5i9IG00tgqH3BTTHljZ/0Es4occUY4Teka3HvQ0pqdSs6ZTKkf0dyqTYldFbTqUp
	cdUpJ8XmqAY+rP8yGNKtVcq5i1kkg+M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G9BkRZbsm8aRk3aSpv0SfOyGwsJsIoOb67KS8j+iekY=;
	b=gDVmeRbW5Xv3qmHCsavPT4xJUAYruNHcztb3RLF82b3//zFTAM86Hk9NfqHFqZDpx86lO5
	TjCzHpOWw+ZCscU/b/odFQjYiGX7jiJZyBQGU5ZruySdW4+mfzzSpWOoPRQZNFvd9yUcPW
	3xE/hGL64NQKi7dAUgUFptobOP3V7tE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-lSpiVRelPRG-Fwu687-Qdg-1; Wed,
 04 Jun 2025 23:46:50 -0400
X-MC-Unique: lSpiVRelPRG-Fwu687-Qdg-1
X-Mimecast-MFC-AGG-ID: lSpiVRelPRG-Fwu687-Qdg_1749095208
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC6811956094;
	Thu,  5 Jun 2025 03:46:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B91BE30002C0;
	Thu,  5 Jun 2025 03:46:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:13 -0500
Subject: [PATCH 4/4] drm/panel/exynos: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-4-c632e12e131d@redhat.com>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
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
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=790;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=oUAUULa8xvF5LlZB5tbq87rz3uMzHi3pU21DzZn+Vdo=;
 b=m9T9DvEk7AHTO8PjuGGuJd4n+/GgbhkJzocE3hfstzW9Lp1snMcHMfDrBcDrOYExSB1as9ZkZ
 QwCScTfjRI8C8A/wkHRdNaRhHj92TooFMlpXTThKTAStQzd5NoFTYBl
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_044712_323016_91CF7EC8 
X-CRM114-Status: GOOD (  10.88  )
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

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada34cd0d4544f14e616fe3c52dafc73..7b82ff7f2d2761a679fe3b319a73f7d1d4c87033 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -138,6 +138,7 @@ static void exynos_dpi_disable(struct drm_encoder *encoder)
 		drm_panel_disable(ctx->panel);
 		drm_panel_unprepare(ctx->panel);
 	}
+	drm_panel_put(ctx->panel);
 }
 
 static const struct drm_encoder_helper_funcs exynos_dpi_encoder_helper_funcs = {

-- 
2.48.1


