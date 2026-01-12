Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F573C9EC95
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=; b=2EogPhVBfPBEoMs15shvqR2Y9M
	+7XjN58UaTiUPmg6h8fZxULJblSeMeb52CJcfzXh9jpTxzM4YF6Wr3Uo24wpeXiSKwNBkQkgaBtlk
	yjrVtSMAblyWU9NxCEbjrLBDJksKxcwVRd+uM2INUdVLgwli2NT4ZziJErYONkxCuuQKWvy7CvYHa
	kKnOAos/Y2aT33mWsuSH6XhJsVej0QUuR10wwBCkCzidBj9qY1ce+bqbNxxeRJCpUkKZCJvo+9SjF
	vgqxPm9BJpap/35t2etomN2Aylrs84y2SoA0Y57XR7c98Q4KtUvrbee6J3RFyFHwilUqLFZdLfH5t
	4K8GS2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ0U-00000005Xjb-30Qb;
	Mon, 12 Jan 2026 14:34:58 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ0S-00000005Xj3-0ph2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:34:57 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b31a665ba5so792711685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768228494; x=1768833294; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
        b=Rk8ybIjqWpopUVYa+xY4ZZZBhvQc70wrPdjuND41KDs4YToFzmIYbWqyBN7kfq07M4
         NzRvJZu5WBjX5/hxZvbyX1ps2JLQGECD/WPngp5s21sA4ySBxnJK7b3ZvWmkO3a9/9ze
         Q0mJ6MTxFF+F//bpRnX+ml+x89qgl/TOg7J/BzgXsI/xEIwnZ2P3ECsw9qXay5PRFRfR
         8+8ZlZOdV1SgnOlltTMxOwvf8AK/TvtdSzJNlreCFjvTVTeEt0wZe1SzgMdSznP1SPtG
         a7rWT1X/94axOrAAOyVhwzLYq+9UIPIvxfPTSsW2XVXY5ufS0C331ZG5J+YGKbLBPMPy
         58Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228494; x=1768833294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3IZav8x6KeIVwEYXoT0Fb7mxh2EWJMO+2D6AGLXtFI=;
        b=o502zpAvnB50mTMUIaXIe+8ALw2xJgxywWW6l9QgnlrKgl40p3lBJIoYd5+zkzIhNy
         emQEwmQUZ7v9DEwmfNQE/4iHB37D3/8GpQYN6kFyoTSOeZTg9NauZxOmFnuNmFq5ryBk
         46bTf26WzLBaT2ElmbreBpw2jWc3pVV3E3cCrhi/mINNXnwLaReuBqJiEVCeKSqVWCkN
         7Z75rsjz70KxqiDz8rSjLiuFqh/R9Qi61d+qODK5fusvGBW5ttlGz1Iwk2tYty6PiB/y
         Sd3+KPwC/eu2cqvVgJCs2MKCYsHQO4S2sIbSzZ139ps6jr6dtViLe2orvWx5HJMsN/J1
         nTeA==
X-Gm-Message-State: AOJu0YwG+do7UNViIalv/r+6Pm+RJjbcu2B/MyUyUZO/oo6rUl9FNAmF
	7IlaxVGYn5PeE/D5t7veDcStK0C+1JceIexXT42wJmbs1heAgduU69yDU5Umt59wB7I=
X-Gm-Gg: AY/fxX5+NfaBYmex+gZ+08ieMtQD/c3+uZ9IDD2yst0FPF5xKXEInPS+LIofxbOOErG
	ZiuM6WJBD04IfLEd3NtWGyfrkBP2TjQHQDwtWd8mhgo6wMffBEUYJKPkzXphb3MVAn1SlXMBUbE
	4TwKd5XYv4jjIMaFetc6Y/6rMyAjYggGieBt/dwel94VqEPxSVP+MuYHogcVGSHOHsbBIZOt92A
	DaDCk0f9s/kLCDA07TaVpCExVh7Qcxuc0rVlhDlfiiMlUUlOa4skG7pknLeDRVti/SiWIxMbvqg
	W2UUUVFhf6saGJLc2q4FfToWiTIlqanouygD9fTQ1bUflClY+319q5lswaM5zz5EFHFq4Ia0bie
	vyBgJjn/zfK2XCbH7aJb6hrWCkJjpq+ewkmDos6rrCAai7Zw+TQUVtlJBhqh+RpG8wqGraP+lSZ
	ez3AXxwW68GWYePFn3TFqQtnf4A6c=
X-Google-Smtp-Source: AGHT+IG04Y7YMmlOxxQtJZWLENiUI2pQKTZxZxtP13zxTopqbGg/cTPtEwR9TRQdWUjb986bpAHcBQ==
X-Received: by 2002:a05:620a:4611:b0:8b2:f182:6941 with SMTP id af79cd13be357-8c3893dc9cbmr2437032985a.57.1768228494337;
        Mon, 12 Jan 2026 06:34:54 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4c964csm1519599785a.22.2026.01.12.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:34:54 -0800 (PST)
Message-ID: <f9141db956695fd9ae34f86eeb4f3f71a78d5646.camel@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: samsung: exynos-sysreg: add gs101
 dpu compatible
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:35:31 +0000
In-Reply-To: <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_063456_275564_B1A4AE6B 
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

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> Add dedicated compatibles for gs101 dpu sysreg controllers to the
> documentation.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yam=
l
> index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8=
008c7f9888a56f5 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

