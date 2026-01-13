Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA9BD0C851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=; b=v+okpxocP9VxdE1aDpoc5/aJ5u
	/ceZoVdxAqVrxznT6TiK2UdjRv+Tpe3T7o/j/p2htb8iarrjxa/U6KlkuZ/rZ4kFPsOtTIG2HwCMp
	ueBYsuiUUtkkGMWB62BnoSqzfCtOIuHkVIv+bvS+OW9BHaEJy/kGdLEhiJELfwTTejQdBwFotvDRD
	meBo2MpPYbDeH8RpcM6CYAs0g1WCXRQ9xRfJsiBeYxxVopMSrjcWnEs/EwOa06rG/fFuv0mfFmWXF
	wv2BBqcuAXdQHW8ucriU8andX/r1gJ9vcITXTPJEn2kw6wa7swk5FypWDGZ7OIAfNKFVO148wkUWN
	+xylrIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7n-00000006wfx-2qoC;
	Tue, 13 Jan 2026 10:59:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7h-00000006wb4-1PyF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E370F44166
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 10:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA087C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301979;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Aoiv5E+R9+G7mpJeLR17EVHEbcaIcE5tMs4+TBsdIKCiRQjQVEVRqGs5g3waT3akg
	 w8QZerZ3vBJTV8qonXkbxcbxNEThv1+LcLSOPlAnnnVAhYjYQAb5yWBuwiTnuwc3yG
	 GwJ6t4PnMcu3DXyl5BvDAaqbBleSvsGCIpHMZ+LSPRIbBd3eypW4re99On5m2yn2rz
	 ZegKHtb8XeQAv9NUmzryx9fW5UQ2xNGWzWrPVr56/2wHXYFx+PdkF8niAbj0IccPpQ
	 9YA1SlLHIdbEjnw6NsbS8S/vsql5tBag4/hyMnET+SMhCqTuKs3n45Mv4P49wozYEc
	 aJC7rSM7KaoTA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b6a987346so5980252e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:59:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVA/Ks6fdaCWQoFN+h9SSWYdvIT9QvZiersGvga3ofxAa0e1wr5CHh4PfVSQR/D5w1u6M+oSrKlJOu+BBOXwycz@lists.infradead.org
X-Gm-Message-State: AOJu0YySfbA86Oc1h9S0krtAZ6cWWULyEaEvULKtLeETkhfmJ/019aT3
	TZUpx5bnLVTGt/N7Fcu1v1A8KGSrEOhZ8SWI8DksWWjXJaiBcv38AojdLMRuggVZlhwhxZZZkBz
	vlQ6vqLS/of6h3X/sIQKY5zL5w8+Ntak88tMe9Zcdsw==
X-Google-Smtp-Source: AGHT+IGcmwmSIyLMyyShT8GjGLmzzGIi3k+GcAB52Nf27mmBCIl5woR+Nq0F41SPuLO1vsApeIkdFdNTDNszbvq1ee4=
X-Received: by 2002:a05:651c:2212:b0:37a:584c:23fb with SMTP id
 38308e7fff4ca-382ff6dd8eemr58925311fa.20.1768301977156; Tue, 13 Jan 2026
 02:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aWYiJbtueA8g3srn@ninjato>
In-Reply-To: <aWYiJbtueA8g3srn@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 11:59:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
X-Gm-Features: AZwV_Qh-1r_ecwLNV2XfQsZ1XcvcpdCoswobPzSyba32xUDeV7eWsZEVfP38rEk
Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025941_427115_F4F61BD4 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> I haven't actually tested the code yet (but will do so this week). But I
> already want to feed back that I approve of the general concept of
> abstracting away drivers access to the struct device by something we can
> then convert to SRCU in a central place.
>
> This mail is to discuss the timeline of these series. My preferred
> solution is to aim for inclusion right after 7.0-rc1 is released. That
> gives me enough time to test and you some more time to address review
> comments. Bold wish, but maybe we can even get dependencies into 6.19
> before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
> for it already?).
>
> Does that work for you?

Yes, I agree it's too late to queue it for v7.0. I actually wanted to
rename my macro to i2c_debug() to avoid a conflict with saa7134 but
you're right, I may submit a patch for that instead for v7.0.

Bart

