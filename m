Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467F1CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SamjpVdgQYl7CQ+dyd24kWWXqJfurKa3W3nweeuzGDk=; b=wyKZasXT3H+HJVb90TfakStI4y
	aVBahvBrRYLTM0jzglVgGW0Zv4z9TmrvBfcp5F9ulkWZLV1Q9YofeP4J9mL0tN5oCgh09qEukuLRM
	9w34Eu1EMi1jd6QSMReMpZljZT3A5ohMqzw6t0t659GxhwRdRHeXWLoVBftBzICEkrco7izyJ3dXo
	iCCS6eaSk4Q5BxD1UdGN/ZrhLanyKaM3QcspPLs2ZxPTZ1pnkX4zX2ZP08jzpE4uAVw6q6zu/q3Mq
	qAbawcZ4S21d2eSWnJfNmtzEIneVheIXrZhNlFkmf7yATKTS5nSl30W+8UXSrcT4jK05AWPpLaZ+2
	Tr65Wcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHyM-0000000GhuH-1Vvi;
	Tue, 05 May 2026 15:46:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHyJ-0000000Ghsp-0L0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:46:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 333FF1A3525;
	Tue,  5 May 2026 15:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3B666053C;
	Tue,  5 May 2026 15:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7AE911AD0217;
	Tue,  5 May 2026 17:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777995963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SamjpVdgQYl7CQ+dyd24kWWXqJfurKa3W3nweeuzGDk=;
	b=WSRaFgs5iK8VmLp/1TOvE3ewfpUqT3X59uEVMDTCZnkS8AdhVcZXfDx4JiX7O5G0E9A0WH
	yqsqFRrz6ZWcnQAYk3T/rbnMwAt8AmXcatINdi0JausY2SxTNKzzG1zVApqGeAt8RQvxa0
	OMnWoE7vtCPXiXi4MBO+0c2I37RgNBCfzXEOSUKKLT5fzaeWrFEPCPLHLek5A95gH5U+3L
	flt5zhgMzlsw/Rv3WGfZC9iSu3bAKhzNUHgILI57aK8hOK8Sx6zDkSGjWS1TusFazUIK6h
	+HlsoJtOj6ZYSgGmGoFuX2LlVfX8KiEgnnqt5fxzPGl8XAUUsoke1MBsevXydg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260505082145.603262-1-lgs201920130244@gmail.com>
References: <20260505082145.603262-1-lgs201920130244@gmail.com>
Date: Tue, 05 May 2026 17:45:52 +0200
Message-Id: <177799595269.1278867.7014321900391904487.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084607_256937_6C6D3896 
X-CRM114-Status: UNSURE (   4.38  )
X-CRM114-Notice: Please train this message.
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

On Tue, 05 May 2026 16:21:45 +0800, Guangshuo Li <lgs201920130244@gmail.com> wrote:
> drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

