Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD46C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0w1ABYz+mEqIesnfGQKbGmtokLlYJpMd3Zdm6+vaV8=; b=GVDqSVHbgrW8dYpoHNSff1f2xg
	doXxlMqvptGciv/60XyGAxDwjKfMFJwW9rapRSp0pEvKlrn0GqG4zbxCeXgMUo6xp2VVQJgKkoMwx
	RPpVqyFvzxCeoNjahhkx3AlsdVMrKLsAl3BSNZDNhQkXUq8GaDR1q+Ey4oSW4ui2zFk+tfxJ2byhE
	xRd4cdEBeTPG/kSaQBi5Wiuu0er249byHpA1+HV5hciXBpIzNv74QdZOUg+wn284MI7FzkXl8+XN+
	CrzrxxsVL351EtLm6ZlhwfS4QEkTCip5J8GcFizlQzOcVS6q8851pRQzPRiv/2uuWsPftNMJyg4Sj
	dP2lCzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiva-00000003Phr-1ioq;
	Mon, 24 Mar 2025 14:37:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twitq-00000003PSP-3gxP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 14:35:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912387cf48so218391f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742826933; x=1743431733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p0w1ABYz+mEqIesnfGQKbGmtokLlYJpMd3Zdm6+vaV8=;
        b=REC412ArJ0dbDpjLNt0lHMTV99Op0lBPvyx8Q2OPtg28f/oIWyw2INFRQK+kh0XxHj
         0kG34tSV0nYcEI/ck1MPkQwWZ8B66mbdtYZsmaEbRC/5ZUSRGRK4uUSduhENFcdJVc5q
         cxx2AHFHNOrstIpTvpKbEr9ebNSeDIGPkEXIQIVBGW6M6GMUlMrsxMIZj+UyedGcMOOU
         b8BEDqcUcG4SOleTtQ9B47FLHLzGeBAqoQa+oTz+Z2OI09wqCs2o0rSc7DfZsAk3GRe6
         K2B3J/y7/BmlWHoCBVyNgf0Bme4s5oG9d4bp9JbgHDQi3ybVxxASHW/xm0Ff06UiQDtE
         OQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742826933; x=1743431733;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0w1ABYz+mEqIesnfGQKbGmtokLlYJpMd3Zdm6+vaV8=;
        b=vuvSBMYTmOkGQCrEr54ep4frcHcNQ9W3U5qSZkPF0NX6Zt7kdIwpiNUEkOyHsclWPR
         YNEH0TRmopb7RsHesos2Ar63EMRfhp/5fwjLvhn7JCWoJndgigSQWJ3mVmxaTSJpOsm+
         k2CC+xkVw8GQVcDqf45T+7VfAK4OP7NAopST5lfoQ76Iidl145aIB1WzWpSNl7q8zSPK
         UjuqFdmKc0jC3Oh6quuF+mFcA89rxULVP125sD3YFFKt8rKb7PrhwwA+hoLGmJ38UBoL
         z/0KnxbxzlC86Gg51bNGgq6+apR+lrUwi+ZWHSWooSjxmFW6lx5ikyVWRNatKyM2Maob
         qw8g==
X-Forwarded-Encrypted: i=1; AJvYcCW+xC4i/Li457+8AwVcuCSnEisZI8JgpFuZNF/pDV4ucVAjDngQZ+Hugti03JWJc3s8Dysp6GrN59NdV83X07Ef@lists.infradead.org
X-Gm-Message-State: AOJu0YzFi0e5gGDJ3H96XcSZSkWHyOGmoDI2QXU2tTXQfa7TuK0EZ68P
	PPqJOpITis2emUhXJSfqaRVz4grWaR5+LX7ltNSwnzRRkvJx1wLn+mVa+S//7Aw=
X-Gm-Gg: ASbGncvws3kljxg3q2f4W7KoXPuU/13T4DiS74vhvHzpeQUhyhjuhl2moIz3TWKAfU0
	5NvAtRe/7HZHnZZYgHfUIr2YUNKHxel2yvGv4HZiGjfBInbiufO8VL+co7Rrmp86v17REuPgQSK
	fXvnMPsmHAzn7IHy12MlV7iMEmI0qgJ9rJDbnMEAyn4SDfxqAnsAJEuA9RpHgI+qlPyZHvOEwR8
	7ndh9OXrlfp3ZxWfW6Z4l8tohhBTYX0SG5La3ZTqAjVQ91NHjlQ+etUhU8VgU0739U9OK06Sye1
	5QQQONj2ts9XUmG64WVKVrPvgiLNfE+gg15J+3bqm0/SmcBiLHnUfTGilU5uI7R3RNCmIxcXXQ=
	=
X-Google-Smtp-Source: AGHT+IHLpGVYohdhDePOX/01BUfja4SyeL/k1YW2dpCn0rRFA4eApzkryD4JY2waPAlUftYv7b38qg==
X-Received: by 2002:a5d:47a5:0:b0:391:3110:dff5 with SMTP id ffacd0b85a97d-3997f903a65mr4449412f8f.5.1742826933041;
        Mon, 24 Mar 2025 07:35:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3c90sm11410480f8f.36.2025.03.24.07.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 07:35:32 -0700 (PDT)
Message-ID: <7beb5a48-715b-47ac-a908-ca0fa135fd93@linaro.org>
Date: Mon, 24 Mar 2025 15:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: NXP System Timer Module
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250324100008.346009-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_073534_931477_33FA4AD4 
X-CRM114-Status: GOOD (  17.19  )
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

On 24/03/2025 11:00, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.


subject:

dt-bindings: timer: Add NXP .......

> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> new file mode 100644
> index 000000000000..41093892c617
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP System Timer Module (STM)
> +
> +maintainers:
> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The System Timer Module supports commonly required system and
> +  application software timing functions. STM includes a 32-bit
> +  count-up timer and four 32-bit compare channels with a separate
> +  interrupt source for each channel. The timer is driven by the STM
> +  module clock divided by an 8-bit prescale value.
> +
> +properties:
> +  compatible:
> +    oneOf:

That's pointless - you have only one.

> +      - const: nxp,s32g2-stm

Keep this

> +      - items:
> +          - const: nxp,s32g2-stm

Drop this and oneOf. Unless you wanted more devices, but then it is
incomplete.

Best regards,
Krzysztof

