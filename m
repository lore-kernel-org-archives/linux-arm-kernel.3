Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A30BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3hw419kHIanWXI8S7q/r2sYT6jc1swylj0x7Y5Ea4A=; b=GHCJrhLI94HKhXcCOqmX2EYfIP
	OOpa8bkDHtV6uaUAMZJj70OxosQrjxe4xfpf3Qj5BRG51CSsiwrUUaAu1NAH7VNP2vIsBW13gEo1K
	cPeGupjEn8D19MP2X3n2jzP+MZwYPlc/2Zt0dqXVk9AEQIIpJhFwqS8Or2ha3O5DtiVydPOTtslC1
	TKCXJfQ/i7fv7dAS+u75/Ms1WDzJ157lr+9MSVAAmHbEJ2kAzB7KX3LgBEDbWW4M4mDY9S+lyVd/z
	4e4gY0OZi57LQT3i0aKLA/xoCaKas7fzICw30whpWIOeSLHoOiSxXfhUH+C0HLwUnhyaGu7ExTLoJ
	sQOT62Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvO5-0000000ElQO-3Pqy;
	Mon, 20 Oct 2025 19:17:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvO3-0000000ElOx-354K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:17:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3552880f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987862; x=1761592662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3hw419kHIanWXI8S7q/r2sYT6jc1swylj0x7Y5Ea4A=;
        b=fKaGCTrcKkSagIgOU7sdsiCMPyUzXNs0NnNCyuzFSBcthb0sSdFMejqLcoGGKIC4nU
         ZbckNdmEOeQablJkWWvhU08j6cFimfPKBdNEKXh6wNNDoOuh5MTYqZbMj0qfFnvwDkG7
         sooMZFm3kl084URZy7QtTX2opf7kZAEJp46T0q7QoSncIcw5fJymVroQ70rjS9xQNeyh
         LUuJKAgwjf82CINMn4Cc13XFPXZAYzND1MibU8Zr4dHLi6rjsYVstz/phAoikzo2Alc/
         mMiLeAMyr7r1PMtfgogFOioVpPnnqATdYEaaAWL8Z6H2UCf8BPmRTRmSY/cKots15kge
         6IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987862; x=1761592662;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3hw419kHIanWXI8S7q/r2sYT6jc1swylj0x7Y5Ea4A=;
        b=n4ZBKdPjDz5b/OMgNZTzNzKDk2rM/bB6KwghTqh2Y7oOwT1gNDLj2D5yfMUH+Qlob8
         pdC4HhUMHatd17j1ZdpR/bRVzFapNjJpuexx1XoFxMUOPLYHkFrHyK1KF8J5OLcBGttO
         Wwb0lqt/VjmvUVQM0VvFppbry6qL996eV05JBwbkDBjO+t3TQWdkXsTdEWj0at7G9ISY
         LQCd3WvW1wIzgAoLgWhzmyrL+A88CJCKDOKdFdriKiLtmwA7e/DxZjZDRBa2cVILKAwE
         S7FWotubxLuo/FtKVn15Cvytir9oakmGPhcP0Azb0+z9lwMBEh69jdRlr9TyxEGF+/Bz
         iaDw==
X-Forwarded-Encrypted: i=1; AJvYcCVvkXlUW+5b7sDhSBvXACdO9x5vmWHpa+oXZzkdI/ET+5t6HUzV25IfFgq5TqEesgqRAHP8uirpaW42ApatxvN9@lists.infradead.org
X-Gm-Message-State: AOJu0YxiOeurywQJTNEvHtZaWboCoHpukQmb5Xj1wN6kxKJWYWCx9YeK
	ekBJa1TI08TXN+CAZAkd6mHxnccVCc+74CAVO5zIVutb1qziloJnusDVPOHtivSlBDk=
X-Gm-Gg: ASbGncsO3KwXL3zp0yHOOOBoYYlEI4lwfd2hY+zsKaZpQEC+VNYRyEikRrrUO6Fcx1o
	BFrGy57JeinQuZSC1r/UP+d5aJQ9C9Cr6phOsSK0kTcRoISDihHHIpAB1v+KA3GqlauFfzAJhcy
	P3XHF2z1jRwWecWeltXDRhyj730S2TGGVhepMKT0MYnFakjAV56TQWjrOwLmN+e8V4SgmynxupQ
	XuU8vB9AdUJDBpfXAlN6Gvfffl0BZV9epBiNp3MiPGqGXG9k1haRSU9AOA0wmPcKz4E9DKQH3cV
	kcQlEWRs2cq+t+NYegQGVIlAmcNJO801Oy2/iAkjeDOoKVGrZpoxFJWdE0jYi5ERfmwQJMzs8ri
	suO4exWtFewSxsmIsKMn1EAhaDu1IB5KHI3pL+qo9zIRc2IKztH5Ayiqpjq/GpH6+r2gcqWm2op
	CB1NpM8YYBKpt7I+Sdk9o=
X-Google-Smtp-Source: AGHT+IGK6tHTgvB0+6Qz+f3/Hvkcp/D3IAI05W/uCv4j1nGOxIb4P88xZ43wqUbIHoY/frZXUcKPpg==
X-Received: by 2002:a05:6000:25e1:b0:427:580:99a7 with SMTP id ffacd0b85a97d-42705809a1emr8127287f8f.59.1760987861989;
        Mon, 20 Oct 2025 12:17:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ba070sm16797899f8f.42.2025.10.20.12.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:17:40 -0700 (PDT)
Message-ID: <ebe90c15-bb39-45a9-9016-e5ec864e549d@tuxon.dev>
Date: Mon, 20 Oct 2025 22:17:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/31] clk: at91: clk-slow: add support for parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <ba17012ff9130fa50954163a07c9dd6245b66e21.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ba17012ff9130fa50954163a07c9dd6245b66e21.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121743_784768_86924AE5 
X-CRM114-Status: GOOD (  10.22  )
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



On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in slow clock drivers. With this parent-child

s/parent_hw/parent_data

> relation is described with pointers rather than strings making
> registration a bit faster.
> 
> All the SoC based drivers that rely on clk-slow were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

