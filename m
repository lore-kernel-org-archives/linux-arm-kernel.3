Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CA1CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 18:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evnk7vg3/NTpBLsBSt0/v/1Hx+pafxs17vxy70hm68o=; b=cZH6RHXg85VUT2n2t2iSUzAXCq
	2Gx3sOBSJxOA79sUTXSMP36SAUW7nj9cRum/w8qPc0RUagB0H8Ko18ylJEftpw68x3fArvqN0xhTI
	QNmHp9+0RwM3PBzeoQbV+VY6KJwO5PeFegA82SXy3lEfLUFNwfjvaWIVB6JnuMN9jQh/Dsr9plhHh
	G9MIn1aRmvud2AFjlhG/YMOgz6E/qdmHSuJNEGiE1oYOBYGCctyY5ZH3tgr4QoRVhisZgrNmncTLa
	t2+MROM7Z9iVpb5h6pCbOL4c1zaR8poj6FM2iadxcHdpu2cHe73lUhXfHphMt9hVNhn66xeqtdNTc
	JQjXvbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHuW-00000001iCD-0k1O;
	Thu, 18 Jun 2026 18:56:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waHuS-00000001iBT-4C3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 18:56:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so13394055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781808974; x=1782413774; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=evnk7vg3/NTpBLsBSt0/v/1Hx+pafxs17vxy70hm68o=;
        b=LIWVcKVwpVJw/LTX5Ox5fUnjBI5l9K2tEa2XTxPhDVArfOC30vec8bnogmOn/SdzZC
         1VE33x4PxNokW/tsj0ine9g0kTOESO518mULxh/FyDDTjFvSn2RAHhhVnxcUEYM/ZTNT
         jaeNRNaH/3iURi3NMXycNzE/pfQ9ETUmjmjylWZL7Tw3giwVx3mSob5gyPqst9eRLpaQ
         1sHMOwsIKEZbXkC9ht7C7UQMGojkTyRH0R8S2OnLBj2Y2KArJCfsyw+UvzCR/AA7K1HK
         Ggl2GVGzbV8SNEoKx7nAYLZ8O3A0DVwp3jfnUctFWnGeEeiMTEDvwYe3dwHTy8N3UOG4
         fgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781808974; x=1782413774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evnk7vg3/NTpBLsBSt0/v/1Hx+pafxs17vxy70hm68o=;
        b=mTWX4mS142UOMoYwzwSH9efT3UYYRCIS4Ejw02UcIePXzLg+dagRVCjFKXiueP5clG
         NQm9UwJ/4DAq1kzqyvrd7rcCLy2w5ewsVjw8t15D1l4h9oap1FbjyY2GXhVaCtssiGyL
         erxOJGYFUm09a0lM78rHUVrM0PdT+65GhKsekrluR/asXLDjOZ5z3/swh5CTwGUSzJVP
         HR5/+SY0Hsm2VlucL14uKYwM1FRGpWYzH9JTs1xfeGNKQBlhcj+LsHUjXlb1Z0iTGcPr
         oylcPb58D6wnwLeFGLuVS6fqvOxo0PiYEcqeFF9uSxrtflmKDxI7AV4pywBU7ZNhItbS
         9JPA==
X-Forwarded-Encrypted: i=1; AFNElJ9DK7jcIXbqyTUVa21Yj24Kvy2T5WoSHsiZgAgNawbDiELBjDakml0c44LMHWissvFxVzODcpP5sdXtTMF3GZrs@lists.infradead.org
X-Gm-Message-State: AOJu0YxL4aYJ+M1ObxH+XinkjxM0wOdpk80fKdBuvAaabRd/Sy5cEyAJ
	w24rmYY4jgKorA84Z7OmbjVQAt7yKJVUro1JEOGyqIaY1lE96YGhk9si
X-Gm-Gg: AfdE7ckN4kCj2yeMjiX0m7JhzmKYdfFWqRC4qrvHPWejFqjiaouOZpbbPbCSsP+LHon
	RCXFPZoyLWpw+tRhjNMLuRhzp9XHk0+TMUmDzX3yURH1oTe9roW7PALEAbmcB4xUQlmdZtIlF4v
	F2i4UTW6O/VXB0OpPWvRsRygY7G2fKbuXnPRDraFDljoKdjBfyXZ2c9jSSDtxNeF0GPQa4CmIsj
	muhCRoVu2P86WmvhvE0zQhx4TTnDK/B9vXdLop+OWknsRKCFogKwWlhEhV4DolswbhpZi08X2DX
	BOpEdtUT0kBZkWPX2QXaCeJWqlXBGwZn8Awhxkf2brhnUo45vJ7GwnY/13gZ0u+Woxq56Jb88QA
	nUz2O/2Fndq9TtOTndaP+WpAT6VT/Q2GZvik22th6dQrGXbtbK8787yBvPfRbrs1ZO5rUGjsugS
	/3e859y7JjLPrt3EQwHjvntDC5lT9huI1NPsSn+ePSaPeunQFNWyw8DK4OqprzhVrQEvsukV9WD
	vFgAT9ffH426Lg0Pw==
X-Received: by 2002:a05:600c:6090:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4923f4562b0mr19793815e9.9.1781808974258;
        Thu, 18 Jun 2026 11:56:14 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcd7027sm9756965e9.1.2026.06.18.11.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 11:56:13 -0700 (PDT)
Message-ID: <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
Date: Thu, 18 Jun 2026 19:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: jian.hu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_115617_069585_CD16D223 
X-CRM114-Status: UNSURE (   7.39  )
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

Hi Jian,

On 6/18/26 10:49, Jian Hu via B4 Relay wrote:

> +config COMMON_CLK_A9_AO
> +	tristate "Amlogic A9 SoC AO clock controller support"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV

Selecting COMMON_CLK_MESON_REGMAP is unnecessary since you're already
selecting COMMON_CLK_MESON_DUALDIV here.

- Julian Braha


