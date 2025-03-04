Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B8DC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwZWXvpRlzaapz6M25h0ltLJIX9XFgudqnE1z2aOvDw=; b=qllI3XQiLA8VMBZxXL6NgWpH3r
	f4lzLtwZbpqLOzWhKriEGxtKcAFHDbF5e1a8sUP23TiDaB9MFw2awf6kkIMK2jymUyn6alsipD/1k
	guNvB1HuLKus070XTPcu9UOrdJmiV0/cRjYE+ztolBeNUV9Ss3m09wIJP64ndfsoGBB/BBEozYkcb
	NX5TJ6ElEei0YATk30OIKOS4doVaQCzKAaqPhuCSwXdcGDnf+kkJ+cvAxxZ2CDLf5uPglgCerj7Ai
	8LAsKkJUwayTgQFvdYct1fiIJg18+gTUPhYHxwHYkmkXiZPiplYr+qR2NYYuGi7OKXMJfebUev4+s
	c/23i+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVKL-00000005TPK-1lHy;
	Tue, 04 Mar 2025 16:41:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUIR-00000005Ef5-459W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:35:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abf615d5f31so556698566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741102502; x=1741707302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwZWXvpRlzaapz6M25h0ltLJIX9XFgudqnE1z2aOvDw=;
        b=KY8B1QdXPiGL/o+0aJzV8n4qKxn68ddHWSk7+WI8UmmjjLC2mCMF37NYmfDuHQBtIS
         MCZGk6BlWDwUaZHhO6wcXaIRB1PWRQMdqBYoKkDuXQP2kvwzYP+NnMGmx8a50/LZWHHW
         m58HRfBOUiMiw0Xr9yglD1jmE36N24eHQOCecfbKdnwb0DGUqYjCBOpu8LVBoe0CRdkO
         irQBQ2b3fPfFcyZyTS5/2AegBRZEeM17K6HiROdjEE4s2hjMWJajRWCbodH861EBibnh
         7TVeK9v2UNA0/UwU2VX3Ye9n2GVJDYoa1eLxm/SyayCdzmcmGDnaA+kztNecgz/Dml3I
         2vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102502; x=1741707302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwZWXvpRlzaapz6M25h0ltLJIX9XFgudqnE1z2aOvDw=;
        b=lDrucZ3HXRjAjG/i/RRcUPoyNoU0QvpPiHiipykaX+Otqxb17Ep4XXLaKezwC112TS
         WWhspgFBPWPAiFLrHjXtSxJCdPNelmBkhcag2MwFtTo7+ZwGA/fklg1cc4H6MvJLh31Q
         pW3TNTlMA4vLsgVkh1ZcTQ6JX4qM3u4jRYCIH+yQrfsbhvrdiz7ZJE1e3OO6BTXi1emc
         FxBfoZHuglxubT9jOm5KC0RcHHgp3o2+fcIfX7pDA71eyLRBACQoHIOPrzeXGv3l53Ip
         xdR2pUKgsrJ0ZGQ7xVnuYy7301L0CHh4Cc6EvL6ofX9goMS3z6lkxfSQuttM8fwNj7ln
         fJJw==
X-Forwarded-Encrypted: i=1; AJvYcCWxURuZA569yt/eGY3i+eschnffXM2Fd2hdE65wBv2HhWxYPBiuS1xOAUmLuhvcSWvc9j/9d8yGJoemX+6EftB6@lists.infradead.org
X-Gm-Message-State: AOJu0YxMTX31gOneamc3MGJXid8oauFHfUy25WUoYfmgAuJmSmpo1gU6
	QeRn3/S/xjFWFxfxUmdENZO5KIidEKEMVNvyqtnQoeA87mMyjM0Uf2joYaxV8tY=
X-Gm-Gg: ASbGnctHqeIAzx40GoeA3a43kl22rguzycmliyXOfCWI9Q/PS/dYfKoxFb6kTSn4plF
	jjI6f0umTWuSaDH6Q5DPwaFXEWZSNWVzeFXRKYT3pl5H/4CgKEac9K9+2xgtbf7T7q/Cz3hTooC
	WcxTPGuNyPfQyqeDlwVVTRWvFDH+/uLGjv8A1cvxJt30QQQAsmMR2jA2vkyt6epH60/UgtE/JGM
	r4Z/Yd5ccF2hrie2BhlGNfmLHMD8pb8auPf3X6DkEXDGrWUr0Z+5d4KAYeGS+znM9ijBRvP73aZ
	BjVm5I8M4nO5Ped+Xhsj4GAse/F3PRdp0loM4QEYY5isHJ33/S+1JMKJtmwy0qONpFz4JqGCfg=
	=
X-Google-Smtp-Source: AGHT+IGYG9XakyW+UdqNNLCDXpKkxXWG7Y4hV03XJnaZ6z+kf+TWlmY7SAdaNuPfFRb4w3Wi/uqpzw==
X-Received: by 2002:a17:907:988:b0:ab7:da56:af9f with SMTP id a640c23a62f3a-abf26859581mr2151760166b.49.1741102501551;
        Tue, 04 Mar 2025 07:35:01 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf74e85fbfsm404613066b.15.2025.03.04.07.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 07:35:01 -0800 (PST)
Message-ID: <09aba9f8-354d-4987-9026-37eb3ca26d6f@gmail.com>
Date: Tue, 4 Mar 2025 17:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
To: Abel Vesa <abel.vesa@linaro.org>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Marek Vasut <marex@denx.de>, Stephen Boyd <sboyd@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
 <Z8Xn7f6vXg0aM4zx@linaro.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z8Xn7f6vXg0aM4zx@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_073504_013548_F14CFC41 
X-CRM114-Status: GOOD (  12.22  )
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



On 3/3/2025 7:33 PM, Abel Vesa wrote:
> On 25-03-03 19:30:58, Abel Vesa wrote:
>> On Wed, 26 Feb 2025 11:45:09 -0500, Laurentiu Mihalcea wrote:
>>> Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
>>> it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
>>> the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
>>> 400MHz.
>>>
>> Applied, thanks!
>>
>> [1/4] dt-bindings: clock: imx8mp: add axi clock
>>       commit: 2471a101938b0d1835b1983df08daeb98eef1205
>> [2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
>>       commit: 91be7d27099dedf813b80702e4ca117d1fb38ce6
>> [3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
>>       (no commit info)
>> [4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
>>       (no commit info)
> Applied only patches 1 and 2.
>
> My b4 setup messed up. Sorry.
would it be possible to also have patch no. 3 merged via the IMX CLK tree? I'd like to at least keep the first 3 patches together as they all fix the issue of OCRAM_A/DSP clocks having the wrong parent. if not, Shawn would you mind picking up patches 3 and 4? Thanks!

