Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9458BC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=; b=2HM55lSW0qd6fQG/2lz95BTcwx
	mzTl+oWvFAQWybOtvp0zfKt0ElztPe9NnvB90aK61P8DezHM+ETPjMLazJRGc9Nfz7vQ5pYSRIYhu
	cH8mt2zyaBIT/hTN0Kpk5migXRLW1pAQUi2YqtAhSBA9mTo2Lxp4vsp/W7xCQZzD3fz0wa8GlwkI6
	AMY/BGG8TU5/8r4BVgYaVi4YS++uwxWCcet+54u7FpUQhYyhXiVv5aALe9gDJ0FEaSqUpSczWB7ig
	iYMI/tuYCeMbhcxUa0pm7E2f/Va7s+Wr50CS8rGndBvgry/hc0V+Cl8VEUr74ydM7yWBrhmNIA7aR
	M+6GPtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5Sz-00000008gjZ-0Pkl;
	Thu, 24 Jul 2025 23:35:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Vu-00000008be7-2o83
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:34:11 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so1842a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 15:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753396448; x=1754001248; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
        b=ODFbAxOkv536t2EiQnCx5lccNor6GVAQdB/QAXnMQ8O8F8NxyS1i2J/Gvyk5omOWQf
         VCm2uA1lS6DjVwGngDikN3rLNaABD8d8Q5Kzkjy1dkq/1icWAyh51IWI9qrYq1Up3sM5
         udm3NZqhkAEQTUgleeSaTrhKIPMTENza57aYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753396448; x=1754001248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
        b=Nc+2/cDsOy6Z3RZZEw5LPBzUC+9SFhvoIJ/TERehea4sX7S/VqJxGztOKMyvdi+rw6
         i/aKYQ3hCSYh5ycBThl621mm4Py1zHGz6/nxL7w4UF9drJwtl4h23bf8eCzYeW1FNy8X
         8BSMQydbji4yb+/Y+2CNthbNL4KcsA7p/Oa9zUMVWIpUxSsZZb7DXka4dxXLvOumEH4X
         HpSJebjRBIdwOFoZkj7AudDB7IE7apdtaGKHiPLRDGK8LYPsH/urFcvF2rVMonkpjznG
         B3z8ttBdw9cyKpNB1QYOqTnaUMrGGYtPINmjp3F7dzBSkAcAv/EJb+argcTCdfiFwGKg
         2AUw==
X-Forwarded-Encrypted: i=1; AJvYcCViqjsZdM8ssRTgI+1o/UXX538ywabU3VKtaidGYb25uafjxvvYivqXl0Eh8xQizo3Vt9U6/qAIcM5aI3uWJ8m4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8itesAGZ7E3BpOHiYp1b2vHYw/E4zTx+abH32QiMM8f2cMXh/
	TQxS95xChK/9JiDjpxvv6QJQqwoRcYEfAF+IpKnkE6cv3cEma7IQCxW+zjDsfPCwRYbdIBwJvJk
	rOgJS2uekguR6MIwzAbnW1uokYp6nTPn1IcgRhsbT
X-Gm-Gg: ASbGnctgo1qHLdDCtUhrMqFCCPaPL9ppdaL6am7TgV6X5wIurxH+o+eREf0f/QghLN2
	Lx9aPAHDTdiVg6ov09XZZMlPoSgtpTeCmY2gXGsXI3VaIevq38o1zOAGkHsreBXJu9XLLpGHTtu
	/z7heYeQ25qkXNkX9wvgavXjhpQI/BpP9yaVeqh/LaMvZCHqJf9dGSZLhMbQ/ChxEVJlUpdLjPO
	i6k2r9Aa42RDS2I/UC77BkAERbxjIJx
X-Google-Smtp-Source: AGHT+IGw7888sY4RAxWgOIpBS2jsqbLS1GSQw9Ezb4XYcelgTGp5K5TJlI+fh66ZnLxrY/LAEeaPSDPFviU6dhf0M5o=
X-Received: by 2002:aa7:cd50:0:b0:612:e537:f075 with SMTP id
 4fb4d7f45d1cf-614ea7376b0mr11607a12.7.1753396447893; Thu, 24 Jul 2025
 15:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
 <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com> <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
In-Reply-To: <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 24 Jul 2025 15:33:55 -0700
X-Gm-Features: Ac12FXyGMQKjEAnwbki0mRBqxHKS-33YCATLZ5m_kBV4BCbWy_vAFu3BOhmvtmo
Message-ID: <CAODwPW9drKEAMfQvQHV8eMTyf5KCHB4SN400JiUs0pgjoXy=sw@mail.gmail.com>
Subject: Re: [PATCH v4 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_153410_732672_1D48EE4C 
X-CRM114-Status: GOOD (  22.40  )
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

> > I don't think this will identify a part unambiguously, I would expect
> > the DDR revision ID to be specific to the part number. (In fact, we're
> > also not sure whether manufacturer+revision identifies LPDDR parts
> > unambiguously for every vendor, we just didn't have anything more to
> > work with there.) I would suggest to use either `ddrX-YYYY,AAA...,ZZ`
> > or `ddrX-YYYY,ZZ,AAA...` (where AAA... is the part number string from
> > SPD 329-348 without the trailing spaces). The first version looks a
> > bit more natural but it might get confusing on the off chance that
> > someone uses a comma in a part number string.
>
> The first one seems better indeed.
> If the manufacturer put a comma in the part number we should handle it
> at a software level to me and if it is a devicetree error it is up to
> the devicetree writer to fix it.
> What do you think ?

Not sure what you mean by "handle it at a software level"? Using comma
characters in the part number is not illegal according to the SPD
spec, as far as I can tell.

That said, it is still possible to disambiguate this as long as the
revision number is always there, you just have to look for the last
comma from the end (so e.g. the string `ddr4-1234,some,part,567,89`
could be unambiguously parsed as manufacturer ID 0x1234, part number
`some,part,567` and revision ID 0x89, the parsing code just needs to
be a bit careful). So maybe this is not actually a problem.

