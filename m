Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EA9D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 20:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geGVe3G5SBgEZ59+oVuK/Iwq85pb8lTkLlayLey8xSA=; b=Y37TetaIAwBnnlsU2SyIEUlOdM
	4lHEnMRYccRibigBvE4uDX8/uGgbCTxog175P1bFlbsas0oT5dIJ2y1WxnVxiES3uVpbgpH+qm8kd
	ik97E4/8Ix85jnDhY2mEhUdjDEu3pl2hJ/Zv4mysKuA5t9iHKffJPVjToIGrCnYKj872e5Hw5wdTQ
	hU0hGMD606C44HlThdI+zZhHV8SpgiSCXzpqiAMhRanylzggLVbz0gosmEqwuvNh5QW2mVnHaxsWd
	7rGoyCBYVUs5ypXCHT3dug/wuF/XASgBrsK0KjoX2Qweqe72NLlMWJC0snh6BEVeExnoQ/4Gg37Ju
	hcp0EECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vShUp-0000000DVFg-3iMx;
	Mon, 08 Dec 2025 20:06:11 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vShUm-0000000DVF5-2bKR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 20:06:11 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 15BE51380418;
	Mon,  8 Dec 2025 15:06:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 08 Dec 2025 15:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765224360; x=1765231560; bh=geGVe3G5SB
	gEZ59+oVuK/Iwq85pb8lTkLlayLey8xSA=; b=RCw4MYw+7ZLDHkj305wxxjCRSX
	rMrdbrBgi9f25g/3it320zvhMNV1ZQKoK4HMoVtdSMCSQxa3T1NtQGZK2ji7FaB+
	4EAMXj2Z/18fg18HLzgIp1Xd2gaRaVf6aOd9tq+17uy6+b25gxNy3mnV9680Kb9/
	5tqHVF1j8ty4YqRtlzJwDQD/AFabZMuWlqsu+ivO0qERdUZBTsbfvToLgDReiU2c
	Lh/Eba71Uo99rQNJKXg+dWVZlsvVZ4EEWaxpUn0pfDgHeJqy1Ci7jT91cm3WjvPy
	sTJxo0O0i2VTRszFsHu9XlHbQZYuMm/iGITipFRODxC1B8IcWm5/KrQbrMbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765224360; x=1765231560; bh=geGVe3G5SBgEZ59+oVuK/Iwq85pb8lTkLla
	yLey8xSA=; b=voCV257E8ExI8LRf6UdVA7F02TYLxADA60npChdBR6Y21xs0tRA
	C1uw+AV9CLSaNfK6RAUV6AE1RZBKQaSh2/pgZThaQt1P282do/o12nWenujxz3Pg
	/tdhnCFD0X7RQQSdVppzFajbBlqF0NSSuk+kHONsZxH3CEBuJYx+4gBEMsH+gyIP
	razXamAr0cLJLucn4Z8U6ZvWzmg4VLNRkI8fW7bkvNN/o41lmXQ/g0VAlsbl0p+c
	9kOr6shetIpWgA2fAxvQUSRm6uEgMj9wjThm4m3EyfuK4xRaW/GPDonriBPihui9
	NKID6dEU3zuG8C0j+xnEP0PQag6LUCS0h3A==
X-ME-Sender: <xms:pi83aTQUBBxxcwI8Ju7BapuF7LwulYjYQpKe7sWAR0r_uWtzDdDwRg>
    <xme:pi83aebVHsxrKMEuQywvzdXSDZHpM9MK2UiluZkdXAVmh0J0nNZu6U6gfkZg9j0Ga
    Ut53OsW7mEjA55oME3b-thugVKSe0_5Tbewl2mI88XfPPTSUxekmw>
X-ME-Received: <xmr:pi83acQeu23D1kI1rLhQ4wr0x5rXNlW92yKuzfJ9DXbmbyD1PnQo3LIx3zAyL52iJBsHs4oNCdPXZZnY0nx-sHu7J1Hs6kJCHtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfduue
    ffleefkeegueektdehkeejtedtffdtudejhfdvheetgfeigfeltdeufeejnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvdei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvg
    drihhopdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghp
    thhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrnhgurhgvfidrjhhonh
    gvsheslhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoii
    hlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pi83aZ4RCJmeDa-VR1cQPG2ul73JR-gGDUFjKdpu-22mFdL9oWUOfw>
    <xmx:pi83aXrSwaSszaHmCrk55lMdmsGtmyEQHQ1s-QpJy4Rt1_cXfEHipg>
    <xmx:pi83aUR5DbLatVwQOF8-uRLn9TImi_QeLc8Ti5pE_VqfQwUHqh1VcA>
    <xmx:pi83aTtoeQfXbJumEOlxloGR9zkRk3a07od05eZIJLIDpzutEw-WGg>
    <xmx:qC83aQtVE-oT3QFyD3EhDToVHKkkvo2HfKm_z0WZaMfBkC3mxyGDZ6m_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 15:05:57 -0500 (EST)
Date: Mon, 8 Dec 2025 21:05:55 +0100
From: Janne Grunau <j@jannau.net>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
	linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org, asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org, x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
Message-ID: <20251208200555.GA333481@robin.jannau.net>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aTcVXrUXVsyjaT22@shepard>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_120608_937942_DDB98020 
X-CRM114-Status: GOOD (  14.34  )
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

On Mon, Dec 08, 2025 at 07:13:50PM +0100, Paul Kocialkowski wrote:
> Hi Randy,
> 
> On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> > from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> > 
> > The bugzilla entry includes a Perl script and a shell script.
> > This is the edited result of running them (I removed some entries that were noise).
> 
> [...]
> 
> > DRM_KMS_DMA_HELPER ---
> > drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> > drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> 
> For these two, the symbol was removed in commit
> 09717af7d13d63df141ae6e71686289989d17efd

That commit removed DRM_KMS_CMA_HELPER. Later commit 6bcfe8eaeef0
("drm/fb: rename FB CMA helpers to FB DMA helpers") renamed
DRM_KMS_CMA_HELPER erroneously to DRM_KMS_DMA_HELPER.

> but these two drivers either were
> missed by the batch rename or were introduced a bit later.

In the case of drivers/gpu/drm/adp/Kconfig it was missed much later
during review (but iirc went through the same rename out of tree).

> Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
> drivers), it should be replaced with DRM_GEM_CMA_HELPER.

That symbol doesn't exist anymore either. It's now DRM_GEM_DMA_HELPER
which is already present in both files.

So the "select DRM_KMS_DMA_HELPER" lines can be removed from both files.

Janne

