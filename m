Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CEAC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHUwvTfnjSEmpcztlWS+Zdhw3cEDVg/IjXMugjFFPWs=; b=eFABmGeqycDpMjweNYgCr3nl4Z
	7bppVp/Lz1Z2oRFQ/9AacqA2Yi7Wh14Nk5/ijvsdie8M5ne6X8kB2kz4H1DmmDYCZPQYnCnvIgXaX
	Fk0umLhN/+lCeUYZqYEddO/gbc+FXGFQze/C4zWq66zJ9HqRHZ0GPlFCRL+Tu6pOFYqzbstUby8qv
	SHqwrSqDUhVMgjxsNH1NNYc0D7p4/vAJyz7+JiHE21x6jIzRZo7HD93ZUdD0ddrN/vDf04W+6R+Mq
	OEXL0W6Yo0WAOUN6t/SQ21hcGUxCyjmIvO4ZHzFaaNVAl7D32dsPS0IQJF8wmQDJNecS5S5DrbQp8
	J8KsddVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjVP-00000002D52-3aWF;
	Mon, 07 Jul 2025 10:55:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYixM-000000027rQ-0uju
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 10:20:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451d7b50815so23266175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751883614; x=1752488414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHUwvTfnjSEmpcztlWS+Zdhw3cEDVg/IjXMugjFFPWs=;
        b=FpyxlckrNpb527mHTJZd5+RZpx2dsllfIrnUKCuM0J2F9/s/V1Uqn0KcTmNuiWGHx7
         CJGXbMEwGFaVVIj3XpselxQrEXHLbZcmUO+QW6KisJnW/RCtvh3SfWfnugY6TzqsB2RF
         YeVuJNgsehvCkP1js9tl+SFrC6PeWp+gZsSJXJIw0kG5AWCIcwmmr7KX2ZcQsASYI2Br
         X3nWpawz7sw7gqvuPgVfMYnEpuQopSxrvvZC5Ao4m/I8uAVuLhGUnzl6Cn+MK0tsRYwt
         IvrpuGGCpPQc3paJN+KqzNz1hfE48R6UmzI40hzuVbKsbRX0M5fN1wVtUywt6bpteHAa
         J6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883614; x=1752488414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHUwvTfnjSEmpcztlWS+Zdhw3cEDVg/IjXMugjFFPWs=;
        b=bIb/Tw5PdbDeLLx4YWBmOA09GLuAkPZY3oRgYUHyIDrk9tl4H9gmCjqoEqyh9lzrbO
         BqMXIK6E9IwY4ks88WAUr72Cc4Zmf7cx8efk5pHDs1olS+wPKwO2iO24kT3K/37GUv6c
         wx5a8bNFUN0PMmfzB42SWlbP/QQGPOubYAOfqeqvEnSxVbaahHPrsxgdUldgWvjesM/1
         rkkaBHr8fyHh83OcbZ3fqnwTSHPqDcJyVqSU/7lhVSPvIrE1zHXTIuzqYGVNdBohqCno
         SVIdK+vjnNbbRqVX8099+sMIpjPZeWqrfbrRQY+CCm/z9/NpNzFF7KNqGivOSgtCUbm/
         WDvA==
X-Forwarded-Encrypted: i=1; AJvYcCWUAih0MP7rylSx0vNYSA2GCdmqINLefVMFnoTTX8rCZYDBalB8xKatL1491JV3+3fzOmHhiqZMsvPO57N1AKTe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1QetXDYSWX9oghWmXFkChbxEz9vKUOdv4Sm3pD0Ar34ckfEQg
	P7w4Jfh3P4xmaNZIio6kTGC0bwyXu4uU7qxmFMaqdlC2MqY+Hxpf+4ql
X-Gm-Gg: ASbGncvJq0ttOahoNn/yap7PajlkcPFRUTOUz3wcFuLlYPFI1IjE36VnjCD+T9xXGFy
	XLomR+p8TI1oPyUe+jAkMcSDrkvp+XO2/sp3TNPxVZkDCe//OWbUvqVZKno6ernEQCT6Kd78VsZ
	Q6kBhFMUCQqrzbKWWVdol+tsoWhLT8cN7pGBsF8t4ukuBukxzjS8STf376n+QxmhepDuZ+LQUtr
	JFAhkV5wzSbAxmEODtFMZFoZWHWSNX8O/mK0GhDOY5GKd+VVJcNQQQXxkLI3zBvN7kZTwxxs8+s
	SBz0ffZURBxcYPMVSPydQbiwfmH4GGS7PUjqco6FVOsvjh+dQfPFzGTpmPNTno3/WLodKrd6xND
	hamI2qPrYYz9gEAJGoLxaKANSgGPqOfvYm+W2kjt/h8x4Vc3YT84eqQ==
X-Google-Smtp-Source: AGHT+IEBzgDT7wIm3e1zpg37ZK8wP8jTto3HqLMBUK5O7zlQTGqg1rZHhi5m/jFgqFJzbmmfcIWWAA==
X-Received: by 2002:a05:600c:8b72:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-454b311637amr99037235e9.12.1751883614008;
        Mon, 07 Jul 2025 03:20:14 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030c2e8sm9583420f8f.3.2025.07.07.03.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:20:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
Date: Mon,  7 Jul 2025 12:20:04 +0200
Message-ID: <175188357609.1321171.837662238630621185.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250506133118.1011777-2-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com> <20250506133118.1011777-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_032016_259865_422CCDC8 
X-CRM114-Status: GOOD (  10.31  )
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

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 May 2025 15:31:08 +0200, Thierry Reding wrote:
> The PMC found on Tegra264 is similar to the version in earlier chips but
> some of the register offsets and bitfields differ, so add a specific
> compatible string for this new generation.
> 
> 

Applied, thanks!

[01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
        commit: 5b820eb176846dad95b0a45dcfe788931f5e7527

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

