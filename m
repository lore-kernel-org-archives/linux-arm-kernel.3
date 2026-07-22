Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F1AC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 02:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQyOfQXbnYj6ZzvJDmPQehiLM53DzmWyNve2eoR+Jew=; b=xW0Zb8rBKO2UDMBnD/nyupqiWh
	vsjGcdlVirr8+3UpxRRTEgu/dczpmCXuVu2sihB3D+eAixjtEUMHyumuiSluMw/oXkTA+i86N93sS
	B8BhXOxdE/T9eG5a5VNZ0ljwAUGaLCIfuBLvl6d+TInDBB9GYtf5ORCD5/8F2wdn9yC0cPTEKqs1G
	PGiUS+ieQ149DSfwB0zxpCQdhhxwVa7cDu/PHkufKecXwhSU5qZtLVwKHdOnmqQ57LYwWSSGpukOk
	VwU3X2woBF5pLIp68ZPCl6Laq2KjeEKmMa82LEjIYBJQobidIBtwGT/hBaBcdoHsRQflFYovIbYQZ
	N9Ib0yOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMQl-0000000Ajgr-3LjO;
	Wed, 22 Jul 2026 02:11:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMQi-0000000AjgT-2b0q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 02:11:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso93735715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 19:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784686287; x=1785291087; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQyOfQXbnYj6ZzvJDmPQehiLM53DzmWyNve2eoR+Jew=;
        b=alYRtkL0k0hXlngzVaVEt4DdKWZlyCno2k5vrRXn1xmahsNCJs0cSN9Z1K2KqqOG1e
         yFpV9GlkXrcPpVbNs2mTjfZBvL8rtCR++hBIwbAkqGzUM1Zk3xVufpiDrwCiAqYMb0J+
         7UhGtrlze7i8y63L738fTxk6zGoEtMtVNGyru1fC7Jq+wdl0baB2GxbZQn/wLJuzp5Yb
         XYMImOOrLvGmpcQj3FN/i43Clz9S65CXyAY1elaKwlnA3SqyJqag+eOUWZzqw/TtbX9z
         dPclg/hVm9O96uemarYGhQFt48OxcbojPkk94Ptfl6YpDAX7lRZpeI844kXe18jRUDrJ
         DqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784686287; x=1785291087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQyOfQXbnYj6ZzvJDmPQehiLM53DzmWyNve2eoR+Jew=;
        b=ASZvNUdEE2c8s2pdOOlERPuMsVf3yIex+7h6zbJOTDAShTL2/SLhzGcB4XojhVdsp4
         F7lcQeWyYxj2X1zaUyzcXqwFwZGhtoH7WV0O5n/XVO4m0sXOf5d2ewcsDewpocZ0NF5A
         ZSQyg+cor5gUVVZxrYZVveTqAOEB8ZlJ5JynsiBpiBLfzfgfkhKICqkLdlE2n89uei8e
         RrtsCBpDbjBWpuPqEpuBN8hUAmHF0G0IlIbPZ2PHQXuWRLspdYN8bLiu2mWMhMMJ+onH
         mzfopcYNyQYXdYfivwFnPl6eN2ZStiHrDBimfZDKaOWWWzyx+hSXZuIkO7vYW7EsV4tO
         toRw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+FDBd3GUs6Oe/9jTtH+EWCzJQiIuyIDDvMAolYHG/GPHvffCubzT84jRCfJOvxAvbEipJYnCHDeM/zAzoENjZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1QLV5isQokGCCC0wjxNjEhmTPPH+JqgbS6ubVhzELhZoZbVN3
	hMhCJx7Htx0U4E6jqcbRE/ajYd2fVkf+MTXS/yj7cxKOMg/jr4uJ2ktx
X-Gm-Gg: AR+sD10O0er1FyEQ0CV8EQ4b2pNrgG3s27pjcdr2X3AFMER5sSEjWMn1hQLSgn3gB2U
	je8r7AMQc57qsghzGA6GC4RVr9bZ/mNQg4YFBO2DZsqSOipa5Obw7W23g07FhBvbgX2lsUzBNKO
	7DqM919U/uUzF2SYkYKilIdFLmekhgioLrnqZKvNhYgJPTD/Drttom02ZwADqqSbltBYPZtl8PZ
	HmgQIvBkHb8uKyLHYGZJPNOuHwJkSdtId5KlEyciceRUxj4hZFJG2WMzIRXEh1o7nybdpjCJHBS
	aNSykdNGrxA1WfBD6SVb5ZlHKqtvqA4f7SJHwVj181UjRqOKUavxfS+MsdRsnvc8Fcs6comrLqU
	DBMGQP6hnCSlYVXBfJaX1eLE+KMrczw+WeYfs6XeSw0N3Q5mF69O1X5795zQ7K0rCDK/jaerlme
	Q+IBuh0FfQTs4xX3xNhafgHpXAkadJ1DZDinH+c0aq7hkh4PgOknsHkAo=
X-Received: by 2002:a17:903:2441:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2cf3499c666mr239515785ad.29.1784686287176;
        Tue, 21 Jul 2026 19:11:27 -0700 (PDT)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm6011695ad.23.2026.07.21.19.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 19:11:25 -0700 (PDT)
Message-ID: <0fe05124-b9d6-4f04-a56c-02911bb77408@gmail.com>
Date: Wed, 22 Jul 2026 10:11:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] clk: nuvoton: ma35d1: fix
 ma35d1_clk_pll_determine_rate logic
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-4-a0987203069@gmail.com>
 <178465172376.2337945.14489744680090859988.b4-review@b4>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <178465172376.2337945.14489744680090859988.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_191128_669848_4E71BAD7 
X-CRM114-Status: GOOD (  16.19  )
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


On 7/22/2026 12:35 AM, Alexandre Mergnat wrote:
> On Tue, 21 Jul 2026 10:13:56 +0800, Joey Lu <a0987203069@gmail.com> wrote:
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> index eb9d69d2077b..c7c0dc91a012 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
>> [ ... skip 14 lines ... ]
>> +		if (pll->id == CAPLL) {
>> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>> +		} else {
>> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>> +		}
> Small, non-blocking readability suggestion: since we just switched on
> pll->id, re-checking `if (pll->id == CAPLL)` inside the merged case reads a
> little redundant. Would it be cleaner to keep CAPLL and DDRPLL as separate
> case labels, mirroring ma35d1_clk_pll_recalc_rate() just above, where CAPLL
> is the SMIC-design special case and DDRPLL uses the standard calc, and share
> a single `req->rate = pll_freq; return 0;` tail? Roughly:
>
>      case CAPLL:
>              reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>              pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>              break;
>      case DDRPLL:
>              reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>              reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>              pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>              break;
>      case APLL:
>      case EPLL:
>      case VPLL:
>              ret = ma35d1_pll_find_closest(...);
>              if (ret < 0)
>                      return ret;
>              break;
>      default:
>              req->rate = 0;
>              return 0;
>      }
>      req->rate = pll_freq;
>      return 0;
>
> That keeps determine_rate() and recalc_rate() structurally parallel. The
> logic as written looks correct either way, so please treat this purely as a
> readability suggestion.
>
> Otherwise,
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Thank you for the review and the Reviewed-by tag!

Agreed. CAPLL and DDRPLL will be split back into separate case labels so
that determine_rate() stays structurally parallel with recalc_rate(), with
the shared `req->rate = pll_freq; return 0;` tail after the switch and an
explicit `default:` label for unknown PLL IDs. I'll include this cleanup
in the next revision.

BR,
Joey

