Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50778D2FEFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 23:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=; b=lEOSYx2ZwzLC1M3r+aM0sH6wkR
	nU5cCbhmhmjPITOmXyEsbMF3VVhwh5R4duHtMNdYk0C903EJS6j+7+1zP1MQgYjiArimWsjojZ9JE
	TOB3k0siWKbu8NxE6dizbic96NhBYFO3jqiCKbwJ5jWQcZIDSqDfnbIBdtHhdcdC5064HmWWhnsp6
	PSZUUI3k5ZGYbpQNegyZwf/uPKYvzIo5qQgnNMHNDfAJPWroZNJ8CS8U2YVlpAKpilLDWxAKN13gu
	OlLUxd5jLH0vym0kMVD4/ZxF8QUMEN9y9p+B/ZNWqW8DPRdW0/78GDAP/HC7AsNMuQtxdagd5Z5iE
	XhZ2+6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksgY-0000000FAzA-38Sh;
	Tue, 27 Jan 2026 23:41:26 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksgV-0000000FAyX-3e1w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 23:41:25 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso6745311e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 15:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769557281; cv=none;
        d=google.com; s=arc-20240605;
        b=fveJ9ZUwZ5fqvkS6/vQFFIZvEXPTbIxKpHM2IVllTJ1hQl2WH/HZa1IhUs52UCKxb+
         67qQOOdiUlL0dxckLBbMnsSbf3vpFyMjLAlls0q8hUdG+vpqD4k+kHKFAF9sSroPbat0
         FhSv07mWMuBzDkX4UEYQ7UJtQebjyf0+7j9h30OGziLx1RreNMgwBRp06WTUFhzKKlxL
         6LHzUKjFBi77BHMCD19mjd4YQeVxNmTSRdY7KnfjMw99wdJ5s7jynZEP0OqzdqzJOZct
         hX+157nqq+t/Q7Lk/kUq2NAi4VduBm2Ahi8rebNuRijOKveWAt189mGjTwd9m2hnLWS9
         ih2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=;
        fh=mIuajA+DF/n8tWVsyO3e94/GvNulgROZNqQRKD+gZEs=;
        b=FOYqSLfpaZqJ8YgfQ/fS+lEYgC7MJWYHVytQgfKSkkJWwv/8y4rKO38K5DODly1YYP
         Wl0PgjtgjWwhbrvCpGXe2J+sMw5nSSP87ZY3NUPyrPbw+fUsEn9GuaDx9qQYODEIKr5i
         f9p6JlnpWxE1nfTPxRVxw+gCvAQTIfWFpOwKpqpnfw4xS0khpSfJQWHUXp2NhzhLOwJ3
         EnmbhYLnOANzibo8hoScsDcZ7ksHu/ozn/AMFmwocI3PKNG08EnmZ41r4mPHSYY6PlAy
         dzPHy5bFLHlU5Lbv3h468gnHJ+WYUPre3rMDWTim/GT8VSAiejssyBdsqISAo/JHgZo9
         ZG2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769557281; x=1770162081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=;
        b=AeeDO5LlOMFI3J1IrxH9odrionurzb5eYMOtxnBmL89e+L4W0yGz5JEEtiNIq2jZip
         I7yTo970XPhpO6NVGGcGPtWpsd0RQDWluxe74kRMey+SFsa6xbVso4rowPEA2StAIBX6
         cOco6f8b1dm6K1v8Sy8b8vKdCmEZJ9WkXX8qOOlFYAp3Hu4pq/S/Vxh2kCA9vrRulk2U
         u4Qd+RuxiXH+Ok4Hx5jHzc6c5QbvCgXNkT+ydsW9qZQ6vkFSLud14nr57o31+AIwrOuo
         uAmz+IdT+cbIP7ms8k4LuqfAJza4oLqFrivyATsBHrhY57H6O9zbp12YP3Yie1hnCBSu
         ZO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557281; x=1770162081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kmKAF87tQ+DKHman6EfaO9KsoR3gG9HljeNjO/MlME=;
        b=kDtPehEqqy+DUau1x3jQvV5DHc7Wj/0ff/h1cL5fxbf1Sm65zB9Ip2twVoNNinx59R
         OrV78/LMbr9ONMEiGYv5LKrzFcT0SmB6Dh7UIoNkP1fqXHC2xvYLnGPjZVdKNmELCXJM
         a9qdyTaT6zRY7+yP0aJMeV3bNn6sUhTHOIZB4Vxv7BHBUQ6BoOptNQpuL/lm4XsoS22f
         +Ng4IdQJwo/9HDF8c4zs2Oia0NTfjpBSTow0CpHXNepBJ5ka9v52SD6eBuQIoNZ4Eqmd
         XjuFtRHYqV18mBfNLJ5w8Ph+RbEwEaRHlWI2XEw9x1n3kewFwCZREfgBnc8jCd5J5iRv
         9w9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6PRwKszd5GtWBwkyS6eUID/bTT8IkDEWTj0CL8Mnl35ogWnqpQY1FK0eBtN82SDjrhYtyI7amN5GRIJmV3CXl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtrs1SR5Gy76IB2dneSp8/DrFBV4W7bngGLRf4v4+xNWBTyXfv
	ipWmhLk7xvBXMcNuOuJxW/nGFc1Qj9WkMatWTievnQIIvLzMH/MNbFnVPUmq9HR64EQkA5NhsZ/
	7tUUOAQtK1x5XIwNPK9wBkaIPg0TOi+E=
X-Gm-Gg: AZuq6aI9yoABWpjhePh31bw7y0up+7MW1R66bBku9Z/9MNaF2dsZAlSUGhDj8Ie/Ebz
	AxUHIjTTQu3DSmJpy7BMLc4ZPOxBfZXDEs+oKpJSFY1ivhVJbIX+LUGqVUVUnub42N8iVxljZsd
	M52CFUTwA8PFDrecR56taJUPvXJ82BrQFogw+9zkfgaplHMwtZn30anYZ+UNgEv3U54IoGG7I2u
	WcZ5koEcG8wEhxXaQ1s40+AHL6rFX5e4Df0+erziExsHUA1wj76Wf5h4qev81q2NhSZoEcsAe81
	LMgpdg9T7La5gYABoFxPi4b2NXE=
X-Received: by 2002:a05:6512:23a3:b0:59e:71f:cc1c with SMTP id
 2adb3069b0e04-59e071fcc42mr546862e87.1.1769557279804; Tue, 27 Jan 2026
 15:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
In-Reply-To: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Jan 2026 20:41:08 -0300
X-Gm-Features: AZwV_QirB8xtJhi5kl9yJ2qWiZEFsvTE9M5XNO8kGqz4pRn84DhojBOVsgWwGyE
Message-ID: <CAOMZO5A64Qy+3n7ZX2QG3FfXEwEX6KfMZaMhCi+5jFhWfBn=qw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@puri.sm, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_154123_957634_657AE18D 
X-CRM114-Status: UNSURE (   9.84  )
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

Hi Sebastian,

On Tue, Jan 27, 2026 at 8:28=E2=80=AFPM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> frequency is 400MHz.
>
> Fixes: 45d2c84eb3a2 ("arm64: dts: imx8mq: add GPU node")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
> Changes in v2:
> - added Fixes trailer as suggested by Fabio Estevam
> - Link to v1: https://lore.kernel.org/r/20260124-imx8mq-gpu-ahb-clock-v1-=
1-11c2e7c857b7@puri.sm

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks

