Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4939E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcsDxMoiN7TNJEZpNWOj8buoqn0gV394uJbXKXQCWiU=; b=fYpxwK+QgVaqiLdNCgEBwmVBUa
	zmcmTX32ybhimQb9uDEBy6rPL9CwAiIOlWrpnc/xwdiWE/A6HtaJiZ/IM6+JZe+Ekh4jbsRHvyRKU
	9Wm2r8Z+cGzu4APYMyGIHqA89p2VYVbePNrbU3ODjMk9WK44VGVciDs7fUCZpN1/yjXGIyG/A6fry
	FkwmtE90fvN9NYUuRZpP/CI9aAfhGzZJslWEitH0/HkD8900q46qC55ZiAiOiOcVhjARUswFE4umt
	C0Lk7yBCjBY6A6JxNFJxUiHkDssc+EemBRwpr+ZGqwgDAShGtw9375KfmZEsJudZcyUs14cT8moiN
	3LsYGNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7fc-0000000FFmY-3FXw;
	Thu, 05 Dec 2024 08:57:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7cw-0000000FFEZ-2uCr;
	Thu, 05 Dec 2024 08:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IcsDxMoiN7TNJEZpNWOj8buoqn0gV394uJbXKXQCWiU=; b=k8jP2WcugNo+/MQCVJYO3fIkhb
	3j/oEHrSZqj2AAkSxz9AhN98yp3oMZrlej7KKPK3JVYTXM4YfeRP8qspP0FaEihB6wviCExGlDMaR
	lsOAIkY5tjia1/V5ndmmNmNjFYcyHshqcLNueCpMawZiAIUZJL+7OvAS64Xu+VNLpMIwIbrWjvnMv
	efCtCVeM9qkX43oKq5D4jpr8Gdd96UQNsJn4Djli72NsRerZByogf8BRacfwCsEHEDTOa5pM3cb9f
	jDxt3rYm/fzlpZiofwZsb8eShVHPKVzh7bvcZaoQ3IUeEefzGbKgL8GpZtEPcawH56k7O6Aad6Vwn
	BBApXpgg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7ct-00000002oKm-2LyV;
	Thu, 05 Dec 2024 08:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IcsDxMoiN7TNJEZpNWOj8buoqn0gV394uJbXKXQCWiU=; b=cO1Bn9l+peVZ5Vp9k8peqnNgHR
	aIBl+/9vunapUW8U+SeqbA2ARNPeIj/OnX+tsUTfGYNembEi14mWx+i7abMncCvpjz1UfR7yFbDvH
	OBLv0HW+HWm0ObwTS97O+2SBqOryjFkK+f/RXloYT8M3Ma0wzTQ/dvYhb0uTzsMcrALxBHjQ0B9m/
	VeTpNrYXoNJbNk+LKqtP79AT9NMzLN0EvmEjE2IYpHR57+fUcXJ3zczSieD8MMBqhEBubBUKIFYLi
	G1yYOzNlqoKvPR3Oib9JptAQA0I6zlLL5T6acz445OFfnYoFepSKmZhc4pNf0p0KVZfw4DnMTJi5s
	fckR/8gQ==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJ7cg-0001mo-UZ; Thu, 05 Dec 2024 09:54:10 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Piotr Zalewski <pZ010001011111@proton.me>
Cc: skhan@linuxfoundation.org, Piotr Zalewski <pZ010001011111@proton.me>,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
Date: Thu, 05 Dec 2024 09:54:09 +0100
Message-ID: <12938960.VsHLxoZxqI@diego>
In-Reply-To: <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
 <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_085423_737895_3CCEC1C4 
X-CRM114-Status: GOOD (  13.95  )
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

Hi Piotr,

Am Mittwoch, 4. Dezember 2024, 16:45:21 CET schrieb Piotr Zalewski:
> I just noticed that after coming out of suspend gamma LUT is lost and must
> be rewritten by userspace.
> 
> So I guess it will be needed to save LUT to a buffer and rewrite it after
> going out of suspend during modeset?

Most likely ... the old vop does this already too, so I guess you can
get inspiration from there. (gamma_set call in vop_crtc_atomic_enable())

> I checked the patch isn't yet in the "official" linux-next.

The patch is in drm-misc-next:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4f537776340dab2b680a4d8554567f6884240d0b

so should turn up in linux-next at some point. This also means, please
provide a follow-up patch for the suspend handling.

Thanks a lot
Heiko



