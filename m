Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BCCCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvxtkN58s90JpLuJgBRzi7rdiBNppM/NXoJyMRiUo58=; b=Lx3waFlA97y/6dKFD9H2L/E6iM
	5MPHqJKRuZtE4y5lCFwq8nfl6cJizPJGVrU8ywZ9r3x2T5OtTpE/EYwIRFIzISanL/fICPdpIc8Rr
	fPg1byCCwBziPnHmZs3SnnogGj5A20ric7PFrfQspZcHo2rz+Kcppbq1B/vaE/hUGXpCfX+L/ei9l
	v1K0P/oIvMgck3DecBXQoCyxShGU0648TJTJpF+5EuBMAMZL8yxnhgndJPpiIINFcR9NGIfgqQMcs
	zxpL9ly22eKU5+WTbnQ9qB3Jw4EsrIVRgawk2+MXvvlplY3ZcBafF/Uvc3NSSK/UyKF1avZHJorJZ
	Qopkkh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGI0-0000000Cxlc-11o3;
	Wed, 10 Sep 2025 08:34:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGHx-0000000Cxk1-264H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:34:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso40399605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493287; x=1758098087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvxtkN58s90JpLuJgBRzi7rdiBNppM/NXoJyMRiUo58=;
        b=gDbnsmxJgxiyxI9SdxGir7+JcIGAYGRmhz7k4K6492tnPFVCiTKGaSfw4yBIYkigSv
         A43zlW9FKcXGak5L5QML2PWPFlcHOGHAc/YA5mJ7Myu9iEiUgGo0Kndy+202knuzoGCh
         1xb55VeIbjVhM5Lne4p8b6Eb40mgwaRA7C3GF0xUD4NzlnKSA8nhZdk+xL/9sIdlMb/5
         VZXSv+PY39kpHIguaATip+mbB0PXoVLqqcGHIR87p7YVIe6oslpZjv2i1Y/on/H5Disp
         AnWMyxgQHm6nbRzU9fpmVeZXS40z3fsUqdZW3Kn3OIcI5tFQ+uZ4Kg1yIk91pF1CtoZP
         erkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493287; x=1758098087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvxtkN58s90JpLuJgBRzi7rdiBNppM/NXoJyMRiUo58=;
        b=L9eS9zj9AcUHfoDa4GQYB0ViFFZFvcabzNahnf5EZRALEcD8I5I0XEFs0MUgLpHVQf
         XG5PoCL9PCv6VwHooG8Qbjq/UsFVwZ20aIUtj/Yv9vzF9hBVaitUrCy4Pz55CGc1Ui/p
         i1FukkjmUpRbY7kGfgFlb/k8tLjmDKqVCa1+0BFWVYLz7oaIaRb2+CIvpM2Vi6BaTs6U
         07CVppImsLmLx6xw6J9n2hUBV2k4GyLb6iSzsh5fpnl2ZNptOTu0koJ2bzrjWDwB32vU
         cGZ2Px5la4+0iyGoEX/duu2mXefOsNMjDrggKisTRDEU/nWGji69q0Rw3xTV9Ki85BkQ
         G1VA==
X-Forwarded-Encrypted: i=1; AJvYcCUohSF6ReLlqoYHGIsPfzj1M35kol/MMvYdMhBt7mbao7i+bYmQuVOpiM+NJJ/pkFLeA/7TSbEHPDE8ILPsiVkB@lists.infradead.org
X-Gm-Message-State: AOJu0YzjFQ2maoni/NXqPuxlrHLvg+wGqfF0ydYKH9gO3ZSvc84xVmxh
	baziKS0jNTDrFVPPuyCMuDBHqFcoypYxiquZA9MykFguqmBUbT8x2u+Q
X-Gm-Gg: ASbGncvdm6yTdQKYG4odTYKmhU7xoPNrLmY4NXAGgPLeV2rncgYK/Ju09MXmf4Dm3xu
	8r43biwDxEJrvXDzSGQhEeyGGL7F5Cow2VQgOQhDKMyrbNMKHC7nH/cZKU3hRx69Cgzwo0WXuhX
	ug3BSJ2TOgGROau8IHnI/Kg76RDQiGGFrIYnTw9UjPAH5NmUTI352SmirL+CmMM5K7ktb+EN2rd
	WcJTgxqlbNkNI80X137iLUsX/pDnE2slH50F94accw7dGvSElD+4dNJ5ZcKz5FGpafI+LSPLbi3
	1XaQUXA0YvkDU1vRfEt37cmBmAeP9WBzwx226QwYeysQUPhs+MK+gX6w5w5v0BjwrDL5IYFeBnn
	GhHkqhg3bnAxNSxgaD0CXPPZ1KOwEyk6IRB4v++TUett3J19/z8zk1LJmDh9Zj14RSPVBtihQzK
	0e6n3KmJDakH0+PEj+FSBSWlIW0wx1AVrz2IZ737sdrAMQ/Mec5FvYPRXs/4fM8pc=
X-Google-Smtp-Source: AGHT+IEQEEKz1G0RJ7Rv5RJrQMqTp7wb9aYAHyNKeRkV5T6QpUQaKrLWSe8p8sLtVzT2+/GsKFY/hg==
X-Received: by 2002:a05:600c:870f:b0:45b:8453:d7e with SMTP id 5b1f17b1804b1-45de072e865mr136738135e9.6.1757493287542;
        Wed, 10 Sep 2025 01:34:47 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef? (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net. [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81e1e00sm19751505e9.10.2025.09.10.01.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:34:47 -0700 (PDT)
Message-ID: <e40e858f-091f-4059-a379-7aa25835c3ce@gmail.com>
Date: Wed, 10 Sep 2025 10:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/20] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
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
 <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
 <20250910-encouraging-masterful-dodo-3d1f60@kuoka>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910-encouraging-masterful-dodo-3d1f60@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013449_553872_2D4EC0D8 
X-CRM114-Status: GOOD (  11.10  )
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

On 10/09/2025 09:57, Krzysztof Kozlowski wrote:
> On Tue, Sep 09, 2025 at 12:12:19PM +0200, Clément Le Goffic wrote:
>> From: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
>> It allows to monitor DDR events that come from the DDR Controller
>> such as read or write events.
> 
> Also:
> 
> A nit, subject: drop second/last, redundant "dt-bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Oops, it will be fixed in next version.

Best regards,
Clément

