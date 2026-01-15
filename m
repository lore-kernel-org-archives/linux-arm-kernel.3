Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C4DD3CCAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xP2VPIUiLJoH99MGWGrtf+rn+/TD63H55qh3heQER8c=; b=dHStjeRjZW20LMf2BVPDWayM1A
	NZtpcmfBzoX7aQ2A/VQQo5grzxF6DCT2vij4XswL/Y4gPleXrmJlFpLIJ/GyncJ3bw1v0/Fw1N+/U
	nXklOqLMt5PFLrMazaJxjqoktFGFS4uIk5YdFGhJG0IsQ0s6WZrhnzWGFuNwbzL7SOW/vKAzGPwOA
	MVneHtIIu02kVeL2Z1i5eUbgZxE+5qo7bSQg1MLd2KkHV8LGJrZzIfm4GSYVtn7+wlUKzI0jbI8sa
	Dn4apCjdDdLVlI4mLPR4G6gxr9Doo9fEkNTteWSxlwRzQDRD4Q3QFYUqrJuM32lfydeapcNO7TRyI
	vFPeow5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgEi5-0000000BkAW-0hlJ;
	Thu, 15 Jan 2026 04:11:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgEi1-0000000Bk9S-3jgh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 04:11:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81f3c14027cso259437b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768450304; x=1769055104; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP2VPIUiLJoH99MGWGrtf+rn+/TD63H55qh3heQER8c=;
        b=TGwKjjLKEFmhIAtUsuyKdLYggbLHP0LOmGiIsCHpRJIVSa5/I8nxu+M9lG/bpEpPrK
         XWPrJPGYRK9+VCnbZzaZQ7R3EM0CsKYw0QAgOJx0TCOoUNqFHvMa36MB70B6RLZdRhmC
         INwAbtfKp53f4nosP/vFEocL1rDosVmJhpru0QGMyNTUT9326vRKIeMGDzkQYOXENaqx
         LZpSy+GO7EsycmDHOyHlJTTje4zFNHj9Mk/YUHwFqPAVDcyvsAH0IYcHQSKLlZMYRqbG
         pS+f+ZuGJy9do4ztxKJ9bfuDwG4kFRz/ggrktRfgT6+IvTr/4JOOBOIv+g7PsSS05Mfq
         YdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768450304; x=1769055104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xP2VPIUiLJoH99MGWGrtf+rn+/TD63H55qh3heQER8c=;
        b=dsoOgT8Es9ySOBzW7OU3NOQeFyzdy9jB2Dtn/d511OU69Lne/qFW+oxniO09Kp7woR
         Trl5fH5OCBjBKWOvjwmX8NjqCugbTZ4wLff654Da3vbou8hiwO4zYvEmZ04fQ7OtfC4R
         tteCQGZRC0+Vx3byD8PwrNPMKCxXp//CVO/sE3xRm6x0KbDNsMz2pMpNcp2A8Dv51L2x
         xVORTo9SSJnUm9blqZGgbUvl/yRekAO4+pwQ+o6qCY3y+yFcs68iO2Xrv9vTCQaqlnBv
         rh5AB6aqVkjq6zzLYfTpa5J1GN3BKbuh8bNVEmuv46lG5S/0YrxQXwWbUCC3ucHsVuSI
         E2pA==
X-Forwarded-Encrypted: i=1; AJvYcCXR00xB8O8GQBE/SlIyJ5ja2s47MMVCL3G0C9Hqv2FiUzea6DTqK/Kzghqx7uC/WxEIUwBa5El1Enarlr6myDC+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw31a0FVrTy53wbPFMu49fsjZTVz5HYDMDnqELFWsw9aCCjV2hF
	vhP6v76bzUN9BGESdbShDETMqtlfcNdmK2xLEptOzZ7HnYuWCruq2FF5BSju74/Rijw=
X-Gm-Gg: AY/fxX6go83iLW8J6evK+FEusdgiGOH3POA8W9yG6YpIuNGBADOCueB3Be2JGvgevG4
	HpwJ19H7Oy5ND0JedBzgUBhBdMp07DC15DxbQmX8c5t603B+YUSCAhHuOxRvm9LIz8uUifdDBur
	hUHWoKT+hPzu0zO98w4BlcaX84W0VlHG42hU1wfJYnPjg+gOCgtf6faB2XZBfmB/0PVhqamGo8b
	Ln+JWMjBr7QXoeBBaEzXYESOCpN9CpMuYsWN56WJsSNFnw6DIER3+PAJm6QpO0iXLIeIMjcmBPF
	GF8cNpfWzde0nfvyTDO/4ydoLIzwNlNTwHFb93WC4xoVsnpA/51U+5CQTBb4p7W451hY9OusyCW
	S8qSzKbsljrwhuW1vO3o6Q/r3teE435gMiOk8SRmw4AyHe/Zx5cbM3lmMBDArlzm1VaT+25kiUo
	4UesIqMmvXAi4=
X-Received: by 2002:a05:6a00:886:b0:81f:413e:5b6c with SMTP id d2e1a72fcca58-81f8efaca14mr1910211b3a.5.1768450304213;
        Wed, 14 Jan 2026 20:11:44 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4f19c5sm1038158b3a.23.2026.01.14.20.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:11:43 -0800 (PST)
Date: Thu, 15 Jan 2026 09:41:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2] arm/arm64: dts: st: Drop unused .dtsi
Message-ID: <idqqwx3svrauv3e26dce4uofevcyd3a6lltsjvpeovp6nse4le@yqym3jc25xr2>
References: <20260113201340.36950-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113201340.36950-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_201145_944028_D8F782F4 
X-CRM114-Status: GOOD (  10.09  )
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

On 13-01-26, 14:13, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Reviewed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Drop erroneous QCom .dtsi
> ---
>  arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

