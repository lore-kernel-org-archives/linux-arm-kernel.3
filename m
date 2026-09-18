Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB94C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We4O+cegvJtoaqFGeYIsxacYH6oBV4cwy/gzDLBfJso=; b=jaeJwIA3qZlOPKzg5WuJ2IcXpu
	47hJZYFrlBBgUAG9+UmRN04EC/ufjpblFk+JBVYYhOcE1QPAmwCnDET9HOVQ3uwN1zIfpiY+SjHh6
	LibtXanPDutAGmVN/iOJs+SiWqgtXPjc0/6Eee2I2fBZW9gPkkDeAmg+o1F6e78N8DXLZEzwfW/Sv
	+4d0SD9VzKFEo1cLlZdGk3laE54MdX6WBqe/kTl4+6Ic756rUP1rpWLd2GVpQ3fSx5OeMEv/Fj8Tf
	lUj1Dv8T9+AZKqZ5L1A4MR4aBnuY1kZQmFEMiz6g60/V9SQsPQ2Hwxp5VZhcVvnLVH1pvF89JPJjc
	7abiCs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Shn-0000000Derx-0HvP;
	Fri, 18 Sep 2026 07:08:19 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Shj-0000000DeqB-2dKr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:08:17 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb796so54719266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715294; cv=none;
        d=google.com; s=arc-20260327;
        b=AD8dPwwWqew2igATn2XXQD/AUHptHdBAtwjtnC1e7h+/tx6fNT6RFRGlGsMTGbgJ3J
         CaXkysZv2M499/NHQDoDKXN7BYNHubgweU07G7WGjPz5JlnLzSjAkgapoYm/FOCVuDKV
         ZeMbmianeCza58c/vxYN7goTBmPAjprj6ttb1VYUSw1g2SuYn6jHLjrvhXiEU4USAwB1
         3dugijZjonD0aQYmb4RqQ5qfaCJs3vx6C9pp7RcnbnK2+NMIKwl5aIuBVFuxcfgqOv0M
         I81vOSyumGktwNZM98EPZ01SQgQiwVjLrpA9/UElJjYUW0RUGnSHdvp6zHl6o+2mI6/+
         5DiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=We4O+cegvJtoaqFGeYIsxacYH6oBV4cwy/gzDLBfJso=;
        fh=hgkwPMNAhjgJRd4HcwDMjytBwLY2l4DusslkbFF17NM=;
        b=lBQmhTx1LJ41IFeyWz50uyJJPkd/RokhZtn4DDdnGmZTjYhKdfyP7Mwwtkn8uKjOrX
         y3Kr0goXdkpcuWKymO60Gk6orSxa5D7BMAeXk2aKH34EMG1RJIsuGMMfz0xXyTdieLf5
         mZ15R+9feTTAqFVuic2auTPiQu6uxM8HfcPdqjSFkul9QgvoJ9QVG2XN51F9pPbZWZba
         fJZ6g5OTLAhTuRlBQo13QgLZY9DtDLJYz88KWV2iH92aCNWUeGpMbZzUpnHZAuTkGE5j
         6Vj/TillKFcPWlLgNHIxH+tMb8zW1GFdOFpYNfX99JE8AHkD8KrdPqZtIesJfKw/jqlQ
         C7gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789715294; x=1790320094; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=We4O+cegvJtoaqFGeYIsxacYH6oBV4cwy/gzDLBfJso=;
        b=wofT6pyAQpTJ1NpI575df/NBbk9ZSQC2HlIjoeOXhK1cTid+ldtWe+Q0GRLMjl/eaf
         OYnTj+vzYB+xIOYI3y+JKFb7Rzs7KERcpWv9n56VF/dNVhL+QcXkoJ4IvZZBuk18SzmV
         NwYCzyoNNQaNCElaEZGd59XpWmtioQWs4GfeNWN3puJDe8/mcTmoveREooqgW+568fnr
         O1vsY0GJMYa80KLWEMhc8gCBo7zz9HqYPW3AP92sepBIiL3RHLXjNRb1xT5Ia74niozn
         QYbhV7JEykgkODlafo9jptdE7eqalbd7iHtoA1YBL7bUs2VJuGEiteX2WntDreMUm6uN
         JBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715294; x=1790320094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=We4O+cegvJtoaqFGeYIsxacYH6oBV4cwy/gzDLBfJso=;
        b=pKnXyGCeE2/6UnZo47KIvfR7LZTf4bcqxnOmrCAvJG5QvJT2kVF6ydHgQdOKrfMGAP
         /t2wB9T5q/OtjpQFhwgc8iQN8Fx9/zAF2YeshmvNRC1eAzWmExucsCehEFfgzu+ga9fz
         o0tf3OZbhQYuUwdlkeQDMvAkIoYJBoLzpFCaeVzkGlyMaWrR6LlnFVXSwby5sY68clwV
         iraeDhpTcGIoBahvrxlQ4u7XbqUOnGVSarcivuuv0mrsI8lFE98yZGDrPoo0nP8BjNMo
         85m5p92newduACrcT6eF6gwLIGDvVEx4ixxfj2bWhzDWSTxlbV4HrtcyE0mLNy66MM62
         axaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIIfVoh0KONwt/bJiyhnRuZS2hrg8j9ktAkpp5sIeoWGAtWg+rNGxK6fraswyiP5SV1Nn3tpEwNvjSF0hFisNQ@lists.infradead.org
X-Gm-Message-State: AFuF++l1fp2CZcyZYpEhhkHeTDeztJGT0ngiaq4DjJsusZfgROGghs6+
	gCUSwelP56Fwn9BW/FpmVBPVPtUF2ZgC8vmqmyjjU27uT6EMiu6x1AJ3BgGTh0TU4rmkhB6MOID
	/7v3CLlsxDfqaz+YU0Zfm51KB1FO9Y+IWzefEZhAcsw==
X-Gm-Gg: AYBFou3DP9BzezJ2MK1kcojtFutrtkem090wxGKdDFQFNa9zrTOEYJN31SDa+8Zw7Gq
	pc27N0ydbC77ByAAiNNfbVRyY7kT9CG5vI5r8hKvKJ0ocRVYAfz/HY8KrlRs7CmfcKy+Kn/Qhdj
	0qfU3qjmNTmwjEytiG43Rbtcb7kkDc91owmcw3YLVJhKCeD+npa8m8JdgQoEsf+tXY7IE1gBUuu
	b7QdBhDpImnSr0vu1j7rNwKCk0oGoZ+QBkC6GK7gd5+aRs991bvOgyYWwWC60C73nD7yj9CcilY
	8709IoXdhBRo4gWlZVyyQFWG9JDnE+M1O/qGch4QqiNhoosiZAiahKyRrl59OE1Nt/2j+r2sIH+
	BSHd3xNLmVpF+
X-Received: by 2002:a17:907:9481:b0:c26:1648:a069 with SMTP id
 a640c23a62f3a-c2a15e529e2mr150203666b.36.1789715293450; Fri, 18 Sep 2026
 00:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
 <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com> <20260917221857.GA4056431-robh@kernel.org>
In-Reply-To: <20260917221857.GA4056431-robh@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 18 Sep 2026 11:08:04 +0400
X-Gm-Features: AcwNN1V38kIzvvjNiCjrlXv4QyepNlxjuEonBAUHUeInRScoNnYe7tr3v4fBPpk
Message-ID: <CAKTNdwH6E5=9gZHB6tdianC2+1aDv4wnLmvL59kDW-dR3a12bg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_000815_701664_2EBD6E2E 
X-CRM114-Status: GOOD (  37.57  )
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

Hi Rob,

On Fri, Sep 18, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Sep 10, 2026 at 06:48:33PM +0400, Alexey Charkov wrote:
> > On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@flipper.=
net> wrote:
> > >
> > > Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> > > memory, and Rockchip bootloaders use it to give boards which have no
> > > dedicated storage for a MAC address a stable one anyway: they hash th=
e CPU
> > > ID and patch the resulting addresses into the device tree they hand o=
ver.
> > >
> > > Kernels started without that fixup, e.g. straight from the SPL in Fal=
con
> > > mode or by any other loader which does not implement Rockchip's deriv=
ation,
> > > fall back to random MAC addresses which change on every boot.
> > >
> > > Formalize the derivation in the DT binding and add a Linux kernel dri=
ver
> > > implementing it, so that a Linux image can use the same stable addres=
ses
> > > regardless of the boot flow.
> > >
> > > Only RK3576 is wired up here, that being the SoC I can test on. Other
> > > Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 ra=
ther
> > > than 0xa on RK3588, for instance - which makes supporting them a two-=
line
> > > addition to the driver's match table plus the layout node.
> > >
> > > Patch 1 is a prerequisite fix. The OTP hardware has its own internal =
state
> > > machine which only works correctly with serial access, but the curren=
t
> > > driver serializes nothing, which results in timeouts and/or corrupted
> > > reads (e.g. returning splicing a TSADC trim value into the buffer of =
a
> > > caller asking for the CPU ID, or mixing up trim values of different T=
SADC
> > > callers). Hence the Fixes: tag and Cc: stable.
> > >
> > > Cross-checked on an RK3576 board: the addresses fixed up into the FDT=
 by
> > > U-Boot match the ones derived by the new driver, and the driver corre=
ctly
> > > assigns them to the network interfaces when the kernel is booted with=
out
> > > U-Boot proper at all (via Falcon mode).
> > >
> > > Sashiko also rightly pointed out a use-after-free in the nvmem core w=
hen
> > > a layout driver is unloaded leaving its sysfs nodes and the postproce=
ssor
> > > function pointer dangling. This is fixed separately in [1].
> > >
> > > [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16=
bebeb518@flipper.net/
> > >
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > ---
> > > Changes in v2:
> > > - Switched from a scope-based guard to explicit lock/unlock calls in =
the
> > >   OTP driver to avoid mixing styles in a function using goto error
> > >   handling (Sashiko)
> > > - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-=
v1-0-ea9135270fc2@flipper.net
> > >
> > > ---
> > > Alexey Charkov (4):
> > >       nvmem: rockchip-otp: Serialize reads
> >
> > Incidentally, patch 1 of this series also fixes CPU thermal throttling
> > on my RK3576 device: apparently, the mis-read OTP-programmed thermal
> > trim values broke the thermal governor logic, which now works
> > correctly with properly serialized OTP reads. So it would be great to
> > have these merged.
>
> It would be great to have the sashiko comments analyzed and replied to
> as well if you would like this to be reviewed.

Of course. One code-related comment Sashiko raised has been addressed
in a separate patch [1] which is still pending review. The
binding-related comments will need to be revisited, as I'd like to
first explore the idea Ryan proposed in the adjacent thread [2], as it
will change the approach somewhat if it works out.

Best regards,
Alexey

[1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebeb5=
18@flipper.net/
[2] https://lore.kernel.org/all/20260916123355.4507-1-untilscour@protonmail=
.com/

