Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900FEC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 20:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=; b=QCqSxg405IehRMzlrmWtCUgdzA
	LLN1D7ZhANKVYvGq6XyM4ppNZAEHilYi5hVgy/nlOtGao6Qcv+GCyqatho4AGwSDS+3m4FX5zD4zF
	Y7VdaSSxsCE/iK4rKrdo71rxneY1/d9EwjIcFIkYYCb2FxfrJIx0ca7FqT9ZDJxaWYmzV5iB1F67t
	macfAZ9yZZagrb2fl3coSz4CAWuWXvHLYjN2R4LdqVeh/KCRvwRl/mwiTJesBcCzfRdc1y0A2deYb
	WewNdU4uFqBUVG0n19LyYqpdewYbeb9VB5KPatlMVLBlxBWNgiqS0LDvhXCgIzG0B3QjWC1xLEAne
	iHshwozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAxf-0000000C444-1Rr7;
	Thu, 19 Feb 2026 20:49:23 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAxb-0000000C436-159A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 20:49:22 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-45f0b597eb4so784235b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771534158; x=1772138958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=;
        b=GwwxhKhxu3llA0hEpopnUabf8CRB91MJdaDX+UrJllpzQgG1LK7s3VIRYdK2NLhg38
         fYywg871cMwD/7u9M57vBNeWtciAkcht0G/v2ugZD0j5Snht4pDIlANUCN1zU4JC0xBB
         rskkkG1UV7GSWLAfPsWBy6V+XMSjsng/xYZW59jKqQRsTp7CYgAzUYs9txqBU5WmjAQQ
         mtsbciZ3INzIoR9vB5MjDzAjou41J3kHg6DSFYpePQGoqek/ajKSNorI+t2jCaTCwd+2
         ZsnbivXVeAqBkEuUTgG95Uk8nqSuqNUugEc0czIbhHIXP6N9nDtxilX+7P/RhCr702CN
         oIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771534158; x=1772138958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=;
        b=YkTrsszrDqgmqmIs56kPiidCiR41DMpZ98Yek0WkLTRtEgJJSEy6uMLHcQUdFGP0T/
         Uo9rpd55QhhcpJrSvgpodPCjDtAr/Cutgle6JEHikrCRoSoUwQmBuwKlQOf76/GuSh0R
         lcGymJEZGCRG9rQ1ZSdIFnwgolv1On3kFdkVq3uPvvWMbJckXuS4edPUjfVue71wG1Cy
         keA/PbBnKHBNlocVQrYlx/9l1NOo9nqpViyCnvO32A0iyESsNSxfkFCcrQvMBtMAA5Nk
         wCgrZ/ElubtHaX/UrehEtaAx0IENOdyjnImfEZF8CqGhbyGBZk8juOc/I0X7flPqQKq0
         OKtg==
X-Forwarded-Encrypted: i=1; AJvYcCVCIyffg8JtOhN+ZuFfYO7Sh8H54eIEAlFzZgJK2qK5DlvyE9SuGMg1XPG3Xbc91fjqWZ7l89DSgY4ewRfZmKP1@lists.infradead.org
X-Gm-Message-State: AOJu0YwASkxJgsnThAdRBN6N3na5J2IHdu1iHvavbwnWAMEftQiFJBI6
	aUmAPhC+9+riojOztSqLnGUjTL79o2gDfJD/ict+UYzC/TgydNXM8v9fCFvnb0NeIgc=
X-Gm-Gg: AZuq6aIyT43xmSxVtFSBInf56uygkuRUjbvZ2JfV9ZnPKWSvqOdwGz45iwGrcU/FVPj
	y1Fd2+1tdBdENzc/a62p+ATDzcxWrllNd0zmUbbjkSPTZgk+YSheDPGbUhzjmmp6Oa5eMmK3r/K
	MGJ0ReSJEMmLJt5DjMaHLSCxUIDoQc/puOQM5RcNpGXVj6F7YNjwCOby21PH6rh5jqXtJEPd+xk
	myf76YmEeUrRrov6cQsOm4UiPM+5MnTZjt7OeXma2YoIglF6iTcFThXvMuIlwUtw10NV70iORTz
	cMoNUMdKb3UfwncuLln30ItaHjx4qhnpByx0qkCjZyREqpGqgzdSLnCZUKYMxZCnETtc17pxYXl
	9ptVizPNr912Z4R/RyfWfVQl/l01+lWOV4tuR+L5n1c84u9ilT1o6n/wR02XExeOtS+qOwyDwLG
	umbmzEx+LatEc1kbJWC8ReW8OlaYc8ORDBsxJsi8Oo2WdAqaYwp6hQIKT7WZdD0IKcgrEKcVLjL
	dDVP3CS
X-Received: by 2002:a05:6808:1448:b0:459:b569:702f with SMTP id 5614622812f47-46410b94689mr3904867b6e.15.1771534158258;
        Thu, 19 Feb 2026 12:49:18 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-463a4ede045sm13618351b6e.9.2026.02.19.12.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 12:49:17 -0800 (PST)
Message-ID: <4b22e998-b38e-4452-82ce-1389d7086a04@baylibre.com>
Date: Thu, 19 Feb 2026 14:49:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] clk: mediatek: Add MT8189 vlpckgen clock support
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
 <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_124919_556443_0FFE23E1 
X-CRM114-Status: GOOD (  10.47  )
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
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---

...

> +static const struct mtk_gate vlp_ck_clks[] = {
> +	GATE_VLP_CK(CLK_VLP_CK_VADSYS_VLP_26M_EN, "vlp_vadsys_vlp_26m", "clk26m", 1),
> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",

Should "VLP_fmipi_csi_up26m" be all lower-case to match the style of all of
the other clock names? i.e. "vlp_fmipi_csi_up26m"

> +			  "osc_d10", 11, CLK_IS_CRITICAL),
> +};
> +

