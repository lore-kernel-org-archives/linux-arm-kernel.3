Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FE2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=; b=b+sI/nWhcEM2+Iy7wUxCLsrAMp
	3YWLn8HX8uPVHqAfT9zooFZxwpjbE+fYpYvv4K4jeTcRtlmzKABukwT9gUwfWnmaO2sadru94yCVm
	W4LrRumFUucSmmEm64KcP8XaHRp2KSnfTdCDwbDxtmuMssHR6dLlu7CYyNebQfYHJYUff/QznDQMY
	1aIzDuxOgUfzgyg7LL6buaBXxelnaOD29rW32Etey0VMoEq2CFmoLBq9XMG1yNxBmL0JA83LZt+bl
	fpyVZ1raivA5/wsmt+JWVXaXSmvZOisx985scEuQUvUax7qjsH5nmd70bfojrthLrcCa2GUXZmrvm
	uzvXZrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDD8-0000000Cpkm-2u5E;
	Thu, 19 Jun 2025 11:13:38 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAq6-0000000CSrJ-1XZ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:41:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso573993e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750322501; x=1750927301; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
        b=AoFXyjsDjYpm0FI1zUxkRM+IVY/moya7HMgPBcWgv+obU2i9VP+Wosd1wE2t5IM97c
         3mWIH5aKLPfGxJIx1cWkikV4C+Sv6JNdq/hKTTZgltGGo+yMUCAd5+oh3hjbKwYprLNH
         FJw+kKzJuRv6HC1elpqqJPFacyjPcnlbdlb5x9tyxDo3dHl/YlM1x4p0Z9E+kxG9y6Ho
         zUFlx8FsqCk8afa8e/qSPxll5L/NG1InaWAcmyEEBu7n1WlniJf6Gv1DjsaWASq9sWNK
         dHww86jKOj7DzaxBnv2GRBm6djClFNmMYFatf//CstdSoNrmOOePLOu07pXhwgECkr8+
         xhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322501; x=1750927301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/3JI9hpwUNX1wRMtpySGbKxpzNwm/24BRDXUmlzv08=;
        b=Cv6CeAjI/DgiufBcJ0P7ErNrJj7bgGcwyJ+fXViuzMA1Zzgb5akGPxQL8XwuM5Lsjh
         1tsyiI0oBbGHH9ZkN5Cb/MPzTm2VOTohlUPah+2Y43CjLAjVYPis4QcSLHaR7XAVcbrD
         7QQu0gkq4Z3EuoS8lH15L8vI1+jSnevZ0BWG/Ea/VmxS1DagvA2YeRRmGxefkon4BCzZ
         Y6673mAOz2jW3kT5QhvCeBKMZqWUjhlBGrQgqQsQ4rv50P8j1NI2IfYGAztfK6J2d9B8
         Y4A62PxC8GyMqZzJzuwzIRSC1EvWqfM4A8Cjwe+mNXpbmhz/YwMGkh4CwQ9JSj0ypgu+
         R+0A==
X-Forwarded-Encrypted: i=1; AJvYcCVB+H/v8s2rLUitAL8WEbSq2nCZE6M/yvqb9LxbsX/Xd7H6kY8sqiALqk1p5TzDaGkbt1kGCygdzvH+CmKB0/9K@lists.infradead.org
X-Gm-Message-State: AOJu0Yy60GeSbj/4cZVVXeRR8OqVx2atQpP/uLZyLqXlifqrPjSoXtV1
	RawSvMtCWIIoeXxXMvYHUYPXM4jrzIA1UAdBXQ2BUDbejBXSKIXB0GAlD0RRe9ZfJ86gj3coJLt
	GbQmYltSP4wXF1L2BI33qU4Pf1KZqOajeS3OETgHyEQ==
X-Gm-Gg: ASbGncsxVAYFVcPCxgBIUHh65i1G+nBv9hoUgKB2ZoD5Tm1gM6tET7qHVUHHC+scGoe
	niFizIs6np15Y6jOdDSis6MqiCPfffhSdBuDVj1qX/XF5zU+rEYm9MNfpmI0bxmj/DTar4qYem5
	lTev3RCGYjZgSeIkKf+wPbiup+Vz4lf5XK9YiDweIlSrg=
X-Google-Smtp-Source: AGHT+IHVGgFPaQG0OhPXqsCqY9LUDkKPUDQE3Jy/DgzWX341H6DxvHpFRsv8n2zH9CF8v26QIPfqbwftMAeHyo7UZV4=
X-Received: by 2002:a05:6512:b9e:b0:553:a64a:18b0 with SMTP id
 2adb3069b0e04-553b6f3ed33mr5548057e87.42.1750322500571; Thu, 19 Jun 2025
 01:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
 <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com> <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
In-Reply-To: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Jun 2025 10:41:29 +0200
X-Gm-Features: AX0GCFu8Dbo5pcDv8ujsp9IKLDaddp4Y2N5p47cQpThWdtIAL2mf912Bw-JLnyM
Message-ID: <CACRpkdYNRC14d-jBbJy9-0OfdXR2anUJ6osw+DWsLNPf4VymnQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_014142_407875_635AE129 
X-CRM114-Status: UNSURE (   8.06  )
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

On Thu, Jun 19, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Sorry I didn't notice this one. But I see you already responded that
> you pulled my PR from today. Should I ignore it?

Yeah ignore it, let's use your PR instead.

Yours,
Linus Walleij

