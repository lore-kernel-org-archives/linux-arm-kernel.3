Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AAEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=; b=PM5ToO8Wngh9aGirTKZgONfLq+
	Yh0T96FevaZcEhVYdt4QFMvQj8uji9EyN+Fxwt+lGhu4Q2hdg5QClLsrF/NUSwnOucbGHon3Biqa5
	+jzlqEZRccf3O+PjAn3J7/BNbZXSMu3mcXeV2Ni7HxeipGbcUNHTEPnHYNLyiMKBLbMkHDG4/K8Gh
	fMc5ccwyhoXQ6BPVY+2t+qmlqKrejcz70QVIbHDgnMadkmksypk1VCvSopU4Z4EzFrWYYtrnwdyOg
	k0oUbVCEza9wLGNQVjhBpbPtRlWFrNN+HMjJA/jZt21LfNV6F+Mt0hyJULgiZlSKVeji37tqBoBlO
	ho5fxqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSax-00000007qNq-0Mb4;
	Wed, 08 Jan 2025 09:43:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSWT-00000007pFh-3Rp2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:38:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385eed29d17so7858721f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 01:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329124; x=1736933924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
        b=BBHXHmfOrxFoJeq6qv52rwK89OyNhHzB0GvX7GhJyyM52MZ6x3ryDywaorfxtXRuyP
         QRtzp98v7O8gfHffzPfNwnOYz3Ldw34ixUkW5+E91lS6G2eKJEXXSf+LDfYq0XfF/fuE
         s2CW8WvatUND6KoFQ71C2aVykhN/7k23pCfHI3SMRvmydDgf5Vp8Kjv+wQ26pO+760cx
         URc6lryGfreKTtEpuJABzDRCOTkpElDe/z6SSYFHvzvZhYHhc4dWxZJpycorEvEBRniv
         NisATRcdGaSRH5dVHYz5x2/uxp/1ck1+KKg5r6fCdL3NdsxMdz2iaAHT4cZOD2t56jx2
         48yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329124; x=1736933924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
        b=u9xYQfJ1JPuv0NHIaXkwnvo2ZV/Jzg+k5ven5MEYZKxuC9zkS58yGauu+kPlhNw/xo
         3h0o8Yu0JDQkalytgLYBwaHMOsRA1LXDq2IoQ2yDeIloIpU/7E7BH/7Hiv3r8+AKOBCg
         snJDv9qJXf+jd0sZuXD/ODVpM/FRuM3TqBFqB0Nl7+KmsSuiktMaTlABit6S+W9oSW0O
         e+ZRlwa0CmJVsAN6010LD4U0KGzVLRfAPFF4LIJ6defqtVv0KJOyXWN+nV9J0LK9WUns
         0dJp4OzanSuqjiRemsVS28mKH1wsrn4Sj9BgtpkeBhqsidyCztRNAtAOVYH7WSPEbZnL
         QlyA==
X-Forwarded-Encrypted: i=1; AJvYcCW/cr3IvNsm3T33kcy6xe9PAjVBML1ZULF8Ps/Y1nbsKtFgoX3/Bn4JRBqSExk0M7X1hupuAdpKPWV1l0+39SVm@lists.infradead.org
X-Gm-Message-State: AOJu0YycW882YtUzzRXYQUqEkaJuptJhw3B0Vy773uB6deVBbQIgVYth
	bvZ79EOaasgJ2SGOmAxyflM7boTi8AI7o+FSpkFfVoPAtoq5wTGbxBXA7wuabvg=
X-Gm-Gg: ASbGnctcsX+Mn5NmwQxnqdXBQD/10yjty/kbXaYbcOcnERCVUg+hWrYAWm1rxjr7/mY
	9dRkvXPctUsgKsAlxTVcqFoLFWHNBr0UPdbsmw88+kcGlAbtGfBlj7PGKh2J8Ir0aCU6/qFFt2x
	mlXYcIGYwSC7I7WVoAUsbTXDX5UPVUS2t+NKejwsal7PS/N9F/MQgoxLPNEY6ulekIs4NA61lqN
	lbynx0oQoohN3EvX8of9PlQqU+DwDKvJYgkO324U7wCgssMZXkwByhXPbRUOyQMEcJXUFbm4ykT
	pqVWO2G++vPzLZH81Lvc
X-Google-Smtp-Source: AGHT+IEYud8HXrnnBRfQKSjaBRvM+YCl9Bp382tGy2B0NHlzlfFxJe7Ru+DWxpOuAvFe6cE/t2KRgA==
X-Received: by 2002:a05:6000:18a3:b0:385:f0dc:c9fd with SMTP id ffacd0b85a97d-38a8730dcf2mr1495919f8f.27.1736329123722;
        Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8a636asm53864908f8f.88.2025.01.08.01.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Message-ID: <71aceba7-d610-4550-a8a8-352c8dd4b44f@linaro.org>
Date: Wed, 8 Jan 2025 10:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_013845_851743_31A29002 
X-CRM114-Status: UNSURE (   9.78  )
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

On 07/01/2025 14:10, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

