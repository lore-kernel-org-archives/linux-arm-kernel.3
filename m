Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0FAE6F07B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwVb17SkiONM66zGI7EYc14PR6wYd2ejDZ3F+14M+Ho=; b=UyO5sszW54x/WeY5maNNreC+3u
	adZf2280TGDNs/osj2vyNEbNK2G1KCDxcxu8dtDyGH5R6UHmWfzDv2SnS7ZV3T2tBw7YXd80bH8ig
	I7YEBQca/V9xIMUGb/ESyshmbSvZ578O4vNbjfjZSg+2bkkCBNEMz0kK+7KlUFeleK3Dn8uowjFo0
	lA3/117QkNTFh58htWq13r82mrz+gp8rbMpdDHxSjIK1hv09Rhk4z7+eIIwqjw7dknzgF/fR6ERf9
	UXqcZy9DkrwWYljTLPGgFQOLz8YLJovp/srP7ZeDEEV04b5OVL+O7HmWogXTD/1pnPzJCthPCk+ig
	sRyMVZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz8A-0000000Enue-1S0c;
	Tue, 23 Dec 2025 09:56:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz88-0000000EnuA-2E3h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:56:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477563e28a3so30616585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 01:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766483794; x=1767088594; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwVb17SkiONM66zGI7EYc14PR6wYd2ejDZ3F+14M+Ho=;
        b=MhlvWeVAMkTdZj754FXMALBE2ILy/rRA3TpumTodhYi78np4mEZil/9OJC4z7eaIxm
         0PWUFuy3AJys3Hfb9xettPQkdN+uftl3thEiZoC6tbzi7k2YoyDYRaFD9vyRpcGUVHZV
         xrjUjet7ymNkmhW5DYCauA9R/ZVl9U7rNMTTukP4xy4VONW0COOpfpPv+5JBf+LQHU6l
         Re7QvbPSEOnfbRTb78G6zJ9o9VH8w1ckIv6pNCps/zzJq+fOj13N5aTw5H9FC2v1u7m5
         vAo2gtNkRtwG0tl4WD1+ig/TS3B2E07ZTgD1n+A0U5effXEufz59MhvuIY2H9VpF8d4L
         2DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483794; x=1767088594;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwVb17SkiONM66zGI7EYc14PR6wYd2ejDZ3F+14M+Ho=;
        b=L2h6FZroIw+IemHpTSfwnnxOFAA+Rmw0zqDAvjVCsbeJAt5rwqWrHdwNBrvBMjrIA/
         jFTZ+gOfU89vrU7EoRdZKsUClSB3KJT94pKLFNuY3psjuQAUDqRv//b9+VBj4L6TuTqK
         H7B85QEFv596Wpfrg/Ut3xigomdmzosPtjDPuIfTjRNs23kdqs834+B3ZRe5gmm9/3ab
         TdBkTfxeU9lGNqnbaAa+/PnUTucQwkWpdh3kFbYNFTsegPa0kDRyCbpUbN3Hihl7d+VC
         kZx6jmskqCAAV63EeTYgVAMnc4wjPUw3yfNFsKGQOhhW/CbaEP3Vyix6jfAZ7jAqK3i5
         RomA==
X-Forwarded-Encrypted: i=1; AJvYcCXHgsRyaVbmUwAe4tWvFf94wLkTwENYSVtQQyS0xCaaZbSaej+uUxx3Awl9ClR7sSt/uxg732dVb+lRgsagy6VS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf2lG3o+2NQPH++jnuMxL+vzJFLjcHJF/oFyhqM7cOpdul+kLe
	ALRyKJgc2qSu/t1NkR/EM/voBsdOGMvajvVFJQAJxh45LtXlZulvKRgiaUefmpYOLZo=
X-Gm-Gg: AY/fxX5sC1yMnITVYDIIeLxCu2YpSBLrVGm/7/540R3WeQ0V/K6T0duiKfRtib2tsIA
	VXbSfu2+NoRoqXrQpEd8No911vb6Dywsn1VKGLimMJWXXqYeSOyEXrGma1Ui34Upc9cbVfBkBpD
	qhaJLFH+i+mLasYQOCJuGhhKUTl+DxCb1UrAEgSzCsVF++xN+nLEJJxqJ9qw0oi/Sk7JnkMZz1h
	141vPUSqblV4AejWoqM4UrpvAs5iPdRgM0D6sM3dDTX9AcyiOgIGc6tJVqETx4wUVUd5Ax5xv5y
	S0B5iPgRCy1sgsUXiIz/c2WeQzBeCAzWkeaMey85fMl6jKV7N0n78ul7WYdMsk3NCGfhpeeEyRC
	cgVahNP43SfHtE9qp3Kiy+xOzt13o2w1cbZch/trVDqgMju8Lhyq4BGjYpJsoGK0P1plGcn7G5i
	Hqq6PcMkrBevWTVAOGFcn2mp6g1GI=
X-Google-Smtp-Source: AGHT+IHOPoabgpxzbwqkJAWzHxPTOtYYAX+lcS7QbhXZKZz5wUnl7nSHBNAH+unsA401WC75ARb6aw==
X-Received: by 2002:a05:600c:8b82:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d18b99b99mr130415825e9.7.1766483794521;
        Tue, 23 Dec 2025 01:56:34 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm228918095e9.13.2025.12.23.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:56:34 -0800 (PST)
Message-ID: <2150539a352c802372ffb9dbb3a47cf8b4e8a816.camel@linaro.org>
Subject: Re: [PATCH v4 4/5] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 09:56:45 +0000
In-Reply-To: <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_015636_636021_D4E863F9 
X-CRM114-Status: GOOD (  15.72  )
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

On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
>=20
> Add the GS101 chip ID support. The support is intentionally added in the
> exynos-chipid driver, and not in a dedicated Exynos OTP driver, because
> we estimate that there will not be any OTP consumers in the kernel other
> than the chip ID/SoC interface. The downstream GS101 drivers confirm
> this supposition.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 70 ++++++++++++++++++++++++++=
++++++-----
> =C2=A01 file changed, 61 insertions(+), 9 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

