Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E79C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPyyWITg2Eop/iHLzqVBwj4t8oamM1QAzgzHz2VN9cs=; b=46F2Vx99lApQPYLE7ZO4aoWrkk
	tKz5uSlW4zqIxpnv3iIGAizDqVAqsOsE7ISd5lcdwFvq0u/Nm5i+AZFFhLF+R0SmhzDLFQwIEZ7Th
	SWC98V9vQ15GeQoo93DvLrl3AiANTu2fNIJ6KV/wtVDp3K1/AOXgfkzDhLJs3f8A7TlHD73WaNFaR
	UBpCe9HPQPCI+eg4pN7Coz959wjcArPGFfC3uIiDKGLRLQMOp5V40VtpZSHNYENzRR0OzwKqamU0t
	d15XlPnR5NvXBtUxFQxSLwv422K5aeEhauuAYSxlJXBGfuUuI3hAgegTPUy0ZRjVihhTytQia1mhy
	LJO3veXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HYN-00000007QOD-45nZ;
	Wed, 23 Sep 2026 07:38:07 +0000
Received: from mail-vs2-f42.google.com ([74.125.227.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HYL-00000007QNR-2iEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:38:06 +0000
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso555120e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 00:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149084; x=1790753884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPyyWITg2Eop/iHLzqVBwj4t8oamM1QAzgzHz2VN9cs=;
        b=Oo8NAoly9ZcSsxMeqclcDE12FoHyVU33PQxGv38q7Ao1blH2GAceRXzUpW/dJM6Vih
         Uj4fl3Gv8WJqC5sVlxNNITfYopoM4eYZGSVFo2SCT5XklfYQAphZO6v9ISOj66NM5UCN
         hnN/1e8KvFxhDyZ8Cq2zSRB3JSoiyI8fI2s+EFnmFmY/P+AXpzT2R5GEOMiKzZLWawpR
         A1lMgtcNyubYkkJiXl3Qvi1w7tP/glCUVHqyzU+FgLoPziByHmuHMSV1T2Kg8Dw44djK
         dafil+XvNlCCmWrCTzS05GfgR0u1ZOlHzWPQH8zc5FzChhlIxsmdnZppxV9r6phk5zWU
         bc/w==
X-Gm-Message-State: AFuF++nrHYfoEeqLFqABARhyhydynKF0wIwTKWSlTnZsHmKfcKDkCxdC
	ZWqci5rJTEjzCU1yxaJPsVecLy2cRcdjOQQHIBYlU61X03aVk3UqH7rYZ+s8QbKeR3E=
X-Gm-Gg: AYBFou0tWczp2GE6ZacsTVn8Kp8PiOPilVAWQnNV9QoKpcY63+ueBcbwYQ7POS2ZuhC
	Z9mpbIWyhU9jK6GfwhGDwkN+Anuw/YfOVlNLob/Oo6lcdpaK+NTjO+lsy2ZTOcBxO0FB4mc8GA/
	WLmrm9u4q2ISVdNVxLbFVV6xgfz7/xmjbUPgbMeRQXsoIzE+WH7VgIyaBAYogwYUTSZfYWwFwc1
	638Ggoy078IzEf8oRmecNJFebEc/jT0JwTQnaR21hynxa1OBh5YljZAjzzmDYw4XwWBzWeCP6Qv
	pIk9twmIPFGEQS77DJKlRTejLFchNSTUbaE+ohToXIwRRGwqb/lSFCRLubpOExTHIHA2knVX1B6
	caY4DZekWkEcEZccrc4I5AefpO2pkmsqoLDrtBHP9tTc9mIeSl5CVWrVjy3z73IEZmbCMHo+Ggj
	5UpwH+j0UVMmXXeeW5QjKq04lmHqpDYx723oZpoi/u1zTZg7Lp9F0qxMQT54v4yfBCFXlhDk0GS
	18GCZSIXZyLYpGwF+9/AT85BFI/zZaLTwL9cHtsGcjNJcBHRgObZhLCjVI=
X-Received: by 2002:a05:6102:5711:b0:7a1:f7c3:3a43 with SMTP id ada2fe7eead31-7ac1b30795dmr1720660137.16.1790149084302;
        Wed, 23 Sep 2026 00:38:04 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm2194261e0c.13.2026.09.23.00.38.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:38:03 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so343395241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 00:38:03 -0700 (PDT)
X-Received: by 2002:a05:6102:50a6:b0:7a4:fb71:25d1 with SMTP id
 ada2fe7eead31-7ac1a6c6e37mr1941921137.7.1790149082786; Wed, 23 Sep 2026
 00:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 09:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
X-Gm-Features: AclHuK-KliAgyjEnFc7fc7G0ednHxc9gvY5BOag4zMrSEzrWijgeZD9Diiyx23U
Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ironhide: Align inline ECC carveout
 sizes with bootloader settings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_003805_688014_65B97C0D 
X-CRM114-Status: GOOD (  23.06  )
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

On Thu, 17 Sept 2026 at 00:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC. The
> current set of carveouts follows SoC documentation, which describes the
> three trailing carveouts as larger than the rest.
>
> Both the downstream IPL and mainline U-Boot on RSIP configure the ECC
> carveouts to the same size for all eight carveouts. Align the carveout
> sizes with the controller configuration set by the bootloader.
>
> This makes 1638 MiB of DRAM available for each of the three carveouts,
> which adds up to a total of 4915 MiB of newly accessible DRAM on this
> platform with this fix.
>
> Making this memory available does not pose a danger, since the current
> set of carveouts were carefully set to a larger size to prevent any
> possible issues until a confirmation from the hardware team become
> available, that it is safe to apply these less restrictive settings.
>
> Fixes: 6fa6ee724d8d ("arm64: dts: renesas: ironhide: Describe inline ECC carveouts")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

From the review thread on the original:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

