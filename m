Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23483C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJ7phtAchKalRzfMPp/9VjD+dUYfNbAqpxaF13GODMs=; b=SHHQNCwt4ec5NhuaV0rfU3/OmM
	QZ8TvuHDb9zBCQZ6B0JV3Nge8aj/e0IFA4DVe6AojUDru1WrqTF3Hnmq4X2hjfO9TRh5VZZ+gdNgi
	3E/Y3EDOltcRml3o+rL5Bdeee0hQTG5LB5vRxNvi2r3eMCX9uCmUqN2Z7lwCuk0eKZYPMIakuJxTy
	832reErujsiY03QeWrCCrJGDMuYWBMWNhnQZlcXm4d4lGg9dwVdjIRUCn3Tf3x+HbD5IdORJuaLRe
	S1sFFu0AXc3RqcFiDlF9V7egakVBmqjSUZr+eFnjsocym4EFh5PgjBE2rkAKpyvw77thH5R7F5IFg
	o/A04gxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppqu-00000008NCj-3Vqx;
	Wed, 05 Mar 2025 14:36:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppio-00000008Lax-1yub
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 14:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sJ7phtAchKalRzfMPp/9VjD+dUYfNbAqpxaF13GODMs=; b=J16ik2IhJ1Po71I2LpIrIspA0r
	vdLodf3nAOlRVfaozc4optD1XaF6Cl8tdl5NtJePTDz+6bq7RBGNnbg2hyCTQZ7XZdINfqjcBAIzg
	AfdKNJwfxOjBfpTYPMOt03QXudOtYstDzNekeIVeMvDKSSkSKfL8+DOwv6sbNpueAyD4LBg8Ee/60
	XNQ//3AWmIMzqQXJ1FeaRdh6XBOx4bb0E1vnVZ3b4te3M/FrvFULDaGc3sYzeRtUzENQ2W2Id0D14
	P6pjdOzywEsw9mb3laSZYe0FmYjYyZuxFJgGO4Yp0n7Qi+bPTYpdgp1gqXQSv9f+/LbJEVuAcZ29D
	EWbvMuOQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppil-00000000a49-27Hy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:27:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso1799785f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 06:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741184854; x=1741789654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJ7phtAchKalRzfMPp/9VjD+dUYfNbAqpxaF13GODMs=;
        b=Uu9xzo7feQHoy8S9QqUavZM0XLGC14lWTcq5Kbb9w428sise52ReSl4iBUC/Hqujyi
         rfuFvys4jMbT2WucSSpK4AJVF+BJ1P6NukfNUdPTSJ50bTUV57qcUT/w9iXVOLwdAmtE
         wcrnP57eH3jRwO68YdTo4pK2llLADyhjJ1ETIDDhOlTvBpv6S1eea8CanA6j+aqUEX10
         B5HAqTG9+EHFNW97l8vkWbSIQL18Cz2+ErLJUyyHgCxnQPX8O6Ak8jxU4o+VB8Nw6ARR
         qJNISe0XlHiAskveHYzntyCLwF6zzoN3KruMHfZEEzNwskrQWjRGKWF7waLLtNsXKzFw
         Pdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184854; x=1741789654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ7phtAchKalRzfMPp/9VjD+dUYfNbAqpxaF13GODMs=;
        b=a1TAWBrIY5AHE+8grMkxxhKMVwLDVDKyZJoIMholMoMC4+DeS68xegspAvjakWmVsJ
         3+FEfn0NUd8dXjFAIikILC79U9deIqiY/d74VVeFz8WEEw5AG5P6w3dpkzNES7NfEQeL
         /K6hY6nyhxa01POIZKs3h7HN5bKg0QLialne1Z1Z6KXdyzKamavyImV6TbIj/ya0Sn4j
         Ge1jA6oFCCSD5xeKCSybMZFXY6N3M2FG20je5OCdFvrTSDcnp1sEQ5yyAfuzzEDcHcvr
         PU68RyRJmTVyY0Y2rpZBYQ+r9oDbXtO0sONc/F/K2TgyrBcCeh9VrgLugmLUYATBHfre
         EDvA==
X-Forwarded-Encrypted: i=1; AJvYcCXCNwtIviFNoa/nLYQToIgsXlWW7G6hwdN7+nfo7EwBchrXfBPw/jtrDie/rwPngWrniB2OxvBy6Fxsun08WeBK@lists.infradead.org
X-Gm-Message-State: AOJu0YyJm2DU9F1cfbFIPgCHwTMSH0WL1mTG6KyEeGdOql3lp6oNj2kc
	K/jFrLNQI4J8DMRqnkPgri2qGgZ1AqWbtKDUrQaHd7D5Ls13cEKM8AafstkKjl8=
X-Gm-Gg: ASbGncv5qedQTQ9pqjar5HpfrFPZSupDEQctz78ecfAG8FdkYJjqmKnvn4Ch3uFqOnE
	L7P/ohJ2aJex6QL4MjSMs8F1BhnXGEBtxVloELiVbjlwytkdjDaVTDvUZ/dd6Z47PBRqCLZFRVW
	OodLL+ipJCx+LJjWeriD8IZkcWA89wQa0nKhUaxGmQT0lwBZ/BgblODZOXM2WSvSSi/gx900OYI
	DyJMxLRauvAkL4yuJiPliY/XW1GmlFJrDDy2BBXOA5UMC3qFe5datDxTOGzogzUX1rFNjRAVpoq
	94yTRAotx/baUYfHsZtlPO2F+nJQJV8oB4JmWVaJnSnbY+HtFQdyjA==
X-Google-Smtp-Source: AGHT+IGCYa2sszNld+5UXNNTx4iNaBRX4ci2aOzVOLyC2rHLFiTrvLpSwYOYiufBagELwGqLV6kyUA==
X-Received: by 2002:a5d:64a2:0:b0:391:13d6:c9ec with SMTP id ffacd0b85a97d-3911f740312mr2628688f8f.20.1741184854656;
        Wed, 05 Mar 2025 06:27:34 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d906sm21408096f8f.90.2025.03.05.06.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:27:34 -0800 (PST)
Message-ID: <ac6ef67b-84bb-4679-a344-07bba50e054b@linaro.org>
Date: Wed, 5 Mar 2025 14:27:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: samsung: Drop unused clk.h and of.h headers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
 <20250304-clk-samsung-headers-cleanup-v1-2-81718e38246e@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250304-clk-samsung-headers-cleanup-v1-2-81718e38246e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_142739_656670_4F44FC5F 
X-CRM114-Status: UNSURE (   6.66  )
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



On 3/4/25 6:45 PM, Krzysztof Kozlowski wrote:
>  drivers/clk/samsung/clk-gs101.c          | 1 -

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

