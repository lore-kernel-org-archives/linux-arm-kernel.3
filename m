Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B970EC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=; b=eY5ofOA2ON7CTXqCMfKM4ru22K
	J05NHpi45AVRhjm9lE5PiT1OaJaZx2wZ8Q2odwotsg2gSIPUaFuHIoAF84amoC+tGNuJ+MVixCB8f
	fxfH044+oTAr8a7J+nUsNgxyYCfuEgQFQs5w+u//SYvvVv1LdnsNNoFf03T03Vhun136tNuuw49G5
	a4A+5VokCIc3CYX/CwFnMQI0EQoVpNiP97RQmfD2cDTaIkLa1HhlmkMuIlMy6Tn32KbUN61mwaTwX
	c5ee8ckO4eQgztyWHgxiFOqfvRmKZZxmKEyPbn0UfmBYU7Q5me1BW8RnZmFmTSjB7VS9mCQQhwnGA
	t4l3Ot8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBIQ-0000000C4tC-3UiT;
	Thu, 19 Feb 2026 21:10:50 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBIN-0000000C4sS-1WsM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 21:10:49 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-40ee8b4f925so945079fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771535446; x=1772140246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=;
        b=3EYnr8mOgVvHb46qXFssXL+GPVN/amazawbjjnaduUYVGp0GIwKampzcNflirA5wz4
         OEjBKdDRu27TX9Xds08OA3VDTZOY9wp3SCLMyd0dlwpVQq2V43UlRhLfczA1vG2ashrH
         8fDKsA8UncvsnS4yjQtA2uDFZ7ZSy8r8stSs5em5OHH6YagpFqgbKnCmUT8grTLIVQXW
         ounqKQRLzHnI+e0930TtI7AjegjCnKljrYM9ftYnQw6ITmDvsATlPksURqMjQJJQ7ljc
         fU2HQasZTbTv7LSMhrqAEY8Oj5PL2JgzRj/2R3epJwpZRG70tVH5f19C+Jp3n+12hhYy
         sD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771535446; x=1772140246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrC+PLfTea68FI9Rr5zEv0pamcCsfXyApvn8rTrZCCo=;
        b=U5JoC8JF74uE6OxN67v7FzcnMXu9DTHELYDTg3LBGk8yNrLG0pMMkD4nAQ+WVPWBHv
         HN4iM2XKXTRtFXp16e6E0ghd4Vkum+k0TS16ROL5c/7nQT52kG93LpK1lTEyx+I5bzL7
         nEVAbOQySqxb9tO1bzsWo/SIy1Q1ltx3/jcSl6ehNpwpDwle8LdGlJ5bmc8j5hZHywEd
         7xts34i71las+YC04ZTLp5Tfqkq3MYXwZ5+Gg70zRVPZ1aV8xrZaTIuWFd4I8W7ylxEA
         on6oHimGN4pSNoAZFCpbTj4PvOsRB2ZPJ+igfQMUTrNYFWb1wWEzJqpEVLcTp70bCRDI
         XsDA==
X-Forwarded-Encrypted: i=1; AJvYcCX8UFtnKRBsdXU5SsMpdsHp2JOgiyi98Ci1AXpX73qZxEfKH7tYRmNVFokuMS6CL5By3ptLUoLhB8v44rVBewTk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0WXecSrY7s0jldRp6xhe39i4ZggmfxzbhtBkhMy34IbOaelIB
	04Fa648chdbaBuONtkWLByDQ5wvkDPuUN9FXjGjFGh+o4WYvGMcNAfWYBvDFJ8618Ck=
X-Gm-Gg: AZuq6aL3CsuYLr0+Jgk3nSo/sBbkv+n1pBZUKkZVR8+MKzjZFFpo5RbXTSqoZehYZ0V
	UgB4A0zVOK9ZStFQmSPTwtgxCN7jEaDoz/Zlct+vPYsv8DoEl5nhmAlJM1SGBGIyUu/TPGjkEgU
	5LPT/KXuqetKubxwinuqUPMmb0h+iSThkQBizWAAodi5ZeXf3Dn29nzqB3y+KE152jWV7wVNsm7
	Tz9wJDkzFQQOrKLcEInSKg0bh6kJag3PdG0aU06Gf2KYG9OOY/1TJgZwW0eolBg9DIiMbvDKlRI
	r+nF9fXkx1Du28ObBO687hSIw8Y6V/dTDiHsgPx42pzH6N8jMHLDlEggWksBowbjEMrMROUVMTr
	wpvPk6eokMFQ6itcJkX1b1sPn7acWRQy0mOQb/Gwwx6kkijW9/z9jP6KZVH+LPDl4d1RdcqhnAj
	Wc8auZDQXt7ui/dMHR7XdV6kOcmY9w/GJzswbnlBSR9r+KWXEgAtRoaBQu2kRAEmUxpuYc5w==
X-Received: by 2002:a05:6870:4596:b0:40a:5a07:3598 with SMTP id 586e51a60fabf-4152913c255mr4207227fac.36.1771535446056;
        Thu, 19 Feb 2026 13:10:46 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40ee06756easm22066534fac.13.2026.02.19.13.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:10:45 -0800 (PST)
Message-ID: <e0b39f90-f4a4-46c5-90ff-54a261c075b4@baylibre.com>
Date: Thu, 19 Feb 2026 15:10:43 -0600
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
X-CRM114-CacheID: sfid-20260219_131047_420951_D14737DC 
X-CRM114-Status: GOOD (  11.35  )
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

In mediatek,mt8189-clk.h, we have:

#define CLK_VLP_CK_VADSYS_VLP_26M_EN			24
#define CLK_VLP_CK_SEJ_13M_EN				25
#define CLK_VLP_CK_SEJ_26M_EN				26
#define CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN		27

Are we missing the middle two clocks here?

Or should the be omitted from the header file?

> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",
> +			  "osc_d10", 11, CLK_IS_CRITICAL),
> +};
> +

