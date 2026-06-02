Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E2AC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 05:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=; b=WXMmmTH1ql9rpsnNwnttxEy2jJ
	I7oyLaQ0jA7FwoIsuhJKBpsXZEf3pKA60iYwqoEDRB+Dk+JR1JPg4QWYQCvL1HtU3pMoHfuwY03SY
	2LgFHA2h8IgcMwBakGygVUkPPh+EWuK2wyLh7Nz03PNooTwLAlrycU598Q5L93fP0KSsMnlhFeN7f
	u5ixQ69KpIzZHQs85ZXhuLNX/rOXOzkK0xsW9itDXXW6pjg/F2HOWn9C0Ou0CERPyyZ2I9eUtf7Ch
	ZtEbk60SOLFB5tXVL2hTqMtXpH34YZ0mXue2uwJeg4w5ZQA51uptNfvTRmmpBku9IwAlEjxJoNUj5
	LJfhGSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHyF-0000000CLF6-3vYQ;
	Tue, 02 Jun 2026 05:47:23 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUHyC-0000000CLEM-0omI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 05:47:22 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso1063569a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 22:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780379239; cv=none;
        d=google.com; s=arc-20240605;
        b=cQKu5/69cOzlhNwkrlh487GtlwgEeUT1t4z+xpEq6GlLzIs0dm7ozHFP7iMGlkUBPw
         jWi/ABs3E8usgf27yIJ5Ioqf86iPiZhtzvDqtO7F4Ct0rZo/44AU4kCGdbaYnN9ZDC2T
         fw5zX5XtIQw/ed2rN3ESRYdMDanGcKceJICxlaOul1tCiF3oDIY8Uouj8HwwCS7dHCbK
         8qOHuYfjqmwTNZMoWgeVhX2wA/Xr5+Rb6LkZNZth/MB4DyQKhSZMHvtqiNt4NHCgukm0
         Sf9oQa/jDXEkUGfg0SHYr1hBTh92+P5+Y1hnESLqNHiOqJJ0vtEC6TvPXBKFTzDIfPn5
         PcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        fh=6qyuySpT4LkJnjHS4a63NJ+zWIN7nyqVhICTL44S43c=;
        b=A9VXlQ3UadI3R5IGOsnwo72hDdIHNK4/7C5FH42Y/WuiDOnEwyHLTKJQR8c4QEaAKh
         GYKxWWkf8EbZrnidLC5K4QA/cQG5v2LZmPhUkDoihkn/R7mez/ft/0U+il0plnE3EJsS
         dwiesceJgG/dM12BQBIhZ8i5E5B2w3k6AwQXv+k15XVBRaeoQg4cu6mVeOix7LiFsec9
         bnDD4hWIqnvXV6L8wWhWeXOGVxosY1oPnMQcG7uqqPor46wxMEbRbIoa5He+c8kvJfSO
         b3qvnMTVlLkHiOuaX/9Z1Jd3u85BeeeX9FEQcnNqiJwmtR7ZnJUPU7jCMEI/bGklL+7S
         2bPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1780379239; x=1780984039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        b=SbindI4l3D3YzCr/SOIUHZi4tGgeY5daLCMOUtFRZWaAuK7sw1Sbi7o/du0rAPYstK
         u0KTSYOP4SuL04bNYCevAwvyrq7eoCs9lFdqoj2WkULEuQUBUM1mgCNna5rQQp9iVqq1
         9fFmpAm8HC8ZCplkt3a9WgIa7U0mCE0y/CVV7dZRLADKz3GBtmH+h22F4+D91EWHBqvT
         ZUR0Rsn3K6b0EPWy4ujN8U6uxHOobwG72iCE5xTqsgELp58PsdarBTATRXSEUG/y7kA4
         XDK6FVXmkcv2eZsre+6HzKWpFV0Q4SA3RoTKHr0eMji3T7P0RghZEWkCXYV689HLxFc0
         u/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780379239; x=1780984039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jyC6qHGl3rJwRx78bRuaEHvnuz+EFnV1GWMET+4Yoo=;
        b=oQ4X8N0TccDXp2Uur3qWHB9rEI98XAsMHIXHIudvEMvAeu0Qp65rGiUzrW57AsQCAV
         rBNfGHj8JpqQnP6UB7AQEo4aix2if5nJ1e8gOoSlbN7t3Ux5IocJM266Wk3UQjPXRCnE
         bAKfWqDWL99jjnkvoBVdjxiWbHE8p0I6+6cpqZRhspWHzU2cHQptHOrZKSjEyd3TF7+t
         2POpRj/wSnQrmaxoOacbzKG3achu9rS27s0dXiDUfdhnQ1xBn4pRyKG8vQAGSboSDryD
         ZzEzgDvpNduf3aOHlEwBl0zoPYfuDkEjsb3kHClVJL5yJUur5vwMr7m9m3Z95V0d0PXc
         5/ow==
X-Forwarded-Encrypted: i=1; AFNElJ+B1Hrfcb/+61xx1pxx+h1wnwnt+a9MfX1V/Ij6wd8JFytLAaToCYmN+cbZU1jvNf92c2JGj0Vx+PgiKmEPqP24@lists.infradead.org
X-Gm-Message-State: AOJu0YyXR76H20HEWHyH8YP3EByLOAxln+YYnnyusmSW0hA+pT2u2XTM
	+JxunDWvjwzRrKaGHIe4m4hM3//jnbWN4KP4/F3J9Z7WbhH3fK6u4esuo6otr6vmmThSLiqM/qT
	XUjw4FqHrll7huVICkIKdX7ZqxyM/haw=
X-Gm-Gg: Acq92OHag7Lj4zmpSDtQzOXpRRDQ/UCFP97tchWKjWX/3tDwE0ot0AnjRLP6cm0iuC3
	qZbseSCKhBkXGTebH0+I9jKLfL3VAVcmv6cu28NcRbpVfMbAxlXs58isYzp56qrpW98lVFmu+K6
	+qUcRamAbvFP5qgz9/yzrAvllgGjnBGgxRJ3jnFA+2kQoqOWrAyQVys/NY93dvhP2/ZyXjkZZgU
	InrOiQTNNwxoK/xmLDjFcEfGRvEGF2XBQ4Zou7+gKvVAu66EcnynU/3ESvjsdi/bE4VJC8xqViN
	kGmfUpiknLLwPd/Pg5uF7SKncOJWrcjn3VoB8DcDRb74uBrY9/A=
X-Received: by 2002:a17:902:f606:b0:2bf:367b:f46f with SMTP id
 d9443c01a7336-2c10cd1dbaamr21848025ad.30.1780379238839; Mon, 01 Jun 2026
 22:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org> <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
In-Reply-To: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 2 Jun 2026 07:47:07 +0200
X-Gm-Features: AVHnY4IB5RtNIaO0mVfpt98zsyzRrKUY-xCKF5XmkQB8dMk3X6syT-ZazZkET0k
Message-ID: <CAFBinCBS_38Yg6aXFpKhpufEaYn7biUEDLnB9tn6Si7TFHdSuw@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, soc@kernel.org, arm@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_224720_290991_F405EF6E 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Linus,

On Mon, Jun 1, 2026 at 10:06=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Neil,
>
> thanks for your pull request!
>
> On Thu, May 21, 2026 at 3:19=E2=80=AFPM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>
> >        arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
>
> This commit has a problematic Fixes:
>
> commit 6f14ba3c3fa3d67b72e052f431f6776470eb2cbd
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Date:   Mon Mar 30 14:11:21 2026 +0200
>
>     arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
>
>     Fix introduced invalid property for Khadas VIM4 sdcard regulator.
>
>     arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
> regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not
> allowed ('enable-active-low' was unexpected)
>
>     Reported-by: kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-l=
kp@intel.com/
>     Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add
> power regulators")
>     Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
>     Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>     Link: https://patch.msgid.link/20260330-fix-invalid-property-v2-1-228=
c51c8de93@aliel.fr
>     Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Commit 60eff75ac67b does not exist in the SoC tree nor in Torvalds'
> tree.
That should be 8f4e4fbd5072 (which is part of this PR - as the
extraneous property was only found after applying).
It seems that Neil did rebase (to modify or drop a commit?) after this
fix was applied. But I can't fully recall the details.
Linus, what's the suggested fix in this situation?


Best regards,
Martin

