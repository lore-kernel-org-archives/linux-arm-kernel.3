Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1606FC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 07:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRBmqpVTxqQUQSugi6++6zjAMo33X4fuKAzeU/I+2SQ=; b=ukEFBe5vsqO+mw6es+k2F1atU3
	yPYaX4CmC5KBLZugtNrnGIUY9C0EyyJ1tjJLZkvCG3MthhJgDkPiWKa02ADxAG8SxNqRth9w7H+el
	rYRhxJN9wn+cOZRUI+aQxQ7ZGgREe0VCrcN/kF7muYrgxzR8F9XDKCyv++1vqebSB0hf0kTF7JSxG
	Eba/Zm88G4us8Qzt6rNYkDczhmNjx4/uQonZEui52V2x/A5Z5DAA4Q8sHAoM/2ce8RR1gnt42/Pzw
	/leE2Z14tLtQt1uOMDpnJa1I9WdkJQtbLaxNN0j+g5Q9mqQrsov2UXkV8lIuxoMHJk3I0kz1Y6jgh
	WhSfv4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxUG-0000000GEP9-0Y9M;
	Sat, 05 Jul 2025 07:39:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxO5-0000000GDkk-00Zz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 07:32:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0c4945c76so225532066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700759; x=1752305559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRBmqpVTxqQUQSugi6++6zjAMo33X4fuKAzeU/I+2SQ=;
        b=k/CyOp7DopBbIHlzcQqVc9jh9FWbXLhNXAll+NNja3Fh/Dkpr0OfFBE5dVbMS8zWio
         QoU2oV/PzMHqlbFZn8fN5jPzKYwn6j7Jbyeu9Iq2baWpqeS1sv+n9wJRai5INjeCDeJV
         zYN1Bpel7gDSEnIcYYLo4s5QoiczoOsCBq8EkrRJbsrmJWysIj/6HO5iAqZrunmTvOkL
         BAw50m7+5q95DcWoI+uC23PJlbbayQO/Crs7W26zffslFWQAnuVpuzdkcKpD0YXJDFcX
         f/XN5jxs6n6LSZii9FBA7CDuaKKa52n+M+IQGbZRvuhUlkD+bY+9mojLU6rlruvHjgqx
         Mr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700759; x=1752305559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRBmqpVTxqQUQSugi6++6zjAMo33X4fuKAzeU/I+2SQ=;
        b=Y22prnqAZo4IArm2zSOEJJRy9OiJM+/KjEx61do20lb3570gwPmyqtvBZ49Y/bs9Wv
         8tw0mTUsShW2+6Nm8q6jnX5N1jiuTk+hMvOso82/iodPx44Af5oiFDoeMBMWMZ3Dbb9G
         rzhzQbHxeiW8hcxt0e4zBejSldeWsbK8zwi1x/KLwY/k25JYTxdauZFaTfsFzRJCo1Uo
         4z5FamCFbMagwoPABjbs0Aa/91jcOFco46JqnwhEr8YftUEp2cw2L89NnrAVB0N4RHl6
         1OyBUHoPhuEv61yNX5jsla8vtqVmUlRzuUtDE6dU3yLCsBC4TPT9jhxFRJIqZR5VA64f
         GEag==
X-Forwarded-Encrypted: i=1; AJvYcCWHFPsma+8dpSP6wZjRvWLNJ80oxfjtm2GsJcalo5p0+Cv8BEh5cmu+Wi9OvjXgh9Su9/kPuZ4wvKDg5wjrWAIz@lists.infradead.org
X-Gm-Message-State: AOJu0YwuN/c/yh6LgIo4YOqUDMxNv55HqwO54WRa3ruXeiOehm6xYFbG
	pNI2BjDpRtjSCJHW1Dj804yoNK2b51eWldobEaAAJKgF5+0IpczX4R8jXbF9fJRz0xc=
X-Gm-Gg: ASbGncu3m+SKgELE4PlLZt3TmTM5+hngINviLiFgy2Xbq2QwGoHVSP9OgFNq0n1Oxss
	3cgYHarxEjo5JOLvos1HPdUZHgxwj9WfTJi7zwYgH8TIEh2Wuo0qtvnglwV4G5EowNh5d6i0tpD
	2pCOGFltNCbwigUkZH35eZo4Law/ylCClksN+7fbROZilRMkF+DxaiztyuXkNr/LhekieuKmSpo
	HpX7V7UdmBNochvNLjIWieEKv591B8WprkzmNqa+LTkc7/l17qXazJxhMU4DMO8Fn9KszCrCH+G
	ZnsbY7dGEqsJ5oImejXo01oAUO/4Zfb/fy0WE2ADfF3dI3IV7FK12cfOcXrc6CaJThyJlQ==
X-Google-Smtp-Source: AGHT+IEs70bmSg33x6Aa+G47FWLw9oUy7Z23mFZgwi21TG9W6JihA6+ud5CNq1C0RxyIqlIE9DyHqg==
X-Received: by 2002:a17:907:f806:b0:ad8:8cd8:a3b7 with SMTP id a640c23a62f3a-ae3fe489847mr456652166b.23.1751700759229;
        Sat, 05 Jul 2025 00:32:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6949cb2sm303805066b.67.2025.07.05.00.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:32:38 -0700 (PDT)
Message-ID: <69f543ba-30a0-43ae-841a-19b209937b14@tuxon.dev>
Date: Sat, 5 Jul 2025 10:32:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: microchip: sam9x60ek: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003241_048056_75E29412 
X-CRM114-Status: UNSURE (   6.75  )
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



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 2c0a1faa4da5 ("ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Applied to at91-dt, thanks!

