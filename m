Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F94C02183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/6jZ01/uCCTpSq3Fao8Iix6OttLd5/bSlWLrKSb+fw=; b=FbAVRg5I3/CaufiN2TdnRUhsEB
	9hrXLXevqx01z09BjiWJVTMZ+Zaw4L1m6f5+54A1K2/AKGjYJjFkc2GFeZluRL+N4tC60RwwcrfVg
	Oj/ZtnbNUojXjTPoXAwAQv3HYQSwbWWgs45gM9pbl1qfBPj8MkN2bkl2yVjftWSFTAFSsMu09183Z
	Of87pui5v1+79/P51wglLOyBHl0snljisuxrsDVYiBK3g4hOw8TMbvwqbt/GbmkvDyVR8Q9ClmCbX
	hijO9q2o63JxJqbWR/y6fhGP7Ug+lrBLvQ8H9ZwCcuHEHuPyrRjqXhmrmyl4fGTfuSytnDLxdHDuT
	fyyLClBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZOvz-00000003Ud9-1lay;
	Sun, 19 Jan 2025 06:37:23 +0000
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZOuf-00000003UVt-2hJt;
	Sun, 19 Jan 2025 06:36:04 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 8F54B2011E9;
	Sun, 19 Jan 2025 01:35:56 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 19 Jan 2025 01:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1737268556; x=1737275756; bh=3/6jZ01/uC
	CTpSq3Fao8Iix6OttLd5/bSlWLrKSb+fw=; b=iZsuGWik/KyLleI5OKl/f1Cl/b
	2jXqCMbSiO4TPgJIzueKqFmJ83obVkKo2fZWO3zD0rP7b6BEmFK1YvAvdEbPxVJJ
	ivV/vUvanl+FEKszvP0ST5VrMhS4nWPZwrrIvwLTFw5RJ/wgync0W+kIcUVshUt0
	VdnDld+x2X0y4+PXy8bmWr29PFLd6t+K0jXCIgESRcrb260f8FZy83QxTc8hhyHs
	kmf7bJFls/RGpIhZJFgnACt0DSdJAJHMb1V8HfwCd7rG4b544j9DqdTL3X/SXapp
	bRQeuhEBCpuH2O1x+oTFRw3yhzDeUQUHK+1L6HA2hbz4TnjHlBObJWwse2MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1737268556; x=1737275756; bh=3/6jZ01/uCCTpSq3Fao8Iix6OttLd5/bSlW
	LrKSb+fw=; b=L96THMoRjo13raPMbwHBAVnHjQnBXFjmtElyB+L2wc9MoZpKq4h
	EHlgJE7WQiCtyaj7OzLiK96mowCatmyDKgJblhiaGY7y222tIy3M4RUEfJmuPlkX
	zdhbsh38ESsY9jw4NirnBV7pN7evUFYjimRKQxLa7edE4WtOW/ocQECrY8zt4mal
	BRl4LrL4nbcPjKfcFayBHNJ6uw/kNL6x6LrxdqttoA2Sg9OP/FuNE8pP0r9aoSu5
	Dz6STEjj1rNzxNxPXt7fno1b4hGBE68JB+YxKl14nuPIClKJp7bWQ+uVDcK9qwSc
	Q5/9kJM26zijNKWA3x7iJ01prwcftyTUMuQ==
X-ME-Sender: <xms:S52MZxchzhOQkRz7tx4eT-aI68rr5TAPb2uDajfkjY_aLDiCV4rauQ>
    <xme:S52MZ_PcqFu4BT0vI3I1KQMgpUARY_9Uq1eoJ_0BfkJn5W1-Ag5hzzncyC69SWtca
    timTvB926Bg5Q>
X-ME-Received: <xmr:S52MZ6i9zB6CBVkRx_1w0TL3xX5kHenQXJYi5QdJwS2hWUxj-sjQeDOUzPtXYUTtbBSBPFn8PQv-VFAD6gQ6RnKoteVkKHlQDcGvwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiiedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedviedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohephhhnshesghholhguvghlihgtohdrtghomhdprhgtph
    htthhopehrohgshhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihs
    iihtohhfrdhkohiilhhofihskhhiodgutheslhhinhgrrhhordhorhhgpdhrtghpthhtoh
    epfhdrfhgrihhnvghllhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhjuhhisegs
    rhhorggutghomhdrtghomhdprhgtphhtthhopehssghrrghnuggvnhessghrohgruggtoh
    hmrdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhi
    shhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrphhiqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:S52MZ68cVdsDhsSObbEKTAagf9UOnQ5jppeprDSiQGFOvpOUJnVmug>
    <xmx:S52MZ9s0mkrBiB21dOeQNUf2nWd3fxUcd8u9V8QmcZjCvXjZvyDieg>
    <xmx:S52MZ5Hf73Ntd_87xVVe1LjQJ2ai6E4QG8zZivP7czIdsUeRPnI1TQ>
    <xmx:S52MZ0MISCoYZuk50m8Ynqq_y9vGwFlXMZBGOfezybrT-RO5nWQ0dw>
    <xmx:TJ2MZ2tCFrFEuiaC-kTUUqv6ugK61ddib5_QxSGa-j4ImXLXwWX_7j5X>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Jan 2025 01:35:55 -0500 (EST)
Date: Sun, 19 Jan 2025 07:35:52 +0100
From: Greg KH <greg@kroah.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use
 firmware clocks for display"
Message-ID: <2025011942-basket-subsiding-8bd1@gregkh>
References: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_223602_475725_1A2BDB79 
X-CRM114-Status: GOOD (  25.27  )
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

On Sat, Jan 18, 2025 at 05:27:07PM +0100, H. Nikolaus Schaller wrote:
> This reverts commit 27ab05e1b7e5c5ec9b4f658e1b2464c0908298a6.
> 
> I tried to upgrade a RasPi 3B+ with Waveshare 7inch HDMI LCD
> from 6.1.y to 6.6.y but found that the display is broken with
> this log message:
> 
> [   17.776315] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_drm_unregister [vc4])
> [   17.784034] platform 3f806000.vec: deferred probe pending
> 
> Some tests revealed that while 6.1.y works, 6.2-rc1 is already broken but all
> newer kernels as well. And a bisect did lead me to this patch.
> 
> I could repair several versions up to 6.13-rc7 by doing
> this revert. Newer kernels have just to take care of
> 
> commit f702475b839c ("ARM: dts: bcm2835-rpi: Move duplicate firmware-clocks to bcm2835-rpi.dtsi")
> 
> but that is straightforward.
> 
> Fixes: 27ab05e1b7e5 ("ARM: dts: bcm2835-rpi: Use firmware clocks for display")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/bcm2835-rpi-common.dtsi | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-common.dtsi b/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
> index 4e7b4a592da7c..8a55b6cded592 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
> @@ -7,23 +7,6 @@
>  
>  #include <dt-bindings/power/raspberrypi-power.h>
>  
> -&firmware {
> -	firmware_clocks: clocks {
> -		compatible = "raspberrypi,firmware-clocks";
> -		#clock-cells = <1>;
> -	};
> -};
> -
> -&hdmi {
> -	clocks = <&firmware_clocks 9>,
> -		 <&firmware_clocks 13>;
> -	clock-names = "pixel", "hdmi";
> -};
> -
>  &v3d {
>  	power-domains = <&power RPI_POWER_DOMAIN_V3D>;
>  };
> -
> -&vec {
> -	clocks = <&firmware_clocks 15>;
> -};
> -- 
> 2.47.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

