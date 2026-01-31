Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42A6D7977F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pcVTF1IQloSPNuQJZHZDQB+v1xgBL61dkGZAU2ZjyA=; b=G1C6CBLQBwaQpbkAbPPJ6AQKPH
	EeQWBMETMYnzSJiTP6UP3AM5D17lXHukQGiX6UBQBgbtRUv1QwqXcI12O7wvgqpmI4lT82i32+36A
	lCrP4JjglYbaxDTsjgRAYeBsiuLG59vSitvk80esYcstLKhpKmCyjRA+LLrSicMncxh+Hmz9Hb/Yz
	4CmZgZiSUWi7b3aDMPHAV2fJN+UgLBpEVUNOvLGXp/t/FY8UWd3WB8CUk0nqhDP44pa5ZsLTwCq96
	Tqp6Vq3cgSdAW/WYubsyONRwasRSLUSmGMtrn6SB3fEEAH4P67xSYtvzxMx5V1/THP2/3d85oHPCt
	n8iUulhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD9S-00000002lK0-38gz;
	Sat, 31 Jan 2026 15:44:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD9O-00000002lJ5-2Ff5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:44:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2167997f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874281; x=1770479081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pcVTF1IQloSPNuQJZHZDQB+v1xgBL61dkGZAU2ZjyA=;
        b=MM1IIDLCYkoH5MdlZPP8bl0heUdpX3oy5DUKOwePJTa8652G8CWqSU/AY+OsTd658C
         MbPTy+J8z5f/fEAFP6iA0ooWA5TmmzrWUAGTt5sMfqAJmi9F78gUqRIXg8Wr/CbdPKAs
         xCgJoPsOMV6pcxs7f59+GKFyuJpuFfyYjn5G0Q76lskz7nm2lHXqlfR0POgCIhmVrmew
         TZ0qMXguuoZGV/p5DGk8po6aJb1ek7pujlzU0espRIOhxX7FK6mxEDkBO4SfKEK7p34L
         G1vzXTKDyJVMOBCJazYCiDhElveBF5+KWr2pdQRYJvykYBUMFc+tJR7sV6joPT1XyjQG
         N/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874281; x=1770479081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pcVTF1IQloSPNuQJZHZDQB+v1xgBL61dkGZAU2ZjyA=;
        b=b2VIBcASX1ZT0A4NW6aobo/OlszholeDDu5nHG9rmV7pBo4cQbEVZrl8em8If88cdt
         Y+2VmAiVWYPbtjpgkFRnrEpSAd2j2Kgxv3ZofG/yqCT4tdVnKImYKzIhZ3AvyoIAbfBU
         fI/Q/eXEtMmClwp/gcQdLT5KdcjsAAZw94uP2rdkYOpRfwVXylawTWNzsze2AA6elovZ
         OI6SyPAG2A+cQgAdvSMRMSvth6HCgBapeUQDvpMn/C5wZ8tssZFv+j04snGMwvXHtMSu
         MbxAq9yOyN2R1Yo2pEbR7+8N4alt51A7ZFPDpUgU+K9wTi7g5qKWUllEoH2C4v8a4d57
         XNeA==
X-Forwarded-Encrypted: i=1; AJvYcCVBr87UJxj0TkAMSgMJ2/TgpEDRfDqa4uxMVmgSG0Ur4bZPlfbQHaJU4fZr09jVfGdMnEA5UWYpwt4ml/wRt7X1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl+PyHkfOrYcUgyp4vqVm6POG/2ugYukWcNazR/Bozvfd/elq/
	IOVcOADzA92kDHT0yqRs79rJc2cFo6fkIXo0g2lcc+4bVQNaxi7F4LPpBUc272ce0R0=
X-Gm-Gg: AZuq6aJWm3FwtLIT8Gdg4ZB5d5QbzGvxilkY5Oe/JWswVYjnkvlwwtUvY04qDSd2Oa6
	vHmFzdrtjdmCgFdbgJnCgJ8AANX5g1dbMbnOvtBl08m5eeQ+mTzq+qp6vhgV3KvntXIAkF2+qIb
	68CN3jndW1QmXOguWDaTwRlDBoXateSUtn9jam8wYdBP+8ySRVqKVZuY7dG/l7S7FwnrOxUujoe
	kft4SfrE6G4XaNVfj8qEJ4GZYmswxatzv940X4di/xv7mMr0cPhf9RPu4z9srv+MGxzKqC+mUsc
	SpvaO1tY0+ElOcuZAiy8UqZk0GEE9f0GztygGI+cqiciimIyy/3k16HMQxepq6hn1Zd4O+73R66
	uylsB5J+nYEiNB36IgRikdSdOj4/wLtz7AaOFCInRvyuwEboPZf8YNFpJMDO/BARR9XrwGSLswZ
	e525Zrhc3ie+mbUi0bACDdyWzWAWfu
X-Received: by 2002:a05:6000:184b:b0:435:8d02:b9d2 with SMTP id ffacd0b85a97d-435f3ad1f8cmr8775581f8f.60.1769874280664;
        Sat, 31 Jan 2026 07:44:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfe7sm30019606f8f.14.2026.01.31.07.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:44:40 -0800 (PST)
Message-ID: <1665d5bb-e978-4a46-a9e8-8522d54a2a03@tuxon.dev>
Date: Sat, 31 Jan 2026 17:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/19] clk: at91: Use new PMC bindings
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-5-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-5-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_074442_597994_6DB0819E 
X-CRM114-Status: UNSURE (   6.65  )
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



On 1/20/26 16:37, Alexander Dahl wrote:
> The bindings were split up per SoC before adding new array members for
> missing clocks.

Please adjust the patch description to follow the submitting patches document: 
https://www.kernel.org/doc/html/v6.13/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

The rest LGTM.

