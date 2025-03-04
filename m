Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD89C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xe0gNALudh5AKNVpnsc99NpQysntPABXDZxfVbJ2638=; b=fgZ1CW7W6rrlcgsNAEMGAvR+QC
	v86BQdIR2H+gqn+0E4MsD7zo8+8MEF8AqzZgtbsKbgOIvIt9AfkidLfnEkpTbF1tH9ae6G9YJyHEK
	J4XevuqKnq5QgT8RGxppUGkHj+svwSRu2KlupLUi0tbKY3t1jftp3cr2HdNkGxJDZcezgw65182DU
	Q/vvZ5C3rq+ucogDEmASfDv233ZxIimoLvvq42gf+tq2jKXk9n+SdYepyKe9warAfK6tEkqzCXDqS
	uWX0MruRRFEfmxiZ7NlmrAaSSqtyCnhzF4pE+q6ayCUm/PMIw3UTlN2wNiIGWKeXmGlsG4MokH+wq
	ChB27uBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaIm-00000006M40-1jqq;
	Tue, 04 Mar 2025 21:59:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZ9m-00000006DvR-3EcC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 20:46:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so26390255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 12:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741121185; x=1741725985; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xe0gNALudh5AKNVpnsc99NpQysntPABXDZxfVbJ2638=;
        b=mMluDswgthzz1fMsRi9pkoQVos3jZIVGg+Con4ld1QLecoBVP09/ijr8DE+8DI3F3K
         Z4fXVKgmzNrbnYrsrvtD971WHs6N2CB6UHpR/NZETiy3bv/yuKSOK2+ECPP9w7lhfnRA
         kUXuPyyXWflMOMYa4LZVWJbvwnU/8Z7JImpNZY19wsXzbkhfrD2TEEJ01yrT2JmbSsEf
         RlNPhcslyRxYu0agkvzlB6M2Cd6CUoG5dGqe9szAMWqtnwJdnKRPq77CfBy2wnu8DtY8
         oPES+y4gaAYvcHm08OwVGJgjuUfvszzcf3y+bHLbnaGLVoIVrdNuzVZFA41hbTgM515D
         vynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741121185; x=1741725985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xe0gNALudh5AKNVpnsc99NpQysntPABXDZxfVbJ2638=;
        b=LmyMu4pDR0kcns+ACG/USTIUycxwEfU41Zgzz8CkJvOhBQ09bc1+81GmIKQhSn2oUj
         OAJwNF3qR+KphA/5vT8FX5LXxWNf+Qk+gV7+dDX/VYiprg9NS74rBa6+corYxlzbmSgD
         PPIcyBm40zVat4CIybcar5IItuRZdLOnF3SolGxwadsKUAeuTbKxTI7TKGZswUMDqHFY
         VrKfpp/G/WKZtTC3otjM3C1rA66bAWB4pmNO1bhWTMw1mn5r7KSIengpmsxWr+PbTK0z
         kqe2RlmGp14hb1f3bXyLC9P1D3w8bwxwGBr0z7F6yYo7rmFQsV7vuDEGPkwR5AMXIfiu
         UPZA==
X-Forwarded-Encrypted: i=1; AJvYcCUAsyFndo9lv6vkn5H/+woorqFQ7WF+mBkQyOado3fhLX562NBOznM8MDqKH6NlSuZPhzc+mf18mrDahelX4xeK@lists.infradead.org
X-Gm-Message-State: AOJu0YyXnKuZUIeLCfOXYKUWcNoRtOke4ma6xdUOMU2WPWJU09enPZG8
	AJPQgFt8xHAxCWYvjXFRizzwZNk3UUFdsZhzlLzoPxYmk5RSWhSzj4o2VE8Ivro=
X-Gm-Gg: ASbGnctHNAeu8ukD+5137LjSKPwrsRDLInLTOndu4yNs7yojwHq5h8FJG/j10F9nvIb
	/r3AOds0Fyklkp2GqL08MO3H1m5bvLxkNFuRQSKutaxVjTxR5EbHivZ5jd3ACPe4cxUxwYRV26n
	VNoy7aKolYM7mRpEXtZs+ubyyRkyolCHyE0dCaZAJ/M1VUcGSxcKCUS/XyeRATI9Xhj6xs4o8J6
	YlM4yzztBz0pCyY2Yo9nmh+yxvG9ckZj/bFS3ajRTIFURJj7Nc8fxgsxcXezqmVAPSEhv5hozo5
	dNnlnKqx1u+2rS9cPDm+wbSMSWweSMguNnkbEe+Fh2OGxMGxgvERbG/aoWWS2iMSPw289Nh/ZOp
	Ei0IWdxRf
X-Google-Smtp-Source: AGHT+IHjEcU8uO80EjIqMe2Us3DZGx4pspSob8gq93Xc/2SwZ46ezNtIGH7ewMTX9XjP3bW/4xIyWA==
X-Received: by 2002:a05:600c:46c6:b0:43b:c228:1ec8 with SMTP id 5b1f17b1804b1-43bd29463b9mr1995375e9.1.1741121184670;
        Tue, 04 Mar 2025 12:46:24 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43bcbcc53d3sm21750535e9.0.2025.03.04.12.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 12:46:23 -0800 (PST)
Message-ID: <e4dc9c1a-bdf2-45c9-950a-69f647f6283f@linaro.org>
Date: Tue, 4 Mar 2025 21:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: stm32-lptimer: add support for PM
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, tglx@linutronix.de
Cc: alexandre.torgue@foss.st.com, olivier.moysan@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250224172101.3448398-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250224172101.3448398-1-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_124626_826598_23F525FF 
X-CRM114-Status: UNSURE (   9.36  )
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

On 24/02/2025 18:21, Fabrice Gasnier wrote:
> Add support for power management on STM32 LPTIMER clocksource driver:
> - Upon clockevents_suspend(), shutdown the LPTIMER, and balance the
> clk_prepare_enable() from the probe routine.
> - Upon clockevents_resume(), restore the prescaler that may have been lost
> during low power mode, and restore the clock.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---

Applied, thanks



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

