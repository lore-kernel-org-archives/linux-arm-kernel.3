Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A31DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjJVOzsV/sS1KqYgiKb6WpgqfUC9eIpjHHMhaITJ/3o=; b=sK/layTZ/+fG/iLl2OKd+j2sKQ
	4C+i4zsSK09RwEjfUCfeEvppaErdi9cnuHR9YWHsr3bqsFNbPpfUbSYIs0CVysFKQVWTPAk0Fgdnq
	5fK43ATE+r1T/M0fnNfIPhy4BbXLSBKf29TNtKEPP3RJ460ObmVc2dmdzBh9OWEpt6rtRbOnx2IhB
	uYcBXwsDcRH7SU/sJiigokMuoeU13ww+Al79vVTR3LJO+dQXTQNGUhxUeM/7a1prr4JI079jtkHrL
	022x48TqaLc/QkTDmgzexgC9//Fvv4D3keDEPlPdTkRFfqRnJCwtErSYPetF2Vw1SjE9zUYkNtt+i
	yMmymcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbY5-0000000F2YF-2Mi9;
	Wed, 07 May 2025 09:58:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbGq-0000000Ezq2-0wOD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 09:40:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so6202355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746610854; x=1747215654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjJVOzsV/sS1KqYgiKb6WpgqfUC9eIpjHHMhaITJ/3o=;
        b=x2V29l9UK46tD2mE3XXQ/6P+dtJ+vttzE53GJEDy7x8AcJliYt4e2LhwwDeqCQJgET
         5lwV8qHMQMMW1tiq6CIFCS/1l6aamENKKZSyM/k0x95mMOueIU62uOORHbVcRQPEUEj9
         OkubkF9pYTu/bpDyMmh0TaUYFLMWFXyc3lnqQgBhj17sSMA6Zw2YZ3HCaIS6b1nzoKSb
         xpaI/kN3CuAVMAe3YEh0ZyUNEDqy2Zk9i+SjK0p53jggmfABcAq0yta8pl72QUe9KKbC
         Z2Nm5VYwvbEYGXj+yord3B7FOf5RcZSfHT2b9PrODbVLiIV9C/cMiBHoHV2nDmfeUI3v
         pNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610854; x=1747215654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjJVOzsV/sS1KqYgiKb6WpgqfUC9eIpjHHMhaITJ/3o=;
        b=tl3PSiMTPRbxhFVS3pBvtlovZtl+dZE2e/p47f4sU2kl2jSprPOAmEd77s4uZV7qL6
         UWTgNP5roNtV0YpH3JAOWuFwmEvrZpUN7kM/NE8ue8MoQR5K2DDSFXQ+1Y7wvbz/M4+e
         rA4rukVyHmL/cfqpqrCyi7WGsH4ineTNv7uaaPFrcAXE9wJcx6ME5HpFJcbhY+zx5UID
         3Z/LSFw88Mz/07skCk8+8cbeH9u5uEQ2Ix3k7gjvNqgT7aJe2uRzO5fgmwbYZIHcXz+I
         wJ2gU5TfXbeJCWBnlxGEUY6tO8HxSoJ+cSDlUA9Nl6afHYema98cL9RE7+e9MVwFY1WB
         aPTg==
X-Forwarded-Encrypted: i=1; AJvYcCWXumcOdw9ZHirrYDNpvQt1MuZ6woti9hDtnCoHeE7ciON+iDLFGpH+90VABShZlPptuYnkLQysWzZ/iEVg36TT@lists.infradead.org
X-Gm-Message-State: AOJu0YyudYf9NRni8fzHhlBKOVFZmb+HXX4PhgkUV/KPltbeoWTRk4Cb
	K4NWormBX28Evz0cmwTGNI/TL0DwkeQ0rtfYwPIrnCDW7UmY8yMR1Xb0/mAd3Zk=
X-Gm-Gg: ASbGncvmRwKdSJaIUwQXfLRnLwNu7IQrtSsJF+Qy8C4xYg7fo6VmZY3fPD6iMk8LhJf
	05Lu1/oSeOAJF7f1NRKlodfCs0D8TKByz09rCvNs7g8jA7yXXXOm58gutWdw2COA9AwV1s9SA82
	h2MrqYDr4kVm+LDncUYvfikgi5KgwTdg+TYu1B4eHvCipu0PP/TgungqPodz/0Ov1TLdk4gLF2/
	x8ovr1AYOmpDaEnIeUsYi63BPgveNGorw78zyL+LF6xZ3q3hPgpFMZ03mTyULeZ3DYGLxxE9vtM
	VCQRiEEHcJqbYW48R9G82PiAGUl0AMI7mbJyalw5sHA6dY+S25fuIJ3uffA=
X-Google-Smtp-Source: AGHT+IGTYzGThTxOdxwaI5G+9aUb3aVHRykaAtXbsesYBP9DWb7wZzv8RquKPzZDNQ1IOuOLVdxb7w==
X-Received: by 2002:a05:600c:1c8c:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-441d44ed543mr6268495e9.9.1746610854412;
        Wed, 07 May 2025 02:40:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d438e7f0sm25374535e9.29.2025.05.07.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:40:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, stable@vger.kernel.org
In-Reply-To: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
References: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] bus: firewall: Fix missing static inline annotations
 for stubs
Message-Id: <174661085321.105567.10502174461599708056.b4-ty@linaro.org>
Date: Wed, 07 May 2025 11:40:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_024056_276167_549EC3F2 
X-CRM114-Status: UNSURE (   8.37  )
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


On Wed, 07 May 2025 11:21:22 +0200, Krzysztof Kozlowski wrote:
> Stubs in the header file for !CONFIG_STM32_FIREWALL case should be both
> static and inline, because they do not come with earlier declaration and
> should be inlined in every unit including the header.
> 
> 

Applied, thanks!

[1/1] bus: firewall: Fix missing static inline annotations for stubs
      https://git.kernel.org/krzk/linux-mem-ctrl/c/66db876162155c1cec87359cd78c62aaafde9257

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


