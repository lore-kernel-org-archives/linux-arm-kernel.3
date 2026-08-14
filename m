Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A3FC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWSFL1IqtGsSxd9as+S5YrQgQ2uQorKxfncBRjktmv8=; b=nnzvBClN6JI45yabLdhTbwI/j6
	uaxZvTTTnxUf3B52froNxfIS5gMcDasMpdb99Fs20ke4FpyejLO3mRP+o8zdfdX+GQu5SPP1/OY8K
	nLJoY3auE0zwGFKqcaLXKtz10yTlXAIlQQSe3whqvTxqT//Q/lrgRo0kDoDpK+rxMgJ+BEpWSlu5Y
	BWLY4HJ2nE4IM00h0LDKK2r3RP6afty4DII+/xXFDIf2B8i2+oXjI+8LA+sbGe98mCD/1XJOhTK0g
	cf5NNcMsnUiRX5G9PolId8an5hnGOAjaU2PHP4oVICe5hGpJ+VanaUJFQr0r1qXpb0L18TmGIxXd/
	HlJ7Xc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wut4K-00000002o9X-3kp4;
	Fri, 14 Aug 2026 14:39:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wut4G-00000002o92-3PgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:39:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso5903765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786718370; x=1787323170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWSFL1IqtGsSxd9as+S5YrQgQ2uQorKxfncBRjktmv8=;
        b=KE/VbZ45KMEKiB26OCgXDdMQB6QZlbVOxrjsMm6YKRBAJRvq+YsbWjEvGDga8KO6A6
         2ELE6CSSkj1sP3cyvP5BQe4TcnB5Yc8Gaeqo3ln+KYR0r8zySh4uuXT3/gpatTV5h8QW
         lMV1PvXfVJJNCNNEQheIzdbznJiJYrg4TtzOLsH1d/ylhQ57fQFV/7tChASwTeSoMh2F
         Ocy4Sl5rqF1aT0LZCXkdIeRBWVfRrHuDKH3kfteEWfzCOCZ0oQ2pd0jsJZk7CpmOnfm8
         SLdCXqcPC+OZeukipwzx9pHJnbmm5H6Vt7gK7zo4nKbUzleuXVFMS/gfu/NfOGPRZWKh
         jn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718370; x=1787323170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWSFL1IqtGsSxd9as+S5YrQgQ2uQorKxfncBRjktmv8=;
        b=c+i57gubLgNM/0aRXAr7vaXabniPuwdiwL5iw9Dc6sQOax5dFi6O9WwGjMMCckWlwB
         VXqSOO/LOR8k60fYsQpLWeeWXxf4ODkBAFdystif9Vxj9rJeTAxDE4J7y6Z2BaQW8uaQ
         iR0Sy0ObzcNjTqS9rZEuolr5rL31cNf0G57D5HZC5wCci50XBiljXs+keq7xxLitAHKx
         w1KQHeGi1b70S7zpwjHYfPQGFrShZWrXtVEiat0FMXKagsauRdkejJ4LTKu07cHyzLzN
         v9S8erugUkhArSIbFNymfs1VFmqD5+LUnAzRZh6E1R09oQ22Nc8LaFDx/zDv/1nKm4Ni
         BySw==
X-Forwarded-Encrypted: i=1; AHgh+RpxY+MsRYTFOQ2Yc8fTtOSUrM59CrAjh2jqhQg4ec3AiBnbh8jCoUG6RsRdxqL2kr4RRvTpGiE2gk/bKMkO/WhT@lists.infradead.org
X-Gm-Message-State: AOJu0YyEGn0cit0iT8nX1RIrxhYRQKZ0Kyv6v9ixUJniTTxwAMrc5YUE
	z3/4O0U4f/e19sJ0NedDNQHHccptDxle2VOWjbUnrPOsEmSxW4OYfeVQqHzw0RwAfkg=
X-Gm-Gg: AR+sD10CLzzRai9eWAgDQE8lCJQXWOTH98G0QbYi5XD/akBoxlePr6pl/nKoKEyAVJY
	7s952jXFHjd8j6xXAYQZQn0mnN9CwbJSmN4/GZ89p/wAjV8XHRlVtcmlOYZmiAiyuVnO1H96LTH
	WXvLKgafaMiL3n/8DCL1mx3rVhGxPt4JQZt04Tw3xjGo019U/iH3hc8i6Es0Gk63Oig/N/n4SwS
	nrPzh1w6IcgBy9BBK4OPk0nyCb6PmI9EM6TFfdcRRyAt+Vth4Qgjw4WqYoFnqRc/6MeEmkIhEqB
	fG2NsFOSzgk4dz9vv196tPb/AHI1sP2mVfRr3JYnkWu4EFkdJOf4IXPX6bGiNAvHlCsXg/pTuDx
	sHQxHFmnqBbZvuD4Ia5WXhd1TidyMiwadrf9iyi5hcGG2CCbw4YXZ4Oy51LskQpZehbDhwoTnen
	R0U73PBrX3Z94Jev3+jl+ovciSV+i3O8AKErU6lsJlMBbT1x7qLlURjdWPT5R8euVtozkS2Y4zw
	WJmAjVT5dhGYm9d+QhD9ZXDWb3vhz2k47fRT3K4FCXWqQm8lSR2VquAzESg8O/or/UjjFIahtE/
	BuuiC6Wqc2zlNPglczQgXrVnWSnd
X-Received: by 2002:a05:600c:5397:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-499879857d0mr93390555e9.13.1786718369651;
        Fri, 14 Aug 2026 07:39:29 -0700 (PDT)
Received: from ?IPV6:2003:e6:6714:e500:bfe4:7b00:fa11:e276? (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899bff2csm31594145e9.7.2026.08.14.07.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 07:39:29 -0700 (PDT)
Message-ID: <b88b5e1c-e85f-4fa1-80ac-1ab66592a86c@9elements.com>
Date: Fri, 14 Aug 2026 16:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] ARM: dts: aspeed: anacapa: fix dt-check-style
 strict violations
To: u8813345@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 colin.huang2@amd.com
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
 <20260813-anacapa-devlop-phase-devicetree-v5-13-c7058f63dc67@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-13-c7058f63dc67@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_073933_439015_2CCB53CE 
X-CRM114-Status: GOOD (  19.00  )
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

On 8/13/26 1:59 PM, Colin Huang via B4 Relay wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Run scripts/dtc/dt-check-style --mode strict against the Facebook
> Anacapa board device trees and fix the reported violations:
> 
>   - aspeed-bmc-facebook-anacapa.dts: drop a duplicate trailing blank
>     line at end of file.
>   - aspeed-bmc-facebook-anacapa-dvt.dts,
>     aspeed-bmc-facebook-anacapa-evt2.dts,
>     aspeed-bmc-facebook-anacapa-evt1.dts:
>     - reorder compatible/model so compatible comes first
>     - add required blank lines before child nodes and before the
>       status property
>     - sort properties into the tool's canonical bucket order (e.g.
>       bus-frequency before gpio-line-names before ngpios before
>       status in the &sgpiom0 override, m25p,fast-read/label ordering
>       in flash@0, #gpio-cells/gpio-controller/gpio-line-names
>       ordering in gpio@24 and gpio@38)
>     - align multi-line property continuations (io-channels,
>       pinctrl-0) under the opening '<' column
>     - fix child-name-order and child-address-order violations
>       (framebuffer before video in reserved-memory, gpio@24 before
>       power-monitor@N, regulator-p3v3-bmc-aux before reserved-memory)
>     - remove redundant node labels that were never &-referenced
>       anywhere in the tree (i2c8mux0ch0, i2c8mux0ch1, i2c13mux0ch7,
>       spi_gpio); these labels only existed for node-merge overrides
>       via #include and are not needed since nodes merge by name and
>       unit address
> 
> One unused-labels warning remains in evt1.dts for the p3v3_bmc_aux
> label: it is genuinely referenced via "&p3v3_bmc_aux" in
> aspeed-bmc-facebook-anacapa-evt2.dts, which #include's evt1.dts.
> dt-check-style only tracks same-file references for non-.dtsi
> files, so this is a known false positive of the per-file checker
> given this board family's #include-based override architecture,
> and is not fixed here to avoid breaking the regulator reference.
> 
> All four files pass "dt-check-style --mode strict" except for that
> documented false positive.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Hi Colin,

I might be wrong here, but the commit message feels written by an LLM.

If you have used AI assistance for your series (or only for this patch) 
then please note that, even if you have only used it for the commit 
message, you must declare it via the "Assisted-by" trailer [0][1].

Tan

[0] 
https://docs.kernel.org/process/submitting-patches.html#using-assisted-by
[1] https://docs.kernel.org/process/coding-assistants.html

