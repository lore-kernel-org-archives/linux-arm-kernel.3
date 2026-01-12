Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24EAC9EC97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjpZhhJ244VWi152mVXLmo02ttK8tRkSgyHzO6ob+m8=; b=q2mdaBhdGvg1qUSyI/GxJP4Qgi
	NnMfaV1VPPhZu3Bi8ToeVvslAa0H5Kp2Kn5BEJF5W5h74ESBbjMbqNlDMUZsENP8s2TWxNg9QkkFK
	IlXB1vMg+PoHVFxhTf8NvylFSgK5u/RPqzUkSEXYe66mGqgCPZ/hltzM0g+B7wOckENiTVKBYNLsH
	o2Zou7sWzygFtn4CVfQocJkBesEhjyAn5np3KF74QyVgvAYOYF2wJgzZ1rAbLHxwr1AJB/mvxhuLN
	nSuiIQhkvnRzgVN+zyt70UyWiTkvjnKG4zmuBIkNE1uIbsqwsqrq8N+AbdhL9ZM5QckEMgj4lBmFK
	2lM/Lhbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJeo-00000005cWa-0jtC;
	Mon, 12 Jan 2026 15:16:38 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJel-00000005cWC-2Ihj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:16:36 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-121a0bcd376so2116977c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768230994; x=1768835794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjpZhhJ244VWi152mVXLmo02ttK8tRkSgyHzO6ob+m8=;
        b=Q327IDrU+LY7mENNn78OdxejyJnXMcfpNUXCzUJbzn8GwMiqGRp1I+n1wMbG9gerbe
         upXwdkJ4ye7IjBeB2SsgU1lNAT9YJbuknka/LsCoR66o4TJ3o9nPSqtu7r2QAP/Pfppz
         3Xdkn0fOVMv1tijV3G/OS/WajxwPQZZBSauCxKFPuccxpstwdXbncRrNvf846V8xqri8
         luPQU861edaZxkjMF2g1VsAsX4CE55uDzYHXGmjbB9aQ/pYvrsha2PiScR5KU2oywkRl
         9RHUKsR7KmUuCHP6Fcb82ueDbmQpFVuIU0QvggDxBg0pWCiYQQo8o8c7fIP+bl4EEO+4
         skDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230994; x=1768835794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjpZhhJ244VWi152mVXLmo02ttK8tRkSgyHzO6ob+m8=;
        b=XF6GvUcUM1JYKM8q679WL951G1W6iUcT8rwxF1OIsubGziVXhoJTOu4+RaUEWskeex
         6CfCztWnyG8ikc67zJsgyL3v3Xs3bK4AYXg4PGRkHDaRgDLhSd5qKE5+26L1UazZQ9rf
         7VDdvBNQLekMX7sJYRDr9uciu8sxUIKUlDrYVvWo+Vvh1hA4qp+c5oVOLKvSAOlUE+9v
         ZigA02zCh0kQVTaSyttCkyY7XzVhSiL3bsfWfUlNaYvH9c+FsftQkiVkEVlA3L8mUx++
         S+YePNqtPAAl2Z6HKjXlzjeoRDkhI9K9KLGCzUPw0xjuyXN8XfQIu83o4LlyAbAh7Ahn
         nuUg==
X-Forwarded-Encrypted: i=1; AJvYcCVGhEgd30dkbIRL3xOs10vf8kDW5+j2BriGO8mKiFo7qgHeR7sukJoZTqc9aAwtEW1yb7dYGjXJu0CtA/VcH7/N@lists.infradead.org
X-Gm-Message-State: AOJu0YwbwJ5kChG/aPygwc1H4AFZ82VB4/plV5HayROYH+DHFDupDVra
	e0zKyfCzoDbeCK9yn37o8Xy68WXbzAw7FihCwVlpYRQTO1L3PC/dAwxn6kY0+XdIf39qAutnlUA
	GCJcq/2BRCcgmx941W4h++pJfbA2vhMI=
X-Gm-Gg: AY/fxX7iDa8ClBr4jg/QfoFKRsRRN1gJFGmmLbUq+Ix6zg9wPQ6qkdPoNh3PnVTkFtK
	0ZGHDBX3De8njYD4fXaAYmyRIQaU3XBbAyDLP1DkxsuBb6PDovYsKlfGUxfVsHElbp0UnhslRBJ
	1XHlbXJb0rRsTBKCmLsoFVTLTE+bye5BXv0n6wI1U3T7WlJcWI2ohid2oGlbLI1wWiIoxBD2mqS
	Xd2xqnXwZr23KhLlkqzjqacjL//zXSy4fzCf4yEXphvuYYYAsPUWyLwwlsKBgDwYOeDxxrQEt7Z
	JeqaZ1as/H807PZA9AM5HIqdsf2wcKypEJ7xfx9UI2H1REgAVqjA165k33e9fs4XgjbCKKhVdqS
	v2C3JS+rPgw==
X-Google-Smtp-Source: AGHT+IFHlbgIEWud1+76aPHPsc3g08WULKUxffQ2bprxJjF72yS3WxmIzikQjlBxRi1qrqgHsYBgta6WOtv1vz8/Clg=
X-Received: by 2002:a05:7022:698b:b0:122:2f4:b24b with SMTP id
 a92af1059eb24-12202f4b38fmr14259478c88.25.1768230993994; Mon, 12 Jan 2026
 07:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20260112135612.465325-1-daniel.baluta@nxp.com> <CAOMZO5D_YMfsPpqB4zB4iL+ENO1X31Go2CcBdK+JcmsaZ_HNNQ@mail.gmail.com>
In-Reply-To: <CAOMZO5D_YMfsPpqB4zB4iL+ENO1X31Go2CcBdK+JcmsaZ_HNNQ@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 12 Jan 2026 17:19:02 +0200
X-Gm-Features: AZwV_Qi0Oev2XLPh0w5afRLy2ZMfDu1SdsID0r_7FwML4hd7i3jYVe7anPJW1e8
Message-ID: <CAEnQRZAU7xEGtK-d-KM5e3RcW2ayASAqwZsU2VGLAzvJZwzQng@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx93-11x11-frdm: Add MQS audio support
To: Fabio Estevam <festevam@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, haidong.zheng@nxp.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_071635_589439_13511DA1 
X-CRM114-Status: GOOD (  12.06  )
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

On Mon, Jan 12, 2026 at 4:38=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> On Mon, Jan 12, 2026 at 10:53=E2=80=AFAM Daniel Baluta <daniel.baluta@nxp=
.com> wrote:
>
> > +
> > +       sound-mqs {
> > +               compatible =3D "fsl,imx6sx-sdb-mqs",
> > +                            "fsl,imx-audio-mqs";
>
> Wouldn't it make more sense to use compatible =3D "fsl,imx-audio-mqs" ins=
tead?

Yes, this is a good catch. Will fix it in v3.

Discussion for future patches:

1) is it common practice to always have a more specific compatible
even if not used now.

e.g Use

compatible =3D "fsl,imx93-audio-frdm-mqs", "fsl,imx-audio-mqs";?

2) The current compatible:

compatible =3D "fsl,imx6sx-sdb-mqs",
            "fsl,imx-audio-mqs";

is already used for imx91-11x11-frdm.dts so I guess we should keep it like =
this
as this is already ABI right?

