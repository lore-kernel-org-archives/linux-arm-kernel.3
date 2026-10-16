Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A0CCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlHkJSy/ba8HvsmnfL4B23mq4zTFKgnNgEDVV0rE7SQ=; b=cQJNUhzPS/InqvCnK390IM/cI1
	MFIGRZKmKj6qIKNOkDODDy+wYawluZi7T/6V89Gh8ykjPBAqFrfj42ijnEEGKajt/g8dvwyQZ0yca
	O1VWNeY4iftxl2o321aoV73/9Gf/Y0GWLqqU9YitjKixS+GO+y3dtx6FpL0pXYR7gVOSMDxiE4ayn
	bbxOF2dAMqXnC0NU9nK/ayASVfUihX7K9dl8umz/PmbkQd2gW19En/YGNANZm9HEdPyPp36bzbGu6
	MWxfzCVet32qNQ7mHUYI8rpZl6qYxtpZ6Vq+/IJaskemjBoQb6XUdBtZW8s2SRWfUHgmavIyJpWw2
	lMlO+w9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbo0-00000002AnD-43wi;
	Fri, 16 Oct 2026 06:52:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbo0-00000002Amf-12od;
	Fri, 16 Oct 2026 06:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WlHkJSy/ba8HvsmnfL4B23mq4zTFKgnNgEDVV0rE7SQ=; b=YEyFg7L5nVdsSIERyHWmddYuoH
	gF1jlFivWYDgathYV0uhWiOh7322GofKyGO9nA7yhahE7MZGUHKv4m5xk1lRfD8Azo3RalKAyZpPc
	lCJBOiju2tiA+zXN98p5S7lQsKYzNUdcRN6gdaja1Oc5BxgTUa3JiQ6avQUaEGjRFc5zkBqnhNj1t
	qUxwV0wggAXeAaFipLluGMKlq2oTlyHZErWZ7N19JZ8o2Yqp0YYVfXBdyyx4bKfJB9Ik13+fgqv8G
	UVQabmlIKNwVo+uHxaayCGxk2+0sHM1tA9BRHP7kkLKALSz89+F2g53RqctkTO9x6w1jAWTJNA7dd
	EQFNWAMw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHbnq-00000001BJf-3yYJ;
	Fri, 16 Oct 2026 06:52:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 35FFDC6220F;
	Fri, 16 Oct 2026 06:53:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FC8E6075D;
	Fri, 16 Oct 2026 06:52:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A223710328C6D;
	Fri, 16 Oct 2026 08:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792133545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WlHkJSy/ba8HvsmnfL4B23mq4zTFKgnNgEDVV0rE7SQ=;
	b=MmHOg1dxGfArn2jR4L+4z8N69tqpP0MmBy4sJp2si7LmksA8mvQGFkkq7FnBXFMzwVNRfY
	61RAPOkOfKFPSN8kXzWbAFLaK8DSItnbpMvT2nYKPNBaA9In3XZ1MJa1xiTGKZOwsmnpTo
	RwG5fjDdQ41hdpSJ26d7UxkYhqpeCT0+6r9bq0WNajqFtq3xZuQ2t+D0Jy3TLIOvNztrqk
	WOOLef/mwNkpOT0OIT/iQCYdxkWGEhAZivYtWilhTFOxrBXbvAhyFzeBiZ7KpeBQLppTrc
	vX0CU1whmU+hccR/PLhek5yNVtm0R4FAC9chMmopkn24+iGIXocbkvMbH/BuZQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
Subject: Re: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and
 cleanup
Message-Id: <179213353665.3058528.14437637653539699061.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:52:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_075231_343943_DA9CF636 
X-CRM114-Status: UNSURE (   6.83  )
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


On Thu, 01 Oct 2026 11:25:10 +0300, Cristian Ciocaltea wrote:
> Bridge drivers are expected to allocate their private data via
> devm_drm_bridge_alloc(), which also initializes the embedded struct
> drm_bridge, including its funcs pointer.  Most drivers were converted by
> commit 9c399719cfb9 ("drm: convert many bridge drivers from
> devm_kzalloc() to devm_drm_bridge_alloc() API"), but a couple of
> leftovers remain.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: rk3066_hdmi: Convert to devm_drm_bridge_alloc() API
      commit: 5c0cdbee4fa4a621f871d6dc825e759db08a1a4a
[2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge funcs assignment
      commit: 382c1e8ba409d1611cd256dccebdfa828c832bb1

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



