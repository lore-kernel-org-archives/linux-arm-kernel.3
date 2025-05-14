Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92046C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7rIwpEJJDGc7CtGo6cVG0GXhb+M6Aw53qeNCXPJhoY=; b=N2/hGWHpoaC2RirSvDOTfJnU/B
	jhRUNCEITksn5fW9uf9442uve1cR4+ME8qcetlxS2IBdm579BBFDLvktToXCmAh4jzf1PPMg35saV
	t6flfiJB20jzTHE1zUjG+Ma2DEZ1VY6sIepJwX96lEklc12l6bkWuRWCQaziWM48GPtiA6AknVRjo
	+O2HeBKuASRZGSfOQWWHD3dce9UGIdC4If0vaTvxjyNaP56cwwwh/+N9n8wDQToUY3Fg7vHhkOBBg
	ml5mTPLRm8yZPOuVLeAYwCzlwmrvxLb17BBM0l22xp0DQaql78pPZHA/5NRswub/zIOsyJqHzXERI
	y1BaByHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEXO-0000000FfWD-21NI;
	Wed, 14 May 2025 16:00:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDoT-0000000FXwn-0jJY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 15:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a7rIwpEJJDGc7CtGo6cVG0GXhb+M6Aw53qeNCXPJhoY=; b=nbI8cpW3/3tdBFotpLdB9/K/Vt
	Vpz0DOWmOGxIPem5pbycylrYwv0wB+lLRlrLV0dAK3GnP59SGF+AHQTNWbp+JxLTbRsD5M58bASPU
	q5k+EIBsaA0Z7A33DQvKoFYYEskorZgb1ryMqJq0x3e1MO/HX7T31zSzrmsY2uSC/jXIg+0zg5oeN
	APjmfKIHb5nmACyYHfCw4E9QKAWA8wBUY7uPxnLfgaUmQ+UPXXvv7NL0nGeCDbCRNoub34iNyuBvk
	WZiSglgw0nwL92nHpsFPwuDXDOIklFjfH8k4Mfroyl9fw53MQ363bSvw/sUXNhWi/5yn4RjuJdK9H
	RMOeezew==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDoP-0000000HEHA-3EGq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:14:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43edb40f357so49954405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747235663; x=1747840463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7rIwpEJJDGc7CtGo6cVG0GXhb+M6Aw53qeNCXPJhoY=;
        b=Cu/LUOzqDhJ/NZB1sdkjVzZMSEWsNocqLgUqCUa2Jzk5POH8D7DbVF+g8wOQkKv8fF
         FHV9i+hNjTe6KM02oIDTI4v3X0bvFwLP4lmfppvTCEzYRTp71xIwUx9CTAevyIBlwZs5
         9WIA14C7t8Vzrfl6G2ksoQSzsBRVlN2rSbwxogCldc5SJoQOsZ36n97AuC0FCLCS4wE+
         OARljAbd3/hsGfoTspKuxE1ouAYZpxgN3WzlekAxG7vXQQu2XJS1mDfoV+V6kc8XWp0M
         W3T6difqdD0+gEccvQVFIiMl+mMfGqbl6akf7aa2v2FFJye7Iek9AkuAtbYt+3nFMyn2
         WQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235663; x=1747840463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7rIwpEJJDGc7CtGo6cVG0GXhb+M6Aw53qeNCXPJhoY=;
        b=HoVR8wFbsAbAqekmxThI88q1A+c6aZ9tTjdeVh/7nwKt1zX27Fbyfr6kqrADQWOxJX
         A4Ra9JoE6fGd0NChZMWLNJLjUESw/xJ8l6Zw0p3641OTDJqHYjUQTTv1J3QVT01Ks6h4
         l347sMuvXpkgRlmpRFZXY06leSZoVyd5osQhzzEJl+DJG6dGP7SJYYP+155w4SOLHxSf
         zfs3ZNA8Tx6gdnofDL57SoQH+Ue2ymvDoHoc9BYMKxnuZtlOSgx3ji81BUbM36Fv4Krc
         Yxzd1VqlmD328Wy5wIRZkd1LaOBfIcqo+ujeih7wVMaqAOL+qgJ0brJIR1JjXlt85I0F
         FWsg==
X-Forwarded-Encrypted: i=1; AJvYcCXftMYr9RHha7b/x9n59j2GwX4Aif4qOcgHnQNYCO7dszX/xr87xbUdA90UhDD90KE24QpTFc5odOzKyjjk458q@lists.infradead.org
X-Gm-Message-State: AOJu0YxQqUV1qlKdfMezBJMRiyzBz3qZkLFLyaYREq7D3IaaTqL8Fk0U
	PRzeXpun3PFFtrqEhM6IoRKak/gBzSTlFeB64ODitYohs7SQYfmZs/Meb67tDco=
X-Gm-Gg: ASbGncvqJnTOSQcpb7ja5pPOq19KYU7xTLOXzTjN/qDdZo5mQ+M5VRvDDwWcBVIh8+0
	DT1rWGWk6wTcr9Jpppezg+FWK6zPUvrCDGKhgCs0j20D6VfW54pRi3Darp4I5EAU2BwwtuePLxn
	/zSc9Vwl+aDLJVIFnHaoWHwKUTFUafz1c3GVB9IuHRsxRTUVFBrD81f615G7nTNBwZRp3D1sZG2
	zYf1QfB+P8AyYQnD4ekd7Sdw8nmXJeOqk1iOeV92/AeisjTmZWkhBWb0BRpNdisuB2Pw+ZEonUv
	g/kQXa63eNIA4Lq7rHvOjzJdBhwKbmzowKayBwwCCKWmBD0kdkZn8Uipy3ly1hBKFtYj0IrJpju
	5ms/+MUfGfUBP
X-Google-Smtp-Source: AGHT+IHUCNtRDjNcYlz0tMRh8QL47NI6YxPvlFXOO6n9TgRhi0jcJ/DCL8LLyZKt4qQ5vfFPhvAP+g==
X-Received: by 2002:a05:6000:2283:b0:3a1:f67f:1bc with SMTP id ffacd0b85a97d-3a3493da42fmr3668225f8f.0.1747235662925;
        Wed, 14 May 2025 08:14:22 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4bbf0sm19697335f8f.82.2025.05.14.08.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:14:21 -0700 (PDT)
Message-ID: <6c08ff11-cf82-4f8f-8e51-3a3a23399010@linaro.org>
Date: Wed, 14 May 2025 17:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Alexey Charkov <alchark@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_161425_974195_6252CE45 
X-CRM114-Status: GOOD (  10.88  )
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

On 5/6/25 14:16, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---

I assume this patch will be part of the "timer-vt8500: clean up and add 
watchdog function" series

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

