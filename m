Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D993C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbHD26T7TJi17tWvHFDV8yx6yenPjxhPt46ICXom1eg=; b=sC3Sft9uztnFOPYc5uqnrFj/64
	2903+k+pZyNssvGRvm9I08hf2uRxUGdfaP+DwXI0WaL+oaZvvCY8pCUm3lTN5xe52BXEW/+Ejtl10
	wU3gmE/FU4lbxxEx41HSkjJPvE0acKm//A5ND4CaOXkyzFVVzGzQt5UdMVUL8Z/NAQCNR4a/SoYht
	lvxbYP7Y2BF2rzuzdj7MNB1odmF5SGm4+CJWi+1wgBE3rGiNStEvrU2/hO4zeFsel4AJ6AWmjb0OA
	0uYhl7lM8IQOIoZ7HIzbHnhnFmmbKM1u9/Ls0uDlObZAHeZUhOxtMSwqRHpjaZEV2itFQj6vqHD6c
	/5X98d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXbu-0000000AJAB-0CRf;
	Mon, 12 May 2025 18:10:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXD6-0000000AFQ3-1BVE;
	Mon, 12 May 2025 17:45:05 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad228552355so543732466b.3;
        Mon, 12 May 2025 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747071902; x=1747676702; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbHD26T7TJi17tWvHFDV8yx6yenPjxhPt46ICXom1eg=;
        b=MQA9Qd9p6M/wg5FM6shCm7JXWjeM5YrtXWHpNYYEPjzhwYuNakEXfsfuyui5jX6KX2
         m39kVnC6fgiGzWXk/XW1XMcfBXDP60eLRchuOL3ltQ4eDtBGkTYd1aeu+1uPBg5+CEoy
         YrOAppwjPbVF8Kc/j1XyuNg3D3As5fJhOMT8TpGxnu3yOvEfzzoQHaPrcmYHhP5LyNPz
         n9cSLLeenaWOQoTMasm/2DNNIaOqkacp7kqZ9xIZL2/bkN1QNweFryhtApoflBL3gzoR
         Zk2jmdS0h0GeShEI52228Ew2LW4KzZI3jFbc1znNJAhk7D1XyzgWaztdgJA4Afhj+Mp6
         lVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071902; x=1747676702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbHD26T7TJi17tWvHFDV8yx6yenPjxhPt46ICXom1eg=;
        b=Pv/sipNQWBtFROFzURf5l7GHN6qxDAmDf2TfwigyonyEIlU0mhrAR/BeYPEogbrNcR
         H2Kf0lcH9xHMeyt4W8XzHvx88dGK6XiD3TZ9FnQLBdt3KNB5yKL3JRvKGnIc4hVXlejG
         PV+2UqNHhUHc3dKz1T9iALiK+2zrQ8lNnWI8hxGOe2hc4H8gSoxvnx5ZCBXD6hV39I1F
         wCt/gyO08h8pxio+XjGRBT4tlxnFDfdG5Db/skKLqR9cCyAtC4CIrRpjS4Ye/cNHzpLn
         ZEHqV93mSsbMth3pNcSreBfnY1+PxkqgY8RM3rMsC/gXhSjOajhPqQmbmQfEjpGam+wp
         5jPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7gPwpbYGTwOG3wUV80p+Y0Ry37Db5rXw//HMa6+JllWJlWkdYFiggBpzWEXf16eOecdEkwcZcs7wTdqWj4ZDSVw==@lists.infradead.org, AJvYcCWOOZM0LFGSd1kz9k8kbGVMcLi31BBLOqg5Dr+1KG++wlxhozWRZh2MzGTfmTRfBXTnA0dtLOhiP3jE/2e3LgcK@lists.infradead.org
X-Gm-Message-State: AOJu0YzxvdnGcV4TL45PIdkJA1smDALHdgJQagQJ6BZJdawkLFmHa6gy
	vBH3W6Vmtw6680OvzSNf8f0a8PYwlszCp7a87g1EPRJEvMH+1ZjtYWcvumYHIfbpOmUWnR4fKVs
	fSONsmWAj6o6S88xKuhcaUW0XAc6Y+tq9
X-Gm-Gg: ASbGncvWWPIh8O+bx6NkVGBFqXnx4Bn9xCggOsr4P19MDsBE0jd11ZYVgCKOrWARy2Z
	eDfWT0bki6oX6id4X5ac5QmnXd5a1Z2D9zqbFuTdNXsS9aW0BjasO6DicUqgSjsiXwrUPLo9428
	GXP8sexgnrNY8FgJYa1Ie+OPiLlwjtQJAvXac=
X-Google-Smtp-Source: AGHT+IHTpJ+KqOMBpvLw9OHOzt51BYTvVbg0/DBVeumgV6SyfohsNPoqJkeOtO1sf4M8kRC14Np+nfatHekXtQEPzvQ=
X-Received: by 2002:a17:906:4796:b0:ac3:3d10:6f with SMTP id
 a640c23a62f3a-ad218e52dd4mr1205609266b.8.1747071901905; Mon, 12 May 2025
 10:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <aCGPuKtfprIvwADa@smile.fi.intel.com> <20250512173800.6767-1-trannamatk@gmail.com>
In-Reply-To: <20250512173800.6767-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 May 2025 20:44:23 +0300
X-Gm-Features: AX0GCFuyrg0pl3_1JnzzyTR2SET4D_gcDkPdMIkU0_BIXXKlPTSw1GzhcNh8zuQ
Message-ID: <CAHp75VcXmOByVsuwm0m0+FYXoaxBc1CLKtofGgHfB4sMDg+T2A@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, lee@kernel.org, geert@linux-m68k.org, pavel@ucw.cz, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christophe.jaillet@wanadoo.fr, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_104504_327052_2D175A64 
X-CRM114-Status: GOOD (  23.35  )
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

On Mon, May 12, 2025 at 8:38=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wro=
te:
> On Mon, 12 May 2025 Andy Shevchenko wrote:
> > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > On Thu, May 8, 2025 at 5:27=E2=80=AFPM Nam Tran <trannamatk@gmail=
.com> wrote:
> > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:

...

> > > I think setting PWM also same as brightness_set API. However, there a=
re
> > > many PWM config for a LED and it is one of other config to make auton=
omous mode work.
> > > Therefore, standard led API can use in some use cases only.
> > >
> > > Please see the link below for a better visualization of how to config=
ure the LP5812.
> > > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> >
> > To me it sounds like you should start from the small steps, i.e. do not
> > implement everything at once. And starting point of the 4 RGB LEDs soun=
ds
> > the best approach to me. Then, if needed, you can always move on with
> > fancy features of this hardware on top of the existing code.
>
> Thanks for the suggestion.
> I understand your point and agree that starting with standard LED APIs is=
 the preferred approach.
>
> However, the LP5812 hardware offers more advanced features, and I=E2=80=
=99d like to support end users all
> features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x=
/ver/0.10.0/.
> It is easy for end user to investigate and use driver.

I see. Good luck then!

> If I want to keep the current driver interface to meet this expectation, =
would it be acceptable
> to move it to the misc subsystem to better support the hardware?

Don't ask me, I don't know what you want at the end and I have not so
much time to invest in this anymore. Only what I'm sure about I
already expressed in the previous replies and emails.

--=20
With Best Regards,
Andy Shevchenko

