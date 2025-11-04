Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F3BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 20:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2ENbKwT7lv9tz28/K2qju3sHWO/1gvFfQERib9t/N8=; b=eZ3N+gKwhsXdZZ6I+ywf548q/T
	iQIecg50sCljtqYhVNSebQ6E6itSmdZxKACGQj7aRn7+9Kd9kOFAJuuHOTZWTHMf9SS2+vSuaYFM+
	bGBKN8piZZDMYxJuVIYJIV2jmL1/4BxM3MqdJYjHtOzLvTj1vNufzGDu/5yJb2fIeLWJ30pl69zhi
	wBbECDz69dRHMnyCLiPwwNF8Xg8Ea+OLuIn796+u8Tk1YVTzhA5JetVsi/0Vk9hFOoh3Zs/WtQnw5
	K8kQUk+K4g70VBygBUewCRd6PHFy1TMxrMp2dPrl2bZTS0ECScqhHLeMZyPfwzTFMqAgsTkUxMgyn
	y7U1JPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNtG-0000000CZBR-08qq;
	Tue, 04 Nov 2025 20:44:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGNtD-0000000CZAy-3Kgx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 20:44:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5942ee7bc9dso2223067e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 12:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762289065; x=1762893865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2ENbKwT7lv9tz28/K2qju3sHWO/1gvFfQERib9t/N8=;
        b=EviTNDd+zqnRxtkd4HIYOdnYoeoalY0rtgz/tTNs11Kb7Hp3JMCf9LdJggnK4xbriR
         viySEzy9oaPn95whe8DyEo+dkhL+TcMrBMeGAa4CLvsqj9++Uh9z6e15hMqDjQommKK8
         DyyFA3Mt9fTJLZIjZNtbIW8lSb6Ns78lbuvmsC1plfXLY7J1Nc78O9EwXMHDDAPRl1IO
         CtNCA95X5juHwx9d91am1CHirbCKhyS1BncNtwNPIJkHOLyA69WnetO3XogBar3iGtJz
         ZCp8kHWjchzQgah4Wg71T3VNDQ2wlaBO+BXCtzm8naXUrj+ySkiORWn3fZEYQ1vWZMZH
         0bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762289065; x=1762893865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2ENbKwT7lv9tz28/K2qju3sHWO/1gvFfQERib9t/N8=;
        b=ZaCteWbXtAN49YLetO/oMdQWATiGX3CZQIuSnCQ1qnd17DRZqqT3BzFzJ5kWvkwIIy
         5Ari88cH7gdWZY1btnK6h/Q5DZRDNeQrX254FNClArLAIcgYv3mgN1rgrJ4p77+VIQl+
         nheHmMNisjj3b8qg4ILyTpLJ1dY2zmd4/ht1C8SCe7CDujSYYA1Xem7tdGzFIRRGrAWz
         ESrIB+lIPiZSttPOtxNd2xVzyqrNAvRejW3AVasf0FoMTdMo3ROAAq/zsjpDoF5vkvq4
         bTolFsIrMsc5Gdl26Kg1sRzIjvWkkWQfxqf0sugleAywmJxleyZaakR+BY2BQEwOoBhZ
         9H3w==
X-Forwarded-Encrypted: i=1; AJvYcCX7wWLwliO7Kskd5UV8/8WE6rgsk3eSK6WAYPcJziBH/6iB9dOg6fuqPo5THg2RqQPZsFdLv5hAFHeYU1zW/XQS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+K/GxK6bCDJjDVosmsfKrWh1r9O9Kg1w19MOFOdXDVSBu+bc2
	6p3gdRLE0E+Su+UbvBWv7OKUZc4w8CMbtEPS6ffWNcyAj9HSPMH6zNh36CdJZ7W80NzaTON1B0F
	shGePkG9rNctEXpYPdEcsdwPt6xlJjzU=
X-Gm-Gg: ASbGnctW0taojgMNBg9u/Ez5K3iE5IXa937RGoLhbXCH7ZxBc8vw7wVtNYYdR+BI1am
	m4ND4OdILfS3hRwnZj2S8P5GHVYoFQnSBBR48NSMx9618l+DTHrpPJkFl1mf+zqkG3OD8prdkZr
	xefW9oPEGch38SYzza9CyfBTaDEq8yyy7MZPdQWa7KBM53lW9djsLxW7Rl484oyMcZ/YeWWmJG2
	UDTDvuAI4Cc2UYR+fSPuM61mMUuaSfxe97QGy4pjBHImmXpWw+W5PlsQqaP5z+nM2lcfDyxnU0B
	dyv8MrPhWT5tc25Z
X-Google-Smtp-Source: AGHT+IEgyDz6GgQ36aOhYZfcy+M9mJYKbg+MSqwHomwdqA+8oevBdUI0GcxGO3WedYpy3mCE8otuQ+c7+LgGwJyJeBc=
X-Received: by 2002:a05:6512:114f:b0:594:3c08:4f05 with SMTP id
 2adb3069b0e04-5943d74dd99mr147323e87.14.1762289064896; Tue, 04 Nov 2025
 12:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20251013205155.1187947-1-festevam@gmail.com> <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
 <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com> <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
In-Reply-To: <37b8d968-a725-404e-8fd4-84c2a0bb464c@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Nov 2025 17:44:13 -0300
X-Gm-Features: AWmQ_bn9ScRQzwOew3nNnHj8C-mT5iCyP0mJjFFvOaLk_a5CcV4aEWSlDVa3aoE
Message-ID: <CAOMZO5B+VcGxx9Xa6FFXxeka0qcqBmATrartguqMLMDK4fGduA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: Liu Ying <victor.liu@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_124427_866494_C655ECC2 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Ahmad,

On Mon, Oct 20, 2025 at 11:53=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrot=
e:
>
> On 10/20/2025, Fabio Estevam wrote:
> > Hi Liu,
>
> Hi Fabio,
>
> >
> > On Tue, Oct 14, 2025 at 1:12=E2=80=AFAM Liu Ying <victor.liu@nxp.com> w=
rote:
> >
> >> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX=
28 LCDIF
> >> because at least i.MX28 LCDIF has the version and debug{0,1,2} registe=
rs(at
> >> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.
> >
> > There are some DT users, such as Barebox that matches against
> > fsl,imx28-lcdif, so we cannot remove it.
>
> Hmmm, it looks like software projects like Barebox don't really follow th=
is DT
> binding.  Is it possible to fix Barebox to avoid changing this DT binding=
 by
> this patch?  I'm assuming that Uboot has already been fixed.

What do you think?

Thanks

