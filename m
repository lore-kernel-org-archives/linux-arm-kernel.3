Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8524CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5SFIqaEshVlX9LzlwHH+wo3PqHlpQWvbDIgoSHoIug=; b=eELnUBxKBbkZY1S0+8v4xxUvgq
	NfQ42ClVzCertZQH47Uj2Ffy3+hzHLIgUHSrw6fStvnIGgp79nYNaTz573OQKDdW33sjPfd6xPVaJ
	wCOiXgoab+xuxnUse0Q4HoVGPKxHU5lkaEQnxhYpxftDRuKyESa/6koWC9D9b4sd+N/Tb9jlZo7iO
	xq9rtU3Tjve884/SLthV/OSh3PoG46656PGKSlf3Gr+IwCES2Y86Dp4FhV9KWoMj0E4JCm0AhLW7t
	ttSJFtvSdkhtTkSAIlamRrO8k6WEqF/BqDXqAewpi7FGfrMLel0LNGkdQ/baphjcJ4q8IL8DjSG5r
	4AB171bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIovn-00000007GoV-3Tnv;
	Fri, 01 May 2026 14:33:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIovl-00000007Gnw-0gTV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:33:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488ba840146so16270905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777646003; x=1778250803; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5SFIqaEshVlX9LzlwHH+wo3PqHlpQWvbDIgoSHoIug=;
        b=cYFW6LwQg5hJNafTAcTLwZIE3VLYZy7dYjRMG85lAcTkzCsKyHGpdfTp7sKH243t8E
         kEMETbn/7V0rTcm0fN7D1lErdHbKEcEoH9o5brzE7Br14im7gUqkByA/5+sCtKweL4IP
         /h9oM59BWYEZBykh+ARiKgd16LpJv1QIzZKNdZb1991haUBS5QoFIDySGzfUPCzitHCh
         PlO8mEYD215/bOAUEiE4r0V4BGk8U/XPxMcv1dJyO8X4Cu9VFwmt+plqfFpQTTAuJYt4
         V38dKB2qBpeDBYDV9v5YPN5+2fu3nnIsqKK/rpnSdbiEsg2JS4dqnqLQhmTIUwSHTiN1
         g2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777646003; x=1778250803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5SFIqaEshVlX9LzlwHH+wo3PqHlpQWvbDIgoSHoIug=;
        b=pJLHfxcD3T3QtRE26KHIOBVX8rpmyBXRLHZn/eLAYNmUuJDEu3r92MDo+G/n3JrIJH
         2UtnZac4hqIF/Vp2ygGmubP7hxczVdb2VgjZTDESFZ2pj6xh0o5ERS9yzNXsQK8yzfoM
         pP/PRFVg8gs8/oaI27XopNcVxDLgPqw+LTHnlf9AmEVZiz9mtSilKZKqJyNLkgdMteyN
         Y3MLH77WggFHm0OEXLMjmvZK9WlZcJ8qd0dtJYfzd/2gr9UTUWrDUqws6Hsqr3spftOj
         IOuUA2C8GsNKuYmYCug41LYHk9CQLN4xHjixbmrcnuI3oQhT/xy1CvmFJC6lsyyvrPTh
         TVnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w4SMzIPIuhjikDVJOMDUkHIoFFAMcApuJJHRjFFvS1JGcoLOI9irdfZAeKeC+2m/WWizapupqNLDaaHZksCje@lists.infradead.org
X-Gm-Message-State: AOJu0YycAPAMXOTNp5rDJUnaVy635X0yaZDBdgCaWCI6YVp+5KkfDJlY
	2rCYOI09tVbdNPQSEl1zy1TOQQBI7Q3MOqcjHgeF9A6YpQ+ctIj/+XcCKnSLGWc0tIM=
X-Gm-Gg: AeBDieudszAbyRnWaxK7VqH9NCc2z2GqUqSbJrDS44SWtHNxb4yIJ5xKnAOnMP/poZc
	LbzljR3O56i08Q8Jo2uYnWcWsCqW9dXxDwjrcKTnTpAqpK9R8VTzlFzLF+fnmI6kMomkH/syk7/
	FXXMVorYQy3Yrogs9Uyz6d8twMnyxeOdx/86qJjafCg9xuT9tH9Guv09J++aw3YfP46ARrB6Ajy
	dewwjRJKoEhsvMZ0HmjajRv5lxR0RWYCBGsoyjFk7c5ZVr1LxcF/qye7jZBEFruvc3kLmfKMcRY
	TfzAHMBIyhenRbCbNg567f04dPN/zCJmZiGQgpYN9pvhQjJTPcBA+6s1ns3Lu5rs8/V3yUSvIbK
	VhhYIwZs7p1ab1cyY8zjzCTJ9UN2HSQ0pp6yX0g9Z1zWtrbQhmbPWy6IhcF2UctRD6O+1u3Glvn
	G3vzpQ/40LohRGqfi+30bYvDdaZcMmdOW9DeIUqiFXuqA=
X-Received: by 2002:a05:600c:49a3:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48a8b02aeaamr51995435e9.11.1777646002848;
        Fri, 01 May 2026 07:33:22 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm132049825e9.4.2026.05.01.07.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 07:33:22 -0700 (PDT)
Message-ID: <b9fa48f1-0ace-4a8b-b2bf-b5e01f789f7b@linaro.org>
Date: Fri, 1 May 2026 17:33:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] thermal: samsung: Add support for Google GS101
 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <DI7D7JXW4RGK.XB0BE6ZXNMHS@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI7D7JXW4RGK.XB0BE6ZXNMHS@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_073325_228757_0F85711B 
X-CRM114-Status: UNSURE (   8.29  )
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



On 5/1/26 4:13 PM, Alexey Klimov wrote:
>> Dependencies
>> ============
>> - context dependency on the ACPM fixes sent at:
>>   Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org/T/#t

cut

> I've took series locally using b4 and result doesn't compile:

take the set linked above as well please.

Cheers,
ta

