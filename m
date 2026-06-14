Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30ECCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=; b=2fjB+vcxv3h5IsmP62eSV7O1ls
	rdGfNp/9zPIQPmdlJ7K24oDc4J8owDE2mMOW7xKTnRHmjiAdSSnjN/W611255MPGFuyMiapsV5vPw
	Rl26TVP6AojaXbSLbG0NLmY3DaBE+jVJJIh5gLEbhcrh155evbfZdZ3tGbz+rXh+vQdSnGSY0xg01
	UJd3doWYxMa8wusKGAVMK4IqZEPhM30oglIJIMYawTNBTWVaJ2twBsDXZjyiinvmMNQV4DNTutijM
	HnnhN5CKTUvLW+L28jtI201SkhzDXlYjltXhYOhm/t5tgpGJfvV8zfrv39ehamTFwajBUI2SFDcmq
	TT4zWLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYl0V-0000000D2qC-0Ukc;
	Sun, 14 Jun 2026 13:36:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYl0S-0000000D2pd-2FdF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 13:36:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so18626575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444166; x=1782048966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=LeXvbY9F0uhXPogw16fuzd0mmGM2DeYTaltf+UUrHFP86TX4u/SeqawAdsHjABeP/R
         w5OvNsC1rzpIyslDk7rvKvWjFA+/S3upslLZmxTiuH2o1oh0hz6ugADEZKVVoaEDGMOl
         Vo3Du+ctkrtrt9kR9wDGG8hTBtd4DWwhR/+h+zsx7VeKL4ASwVGoT/RPB8rhk7Wr6Qep
         +iXWRok86S/u3dVWZF1owNQY0EatRaqJCoEv/3ijzx9lKguuno9A/SXT0qRcmaMLbQm4
         ROjolquE8tOJ4+efr4Og6YE+Ph48CfwkeK0zwFAOHfjFfZhG+92C2VSGRprpZ0cZvVAu
         dItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444166; x=1782048966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=ifkAk67AgM0H+j4bi5LZUJMawqtFlBse6mQQSfk8p8DT2/T3oYXjHoqB4HCAQb+C0J
         NcQnDNsT4AWxV7OYahp8D6xRGEhMQ6JN1cXwZsE0lhgXC+42jDwJOEqTU0fXL6Duk6Iv
         2zpoBv7rJY8rdqEuDs2/8qw66mIjLMlk4dYtSIMZj/qwfBQnjR8E1H4hovCLnXknwaxo
         K4u91sGQ7NpNjQMdTRW8kh2kKz9g4fMMXr2ooqx56qsaQMg2AvVc5g0zqKzJAzPZk234
         wNsisdA90f8jah7rteu3X/D4MjAkIAaMOh7ouArMJV3ADUqn3dsVgTbiyTH0W3EuAvzp
         DLEA==
X-Forwarded-Encrypted: i=1; AFNElJ+ExSec1d3TVjvS3gXQPxp1Ozuqwcdgqbez0qutFpNFe/15hqgmyozeXCZgBxgptKtz25mGIRDfSGQAUPZtEMf4@lists.infradead.org
X-Gm-Message-State: AOJu0YxhPiO8P5KGyYS5D0Z+gdtijPZ7SKk7lL6yUXin6eLPwYlNQskS
	owdroMXc8TgROaCyC9Y1klkxV+IFJvMT5s6IUo5Vws7CTIHsHcPjtnTI
X-Gm-Gg: Acq92OHEMqN7Z/pTe8mlLJ1CHlUR93nBRvO/GBJOs1nFX37Mud3pgTWchjVoa/6bsL6
	R23KtryV2QBe/Kn9pshIoc5bgGE6g/h+7RBambG1LfWvvuRAXFU0Y4sXDvnzrUrejKoz4kP//5X
	Ge7W64B54h09ztYSZ1HpIeQ3uPCOciZMn3QvFcLAsRETYaLZfgPfIjjI0NoATMJixhCyHVIDHEV
	q3pwfCmNLmmp2+bdk1jEZy8Ale5vHS91icLQYYBuh43dYlY189yA/vtGxkNy7qr9RpVYK+3Llov
	7QCjr74+zyUvOtXb6Nxb8x/9x5OgBDwK9jMZHrWrBjp6ZpZo74YR0EWy5FhO7OdbQmLTaZKibQe
	4SGKgaaPtrbA6c3AgLj/fLIQ6VuMlft9Ui065lEztkjcwDjfYuCgl6fBGAyJ835aTux/aYnaogM
	SVH+xG31T0NxadodAp2pDbPk+oDuM0DzudpN36bIYZIIKD
X-Received: by 2002:a05:600c:58d5:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490ec523a8amr94122335e9.34.1781444165973;
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9520f9sm148794265e9.1.2026.06.14.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sun, 14 Jun 2026 15:36:03 +0200
Message-ID: <XYko-1bVTYuJiQeSr0cTOA@gmail.com>
In-Reply-To: <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
References: <20260505134812.408316-1-wens@kernel.org> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_063608_615838_D8A007D1 
X-CRM114-Status: GOOD (  24.00  )
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

Dne sobota, 13. junij 2026 ob 16:34:00 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.sk=
rabec@gmail.com> wrote:
> > > >
> > > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> > > > > The Allwinner H616 SoC has a video engine hardware block like the=
 one
> > > > > found on previous generations such as the H6. In addition to the
> > > > > currently supported features of the H6, it is also supposed to in=
clude
> > > >
> > > > Remove "supposed".
> > >
> > > I can't actually verify that, so "supposed" is accurate from my point=
 of
> > > view.
> >
> > Isn't info from manual good enough?
>=20
> The manual says the SoC supports it. Same was said for the H6. Then
> we discovered that the VP9 decoder was a separate Hantro block.
>=20
> So again, *I* cannot claim in the commit message that the hardware
> block supports VP9 decoding, because I have not verified it.
>=20
> > In the interest of unblocking this, I would be fine with "supposed" too,
> > but manual and all my experiments show VP9 is supported.
>=20
> Please give an ack or reviewed-by with a comment at the end stating
> VP9 verified.

Well, just go with original text.
=20
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
>=20
> Thanks
> ChenYu
>=20
>=20
> > Best regards,
> > Jernej
> >
> > >
> > > ChenYu
> > >
> > > > > a VP9 decoder. However software support for this is currently mis=
sing
> > > > > and still needs to be reverse engineered from the vendor BSP.
> > > > >
> > > > > Add the compatible for the H616 variant, using the H6 variant dat=
a.
> > > > >
> > > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > >
> > > > With that:
> > > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Best regards,
> > > > Jernej
> > > >
> > > >
> > >
> >
> >
> >
> >
> >
>=20





