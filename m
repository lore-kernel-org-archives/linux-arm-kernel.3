Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C914AC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=; b=Z0MqZfUZOlUfBj94uspxZLHZ8T
	nctEzmKHnkuKvPB3ITCxIPJw0Fil2S1hkSfJffUYNiWRGaPXcFN9i9yczSHLh0tlcn7YAJOTwYHSB
	mbB9AcRagD5k3kCFZhhxm6shmxJwjjswBZZqJvPBSDp/urZOVQyPu2d3ra1w82KPUQnFAdi3SNM7S
	+LOezixXeLsnT7S2u/BvouuvSxnR2u5aUVr6shOlRQ6WuQBQlST2PGKrxTaU3oj1FpMQNTc8QocAT
	KV0XoJPSAKonXYaabcD6zuJpEGFVZLSmi+KH/XIH9Q/9qgRJijM0jeQ2i3FqjuFEHaGzDmfpahh7r
	CaWRBlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeR4-00000004Yco-0ZgC;
	Thu, 27 Aug 2026 18:02:46 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeQz-00000004Yc4-0HRd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:02:44 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-39c86945164so1086651fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 11:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787853759; cv=none;
        d=google.com; s=arc-20260327;
        b=SizwsSe6Ear9ikbNf4hG+3jMTbaxsPNrHESa9+AYGMXgB/hjTjHvouuDJb0jj1VD4s
         LZlW976arnEbV6Cc6WqS3GeR7gq/B+xopNAVZ1OuVVXu1sELZttdqmdtzmmDjYQMk7u9
         izBqnh/z76csIek0EFioNMeMjCxcrkeOKRgS4yDkb2t4sffH2tXPFDQFWDRJ0HO++IMo
         UPLHjAQSoI32kYBSs5Zx8gUIKYLJvjgk9Fs6/21n2Lj7FAOmHF41Cg1t15emztZQwYlC
         1BezmkIHQnyUJ7HNuQuaj2sv+CzSK27hN9unoJWrKmn6TSmfoMvYgRT1OkbPw9WP4dCD
         gpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        fh=rp72h0tgTP1We6B97iMBFiwGIsgsKg9IQ67xB2afJxY=;
        b=WP0Ao5D7WkE8ID0LH69wibeaFX5fBt8Ii2nSssiRCofwtLvSNq5qlQyMCnvBm6dZ/1
         SAndLmXjOd/3e6ZrL4L3DtglNJSfdP+wyDZ7HBLyfdF6seScM6IkND/S23KZ+310ogj2
         JDrbLo4zNF8YDNhbQUAp9QNCVpzlD5OmPc3cRc0dO/Rs3LbtPvmi24yx/BG0hP/ftNl2
         gukPaqFIsG6GGkLpmtBfRbXZDL6Pc53DARsxXdgoQAMSXkaZGKogLYX77b8R3g3KvuXB
         GavvWdrh6pswRQXSt+7nr2k3eiZPSGbg6FR+5aag4mTD4WvuUqHX2A3ZM9TuSthrv2SM
         ZfUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853759; x=1788458559; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        b=I+5kLcN2FblJw1/m95WnzONxK1VjeWRbm+6Ob0PRg36G2N7sIcb8KzZyawWJcPbHfX
         XVuESBpfRq1y15VEeOrp0ylITz4s9neUaX4Rykr8jzcWP8H1aiq4oc4b3g+ihsbe3nNA
         ObFl9ksnGfF+0ZsTVQQcYBsbddUMnNKAqH1YHvrQsphR5QE5U+H9WdRpYNEPLosCDT5u
         9nYzBv7sOschT+nU36707YiFIZ4LAsqkcjHw+onIWxpYjFFVOoqnRkNph2wSOjJlMoU3
         2NgJ3s1oXuGvw8nHlAUXEjs3sz0G/MI7f9hC67CIq0NE/iEe4yPPYiaMSUUXYt3q7uRH
         lWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853759; x=1788458559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=do51Gl5dKXox8vJq4RVAbo30sgZsNyHF3P929jzrUc0=;
        b=pPtOO6e42CchApy+tpAw3chfJd0D1U0cHDRUYECXRZ5P+ncLpKeVbjpZwsSI4jMAP4
         /JxeLdqhBQ8oDpLNbfwCv539nN1Uu1n5jLFNqolGS52Q3P7ijnW8HSz3UUq/PF0NUVLr
         OMJd+tvpY7EH5WqNloMbY7DLIfB4uBuv4NYlr+42fNC6ZdJvXYKCGU4lKPR6XrDzXyCM
         TxqAXlkBVgdwzUL0lW1WdMo7+qtcEVu8veOUgFzdim05Xlqodd4fgxoYY/5N5VP9exLn
         apiVAwswFZFNj2wFRBa0p4wEZKoWA5eKMoWoZCTq8aPT0otg/ZkuX7uO2jjeRNqqXL0G
         gqfg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+dsdQYK2S+snrv/7Ou+V0DmjyPvy41wb1qvP/4r0xsAGg/uC49vLUe0UkDUUN0KwGkV2cVF+dprMFVVnFDv/E@lists.infradead.org
X-Gm-Message-State: AFuF++k36XYspqFFEhBRP+DJpoV9G1alJpeADJ84155dGdyVdira7k21
	rSfNmLZSDfQfclPuFnFGHAvTeVhkZxSvCnk4PlvtCheR13pCdmUnDHjH3EI0HFf9IRokwBEmZyd
	ldxvrllfDWhGkuA7gsdPcDSP8qL3jFm0=
X-Gm-Gg: AR+sD13mP6ZoG1yiFvPQXJataXSnqZYpVP7RlQCat6mb4Muo4KyuWoYmm39QEfYZsP3
	BFpYZUFoVIcWyN/163q56WB/sTpCuYmB4G4HOFUink8pHAhkfH3RjPM4+EIjUzjOOib0epzUW9Y
	ng7DYXrcioHKQsAP2eo+zwLoLf5mOhABCTYMEcmDGS+dgLuJmxYglkth+JEVFAYGJMGkH35bTEd
	YS3S3NXWA6hAJvAfeIRsz8x14H5LsPsJ1F80ZpwTeCFTgkVzJfqshLifNy6tVIFkZQAB2R1nIMt
	IZLeq51N1KLPpkQFBXTtrEu9m5J4gHtOlpDab+/Y4Gxtoc1i3P3h+TtMXNax0THnAgV+VZp4+ST
	bH8w/3oI3I1YHPDM7uLcmjDpEOg==
X-Received: by 2002:a05:651c:a11b:10b0:39c:9241:af65 with SMTP id
 38308e7fff4ca-3a301ac1f3amr415741fa.11.1787853758715; Thu, 27 Aug 2026
 11:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com>
 <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it>
In-Reply-To: <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 21:02:27 +0300
X-Gm-Features: AcwNN1WhcJL-nGDx-lqXbkS4JNH0Ob2Z7Us1EwrenTLfU7VSU-Ti3TpW8tZnfmw
Message-ID: <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
To: Francesco Dolcini <francesco@dolcini.it>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_110241_125837_56C0C99F 
X-CRM114-Status: GOOD (  16.01  )
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

On Thu, 27 Aug 2026 at 20:40, Francesco Dolcini <francesco@dolcini.it> wrote:
>
>
>
> On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail.com> wrote:
> >WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >from the mwifiex ROM, which conflicts with the platform regulatory
> >configuration on units sold outside the US market. For example:
> >- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> >When the system boots, it detects a conflict between the user selected
> >region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >preventing phy0 from starting on any DFS channel. phy2 works.
> >
> >Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
> >WRT3200ACM device-tree, which signals mwifiex that its regulatory
> >hint from ROM conflicts with the platform and should be ignored, so the
> >platform regulatory domain can be used. This does not allow the user to
> >change the regulatory config of any radio. It only allows phy0 to start
> >and operate according to its certified configuration. All radios in
> >WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
> >they are certified.
> >
> >On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
> >partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU
> >
> >The Linux kernel sources do not have support for WRT32x. An equivalent
> >patch for these routers has to be sent to OpenWrt.
> >
> >[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >[2] https://github.com/openwrt/openwrt/issues/9956
> >
> >Cc: stable@vger.kernel.org
>
> This whole series is not material for stable. Please drop thia tag from all the patches.

Dropped CC: stable from all patches, and sent v9:
https://lore.kernel.org/linux-wireless/20260827175850.89395-1-gvalkov@gmail.com/T/#t

Thank you!
Georgi Valkov

