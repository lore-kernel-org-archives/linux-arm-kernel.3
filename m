Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA7ACC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 02:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXXcWB8W/TzI98uT3k5P5pneThN/kTNcoObGZm/mG3c=; b=t6yC9TTBvc+8yRjmQ/afqJxVu1
	ovQ6Ph66+HoncSJyon+AB+akXJXpQOHmjQwCadbeF1m1af03S6/42aLUo8G0lAV51TKs1rIUOPwoN
	cry9ElEPSgT+m4SsH8Q4HimojqUjpJjGcFo1509gd1IZaFsIYROUMHCY1/p26LGDYXhgfw3y29IvP
	B4G/Wv3Kg5m7mWxlNbbyJYIbu3rue8lplOZOjIu/SF696c08rynOj/9h6NC8iQKPbsJbM8kAb5DAf
	vF5kJ6cqGjGKBI9m0cAxmqj61GZEl7nXd3yAwA6z/Vsx19VferLSb1A4t/Q6OHm2SIafiODWlhLem
	Oh6DR0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXsH-00000001lED-2Z5H;
	Fri, 16 Oct 2026 02:40:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHXsE-00000001lDn-3eWU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 02:40:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e5378b281aso34111825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118446; x=1792723246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXXcWB8W/TzI98uT3k5P5pneThN/kTNcoObGZm/mG3c=;
        b=PakOlzyzN4hOxeod4NLY+dsqvXqDCIU9nJP0s/68hQwwoIdwXNJ1w48WsU19pSaApG
         V8fNd2kclfh3LG3KWNCG1c+AqIoKKJ7HzWWKQH3mfVoet51yNHrgVEblf0PjS/sfvbKw
         db/K3s6fLkSqwiUv/aoAtxKgL8nWa/vZmico0ujHDsV435eu6dAi2BkkEeU1PMbJthyZ
         FGbYJ9Sj0NsVEjDjFln2iknXT7sijnTHKU/8PSid23GF575QPyImEQxkuLYo8SutL/bJ
         cI10pxou4LWw2i4iHsekcvrr2TGewnvY6T2PpnbD2wbnGo7uOl02c0YSA/gN8PFicojY
         SXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118446; x=1792723246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXXcWB8W/TzI98uT3k5P5pneThN/kTNcoObGZm/mG3c=;
        b=hfyX16za9nfA3IxER935Kt2XWuXqPxCtgviF4VeOJmvFaWX9qs0vY1FsPtbV6CY1C8
         c6JXxKArprXfIqT1aHDbpe5Iak+t2+52B2t6stBTp0dmJsRibeASux/n+nJPQIWE9LxY
         7rvPKkNPi/QplKSSHBl1FTit5ugDFUqz/j87dNcJcdZtvzYPl3pTDsMCCHuSnQ6moRWe
         mNsHafnNow07sjiijcymJ5Nqw05FxCY1nRmRGpKFmcDzWZYi3ImAyMnU0pOfX2xjN9g2
         MQO+25WsOg5ALo7z5DYqEGbsQn6jYgtal4ISA1goCNp+qcQDLVAVxEtPRSo1AwzGN4vZ
         3kNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYdnHPjUdz+fUhCFTCXGvsVrPZXu/ScIq7QvJuYgruoRl8aYfUFi9hHLvqnxxVKZf24AEzam3hADgzhigz1bos@lists.infradead.org
X-Gm-Message-State: AFq9FYJG/1aeVfruIZbPFvHuD6LJEncYp8g4wra8vbu2buus9Wk3l+Tt
	C3tQbH1B7wZ2nRB9+mGM+OKsLLW8tYnEmQ+MSgQTEuhRcqtgEMnZL2OF
X-Gm-Gg: AYBFou3Bxlh3278rB0LvFN5xHuyshaXFNmsYM5pU6ZsKJTtPGa5dgq2YkA7Rnzz0NQQ
	/xeCoR5JyvDzk0tfnSkKAzm8nQjNJldXfsNTwotqNCAKMqNIoXk4EG3SVz44vLRLbi2MQAIHV3X
	WIJJ82tkIFxvXsRHV7eYr40Y5d1Kmo2ywiZddSwSUw7ChOQ/SgX4tIYu6cWGsGi3peiJ8b0UCEL
	m0Z5pq+pDeOFJsqZ0veTME6rgLKzUxHH6PmiGvW+vaNs4nDAE5cJpLB0vJy9SJi/6yRcu2QlqIS
	sJE6AHddp4fuKYws+CDG65yMbHXw0ta9h6ioPO0spMaMp7u2JbRzE4Y22RhXOTneEFkRtNocWVK
	qdkdPzDZvSy5GH8FDZZYPPkqkfMpEfgMCWS7EgX//6Yp8F//10IMLvetJb/8M8P1L9PjfHiNPKv
	rkWTj6AaGhajTK7gZqGEDyhNXY3z/yygITOmkUaLeMfF2TBlFhQFIMh5Lanx1RYClhxdeTMx8Tx
	RIIDkHl36d0Dwqaadqfs9h0p2Ye8sPkGDwFJTaZEL/RSw==
X-Received: by 2002:a17:902:fd8c:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2e948deee77mr57925175ad.7.1792118445794;
        Thu, 15 Oct 2026 19:40:45 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804d2dsm3246715ad.17.2026.10.15.19.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 19:40:43 -0700 (PDT)
Message-ID: <17bf5ca0-c071-4ba8-b168-3ffbdae629ad@gmail.com>
Date: Fri, 16 Oct 2026 10:40:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] i2c: ma35d1: Add support for MA35D1 I2C
 controller
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20261016010448.324856-1-zychennvt@gmail.com>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20261016010448.324856-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_194046_924858_3926BD4D 
X-CRM114-Status: GOOD (  27.69  )
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

Hi all,

Sorry, the cover letter subject contains a typo: it should be [PATCH v12 0/3], not [PATCH v11 0/3].

The cover letter content and all three patches are from v12.

Sorry for the confusion.

Best regards,
Zi-Yu

Zi-Yu Chen 於 2026/10/16 上午 09:04 寫道:
> This series adds support for the I2C controller found in the Nuvoton
> MA35D1 SoC. The driver supports controller and optional target mode
> and runtime power management.
> 
> The implementation has been tested on the Nuvoton MA35D1 SOM board.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> ---
> Changes in v12:
> 	- Synchronize IRQs while initializing transfer state and issuing START.
> 	- Clear wake-up control if enabling IRQ wake fails.
> 	v11: https://lore.kernel.org/all/20261001075101.489660-1-zychennvt@gmail.com/
> 
> Changes in v11:
> 	According to Andi's comments:
> 	- Prefix the remaining timeout macros with `MA35_`.
> 	- Handle errors returned by `i2c_slave_event()` by sending NACK when the
> 		target driver rejects a request.
> 	- Use `dev_err_probe()` consistently in probe error paths.
> 	v10: https://lore.kernel.org/r/20260921083753.1109826-1-zychennvt@gmail.com/
> 
> Changes in v10:
> 	- Handle enable_irq_wake() return value in suspend.
> 	- Correct clock divider mask and maximum limit to 10-bit.
> 	v9: https://lore.kernel.org/r/20260807060400.2047517-1-zychennvt@gmail.com/
> 
> Changes in v9:
> 	- Centralize SI handling in the interrupt handler.
> 	- Fix target mode comments.
> 	- Initialize the target transmit byte.
> 	- Add reset_control_deassert() during probe.
> 	v8: https://lore.kernel.org/r/20260804084806.1846570-1-zychennvt@gmail.com/
> 
> Changes in v8:
> 	- Remove rpm_put avoid duplicate processing.
> 	- Add synchronize_irq wait for interrupt to finish before i2c->target = NULL.
> 	- Add ma35d1_i2c_restore_idle() to handle bus errors or spurious interrupts.
> 	- Change return types of TRX helper functions to irqreturn_t, returning
> 		IRQ_NONE for unhandled status codes.
> 	v7: https://lore.kernel.org/r/20260727081859.1737223-1-zychennvt@gmail.com/
> 
> Changes in v7:
> 	- Disable IRQ before clearing i2c->msg.
> 	- Support	CONFIG_PM=n, and simplify runtime PM setup accordingly.
> 	- Remove redundant register access in runtime suspend/resume callbacks.
> 	- Defer clearing i2c->target until after pm_runtime_put_sync() in ma35d1_unreg_target().
> 	- Enable interrupts alongside I2C enable in ma35d1_i2c_reset().
>   v6: https://lore.kernel.org/r/20260720030616.1067660-1-zychennvt@gmail.com/
> 
> Changes in v6:
>   - Patch 2 (driver):
> 		- Removed dynamic IRQ toggling helpers for simpler interrupt management.
> 		Based on Sashiko AI Feedback:
> 		- Added zero-length read quirk.
> 		- Set i2c->msg to NULL on timeout to avoid use-after-free.
> 		- Cleared hardware registers on target unregistration to release the bus.
> 		- Protected suspend-path register writes with a spinlock.
> 		- Validated clock-frequency to prevent division-by-zero.
> 		- Removed incorrect I2C_M_IGNORE_NAK handling.
> 		- Corrected a comment typo in the receive data path.		
>   - Patch 3 (dts):
>     - use a generic functional name audio-codec@1a
>   v5: https://lore.kernel.org/r/20260630012106.3616821-1-zychennvt@gmail.com/
> 
> Changes in v5:
>   - Patch 2 (driver):
>     - Add spinlock protection for MA35_CTL0 register access.
>     - Add NULL pointer check for i2c->msg in the ISR.
>     - Use devres-managed cleanup (devm_add_action_or_reset) for runtime PM.
>     - Use pm_runtime_force_suspend/resume() for Controller mode 
>       system sleep.
>     - Control I2CEN bit enabling/disabling via runtime PM.
>     - Refactor arbitration lost handling in state machines.
>     - Remove unsupported I2C_FUNC_PROTOCOL_MANGLING flag.
>     - Clean up readl_poll_timeout() parameters, retry loop, and
>       unused macros.
>   v4: https://lore.kernel.org/r/20260610030208.2020275-1-zychennvt@gmail.com/
> 
> Changes in v4:
>   - Patch 1 (dt-bindings):
>     - Update example interrupt number.
>   - Patch 2 (driver):
>     - Remove redundant spinlocks and fix 'irq' type to signed.
>     - Fix target address recovery in ma35d1_i2c_reset().
>     - Refactor IRQ handler for multi-msg reads and NACK/IGNORE_NAK.
>     - Fix timeout UAF via explicit IRQ disabling during recovery.
>     - Drop IRQF_SHARED and fix PM paths in probe/unregistration.
>     - Limit suspend/resume wakeup logic to target mode only.
>   - Patch 3 (dts):
>     - Add missing i2c0 node to dtsi.
>     - Switch SoM configuration from i2c1 to i2c2 with updated pinctrl.
>     - Add nau8822 audio codec node under i2c2 on the SoM board.
>     - Drop redundant i2c0 alias and clean up dtsi property ordering.
>   v3: https://lore.kernel.org/r/20260512073953.564323-1-zychennvt@gmail.com/
> 
> Changes in v3:
>   - Fix minor DTS formatting issues (whitespace, missing newline)  
>   v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com
> 
> Changes in v2:
>   - Overall:
>     - Rebase on linux-i2c/i2c-next
>     - Switched terminology from "master/slave" to "controller/target".  
>   - Patch 1 (dt-bindings):
>     - Simplified description and fixed 'reg' size in example.
>   - Patch 2 (driver):
>     - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
>     - Optimized power management by moving clock control to runtime PM.
>     - Simplified code by removing redundant .remove(), .owner, and inlines.
>     - Added dev_err_probe() and default bus frequency handling.
>   - Patch 3 (dts):
>     - Moved i2c aliases to board dts and reordered nodes alphabetically.
>   v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com
> 
> Zi-Yu Chen (3):
>   dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
>   i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
>   arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
> 
>  .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  20 +
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  72 ++
>  drivers/i2c/busses/Kconfig                    |  13 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-ma35d1.c               | 800 ++++++++++++++++++
>  6 files changed, 969 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
>  create mode 100644 drivers/i2c/busses/i2c-ma35d1.c
> 


