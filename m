Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F53C3ABD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=; b=dgEMup/8t4/wAWVd1HbvGO/mrl
	mHPL/5wqXodu2LmCRpBeE9iOITFDxTAZ1PwpE8w8LJFrvth5Xs1W3MZ/3Y/crc86JzkYmHlBn2sPz
	aT/sZ4bkvM4AnVSJ17WAujUWLjrIexMdIBpAgffqCN6BH/gA6P2t2y42UPq5jr0Bfb4DOQvShfA8z
	BF84FRKyI7e84D6w4X6dZ6zUm+QqYYBf95IVlizv4NhTaL20CG7tDJ67dfMfQ2qwkJPj58f94jCfl
	sgGLdMXvoI8EPkcu23MkdWHd7c2KPhh2LQqzMGtD44EQMwaidGimfHybJ9Q6CrRFt5hJJzbMTha81
	7yKYBgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU4l-00000009i0b-2KZZ;
	Mon, 12 May 2025 14:24:15 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETQb-00000009b2c-1eH0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 13:42:46 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 77C721F38C;
	Mon, 12 May 2025 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747057362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=zP5U3VrW3t8DldETQ2m3ra/g9SR/7BfZECcIwt1ffozAv53i4FQNTbZqDlArwMGydwaBj6
	rtCzxLUs79hYV9o0Zzc4IUjfIraGG048FWChP1WvdFVRQhYgY2kGiXmYA2HbBvn4MP7iQJ
	GSdeERGDIVxWiZR/A6vqbWOAeUUfRIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747057362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=gvKon7yMqsoG257e/+tjFmrYEyugtB0QHKk7RcncstuvNHkWJgUu0gzu6xzHS1AJNvI2QX
	OVlRskUcVxR7BmBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747057361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=mrNRbP0beD+FA3kIigtZ4Axve0L82Sl8oc2EvXufjmPE8pwINqFDZxkHovVpcbgQ/vNB0m
	vqZplir1glSp40FziCgR2C0aHfwbrJD8wBoBU9Cl2dt07JUr0xad4PyPKPg0CEt0K23we7
	KQHa5h307RnZsk+FTfdGFKXqvDVJ65I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747057361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrpU8YxLS+4Al6Udh0YnCVnyLmsN5nb6vSk+X5R1cE0=;
	b=a5UtLZDe1eN/4R0G6f8q7lUB9f46NVeH/gmYLEhqmnN5Pvsl5Tq/jEozyj/EDghnESjMQr
	YROgoHf7h4tvWhAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 539C613A30;
	Mon, 12 May 2025 13:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2MYKEtH6IWi/LQAAD6G6ig
	(envelope-from <iivanov@suse.de>); Mon, 12 May 2025 13:42:41 +0000
Date: Mon, 12 May 2025 16:42:40 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	andrea.porta@suse.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arend van Spriel <aspriel@gmail.com>, kernel-list@raspberrypi.com
Subject: Re: [PATCH 6/7] arm64: dts: broadcom: bcm2712: Add second SDHCI
 controller node
Message-ID: <20250512134240.hg4we6sxemxeufka@localhost.localdomain>
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-7-iivanov@suse.de>
 <a563971a-45f4-4404-a622-21c940d96250@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a563971a-45f4-4404-a622-21c940d96250@gmx.net>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmx.net];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,broadcom.com,suse.com,vger.kernel.org,lists.infradead.org,gmail.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_064245_579317_A2BE912E 
X-CRM114-Status: GOOD (  20.45  )
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

Hi,

I am sorry so long delayed answer. Shifting priorities.

On 08-02 21:01, Stefan Wahren wrote:
> 
> Hi,
> 
> [add Arend and Raspberry Pi devs]
> 
> Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> > Add SDIO2 node. On RPi5 it is connected to WiFi chip.
> > Add related pin, gpio and regulator definitions and
> > add WiFi node. With this and firmware already provided by
> > distributions, at least on openSUSE Tumbleweed, this is
> > sufficient to make WiFi operational on RPi5 \o/.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > ---
> >   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     | 55 +++++++++++++++++++
> >   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 13 +++++
> >   2 files changed, 68 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index 06e926af16b7..b6bfe0abb774 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -46,6 +46,20 @@ sd_vcc_reg: sd-vcc-reg {
> >   		gpios = <&gio_aon 4 GPIO_ACTIVE_HIGH>;
> >   	};
> > 
> > +	wl_on_reg: wl-on-reg {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "wl-on-regulator";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		pinctrl-0 = <&wl_on_pins>;
> > +		pinctrl-names = "default";
> > +
> > +		gpio = <&gio 28 GPIO_ACTIVE_HIGH>;
> > +
> > +		startup-delay-us = <150000>;
> > +		enable-active-high;
> > +	};
> I don't think this GPIO is a regulator from hardware perspective. I
> guess it's the same reset pin we have on the older Raspberry Pis. Please
> look at bcm283x-rpi-wifi-bt.dtsi for the wifi power sequence.

FWICS, "mmc-pwrseq-simple" is more about proper reset sequence while
here we need power to be applied to the connected device.

And this is not a precedent. Just grep for "vmmc-supply = <&wlan"

> > +
> >   	pwr-button {
> >   		compatible = "gpio-keys";
> > 
> > @@ -80,6 +94,25 @@ &sdio1 {
> >   	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
> >   };
> > 
> > +/* SDIO2 drives the WLAN interface */
> > +&sdio2 {
> > +	pinctrl-0 = <&sdio2_30_pins>;
> > +	pinctrl-names = "default";
> > +	bus-width = <4>;
> > +	vmmc-supply = <&wl_on_reg>;
> > +	sd-uhs-ddr50;
> > +	non-removable;
> > +	status = "okay";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	wifi: wifi@1 {
> > +		reg = <1>;
> > +		compatible = "brcm,bcm4329-fmac";
> > +		local-mac-address = [00 00 00 00 00 00];
> I think we can drop this?

Sure.

Regards,
Ivan


