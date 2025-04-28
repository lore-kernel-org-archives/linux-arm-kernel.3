Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54B0C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 02:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=; b=kTz9e1ouJTNFEeULVKK0uL7rhg
	ioopnYHlywuelo8UmZilXVt8a5S/M3CwteaWa+UlNn969GVf5vbdqgoSjW9buzecUwQLTHiRTm8Bi
	GQXsgoBCvGnQxK6w9JUpFSfT5BQy8Zvq7oDYJ0wVu8gUgGneGi1/Y/bQf1VNUjNSfvM83vsMUNcF5
	z9JVvQZ85EQTOSxIY557G5+YTnFjm3UdyrEGwwwmdZl2ETqUXKjtBSrK1/7miZcPaQ8iFiFSSffPx
	JnLKe2x1NJob67WvMvIdsIM+rLJ1yXwe9AifwdJ873adQC9I0D1rAIIrp9eimnWB7+KlOSGKwl+U4
	3q+nVAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EXc-00000004Nlt-3WUD;
	Mon, 28 Apr 2025 02:48:20 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EVg-00000004NcX-2BMb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 02:46:21 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-afc857702d1so4067862a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 19:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745808379; x=1746413179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=;
        b=BHNqO43M+DKFbcUbH1GQrSKOimsp1YFefVi81RausxHex4rCZzP1sdx5Gfd/OXGsqG
         Ep8QWzmzgYjNKuMVZtt3Fby9GkC0K9J9YVg9tU6Sbj6wKmp49kOiEHT1VCR+73GFg3Nr
         kUh+F+EpJ9FyRpAR0wKmkq5MVgLpy6GTmihkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745808379; x=1746413179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=;
        b=LANuQDEk2p802Xa4tWzRCTUOA0/E5bklpB1ale8vjDPuY1hNFdvBAHFXQms+w3U+Hz
         6Odkk3b8ide7wvqTJR4zuePpu1axh2dEOW58Rac6Sk83BGFg8tsEbv9SEtobWMbNmMcW
         UdR2W1iYY/2vMyJYIFiQFRFAHPwGCqmSKPh+P9c6F53nB9M/155Ou9a9IaQy//FdieZ2
         BGWwS/twtoMhff+/s9y9WHhLdSFfNPWZvntEV5+HWN/MZFduSGbHuN6tX3vWakz4orrP
         GyzruKwmNVcRuTCLSA0JmFUC+n12IfDC8xivM3+PIMzuDjcxoMzAgDn/5SFXXikFtXOQ
         rZow==
X-Forwarded-Encrypted: i=1; AJvYcCVvmFIACO45RJv/ZsPn8a1coOuAskMM2VrRz20jUGyoJSmXZ+mIakZ2NDc+dwoGEWfTpXmEKtNoN36H18neEZEo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv+G8U5rrup2whkCEFOsBwHljKkan97tALS2PHUDYAp8NJn37p
	MFmrhNFkBxcQcG2b1QjWeAir1XQtDMiAMS1vAwHC+hgG3M7Z5S8+2fHKL0hb/06heKBMbE8Ly/v
	RgCo0lF+EwBRykh/1zmI0dJ1svtyFP0oAeAwPF4Jsvn5P1elzTvs=
X-Gm-Gg: ASbGncv91zzn61oSvQzE23ehwZ4/pIcuWPnXosjxgSc5PzMS8lsOF8PmJMcvH5ScBp1
	CfOSX1QrOoMHC1S0V8eWUnuybPlZEVfXPne/5yASvvH7mTMz75NFunf1R0d5FiUdFffbMjQjo7J
	ZwBdWlF+6+fsTMuT+5nG7Vhxz5Lw5jIf15mdrV3Uz6Yw7UI0jJknvkSQM=
X-Google-Smtp-Source: AGHT+IFnzBUOX899hEhTQB+VFNRLl+PxXCq+IL10Ns4KASmw7qSvMl53RlFdnCNy3FuGcz9Ynut9j1cIj9JyY2lnZPI=
X-Received: by 2002:a17:90b:3944:b0:301:98fc:9b5a with SMTP id
 98e67ed59e1d1-309f7da6d2fmr14756992a91.6.1745808378981; Sun, 27 Apr 2025
 19:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
In-Reply-To: <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Sun, 27 Apr 2025 22:46:07 -0400
X-Gm-Features: ATxdqUGWEOGuPy-ymNWEfY9-YxSHKLuGJnDXSl4c3NrXQIsa-1uCWVa4Pkv940Q
Message-ID: <CACdvmAhn_25GWtOwGsChU-U3PV481_h6-pC3o3G4p7T0Z5dHog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_194620_553423_EFC3F4CF 
X-CRM114-Status: GOOD (  17.79  )
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

On Sun, Apr 27, 2025 at 5:11=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Apr 25, 2025 at 10:31=E2=80=AFPM Da Xue <da@libre.computer> wrote=
:
> >
> > GXL I2C pins need internal pull-up enabled to operate if there
> > is no external resistor. The pull-up is 60kohms per the datasheet.
> >
> > We should set the bias when i2c pinmux is enabled.
> >
> > Signed-off-by: Da Xue <da@libre.computer>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> +Xianwei Zhao (who has recently upstreamed Amlogic A4 pinctrl support).
> I suspect we need a similar change for all other (Meson8, Meson8b,
> GXBB, G12A, ...) SoCs as well.
> Can you confirm this? And if not, why does only GXL need this special tre=
atment?

We've only tested this extensively on GXL (S805X, S905D, S905X). I
think we should enable it for all SoCs if this patch doesn't cause any
issues. I don't see most Amlogic boards implement pull-ups but I
haven't tested that as extensively as I've done for these.

>
>
> Best regards,
> Martin
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

