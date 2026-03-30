Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767191061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=; b=zyGQ0TedgLq+HhcE1YZQYApZEU
	ePnVcJriDgVYtZOn2Bg3297h74TQNyOTxPjC6DOdh4gwff/eqCgmlj7eJtoasvKILAA8f7FfoL8ue
	bafcN8b7uA7vcY0p6bxgUOXcanGaFGH5RpbqjmkNmuxtsMk3/5nti/kwmDh+A0kuiF4UiAIXSf29s
	fBxz/uchPRqwUPhjSN2AjPGj5GiJUmJ9/r1Irme3di/MvPuiXhxKqFE7Dp1EoctFW/wb1zyiYOADI
	H0mlQ06W8fZb7H9T/1KGzv6xKrw01RfBTrkTvTwzg2OnSiu9pAiE4gJi3HwZ1E5dz+eXWm1UsZB2F
	jqZ8zznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Kd7-0000000BwQX-0oou;
	Mon, 30 Mar 2026 21:58:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Kd4-0000000BwPk-2rFd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:58:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b23f90f53aso27520395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907917; cv=none;
        d=google.com; s=arc-20240605;
        b=hPYACB8GFCzz44ht4kfl1s4oANb0eFtUwb3EX0ZsCxt4CW9kGhkHT17dP0xcRRPTJr
         0CuJTuFrWxHj7bN7Uaj6mttQSc/F/rbIJEGCKGAmkqvowIegiRQ1Fgkf5d147+VgwiwK
         VCTRhxBtiUXvYugG2q3trE4HVJe0D55Y3PN68u9ydAfiG1ttzcOlZXALaKC92nMdflF4
         WV2Kn9Zf79vzLqb8Bl+KnpM+VHkF4KNnvq0sfX5SpEoBjmqtoqUw7/1rAcallYCR2Dlz
         scEIGGIwf3WUJHOGbqPXA62xAFRc87IrN2Nm+gB8BM6ATEuLsfdStZJ9oyUXGwUIJDWt
         qUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        fh=d0LyEUVQbds17hPgyA+Er7BNHdQqE7T7qHsiMg3WTYs=;
        b=VXqKVW6vkqAPJl3BDv/H8pZHwULoBS7i9AjiBdM3oAoVJ1IB1+AE9+IBnfmAvlIrQq
         4LoIfrNIbrP6B11m/g82hLxX23LY4+LnXiA6SbmBUiUGjgmA+v8ulkJPj2Meim7WfAyi
         nu3ej9XFVKVKvdRSYUYk1r/0gYh+zzuDwaalCQzDPx5QOSiq6CslJw/4/XmNLYE+zhhs
         AK0AxCvbBM+CcbPNekSyCBsy5a99dXL+9kT1gHkpq/vydU+qfbDv/GH+ZYYbyGadxbzD
         cOulH5phK0UIMs3N1vFzHdxusRKKG9nHIDjLpAgtqmwsYO4Gu9DSjoCRgZkW0uP8ufPW
         Y05Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907917; x=1775512717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        b=TkrPrXbaVldDkjf4gL8V/SpGzgOpddx/5wBCaeoWv6v4xvuGN2NbpN1prVpmJiJ4Yd
         REWS1TPJJuajIZQyXi1gst6IW5HVeLpGXzhW49NIIwiYc4Sbhqg/nhjhV/TLfMNjY61y
         Re24f5+tStvnEncsJpdxXM2aKXo3A5Cw9HZNmIReEAmaRsQ7UVSTtz71xTKjDlDQOVi1
         2J4Q7wMTNBG8hxaEs3pqrhn1i1hmRJwF/lacmNK8QkrLfxHtAHDCZd0mk8g0CzCSmLGK
         8Sd5cDaJ4EmIRch2qRWRbKvz0RGTSyo+nW2TbiEtuqSE2TpUiW2XIXjBaLiQZPr7lqwm
         jtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907917; x=1775512717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        b=lMKz8pkDcegjik8A3gU6INXRiDpvdGS5wd6Q3yxuSoGxbpH3lwPa1LargVmPHrTGzP
         qRlsuYxAM9v8CFwkDquWtp71OuXquWc0NbjmRM0od6+j56TJ8jf48nv9sL5895vD1XkC
         0pCCrsPvQlPh+1jGu2RbPHeu6ZQGKREwcxbdp0+sPQgSCnWNUwjWBCqiHzZEIFdibngd
         Hv+dWG3furxuxh72pfy1S5975mpgBsHi41xMuskCZUnB1jY9QRFPdxfdhqTnUZVKMxPB
         cTfZwAKqGIYJw3Wv0cwvjDVozZyEp9SkN63VTbwZBb3KRYosln94SxY30oAIWpspAgfn
         66Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWiWvw+W+rFvldDa2y9R2b/ZN4sSZ2K8RJscLy8vHMeacIdT+5fVE+vNMbSZx0i7YBBDBqN58NZCEoeIp8m/vln@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0gQN8OZ8qOvkRA34+TTTdqyNQlj0muRSl4ootrL6dewlcGvTK
	2YUzh0rAqkV9GFgOrn3nc9FvwHVfBKP6Eew9WHL93qyOOwG3PVJ2eaqD3XwfW8vy9IaCAzVPAfm
	NacaeCoYz0C7UbzbjXuY0JhvB10NrMrk=
X-Gm-Gg: ATEYQzzQiSxrqqQTh90RPU1Rh8cWVBjcSXzjBSVVY4wsa0NUwZ7JrCNSnNVKIMMjfnR
	FLlF/zrsNf8rJdBQvifnknpvowNeZKfm637z7x00ongatvhs3zGvzSmXUGUqk1ysLXvNGZUKzIh
	k3IegquZmrDu9v+3Br/JoRcTz+GGu9kLmGWvoAXI5KTxfpNpbb3dQ9Gayt2sS5JlPqY8oLTFjEz
	64hXgXsNxEFCI7G6Y4Qg/A3GnmWYE76EehoQnDhzMpTrl/ZDrQbZvHCuGF070zFM5aVO2OHTZ2x
	y94vv4iHe+TapggtLWM9RqXjJeUMjjR2fkJrWSSWK65pUt2xFGY=
X-Received: by 2002:a17:902:ef44:b0:2b2:58c7:2cd6 with SMTP id
 d9443c01a7336-2b258c73377mr34992175ad.5.1774907917613; Mon, 30 Mar 2026
 14:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com> <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:58:26 +0200
X-Gm-Features: AQROBzC9sJkgJfCVL7Eb0aOMXTr94-EjxC4gSLY0i2t4mSqOPphK9W4gxOQsQKg
Message-ID: <CAFBinCDOd_Xp3DqqFNDUEfJPq0U=f9FazNAh_=k2B2eOcUeu+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for S6 S7 S7D
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Junyi Zhao <junyi.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_145838_723610_28A2E34F 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 26, 2026 at 7:35=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Junyi Zhao <junyi.zhao@amlogic.com>
>
> Amlogic S7/S7D/S6 different from the previous SoCs, a controller
> includes one pwm, at the same time, the controller has only one
> input clock source.
>
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
With the two suggestions from Krzysztof added:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

