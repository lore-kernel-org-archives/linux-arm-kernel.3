Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9622DCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SB0hkJoV0gPF+mcJ/isTFdgNlIuPqjaVKGVPd+vcG44=; b=mycWw2uOP1IlPxBFd6v0YEsgRl
	BDyxXT8kMN1zTldG7zQkP4ffg7ChE802amb3crFeg0f4GkeF4F0RE88bTvOGwKieBGEOVmQeTP7yH
	3u/ySoG0Ii2uV2TS0L5c4n9M3bnmwuSkJFqlJPb9nByjH+BFts+Ksj9RXtPSaovgsm64oCSPZQFVF
	mnTMGEkfHaLQjyD0XS1GJ8WrqxZ9QjmqvvpmhmggXbJTsl66se9qY9NF7hCAs7jmYuP343w26zfiP
	ypxpVdSvq4N53/CpLzjEtbLE29DidaA8lxYlik6PzCA3c+QFZ5WzacOjRy/J9AnVlPNIkVQMUKyqJ
	P7RfXHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2B8-00000006Hnx-3FtJ;
	Tue, 09 Jun 2026 19:32:02 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2B5-00000006Hn5-2QoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:32:01 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-43bf9548df4so4204564fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781033518; x=1781638318; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SB0hkJoV0gPF+mcJ/isTFdgNlIuPqjaVKGVPd+vcG44=;
        b=LA1Xs7PxmDZQTpxGddpgSE9tRjUox7aXcNCw9h6QhH2FknK/NcLtxryLeFecEf5nW8
         8mJFvt/OBZIqEzgOKn4VaOwqqYkO909aZSFTSufihfZm01E5vfe39ePMcEMkGB3RRHt4
         y0kaLP0AlM2Q4HJ1eV8FLLDKQChecj0PNWydHkNAzJZ4ob0ne67PEECXFsty6hbt3TBi
         oh+pAMmrjiD/87xTe0+WY690BlkgHZfRumuUXWWuMtsu5avXHxkQE6n5wGV+JpfX+Yy6
         yMW1Z+DxrNgGIZOzEFKzwXi3AZAP3ZfFaf5H6p4LEP72ET3VZcvTjoq0kGrPKxdvfbQz
         6gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033518; x=1781638318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SB0hkJoV0gPF+mcJ/isTFdgNlIuPqjaVKGVPd+vcG44=;
        b=KDHgE87C0KRXkmEPQg1KPakEmo5q7K2H2rR5Gy7h8Wl8nzs1pBC8JNLb0FgzhsklGJ
         YwDab44/SsIVafdx2dRmFJMYGv+rnxPzeHVosvFwQgJuRsq/l8644w1BBgNaMgOoZBaw
         kpLZypgOKXW2hkUjADI5diMb7viecP+un8TgmD/0zhKIlYhWGrPX76zzGXYLCu97M2BT
         Qed8bjVN5rH6vsIZ/T4o8QI/hKOymzy+daYHRDxKBjlpunHgVe5BKazhtYk0sbblMlxe
         vmhyM9s3plSpNeyRxuQNi+ZX8/p87aEOP6/oE8q1vqvjw4OSO9uO6aA7ATdIhk67jCi1
         3ueA==
X-Forwarded-Encrypted: i=1; AFNElJ+RPSW1y888AdNFQheDW+eOuNqWPeesE7BYKUYkdoyyvGM4QN+BmuJXV5jpZo+owT7CjuralMw24VbvpWbASMM2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+zibnctRXynZZbEAO821FU9eGFKBid/nZNd/kggMGzvJgK05T
	U0LUfUZQcxZ2rvHEyhFb/1drFzs9AJ0WTANj1udUxzguYqL0a7hlQ2JLaWirzNyXt3c=
X-Gm-Gg: Acq92OG59aLI8WEC3KI9T5XYbxdiOteo8VeDoyOIF5zC8H3kaJOMHMKFii21Z/iEPQ5
	ukyjPibN9ekCR9PulOjHRuieasLNxhX2BEFVht6MUmGov9KwrFo2Akjjmy7LWK5D3jTOgJMyrCq
	vW/KoSej08pefUDEKHLi/khir9SCIdEqWd7uUTbxy11Up4uGA3oZGLAlT0agVt3UUEQWnwQxm9m
	L5Lm1eY89cLd26Z//mv7crbwzZefq9KH+GI6m50AP3xnO8gE+myevAx7InQpK+gO3R+JByF5gl3
	oUla5IrMY9kErr5yHx+xp64u1wqUQdX8FBwlBnFCgZoZCitVVrroRi1fWFQaQ1ooEWcu7J/GFN+
	maMBpJehEcYE9G64dGpO/P2WuqMGcvZGo2vFu/hT97NSFpb11repqaeDWycAFTLC6bpgi3YUqTh
	BXxqgVY7sSBGVJmxMbmAvfT9BZP55yJ7eSxg==
X-Received: by 2002:a05:6808:2448:b0:467:eccb:b788 with SMTP id 5614622812f47-4868dddb842mr13686943b6e.9.1781033517995;
        Tue, 09 Jun 2026 12:31:57 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b32f372sm16507092b6e.0.2026.06.09.12.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 12:31:57 -0700 (PDT)
Message-ID: <6e289973-53c7-4008-baff-d7f31edf6910@riscstar.com>
Date: Tue, 9 Jun 2026 14:31:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/14] net: pcs: pcs-xpcs-regmap: support XPCS
 memory-mapped MDIO bus via regmap
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-4-elder@riscstar.com>
 <566af63b-05a9-43f8-94e9-19af737c848a@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <566af63b-05a9-43f8-94e9-19af737c848a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_123159_764545_742E1DB0 
X-CRM114-Status: GOOD (  13.85  )
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

On 6/5/26 10:35 AM, Maxime Chevallier wrote:
>> +					  const struct xpcs_regmap_config *config)
>> +{
>> +	static atomic_t id = ATOMIC_INIT(-1);
>> +	struct dw_xpcs_regmap *pxpcs;
>> +	struct dw_xpcs *xpcs;
>> +	int ret;
>> +
>> +	pxpcs = devm_kzalloc(dev, sizeof(*pxpcs), GFP_KERNEL);
>> +	if (!pxpcs)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	pxpcs->dev = dev;
>> +	pxpcs->regmap = config->regmap;
>> +	pxpcs->reg_indir = config->reg_indir;
> Looking at the overall series, is there any reason for this flag ?
> 
> Looks like the reg_indir=false path isn't used at all in this series.
> 
> Maybe just drop it and let anyone add it back should the need arise ?

You're right that it's always true (in this one case it's used).

I think it's fine to get rid of the reg_indir flag, and that
will simplify a lot of things.  It eliminates the need for the
xpcs_regmap_config structure (just register with regmap pointer
instead).

The "pcs-xpcs-regmap.h" header could be removed too if we declared
devm_xpcs_regmap_register() in "drivers/net/pcs/pcs-xpcs.h".  (I
won't do this unless you or someone else suggests it though.)

I will rearrange the code to support only the indirect access
method for this code.

					-Alex

