Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE568C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIMmXa+05o7cFUzmMY0oE5JLkS5yaur+8NGSr9bhuis=; b=iMwovR04yRlp9jWs479lZsJKrF
	RLcOdJRfGFQzN/AbcVx027R+3S6HiqaXt++BUs64CDC6wd+6lPJ2eZIkihjCEeIEsIqpuUbHpFkIn
	V5s9HlSJDObFwkJ82mgjg1VzLwCZkJ6nKzHazvsJxYMG93eR0tmZxu8gvPJt/tntTMcNgjSR1wYAX
	PkHXMHwirLDR0H+hzeSLxPsYVfWgLcdcwNO3uQtAzLgwBFWbLHwf9YSZYz/JrtgZzsuJzDNMM5ojr
	8YbebyerL7p27eog1LUg0oXb7Ce4WzLrVtIoNPa2FkW4bTeYhyRartlnqPfo/9iYITqiKzfkTdkA5
	BLcnCvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNcM-0000000EQeY-1goe;
	Sat, 01 Mar 2025 14:15:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNam-0000000EQIr-43yx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 14:13:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abb76cc6108so41911766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 06:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838403; x=1741443203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIMmXa+05o7cFUzmMY0oE5JLkS5yaur+8NGSr9bhuis=;
        b=EVDHTONR0M5wfXZFPbCmFfKQcLQedrDoGM5UTffSJ/Q8AyEScDdbnjFEKwzPuCDwwc
         sxo3rTHwHsnP6aY15DBv80ES28zdVjxWbyljXmg+QBVECq+p3hPB8tS8DQ/pOAuH4+x+
         PijLr3iKn2i5NAjCXb/N5vmHa1na1YiL4k30LQxd7wHh0qN+jsEPr36IQ7W9k9VLkuGL
         jTUxHmDAsRg3O/o0+Kh/G64ksdzd41LO1i36ebm5axyBeUVuXRBWZslZim6oPKtHTaGv
         DGK6oj3ivYFG9PJjKi1UroHx4Q1v5i0gfuT5TlF/GSG5QHuHWz1LBB6yUeSAC/zQ6Kmx
         WEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838403; x=1741443203;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIMmXa+05o7cFUzmMY0oE5JLkS5yaur+8NGSr9bhuis=;
        b=ZxoRz0NvojdRbLaP1tevpa3tKjzQ9tbeN45UCeXxcwf/re0pIrDvlOkTvMYI2nl/LG
         V1Y67u5VA3gbrCIGEQxfnDCmnHy/0NeCMxsqLrnzjWOaVs7YPoKwWUpjgMLi+6hl2Mro
         iTO05CDRnygbhxBPMGgEBNwdPHwXnrsIW9B7qIpw739zNj9oR1OGvqfi3cYE1Cmf5I0s
         0GW8Bx5kXm4d/ktVgW9OGXUYPFZZbb/wYaz2crQKZ2eiphgBUxcFh2LYqwAQaxvo3PMp
         WCRTQyxx69OgCBogl/t3zvFshS33v5dGQvtjCsIlM9PyDF3xZmppOTJAWiHZziGHwkcb
         QUOQ==
X-Gm-Message-State: AOJu0YzQO1sROWLSiBC17Gy40L1j6xDbbqkZXw7Anii6OhzWbi0rH7mi
	8Mvk7qMf3MvUz5gC3toVTGB4N4o9Wsd7IAJ/Q9ii0mxTXomLGeUJGxDTTZfBrUI=
X-Gm-Gg: ASbGncvM0M1MaeSVJESe+64fFC5tL91Ws9Zczucp16F+rgm65b81r5TSkIOHoe5m5+R
	JE/BhyJEOC4yS3DYKGbk7S+OM1ThIFTvP1tybB8xtGyMwUY3NLEHpkMaaalJPDkMUzKd8Oruswe
	Fo+QLHeqCZF/PF5xQu3n6q29cmsSEDUjFXSl8fRxF6q6pgnv39fidy04GKDUF25cMtFHzSwniaT
	Z3pKumG6Ya90HSKmUpaKDFWiCJRs3M087JtB32YxtoRYa4L617rCU2chhb8kg5zsmfpK5UhJuOO
	UAWQGq+dE76yJYWNUfxLkaI79csElbUk7KNBgGzuU17DnAmr6jBOIKhztczm
X-Google-Smtp-Source: AGHT+IHamdT8SxBWV4TfuLdPou3W8IVb0ZsVqTsHbzvccKkfVKbSEv939NC7kdF+ka7ZD+Wv5iaqLA==
X-Received: by 2002:a17:906:d542:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-abf27360ac8mr179019166b.4.1740838402656;
        Sat, 01 Mar 2025 06:13:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223115601.723886-2-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223115601.723886-2-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: clock: add Exynos2200 SoC
Message-Id: <174083840012.17657.16502862587559253626.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_061325_019757_5C372725 
X-CRM114-Status: UNSURE (   8.21  )
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


On Sun, 23 Feb 2025 13:55:58 +0200, Ivaylo Ivanov wrote:
> Provide dt-schema documentation for Exynos2200 SoC clock controller.
> Add device tree clock binding definitions for the following CMU blocks:
> - CMU_ALIVE
> - CMU_CMGP
> - CMU_HSI0
> - CMU_PERIC0/1/2
> - CMU_PERIS
> - CMU_TOP
> - CMU_UFS
> - CMU_VTS
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: add Exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/6662c09c0ddf10ef97b430533bb9e2f0a8fbe471

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


