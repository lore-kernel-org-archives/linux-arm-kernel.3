Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3IKUpQfaLekPKjen96M//7ifX26lwnIh4aj6a3++lk=; b=Obxeo6TsjK6Dhb5QedQmcrEcvt
	w71DGhxRflOtZHZnPBRiMtoTwEsT8viIIkBvqR9lOyjc+sPizcaQHvQ0dG/JidTQEnQurt0vR1HDo
	loelUpJVnHnFOFTaKTxMowZnRrC0RDXNyImbiERaLtINrR9IDEpYxws7PS/qkMItyoLOFyrFcsKKb
	KELQaf86uuDdYqmsaP+iTMJYqUEWlw575zrOKcqgw4kEv3Kap1hZSu7eKjhaQzSD3bjDe9rmg/s1c
	OIYo7rZRMz5btgVDKmxJ+N2WOvxSZVWIaR3v96H+FMOU2J20HSpBBNS+G8OPtuy7QAUcDJ1CbTxdc
	aPCuADcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGOh-0000000D0Ja-0YbZ;
	Wed, 10 Sep 2025 08:41:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGOf-0000000D0Ik-2BOL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:41:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45de56a042dso22207475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493704; x=1758098504; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3IKUpQfaLekPKjen96M//7ifX26lwnIh4aj6a3++lk=;
        b=g+pnbIDglwVsrFScWQcn1r++0ftkbI9JUGP7JdfbXPizzCfq9gPLRoMi6TyRb08obt
         TU4lq9M0Ytkbiv57eNRakYn8Wnpo7xVJ8HY00pj9NmpmAZtbxiz5vkBRZrKfN3JyKvUw
         yIqcP9RU5u2VcQU8QAYJCXxOWI8ArM9xSGBrW+Xs8087XN/jPdnL4xiu585JpbYQDlCB
         9RwbxYkocCUMkLou7JvMqPuSPoscHZJ3hNGege6QnaYiyngCJKV1VuKf2gLwXD38nRjQ
         +pCo8cLqILxHcw6jqtv62pju2P5GOEcWWfgzO85NgyumpxzlfTuP+8Qczp0zhUUZ69wv
         4s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493704; x=1758098504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3IKUpQfaLekPKjen96M//7ifX26lwnIh4aj6a3++lk=;
        b=bIkrcPOSSk5Hf0tXnGg8INqqzlldAhvk1C45Adp83650ifbv06pJp2HFkqhwtFVP2p
         +8CohcZoRGgz4ax6od8QVE41ap6F5pZgMcP2QWrwqnRbqXK34MDIq8FT/CA8sQ810urc
         cR0EoORu1KvjTYfCByP8mHCHBY/0svjV4qeGsiCB7zrzsD+US6NrvMkCd0fgbBY3f68L
         uA6SWvq/cHlI66ms5eAuiq+ft/8B/noZesMzUREGTbKTLNXUrPt1rcUAbc8VLaK81+z7
         YTzY8samH3ObZr5rUzi7UEpuhHJwHCe4StGwUh/0iAeDTLYeqxy5fM64EQhvAyJskjK1
         hjog==
X-Forwarded-Encrypted: i=1; AJvYcCVaVoY5kDXT0cOp1S++Ou0TRndMZhM20KZQPsTQ1oLH/o1OrEvuc0CE96H3y5GrhfdRRiaqI59aDcodbii6H8pb@lists.infradead.org
X-Gm-Message-State: AOJu0YxSgXHwe0jR2SIS3RFP8cNvHDM3I0b8YvD+ac5q+MRsdZrPkUot
	oKW3pPEVbLBuFmPQgeIjlsaR8JQaLbnK0EqYxLN010ejd05LAaDmEBym
X-Gm-Gg: ASbGncsgPqt1Fg/I+xKflGtRWXzTw6oIdgQvKhUbQuvSAyscsDMw2FJm04X+f0AfSt/
	sCiSNutLgqK+eytxRPwuqz/YEpHuKqn9qWMHvF2c/fnPmRJRXZniHPYNQqVNZnDQKcm5rYCBijX
	OjiGRBu15Dh8MMZie82OuPFzxxcZRQBT4b3s0JeN+rU2AdkKzITs3VKg4IoT/LwuCrcZk2Xc2oc
	uzFFlfaLkcXX4puUj4Y/vx6f0LVnQMYCk+2AvJkylnpn/UuwwI2RofOjwQTg89IcxLk3DqlHeKV
	pCfESgIMPGE1309q0JRAYcolVDXiUEBvvC8p0pTc4O7XPMg6DYzx/RLtWceMLpEkit22We7YOFn
	GV2Z3v1wNQm9bQ5lj4mOTf6VUoVgPm+TSL0CA/BltyqegjLW6u9kJkER7idOVdVkYfKbgbh9q7d
	GqaBB2MuFY/bIWCWrSWwA+AotHPcE+swl87EKrxPy5EDlPrNGjk0X0XJVFyBX84+Ees7ucNXNq7
	g==
X-Google-Smtp-Source: AGHT+IFAC+KaKdWZCDt0F29FwBEVeFET6FJu2DQLhogXKqRlrNmNAmvGOz7dmZmfwY3vjWPcfaiR9g==
X-Received: by 2002:a05:600c:1387:b0:45b:9c93:d237 with SMTP id 5b1f17b1804b1-45dddeb93f1mr119978935e9.14.1757493703536;
        Wed, 10 Sep 2025 01:41:43 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef? (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net. [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d3ee4sm19382275e9.6.2025.09.10.01.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:41:43 -0700 (PDT)
Message-ID: <899eb863-6b6d-42f0-9e7c-e2020ee45f4d@gmail.com>
Date: Wed, 10 Sep 2025 10:41:41 +0200
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
X-CRM114-CacheID: sfid-20250910_014145_575856_2985D82D 
X-CRM114-Status: GOOD (  14.84  )
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

Yes, but I still want to upstream it and was thinking to keep the 
"original" author even if it is me.
Am I wrong here ? What should I do ?

>> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>



