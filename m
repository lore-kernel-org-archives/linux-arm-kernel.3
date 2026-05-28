Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A3ACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID4UwDlpCCXcsLMnyjkMfD/ZISHe+vJrAY1E/iAzyuo=; b=pvgGR16QpaI0G/gsLWDmGrAECP
	CSV8S420Dg4eOXoxnbbT8XX5gPQIVbrUe46K75w8z+CKKhkSwQOsndTrMIg8D4cEL09qfiqUKyjE9
	dyqxAGF4XeZmEdvi2YihT9oME/cNQPnzLRyOf9gFcputOYKBoOKi4081i0yDfcM7Zje74wizAD+Nz
	VWPYm68YCk5uoAVwF8bQesI5ZLQRgb4HdVX3DL0lYFtHCuOyXUz1+7f3eqbhKFJMG3RjqTvCjFWtQ
	yOKqU8LFvT3AzVpuWUuUW8zug74h1mzmiy5e+D3z8IS8XVYVkj6AUu/sy9U/t+u0ozFx60DtQ3h3j
	AxM0WVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW7x-00000005OB3-42U0;
	Thu, 28 May 2026 08:30:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW7v-00000005OA5-2Yja
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:30:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45ee6d32402so203038f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 01:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779957001; cv=none;
        d=google.com; s=arc-20240605;
        b=PLxSDJdFCVsZJqPipN0GsKceS7r70fAA9V42KhZb+iTuwnl12OpMZAoqJrXdlnyfVm
         DLvHlQ9rmxh8Sftky6aKpFdKnygcf9xXKDWWm0BbDfpGNlGaW2rfYzy8qECOnvKKxF2S
         ULp8xsZ3lPHS+I9HMR4y0Qs3Rn8d8f55NNwzvDga3Rf2ImEiKPSqqIJg5cvzjcLoqQXb
         vLLOpYUK4HfnSfVFCGGbMO6EH4C5ZuasFdZFEUMop3tNUJVmhxy85Je8WMwFsSUdyPFM
         Fq08GhdHDbCN3xXfehTVu1xwXEbO9Bn4AhrF30BMCqwwRENDRDGJJy1+ZV4IpQigoOqU
         C1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ID4UwDlpCCXcsLMnyjkMfD/ZISHe+vJrAY1E/iAzyuo=;
        fh=oeBgTA/RlDsyf0ufgYG9rZgP9DOzUL7QIU7isFHXMjY=;
        b=iBb9rN1GhfxVMIj8di6WaMxBhrXHwB+x3eaqKn8BeNZLGQXQRzPftnoFGNs8P+k18o
         D8dxCj0XQ5L0duQ8XkEEWAA1yVcytyrjZ/c9JdFZy10XQzSxCW5BZGTqGOu8w+NqbMMh
         lnqoRwkqd3ATLHDjMW3oldaFfLlBRwp3gHVOIdw2L7BQDNdfVbL0OW4HQooU0uUxBbwl
         Y/n1bC5n9zhhkUVb0A5In/mqlr1l3fPq9Vfl2roodHg0HY3SGRwZrI0LwvWZo+cqGEgd
         JskX5mKXib2B22d1Ljur0tbBYNVLbPU4VLmcJdMZSmY9XE9YaOOPSYaj56pbH5S0VeXp
         bS7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779957001; x=1780561801; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ID4UwDlpCCXcsLMnyjkMfD/ZISHe+vJrAY1E/iAzyuo=;
        b=VGBxOZqFyNRQPqqnMt4JN9cp/2uByT5dNGh7IS4UU+vsdPoJBk/w6uKVGIttpiRZPe
         uf3c+a3fCmrSrFN+VGgTzMd5odHTh4y6knRj4K0RxJyGHX4lxcTgKOnVKE6Xbus8SeGz
         n7LN3tZ987vyJXHrtpdxN7KXfP+s/jXcCntq0qLtHGu0onM4A2tFLExmq53Px0kgHvYp
         5uVZEflkZUjOW+BHs60ffsGjXkDCp+wU9Fv9biAPjJ/P0eFUbWI3ZZj78y/Rmfa1C68g
         vRH4DQfng3a0p07z3I2cLZnxLJGG3s4dWq07n44UUJbbs03nBkEjypTrX1I9yXqkGUVc
         W+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779957001; x=1780561801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID4UwDlpCCXcsLMnyjkMfD/ZISHe+vJrAY1E/iAzyuo=;
        b=I8Djl4Cjjv8l2rpfqvC2rNOxlAy36y95pCuazKUwHAXo6wX7VHs9agOyh1I1bz+Kgr
         iOy6P+mcB9FbRdPXdLFh14NP7IiVjVb9cONWvIogd8hH5N/IIy13zQmHuOHiQj3kX//b
         F0ZaWxBX1o3xK6kfTJW4DdvaMmaf/+qnraHa1gRxgVRt80r9yenTH4ooftBUsaqCa0kh
         /TM8S2uQG0WQjpCSJx+grhofCNEHr3+jWfB7eobIQYTTb3dlKqR8aUL4uNzpklJWMObt
         yeGHhxGIsg4Nib5stkJMkxVLnzth4ZH3LsXCoYUWat/UEuYV/Zgf/CwUF4UzL3DgOtvi
         vJBg==
X-Forwarded-Encrypted: i=1; AFNElJ8Qkq58gBJHBQPPLOxmMzBSbaBkY7LX/jcRlGo9hBdnFJrym6thtpaEDw/PG3mCgWAILBrGgGZzVHZ/6UoiJa6p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc/RJAM4RXtIYuu/vJIbe+imTK+EAT6U4gv2i0Szggz5jSAMr8
	boo1OLdSlUEPI0tefflkn26aHKJ5vopcrVt0DqlchWmKbooIRkWwCDE7n6QmrVHJlir0Bt9PZv6
	MYwrAlqjsMpn4Vb1jGOjc4lz4U3V6GrKuFt9G
X-Gm-Gg: Acq92OGH8XfLFYZub+ZufyD+eIOdLgv6zPGPX5PNKh6ipJlPX+0F0Czjh8iQKwtGyiF
	0gxNY1CaQ9TR6BL408WmoMfTqFdEx9SKKCbTgN9pi1YyJzTebszcCM+61RCIlLohdFiMhL34B4s
	j/Vm5vHAzMTgeb+ehTGYfhO8nOEFPALGt0YU+Xl7oAwzMQZTN3OxVOLmTCPeF8Rp81f3nNj2hjx
	xPrwM8srk9oWl3IKShNF6XObtyRr9VjK5h6PC111Cfbqp00MteWE1ADMtLGo+gPZuiEzERgg4rE
	9itNjdzTJKK7CQop15ahCNDXXOzKj6Ncc25clIHZe2F7pQB2nN+l95LF89/JHd6qk0/ugCtKyXv
	+vXyo2aZPEjwoOxB9QasCudE28dDitWvRK1HDBQXs2Xdp+vkPnPuKdRsKAo5msaiWe7ptS9TXcM
	StjVs0ZGgpk0zhNOeh
X-Received: by 2002:a05:6000:4803:b0:45e:7c19:a328 with SMTP id
 ffacd0b85a97d-45eb38a10ccmr42056774f8f.28.1779957000834; Thu, 28 May 2026
 01:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
 <20260528-axiado-ax3000-ax3005-saradc-v1-3-345dd5f6608a@axiado.com>
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-3-345dd5f6608a@axiado.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 28 May 2026 10:29:47 +0200
X-Gm-Features: AVHnY4JEcnrAWjy5oZLP4EwsnJKky_x459dwwxnNTUDnAC-f8N5TJlVzJGRJzhE
Message-ID: <CALoEA-z-X5p1dfNpcqxQ7ACU7m9o99i-YZjg56+wdPSv8TiFjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: add Axiado SARADC driver entry
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_013003_662293_9A66EE97 
X-CRM114-Status: GOOD (  18.18  )
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

On Thu, 28 May 2026 at 10:21, Petar Stepanovic <pstepanovic@axiado.com> wrote:
>
> Add a MAINTAINERS entry for the Axiado SARADC binding and driver.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..e6dadfa65ee0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4312,6 +4312,14 @@ S:       Orphan
>  F:     Documentation/devicetree/bindings/sound/axentia,*
>  F:     sound/soc/atmel/tse850-pcm5142.c
>
> +AXIADO SARADC DRIVER
> +M:     Petar Stepanovic <pstepanovic@axiado.com>
> +M:     Akhila Kavi <akavi@axiado.com>
> +M:     Prasad Bolisetty <pbolisetty@axiado.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml

Fold the lines above into the dt-bindings patch. You're adding a new
file, so it's best
to have any changes to MAINTAINERS in the same patch so that it's already
documented when the patch is accepted.

> +F:     drivers/iio/adc/axiado_saradc.c

This line should be added in the patch with the actual driver code.

-- 
Kind regards

CJD

