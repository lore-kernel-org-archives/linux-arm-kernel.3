Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE4DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=; b=VASBPwLwgXDiOuBNui2ItCTeJD
	ARk1RDtUa5VPw9RC0WLYDOQLDBWm0UjeX+dFhjOthPTT+t2fz4fjzHTsQDs0Tt9pHZgmRE429d7/c
	vrXdNqTnBTTMd2bTL//NWqE2Z9gZ+duQi1CkIzqR3a4qHLoNj7Mrrsx/QNpWc2weUhvqQWQ3D12Q6
	M5frKxIdRUTdl8cEAPBtPHMcBQ3dpyoK9jnOCV0p7gXQT2Yd9ZM9bcfTG1oV5vh00avct2M6V6aO6
	y09jOGXA+wFiz2FHVQVAkn/xB3R58Z/HrkGhzA2cHmiw2sxi79yObTIfa9UDNd+7IS4L3O8ctL1kY
	eye91cxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSeA-0000000CliJ-34SZ;
	Thu, 03 Jul 2025 22:43:14 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRuQ-0000000CfJU-3EX5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 21:55:59 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-32b5226e6beso3623381fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579757; x=1752184557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=Ho5rm2XAtotTg/3nb9fXU00a1gYI2+gPNLPQDaQ4Z2DgMDSm+fveHwsrGdhIEEbgOm
         KdTMk97qCu0m87PZdgABtstJI/gZQSF48lyJ22Pu/GL2dv9mcK2L4WfQ34jOH9oRyHYu
         cvB8dKYFCNE6a/E1e3CvaA2VfwcGibwURfOMkcwStscVI63RK1R62c0g2g6w4cplwj4y
         gNp8jvFEgkJa9erZAIV7XT6D7nS2WexGa1SLVvzRU6LmSn96XOxrSMsQg+nmxTeWZQqJ
         ijCy5tirliVTROZguM0iuFfPUODhT1hY3zL8AGByj4RVVmss6xZVCgFe61WWYo8yBE4W
         YpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579757; x=1752184557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=SB+aqQC4mWNTI1dRJjmRUnl403AV3PmBIO/8oHmhC+SUFVzY3RBdgO3xaklnQnVORx
         iTtIdtTM8dJAbQdAT2cMLpVSsq/ea59SfQ2j7GerzxSVOwe80F1dRiJIxtEODN+hVaV9
         zhKN+SNLYjCeRAKhmyqtiKzpD6GL67lAV72YChtvwP2LQj2MaxHAkBHD8PENEYaGF+wQ
         CZ7k/W9vkiu5wBR40CysPBKdgS4ko5QTlhWZiLRuMHGqQuZ9Yx8lDokDgJcXaRHD9WHY
         p4j52KcjP6vKxh1Y6Vu0HpNlzOb3FRjolnvD+aNIOF2X++LW79jnlGZa9zJQbGBaTiya
         t9yw==
X-Forwarded-Encrypted: i=1; AJvYcCUSntzjDP4L3Acwq6XxS73dbxfBy/5nw5v4egtGTtgJiXS+rl6oCjMYFm9KjOhmzasPNCOEmjaSPfIN/dkJ2Oju@lists.infradead.org
X-Gm-Message-State: AOJu0YxbQC8vyu4UvgCujNTYwajkvFBb839EqM2IphMRIiHUA7VhZq9t
	vDRBk8hbRZUyR7IvEulbMZScZQU+yw3LbEkcxK5Ah00uwwZKKdqi6IJAGPPRD2W2ZynccS6wlhL
	PKGAoKlaoo8RrKZ6bnLOlhlke3rKOZLjZvK0WI52kEw==
X-Gm-Gg: ASbGncsIMA2d9kwyaymc1HtUNb9nGrDteSUgNUxGUfyDIx0mUSGCgw8Vllf0fdIqgwJ
	84t7frWgOiwQ8AzCuncvVupv4X6l8HjKhr7NfnnTkpwtNyujec+0HjndTITzFSgz8lyZ3bkys/O
	4JsmSfSVcRziV+6JPZ4Tuqd6JpQ8GkIdXSSd0Xdwg+VwU=
X-Google-Smtp-Source: AGHT+IHaNTjaTi4rRrNiknGoZhKdAy0nR6vSTWwutP5sj+WgtzM1iPq+I6faszK16by8wPiLXBJSSCeRTyl3tRP9WBs=
X-Received: by 2002:a2e:a9a0:0:b0:32a:8153:6934 with SMTP id
 38308e7fff4ca-32e5a4b393bmr565651fa.1.1751579756933; Thu, 03 Jul 2025
 14:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:46 +0200
X-Gm-Features: Ac12FXyJ5knyp1mOJyZQmth8ooUCQJdl18NRhMK4RYZjhZxWH_hhFCTHLqF6V_M
Message-ID: <CACRpkdZ7B7FZtU6a+n8qcvNhhuqhzeZ=jfs+xQPqAWLa5n2LAw@mail.gmail.com>
Subject: Re: [PATCH 12/12] gpio: tc3589x: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Andy Shevchenko <andy@kernel.org>, 
	Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_145558_804354_CACA18D1 
X-CRM114-Status: UNSURE (   9.41  )
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

On Wed, Jun 25, 2025 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

