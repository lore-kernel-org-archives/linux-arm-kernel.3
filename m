Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9F3C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JNZR4HYw3LEusKe1YuO93jYjF39HJIbe/sxTu0RO9o=; b=IsZst1fWtb5GLz+NfLCMjCm8M4
	v2ASU2FvOxSVk6y/RlzcpSxD0nO7LUboNG2qBa3BrVLDaS5UpnnY8JPYuUUaQ8La27QZMooSJIjIp
	U+EHey0E6Yp91UidXlITPfzBROr5S5tib1I/SvDy23vt7sJpNSws+NR9JV8KENWsxaIKFMBO+erQF
	KSo3Ul/DkdV7yxNTDtCBocu1oSHYjQwxTTxBtK9r1FiYif8yhowNWLLHKfc42ky2LcYKBjHXHdSBD
	8TSPGvRSCo3iZpVc/S+D1Xg+pgrKMZl/RS3wAs/9aE5LVjJmovJGQo6V4/mKuQ/jTrYi8HQ14FoR7
	qNq24voA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Gjw-0000000GqAO-48Eq;
	Fri, 25 Apr 2025 10:57:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FaM-0000000GamP-0VbQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:43:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so1254275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745574185; x=1746178985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JNZR4HYw3LEusKe1YuO93jYjF39HJIbe/sxTu0RO9o=;
        b=dlR31bWdkR+frdlLxhn1Xjrg4CA7dgG2w65sF5848CifRdgymO+AML5UlZN706i1DD
         QjYId0A07bBWKB36RugPEQianD45+n7PYY4gZa5mrjtR0bZGvvpLRb2OhWOItfDGyMq6
         FYs61CGvMFIK029/j3xWuPObmYqqj9+QYmP0tV7f5qEE0UWCtM7FPWvUN02PbAXbZGjl
         krMxYl4TJBA3vRnNcXnpMXyKLiTxNO5qNN7fvIWr8wWzsE39ZF4ti/L6fQRRi4q2n429
         Ztp1tYYxo+xDiCVPfYyXZm3kforNOXxfvVfp+XX8ktGfMpfRebtWUaND9w1oVQOQzV39
         K49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574185; x=1746178985;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JNZR4HYw3LEusKe1YuO93jYjF39HJIbe/sxTu0RO9o=;
        b=IrwZ467k/HUsrlF/1X3n9WcGM5gPAwupkahUCr1UXgKwCSYotCqTaPLdF5QCEiSpWH
         WaYBHbtAw21wo1GXk5K6aTWPgjgYSuXwBB+mmctnZr/GSn33hnhOPPM4+uNnhhh4R8PX
         cyFOvMV+inQUuEfsBG4whOXwLzBNZK/itNc8kEL63NDdxRTS51AjuBg+Bpp7UeZwZgYV
         IMbUDhuf3YoPXkXvLIityLMRIcMa7RrgnsSOG/63vPqWiI5C9bD9rmi6vgYwJKeMnaBF
         7GwXj1VuWAJn4LG9VHSl9ILbjgndSyxyAqhOGBWXDKc9M/f6lj/nqPgKnFO0Gg1S7flH
         o+9w==
X-Forwarded-Encrypted: i=1; AJvYcCWWY5rGO93q0udPB3s8kdgG38c5zQzzj+8X9hE8YQ5yhE+mZhSd98h6ICnjgw04mKhhvOxf41HG8kqrGnq1wu/Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwgTomdlWnmVL600afm7E2YSe6dXk/UctiELUrLUzmfFDh4wmnn
	2yXN6BJ1o8VWZoGI6lIBAhEce1vGq/KHAXk8sXJz66BE853ySlfF/BYSO3qgWLo=
X-Gm-Gg: ASbGncsRYNKTx6dbLWuIdeDuuRyGzS47LG8ERh5IsFT7WU3GU9C7UhRyWvDP3MBWYk0
	yRmPsGA3IBBvTnI1gzzX2UwBH+AcRtFbgxyfxDXjSpPiivrVZqqqbBVgBn+4Y4gDE8PDb4xPwcm
	THOBskPlWekF4c2Oa6I2sp02IbNEkIu5O4KxMUIv9IcPSIwcS9VtbfUJWHC7U4ZZQE8hrWdi4WX
	5eahUGQiyIk4kFD0l7sMVovqOQxksx7aZxkSVXzvB77EtgQHGwAnZ1Rr0cMOFu4cfZvcQbAtPxJ
	yxX7DWDLvmZzotLWObK4LQcdW2XnNaUgt1fERdUimbPkwQ0ozitWi9Ve6hsc8FBIB+qDQw==
X-Google-Smtp-Source: AGHT+IHwjCg2l2T8eQ2xx7s1I6SBtEwT1v0ZPwhP4gH8i9QmjjIyMGHi0pgA/ILdNqanVVT9KFG0TA==
X-Received: by 2002:a05:600c:a016:b0:43d:77c5:9c0e with SMTP id 5b1f17b1804b1-440a65b9f31mr5514995e9.1.1745574184616;
        Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm19441395e9.2.2025.04.25.02.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
References: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: samsung: sp5v210-aries: Align wifi node name
 with bindings
Message-Id: <174557418347.69534.14818406256257839510.b4-ty@linaro.org>
Date: Fri, 25 Apr 2025 11:43:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_024306_167657_9B2605CE 
X-CRM114-Status: UNSURE (   6.39  )
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


On Thu, 24 Apr 2025 10:46:55 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'
> 
> 

Applied, thanks!

[1/1] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
      https://git.kernel.org/krzk/linux/c/e0d7c81b15e8694ebf9f1976084435728b8936ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


