Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E13CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 22:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkykz3S1CyycQbNzf0lzIqKhpFUnZB571m9tUf64HTs=; b=iHL+13pdotmxELM5q5ap6iOjvq
	lsE4NHrx3MNoA7fTgoKQN9IoNUOtEgHZXI46ixLYr85SdCPfNOK3r9R+I2/+me0Td7KO6cVpWnjyD
	GuXYhFw8GhsdzBmDkonajfcj5akkkJDZRhjOELQjIXLvANLtyevK2EVUE0Pm5iqefxZ6Rl7pBaIX3
	nAz6Wih9Sqqk3fJDDXzgiUfbhkaR3K21VsKwbkshIb1n/zQhzQ3FdALyYLx/Db5cVpQQTCzc9Tc6l
	Ij+WvWLNaWRZ9S1yMTEhBjfswIE/Fcj26vkuTk1Ru6VNc0wfesuUEF+yYtJ0ydYzo72fabzx0TZFo
	y5pyg3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIaJw-00000006CYz-1GS1;
	Mon, 10 Nov 2025 22:25:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIaJu-00000006CYG-0rLs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 22:25:07 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-594249d3732so243160e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762813504; x=1763418304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkykz3S1CyycQbNzf0lzIqKhpFUnZB571m9tUf64HTs=;
        b=ikP5twii5vRIi9wFGkm7BiomMu9yvfvFusJJfQfE+BW8nuuDAPqhGqpLQO46Y9Qw4P
         V+7/o73dpaWexD6ijxVhYH913Lg1NGviRYiIeEDhkRtEqpgo1u1yPQXmRkknZmRD/dxl
         tfFOlVr2TouGT0qDrYtYzGi/aNi5USVz8o2ECNkGP/94rmeCPgbteaq6zMLBD2XnfZ4+
         VYfOATStmtzN+rxsYPDpekqlaqQRxfOPAO6atXBvdXvJvXLNj4RiYaJjkwZRW+ZeCbvG
         5jjI5DrMQCgQbMIZ4HgXXFw81pORPhVTK9qhnroiIzhrSREhR0VWHA372sZiyyPUHbNI
         FfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762813504; x=1763418304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkykz3S1CyycQbNzf0lzIqKhpFUnZB571m9tUf64HTs=;
        b=UEGB4R8s7CVlZsrFHjnpl5dyte+/Gtt9DFpjg67uWUn4K8+tM2LYpkL5iAC7iLLIfx
         hqyUJ6df+KsanokoIOL7pxgPJSpU4B0konBYCIJqtyYDVm4qiYK4oVOytolqFDc3Ddav
         6S+uirJwtPT2yGtEMl4gbJKJ6XzMsUDAHfmWxReeuUULUzX+HxJsElRUUDTub8ShYO++
         xAFemE4sGkiIYrR9pFYJGnjBo1JIKzSPNxMLl2+WxPm0VcPQg7HPU4C7yvaarwTrsBDA
         PAagpQnttDh6CS+qS/dblTy8lvaQO9ptS+fozE+oywMZllOU71HFrim3HZULruinJE4i
         MM3w==
X-Forwarded-Encrypted: i=1; AJvYcCWIvvQSpNWFLTvDmB1Bx/6C2NoZgyA++L2Rn7UPWGmlYOcT3zE4fgKMusPsPS9KJEU3iBMk3NbQntYqXLZ+QGvD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2qTRMCyD4b5QefKEE5cK7zze8tITcd1lEYzPiyx6/oJOzxuZg
	AideTlD1zKEMIhAkOQG+CjGe5uPMma8AvI5GmfCUIqGRhOAPUVsIHBOvCCtiddFA9v4FyH/X31L
	mgwn0wUg5r09+FQuw5m4rYUFfyqk+z8vGMuG2fRaIHw==
X-Gm-Gg: ASbGnctMF87Ul3SeCR/SWLSBX0oyt25Fhr0G+rH0RAjA/KjQFGSk4V7hl/ajFPFQH5T
	Gn/6W4wDn0rWci+FooKU8xfdIKun6hMCWzArIAmwx3h0jqMEXzjK7TcyqBQnFADYzhT1zL8+6QJ
	YZKmpsBkqtVUmZd0bGpuYx6k9N3P88/kONvPq1VjVdRn8WpEfAYMMViGEUtaa1SNQA8ybvs7cUo
	m85eBQsdd+xjBTG6Q3TrA9WpqArlVz56V0gD98W4AxALroe4AgNnNko5DCX
X-Google-Smtp-Source: AGHT+IH/bobBHFWFdtH9zZZK7pDa53PdeYG6iIiYCN8HDJy4OkCpiUpXjuiD4ZHFmsvNrZImVkrpEn3cIhnyZOsajDU=
X-Received: by 2002:a05:6512:3408:b0:594:2c42:abd4 with SMTP id
 2adb3069b0e04-594745a4d40mr256456e87.5.1762813504005; Mon, 10 Nov 2025
 14:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
In-Reply-To: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:24:52 +0100
X-Gm-Features: AWmQ_bnqL4tp4-XtSfjpF2SJDcbcu-l1tzSoL6TKzmSJf79bXaH7H2zLWLM2NeI
Message-ID: <CACRpkdaR=_K-hewNne2fPN=RKu7iyOe0gLYhMEBfQVvemJJuoQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: rockchip: Add RK3506 pinctrl support
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_142506_261146_427E01D4 
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

On Tue, Nov 4, 2025 at 3:12=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> w=
rote:

> This series adds pinctrl support for the Rockchip RK3506 SoC.
>
> The series includes:
> - RK3506 pinctrl driver implementation
> - RMIO (Rockchip Matrix I/O) support for RK3506
>
> Ye Zhang (3):
>   dt-bindings: pinctrl: Add rk3506 pinctrl support
>   pinctrl: rockchip: Add rk3506 pinctrl support

Since we have consensus on these two patches I applied them!

>   pinctrl: rockchip: add rk3506 rmio support

Now you only need to discuss this with Heiko and iterate it.

Yours,
Linus Walleij

