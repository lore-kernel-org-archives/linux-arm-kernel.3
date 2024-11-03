Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F01D1118C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 19:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9HRwxuKA5SYPrf0mycwo4kyEZVXW2KTXgvqsO4ho/A=; b=K1g8gw3iItdGmJ0Y6njzfncpbu
	4LtjrLz99F6Yhw5w4chZRa849ipG5qD6ilfPyuk1RMWesDT3juvQ84JC5XEGLo/AAkUK2+wmd2jI2
	Wl9lBvZ8mcL+c9iv5BLX6OxC8htZRU3TR7ulvZ4knlE8B/5Z2DdPUdrU1epNRYdANILky4YKAZmvP
	uiJW62nvLNbd4uqxxc/eGQ5BQVC3m+SmREuw2dBlu2oqeYgidbpC96D0D3EGiu5K8dTyQxHd8nWWj
	AalZARZFzaO0SCc4S1jykhYFEOsX27Tp9UU3mdHNrDWnsnXb7UGurHsbC+t6cYg9eKtq844ka15Yh
	Tp5j9ZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7gg1-0000000BxNm-3Rcv;
	Sun, 03 Nov 2024 19:54:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7geK-0000000BxAT-234i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 19:52:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d41894a32so1898619f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 11:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730663554; x=1731268354; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9HRwxuKA5SYPrf0mycwo4kyEZVXW2KTXgvqsO4ho/A=;
        b=XR296XPQBPSEDxB6Cpxuio7BdTPGWB12BCfxN0Vw2kvUfpXhFlj1gLUbJN+tUNVc1z
         wkAyLERNNcp+LcEU/5SrCAOU71zUMvyx/TtqsjZNopCxQQTOykIpDEaCHG4ojl+SqCI4
         vr/OSvauQ2QAfbloa/MXqWktpdU+tnVnC+8Lo6ps66BvAUiwMzur3jRepm2rnpOMa+gv
         ShNYHDI7Z1vHrNZm+zaPsRNwj8JCaTgg2eWM470AJJai/fZryZkpy0GKPKo7f5P+3ze2
         AyjBjjcbrrH98qtxCnTcswNRk5oFjcAdS0Z1ysPiLdPFe8nMHADa/GbvREDCbX9+TH8z
         jg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730663554; x=1731268354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9HRwxuKA5SYPrf0mycwo4kyEZVXW2KTXgvqsO4ho/A=;
        b=AW3aGxvAM5W9k4wScT0w50hocLXrLuPoqWWGh6RrABh8AzfUarpZT+Gj+XnTI9EqLL
         d2dHUu4+h+DSGAiXuGn5j2svXxtimiz1UNbaK3NGealJYhm4M6MTJpeXrblojTIRFEeT
         TCY3DorEm8gTpec1mjyqsRqOboXty1CqMfgKbgyem2jLwm+11diXEsfvzeZsEpc5M3PS
         vfc9KFWOyVsrJnDoTIIveU/kc1Vu9zUXqvuID/iPiNzAg8JheeBOMfDg9G1dsY9pVr/0
         QXRr1cr838QxeP0TP8V8lQxT80JEju6k8lDvmq+cnDzCa6hlCF+90JhE5uI1QdQIU6u7
         X6ug==
X-Forwarded-Encrypted: i=1; AJvYcCV6pFIldOBolbAEkfzoc1TX67Nxr4V10gxhFeYei8Rw5B3+TSDbXy4cpo6/eZbuIOZW2iiaxxshE74dOgpWCqN4@lists.infradead.org
X-Gm-Message-State: AOJu0Yygi7EZkY+N0qVNCIZ2LtpYYasXkqsSd821iFKwKORZW+Y+qzuM
	i6IcTKwDwEhFxKTEcZm2FnmCDPMXhY6yWgdXzvUfmCpviVybvg/C1KWtiJ3Qasw=
X-Google-Smtp-Source: AGHT+IHRlzR/T44vFTA6xhju6BevgdlpguiQL7NPllDCW6AH3Dy70BrbMRmNdc01zD9C3OYhha4t6w==
X-Received: by 2002:a5d:5888:0:b0:37d:3f81:153f with SMTP id ffacd0b85a97d-381c149f226mr12298762f8f.17.1730663554250;
        Sun, 03 Nov 2024 11:52:34 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c10e61f9sm11272153f8f.58.2024.11.03.11.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 11:52:33 -0800 (PST)
Message-ID: <d9f946a3-44d6-4973-859e-60aa2807181c@linaro.org>
Date: Sun, 3 Nov 2024 20:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: timer: actions,owl-timer: convert to YAML
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-actions@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241103123513.2890107-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241103123513.2890107-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_115236_585181_D6C1E8FF 
X-CRM114-Status: GOOD (  10.74  )
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

On 03/11/2024 13:35, Ivaylo Ivanov wrote:
> Convert the Actions Semi Owl timer bindings to DT schema.
> 
> Changes during conversion:
>   - Add a description
>   - Add "clocks" as a required property, since the driver searches for it
>   - Correct the given example according to owl-s500.dtsi
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
> v2: update commit message to be accurate (Krzysztof)
> v2: don't preserve formatting in the description (Krzysztof)
> v2: add allOf:if:then block constraining per variant (Krzysztof)
> v2: add a blank line after additionalProperties (Krzysztof)
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

