Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7D4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVUpvtTBLHRQ7RrqjSGWWvP5ToHEThWrbkH7ADEWZ7k=; b=iEI6lKGQqE8SdWIqeGpYjEc4ky
	1Tj8Gfk9aHHzgIFaIgTY+NHkCIyPz1ra/wS2q35urwmoM6uM2PBk4xSWzPQfD0vrik9H1FjUANxS0
	aejid7S7i2mq5uLZyaN0+ijV3r7kRI9Rv4ohSTYugqDqZpRvDG8YkumKODEGDuFElcwh5oTAekuRv
	QiWY5ZL2y1yKcL1eYuLqAKy81bUQ+2UyOHGb9yWco4rvGOhymtXDtWz1cjtRw6UAHntyZ2f1vFJPC
	gZsTa2TQZiUVFauuIwBvoo3xe1XjWgEAX3SXosvgxSQI5jgUDv3S3DQ48oPHLnMGI4hYU2d+sCSlH
	lA6CpA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTwO-00000005SDl-3p2Q;
	Tue, 18 Mar 2025 10:12:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTuh-00000005RlP-1731
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:11:12 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5498c742661so5970493e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742292669; x=1742897469; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVUpvtTBLHRQ7RrqjSGWWvP5ToHEThWrbkH7ADEWZ7k=;
        b=pFPCHaGAXSnKHNYzkr08/UjZ9BtWBLQQumFJckLn61WqCrJMAxAKo+iVkalqnarNTZ
         9EHqTi23FWehAcqW6vz1vrI0b0nzJ57K2UkIP6kcrhX7Fpy5luwWGapZTy5ZFfbwWrDS
         r2KMgBO+Lap+LlEaP98JW/K4TuUuIB8TFKFB0CQjpB4hdeAxP7/3fBR+tXDbJ+Nz9STS
         a2q8TcHkuH93uF6Du7t1XzhXgbLfxm9pSy0NxrQMVVJ2suozSpI2mantK1hbotuYbx+V
         cOCR6Ke7GEvSE5shqzy4nsQcqAPvfNe4B1HjBgj6W1bd9qrLZevAN9FBSg0pfde5qjDt
         rt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292669; x=1742897469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVUpvtTBLHRQ7RrqjSGWWvP5ToHEThWrbkH7ADEWZ7k=;
        b=VhCLe3xel1lQEP36uxVnctn1s04304QpT1EZM1aU91zJwJZzV+5Sg+sE5Aw/TtAKxV
         wykpRqIcZF7jYlGBt021o8zx5J2n6iK5FoJIdbwgrNYc3MckLt3o35K+gXR+G/eFp5G4
         hOUpOvGP9+bBgmOdSh3Nn68AOBInDHB9+O8t3XPb/5qrrYNo9tPqHKwh+1sDeXcf7I9G
         iGLMvSoQ8RIuqzQx9f00BkIOEFTIOgufW1DHDJRlMJRdU/kdFYSrUIa+BpDNK8TX6BSY
         pSSA19H466QEgVTpSCjeCit/N6u7WmOfXX3mUP5ONprzJ59R7c4NZLav8xjAQXnW6lYI
         gpUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaqvzr/QF5GRzTrjGdWj1j7kCxr92Xp/BdDVa1NEiajfkpFwIB2j6XMM20/0wV++UKdnTrnwXtdsMa41hr6q7F@lists.infradead.org
X-Gm-Message-State: AOJu0YwyxrEpM5HOAulOLm8/jdyF2zjmBV7EPey7E8ecuS0uvITrcvDD
	DS4qypwvLvQv0JWTwTtMOCAFN33TxRmQfLFp/GhIxipbGaAYwUc33WCeDKBOSmOUpWFd1x6uRvm
	nKoX2qItzY+xDUOBjRg0wxfSNdv3ZHDgvehI02tHUiHXX9yYkJCc=
X-Gm-Gg: ASbGncuhHORqQQCbu4tQkm8b4WwOSORryB8Bs0Bi+kxzg6m9sbgbfntMKw1GL0S02rt
	nBV//qizggKExB9JJYrHxEKJLJyQ8ERaArexHGwGFtut2o/HDDv2bpbBs0863tRhMy2gVXOXHuU
	SC8v3LsIgcHqMXto81gFX3YeZRSQ==
X-Google-Smtp-Source: AGHT+IGaqrncYYUr4sfyRfLFzOEWIoUn1i0mOansd4z1qNbCCAzVBUKQPVLdXhHFFByp6tsLCBEDJwkAWjabnBVbVpk=
X-Received: by 2002:a05:6512:3b99:b0:549:b0f3:439f with SMTP id
 2adb3069b0e04-54a03ba664emr2114093e87.25.1742292668868; Tue, 18 Mar 2025
 03:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 11:10:57 +0100
X-Gm-Features: AQ5f1JpKJfFS7YVV371lRPx1Y2xc562AW9pLo6dBt2VW6OJo1Hlc7eGeR9sMzjI
Message-ID: <CACRpkdac0zZtB=85Y+Fu=TYwf9qTjNog90-P4SBjQ-oB7X5Vag@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.15
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_031111_309982_2E83EB99 
X-CRM114-Status: UNSURE (   9.43  )
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

On Sun, Mar 16, 2025 at 3:31=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.15
>
> for you to fetch changes up to 701d0e910955627734917c3587258aa7e73068bb:
>
>   pinctrl: samsung: add support for eint_fltcon_offset (2025-03-11 20:37:=
29 +0100)

Pulled in, thanks for taking care of the Samsung drivers!

Yours,
Linus Walleij

