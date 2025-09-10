Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZiUguKRHSjLNl8qev2KvUrL6xayZ/2jdKMeAroqeQk=; b=PwEF0YLJE6j06jk8RidrrANxku
	klYa38qP4MxeRVXJNtJ+gyz7tl/3NNYzTVfMzbVWtTwGLIidcJSqFOLYOrn0KX2QjK/8nkqbpY07R
	6ZLFXc8s4i1G3PV5Bx7LSCOYDquVcENa8VywClJ9vFJHLHn14xmYDkwU2pcghw+XAwOThtlso3zSY
	CGwcalcAxscKk80w2c5LeZ73+oKrLHDae831zUH1lsHG0KzK9R7Rc13n8vLToI35bzWUZ+0EDRsMa
	C3iHK2yGJ3d6u0moaBtgJcGcozMX+oCZs1TzEgvmpT86tzQrq4KIDRA+fOhsowSCc2AUiXBBERXQR
	rUtBa4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGEs-0000000CwM8-2Obn;
	Wed, 10 Sep 2025 08:31:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGEq-0000000CwKM-1B44
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:31:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so3531085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493094; x=1758097894; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZiUguKRHSjLNl8qev2KvUrL6xayZ/2jdKMeAroqeQk=;
        b=MKmsPjM+Z7DyIocO3hWdoQHR0PdjJqnzDVLQdBRDgi3lRnqR+l4xFwt1gghtQhltoN
         +ibcG8rn7fSRrW2qizoaELLNRPUm1mSfa8TxHk8oFAmYyG+QA42giQkLSkBquUY1wvzJ
         SjCrgwjWmFHcxwNh6fbSMpClj+HXBaXihUOi5hDSEPqwEY/3KPzOLZQgmmNwlSKWaDwN
         bwLUGuegcUmuACG/z2qqLrDDulw08/EidUm3B23kfImFqqgCWkGFuC2l3usDArdsv0ne
         oz+uFgwQ4dgkmC9OFq+a5Cv8Zzu/VFI/OKZocuEnPcpjXljCxL4RAtrvYWu+gwonRo6L
         SCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493094; x=1758097894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZiUguKRHSjLNl8qev2KvUrL6xayZ/2jdKMeAroqeQk=;
        b=C8Z80CpOTopjFWlZIKpALOkEK8tnNk6i+EtS8SWQZ3Ypp0zyZ/587YLe9knVNaTDod
         m0TW3rZIxLUA05eUC38uISl4x9T2yCKsVzbIi+DYfBFvSVqM9G5eHLCYxelj/QM+TXdN
         RfpDDIKnY5P+Zo96kBfGTsU3Ng+QbEyH6tS88VY5Z/ONxOf+cwKMPDMNWtm3QN+Sf5Qb
         uRjTUIxHbZy21Vk0F39kABn5zDFaix0YXhJjetQ9zzBn3vdoYRlQjuLOeAMWqY3t1vsA
         azyV9np4Sg0bbjJ1cAhmJ6R5SZeyRooF45gD+PalB77mZYRWF+Zhe5k/yfyna0naWiDS
         WArA==
X-Forwarded-Encrypted: i=1; AJvYcCXdHg2ItiLcOTY8TBJXvtVEBvutCaYMiz2J/ypx1IVVtfiC/iC/IaQancqIIjsFe+jkCGvin+Sfbx8VM5Jj1s2i@lists.infradead.org
X-Gm-Message-State: AOJu0YwOQ1XSECfZVJ2CheN1VfJPhE1GaYi8IVFyoMCiUcpgfTlK2I5m
	j38Uh/+wXmt17BAwV6sfwSvE6FurvRbasNIqDcgrofp0alII+y3gPUD/
X-Gm-Gg: ASbGnctCoZR3VOonjOPrHlsmEKVjm31NSECcasnrpXvixRgwi2U6HDmJ/wFeu105GEL
	wTmZ4CS82vFXzoBRRZdTFL8LwLoXokarGq7hoxUZDtGMGq+kdN70MiXVyS/qPr5ywSroIBf5D58
	CXS8PcSUr+P/dGIkQQKOJgPSvPSmI+iRf0KhyB/kQfYg4ZrH6Q8Nxw9rc1KTD6Xwmiw3V2O8+za
	OQtBj3ezNNqzmletMrPPwp4vLnWHgHRIlhyVGDWXSPgr+DOcDP2nI0llqEgevm8ioaZbtcd+EN+
	kY7ygZGGhwKMduq2pAY/RoHMmio7yeYWrAu0jH52i0Ruywh2Ry0RBpdpUpWUfA+4K3eu+mMQJo0
	z8Znoz3h2hit9rNB27wx1CyufZt0qLnd0MQO4ikof4FcObgIXt3ZP+wYaWrZ9v1/dBcxtAUUlvL
	csbnbDW8Fnc0VpKordjZ4ZnxQKyC7nH85xZ7EcRXecqSlWwkqtxnw4Sw7SSNcsy1l/Sk6CImIgo
	g==
X-Google-Smtp-Source: AGHT+IHtxpNnwR+OSaL4WHAtvZm3SZwKKJRshnL76nqSRl+ub9r1kz9W9fnbmNI59d2V+S62gNIBxA==
X-Received: by 2002:a05:600c:1907:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-45dde1b15b7mr140442595e9.6.1757493094104;
        Wed, 10 Sep 2025 01:31:34 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef? (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net. [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224bc2csm5817574f8f.54.2025.09.10.01.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:31:33 -0700 (PDT)
Message-ID: <4066608d-af1e-41b7-ac7a-6c0aa3791c2f@gmail.com>
Date: Wed, 10 Sep 2025 10:31:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com>
 <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013136_351300_CD471774 
X-CRM114-Status: GOOD (  17.31  )
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

On 10/09/2025 09:54, Krzysztof Kozlowski wrote:
> On Tue, Sep 09, 2025 at 12:12:12PM +0200, Clément Le Goffic wrote:
>> From: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> LPDDR and DDR bindings are SDRAM types and are likely to share the same
>> properties (at least for density, io-width and reg).
>> To avoid bindings duplication, factorise the properties.
>>
>> The compatible description has been updated because the MR (Mode
>> registers) used to get manufacturer ID and revision ID are not present
>> in case of DDR.
>> Those information should be in a SPD (Serial Presence Detect) EEPROM in
>> case of DIMM module or are known in case of soldered memory chips as
>> they are in the datasheet of the memory chips.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> Is this email defunct now, that you add second SoB?
> 
>> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>

Hi Krzysztof,
> 
> I still see in this patchset around 5 different subsystems. Nothing in
> the cover letter explains the dependencies, so grouping looks like
> coincidence and you just make it difficult for maintainers for no
> reason.
> 
> Please organize your patchsets per subsystems, see submitting patches
> doc for more details.

Yes I agree it is a big series.
I'll split it according to each subsystem it targets.

Best regards,
Clément


