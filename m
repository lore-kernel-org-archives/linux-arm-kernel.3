Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408F6CE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOly56QZgoMINy/y9cRSiyi9JRJIV3NRNtcNxFgOt10=; b=1zcstuqddjrqV5lcMBFtF7tYwU
	1K+gPkssOz+IHketcLJj6oMgv72XDdjZwD1mCBr+WHNMTf2XYn4iY/JK/5+fDBUNKK/bTPU2CSptv
	ZBsFobxDr4Z11VO4H3NgQgexTZdD1eZaYfrD28WEKRTv6uQUXnCS4jinwxaiJMukeOFSvOzPFhnT0
	SFhOwIoVJlcT6Y7l6NTXM9HC/jFFcXV4enOZVsc9/3QPBDcyxdBkzm6a/0j5wtE0xnQaVqooiRkHh
	PejMcoqPqo+YRnrN00n1bgjaVpEHIgTZ5oiFoXEfMiRcF7NeZJoLMm7WRtkYhUe8XIi3Nv5Fui7Ev
	DSlkgvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zuj-00000000wKi-2MFS;
	Thu, 24 Oct 2024 15:38:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zY0-00000000scK-0wcc;
	Thu, 24 Oct 2024 15:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2720EA45434;
	Thu, 24 Oct 2024 15:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B0DC4CEE4;
	Thu, 24 Oct 2024 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782886;
	bh=Fhhtx0SKw8R7fwmiWBICVYOc8q6+cAez3j0Ek1hM190=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=UV0Y7R/6YQiFBOZvJUQydU4Yxt+U9SxMjlRxZMea1owRTDM7Fti6imYGZVsIfWN41
	 oDctMYnTbJkbl3KGUJT+O1oXccwmPXnsC/EhPzxPzT/Lle/JOhuEXOXAKocPRREOom
	 pTNzMTAIv3X/bQqAFV5AaPLK7Zc5DyqeJeVz0+nyoasRrT5zawOKBSgfqyI+m3RHVg
	 3mYcbqSAiNv+U5FoLoYpHzXS3BCnWzINmPdSbeXL41n/j6FBSHLIdYaHnatCaxhwMR
	 igF5ds7OCBby6INyeeOz0c9DLocUYF1KlKyHVDOlzuu+hvA8E5RVkxbLwbENIzdlIE
	 YbwEs/93bZDJw==
Message-ID: <baa171fd4e0cd7ddf2d4ce593b690ed3@kernel.org>
Date: Thu, 24 Oct 2024 15:14:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 02/37] drm/vc4: Use of_device_get_match_data to set
 generation
In-Reply-To: <20241023-drm-vc4-2712-support-v1-2-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-2-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_081448_366784_850A06F6 
X-CRM114-Status: UNSURE (   5.55  )
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

On Wed, 23 Oct 2024 17:49:59 +0100, Dave Stevenson wrote:
> Use of_device_get_match_data to retrieve the generation value
> as set in the struct of_device_id, rather than manually comparing
> compatible strings.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

