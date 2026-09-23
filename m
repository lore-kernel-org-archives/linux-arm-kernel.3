Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC97C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNJQx7eG3HyvFQ0X0+FNFvV8AFm7jVjyATRQZ7QjHTw=; b=sGD3YdcCw+SZWt6Vpuqm3GcG96
	0qg3rKvxlMCQuaD2yWacl/z3eYfpi75zZBNO0FaRfjOvsZxyWQNp9I3tVH4FeuXRYcR/lZbJQ9K5P
	EapDmFeq4vXlSgTtxuETvG5LlH9M6OHKiiO06fk/A7GWuPtbH8VDOsYeSaDG1y9MT2vyKKbQocjA+
	xOwjOzkAfzHv6taqvfgX4XxUdy97kmtZimppm6LGhXTqN1RkLW+u5awPURulhdgMyfwGrAOMulh6t
	C5oxwHrgKb/117U/bQsQ/LJYK8XAvQxdJSUynJiRFULrA7ivUANClgQ12neK//0QM6hEmDG5Jew2y
	NChRBFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jgk-00000007oyi-0o80;
	Wed, 23 Sep 2026 09:54:54 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JgN-00000007ou8-0adn;
	Wed, 23 Sep 2026 09:54:32 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hqXPG62HMzMkr7;
	Wed, 23 Sep 2026 11:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790157266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pNJQx7eG3HyvFQ0X0+FNFvV8AFm7jVjyATRQZ7QjHTw=;
	b=XvxsDhc6sDw6jWabjFnd7rqSASkwJCCSiyum0/HZmpONf/RR6qAw0RoMsDjXi++LHK59Tv
	9BpaDN5UqXUhgAF6ww8oO6sALQbqcjsH1xOCu/APUZpCtzpvmx9S6YLB28NUziOSEb6A6g
	2qw2Exsv9Q66x4Qtl18IxQ6kNp9/0QJztYuddLJZ6im/+9e2rfMgj4j3fWdyYLqYfMEnTS
	mVwgZ9L8vLDin/LbJ3YPyEXs6PPXLb15ll90PDhe2qwd9cdnRXZvfGHuTNro2Or923orFz
	7hewrAjOZO5jX7lK9NwMsmB8IavrCTgpIpF9FUVhDfimdykDuyqU89IX8p8MuQ==
Message-ID: <3b90b2c4-5acd-453b-8f9d-738370a52ddd@mailbox.org>
Date: Wed, 23 Sep 2026 11:54:17 +0200
MIME-Version: 1.0
Subject: Re: [PATCH RFC 13/25] drm: Add VRR target frame rate properties
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 wayland-devel@lists.freedesktop.org
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-13-2fcd7d011646@collabora.com>
 <588442c7-2589-4026-a8f8-e03f944318c3@mailbox.org>
Content-Language: en-CA
In-Reply-To: <588442c7-2589-4026-a8f8-e03f944318c3@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 11646ef09ad52a70421
X-MBO-RS-META: ds7zdfw7ac3mtbp1kbr9duz934e1srq6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_025431_346032_2324DCF1 
X-CRM114-Status: UNSURE (   4.40  )
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

On 9/23/26 11:51, Michel Dänzer wrote:
> 
> Either way, should these rules be enforced in drm_atomic_crtc_set_property?

Or rather in atomic_check.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

