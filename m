Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8688C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/txNyQu2BI0vIx5c86EaLSOS1gZfrKfoUZEaa0Exzms=; b=1pM4hjVRbBslxDNYr2IuY+hrQw
	Jt6bNYwyP9+X5MVkB8CjjUutMBd3ypCaOxDGmcfx917WqXYrBUGXLZ8Wkp48V0oT7FjHpu/JQVAH9
	RiLdNvNpfiAjRqiN6kEUrDC2cvR0BGTz+8BBf3GCx5S/G3vGstL8NkW5nvoC+ckzdN3BdbyaVpkKv
	U7QKaKZ/g39TbsylZTIcrNziZ3QywbFLWpVQEU3qAdwt1ruYt46W3tyz0D50hTbQ3FhT/EG/HjAPP
	XpcyJf2knDH0Gpniz+7iexh3tv9BzCfTsEJcN42y59IdKAYsEKov1VXzuLR1JScpVl2vLbsfyTjt+
	dfBtZryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoWI-00000005Fu9-2MGD;
	Mon, 20 Jan 2025 09:56:34 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo81-00000005CD0-3HqL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:31:30 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5f31f8f4062so2057772eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 01:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365489; x=1737970289; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/txNyQu2BI0vIx5c86EaLSOS1gZfrKfoUZEaa0Exzms=;
        b=zTTepkYLW9Ub9jhbEW1G7MNNtOPXyf9vK5yptAgZmghpey+aGheBIIBVb9DXQwL01I
         WMkeDrxwG7Wi3zHMsPsW9qp2KrLs/05JK5ZJ3z4HUA9Ua5j/DJhHevF/DRIp+xJzWKZA
         iNvb/QPmSHvr6U6I/oHK5ncFjmDG4k02JMUhbsvIIkdKx2zIqFwxyZPoCyPl3z1Dl7d+
         J0aj0qchJ+ZtAcYLcr28NbwvO0aoYuTaVZRSbb7pggCEQe974M5dIAyaugerKZJChje+
         aEWnxRK34L5ekfDdCvAVwnow7wm3pK9ZqC75L2g7ULL40pJTanqMOGW32hHUEmYfuf+I
         QZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365489; x=1737970289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/txNyQu2BI0vIx5c86EaLSOS1gZfrKfoUZEaa0Exzms=;
        b=c9UhIyfy2NOChyUPiIOqwBUBzxlyg936zfoaV1LbIRAwHS03xBnfTfXw0Tc/vN2yAi
         7+8HjkSNQ+3jMNzwPN+ivEL8NCwssJ0RQT0A+r5r6JhEwVcsZrZP2twkFP0PJn5aLjD5
         tdadNnhB1Mx+GPOvFbrEN/O7GPcBWiqqFZUA34s27FSSrv59p6Xdlwl79g/vgX33NO29
         sHoKLT+hK7TqaZk4R0Y1tEz0dUfhQr477euDDEx+qWo/i6cHLsD6KISBPfEgASvK5+BX
         yBKXK5aUaojsZkE9Q9v47ORcOxY2juWYr7a2qzIPf5dpD2fzVAlsRUt4QmJZZThAPLqY
         wYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH8mZO/AvVuo+mAxRX2xDEHkkKOP+iifnzuwIo3nYwF27TDvcjO82B07T9eFqIAPZxCr8w6ZUlRttzrK3ZbN+5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3MzLA4IU6K20rSpA430MoRj4dvTuycYU8GD/xTggH7VSVu9np
	qCxyDXzrDWvSpdlyAOUJvt47iXmZ0wsWtYewplAdIjB8b2PvWsEHkxYAiqkpTB0Ko+QU/iRnrFV
	b666lCHnJSLw27fpiEVxmthQfE5lfjuOcgVqzMg==
X-Gm-Gg: ASbGncuMxeRlm76Geh4u98/ON+gLqBJFQiyTY8WOv2gdCQepkm/iP78l68aWpNEudOB
	Xlwmg5P6/JN5AV/2rlzrI6mc6HMffkRjJZNbaqPvNbfW6077FspI=
X-Google-Smtp-Source: AGHT+IF8len7DYYtDJAgNhF4OWjKUVOC4YIVlj3v0nrpLbI1QFEg8CYynCXmjD6obOo0TkU5UVshdOMsj5zP1TGy7io=
X-Received: by 2002:a05:6820:20f:b0:5f9:12bb:4e22 with SMTP id
 006d021491bc7-5fa388a4597mr6443440eaf.5.1737365488821; Mon, 20 Jan 2025
 01:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org> <20250117-gs101-simplefb-v4-4-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-4-a5b90ca2f917@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 09:31:17 +0000
X-Gm-Features: AbW1kva-M4BHCc_hAA9pu7iTT8qDuD1HyhFEle30Ny8cn6ziU_A-M8y799oFSCw
Message-ID: <CADrjBPr32JdfwMFWB=PB_jkXddqmq_4CDd9hqowW0tzbSXp5QA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: exynos: gs101-raven: add new board file
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_013129_820988_A7F24DE5 
X-CRM114-Status: GOOD (  10.58  )
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

Hi Andr=C3=A9

On Fri, 17 Jan 2025 at 17:10, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
> (Oriole), this is also based around its Tensor gs101 SoC.
>
> For now, the relevant difference here is the display resolution:
> 1440 x 3120 instead of 1080 x 2400.
>
> Create a new board file to reflect this difference.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

