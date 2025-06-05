Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DE9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=; b=3+Q8yvg6LQPxSn+BE7xOEs2plK
	bFraFyE+T4jWCh+jMuV/OIfwg3iE0qV3ZfPnQraHCyYMVaz1Ck25TAxqG/AVH/00j9hTBkQBVKm/j
	LtXt92NH216PiygGDcXKJ+hSIVu6kiCwYjeZf32/jr4noT5l58eIUncMwT9cD9N2779lgMx0o+CvY
	zry65RZ0cA3SSL74Qdfibjndeqaa8ft1+hCu77GlptE2vk5CMoHirN3Ym0ErfTfp4hjFmHcBZhbnV
	bS+3Uz+E1PQrMjEFcc1JaXFhVWVslE1Ot9mhYTh+8a9AISp5Runx5XQ3pDa/MmnSFe6tiQAVqAgR2
	84E69uVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNATJ-0000000FbKa-3ohh;
	Thu, 05 Jun 2025 13:17:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAGN-0000000FY8e-162e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:04:08 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54998f865b8so901611e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128646; x=1749733446; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
        b=EHHYK83Ic3gSDtFFfLFre+8jsgvpWbIIrCaiuEYNVJ34fzjzeANTA98EYAOTHTGAzV
         8E+zhdSt1a01PRYcTS8zJT/d9PIinYqw0DQB2ntmaewwwTR1icE1XABOLhMWWAAVGYrf
         3WTdYvaEI1Mm4lfGbkRBmtLfyAZEsGkkUeOVNv9uqtRw+rwfU2lS+79Z5Hcs07eX7BhO
         eTrZMgBN6RujiMIUSGkT+AGIGgn/8AzYvygdRknibFsaMajBPmX4W/IKEdc4NjEQn8a9
         6pyO5paWlMTOumIumVerG2ANTtnWjt8rAkj2qnTfPclM4JX4SpcKDcibLNuN0/giXXyC
         rJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128646; x=1749733446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
        b=JAkjSw6LhCfoR/4bBKwkfilR0NdZqV48+RhP3I9UQJ29dahV0rl6SpEqCbV1Tt6MdF
         Xy5hjIBIlfsB3DLBtkKQZ1lhggVFmiEdtTFWlo/YwddAi5muiAr8TZ/BYje7TEjxkPZq
         B23GVvMVdGtO1u7VLxksR9HgHt56FWq6DUbLGzd8n/aeJlLMf/B2VfL5DAFYRKx5yybW
         JB0rI84SS2lqknbQOw04HgRYjTssMWDQsbH/zLStZtV2JUcbPargNhvB98YbWk8j81dl
         tzQxTQCXdV6A7vRinbLmQKZAZqo0EGfmwgYv7A8QbRvYVxYHwie+evevNdSGQ88lZ7s7
         3vyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzFW4BuaWalYKbCkp2GReOQIlgGYObKeT5sMqe2Ws+rZbq038YaQXaedEgJHpzO4OhjEBjF2nhv27KFZVw+J0C@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ0eV+kZcTH33xNfIg37QVpOa1uRTcm2XkXPmuZvZxG3/PUvHo
	zrY//A62MyuSPrendLNF67w7uKe54tm/TUakePk828TnZf9eU7Zn1q+8UcWXQzCQaDuSDPFxFzY
	79juilTX/zsGLKOWBrf33rEoQZaTRU833fy1Vd+n2MA==
X-Gm-Gg: ASbGncsTRyZ9O2+cnIMDjkwN4X8gO8k/42UwPbKO0q0LNTXHwIitzFASStzz6IcLPoE
	3F7JpYQuPzQP9kguXTbOWE4zaMvq+iLVI5y6kMbscoHwyxSlB3Xz0rnShNq99elOB9RyDzfkMyn
	qLuj7O4jdOX+00tFXo2fLWJb5r/BJVDD/w
X-Google-Smtp-Source: AGHT+IFcPULkbbdrU9YX2kszYmWTERZ0//0Le6dHomayrozyq+3I7C/+UGmesPBjV+IcBlIt/T3KkSYORg6xv8C76qs=
X-Received: by 2002:a2e:a90c:0:b0:32a:869e:4c13 with SMTP id
 38308e7fff4ca-32ac71a1ff6mr18438481fa.14.1749128645400; Thu, 05 Jun 2025
 06:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:03:54 +0200
X-Gm-Features: AX0GCFs9rU2_ZImIle5775iF8CDEkgQxBaV1si5YeNX6UMb2_fcREUrHEpczaEg
Message-ID: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_060407_311277_C358BD76 
X-CRM114-Status: GOOD (  10.24  )
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

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> Cl=C3=A9ment Le Goffic (9):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer

Can I apply the driver and bindings patches 1-4 separately
from the rest of the series?

>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard

Or does it need to be merged along with these?

Yours,
Linus Walleij

