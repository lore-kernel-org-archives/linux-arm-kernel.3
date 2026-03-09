Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E3BFCA16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5v05B0dL6f+blImA08sWACNd2Nsm0939zAh2hm+b4Zo=; b=ditx614lfyqHTxxL3eJUyAskMz
	7IT08tSEpY587CtxW0yln7mYoa81ivGd+khzIw6DTxJAxQq0ZUwZ94q92FyooJKsxP1KXWc2zxbCI
	QK9LZDsnidBXT+G7pADDmE7/EmDXfaW8TWxx3VgVZvHBSvQmPvADLdfKAcTSgxFRB/8QLz9NIUM24
	ZGVvfj41cs1Ghm7wOSMZGvwmP/IJScNsN0IKSrjaSY0iS1zTp3OQoeA6Jc2jRO1zV59zfn2Gy+5WG
	Hsti9YfJJCySBpvHWwhQKXBnsOewY2LzPWV5qir4jlWYUy4rG24UQ9T18TtLZkV4WXvAZehlasn1g
	D2v6wM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzf8s-00000007t71-2dsT;
	Mon, 09 Mar 2026 18:15:46 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzf8o-00000007t6c-10tT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:15:45 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so10248738eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773080141; x=1773684941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5v05B0dL6f+blImA08sWACNd2Nsm0939zAh2hm+b4Zo=;
        b=pktOUJgAbFqoRvn+tcRmi2oxwprM7vzkhEw2KFCiZNVDfcDDGeqmTwMhdp4vI1egea
         BWEH/s0B7KYt9aIQM//ETaZ1ugJdKRviUv3aHN+cIPfytx00lgBl5Po9dECYcIM+oadE
         TSEzWVnsjUXP6hdwby/ICRJWui0WCudNJqankpwjIVniej68K4gn3/Mzb22AU9P7pkDg
         UXave/4SzPxis+VpzTY8fKJG+wT433uEBs5HYbc4c8agYCkGS63BFHPtfY3+GeXdNL5A
         5J3MO0l2IX3iP9j/FKv2zuUMxPIAQvH3VUPgTi4BK5+EOnCzN/GckIkGUtCIQQoDsX1I
         vhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080141; x=1773684941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5v05B0dL6f+blImA08sWACNd2Nsm0939zAh2hm+b4Zo=;
        b=YFoG/7WDdfkKzcbhE5iiu5TTitCnA5Q2u8mF8te8i8gw4uPXbhkv7uWK+D5d3y/kR/
         o6nBofeBaDrgiPuyubbiqb2LZSHFZw+VgEGxEhQBB7frQ4HlTPe5dw6nWErr/lnhOhGN
         7mk0cB2c+hbjDC0nZwa/Hb4bX+n+ZTVHsCDr0AHCRdD35d5XAc+rvuQXsxOFIEorVzID
         7mTB8aTFnJwmu0ZdY/CKYIHkD7iWRBcAEqRt7uUrkQ2+RXx+4fIRpxshXwo7WHTz+LdG
         ip9D5U+jWoUcGjKXk6rvfMBQR7+4bes2GIAbl5IIzjnmtXNFgeezndeCHua6kQqpM6/W
         3NjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/8Bj1PpEWPU1Z1FUBg1fhoUdsQpT2eWjwy2u8GgNjigkcByfGhxtTjaWmO8PbFRbw34Q7fEYZ7aN7ZDpbS5J7@lists.infradead.org
X-Gm-Message-State: AOJu0YzR7nwCq1GL6qryE4VXjFomw918nkfQaIey+nWtlNGO1SpqLGV0
	Wqfy5yAENNfOb1ZqnLpzGyC45Nt3t4sigKI/JfmdN8EOKdQb0NvxaWCqwkJGhVyErhio1poJV/H
	GGos8D88LEjg=
X-Gm-Gg: ATEYQzz4ezJt8bOUaTxjXimQgcCwIuF0R+Hv86zJLUWaJZ6PtAoYj3XkuXpy4SU7YFU
	rL/EkrrfnkZL6iWIoEVI7uRji7bP/nQL0G66wrEnubD+1g7PenftwPXcKVn65yZBXZoASp9j16r
	U7a2JD5GoqQy6NknxGeRBYR/U4SvKTHr/QcoQvWICPvt2oELQrsy+RuM+qOvvpiZV9ieghAdURe
	ImKwAt1WHx549RkckJkxQ+CugIFYpekfN4odblGas59gwVzdKjWpz/0YIUJoWyE84Iq0PfW8G1A
	/CcofDcp2PBZXWrXZDehhktTUzy1tftvklLWHm1RDioA48z4ejyVJ1WVWtliM0Q8MNYx+kd9Jze
	kAuD0S8vfqhAr0ewW2x1btgBIFKNa0PRUHzECtQevY8NAnB6oGNE8fWN1dxA+qPJH81XhWV8J2P
	gdFmTD2zFboCBKy4ALAcxqicjupMLZbemSf6QYG0al+3pRvl4cluvscA131V8LJ0fcUaukDcGoW
	3joq0o+xR6UAuv1MahIATLWOw==
X-Received: by 2002:a05:7300:6da2:b0:2ba:8018:cc62 with SMTP id 5a478bee46e88-2be4e0abd99mr5228221eec.38.1773080140424;
        Mon, 09 Mar 2026 11:15:40 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:237e:af03:2727:6f8c? ([2a00:79e0:2e7c:8:237e:af03:2727:6f8c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82850fsm12031879eec.9.2026.03.09.11.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 11:15:39 -0700 (PDT)
Message-ID: <2034abb9-96b3-464f-af5a-d76b561c9b63@google.com>
Date: Mon, 9 Mar 2026 11:15:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] power: supply: max77759: add charger driver
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-5-eb86bd570e9c@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260224-max77759-charger-v8-5-eb86bd570e9c@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_111542_305158_2215A62F 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Sebastian,

On 2/23/26 5:45 PM, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>
> Add support for MAX77759 battery charger driver. This is a 4A 1-Cell
> Li+/LiPoly dual input switch mode charger. While the device can support
> USB & wireless charger inputs, this implementation only supports USB
> input. This implementation supports both buck and boost modes.
>
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> ---
>
I hope you're doing well. I am sending a quick ping for this patch I 
emailed for a review :). I wanted to check if you need any further info 
or changes from my side.

Lore link for the patch:

https://lore.kernel.org/all/20260224-max77759-charger-v8-5-eb86bd570e9c@google.com/


Best Regards,

Amit


