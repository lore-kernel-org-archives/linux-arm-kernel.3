Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9B1C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=; b=xx+ihqjY+CQ9scJlXsOQJs6EKL
	992gKeIa1MHydMFfcDli5iPDvRsi/Eu6oNsRfEuji3dDemlQtBuBXvoV5gV9tAYTNBk5OPW9jvxCD
	cwBaBzu6jYIGyIx9Lj12Nfv+SsF9F3Ku9LSbY8aZNJ+awe0EZZDowhXp7KPjv86Xc5wJAoIX2QQfY
	xKDpie0v0C1ZdiU41JcEy5QP3LeW+nnQQCFOGTQfWE/JcaY8R8FE+TTwRqNUmPrWGZCwOS5EpLOyC
	OI0utqgQ+rd4d7Qr3/flPmUGyEivedjetJJbFe8UPh6eVCEVKKc8TZwSTUmB19QiUluGkMwBu1d+r
	imKIXbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9jQ-0000000AqFF-1GKY;
	Thu, 06 Mar 2025 11:49:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Kk-0000000Alwd-2rqv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:24:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so84594a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741260249; x=1741865049; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
        b=v09zo+ZGH5ZzHbZZp0X6YitBB8DVbrnGugpT0mlrDbRxqNI6dYF4exnYB9UfEgGJOb
         Ei4nYSFrm6PrHR5wkAJ/eCaK44C6JAqmyM49OCIveuBdNd1qgA8qOpXmNCIj+uIhxPH1
         GUN2TteBL6LuL0MbruilMCVKuz6iA//m+JQyoClzReqr+lOV+Nf4ZWt03Erq5pf3uFci
         b0wCDkYZStnhzszoDgCJkzAPLLl/9bVGLYd1Yar8BWS5pD+mgcNCo2+bK3l0nqj0a2Ig
         KvTkR0Ni8an4nnVOLwxkT5cGHaHZVJvEh/FuLeqs9isCmKZmsdYaQ9tAweda1lteF0xU
         qkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260249; x=1741865049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlrvRCPySdQOxtujofeQxJmxEKL7GhiXvuM9GTzF67E=;
        b=T324k35GoGs4VcmZkqtAbQozxAKkYUHrMAq4C1IdG4wESB8/Hm3m6zsXlTRtkHdnR2
         axqROcE1H4XyQPQ0ORilZ2T8n+BpJ/3Eft+xgikV/ISB1A2bY7adxFqOb3CqqHdiTnhU
         B4HZhDepQhVZ4MP7/c22MW2r63zB0WoE00h0+jgJLK0B2mHl7DT8cuptv3REv4hZyBui
         wY3dPq3rWA8VCd77IE2HfFXE8CZ5CffSMvMhZ4j8ijTmq/+MxFKjkSohGJnJHTM4pPLH
         oZ4NvAn2IqDHQ/93BtvkdkAq6W1Xdcx38/CqYSaNx/eJC7GL17r+kctSAopwC/erC3T0
         +ZCg==
X-Gm-Message-State: AOJu0Yxq6nv0FEfANyH+ePLqwAw9woDaXvd5xscyEviRg6HiQup2odU5
	/4Hw4++781j5YQ1R3nUfNJnasIGLlOqttmpXfTT0n6BMY2LPR46LQhdNJurnz8U=
X-Gm-Gg: ASbGncvP1EtMmP6UNiTrL+Zwuz2MFzdNxlJLW4EkchyVtbiIMpkBAvev8eNB6W5ihT5
	TMZjkV3uvYVce259VC2w2EnDnlG6R5kvSrCBIL3x5yQKoNpY3qkPToz/gxoRZXahhuZT+DeGZbk
	jgVkoOJp5o4KchGlqc4fLouU2bJOKb3fyT8HClYAs7n2mTrKw56PHe4ADOhqxHElvHVDBVT+5O5
	+6K7uwErNYRsE6zh0mTmkzavw58WvsmtqUNeWwr/3rdl9gyFFqixwELgSqD0ToUZQzMyveUmYzl
	To+sZBU30Hg7a59lcjI1wjbs6yA0e5Ph8RdmJXzKkPoc4SY6
X-Google-Smtp-Source: AGHT+IFJXG+ZAc6aSsP/TLrdtpd9ymEZvmqs4+Y8AAQtnIEGb2pYE1iRRI6PfSoONQjn41daLbimcw==
X-Received: by 2002:a05:6402:3547:b0:5e4:cfb0:f66b with SMTP id 4fb4d7f45d1cf-5e59f35248amr6527924a12.7.1741260249102;
        Thu, 06 Mar 2025 03:24:09 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a194sm787181a12.59.2025.03.06.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:24:08 -0800 (PST)
Message-ID: <4a200a7bf5f39034ce206a6c9240a307eadd45af.camel@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: samsung: add support for
 eint_fltcon_offset
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 11:24:07 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-1-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-1-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_032410_737978_7361C526 
X-CRM114-Status: GOOD (  10.71  )
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

On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
> On gs101 SoC the fltcon0 (filter configuration 0) offset
> isn't at a fixed offset like previous SoCs as the fltcon1
> register only exists when there are more than 4 pins in the
> bank.
>=20
> Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
> macros that take an additional fltcon_offs variable.
>=20
> This can then be used in suspend/resume callbacks to
> save and restore the fltcon0 and fltcon1 registers.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


