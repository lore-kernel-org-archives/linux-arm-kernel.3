Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E7BE9A057
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 18:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=; b=waldc2VBte4yjehmGCAWZvigty
	MyuLEv6Y/vqEiwjHWRk1KIsaPrSy4bLqXwYdkq6JgKIt+8gJC0nVCneTOD73Rw2uhUnl+kVQagWfC
	AZur0qPtwBuCzivy4pX6K1ak2yqvmIMqhckxsmfY5RGwgx+OdnbxFoY3DB5HU2YPqriSGdZhLQ2Es
	dDlzrnMgTM4Da7OMnkg61pnB/5bMugCpNaun8FrQl5z7+vJtRC2r/bY6/7iwtjr8+i4UQOZpjXBM4
	oXQ1Pt5uaNvyc185AWx8TfxAZJd9LjZ/okKceGu2968jR/jAuqYrGI7Nu+fic4sw41pvA/rawgw/3
	IgTuoDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8x6-0000000BnMe-32L9;
	Thu, 19 Feb 2026 18:40:40 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8x3-0000000BnLn-2rB9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 18:40:39 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-4042fe53946so514393fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771526436; x=1772131236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=;
        b=byzKzpH0jBeVbTId1pSBu8fnLmaImUule1DNoaOnGoyaORwA8BsD8x48a/j4QAaNpo
         TzoXWefNF422G91U0qLqMu+ShGPOXWKsnLaPISzgE2CdIIXPArqjmUo6xYHmPpspUkwN
         nb739aYPCo/cPnSseceq1r8wCv/y5qws2s5UwcHkuPbv80VjsYM7XcR4kVJXTl4b0WuY
         5rc+MpwHGHivvodh8F3h3e34N3knzoHXlq82AU9FnSLV/2AhGeq07sA9RJN2jgQXUabC
         1VSJjH9sk+YgoIdGvxSoVYlFpLzlWv5zvzNEbSOXplRFhBRR0buW6e6VBmB+5fpJOkk6
         b1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771526436; x=1772131236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IWO5m5WHHqRoC8lS5ugD/MQKoBV1QdUD735Fcl1Kkk=;
        b=w0biy35KVuM9X0GF8lwU++6rSKT0yDf0PSqEWwpzx1OSrMcFrO5nhfY5nc1qqPsvEa
         wRORx6q5xWkZJQ/bkaqExcS/oSC11aTkeWXAJuAkS9Bjk8W1J/pdMO+g5EX/3UrfBPNr
         Z+3JRCuvP5qAdDFc8Q9QcT6m+0knZoC4zKMUK3eLfI2N38clNSJP4ooTnaeG12tmpr3S
         aWnHQj3YepSdOPJ67na/CGos5SQJ/DDjHLobK6D5dOUFoV/op/BpdxFHTS+0X8knk9XT
         Y5sQdpZAQ6fzMUBXJu/IX90fhYKV5Q+jSfkt3zSo3vVJutEWjUH8s0Hp/8tKA5DSzbHz
         Cl4A==
X-Forwarded-Encrypted: i=1; AJvYcCUxAzSIj9IWNrt2nqEX7nSI/t6+oqRqVfv6eG27EOnVQIqcH2vU6FanxvF1Alh8IzW34K/AVPo4y0Ns4M6CekOV@lists.infradead.org
X-Gm-Message-State: AOJu0YweNUjb635qSt7YPV+GcF5zKiA/IbuRU7MUVI1qqY55wQqb6IBU
	o1SfN+BUSfwAPmoNkNbPqLwEzuVet8c6dVGNk8JG9Yuh/ouGV0jn3wk9JGn/CsKxswg=
X-Gm-Gg: AZuq6aK2IJfwEDA0LCM6j0FrHPOFaXdbgWOZHXxvW9R6LQmg3EGKyBDJgKtb63w6K1I
	TSk8AFKFuz3IKZePvDg9l406gsRZK5YnvMcSjPvdNBCB41H3GAFsUN4LaYQHtLfnMf93xyjCd7r
	w+AQDVbsvX37X75nxR2co0Y/CFBI21nFqmdpprAniSHRMYIBG8ETviFMXCeGc4c4UGH5RTUPnjc
	CVAYuHaASdiI74rGVHOLZsSN1yLplnmaRpcZc5VSYaE7XuGvUd+xAvhyR/sjHRZMl/iIesNzo0B
	bBggJdJBozKub4t02w3NgsMMSWQvgm+2YAR0JsVqTLL4uEABjTOTu3MnvifsRJzuriT7kjfaxrX
	SKz+ZvX7eVwuWH5n5uYRbWLEzz5g+utXH+EVdQQSHCG4UYkau1d+M/odIssN88cTlaUXlPS2yA/
	cQgFjLfDrJneLiy12Oz9xellC3V+0LlSXF1tvS4WGk4fjnBUJnLb2NEv4NE9x97QjLKgxJpPwEm
	5TeSh7y
X-Received: by 2002:a05:6870:1587:b0:409:a121:19d9 with SMTP id 586e51a60fabf-40f0d9b194dmr9062080fac.47.1771526436041;
        Thu, 19 Feb 2026 10:40:36 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40ee62b6f61sm21460634fac.10.2026.02.19.10.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:40:34 -0800 (PST)
Message-ID: <751d82d2-0d03-48ed-a917-dbb0cc8a3418@baylibre.com>
Date: Thu, 19 Feb 2026 12:40:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] clk: mediatek: Add MT8189 vlpcfg clock support
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-7-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-7-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_104037_980930_41962B84 
X-CRM114-Status: GOOD (  12.95  )
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

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 vlpcfg clock controller,
> which provides clock gate control for vlp domain IPs.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---

...

> +static const struct of_device_id of_match_clk_mt8189_vlpcfg[] = {
> +	{ .compatible = "mediatek,mt8189-vlp-ao", .data = &vlpcfg_ao_reg_mcd },
> +	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_reg_mcd },

These names are a bit confusing to me. I would expect vlpcfg_ao_reg_mcd
to match "mediatek,mt8189-vlpcfg-ao" since they both contain "vlpcfg" and
"ao" in the name.

In other words, this is the naming I would expect to avoid confusion:

	{ .compatible = "mediatek,mt8189-vlp-ao", .data = &vlp_ao_reg_mcd },
	{ .compatible = "mediatek,mt8189-vlpcfg-ao", .data = &vlpcfg_ao_reg_mcd },

I suspect that the same improvement could be made in the other patches in
this series as well.

> +	{ /* sentinel */ }
> +};
> +

