Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77A6CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIXyjuQuCOrl0qpSAMQmNPe9xAI4vxQ6Y9W1Xz3sToY=; b=CHu7qVpTDd0vBW6oqJcgkrfN1I
	5uGq4YSaIAwxMP5wX3l+qr4luMTfBOlTBguQ3FB00F4SefW26/e+bVbrsQ7kz93UezAX9n4Zp+H8c
	feteIebbee8itfug6hgzoMIOM0rVwu14QkKpVP5/zqw5XxqI0e/rM8ylHUFunVIXnTpbDFfAcaT4M
	ulSOC1xHMaM8kF793OHcR4LhR0iXu0RuJZ05IclqZ4hiFYTV0VN9rVn41Rci+F9FBo6IiWMuknTQm
	oYsggGgmdCjUFiJIJF2Osv6vD3+/guH351PsYNYcVUCfZSNHa+khuV4i4BRlKEBc3KTDyTeERyyAf
	LF11np4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdwl-00000001Gi9-2VB1;
	Wed, 06 May 2026 15:13:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdwk-00000001GhD-1PZL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:13:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d7e23defbso3758094f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778080436; x=1778685236; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIXyjuQuCOrl0qpSAMQmNPe9xAI4vxQ6Y9W1Xz3sToY=;
        b=YKn2IfTjgYsySBf1MEDUdNoF1udnhnUdeSAyR7C69vpuIv1hq70N4eYtnbYJ2HYUz6
         HzmZ37WB7ogXbdRQvnh+Va+zS9u2m4VRkkb6LPKWFgfZ7VYSZp79ug0Cg6teFETYyCgw
         fDdIgv5msVZAWyQaRT6H2aA2z3Nxiwc8bPw7YlfP8XLXhrLeP0JDwXKrK0Y4sasnQA5q
         inceTuGXab55Rqao96b8EF/0Hx5fiGc/culBatnY/9exJ17ZJHvgD70n2228U9yx9pmp
         xrGSfb2uTD8BRaFNclBPCskt2RyUYd8BqI5xT4Q0GEn/3DOhuHRmIOP5bmM335zexVJ3
         Ak5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080436; x=1778685236;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIXyjuQuCOrl0qpSAMQmNPe9xAI4vxQ6Y9W1Xz3sToY=;
        b=PTKlvtBTtUtDfi13Fl163cA5mbyesTf/uuBWk52sTw1I4kIAsjv3pNmjjssVOfebCf
         hN9MTXITcGvjTfreyFNGQ+f+hCL5YYLFlAFcbnhziErYIQnoI+1GGQ3xq79piGqfJBxA
         RSB781dVewxtcVQeOUBLhcH9gNkE98pDm11AeJJ+f/oCE2GNYACbpliwKiaykqEx3fyY
         DP2I6ZFa9x2R2pWfu1FDbXbkSkxT1iX2JNJKDPnPcRgij8M3+hsJIGuAdlsHAvL7vuyi
         b3KXkInqmD06heLscyqQOpSfH4XTBn6YzrxoehhOwEik6B3ldyi9QHeBOibfqpzmnQ/U
         ae5A==
X-Forwarded-Encrypted: i=1; AFNElJ8l16jNmUZ/R443mkRuj8VWdAd0RN8gb0WqQxdRt2MHP77J3WyiWFWNko6Zdo+5rtzOoQNClGw1ZwRaWMbsEAmq@lists.infradead.org
X-Gm-Message-State: AOJu0YwA5UzxjtYxGzgvQNSq11wG4d1DWvhCx5OVI8qrFypyiG1xXVKc
	TEd9FirL0e8LhUk5WSsXlh9IdOcrZRSmENFJrg3Yd9rHGgoq/DsQY7dVbkB0Eena/F8=
X-Gm-Gg: AeBDietzh2ZeWEcf8Xa754uRZJ0XNB7yTNzDFzzA2z5lpDYbjluDiR2qO6+zIjG+9DA
	VYPHpMw1bZvRvcVl8TTrcAi/24B2Z3GC0B+Vd0Flr02HNoQI5Z88jG7AtQxADRy3ILpWCndiShM
	71t2WTHqKsBDNotpYQPx5CbiFOGOw+z/GctRUa2SlD/O8NxlLN9niWN7ICJPpvrDE/iXCv/vhRs
	a51Gvv6Q49hn1NYR5Y+CHHRV5D2HiwC1JU1PSSLKouV5Ws7olinuJBAr7CK94tSKaIQtZo7ence
	7PNmDxLjtNbwUSeBbOA78JyjaDN8NmzsK4bmpIWI2Xll2rHaRlperX9CWdqKPOiW5GeGUm1m8K/
	uKeglE4ABT1INcyHM70D0EfF8k53azNxbmwhL6z5V9Af71RJAtj8DfyAYgGwJUZLoJUTqIvJlCL
	2d582gZSsSDVVVZuMprTxyXFRdzCvflmn7/5UbfJI83Mtkq5VTfhr2lj3a+Ur+WWPjIRyXt1mhb
	NmC+ksCXGwGktYjlpLItYhCaPn/mFy8lSXzbQY=
X-Received: by 2002:a05:6000:288b:b0:451:26e1:3cd1 with SMTP id ffacd0b85a97d-4515d5c56bfmr6478647f8f.35.1778080435844;
        Wed, 06 May 2026 08:13:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:da69:ce01:65af:7871])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e174sm13297431f8f.1.2026.05.06.08.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:13:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 16:13:54 +0100
Message-Id: <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081358_406138_A9E19292 
X-CRM114-Status: GOOD (  20.14  )
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

On Wed May 6, 2026 at 12:39 PM BST, Tudor Ambarus wrote:
> The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
> through a hybrid model shared between the kernel and the Alive Clock
> and Power Manager (ACPM) firmware.
>
> Add the protocol helpers required to communicate with the ACPM for
> thermal operations, including initialization, threshold configuration,
> temperature reading, and system suspend/resume handshakes.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++=
++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
>  drivers/firmware/samsung/exynos-acpm.c             |  12 ++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  18 ++
>  5 files changed, 298 insertions(+)
>
> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung=
/Makefile
> index 80d4f89b33a9..5a6f72bececf 100644
> --- a/drivers/firmware/samsung/Makefile
> +++ b/drivers/firmware/samsung/Makefile
> @@ -3,4 +3,5 @@
>  acpm-protocol-objs			:=3D exynos-acpm.o
>  acpm-protocol-objs			+=3D exynos-acpm-pmic.o
>  acpm-protocol-objs			+=3D exynos-acpm-dvfs.o
> +acpm-protocol-objs			+=3D exynos-acpm-tmu.o
>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+=3D acpm-protocol.o
> diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmwar=
e/samsung/exynos-acpm-tmu.c
> new file mode 100644
> index 000000000000..c68d60b4c0b3
> --- /dev/null
> +++ b/drivers/firmware/samsung/exynos-acpm-tmu.c

[..]

> +static int acpm_tmu_to_linux_err(s8 fw_err)
> +{
> +	/*
> +	 * ACPM_TMU_INIT uses BIT(0) and BIT(1) of msg.rx.ret to flag APM
> +	 * capabilities. Treat zero and all positive values as success.

ACPM_TMU_INIT returns capabilities inside designated error field?
What about other messages/commands? They just return error code there?

> +	 */
> +	if (fw_err >=3D 0)
> +		return 0;
> +
> +	if (fw_err =3D=3D -1)
> +		return -EACCES;
> +
> +	return -EIO;
> +}

Could we map these return values with better granularity instead of
returning -EIO for everything else that is not minus one?

Is this error code convertation applies only to TMU protocol?

[...]

Best regards,
Alexey

