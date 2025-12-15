Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E93ED59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiAf1pob1P9A2hs+uuZimsbQclhxUB5vv2ZHT7m9wRk=; b=mfgTr2TwA1abBGSufSkzR6w0Z1
	E+WU3NwHtIgon7+Ce6NvNtfp/q+g382nKhkvqBfUXIshpJwNVqkRoGxzdzR8n249hTFINMGTkmXci
	FgiF6AXfBXVmIEPYCib6y5jULoPfJjozl5Bd/MR+nQcuULIUbnicHUx7IFpSsaYFE2fmPmY/cQ8WL
	1ddD6HERehN9gHqydjVZ/Jl9GSDnyy3/74DvYuufwoM2+SuAWCrol5QQsqK/wtqyStq2XhtT0X9fY
	qKOWu+p2oF58MTavVeITmFJh/mIACVrANDRfWNUV8dd17I21Dhd2OZA+BtZGHV6GtvSUEX9hgpnAF
	+Jd+q+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6AZ-00000003TmL-246A;
	Mon, 15 Dec 2025 10:51:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6AW-00000003TlK-2Ok8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 10:51:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so1616579f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765795866; x=1766400666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiAf1pob1P9A2hs+uuZimsbQclhxUB5vv2ZHT7m9wRk=;
        b=iuGFhm4HldWlFDqEi+YqvNY1RNCfBTdK7GaBLTtU3s2E5AsW7S72riWeMDeV4MSS44
         Ow78g764iE2pIvJTrWDtzCPoQn+MCqL+k5o55IgP8lMT//lTxqdK+fp26JVfqB+rpiPH
         lZQ8AtuCx0kS96fAiWzRW0wqIOugoc9GGHPQo+7zc2jLYNxulusQBlp/DPpLFx2W9d4U
         TGPUSZiJqobsMxHAwTa9b91jZ4LPcc7vRu7TW9/SSqSE+gwjriWzqNlg1GvtXUr1gdQ9
         JZI3TyqtVjdW7rSoQrSKDCfxixudDllP4wRAKHqQ45erl9A4iu4g+BMyNgiHzOnyDtNC
         xjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795866; x=1766400666;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiAf1pob1P9A2hs+uuZimsbQclhxUB5vv2ZHT7m9wRk=;
        b=NObHjT2f5ZbSDvSscCG1iJaX0pf1vtRYY7xK1kte6HRRg69XJlEIdh/dhN3fcUNOuf
         dbOMr/aiy4/FAUKvYviDcG+PffT37TgxqIp7L/hNue7alKXj55rHHRa7jVOzHWRt7Eb5
         nS+6bzUUbZ2bUU76LqM+8orGsrAOLBwIcHYy2SFnR2qCxacAp/1WT3JqyIfa6fuS0CHg
         0k8HtH+1FoiP58rge+iUBe9FzKAgTz58ILrY3pXB9GGqZmSP7qy5luqgHoaC4YYRuaQ1
         164SQWfXe8ACEamqms17vdrWNmt+RPTVnxRe11fmEQ/eHaz0htqpFhiNa23pHcyf8YbC
         P1zw==
X-Forwarded-Encrypted: i=1; AJvYcCUPycl3CKPEgvyjXIe9O5Wj9tnlSUZXr0X12/mQ56YeDz7cEhmHDqtnSCIsN4eSVP+3VdR0GgpLcU4bassORDGd@lists.infradead.org
X-Gm-Message-State: AOJu0YwJQMYQrL3qvSA54wmKCNqDXkNWqvRYtchbgQlFSZmd5w7r8EwW
	83E1akhcFib4zPjAPLMswOOWttWZzBw/GsM9w8ThFT4xWslpmDLSYG8k6B9JBpWHFdo=
X-Gm-Gg: AY/fxX5X4ndODBuyDDUA1txBcu0Y1ht3wyHb3GJ3b02zcDfw+YlXWCZBxwKVxOcD3TT
	5HSjIaD5kuLbul7F7wrbw/ToZJMmIquN1W7INWHruGehmt08cDb7O+nMk8fYGvUs6xt7CmADtj7
	n856UpBJLcdreqIQGEeRQhkwHod+mKxmBPaNFdL57V2A0ZzLkyf6zDA2OstLQm65FsKTbdkEl7u
	NxZiZv/9/Ag+BOSq1n+tfumFjfTprj1ecy8PzVYJg8Zb+BI37BBWyUUJsU+FSAPz7wwmEUejfkD
	M4i7loNEyMM9lNBxPpQ/pBzVFi9p1xwMRKbiKA0eGLvI+yU4RuqtNQ3KS3i3DGQW7y2jJ20vGkd
	0MqNQMwOKxn9dPP58TIJP8yiRI0+I7MKyi1tF+5BpP+bsmVJs1OzqD2EbqTYwqDf3c/IjaatQSC
	ZYvl0pUO/6nECX4SeTT/FYeyDb
X-Google-Smtp-Source: AGHT+IEUCXZDYdW1Yaezuo8T8dArAq/O2/s2YiIYeQnjgQdgpxFuf1BEC+kk0V2dJ19iC+eLEyxuDQ==
X-Received: by 2002:a05:6000:26cf:b0:425:82b4:a099 with SMTP id ffacd0b85a97d-42fab1f9f67mr16105347f8f.0.1765795866090;
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3f77:1837:bfee:f255])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm7695439f8f.21.2025.12.15.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:51:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20251212022619.3072132-1-jian.hu@amlogic.com>
References: <20251212022619.3072132-1-jian.hu@amlogic.com>
Subject: Re: [PATCH v7 0/5] add support for T7 family clock controller
Message-Id: <176579586493.1510096.5256519771615298068.b4-ty@baylibre.com>
Date: Mon, 15 Dec 2025 11:51:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_025108_891778_2288A2A1 
X-CRM114-Status: UNSURE (   6.01  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/5] dt-bindings: clock: add Amlogic T7 PLL clock controller
      https://github.com/BayLibre/clk-meson/commit/5437753728ac
[2/5] dt-bindings: clock: add Amlogic T7 SCMI clock controller
      https://github.com/BayLibre/clk-meson/commit/f5d473e96fe0
[3/5] dt-bindings: clock: add Amlogic T7 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/b4156204e0f5
[4/5] clk: meson: t7: add support for the T7 SoC PLL clock
      https://github.com/BayLibre/clk-meson/commit/140f074c3127
[5/5] clk: meson: t7: add t7 clock peripherals controller driver
      https://github.com/BayLibre/clk-meson/commit/fab4d651b592

Best regards,
--
Jerome


