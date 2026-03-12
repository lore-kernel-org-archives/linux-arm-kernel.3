Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39479FED2C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=; b=A+dUGeCFQLujcT2BjIQgi7sWgy
	fe7CUH7/rEYwJ9R0HAPX7+a1hFL8WXaAAfHK1vp+EiM8nHLOj6iQS3pd5XKdhaRkFxp9tT6sJQEuK
	WIx5zt50bqmjupO1hY5RrbDeYwL9lhrYId5uCx+XuRGuqQBUmbV5NPCKO9kP93OLnirGYf39HrJqO
	xtczLVnXSqv0ZzxD9c8xvxYzEHU6uPNPecckrgIQgCklEV7a+bhyFO0c5456ZKLHLuXcCQBTS1mL6
	YBPXa7kMPJhSb+jI7qPHkU7DFnnc63lRC0S/wD2/2dypSQc+Ey+cvghBKR/fPy1OUGgiZnglBHQ20
	j/KQSjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Xn2-0000000DGxL-2ZNG;
	Thu, 12 Mar 2026 04:36:52 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Xmx-0000000DGw8-3UB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 04:36:51 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-509217e84a3so5342861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773290206; cv=none;
        d=google.com; s=arc-20240605;
        b=ZU4JYbI/YqsNeXiM5IOUhdf3xUgX4qMJSbfmo6wsNJ7JA9tXWROGxvgldsxs6zEnNk
         pFOd9+OmISr+rNuD5hDM2yEx8F0oi2jjWqCcQ5WYRoFAK7acD7juz+sKRMDMjOEM1bNp
         4s945yjUtcFzfILxVbn0ltmaRaFE6trUjIqTkm6kILRvZVeWXpkWD4U7Wl2zpKcMJVSm
         kFPv3p8ZZPztXT4VNxP2vwyrdM8K0k1wHrJTsOzQbtzCOX4RxjRS8CGMTXCdCiWa6U0R
         mtSyRw8CMZfy8fOZD/nSYJmNqZnVExwM3hk0/mFxDmvZF1/HwTgH6x/Ybsfs66Hmoqcv
         Gxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=;
        fh=GRLLJOGsXEeCEW15u7xenl2gdK4waIxDqP5IvNECur8=;
        b=Z4RNAiPMv9U71rW6IBnrYT3iLDatQUziIPCHHLToCO7xYZEvdZFPbZ7jhZ1mEHaLuP
         uLrJHS1RsSHpljyRh58hos3gz82GF7N8qcepP8JSTAsK28C8/x9xTT347j4PiK9Chqdh
         OZfoCjpDGPs1JRSQAqI1lFzLQlwNze9zk5RlfdBv0Nd0zzdRHQI+jltBtc5S/IpOmDoF
         dCNDi2WIeL8dKkhsCVqJx9DrKJKSuiLZ/bzg47Sl+pics15xOJfxXtjiGjsBSktQ8I/a
         LzDWY6mWiY1eer9P4+ks1IWJ3cN6nu/95vf9wIbXBEW5NwbxNDGnE7GqEQhyPC+DVaGi
         E6eg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773290206; x=1773895006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=;
        b=aBiN5TFYUllj1oKQ71LboihKZmwxaMNQiOmSUJG/l2+AVen9869HLIHXw3Yo+zvG03
         80F/GxMLXdNucSbjNOjP/nIb6EInK347jRQfl2mjwrMZpM9cO5n68K8353fI4Wmo0ZTl
         OnU/BPriMFIqXRgR7sCRUcnYkHnzF5dJIsR3tcs7u4hKYtep6ktlyE+kPRaWUG8maaye
         D0L1bqrxqolpEb6X3r0OzWP5g/3SXn0wxJ2ee3q/ONTE5mFUv0nNM2AtBdxPqPPI36dp
         KDv3pjpYZqWyuVFu/MhBIpMBUlwYVJTWTHcOodPljuy3212bd/jT0ScIcrDtHgNjMfP7
         1iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773290206; x=1773895006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cr6QRlE97B26XWoApElcaPZVstrR5FuQHwzvCKtLY3s=;
        b=RfpSjRKncT6RkOK1VrwEGhM8KWIphsXQRwVOHzpIAOcVkd8OkULNYLm+PKrQ0WDLTs
         wXUwxtzB2KqoOi9zP94Wg5y/Hjcb0hLDBztLXFIS5Qb3OT1Btq9fdBxu7XazPHN3SY+q
         wGQV1TP1qIVuALNL16J/T7GbBwr7p/EkcX6RhxwdUnTxzXETl9LldaH/lIHSwXnqWiXR
         vwM6CBM/HGTjPLvH7XoQQqIkpqGkjI1LNhF0LgR0P8RL+axgrPZr9nGenGtRnaBxl0Nl
         UVVDhQP1nBT474/EfCp31Wag5O95Y9h/Zvbf7hVlZcfp+ZNFu1I2qnyeJ3lkLOUYlznY
         UAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyYjtxMD7Xnjp7trnenXC1onO2czmGacnX1G7rAcaU2RFKCyxg1E7Sylrt0FCEEqjH6OpsLNw1rE7kAd5vlbNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwmONDgPOcKV8m5SwOGylgkRoifD6Vmk9MfFO+23R/ABVUb64r6
	6tF63IXgOlxDvR/35bsgIJSy10JJyASPAdZurGDaK/SyRIDMA8EeTnyYcM4Ih0ZZmK+guy5UI72
	SvrosjFF4WLk+qF8h8DgwJPl00Q4Ekz4=
X-Gm-Gg: ATEYQzxPUothuS4pwxkyfljJTrOYbcRtOfSLgA/LB2wha4UDqhY68i5VynyQPOYQ3z3
	H5t6cxqQRWZSWyDM378WV9oR0nfOxLImFXagM3ew6P2Q5kZAevfSyAYHs+XATjCRZLSx09VhNm5
	HpHDJkvuFuoMvPhn2TifictSiKpRP/ZS60HqbbTygo67SUiGPphwNV2FLZcyzXure6wruMPWDac
	ZZYnT/I17jhTJOTjSHlMY1i/hI5h4zHvgXheaPUxRWIZqv6/6vxpEWylbClK7g+0LuDYc0kdbNn
	870dugvpIEAnhBKBHzzKeTuBVw==
X-Received: by 2002:a05:622a:1921:b0:509:17e4:ceff with SMTP id
 d75a77b69052e-5093a0c6df7mr62767181cf.31.1773290206588; Wed, 11 Mar 2026
 21:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-3-akkun11.open@gmail.com> <94465ca7-b3dc-4736-9d58-4024f2494e54@collabora.com>
 <CAKr_iV5cmE-GBp679Q-=bZi+186BvMvD41ctxnxNC3mTKEzuRw@mail.gmail.com> <0994fef0-88f2-4277-aa46-0b6a33c53bfa@collabora.com>
In-Reply-To: <0994fef0-88f2-4277-aa46-0b6a33c53bfa@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 12 Mar 2026 13:36:36 +0900
X-Gm-Features: AaiRm52b3iO4YllKLxTy076zO5CoI8gqzYjvZNNALgsMyNPOjlsY9BPqBID541M
Message-ID: <CAKr_iV6tVkT1be8EjXoNjMerTek0s79W2-n2shzt-wrmB1bYgA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_213648_149020_1C5E19F3 
X-CRM114-Status: GOOD (  17.21  )
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

On Fri, Mar 6, 2026 at 11:06=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Ouch. Well, it's mostly done then, hopefully sooner than later :-)

Thank you for your consideration.

> > - PWRAP and MT6320 PMIC RTC
> Start upstreaming the RTC (and MFD parts) right now maybe?
> That all depends on the actual state of things, of course.
>
> Remember that you can upstream whatever is clean and works fine, that doe=
sn't
> have hard dependencies on other components.

mediatek,mt6397.yaml says that "regulators are needed",
so I have to complete the regulator driver.
It will be completed soon.

> > - Power Domains (scpsys)
>
> The power domains should be handled by mtk-pm-domains.c - not sure what y=
ou wrote
> but if you did it on mtk-scpsys.c that's wrong.

Ohno! I wrote in mtk-scpsys.c, thank you for telling me about this.

> > - eMMC/SD (MSDC)
> I can confirm that the MSDC controller in MT6589 will work with mtk-sd, t=
here may
> be some very small modifications to be done.... if any.
> The mtk-sd driver does support "very old" SoCs already :-)

I forgot to add "CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy".
SD is working and can boot from it.
However, increasing the frequency causes errors,
so adjustments are necessary.

> Keep up the good work!

I will continue to do my best!
Further news will be sent via patch.

Best regards,
Akari

