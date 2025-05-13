Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C32FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyty9J7oFX8g3fubknNJuxgnKh0O3w+60/UN3l+3UkA=; b=HcVUmxRcitke/lG9a/RrbsQAse
	FSL8yfdDKujTgm/DZ0vnsmn5du2bwiUtPc+NXWOc5umDSRN4tE9SbYwCGajFKyQ+jTe1/MFGz0MZM
	iPnRifcbhhbqvbnnOBwk5aeZCr8xfoM/XOibNz6YfuDct4CdZ34HDgwZgmWkoAjiBCuWNn/2qCPwG
	vWECUxCUWP8l2HqVHjrPE8sa7nFaADZ3P4M/mgt5YgV/WmcDGEfYX3gla8wFN+FG/rPj7EmqBe8OR
	m3JvG9kWx3Nkt/EFOQ6nN2I3GLSSgRn6jRaaveKAerss3jwbMv+6qtQTIz57IfMlHXD1fE6BUHDfG
	Fg7GlA3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqkA-0000000Cd24-2EB2;
	Tue, 13 May 2025 14:36:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqeu-0000000CcJe-0tHW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:31:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ede096d73so39856005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146663; x=1747751463; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yyty9J7oFX8g3fubknNJuxgnKh0O3w+60/UN3l+3UkA=;
        b=zjTN2lEJuVbAYpAu2dPbXnQQ93YhEnO9k+DSICQaKNO2YcS/pzBwAje143jTjq53t6
         6Z69k5jcBS2FMRe3htKhLN9qXs1+BnL9M9mY/S8ASLAU/i3lBkbYsn806rHMGTFMFCR0
         mSrKzCb+AqddCuwe7I5iffcagKOGEJNjUWGeam0rb/kj9V7cfAb69H6it3f9IiPXSDvy
         uFddGzAUicRbB4HP0vVyOxBqlIXw86650kO+uNj96atlbYb1BTDGN/v/8VV9ogmyeGz2
         XCe5vPoulur8Q1Q1KLRMbXRbb0fWbuLH1sLQ1xsVDDWzTnoqkL1obvBeXytAiOQV4Vhe
         E9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146663; x=1747751463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyty9J7oFX8g3fubknNJuxgnKh0O3w+60/UN3l+3UkA=;
        b=t9Kbi04t2rsbCU0DNDlcwFaAAvG87tHZRhbAt1F2GHwqspwx/QFGXQukC2Wj5T0GBs
         WBoVD7g9QJ0saipwAR+pn9SOgh2Hg9L+pkyQZz2dVMmCEqX1gt2ZQJFxUl++GR9spHAc
         e4GRew2Z6nEAhkVzXJ6MRr+x5lmU3tDQs/p5s6Sc6EDpEKHtebSvAEzAugkgchP+y06o
         ZntPJqWtY9uevJ1u7meho2zrVUUMWI9sZ0SLwcB9JtzoiuqiL9xfXoMiBo12L4TRZvYR
         4RaoCU8TLoC27pF8NGbbXZfpA1UHILARKsAY2TzGaCEumXWVGHA9+HZR1PXhAg/5pq14
         E6PA==
X-Forwarded-Encrypted: i=1; AJvYcCVM2daoG3yk0dMOtX4hvMlc1cWeWyJZSTqBNO0R6AqQkEuIcja02wOhx9XL2EwBX/azdBRHnI4GBpLcBqNaWH8m@lists.infradead.org
X-Gm-Message-State: AOJu0YwCuEflADJXVN5USh7dyfRQyUjeCXb6hTLEO+EK0VkkVrXW2JoS
	1dqtaG4rjfseCrUmYSuxdg+/lVsUFpEHm8VrQacmSlA6PRIlA6nw3pNjEVvB6zQ=
X-Gm-Gg: ASbGncuK3mLMqm1zMzdg38bgzEGZaG6T5NmLbFKjhLJ2lWEpDFmZ3h+re3rDXgEges5
	iL71sD8lQFe0pMWceSA8+WG2tGWm9zTgCEqBQQ/vy+zUECY+Z5bqeeTAiSlRYZTKuK0iST8pm4G
	o0759N8Fr9tT7RfWWAf9mxYmvd8u0EClcw6WGKVEnnyRjvQQpTelq6sQDprl7YAgvaggNe6KRgV
	UzjASw6d9rYlelTNK1xxZ1iHOQlLDmz1Q1oCTP/ShSc0mxIWf3ZSIwus7iSmHSVBgRpikGDUONe
	sfcl4zDlu7IFyKcJQ6lhUQETWdlymC6TSIhZubwpub3RRuiZqon/lsiJBp+bdIRThxeEhq0oyJq
	kSDNYE4IS1P37yw==
X-Google-Smtp-Source: AGHT+IGyf1wD89DJXcgW642MDWFrZO+pHlL+xumUMPnNlympatoSZi++X3uov9+a1oXYEtcPTWl+zw==
X-Received: by 2002:a05:600c:a00a:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-442d6dc7cd1mr139332205e9.21.1747146662687;
        Tue, 13 May 2025 07:31:02 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d6858626sm174090695e9.27.2025.05.13.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:31:02 -0700 (PDT)
Date: Tue, 13 May 2025 16:31:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert cnxt,cx92755-timer to DT
 schema
Message-ID: <aCNXpHegnr4_FjfT@mai.linaro.org>
References: <20250506022232.2587186-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022232.2587186-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_073104_262929_E24E1CA9 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, May 05, 2025 at 09:22:31PM -0500, Rob Herring wrote:
> Convert the Conexant Digicolor SoCs Timer binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

