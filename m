Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75589D37E51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=; b=EBNXvNM3LbZ/LGaUoN10agQ4Sm
	uuN8bcehteDx3teCv5OQXs6vntsxiHxGH+sdibm9Y5YwXs2kk7JE0mdW/RiBcrKn0d50vmWys8G2h
	ujR9KR1phsbOKOTia7kQDnhGQK4B2VF+loZxlkbFg12UYr1EDH2teitg7u2buaV2JT46eJjHBN2Ig
	n1tz+bYsGjfz2UDwlkRAvgZZ/My9BnqKJ9B+e0Gfwd59r4V2aGyiu6y0IYeU7GIzEmqTAVvF2EQZ7
	iQYtmyXrcQO4GIjEJz6FLg5pR/r43de5GLxxA2l9wJcHs0LpUyeI35+qRyWbV4sjFpV6HSd2KkusX
	zo1/pjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3J5-00000009qPE-2mZz;
	Wed, 14 Jan 2026 16:01:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3J3-00000009qOR-2bFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:01:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDV2Fq3551506
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=; b=e6HvS/ylOeFmZz5r
	XCDj5Ie8I3H7HusyR9aeIzvngDginwvwvTiFEwfNcPji7TAtMCB7gTNXu9qQXf9t
	NhfLvvrpkmLP9eyes3lXKLER3c/SF5IMcFNud1eVoj8N1D9fB+qwgI2RNvJLrYPI
	aNVNT/U7s8Wv1mpIHgf7key2oXWWBXAqWji6+pbDnqxcSlreyhFIzOPyqX73YqOh
	qPGjDx8zlAUfNiphtt0GXne6VQ8ASN6nSrmaMFFJjwrqvrLouZWwkz5nIZUmA+ez
	3rSEqppcwctupx+ovw1Cemm7QLBh6h16EiPmb3r74DraqtXQ4fg00ncO8npZE/td
	DSJang==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jrghf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:01:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ec86f86afbso6179924137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768406470; x=1769011270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=;
        b=SkXnAkDckOW9jszoJypQ9pyi7aHPbX9mCLKtknix92/2K4M9nxZRYDT4okiAV0SEvV
         tJzqWNLEYvqaaassrRt7s4z1PKjymNs5mcfw3KDSsMVYYWL8rNWMWY96sU7/uvMF8Jun
         fKbI6aosuFWDZPgCS2NO8XrBLbqg/qlgpfP5eain/X89VGAsp9HXzl76QXvoNJgqiR5+
         kj5+t0drb4tr4UZG3QqcI4QCfR4DWbqlqqVW5SbpaY+HZA7xVVB+wgVjtg+WWKlWoHp8
         2ea+oCY+ccH/P6lykH/53Hpsv65TK3DEkrpKkZHE2QFzsgzSvZLwTE67leO+DysQvsvU
         DTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406470; x=1769011270;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=;
        b=ssanfl4RD9ysdhE+yg19pRSv6dFDUVlFzcAjTkYf7LlOg1mFYYCOER0gI929Z7ObiD
         daJOouUoUnTACl2A/DzeFFOf2786/VQL2Z6R3Tv6PE9FyBZ6jS11rHd8SH/ssd+6yIN0
         yPm61LVs5Zzv/XrrAOTmtFe99zQxm5te8dAuqae2xBznN9XPji3yhTt/7EfnLdr6rPHR
         ZONi3a9Lnev+9kQTGZkR1/it+3qbkKLgxJttfGfiSrPLLaXff4D667IlVb1XYnCsIyOM
         yeb3jVBnFy3J1b2bLv0ekO8tV+WN05RcEMT2sJUNVvaljNrds5OYiCD2GV3VACSehZJv
         6SYg==
X-Forwarded-Encrypted: i=1; AJvYcCVqVdAIfu3g9M8fbwsE7y95go3Vo8ha9zTgTNrWRHQpno5DFkhlUlQ1Ig4dOF1k4C553Z/B2KPlEicqO0iYq7SF@lists.infradead.org
X-Gm-Message-State: AOJu0YyUPD0b3iu8Ez6DR1I9HZTiCN8FCJHHk2X6rINXgONSnZXXD3aE
	CNGXM9Fl/zeT5DelK80LgAVgVvTIXLecKKPfnppR7BJuamuvIbiG0O79o1ZY5sBtf/HQWh2zxW9
	3NV7I6FgX/0lc2PH7IkvVnwY+OcditG+8h3wUhLfwX+pHnRT271LCYdc+E0jT+VsS15RHENowPu
	ptDA==
X-Gm-Gg: AY/fxX46agP+ldxEM+Y3PtiOsuqHi+5Jpp99brGL6YJqFSFTepxpiUbsGs0plgwoinW
	ibvkLaNWBA1q4nRZcQwhriGtP/LJwHOD9U9i2gTG+uzPl80nb2/MpbyN5ENdV+TVosBV94tlthk
	J8srrh70Kl4lW0FZX9eIo2c6Oa/t7ulsa0k2EvgkXYxByHCwLH6fWirNwA1966sXqjaRkFelGgA
	4+O6qNPs/RucZ92HHv3Xfik+Q58L7n2pUWydUTbLpQQIO2rYud0eC3+xgfKI51ejbDWaIl+F7T/
	uqMbszCThtWpnupPxfjex/2KF+xrK5mzZwfcRtfQXIirCJ8OrJQmc53dr4E2fV+NNUAugUGdZ2m
	K4WE63+Z9wMzpelqmjX29mCvQbtl7NCpodkAnmw==
X-Received: by 2002:a05:6102:a4f:b0:5ef:a8da:8b29 with SMTP id ada2fe7eead31-5f1838f9fa3mr994400137.19.1768406466039;
        Wed, 14 Jan 2026 08:01:06 -0800 (PST)
X-Received: by 2002:a05:6102:a4f:b0:5ef:a8da:8b29 with SMTP id ada2fe7eead31-5f1838f9fa3mr994171137.19.1768406464543;
        Wed, 14 Jan 2026 08:01:04 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411f70f39sm11577a12.18.2026.01.14.08.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:01:04 -0800 (PST)
Message-ID: <6a84b1d5-7305-4a30-a542-c4279989cb83@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 17:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] pinctrl: tegra-xusb: Simplify locking with guard()
To: Jon Hunter <jonathanh@nvidia.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng
 <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-9-a14572685cd3@oss.qualcomm.com>
 <af986bd3-0bb4-4888-861a-33fa09a7d139@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <af986bd3-0bb4-4888-861a-33fa09a7d139@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMyBTYWx0ZWRfXzPcdrN3gKudG
 XOTcU4ogcZxWL2haWIlfGohMejrkC1Fi5q2LgWKUQ7L+O/f2u06qV7XFvNijGEj92J4VfslFtJs
 sybaIvf4PcPgYy0aEEiFsMxt79AtneoC/RwnrM7OOvMynZs6/V2BxcxdXHThYU1FIPlgmxBh8Zk
 znxuJOW01SlenKP8XvPoybj14q+uYlS5QqjgPgAqrN1RUaAIKmji09t8XBNYcbYjlSMXFIttnnd
 9KXoNPVfvhZeLSS9L8zq99VAQSKzBYaesJTRHzmf2PKoNosW2HkLJVmlWQoVYM5XQdnJ+w7jc82
 4xI6N10ujZwa22XgH4K+fT+TCeLfWi7fw9umQYJsNE9OIr+NFTIMwnC8uQOV0Rd2YZ9ztdLAsas
 xPO+MD+GoxpqDgrzA79M9sWmjQytPxm/Tg5ferT9A/wcr/FtTgmtDNUVtCxiKNUb2qaKSkb2zND
 Sxh8sqH8/+VjIeRwx0g==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967bdc7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mMPh4IZubgD9fDeW7bEA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Nb7o9XTajyceNY9yzzZpGOXlR4kYeiNi
X-Proofpoint-ORIG-GUID: Nb7o9XTajyceNY9yzzZpGOXlR4kYeiNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_080113_676009_6F2BA015 
X-CRM114-Status: GOOD (  14.47  )
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

On 14/01/2026 16:51, Jon Hunter wrote:
> 
> On 14/01/2026 15:30, Krzysztof Kozlowski wrote:
>> Simplify error handling (less gotos) over locks with guard().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 +++++---------
>>   1 file changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> index 34a373f7e04d..855f708ce510 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> @@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>>   {
>>   	u32 value;
>>   
>> -	mutex_lock(&padctl->lock);
>> +	guard(mutex)(&padctl->lock);
>>   
>>   	if (padctl->enable++ > 0)
>> -		goto out;
>> +		return;
>>   
>>   	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
>>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
>> @@ -499,7 +499,6 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
>>   	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
>>   
>> -out:
>>   	mutex_unlock(&padctl->lock);
>>   }
> 
> 
> I believe we need to remove the above unlock too?

Uh, of course, thanks. Some rebasing mixup on my side.

Best regards,
Krzysztof

