Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF3DE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 10:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV5uB4pW3I7PFM+MdqLT3Z46mt4gLHWB+cSrr/zUkkQ=; b=XHYqZ/Z27P45oM8wB832rlwmQm
	lKjmCISGaVLEOHqblmsSLfbRFkTwbkIq5U+e1mZ9k3tWSJTCnZVTESEKYIfVfgnyB0E/AF225Oh/H
	wsMYwZfklUyWnGCBvnKfKNs7SSRTsmxeFsZbDgGDWxgtZreDqFs4mr2+Tvm9m+6IWBoERhxoggHjG
	SgStILZ6sMg9xH358Mpx4nJQXXo/h9BuwrfPaJWZhOVFyCCboXZJ7ypscWoSyJu1KOld1+sjX31oy
	voOeeSx8k4c08DPd6BG1sZNO3WXRnh0JhIkXTsIYZtSncqQLmuepB2fAcFxEa/VrMtcQvg5wmGHG8
	SU0aKbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPkl-00000006ChY-0i0f;
	Sat, 14 Dec 2024 10:52:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPid-00000006CSZ-4C6j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 10:49:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e0d47720so241808f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 02:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734173395; x=1734778195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VV5uB4pW3I7PFM+MdqLT3Z46mt4gLHWB+cSrr/zUkkQ=;
        b=HH9hzd5VDM2wK9yzG/LDZFB2vwT4rGLcXD4t30RS9vDIT5atUzwJ0iRg371iGTpU2W
         ddRAiHZJC7IgpNg7h5zh+W6gJIGR0gt5QElTb+OSxb+RdBWMvvAlBKAVPvzl2DWE/eUf
         ERPEdvaD933M4uwT7Y4y087mgMl+b0nG9bet9GZwnNhlGZCef+Iad6YjpgkI2LYRnfcC
         gkuptzSHZKnyNn7CwXHzKKRZiIRXLnpyhjKLglxvEEWlbp783US1/+C/ZK0n4pB7X7lf
         tS/c25Op2vbF8D/rxvO0jJZc6FIZiN9xd0o9FatqhuE2DtztY2zejIiDm8Ak0Ann6Fxc
         8cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734173395; x=1734778195;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VV5uB4pW3I7PFM+MdqLT3Z46mt4gLHWB+cSrr/zUkkQ=;
        b=IU3+c9N/NyOFWsFS41meRDttYtp2vCA1yr9W0y96bDV9tf6OA4JbPn8UbVrwzehWy1
         FuHOV1G0B5RYlqYTkQWMtZu+7rkaN2MEdXHJG/jujFkmhh9KbHlAEc1Wm/5vQQ+eqI+u
         kh9dvQva7MSzkI0SAIUz61kHnw46FtH1vjam7Dmgry/8Gzz4PlX/2MmFFVYmNYLK/cgV
         Gf8LSjfw51ixAA+vMA2Pnfz92LN4N0xbimvzzbBJ5Hf8edQgv6DOF8B/QAEwtcihXNqS
         /SlwFSt//c+NLt52y51qi673JUXmjekw9uAjaSnUPIJrjszevP1cNsWzGhz4+bzUBUz9
         DgvA==
X-Gm-Message-State: AOJu0YzDGWjM5LTXWEIBmMk3Zz0n8CyFbJ/3zzDTAWrDvwSRpBHduEc3
	mDiMPLYpK79m8A0gUDD4yXDcPKBzaG7zuD5HVs4YWZAVBWLiCbQRgcK44YtBZpE=
X-Gm-Gg: ASbGncsQKx6OG6YKgwJuko6oVQQHoMsHFa8nPBa0OKkF3SumzK7zGOdJDmgOuQrZYfr
	6HGQd0K5fjmkynkV0Yar9EtstijRXL5YUu78fxcJHmCwqBBCTlGCZyO1LMJTsv/flguuILVOuOt
	UeCoi8ZDZCQrB1XR7bI6GqovBsDG8NyuTYGJf4fkZ2p0GuW7PfYLdHLoqqN28qQqzk8wOQL0v2S
	0uPSdCXm0KRcdMQo81qsBqx4ojfaVyU4rxQ/zY8pWtVTcbFC3B7VK/3rtT4iOPncLpkz9Qj
X-Google-Smtp-Source: AGHT+IHyTzhFYErYVyT7VJHfprfadGDQxildtN+M2wr4sWYswaUikDqlBN7Bu8mHFXxUDCZdzq8sog==
X-Received: by 2002:a05:6000:400c:b0:385:e355:7ba with SMTP id ffacd0b85a97d-3888e0bfa95mr1693389f8f.12.1734173394680;
        Sat, 14 Dec 2024 02:49:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8049facsm2256481f8f.79.2024.12.14.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:49:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 krzk+dt@kernel.org, robh@kernel.org, Faraz Ata <faraz.ata@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com, 
 rosa.pila@samsung.com
In-Reply-To: <20241212115709.1724-1-faraz.ata@samsung.com>
References: <CGME20241212115815epcas5p29fdba4ddb93d08035f422444cb826ec3@epcas5p2.samsung.com>
 <20241212115709.1724-1-faraz.ata@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: exynosautov920: Add DMA nodes
Message-Id: <173417339330.24605.2885183556743988867.b4-ty@linaro.org>
Date: Sat, 14 Dec 2024 11:49:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_024956_039344_28BB9680 
X-CRM114-Status: UNSURE (   6.00  )
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


On Thu, 12 Dec 2024 17:27:05 +0530, Faraz Ata wrote:
> ExynosAutov920 SoC has 7 DMA controllers. Two secure DMAC
> (SPDMA0 & SPDMA1) and five non-secure DMAC (PDMA0 to PDMA4).
> Add the required dt nodes for the same.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynosautov920: Add DMA nodes
      https://git.kernel.org/krzk/linux/c/de7a4e01055b040b303d01d709262b7ce9d818ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


