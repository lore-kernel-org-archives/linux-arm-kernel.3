Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D51106F311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASd/BgNDcSm2/LLglL5z3Gr32bRWBqPeJ/CuWSEmnDQ=; b=0wvG8+UPK9TkntQofujvqcMgiM
	RUms6zRE6BB75V266Uc/SLoX0LfjjI5XvqKBPXBtTow/t5hHNBPFW3II2PULW/bdOp7oDPFhdQeqN
	5t1UDsFTbyDWBlrObdYf9U9ICz3rxqesbnilkythcomGwmpYl6sGECS1bzr8tx7NBFW7s7JaA40k2
	okWAQpQ3Hg6ITUObIJ9dDU+hcGcRuutaiA20UMYbBlRuLm9Keu7QBjxxFvmv6CPCfQuFqL3cP1ZwC
	9a55GKsYZsDrpygGX39CNq0RCo/Gu4gruTIws53edQ2Z1HWxAPbITyGAR+hFNrqulvXik9/2Bd8nf
	4A8c2OmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hHk-00000005BJi-0jrN;
	Thu, 26 Mar 2026 09:45:52 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hHh-00000005BJF-3K0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:45:50 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a857578a8so344875e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518348; x=1775123148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASd/BgNDcSm2/LLglL5z3Gr32bRWBqPeJ/CuWSEmnDQ=;
        b=ZR5MKgHJxMkT6Zh2T5Qo6pRvpsnl9CWL5u1BzdvVNxzqDPe0JVH6QxsrS7wFW312l0
         q6tyFadrd8H4cqieI3oKeeCYwBZABeUfrv4FhpjykoUTsGN3j0+M+F8ZJ5OV3AjiNTpA
         ZOJv2cKfAnDbQzbZ/pI+7kMaYAR2RltxuY1TjZJHKutZb620zSy/KsRKTY+ukLmSwaO+
         uPsGsFn9MHJfnPa1WqbCKSwbgvbqySNj//kRAMc/MQLd8n5uRv3qG/q1ERNUwAvMYYal
         9yTPIdbwYUF5MaVlCZOucWlmy97YdM/hG7CqBfAa70pDHegsAXYCYfcns6H1yf4oMUPu
         +4mg==
X-Gm-Message-State: AOJu0YywVm6zESzeOytbfzl+DukICD99TGYbBxYHdKWhjCFmW1NgD9St
	DOIj4tr8MLcK52fjWz56LEv4IWPeMD8DdGytsSwZnEneMyXHvjUhyfVgNM2DXI86opQ=
X-Gm-Gg: ATEYQzygYQkpH77f4AVXygJJkb9JOoM008HjKGIyYb8e5Oj75Q7bfuM6V1YKwQ/g6wW
	mV9w8AyxFFitTQWd2lYT9bp8z51cHxG6BtX1pqTBwSxoL6JQju2xlgHNhOiS2BKqAMKGjfZ7dyT
	0vXyMdoaTMCMtNuZaakM6yilHjl55+5hO+4D26OpzQpDdn1HghHkc8NUxmBc8c9783KMQIqHGDB
	f4Cxdyx4u/OhXASnYJzgMHdNO0mBGWYHOO4s3RNviBcdMOVC5fCeLsWcSo1qv/YVVQEH16DvGle
	dOlcNNnEG9ALTOJyjb8ZM7SJSlUbp7+E+7LIr6h78XqpWua9XkQ+KtspINJpRO9cOcv/GuotpfI
	4BgwI9V5V3/0uqUA5nWxq0ofpKAwSOyE1dypChtbbte1DTTjNRKbIHqj4cizvhO120YZPNIRIUQ
	d792Im6eVmbfIZlLy6zFKjiFRi3pUilh5fyxWtdHRzyTB6QEgb8EqXvNhizf8uSdSR
X-Received: by 2002:a05:6122:f8b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56d21f7435cmr3306363e0c.5.1774518348415;
        Thu, 26 Mar 2026 02:45:48 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d9f049sm3798560e0c.17.2026.03.26.02.45.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:45:47 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a857578a8so344868e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:45:47 -0700 (PDT)
X-Received: by 2002:a05:6122:32d5:b0:56a:fc35:966d with SMTP id
 71dfb90a1353d-56d21fb12c5mr3316119e0c.8.1774518347412; Thu, 26 Mar 2026
 02:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:45:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
X-Gm-Features: AQROBzBx-ZigpBR2T4evThvMi_IdjHn8HsOwRs3EfiLeP9xAlQUuukRrtBVPuG4
Message-ID: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22
 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024549_835972_6E69E3E1 
X-CRM114-Status: GOOD (  21.34  )
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

Hi Marek,

Thanks for your patch!

On Thu, 26 Mar 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211F PHY schema indicates that compatible string
> "ethernet-phy-id001c.c916" must not be followed by any other

This is actually RTL8201F / c816; I will fix this while applying.

> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

> --- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> @@ -94,8 +94,7 @@ &ether1 {
>         renesas,no-ether-link;
>         phy-handle = <&phy1>;
>         phy1: ethernet-phy@1 {
> -               compatible = "ethernet-phy-id001c.c816",
> -                            "ethernet-phy-ieee802.3-c22";
> +               compatible = "ethernet-phy-id001c.c816";
>                 reg = <0>;
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

