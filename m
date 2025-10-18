Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03952CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 00:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCVClA/PZ0uZGRS4AfUm3xUrlpb2SVIYbrS2oxr+V7g=; b=4TFsFX7syiUUwqY4Jg9tSn1JxC
	RjL9tbU9kPIAQ/EdxiMXbKmNCvp6bZAzekcOK9Ckj5RqYuaNQ9xDGMCYnZ+pSyg0R4arIyLIAs0Hx
	m/PZ13SITOJ5xIBuWoLNOFK5fr2wXvMComc8XWU0gC7uqk+EgHp4ZRAMUq3pBNEkHECskossftsIS
	o9vZOWB3es3aQDugq/lw+ZgC3ayvdsRL8bWAWZVyjB1EhrZiUitJ/xQ0LKkmpULtDbFwKc5k3SW6m
	MLC8/OasE8rifGB/IWkX3K78I3dRSX+WmZF31P5X3DlhlWuLC05Ndeff60wPAzBSkG4tWwXkAMjOq
	d9YZYR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9v1d-00000009HlD-3Pp0;
	Sat, 18 Oct 2025 00:42:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9v1a-00000009Hk7-0qus
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 00:42:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso1824022f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 17:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760748140; x=1761352940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCVClA/PZ0uZGRS4AfUm3xUrlpb2SVIYbrS2oxr+V7g=;
        b=kTb9lrdWcSpqAKvsNzj5P/Qqjoclc5+J+Zhl/bvndEJiK1sdQSHA8Ykw5R1Wgyu2n9
         5OjIM1ZjwH5/oQjMWxZ3N9QtJMm+9nhp1mdtBia7PwRRBRZkQ5pIn57hWo3Rx0z7/TbR
         Q59caLbpnD7bE94Wh2Gvb2qElg1sb5hNya61g0nIhEvDFyc+LHVUDD+FrzuTvNbXcZ4x
         YM4M01Rw5FlhrpAttN9UFwb3c4alxmgJ5gTARxvPZ8iPdt5XXSpQjqW3p717y3B2iacZ
         x7xCQ2TzqB8slImZbjhGHVCaJvXNjeOcMDQfpc0ltrDF+07zdYHl8ZXhuPT/ggqlpBYn
         4TIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760748140; x=1761352940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCVClA/PZ0uZGRS4AfUm3xUrlpb2SVIYbrS2oxr+V7g=;
        b=QO1Rxd8AjDXAf35zQf+LCjCAdpeakerjvIXDOc+aXIRjH2G2uo0547RI3R5boKXTYg
         nB/qvpaQZLEzUSLly799kO+3jfq+UMeBczlnyL1njF9/6HgTpmKtyy2MESKFJsCQQhUZ
         d7DBXCpSEaaD5SfUM6t0bcb2GrhVCkbHkih8c5rASFJykMV4XMh6mufpUqtvawZjrkyU
         tGDReU8NAZJMVuWdZbfbsz5Jet2MvB1n8Nu7MSLDL/zm9a19gHzDKinU/+f2KpXX2MCy
         WhwIegRdP5vOd/bdCfjxrGnh6kX5u98CstDUi+MjGYGexHfkTqf7vqBOmyHswh6olFSs
         O1/A==
X-Forwarded-Encrypted: i=1; AJvYcCUtwg5cxA60U+MQVepLqPJEpVOpFVULaOCZanx7aSzqLY30jlpeQFz9LfiTxQnNY3hCsQltWx0NNCg+EzTgTZ1q@lists.infradead.org
X-Gm-Message-State: AOJu0YyQhNzTnn3Buqial/i/DwJrAwAr5W791s168Q2IoJZS5cXTOppM
	7ocxb71aBkhDC6qHFU+6yAhKaWcNcU/9Jvphvh16D7SCPslncWl/C1m2eh7Uu9ALmmPx2lgM5nv
	rHXk4Zc7DNYU5ShuTEBfszFqWjW9yRtM=
X-Gm-Gg: ASbGncuZK7+HEMOy9F94CF13tG1rl510dzQeN5gBOca6ODb2iJnDJgvuaRSBOh9MLxZ
	DeIN1nCK49IC1aXgtHN61dT/CLJcYMY7qM8YNA19pu/Hkn80HMZ8ueuMXA7XilK7cyCrTmxKDuR
	Z3NLIBA0B6Z/QqFDo+6tBw6oUj8a1JFP588V0tgHJgI9XBDvgHuNmJibyeWX+sQ0bhpfTMl0E5E
	01jr6SIbzeB0tnIlob88FeQCFnTVZe3m+asMJfYNyETdbfsz11QDbcZ/uMMyrlSPfikN5Kqw9F+
	fnqxrAVJjJpKOYWdPBjAW21MvJE=
X-Google-Smtp-Source: AGHT+IEnZJdKEv8HpBuO5avxk7qhlo5bK8j/kw4uDQDaUY5tFqvMdnLtIwWLG43QGsF9cLs4FirJoib+MaszcUlXcUU=
X-Received: by 2002:a05:6000:3113:b0:427:7ec:ea41 with SMTP id
 ffacd0b85a97d-42707ecea7bmr2787799f8f.57.1760748139778; Fri, 17 Oct 2025
 17:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251017073954.130710-1-cnsztl@gmail.com> <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
 <d9d14ce2-2e65-422e-95fb-eb30b128ad90@gmail.com> <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org>
In-Reply-To: <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 17 Oct 2025 19:42:08 -0500
X-Gm-Features: AS18NWD1YMiDaJdbECom22kokRcA-tOWvJZCxltW1Yp4Akxq7VR2jmB100bExfM
Message-ID: <CALWfF7K0=J3E-zr41wV-28+SCFkT_so55Aee8BvQsB4KJZy6YQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Dragan Simic <dsimic@manjaro.org>
Cc: Tianling Shen <cnsztl@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Jonas Karlman <jonas@kwiboo.se>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_174222_253802_31EF4F4E 
X-CRM114-Status: GOOD (  31.12  )
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

On Fri, Oct 17, 2025 at 10:15=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> On Friday, October 17, 2025 14:08 CEST, Tianling Shen <cnsztl@gmail.com> =
wrote:
> > On 2025/10/17 18:25, Dragan Simic wrote:
> > > On Friday, October 17, 2025 09:39 CEST, Tianling Shen <cnsztl@gmail.c=
om> wrote:
> > >> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> > >>
> > >> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors a=
nd
> > >> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
> > >> stable operation.
> > >
> > > Could you, please, provide more details about the troublesome eMMC
> > > chip that gets identified as A3A444, i.e. what's the actual brand
> > > and model?  Maybe you could send a picture of it?  It might also
> > > help if you'd send the contents of "/sys/class/block/mmcblkX/device
> > > /manfid" from your board (where "X" should equal two).
> >
> > Unfortunately I don't have this board nor this eMMC chip.
> > I got the chip model from my friend, it's FORESEE FEMDNN256G-A3A44,
> > manfid is 0x0000d6.
>
> Thanks for responding and providing the details so quickly!
>
> > > I'm asking for that because I'd like to research it a bit further,
> > > if possible, because some other eMMC chips that are also found on
> > > the NanoPc-T6 seem to work fine in HS400 mode. [1]  It may be that
> > > the A3A444 chip has some issues with the HS400 mode on its own,
> > > i.e. the observed issues may not be caused by the board.
> >
> > Yes, it should be caused by this eMMC chip.
>
> I'd suggest that we move forward by "quirking off" the HS400 mode
> for the FEMDNN256G-A3A44 eMMC chip in the MMC drivers, instead of
> downgrading the speed of the sdhci interface on the NanoPC-T6.
>
> That way, the other similar Foresee eMMC chip that's also found
> on NanoPC-T6 boards, FEMDNN256G-A3A564, will continue to work in
> the faster HS400 mode, while the troublesome A3A44 variant will
> be downgraded to the HS200 globally for everyone's benefit.  It's
> quite unlikely that the A3A44 variant fails to work reliable in
> HS400 mode on the NanoPC-T6 only, so quirking it off in the MMC
> drivers should be a sane and safe choice.
>
> If you agree with dropping this patch, I'll be more than happy
> to implement this HS200 quirk in the MMC drivers.
>
> As a note, FEMDNN256G-A3A44 is found in the Rockchip Qualified
> eMMC Support List v1.84, [2] but the evidence says the opposite,
> so we should react appropriately by adding this quirk.

When adding the quirk for the A3A44, can we lower the max frequency
and keep the HS400 mode instead?
That's what the Fedora folks found works [1]. There's more test
results in Armbian [2]

[1] https://lists.fedoraproject.org/archives/list/kernel@lists.fedoraprojec=
t.org/thread/MCSDYDQVOXS5AZMKA7LLY4QX7JXBWPCA/
[2] https://github.com/armbian/build/pull/8736#issuecomment-3387760536

>
> [1] https://github.com/openwrt/openwrt/issues/18844
> [2] https://dl.radxa.com/rock5/hw/RKeMMCSupportList%20Ver1.84_20240815.pd=
f

