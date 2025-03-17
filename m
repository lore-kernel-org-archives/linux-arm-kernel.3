Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F6EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6W/dMc1fq8BYuaZ4P5+FGSA3GCwNFxk1dxYVKldZLQ=; b=0S5kaBxJzxtkpIlTtdKULllAJx
	1nHqowq4U/gRaHcF9m6263CtDiDHqNlWdnRackLlc4ty/tCmSunUskfQSMU5GWyMnO1Q/lfMCywn4
	s+bUF5A+P2b7zYTxNR0r6zXdzCiGMpCtjTqi1wB32SdRzC/JS4fyjGssK6xNpBpWYJjAg266LDh2X
	3dYZtKiMvGcYCf+8JLCagJExFruowN+ZkPSGhC0QZ9LdUvNKtFY6bSDowCe+UzuxaRqtwMfKTmkaF
	YBfebHEcxCHW9VvwsFtQ4dv3l7XfwyMIchM82BgX35BNEnbS8N11c091fgDM8LG22XNgDF2CODAkj
	hSU5gBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5AW-00000001czH-2vWr;
	Mon, 17 Mar 2025 07:45:52 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu58n-00000001chI-1myf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 07:44:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso10244195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742197444; x=1742802244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6W/dMc1fq8BYuaZ4P5+FGSA3GCwNFxk1dxYVKldZLQ=;
        b=N7co6gqTp2zDMa2R32AG4Vn9NbAfdO1KOOSUVEH/acdl2p8BmxBUJAz68F0pToptBz
         w59mZJmT2FCxLXMQxYH10efbqR/tBE/rucrQsKNYqIoFT3LXpMK7QRLaGcGFq5voJOa3
         FiF6xVEJu2B+ondjlgjoP3nEwVH6e38EbxctqhHw5H2Bj8pNf0IKqEWoy53AI/MSaCkJ
         RSAze/d62xGD6xzhHzGhvZ4KEG9xriNuXG3z8P/SmGAdWWumR1nsKU/FH6JuffawNcmo
         WU0NGcnSD/OvOu+XDwCZ+/lnZENVMF/0o82+NGC3fxMCgJ/yRDW4nx68atvqrhv7D2ud
         T2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197444; x=1742802244;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6W/dMc1fq8BYuaZ4P5+FGSA3GCwNFxk1dxYVKldZLQ=;
        b=veutSZNE6FV7TabXJI8ep02pMvHdaL7cK6E4Gl0TdEzq4/7Ixg9PHev/soQiVK4itB
         3FxlX8kMrCFShn90H0cc8dvUpW1XreFiD6KL8T1rZSDMoDtv0Hqd7lBVdW0S4DWtPAhm
         /GP9cwY48NpbiQcCismaXwt640zBOedxK8i/CZFDusAVLCbljZt+g8BW2bes9hVA4hMq
         jIqjm3hiSNMRWMqNPCI/DMMzHyEI0eKYRFZwBbwk+4jirVls0Gc6hbqbyx9pn5djtHiT
         /tQecJ8k1bthk4HDllrOq4+KyTf2E1rbYguCf90S9bVgPEAfdnA/upQj3vqMgAoJE7ss
         SqpA==
X-Forwarded-Encrypted: i=1; AJvYcCUv3q9F7R2tWNzPq0bEFvlPmmLI999HUGcyQukC982sLryzfCwXSzcOEk3/eIB5zfwWZVaaDnSHKWjbwY0gQ/qJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxvs8pzKcH2/YhRLkEXHFVgd6R0yKCdesvYePvMBjflEQKS6qj
	Wupu16OyNYNY+7toZfIR045Efpj8GpcSUyJrsYr9vU/GPo5XBDWAZvef+PuH2nw=
X-Gm-Gg: ASbGncvGGUgFiHlpK1pABczTrrod9g11VpZyQut0M7707IjevbyqXBpMzXxb4xb9q23
	i/PerdG0I/W59ivP1czSOXzzSeEUzZG4lked4rd3RjWX9UvQ5j3jHSpkYusF4PuGdQYcSTenZEi
	RqxaNVTwAksN5nuCYfrSFh6H2zyn8Ok7QFJcyI91joSFSC0hPGzE7B/vIDAjTArf6ZftCKa1O5N
	mM/D7S8fGV+MTIxWrxnWGRdJA7ioTT8fLBR6muL+DtSV4a+7m+tQNtOCbPArCC4dKdXfvqMcEeH
	+rnS2rCYr3cKxBpJTiuJQwVWwziGk9TwGioHbdn5Us2tH4YKHJphc1tNpa2l5NXZpQ==
X-Google-Smtp-Source: AGHT+IF8C1yneD+/k4sqE9utzyQLZCEG5Ohlgyj9HQOMGPJSnTFjDN3R9yA40oXN4+fpAPxC9TTs5Q==
X-Received: by 2002:a05:600c:214:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43d1f0a3aaemr102869895e9.6.1742197443707;
        Mon, 17 Mar 2025 00:44:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a32sm14376503f8f.33.2025.03.17.00.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 00:44:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
References: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
Subject: Re: (subset) [PATCH v5 0/4] Add GPIO interrupt support for Amlogic
 A4 and A5 SoCs
Message-Id: <174219744301.3089961.6347213266646956468.b4-ty@linaro.org>
Date: Mon, 17 Mar 2025 08:44:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_004405_476518_D1B08DB8 
X-CRM114-Status: GOOD (  11.64  )
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

Hi,

On Tue, 11 Mar 2025 11:08:26 +0800, Xianwei Zhao wrote:
> This patch adds GPIO interrupt support for Amlogic A4 and A5 SoCs
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/drivers)

[1/4] dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
      https://git.kernel.org/amlogic/c/40f4152442f72748ce883ca53ca80961e433701c
[2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
      https://git.kernel.org/amlogic/c/bbd6fcc76b39502767e213ad24a349205cf75e96

These changes has been applied on the intermediate git tree [1].

The v6.15/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


