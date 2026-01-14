Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE576D31A22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=; b=Rf0uXi2bNUB4YqFPNgcbMi8Xw2
	5WrevrXvUQ3WCPWklXJIVnvtY+Qq6y4qy0NmqIrYIHVRt3Jk6mb4b88AADipYcbCAZFMaXMea61Ih
	9JqMHEhEQvw/QI4eCXoP/memyCyH7U6rwjaT95XQYxyV2GTYtNTOvecG4IGuCtd/NGyjdQemGXLmJ
	Etxer3VqkOBwm/VmqZt3mqBV89kDRTCMsHkSXJ8nxlWk90hhr5Jo+6HxNaZ25ryKOZUMafSDSUGD9
	9+JvEAaqRb8gAgrWmMmqL+A1BKkd5hZGB617fKPqPnLD/swF8+NpeDiiPc+j9ej0P8jUweeYKerWx
	QsvVZb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw3t-00000008IVO-0IUq;
	Wed, 14 Jan 2026 08:17:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfw3q-00000008ITg-05iu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:17:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fbc3056afso4854555f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378620; x=1768983420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=;
        b=jO29s82qyuhuATqj0iTHL96SuxHPpHmVl4kWO79Z5SWRAnUdMKgCBHLwdu7F98uMwV
         kjr8Tapzgkl+NLHarrf+0H6Vj7YoaDboWywgat5C6ZOe7hXA82vrJ8WIuRYfB6JNb7tu
         r6bdgm4Dkcp3vGH1T52e1pCyS+yoc5AZvabeUHtGBj8J3+y0uHLJ7XEn5nb+SeW8E/Rg
         YsXSe+GFL/Xlfr+dQbI3b881irepxlx0JbRY7UcixK3SOG3wENPjmkVFaZXzWYEQHX4d
         JxzFPWxAJNS/TZgaM4lTMoMepB/VauvazMjSUznJ8vRo8bVmw28Opr+sZj7pFoMtaDCy
         Dtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378620; x=1768983420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=;
        b=gp8fgZZh5aiXJQKqP28O1kyebJATT5dOJPkYfdzyiOo339zF2ve30iUJhf7oKBtpgU
         zfPBbBThDWGPoGUhDjD/MMLAf4FowuPZdtjFNW8F/kvSJUHFyo3rtqhF7Y/Pamn0UIka
         J0LYRD4nc6BRD2OzkXLwhJVk6A097ByVhTrOy0LN2J5PFoHw74v83R8VpJhlZ2oNm7XB
         jfIetqZC0fMtBK1t2cbCtK2dJfD0v9TDXOkp2QohWbZXvacs17v9k+qNoxkfKBOHdTXu
         IGqsMuL8Yov6wGEHqaItg6JJZ/gUWg/NTW6SMQHUF/BVBForchrwCiAh+kfx0AJl9XZg
         Kxkw==
X-Forwarded-Encrypted: i=1; AJvYcCXK3iakgH8Zc6Tt2MSXRVrnwrTE8trxksNOjIZBSEXB+aPGuOmZ1SWtHgKGWlFYzqN4OEFy7AUMR/6uY00oyfPB@lists.infradead.org
X-Gm-Message-State: AOJu0YwOtsJThJZqalVzlgWfH97NWqMrm0UCMai1h9dRqX4hamPwRWBi
	iRDAVegQcy1t/aWYF/dhTmQXUCvCF5WVUUi2KJKVYwjBQMEw8RqRzUcS
X-Gm-Gg: AY/fxX77yuydPTSKXePbEjyy0ZovCpMPe9GrVcdefukJ7wqLODNIyjQaE6m/ouolWJY
	+vaODBAv0Z8BKhG2UCFBhA+lt/+Z3TKrGE3FKoSzctdBA3AL3enzrj0HgNgc4340jHp/7F7UrR7
	pOd7VtjpqOKVburDqSJBwQN24El3+Mcx9/HPxCFiB8REKvBvnhLodqS/QNgRD9xKhE+Ss5e7MxB
	/rD9g9y2SKQ0tmWbJ0RdAwgyUG9E5zhTIiWrCVMa6FPZY3aplUKjizev+Yl785IZRchc2Dh0EKl
	fZYX2ouBzIuLfhcaT6PTgwWRZlnAn7umsz4jr6vD2b0B+J1PypLMv5/A7sNFjqc8lbquKXBWPuL
	i+qYCmiNm9V64VulxdlCU5wHRCDFPrecex3CdtylpdINvY/SKJJlzCfJIm1sbB0tH5rK0ZQTxKp
	F79TxTFXXkV0aFicFNJtv9zOYOvCbkK4OyeMVImrdzbNx6RS9tJYs6/+zUWBZp6jOzdFc=
X-Received: by 2002:a05:600c:c0d0:b0:47e:e78a:c831 with SMTP id 5b1f17b1804b1-47ee78ac9e2mr3070835e9.36.1768378620011;
        Wed, 14 Jan 2026 00:17:00 -0800 (PST)
Received: from [192.168.1.27] (84.121.134.198.dyn.user.ono.com. [84.121.134.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee578d37esm15572945e9.1.2026.01.14.00.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:16:59 -0800 (PST)
Message-ID: <0eb5086c-39f1-4cf3-aa71-440036930052@gmail.com>
Date: Wed, 14 Jan 2026 09:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: mediatek,mt7622-pciesys: Remove
 syscon compatible
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 ulf.hansson@linaro.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 kernel@collabora.com
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
 <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_001702_079996_A30DBDF8 
X-CRM114-Status: GOOD (  14.74  )
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

On 13/1/26 12:00, AngeloGioacchino Del Regno wrote:
> The PCIESYS register space contains a pure clock controller, which
> has no system controller register, so this definitely doesn't need
> any "syscon" compatible.
> 
> As a side note, luckily no devicetree ever added the syscon string
> to PCIESYS clock controller node compatibles, so this also resolves
> a dtbs_check warning for mt7622.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> index 9c3913f9092c..c77111d10f90 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> @@ -14,11 +14,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt7622-pciesys
> -          - const: syscon
> -      - const: mediatek,mt7629-pciesys
> +    enum:
> +      - mediatek,mt7622-pciesys
> +      - mediatek,mt7629-pciesys
>   
>     reg:
>       maxItems: 1
> @@ -40,7 +38,7 @@ additionalProperties: false
>   examples:
>     - |
>       clock-controller@1a100800 {
> -        compatible = "mediatek,mt7622-pciesys", "syscon";
> +        compatible = "mediatek,mt7622-pciesys";
>           reg = <0x1a100800 0x1000>;
>           #clock-cells = <1>;
>           #reset-cells = <1>;


