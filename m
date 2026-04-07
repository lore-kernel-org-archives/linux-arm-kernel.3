Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D4E9D814
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAMR1Z9vtKESST/3iamBPofUUiGDt2llp0rFYa+EoSw=; b=1Et554wTJrfkq8I4hoKRDu2+aC
	UlmxD88M8a4rsUoinvZL+JrBRxlF2fXHFX4oXpAGTvRIvgYLnHwyA/Q1jdQCpeFkiMzWzb0vKbrzw
	hpv+04IM//NiQmvl9ButTzdqJHKQ+Ev9rZN/BQUhWwCcupsiH1pfjv3alVCnU5aTnOaeJkM6yTx3g
	crgfSFDneI3OSf80zZDTpkW7Cma+A0wJmFvKImDJgyQwDvqSffhWpYlGaBKl8CBHFM/ZVp6se7S0c
	8fbuuNxME3IytxbtCEn6HkgJCNWBX4O4Kv6mXvHaZKBVvbXy7V0pnp2lUpo10K9W0MO/FA7wqYs5S
	O1dGxq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0CK-000000061Hb-1VxR;
	Tue, 07 Apr 2026 06:46:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0CI-000000061HF-1HH2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 06:46:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ab077e3f32so19382875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 23:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775544361; x=1776149161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAMR1Z9vtKESST/3iamBPofUUiGDt2llp0rFYa+EoSw=;
        b=gW34IvzDOczRhnStwYaOgKRogMExTlf3LLJ5PIA/LHc4zQaycq/OAFil2uMukP3kMI
         teX4z0M9V7kaate1fBYmjdOpaB8E7bKquJc4v9vQrhO250NZmJr7GkIie+stXe43xS4N
         LLpoLv8Xk31W8cWTQxQOkG5YzU7ZsP55gCN8VYBdpRSkh8eKKguOQaZPiOjZNTQAmpdu
         s5E1YQKurK3f6oxmrUjTl5rttEUt9HS2SBQk2vdfhYPGwEWtcmkZp18edJ7Vs06sfrdI
         U2E7bOSI/etXFSeTK+VIN6rR9J6aG3Kj8r0uqAFYZI/a2NLlQfbC38mQ1eiHAxDFwu0K
         HaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544361; x=1776149161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAMR1Z9vtKESST/3iamBPofUUiGDt2llp0rFYa+EoSw=;
        b=mBWfDpTenjUl5ekEmAwYk+j0YhWllAfxCttEFYXVynFpWw60EtSuZtqIl3rYyiImR1
         GGvbw6IY8JRC4lsegzURRIRgkR96ZkhKQkE8WVKyeiIM7OK9r826ht4jWTRwpK/zCISj
         yYGw4QGSZlP7WtHB7NFLrzU6OuRxhxxTBv5V10Hj4bkETtYlAViBim7N6T5nK6eAcJja
         ToxCbp+dLdB/1PGno0ae9kN23yyXrXtZl7rNSMgJ/YLW1vHgyPYU/01CPeu4VylWuCUd
         z96wPle5zcaCDeVhSdbHKxWhqImdPCC21IGcyWp8cY9Mchoc1dzlVS06mCurGj/ttlrB
         5ZXg==
X-Forwarded-Encrypted: i=1; AJvYcCV4ldnnclQ+ta+uH7mjCLAdZonQ+C2FMvUyZQ5QKcv0E3FYsbKBrgEPexTMZuZ6UT0gtZF1PvpbcuMDqkvoB0jB@lists.infradead.org
X-Gm-Message-State: AOJu0YwyBmcaMUyUhiKgg3qtnHputK/l3leS0HgLAyUIT69fNvpX0mVv
	BCWgoffgPWVyN3V5TPBe132BH2JnS3XWbCjh4DvgMQt43wk3SkQc66UM
X-Gm-Gg: AeBDieuFro93JsGEeZy+mSnfQQFXxwoHEwW/xHrNN0Nw4dbZh5YM5S+F6UedyEe2S7m
	1+274hGSCRsK4nv6DKHLmzPYjmWZLEUJsaG1cFT23bLZvf2b/74TVgni6VPUCSV+jiVcQ6QKT39
	W6WGbZg5vYGXUePRl18R+JIBQB9JnTDGVdTrxqwz1LXRVnSI5mtaznfWZrueYkZK8R6e+/aDmiG
	+5vln9ugemxpsZPViRQj52Nfe8XSXhLv3YOsrvDwwCl4yDAKVu24txJ8hCotNE6OGq5UY3ZKGXs
	TDevrZhk4SRP74KMgPsBeHdugdNdBLx52siiIqm3FTM3pJ785+myUDgYbWVA9Wz9iYnvUyPFzeA
	t0qhy8EBej8LV8+gQzEBnlOHVWCmGQkn4ypYsO3HDLCAqnfjrz4Ntf59aaKfrkORwVrd4hE1ggM
	dAG5W1yhw5GS2phbvQTjiQG2aFOhaUZNZmHVcK4ykRyyW/YUf8WnuFPYOgqGayNUykfy/5POg=
X-Received: by 2002:a17:902:c943:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b2816e6c38mr156290835ad.22.1775544361064;
        Mon, 06 Apr 2026 23:46:01 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a475fsm154607025ad.61.2026.04.06.23.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:46:00 -0700 (PDT)
Message-ID: <289da0f4-7a08-4876-8157-5226a0598f1a@gmail.com>
Date: Tue, 7 Apr 2026 14:45:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
To: andi.shyti@kernel.org, ychuang3@nuvoton.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316063726.41048-1-zychennvt@gmail.com>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260316063726.41048-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_234602_350024_EE5CF53A 
X-CRM114-Status: GOOD (  18.06  )
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

Hi Andi and Krzysztof,

I'm following up on this series. As detailed in the change log, v2 addresses the feedback from v1 regarding the modernization of legacy code.

I am preparing v3 to address minor formatting issues in Patch 3 (DTS). Before sending it out, I would highly appreciate any technical feedback on the driver logic in Patch 2 to ensure it aligns with your expectations.

Best regards,
Zi-Yu

Zi-Yu Chen 於 2026/3/16 下午 02:37 寫道:
> This series adds support for the I2C controller found in the Nuvoton
> MA35D1 SoC. The driver supports controller and optional target mode
> and runtime power management.
> 
> The implementation has been tested on the Nuvoton MA35D1 SOM board.
> 
> Changes in v2:
>   - Overall:
>     - Rebase on linux-i2c/i2c-next
>     - Switched terminology from "master/slave" to "controller/target".
>       
>   - Patch 1 (dt-bindings):
>     - Simplified description and fixed 'reg' size in example.
> 
>   - Patch 2 (driver):
>     - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
>     - Optimized power management by moving clock control to runtime PM.
>     - Simplified code by removing redundant .remove(), .owner, and inlines.
>     - Added dev_err_probe() and default bus frequency handling.
>     
>   - Patch 3 (dts):
>     - Moved i2c aliases to board dts and reordered nodes alphabetically.
> 
>   -Link to v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com
> 
> Zi-Yu Chen (3):
>   dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
>   i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
>   arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
> 
>  .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  18 +-
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  60 ++
>  drivers/i2c/busses/Kconfig                    |  13 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-ma35d1.c               | 792 ++++++++++++++++++
>  6 files changed, 946 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
>  create mode 100644 drivers/i2c/busses/i2c-ma35d1.c
> 

