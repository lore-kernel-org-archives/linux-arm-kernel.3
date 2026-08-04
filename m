Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A4EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 01:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ2+AbYITnQpEf3G7kidcS8ENfHDZJS6JKPhQsc5Y/M=; b=X2d9YlmUmripqyEUER5MOdam7s
	QaS0jZPLLAygTaJszPNT8OZrlBzq1XViZgEDYy4ieV2BTBcgScLWyWYE2XWqMqmC2eTA+368ZGs3u
	jjw0Sz45LXrNeKCuSyzpHcG48mzHYSPe8Jx6XbnH8atBFTBiYoCa9serGTwaCeFICURojdCh9jxNj
	ENcamd+jcr6P0HpJBajKu39vzouNzu2oSdV04ln3mXk+kGxqMeKuFeobKQ3Vqkb8z0C9O+RDb2n5/
	/yaEpSQZ9YW+A0hBxrDI1byBk2vqbChMy/jWLTig/UmlVnBrdGDRdoy4TExVVtdDNZ3IUZuiHquv+
	c4rejmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4Pe-00000000oEt-1whn;
	Tue, 04 Aug 2026 01:57:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4Pb-00000000oEL-3wWi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 01:57:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cf50c6f235so45404465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 18:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808667; x=1786413467; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQ2+AbYITnQpEf3G7kidcS8ENfHDZJS6JKPhQsc5Y/M=;
        b=aBHojaNC5cvT/OYRyj+3fM/K0FEDAF54+Ym0rOz/8OrBliH3HaGI3vN729VejLaCD8
         PxYr/XXeQVpBGGyA13Svym6w6WwgB2BVOd4/FBTxZU1HP/az0z5GUBbZ8rxLfxEI+qlZ
         7aYOIxLMCYUQ4nof/3g4RzODcOyA9kNxx3GjGwGu6UsYYztKmWT/wdj0BV86GdPn2ySp
         0Z2bhI96zk3t/v5aGkOw/TmUvpMAW3B6JNv7cMvCrXWxdFPu5CnkS+sad4F4RWTDNBFo
         FLBMt7QTc1T0tTp9C3F8GTiWk+3cCaw9dHCeRdvnL4/OzbX0EFa6+XWrbCYu83IySKPf
         N3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808667; x=1786413467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQ2+AbYITnQpEf3G7kidcS8ENfHDZJS6JKPhQsc5Y/M=;
        b=klNSLyqeESlWK9NKnmPoZDk6e7aGValEYGUBD4zyVlbTuuu8A+zfc2RO52wPQ/Tv/0
         VpA6HZJFV2E0EQaAJoChgYlTwjFLFnrSQ0OchbM6W81b9+NUtdKJOrBqYE+LU7g7E9qL
         8lgKVdJaZ8/OWSFe8QbTflVsy61I0dzS3uxvihPyJwOr3hzSkpPeRhkBP8HicE/W3thJ
         14sjhYPHCp5kcy4VpJPhaACvnZVRXzqMaZDsYI27mwQaL8SuTiv0kShu7YDZRd15QJ5g
         E+U0ZO0PA/uUe/DmZyXlLyPo5BAqeNnpzRZP02xPIhmZZbuTou+gUJNWU/yGEce+7lbs
         AHmg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1MC/TSejD5d+2mlaJJEXm8ktfMQfLbbSoGe65ALhupekpw4kGdF7Ftm17wKCdGalYEvIlxJ/fFkRly68vBkeW@lists.infradead.org
X-Gm-Message-State: AOJu0YwkAasvzlLtr0UjPphRB2+nOMdimPBY5+EUxXfkE7XbChQjX6UC
	zEF4UdID0cfER5Jegs/mCEDZvkk6MZ1e+ldwsIGSuD0KDWAkYAa6kwib
X-Gm-Gg: AR+sD13lYZWr144AhSA0IqnIIDCPaElcjdvlD69p8ZCoc6VBIZLv4sRBagP4f0UVMnk
	43e4ovGDe9dP4zFVCcHIsn3wtoDDvmF1IaZI56t1cNZYBR2p5LvKjSGGHKl4VqhUaEVp/RK7sXK
	1vWPDWkiTqT93IQ2Z3m9VgDJ/IwHMB3vDSbY9NcJvnjq+2QEdtBv81HKiuVh4gV7eyyBS8n2EZ2
	BsOhPGibZjkiOV8i2PCSn4e/x2f+7iqsQhy5MrZZ4QB3cJ2WS42lPiNL1HR7t3seT7pFwPW4kjd
	bbEQk9sWlkvSEYTTAKogn4E+Wi1geat6+dk+2/vZVXSmMROTw1dKCMq/RvKo38PXG1MR59cu2hC
	0ubUIqk1496O4RF5/XF7tzu63OdXPPLCwsidJmhxVhbHizPDZ7VyEoud+XvqNLP86GFuh1gGCER
	ibk4aMn4wJRO16HXjhiKHNqVyneVzlwQQcg6RKPbszBscNI6EBggODpobcfabfgbq4Hg8IRuoFe
	HxZYe9ovkAdQOFCjXA7dzIZ2aWplkbuwa46G/xv
X-Received: by 2002:a17:902:c40b:b0:2ca:bb5b:3c92 with SMTP id d9443c01a7336-2d05244ce77mr116332265ad.35.1785808666874;
        Mon, 03 Aug 2026 18:57:46 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15c1e4sm44632235ad.75.2026.08.03.18.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 18:57:46 -0700 (PDT)
Message-ID: <90e97c2e-c288-4417-965c-04565d042261@gmail.com>
Date: Tue, 4 Aug 2026 09:57:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] spi: ma35d1-qspi: Enable GPIO chip-select support
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803074913.1656675-1-cwweng.linux@gmail.com>
 <edabced4-b7b1-4b2c-a358-d47e4b7e8e9c@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <edabced4-b7b1-4b2c-a358-d47e4b7e8e9c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_185748_004884_98970B23 
X-CRM114-Status: GOOD (  13.36  )
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


Mark Brown 於 2026/8/3 下午 08:30 寫道:
> On Mon, Aug 03, 2026 at 03:49:11PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> The generic SPI controller binding allows GPIO-based chip selects, but
>> the MA35D1 QSPI driver currently supports only the controller's two
>> native chip selects.
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Hi Mark,

Understood. I will send future revisions and new patch series as new 
top-level threads rather than replying to older patches or series.

Sorry for the confusion, and thanks for the clarification.

Best regards,
Chi-Wen


