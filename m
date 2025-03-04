Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF58C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA6n7Tk6ZRco5Uoy7ute4MTebhJQTrRMnucOQVIkMHA=; b=xUwoD3wCFQ0D/PMWljaBZICoF6
	IVBhAGLB1rXH/PUN4sOf1i/QrnNi47PxU8nO8KveURpJWCSQ/zSLHhJBMH1YTKdAqh42NPhmonJ8g
	KCPPdX+fG5gszwyxIPXQiZX3r1eZosQ9qunIxdDUsnSU0bCMx5J/nKGtncrf+hQhtp34R3xX8x7bX
	xJ1YOGiDBrAzPmLFc8fJcP+lzBglz9jbKcPfvPSasfSWSKpFWg1o8a/9l0QqywZiZod2Eqe0Bj2uO
	0j1WaEJ65/or+xnLfDg2WlIVFmMDlstwLjaJRbbDwYeuuPbbMCuP3SbNUZ0p5Z1YHK7uie6378S2i
	exKPvY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpW84-00000005e9x-2FX9;
	Tue, 04 Mar 2025 17:32:28 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUW4-00000005HrG-1DK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:49:10 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30ba92c846eso31204401fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741103346; x=1741708146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA6n7Tk6ZRco5Uoy7ute4MTebhJQTrRMnucOQVIkMHA=;
        b=faAQ5YtLELwffpsh7jhbYKPnnz7bHkQYTzFUy9TWiYstGhPHqq/o0VP6CGHln6S1xN
         JmX/ezn6jbLwpb/oLz/W0bcX99CWhXbjpvZVmsnWMsgcjeicOHQJlrYUoKmwpoD7tdDj
         U5Cn5C4ovHO2irRvKJ55/U7SrO2CDv0aEfFt9Br6CQ+dlAMcaALdVblldzjeRs1Z6FVA
         qU60K4ozriLT10wxKzvhzSjkaZEslDHLfCni8ZImzx8LTeEVzlMltHUIjHMvm8H7ptIy
         4yhdHNDvAvvw9i3MTIB9+OuOXc6tA3//3QDpmj9EDNRzR/b95dl5NgJ48N+UxZokRwtV
         Gu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103346; x=1741708146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA6n7Tk6ZRco5Uoy7ute4MTebhJQTrRMnucOQVIkMHA=;
        b=l4B7cczP0GoE7v/A+asumT3b/oZz9PZAZ0M6dmbEGiYY48LABgOgaMlvq4gpcHzDH5
         cKVqsoiNPp/kvRRSeFmbb0IPuhsxJaI+sOmCsxsJivCd1squM/UdR/LuRTnjpeJ91NSf
         Ub31oMlC8SkSDhIlE3OcRR+4BCwpW8f1dYjlGNjw5mQsg/OVuM3ik8VwW/nbBgZLKrDR
         TVbrZIMCJziyYUIegcYAGDEHfRIG0n2sKQIeWBE0oagGY5snHOzLJmFhCGzlHVi7aD4U
         BfEJK08bx1Oy5mlW42luaDrgtxWL3rOKn8HOqbnoAMmOEWEmuy+Ustqb3XbWl2p4hEDS
         8Nbg==
X-Forwarded-Encrypted: i=1; AJvYcCVSV2EZAbAGY7nmuGIAG7EKhy0i7NjeT+vMI98w92nwuGn+frHufHkli00fV83ZZk4Gj0N4KYpaiM1HHmvQTOe7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsj7/jaYm4NzMGjf5rUZxQ8M13iz6jGO32rFx2qCysNLjS7R5M
	wJzMwTc/5hueBc71VR+R6WHxVnk/1h+G+4lLgyHlj3UVC0TZVICQ6CDAt1ftxAgyuLX57D6/Ng/
	1NthXBWXnDtypV+iWjXyQAbrGKUNE6oMwjgVS0Q==
X-Gm-Gg: ASbGnct+lcHixW1AmCgBgci48WiNZWz8xpCB0eWJAA+1eEXP+DvByfSleUs/KoCBo7s
	0i836Sfy9DHIe2dDWSb/9G6E9Z2z+RZ2pZb6bFYm9I67GkDnY0hX+Lsm3cauwxgRxIVV7V3Wi0p
	8/qGHAucydErn09mhn9nAjQWPleVXvvvC+Xr492/rjMOg7MU7hgbzUS44oqA==
X-Google-Smtp-Source: AGHT+IGNYxY68hSY04NHeDnGF45WuYW30TweqyCBwT2x9jUZoSI7dfONpy9h4GhUJmNMztNWJp/TupvscySj3TQu+14=
X-Received: by 2002:a2e:b890:0:b0:309:1fee:378d with SMTP id
 38308e7fff4ca-30b932531aamr67179271fa.19.1741103345563; Tue, 04 Mar 2025
 07:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
In-Reply-To: <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 16:48:54 +0100
X-Gm-Features: AQ5f1JrZSN7a9veGHD2nhdiFznQ7s35dZW-f_2MRRUu_xgWuisKdFa1xTMAGa9g
Message-ID: <CAMRc=MfqNSZeQxBuEfM1nAo0F3NmEkyG-Les3dyxxuun=4XpuQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074908_558076_FCA809C9 
X-CRM114-Status: GOOD (  10.32  )
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

On Tue, Mar 4, 2025 at 4:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, 03 Mar 2025 09:41:40 +0100, Linus Walleij wrote:
> > This drops unused includes and converts one Samsung
> > codec to use GPIO descriptors.
> >
> >
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/6] ASoC: samsung: bells: Drop unused include
>       commit: b19d340d5d08c5940ce612c2a1b5fe3a8a401f9d
> [2/6] ASoC: samsung: littlemill: Drop unused include
>       commit: c4b2d9643a06a5326a778c4d77d6fa60e0f3d6b1
> [3/6] ASoC: samsung: lowland: Drop unused include
>       commit: 5c06f7f3d8374df1cec3b353306a4d1032a60f44
> [4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
>       commit: da9146c19b1774926148ff271c4a3dc8d7891b18

I pointed out an issue with patch 4. :(

Bart

> [5/6] ASoC: samsung: tobermory: Drop unused include
>       commit: c095b7a27529d1d18b3b36a47f77a1419f0de939
> [6/6] ASoC: samsung: tm2_wm5110: Drop unused include
>       commit: 0a22454ab2eca530702b2689858909b608953703
>

