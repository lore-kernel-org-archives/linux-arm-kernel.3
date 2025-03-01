Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7835C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=; b=iAd473nhe4geFSdFwqA2ioQdDL
	FCSnycdPscltFAzxltBhXMt3gJsDfUGF98nyhb/ZTywT7VhpzaXs5EI2ikW3qbPTpLm3x7xcKTo5k
	QeSTzjfdpOwp/JHsxgHvgVfRdKECewMDsO5HjWdKQvnKxo8RDqpC/hgpMcZKhFH+Q35XZELn0KkEA
	1B6F84iY76V42Yum6Ggit0nrSpk6mmOSd0qsVuvfPPsmTkDUd9JVsMaEO3/bZKI6UZtxdqX3DfEp3
	jkiq38jslYIwxaZTqP7da3+0Eq25t0a5WyNivpK2eFSUQzcnFev01IVP9WEI+JVZITH5huIt+5Ykg
	GMWz6smw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toRMw-0000000EkgW-1Vj5;
	Sat, 01 Mar 2025 18:15:22 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toRKH-0000000EkPk-2lRF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 18:12:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5452c29bacfso3285006e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 10:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852756; x=1741457556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=BwJaihZkH530zVvmfCBpMS2GTE1ybPQWN45r4Kxib3bBE+/UZzfL3R2uWto/yP5TlO
         PI/9sU6RhY8lub50ig2t6749VK2IVeQh+rTq/g1fri781qyaSYkFYmdMhPFtXQ5oubnT
         LZWcbzTIqGCI+Iwr0/qFqSidUpS1VaLvLsT4RgUt4Lbaeo2HeCTlxlu5c8+TfF6zK0Gw
         JEdNFDs4+r1bcZ10b6JmKIziEjpn3tBDvEMkdIGw6X/tz7AvRHgco2ezZezNatSMicqR
         6XS1BgpsjuZ8RuWG1+ADC1/b3N9J2hqp7WglAVC+uhvK/9WBvEeTewjAlVaNfz0ST3MZ
         tmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852756; x=1741457556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=A6XO069Jj5jpV6vfj1JDXIradAiovNFf8+YwGsCS7XvLlh14bcebfgKpiUG49qfK/4
         CJqzGrTC+KvtBaATn1FsCqGkMK1snyNqvP6DY8TvH6TIivu44JmBZRFJDG1dTiityIZ8
         EoiY4qFcJhqQznrml+EszsBId9NLc9SHvmgCjLjdMTZyz5vFd0q7PhwVHPGJenAPIn7Y
         MH60Aq8iu/Vvbn+9hQfJlrr5TE6r03YVn9DJOxjATUZHdd/+/aOeZPZinVCWK8WOl/hp
         Q9jtgYUpwJ7rn2+gbZoMTqPGYdHfgPcUA16+DOJddMCXbzc3NnIfdLJzDTiKKDPbnkyQ
         qjmg==
X-Forwarded-Encrypted: i=1; AJvYcCVxEe4Be1oMo82QpkksvEUWYRSpcbQNJdeyq7gy+b5DxZhUzfrlUi7J13LwSPpIMN6IPI1M/E6cCOab6zR9tpBQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbQDBhBq81zt1J8cwg/IhgjMcAZYhhPR5QwPGzio4TUKD0gYdJ
	0fcnMTHz5E6sEp+U6RjSZgPJlxKnPycg6neff1mTYMVtuy4Uc5skJei0wpH2+rrWfUT2N6kdl0j
	Zuhv14O5yOYavhNQk/pvQfarwwmmRTK+HWlTHjA==
X-Gm-Gg: ASbGncskX7Ea/cjf7jm6k6QryDYT1xYzD38YKewfCdpjIaNG03EBB2cEUow0RNq52Kq
	c5LzRZ6LjIIa8jtQ00EhxiLGfTDccUoODq/tvYUFJ2+OwCEOcCXQ80O+wwGaEHgupSfXsB2LeKC
	/ksSVbitSxjQCXzvwNxS1yiApxug==
X-Google-Smtp-Source: AGHT+IEwNP6JAG/ImVlBbFKSPeJyF+kN1wgYSyFdUn518Azn4ly4yqI8vygkNmnNaNRO/2W3XMFUQZ4MRvI6PuiQBfo=
X-Received: by 2002:a05:6512:2391:b0:548:f3f5:b26a with SMTP id
 2adb3069b0e04-5494c38bc42mr3507636e87.50.1740852755828; Sat, 01 Mar 2025
 10:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:12:25 +0100
X-Gm-Features: AQ5f1JrMxHjOeiAFu01e9_js8hUt6QETaY6N275XhvcjrnB0bEBgE0astCzSAEQ
Message-ID: <CACRpkdaWjTiqSUj59YiQZ1jsJWzHZPMo3xS6n4_JwdAW6B_Kfg@mail.gmail.com>
Subject: Re: [PATCH 06/18] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_101237_697299_14AD07D2 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, Feb 28, 2025 at 3:07=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:

> The memory pointed to by the ::rtc_dev member is managed via devres,
> and no code in this driver uses it past _probe().
>
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

