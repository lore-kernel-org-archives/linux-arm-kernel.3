Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED0CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUhpJFgsMZVEJ+Ov8K52J/IYdmDiOnVaXTCkhSx5Ngw=; b=rkFT2cKSrlUwJR9RD4EGvhBofR
	lpyzUeegCVfUnfA+MSp1HSmoI4D96Z63HdDZWC612El56MNw3h5BmHPzAdUCRHTp2tl4Xn7+fRaCt
	HXao07jkkWGQT+AvyVBsm9A97F/LyXBlTZaBTGikdjU74Iadzd6Gb0s1Ih+5aSt/RVfv5v4Mzx0bZ
	vCEwkqqpMMKW6NFF3MZKgFKipQmxabNAmQPKbg8Ort3lMdupttRaFU3/j6P/d2MAYohUNCQXUEX6r
	awsm6TCkV7+xCrCMgT0bpkG0VCCbPWUZ0bXA6feuRfipoE/731X472mD3+gTC4GsR9XTbkJ0J8GwO
	Wfi8MITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcLv-00000003xrk-2U44;
	Wed, 20 May 2026 08:32:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcLt-00000003xrB-46WE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:32:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BEF34442F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A191F00896
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779265949;
	bh=gUhpJFgsMZVEJ+Ov8K52J/IYdmDiOnVaXTCkhSx5Ngw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IVsWtkgtV6SwkfyILExI4WrESo3JbjMpYMgsRmZdqPUDBHDIlFUnIjeYniJi7+rNB
	 oqmvWlLYZ/uqDsTYQiEeee99B52hw9eNor7uiGgf4/dzeilj3s6pj9lXWBOC6J7eEj
	 2ji+gJHWcg7sDxfhEAnZCV3HmOhk+tx8fGcXylySM8aAuzzMqu1xJ9KNdRF6KqmkrC
	 TmXD88oJBBrOvkM6m7ACgUNHocIxK46T7RqOPNnP0iBAGmxH+uH6RxVQlb/SwCpI/x
	 1wF6AWsteqscsi/65+W4Djnhetu0aNnuLInMvOKEI1kR9sgHss1hJJHdln7Ol2jQ/t
	 QbEfYrmhb535w==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39380e79936so48907801fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 01:32:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ojukbwemGYwHc9ZaTF3evW7SNHNd+6PYiSR5VnUxeP8UbvJHK2ZmjWo41QiEphVM7iF2ZDDA8xwdSyRnyvm9i@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr/7Blsus7wxV19sHHHfacnyENJVikX8toe0h7e9eOPEhBJTM5
	2p4tOTeXcagw9qYOB9mOoWBAjsWNWMJvHg8SZsDXCdNtbgjaUiv1UPUoKvEdCvdMHelEKICVb/D
	08GwA1zcWL9o+3PqeDhKiPXkmAmMScwUdPxFQLtPVEQ==
X-Received: by 2002:a2e:928a:0:b0:38f:ec8f:8d53 with SMTP id
 38308e7fff4ca-39561d80de3mr50583391fa.21.1779265947938; Wed, 20 May 2026
 01:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260430143221.108382-1-bartosz.golaszewski@oss.qualcomm.com> <CAD++jLnm2sPEQQ7cN9Ci+jhNfB=WC2g=36d_N4upyxYUsmN6dg@mail.gmail.com>
In-Reply-To: <CAD++jLnm2sPEQQ7cN9Ci+jhNfB=WC2g=36d_N4upyxYUsmN6dg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 10:32:16 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md5wDV+w7awoiiBoFVG24VEfH8hKvH2VP7dtcRX3m-Wnw@mail.gmail.com>
X-Gm-Features: AVHnY4JYqHTbRNHz6TJMPB_RsunTv1Sp56eLTQXUh0vhnCv4EJ7L2kU2zR4l_Dc
Message-ID: <CAMRc=Md5wDV+w7awoiiBoFVG24VEfH8hKvH2VP7dtcRX3m-Wnw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: Kconfig: drop unneeded dependency on OF_GPIO
 for ARCH_MVEBU
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_013230_042965_CFDF5115 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, May 5, 2026 at 12:42=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Thu, Apr 30, 2026 at 4:32=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> > OF_GPIO is selected automatically on all OF systems. Any symbols it
> > controls also provide stubs so there's really no reason to select it
> > explicitly. ARCH_MVEBU already selects GPIOLIB, drop the redundant
> > OF_GPIO dependency.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij

Arnd, can you please queue this directly for v7.2?

Bartosz

