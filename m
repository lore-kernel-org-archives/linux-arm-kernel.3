Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3440CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kZeqZ1f1Kjlwt5WlxnlLU6u8FvqUbW9sH2W37ltY2w=; b=TLpkungEux874HDT0GsdfczaOR
	P41QFm0vg9ajZDo0rsqq/wLbA0KhpZN858PpeyOw9Z+/1Wh5Knj2E6hq9yDEUpyBVtFz4dxHRgrVG
	QBAhrrLq4fLqWDi3xz3SQBnjRdpEkFQvZTuDW2PWBRDi8macJhj4KYsAENoyxYZKkSWHJFigg8+ht
	C/6ZsWjM52nkLa/L6A4enPyfYdU4njbGA4OUgFSHasGS6oPf/pp0XbKrcGIpp8QlHEZ3Z210RnLyU
	gBpdeXF5ASC747wViF68HryBybu/sI5f1N8LNbDdhN7JK2gmchVw84lyML3w37nJcdm7LlkBPbPR5
	5lT8hb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqXQ-0000000Du3j-3DFQ;
	Mon, 20 Oct 2025 14:07:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqXO-0000000Du2N-1Dn1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:07:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso8096097a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760969220; x=1761574020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kZeqZ1f1Kjlwt5WlxnlLU6u8FvqUbW9sH2W37ltY2w=;
        b=PmEcV6Yt4Ax94G8ZiZV/A4h1u68SazR5L0shQzpLlcHH+NMT4/zcqeb9eST43ZNjm/
         1++m9Z869eKT65/n3K/EZt11nFwKUIp9SR2t4aVbHTRb62Ew3Ie/9P4kh/kG5ozJQe4N
         CX2CjURlP7Mp5+9vTWOEVGaJBE+p48tFjzEffX6PsZHagowZIl/E6r63t1HnGzqTUXfw
         Kti7WW444W9hIrhoIgQnhmpAgcpUrYQhl8br5LbEfRp7xTqsormnqrKEwwU4AT2u0nYl
         NMbp5IcOyvbU5n68aTFTymhJpLIDMRiEp158kVUq4mht8bz5aMWeI/hhQ7zff36RtPXw
         1MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969220; x=1761574020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kZeqZ1f1Kjlwt5WlxnlLU6u8FvqUbW9sH2W37ltY2w=;
        b=kAWULAuKECKF+Ar/b0XWg5cOur9Vrb5en+MXwhyfyDZxTVW1FK27xWg4Z3Lfci8BoN
         KGuamE+xolKXegzmz2cUfGrQoPJrFMciQPMXvDal1AnQFsixdmQEqOEWP47uxhoVbnl4
         5D831sXXI+3XKznkzYrsZEyCzZZWr7SCt6TcmEL8YXZzOkVOt40h8TCBSt2ZunaLE4i3
         1Qpe/t0egihdY3D9DLwoTP6G8rlSBjBGMc3yvmzOz/ajcspDZH2kXyVWbQU4zbbhzY8T
         IDIpJeIXK8ssYEKafl3xM71C/SsZGuhYo5N/j7sHgv4LpiPuCPMrWyCnJHWSTWLVwJW/
         Ok2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6sLT1fGEWYcAJVdUl3qsRQdi45O1PD8cgE4xhyDPREUsKZWAm7RHsEAkBB0FegWBizrp898MLrktAxAEuSdNg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx59OWh5Imh00UykGTsJUQ5FT6rE4emqANTg+Jiv/JsNR4NCAf8
	LNGrN4Z/r9QANvSYeRZ3Tu4NDoILptWfqv6Ik3EZz+3Ccq4+SMDOF5+l
X-Gm-Gg: ASbGncu1JR+7L8M+McMw6Pu0QFVb0amAaGtkjYoRiL7HknK4VRJsQpSQjQYeM6pSaR+
	7I6Luohsly7YEj3u0VSolkS9yYudvKlBXp52WzAS7dG/BwW8hziEgD9o+3aGMjyW4u7UhiytPqt
	VUv7uMhJO3ZRRT3KleXTnF1K7Ud1pYoGzpySwxaceNZsdTJYFVwrM4zvyQoG2Y8sjbSKDoNk5Vj
	Ad/NaP/8bw+CnIB0W69YVbYorPIP7fmMjQMd0xOwIGyr36WKrL5wJZQ9FsXKb9PSd25grdK6sHE
	3NFkuvAK+j7WIWBbkkgDZBgPDY3sBwHZmpz13UlbpgV3s9qLbx6T+irLAoTDUfcoBDEpxzxZGh4
	Kw36HZS2t/28aRvB8Rj3hDnblpJu5X5U9laxeoSvPrd5QZNtunxWEAmviK7+M+ZTE73whYA7nYi
	OKoUP1QdFS1Oz3P5/NctF7T/B2+qRugPvNBzhwMrPYPz116SegVCoOAQ==
X-Google-Smtp-Source: AGHT+IHVJ/TkOaDWREHUGoT4AMJTtZpCtqwsaqdgZXDvsL2iueitwKCDkh+1+uFs2HpKPMVPG6Ccmw==
X-Received: by 2002:a05:6402:848:b0:63c:1170:6572 with SMTP id 4fb4d7f45d1cf-63c1f6d94edmr11212098a12.37.1760969219915;
        Mon, 20 Oct 2025 07:06:59 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c49430272sm6767614a12.23.2025.10.20.07.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:06:59 -0700 (PDT)
Message-ID: <1bd36f10-aeb7-47d0-bc9a-e2078d5aeb86@gmail.com>
Date: Mon, 20 Oct 2025 07:06:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-7-laurentiumihalcea111@gmail.com>
 <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_070702_380384_22D755FF 
X-CRM114-Status: GOOD (  23.95  )
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


On 10/17/2025 7:56 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:23AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
>> which allow users to control the assertion and de-assertion of the
>> reset lines tied to some peripherals present in said subsystems. Some
>> examples of such SoCs include i.MX8MP with AUDIOMIX block control and
>> i.MX8ULP with SIM LPAV.
>>
>> Some of the aformentioned block control IPs exhibit a common pattern with
>> respect to the assertion and de-assertion of the reset lines. Namely, the
>> user is able to control the state of the reset line by toggling a bit from
>> one of the IP's registers.
>>
>> Linux can take advantage of this pattern and, instead of having one driver
>> for each block control IP, a single, more generic driver could be used.
>>
>> To allow this to happen, the previous approach, in which a single reset
>> map is used, is replaced by a per-driver approach, in which each auxiliary
>> device driver holds a reference to a certain reset map.
> Can you shorter your commit message?, basically, you just add
> imx8mp_reset_info for difference auxiliary_device_id.
>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index c74ce6e04177..c370913107f5 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -24,7 +24,12 @@ struct imx8mp_reset_map {
>>  	bool active_low;
>>  };
>>
>> -static const struct imx8mp_reset_map reset_map[] = {
>> +struct imx8mp_reset_info {
>> +	const struct imx8mp_reset_map *map;
>> +	int num_lines;
>> +};
>> +
>> +static const struct imx8mp_reset_map imx8mp_reset_map[] = {
>>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.mask = BIT(0),
>> @@ -45,10 +50,16 @@ static const struct imx8mp_reset_map reset_map[] = {
>>  	},
>>  };
>>
>> +static const struct imx8mp_reset_info imx8mp_reset_info = {
>> +	.map = imx8mp_reset_map,
>> +	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>> +};
>> +
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>>  	void __iomem *base;
>>  	struct regmap *regmap;
>> +	const struct imx8mp_reset_info *rinfo;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -60,6 +71,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>> +	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
>>  	unsigned int mask, offset, active_low, shift, val;
>>
>>  	mask = reset_map[id].mask;
>> @@ -144,7 +156,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  		return -ENOMEM;
>>
>>  	priv->rcdev.owner     = THIS_MODULE;
>> -	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>> +	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
> needn't force convert from void*


not a void *, "id->driver_data" is kernel_ulong_t


>
> Frank
>
>> +	priv->rcdev.nr_resets = priv->rinfo->num_lines;
>>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>>  	priv->rcdev.of_node   = dev->parent->of_node;
>>  	priv->rcdev.dev	      = dev;
>> @@ -168,6 +181,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>  	{
>>  		.name = "clk_imx8mp_audiomix.reset",
>> +		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>  	},
>>  	{ }
>>  };
>> --
>> 2.43.0
>>

