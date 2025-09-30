Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F146ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 23:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPpKPRQ56kkYxcQG1yY8q5N+W72Xlpbb4ePjY/4r2P0=; b=KW8QtvgdfxlaluaEVEtwTiANBY
	bc2cvkfkxD4HQfAaA3urz3Jp/L2WckZJ9+06tZsiEhFEz/rWkIVXiyKqGVMpMWql4xWWhMmRJ43+9
	Pjbzlg9Qchr8IODUtBRgj+xfGbIJv1OIXRWh0VCzg4OBFcgZ2mEUkb41Clf+G2MNW+C3I0nbErVEq
	b5moITQzMt71uyT2Jymq4JSY9mcoLAf2eSHvLZyy3AUnkd0CmQQYIr2l/nGWrRRMqdpoC7IVgkISj
	zDz8Fjpo6PBDSMFcFCBO4iVMAU/A3+MGX++LnCGHqpAhUHxgM/VCA0aOH5p0D81Uv09y2jHFMo3hH
	68MW5DWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3jQF-00000006LBa-3rqp;
	Tue, 30 Sep 2025 23:06:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3jQF-00000006LBB-0qro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 23:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 583F46125E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 23:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0164C19424
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759273573;
	bh=mFz+L72B9DjiruUWCPt3+uUkwCHLqPB81lzn9f7L9es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TLMYUycydyqqjUP15CWlEFWzraN18TkKIePRecxtCkCy1V5Q6/cfOULx67IJAdEQY
	 EFNXsgnj/eXNVpwvz/ZXK8sN2Kv+2EroVbxbQTHggT3RrnWzpqW/+Z+m7tk7o9dfFo
	 sEq6s7AbWNouIEML4E8VJ1WTkAEhu3E135shP2Vr1R/buR2pnuVKgi3JwzjqUc5Wm0
	 DWzbQKPLIcspHPUxfkQnFXFz1R8Rm8sSnElOO/CFIwGkfzxfOMPgGpPyR3P6DpgPBJ
	 o2/bpIo5eTMgdzFUbE3ysoaO3uOcJaWiK5lanpjA19JNzBPG/nwdL23imNUc9InoM5
	 H64dZ454YRRPw==
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso5118394b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 16:06:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXl/s00LOO2T5g528R52BfqjP6CW1T6FKaQDQH/1VhUY0gfiekMVXWmMcLBa7munbF+3K71gSdzxtA/GwYZ+zpQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmd2WjssflfDD/cldyoBVe5ejeqtkcdNFtp7QHtoC0mJ/35vcP
	HPORfzxjflZTS3ge0jh3DEZOs8EbofBsoya5Om4llarPKysKOIdWLVY5nJEURE/LTCuWGWNvrrt
	E4fqdNuO9/CUw+Xg3dvJmf02eYZT0Dcs=
X-Google-Smtp-Source: AGHT+IEtVABxEKyxN7a+U3Kp2sBw7bT8AmKlK9sbcU4p8q7V3u9HMuNYcQ/g3mBtE/Xshs31HBFf6QR4rED4d0MupEk=
X-Received: by 2002:a17:903:4b48:b0:275:2aac:fef8 with SMTP id
 d9443c01a7336-28e7f33067fmr14927905ad.38.1759273573411; Tue, 30 Sep 2025
 16:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-9-h.dewangan@samsung.com>
 <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
 <75d06769-4896-4095-9969-03a517705196@samsung.com> <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
In-Reply-To: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 1 Oct 2025 08:06:01 +0900
X-Gmail-Original-Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
X-Gm-Features: AS18NWB-7qq3WRSu2_4sN54O9Pq__ESSuLB-fBN1o7du1U_PSVDKaJXEOusJU-4
Message-ID: <CAJKOXPchnA2k4sghuSBxA4h=CKJEQU0=09F+AAxPxA-rBpUW_g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
	=?UTF-8?Q?r_probe_support?=
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Himanshu Dewangan <h.dewangan@samsung.com>, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, alim.akhtar@samsung.com, manjun@samsung.com, 
	nagaraju.s@samsung.com, ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 1 Oct 2025 at 07:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, 1 Oct 2025 at 00:46, Marek Szyprowski <m.szyprowski@samsung.com> =
wrote:
> >
> > Hi Krzysztof,
> >
> > On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> > > On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.=
com> wrote:
> > >> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
> > >>
> > >> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> > >> Exynos MFC driver that supports firmware version=E2=80=AF13 and late=
r.
> > >> Extend the top=E2=80=91level Samsung platform Kconfig to disable the=
 legacy
> > >> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 an=
d to select the
> > >> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not=
 enabled.
> > >>
> > >> Add exynos-mfc Kconfig and Makefile for probe functionality and crea=
tion
> > >> of decoder and encoder device files by registering the driver object
> > >> exynos_mfc.o and other relevant source files.
> > >>
> > >> Provide header files mfc_core_ops.h and mfc_rm.h containing core
> > >>    operation prototypes, resource=E2=80=91manager helpers,
> > >>    and core=E2=80=91selection utilities.
> > >>
> > >> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91du=
mp
> > >> support for debugging MFC errors.
> > >>
> > >> These changes bring support for newer Exynos=E2=80=91based MFC hardw=
are,
> > >> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay =
the
> > >> groundwork for future feature development and debugging.
> > >>
> > > No, NAK. Existing driver is well tested and already used on newest
> > > Exynos SoC, so all this new driver is exactly how you should not work
> > > in upstream. You need to integrate into existing driver.
> > >
> > > Samsung received this review multiple times already.
> >
> > Please don't be so categorical. The MFC hardware evolved quite a bit
> > from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed=
.
> > The feature list of the new hardware hardly matches those and I really
> > don't see the reason for forcing support for so different hardware in a
> > single driver. Sometimes it is easier just to have 2 separate drivers i=
f
> > the common part is just the acronym in the hardware block name...
> >
>
> I know it is easier for Samsung to write new driver, but this should
> answer to - why the maintainers and the community would like to
> maintain two drivers. Sure, make a case why we would like to take this
> code.
>
> The easiest argument here why we wouldn't is: new vendor downstream
> code means replicating all known issues, old coding style, everything
> which we already fixed and changed.

And 15 second look at one of the patches already confirmed this:
replicating downstream issue - undocumented DT ABI not following
current style, code relying on some other downstream drivers. 15
seconds was enough to find it.

