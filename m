Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4C2C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKGMjncX/mlUAU2zGGZERev2BTvi5rrbEiYnIUYLlPg=; b=WtI1pExHP+5bxwmd1v0JsH0KCu
	709DnnKAGfucg2VdbUxZ2Z6pu55f/8/zft+wI/JWmS/NBrbCZbHL0yDM2va9MVmkdiN268vOromIS
	RQEZzv7m0GjaWs1IgzsMrE72LZrOM7rnOuoF9AOfZAmX9dxqKkPZ04hqXBDFo0eZoXZr/AUc17p1j
	FZoftj+9QAb7uthnXRwJDVgTcgPKcI6c/aBcV5vtlykTdqiKfnNCkelP4LW4HkIx84nZM++KUxpTs
	W/zF99Ll6UhOPGE0SDvCJmPMfjaR8RQr1IYb1jbdQNLxo0KmGa4iX1d4lNbAlVOqu2UvhGrLNNNYC
	VVzl8/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQoa-0000000AXL0-3mE9;
	Thu, 17 Jul 2025 15:46:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQJJ-0000000AUEW-497g;
	Thu, 17 Jul 2025 15:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lKGMjncX/mlUAU2zGGZERev2BTvi5rrbEiYnIUYLlPg=; b=eYCpVrr5dz4hqPca96J7XqW9Xk
	voh67reTt1J9zO6aoo2zaqKWR3y+1FNR/OjG93JpeKVYed5gASOsdZ48SUiyxDVHSudoK8ksjMLK0
	yqpT/0mSCkB3e4mkdFTP4l6MRM87Xvw1mQZaOrHM2LrxurYPi6yyOiEFxag7vrgfdnPFOv3DsdIP9
	x9V5L7+K1w5pHKKFtvgvNd55fCVYP+snxuLkTJTiMf5CcoQZJR8srjefRAQW7yLaIhsvKsoGymVap
	Fd08IujVeGV+KmIUKGaK9tqn67r54MC2OVU4VT0aCrjgdD/qLnzB9OlR4Ldo0G/pfoS3w6N9U+wQ2
	HOkZx5mA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQJH-0000000AIOv-0guI;
	Thu, 17 Jul 2025 15:14:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-235f9ea8d08so9637875ad.1;
        Thu, 17 Jul 2025 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1752765248; x=1753370048; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKGMjncX/mlUAU2zGGZERev2BTvi5rrbEiYnIUYLlPg=;
        b=N3nRwvATZJup6M0sIJwPjQL0PXpIdo07DuXqQb9Gok2OOwP1MlRENMP4957UWGepu7
         U4BavZmQc7HFWymB7r8cUA7bssxWf1wEK2Bgx0z/3Xdg4r+Fr8H+o0BlW+RyqRi1uIr4
         BT7Lul4hPD5E03cZ4C9A2lCYHlLmlRVRnv8UYiIV0Pja/gkklQkCYKmfUxoqwg728MD+
         R6ImkXVJda0dpYLS2L3923V2XJsbnbPSRYTpj+tGoHfPXw8KqXf79oNNHaZxwtOw6JhB
         5sWEicE/ouQb6O7HYgo19oT3Ghk6RsxWy11fetSGRc/+XPSYLpEeLNN9kAyZcZfGHOB8
         G0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765248; x=1753370048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKGMjncX/mlUAU2zGGZERev2BTvi5rrbEiYnIUYLlPg=;
        b=mqoKg8JvKQo06VfoybG58Jg25iht/+xTbJMh4d/Nm9aQp/29G2cIQCQTysjArwnyYv
         1vwVmrR4GxNpy6lf7WtgClNs10uP36TmGfkE1DLTRd439ZzDLSe/+ix11+qSLQcY55Nr
         xDuIhaB2C8x/2IiIkkTIEWl6jq2TqnTAotsIzpUWTmKxITHJnMh4TJ8u+QVD2OKpcV+g
         dxlnOqBwnj88T1WCEDeKI7v2OqPHzI5vmsjL9ORGY7L0LPtDSWkdWCpPPqAUjFlz5dpw
         weDKfOZ8Bpt/Byd6BgM6XsxwDxf7+NVHBx0UcKLfisB1RyzP51JN3+b5PYDDnMRROQMK
         hxqA==
X-Forwarded-Encrypted: i=1; AJvYcCUu1hI/vdcZuB3tceb+85UbRjxOsj5N+e8H81eftkLPGpXkz/43Xm1dQOsi8BAYhMjsYXedsCvF/7cpdyPv@lists.infradead.org, AJvYcCV36naDRZQNJQFo/Nq4BtM7hGZ67zDeb8j4hCoz/+vqNd69U1uS6Paj2VO3Inh4WfS+eGOtxMNgYCqUhs8nwBzCpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIN4JhLnNqFK4ovNx+Qd6/Pke+jLGY5QHvQIa1r0rR+4woBPEw
	eNH0UG51925RBNUDoxLJoAnpSmibzXDr091GcdR9sKNDysXYVhx9/CtqWq+dy5W9GEEx/tQj9w1
	l0LPKIqySphQ8Ncafk4ldQTzGZb11+zQXItdY
X-Gm-Gg: ASbGncvTTgLh6VfuLRnO+LoV+IQg4kWfGc1ILZF3vDJzZ6FPglGsG04IdjRZeSEg0De
	I9x6zcKj4jb8iV6oKCykiAQ5wT0KQGwATUe/1P+VKN0CHcBeE3iY09wIO7JBRS7cNbuHr4VGhuS
	iY9niU9JsDMjlt4c/6NVxJmOVkYxKrVmqKqj2sy8OLSeoEb7s+8hTU3MLhxqiXp8d4idEYsNgoQ
	iMUvPLhx6T+JmX/DtVe8A==
X-Google-Smtp-Source: AGHT+IGEcUpqZvjSoFcO58ZOCNsSb/LAfsi6094uuFw9Q4nipCPPgnXCkZ2zqSgvRxqzK4GGlVNxIeuhc5zwAnmu/D0=
X-Received: by 2002:a17:902:e884:b0:235:779:ede0 with SMTP id
 d9443c01a7336-23e24f56b5amr113031975ad.35.1752765248352; Thu, 17 Jul 2025
 08:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250717-fix-pwm-node-v2-1-7365ac7d5320@amlogic.com>
In-Reply-To: <20250717-fix-pwm-node-v2-1-7365ac7d5320@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jul 2025 17:13:57 +0200
X-Gm-Features: Ac12FXyF3gZCkEVrEH7cZlh9FPBGQz5KwJYE4HsxaOf1LrcBSp1OtWqHFqnn9kk
Message-ID: <CAFBinCA+y1jLBt6G9XWQyoaZOKvPaDEGYp94hu+fPSVWzOpgkA@mail.gmail.com>
Subject: Re: [PATCH v2] dts: arm: amlogic: fix pwm node for c3
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_161411_316930_2F34BACC 
X-CRM114-Status: UNSURE (   6.02  )
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

On Thu, Jul 17, 2025 at 11:29=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Fix reg address for c3 pwm node.
>
> Fixes: be90cd4bd422 ("arm64: dts: amlogic: Add Amlogic C3 PWM")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

