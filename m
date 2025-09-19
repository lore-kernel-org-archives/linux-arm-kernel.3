Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17131CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDz0HUmxQMj6JfUxaJgfV0Ve2eC/UQxPjQKEq7AEPeQ=; b=TOUVlkIKti0vK22fc8WZxrtL0J
	o+7R2jcD/oxUYvI9nGhp1gG3ezpjyxBFChZSoMq9AcAkwiQK6ut1gH9Ci5kS5Z8jql+szcqyNryoC
	f24g+kFO7Q1Mxwe9pOMjjsfrlD0b+JuXPH6+Ts8orp5QJH0B6F4FJt1kqz9xRSy9OGzVGog0WHYxP
	01r6g6ebXZ9ZXHKGhuIKVbwHuET0n+dnnV8SFVL4iwfgnIbWJgfnukVygEHmk6iBPQLqvxiQUbLOA
	8GyYfGwyJE7bqdDrrZimBDYzYbXFwkP9mMJtMHMwiIjjdVJOuDAvnA+kERRMJeWsRk6eWKAe2bElR
	xnGV43ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze9W-00000003YPP-428b;
	Fri, 19 Sep 2025 16:40:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze9U-00000003YOV-2g8j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:40:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso1983762f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758300003; x=1758904803; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GDz0HUmxQMj6JfUxaJgfV0Ve2eC/UQxPjQKEq7AEPeQ=;
        b=nBwQ6gpaonwlPqK7AvESjznOhIlTVIjWoUcKWP0ftkZX0bKmmN3YR88YOCq4mGbD3r
         aVKFe7RioAFxdqA3SBjz8bNNM+QcgJCBcZA5zdeLal75hO9reTZ4eyWJJFceJJI9fRr+
         8oA228CecrFTCaMCSqUCXYb4+pzcygPVR8bB0G5XqulE2gaE6KBodktzPS3HfBeaRtam
         +VksylvYzPUu0bUv69gdDxBcI9XACYHpfcz3jx5u3t46l7V5QcCJMN4teBknphLmOmnJ
         8Z7rkNYvkX1NAs4+rWNLid/TuhGSnDNc2CU5KvjMJcoaeQEVfvy5Q3QqlAnsyzVMuBPA
         QMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300003; x=1758904803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDz0HUmxQMj6JfUxaJgfV0Ve2eC/UQxPjQKEq7AEPeQ=;
        b=JugS/44O2i52rudTIq4Ac7obozKG1G9epIQBKRV4vqBn8XJyjVY8Stv/lFxPexu7yA
         rZNj9uNthGpwAeQALsyAT20pH5Xj1H3GOqU7A2YC+YF5YRjlM2w4jg4KQr694ON26Jlk
         oiInKzo+o4cJGIc8VXyE/tI6v5bz/tITnqi9gNmV9kIoEi0+PABc22OxRuigBS548KOI
         CC1h56daQLppks4m4vsvxpnZxCaUlR10w4lKgi6/eO8rjuOi+XOhxTq1/1IIwCvFV2qw
         fnizEhwRVuAL3O8Wwbo7bwjt099jEZnN1gwaMc7IY7fMMhxAeROnJfiCtdYIQGXALeba
         VIFA==
X-Gm-Message-State: AOJu0YxBJUj1Io70+Q7hCOEbqpIwHnDzKqc/STGMSLC6FN8YEj+xH4i2
	k424VQ3yKdX5iGF7fbA+aFxeXwcV96MqvXWGiUp6QAOcx8e35R7qS9gy8zSSadfT7Q==
X-Gm-Gg: ASbGncv6MIx9hkw519WfIfVwTb5y6iJM5hWFNCuyqPD/DEWboEnlsOaGXOXWuPAVGQm
	qVUXcsLP7O7pGkcHsWsvH3A8fIgzXulvl5zFchQuJRQrddCVMXY5Y0KZEfIr6pAW0Ab2uA7n4eK
	0oSS1COIRJoH7CqlKYKfZpb616NXX2OC1ucLMxfqKF1eV2I3jh2T6/LvScrAJdEtpBJxJNGmW08
	0VK+h7ROLUcymrvyJ+O+FjwcAUffaUjoPO13/LLMuzAftQ1KJRt1zqAaUvVS+G1XWnRjohSVylT
	1/HEy8E965rNHcWOJtU7C1cmJaYmz7ZnZqf9BF0jy00KGSfN7GSPnsQmPI+XjKM1lEYCXDtGoID
	rdITeEBfDD6HhVUz4FNWGWJVO1AWQYmDiWxfaAU8VWrV8RBd5M2YM06L5
X-Google-Smtp-Source: AGHT+IGu6mx9xF/KpgWa+Ws5nc8mB0EaI0MQ70JJE8g45ggZtRlbBaKCVGwil9FkQGJGfwXu4YDS2w==
X-Received: by 2002:a05:6000:605:b0:3e7:5f26:f1ea with SMTP id ffacd0b85a97d-3ee7e0116c9mr3218272f8f.20.1758300002660;
        Fri, 19 Sep 2025 09:40:02 -0700 (PDT)
Received: from google.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7478sm8458140f8f.38.2025.09.19.09.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:40:01 -0700 (PDT)
Date: Fri, 19 Sep 2025 16:39:59 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dylan Hatch <dylanbhatch@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fanqin Cui <cuifq1@chinatelecom.cn>
Subject: Re: [PATCH 2/2] arch: arm64: Reject modules with internal
 alternative callbacks
Message-ID: <aM2HX3BVXmNvCT3i@google.com>
References: <20250919122321.946462-1-abarnas@google.com>
 <20250919122321.946462-3-abarnas@google.com>
 <CAMj1kXGaT5Kf9=v0rSxW5TB__vDN=iPK7=+gDNBO=vTPrd_4Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXGaT5Kf9=v0rSxW5TB__vDN=iPK7=+gDNBO=vTPrd_4Zg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_094004_698121_D7CD8975 
X-CRM114-Status: GOOD (  16.15  )
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

On Fri, Sep 19, 2025 at 05:01:09PM +0200, Ard Biesheuvel wrote:
>Hi Adrian,
>
>On Fri, 19 Sept 2025 at 14:23, Adrian Barnaś <abarnas@google.com> wrote:
>>
>> During module loading, check if there is a callback function used by the
>> alternatives specified in the '.altinstruction' ELF section and block
>> loading the module if such a function is present.
>>
>
>Why?
>
>AIUI, the issue being addressed is the fact that we cannot yet execute
>code from the module itself when alternatives are being applied, and
>so the callback must live in the core kernel, or in another module.
>
>So this is a really big hammer, given that it disallows all callback
>alternatives, including ones that we could easily support.

Yes, it is true.                                                           
                                                                            
What about we check if cb resides in kernel .text using core_kernel_text()? 
Pointer should be valid already since applying alternatives is done after 
relocation. We can shrink the hammer a bit.

Then we allow the callback from inside the kernel to be called from 
the module but reject modules with callbacks that are invalid.      

Thanks,
Adrian

