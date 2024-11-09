Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9F6D5E376
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H+n8hKwMU/rFaCD0qvnq17NXDKqhdH26m0nFiBdOLY=; b=IhCwBwqBS9GsiQX95p37/L86Xz
	0U5q2rSUIy4K/WGAtC3QpoS0uhXJ5IapWIHpEj2XpLx8coEm9OFDfbF2O+R9bsVmtGFl8bf1pdke1
	qM7TIelbTMGRG0ptVo4dcv7pw2XXO1lRsqXTA4BRSH/wEhD1JCJ9eJa4qeCjXxLY4eccht7547094
	5UGDP5QVJuJ7da248f9rYTFhf456pXk6jS2aljJ8eQE+7MyzetcBlif/W5LXcHhoKTOYOe0uNL6gK
	UZGhbTuXQFCrHxisF5JMdn5zO91pTcod/zPUWzzBp3iZc5QYd8TNdMe6ZRYF41HMK4b2UfshY2LbJ
	BARsnWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pBn-0000000Dika-1gT8;
	Sat, 09 Nov 2024 17:23:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pA2-0000000DidC-1VKc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 17:22:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1922407f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 09:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731172928; x=1731777728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5H+n8hKwMU/rFaCD0qvnq17NXDKqhdH26m0nFiBdOLY=;
        b=SLVRz/bumDgwRNWuwUmYfiYR6gmN91DZ9zOVo9NAVapDAXDIsWGsBEDRCgs/dOzN9R
         oyl37DxWWhFsClrCx32ATtyPgTayu+zyZvIj6slv23bgwI8qLDJu0qmhZFebi5OOXDms
         3NmY/0AoYR1rR8yNfPvUO9pa07wNbTLarBRYXlcUTSYRSzFtNRO7DEi5TibG3TF6G+eH
         T9Fhx9CkT2Kjpjiw8hxnliKtRTL0IrIqNawEdiBXO8is+Z3mKX04UmuYdsO2L3R+GHKN
         bsNKVvYG+QNwX5s5NWZDb3L9uuDpu3IctnW/b55zRRlbyWk2F0Df7ieeytL/gxZD4SpI
         zzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731172928; x=1731777728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H+n8hKwMU/rFaCD0qvnq17NXDKqhdH26m0nFiBdOLY=;
        b=RTEZJC3kmRQEpF8G2CAnt0r3tfmFtAlFjE6G1U9dvGU0uwYMknUs1C75gPNz6ziCWE
         +6qtPBirO1ORU7I1kKLos9pe2lR+pJYGx1C0YuJhn2v9691KN7OlYz8Gku537x8G7tdO
         83tOeDU0ZkVmvJl5A4CDqO907zEi+ny3TII/yd2CxY2wOI3nef4z6rh0oxBgBC46+1Qs
         J4Ly/wlvZj9mpd3CuwUTPRgBOxBp1Zt20qzfC75TJyClVYc9QdRSZrH34Tqmh1OJGPJg
         ikJTQoSQr9cTTpSyyNrTtgNHI4xQul0CWxluKF+YzkU59y8CzBQKfE+yNYSX48l5uUvy
         qZJg==
X-Forwarded-Encrypted: i=1; AJvYcCVM3e6RwP8OYOjHkoQ6YiAma+1+Cc8w5Og+JN80QRBBPhg+jZsXq/UwI/dGzqEdbLwlSpIW3tzCJDZ+ZJk3Xac8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmcn4pQ4Ld9DCUb0tBTzeyVWCXWaeQxuPFqqBfxvoc19V+nMc3
	0zoqhp7lApQQNQuUMHQYkiu3wIfGOyEWj83AO5qs6Jyo5GX27KIOnLaQexV/YOA=
X-Google-Smtp-Source: AGHT+IE1RYOVGklIyE1IORLaNjLIY04lZliu8TKuSyMeu3g+/8dlg1C+LHnaQGhacvYdKXljs5Yrzg==
X-Received: by 2002:a05:6000:418a:b0:374:cd3e:7d98 with SMTP id ffacd0b85a97d-381f186d1a8mr4237152f8f.19.1731172928458;
        Sat, 09 Nov 2024 09:22:08 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed997320sm8285603f8f.47.2024.11.09.09.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 09:22:07 -0800 (PST)
Message-ID: <d4afdd01-3147-4cfc-820a-f6004637e6bf@linaro.org>
Date: Sat, 9 Nov 2024 17:22:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_092210_449433_9F458CA8 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On 08/11/2024 04:09, Taniya Das wrote:
> +static struct gdsc vcodec0_gdsc = {
> +	.gdscr = 0x874,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "vcodec0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc venus_gdsc = {
> +	.gdscr = 0x814,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "venus_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +

This looks good to me, except; could you please check if venus gdsc 
should be the parent of vcodec0.

If so, please add it in, otherwise.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

