Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D21D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cdSnVQfa;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dJFL0Zy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3lBDfIe7IPx+fVGzM7Ta3HhcKvhZuUi7zb60B5W+JI=; b=cdSnVQfa3e/g/109cbbEAKBtrP
	hgf8y2ed6xzdqSpu5UeqjOjpznnqFqt5w4N/3ptH6++dbiafu16FvUhg1aU/kf+3c766sxoqt/vFH
	CcgA1fILFNMgzD22QOai0YbW2Cr5sjmkGSzDs+QEy+zRM5CUQd34ZvQNFU1ycHLqN7NpgDim6CkI/
	rCoDnntEeqqbeT90IUtRFA/cxS+gxG5VCRFLo9bzGXjtS3y8lBw5mQ1N33OOpqPub+lGOQmrQg4ph
	cbMnHQSCkHnhE5VKTi7DsqprVcXQcrgXsWh5kTBDeZAn2DyM/y4qsGGdQTbO8waREXJxDcIbqvdjs
	tvsQU0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD4s-0000000AGH2-1v5i;
	Tue, 20 Oct 2026 16:52:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD4p-0000000AGE8-3e6z;
	Tue, 20 Oct 2026 16:52:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57502C5CD67;
	Tue, 20 Oct 2026 16:53:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCCAF60393;
	Tue, 20 Oct 2026 16:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD03E10328D3B;
	Tue, 20 Oct 2026 18:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V3lBDfIe7IPx+fVGzM7Ta3HhcKvhZuUi7zb60B5W+JI=;
	b=dJFL0Zy8azXfiqvY/WRgiT8WQotmB1KAuidILhoUdNPBv769NTqgbNd19lLAIGUdWLwVhp
	rTXLpvD2CPSoGBjTtriooq24ujx0+Bkz3SJooa0HMOZ51JBjDId0aglWz5oVSoUqi6lfhK
	3kFFcSD4NlTFi6lTrMjCozeRdgFCvnpwtPrdCy/mO2Y7dqTLWMMpTe7zqf7lKqfU2VFG6w
	xqsDEir8UAL1ceWpFFI7P2sHoK9gJzEVeGuZ2ORgFK37/NvKZcYgHJbE0jOrRD2IM7zipa
	CFC4WxxGm8Fef/yONhmlerfvxl9w9AKMQyrOr/yWbqn0QEF6Tb0/x1dv1C6lYQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 05/14] drm/bridge: it6505: complete poweroff even if
 disabling regulators fails
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <94daa219c80275afc8d2dd85df72c602f0d3e646.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <94daa219c80275afc8d2dd85df72c602f0d3e646.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509977.78870.1985601064843306523.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095240_089222_E1A510AD 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 28 Sep 2026 00:50:10 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> it6505_poweroff() returns early when regulator_disable() fails,
> leaving it6505->powered set with the IRQ already disabled. The next
> it6505_poweron() then takes its early return and never re-enables the
> IRQ, leaving the bridge deaf to hotplug and link training interrupts.
> The regulator core keeps the consumer's enable count on a failed
> disable either way, so bailing out only adds a wedged bridge on top of
> the leaked reference. Log the error and complete the power-off state
> transition instead.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


