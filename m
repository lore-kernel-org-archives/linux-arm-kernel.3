Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9280FF588C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=; b=qz3yK6YvduUWWmc0SnQVw8/Hqu
	g/1FbnisS9ZJ7e6EahhbWNkUXUwpsqcEoXpi0v47e91zsKGghv6G3bBp9LjJXMdXJlhN2jNh+bYKL
	M/GXiA6APeNmUQEHMUNfC/C1br/dQd5ginRFCJHB5etELIQgAWSs7S94a/DEVRRX1/8h8xyoGsM+o
	OQXeeojr2bT7UZsn2gKSELy2wGoNTrz3BDdvUljdgKkDYSVHVxUYm4ClqFZyHg3RUqv7k1s7TPWoG
	IWiaqYbkBI7oduWTKT80+Xc07//mr00ihg1mJtUJHdMxgo95FIoSqYwgT8UKBrd5xti5o6y13J1Ye
	38Y/s9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnh0-00000006sUt-3RXn;
	Mon, 20 Apr 2026 12:25:34 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEngy-00000006sUG-0J7L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:25:33 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b8f9568e074so536619166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776687930; cv=none;
        d=google.com; s=arc-20240605;
        b=lWQGrrHk78NT5lX0Vf4B5Zf22lFFOkDO8JLEIhp1PeHKygoU2GAOKOtdx67ylFvguo
         DcsBM7u6OVlAyXs8XNurUHJoXC+jyzRbN+oKXEFyatOFolncKBNqoVu2dqDaSMZkKPiZ
         hIzN3qmjQyAU0cKICFByZA3CMSR/ratx3ariC0d5kT/ceeRwc4A04OCOYQg+PIW0RPAN
         WbHI+c/4qEw26aX1xxfTHiCV17ishJ+zTI3h8pR/G/U6/5pbDMt6OzWbeshbe4GXjciM
         HKUiEd+XLLKwlQdU48jzSbKsUuaKeLUiXY5Qu4Ee2p0QKbENlR9YmdzCR6GeqlFHaxxm
         PY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        fh=s0jxeXTTaoz0X7I4COZ6MeTI3BY8R0dqRIZmojWC3JE=;
        b=Z7fbrimwwdkR6QrUf4G3r09NzvOP0Gsn2eBkv2VJjjwZFIG/cU1GGwyvcTt6E4ut7N
         R+mQmG+zhko+5HmBKO0TwNj7iIT9AioV/8Mz9s6tS6Ies+50k9bqHF/LBstXXWWvP1dM
         vV3R/d4FydL0Tqhit81nsbMq/JsYuGMW7sObEi9FfTb3NLvgqxbEM5XJXvbfAS09SBFm
         Vq2VNxKGpeuBz+pbqIVVqBMLzT6ggjIc2p8UGhlGz0NtysTqIu6HiRwLFDUzHgQjvkmQ
         RJHxZvFGly0Kc5l8U56K89b6GQvRuLCHwazE9NFA0Z4+FFPLLsQObP2gRQ/m2dfdMgiu
         JjNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776687930; x=1777292730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=kc1C1K6wLcWKIb5pcQFFrFAbm7753rJ/2OQR74BqTgvMTLT2cU+ZaGrsQWXh6wLBR7
         FcU+kzl7XI0e9SZB7XfpkzDh5eeGoRvtfBtF8gd1qWrJv71iuJt34FOTRthyA+m+JVM8
         96iG5iEyzCl50gVRdDyjPryGD4xLk90VhOb0rWDhOBc94DX5i3FzsG74UhSQU4KIxyKg
         BQ6+89+lZfEaeNoh0sZcYT3m0Swoj29KtG58pdg7qFa2s97vGU4bR7l5YwHn6GQ1E3ys
         dKKVUaASyPEx8nqC437uysNZCtWqORn5ld8VHLQBdr/IfNvk3MN90m7PF1632PPrvN6S
         AhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776687930; x=1777292730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Y714/gi63AqvZzcusny7bswWgS5XNqcnWUmXP/JprI=;
        b=V/2ENRSTOUUk2kpXRjdqMNfk7nHWYYj9PKvhZ+eD1TcowR1JFd2HAwpDAgqx3cer8p
         aUyjWE8VupwXkxZyC8mVx29vYNMhtbRxaT9mAny0copxzDknqbLbqM8nLiceiOK0MJeo
         E9ARVjrraeqzMdSKdAJ440TRjYOJOnE4fuHWo5PFb0Lh2N6+xvAF5m+cWZ1puWENVS40
         kRmmUgaFwFzbMxWJb2LZktc5/IFoM+EYiTDoqjyCxSxctkufcUMh8IPj4rOytZNDIqqQ
         1HT46KGQnzNh95SWrcHG8fxf/OTy9GDonOcsjIF132d6E18pmO5LUxODFHVL4hMWEKJk
         r3zA==
X-Forwarded-Encrypted: i=1; AFNElJ+RUX6u0S4XKJU76zKZBlBwqDsEn4N//jkxLm40BfzscQfdg8hUOH6s4LxUQB4M0o0V6oYGLoillu0g8Lzojm0S@lists.infradead.org
X-Gm-Message-State: AOJu0YwSugHUYMqOac8qsvPL482yZ7DX7SfayCsuPBlO3+hW4FEnwm1i
	wk7hIdUc+2S/dH2xFZcCrshZPFQ3B4rUn6vdZnKQXU+QH4PhU7fVNCGQsWz+C1s4c2GeTgjMYeu
	5Tj7rRAlxPbMz4pOwF4ZeoSyXFYhwm6E=
X-Gm-Gg: AeBDietn7po5Nxz0G/Mx97iLnnJjL3QcjadklHZUO8k5UV0ih2pRfCdzrgsXUOFcL2p
	u3J8pNxJbIqHCd+0O3jATJW5g4SDY0xeyadUHG28vSkfz19PJNXQBLOB8aSCYEPr+asAprFhD/B
	mCRKsv07/ijsvla9JbiqvTpR1ZQGaq9TfMrvf8XFuNqV1/GC1rOarR58MgHsfwcMdJWAY3Wt4/F
	DJpnrA1ZdMlEeUA/b1bGnpTpFUFsp5bEVRltjSAsaWYqVd6yKOVqMeD9xvor3FKGpW6vZV2AiZO
	yMGXai2LmK4SSCQfBfOauUuo1MLe4ER9Q5CEeGHU0dmKsa18dpuFNsbN/9w79whDrxJAXwWpuLN
	i5PK+2FlCis+AfUIC5UZU9SdntjfjnIM=
X-Received: by 2002:a17:907:c30f:b0:b9c:bc70:e928 with SMTP id
 a640c23a62f3a-ba41a91d717mr643541666b.25.1776687929243; Mon, 20 Apr 2026
 05:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com> <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
In-Reply-To: <20260415-imx943-rproc-v3-2-9fa7528db8ca@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Apr 2026 15:28:27 +0300
X-Gm-Features: AQROBzB0Pu-szzo1dJ4AB7xUuHS3a3UgZozivXv7bKFQ8_vmaUhxl3EQBT9jCiY
Message-ID: <CAEnQRZC1vtN9nsbR6zBD++VkBVcVxxOBmPfEToeg2FimmkNMFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] remoteproc: imx_rproc: Program non-zero SM CPU/LMM
 reset vector
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_052532_128380_F2A6E806 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Apr 15, 2026 at 10:49=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Cortex-M[7,33] processors use a fixed reset vector table format:
>
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
>
> In ELF images, the corresponding layout is:
>
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
>
> Reset_Handler:  --> ELF entry point address
>         ...
>
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
>
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
>
>   ELF entry point:     0x0ffc211d
>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>
> Current driver always programs the reset vector as 0. But i.MX94 CM33S's
> default reset base is 0x0ffc0000, so the correct reset vector must be
> passed to the SM API; otherwise the M33 Sync core cannot boot successfull=
y.
>
> rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
> hardware reset vector address. Fix the issue by deriving the hardware res=
et
> vector locally using a SoC-specific mask:
>
>   reset_vector =3D rproc->bootaddr & reset_vector_mask
>
> The ELF entry point semantics remain unchanged. The masking is applied on=
ly
> at the point where the SM reset vector is programmed.
>
> Add reset_vector_mask =3D GENMASK_U32(31, 16) to the i.MX95 M7 configurat=
ion
> so the hardware reset vector is derived correctly. Without this mask, the
> SM reset vector would be programmed with an unaligned ELF entry point and
> the M7 core would fail to boot.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

