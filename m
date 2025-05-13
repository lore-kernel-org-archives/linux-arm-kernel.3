Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13220C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfD8KA5bfxaU+Q1NTIOmhw+vBh6gQYcxk5fcGmeOrhI=; b=j9Go1zvahStXSsMK8yH85hguaB
	7oSd67A3YpC5HioepZAnAJ4LnoZcs83WxYa/omTqSGhjvz+N5UMDqXyhelhwbP4VHT2fg6GkTZm4U
	3+mFOMmODaDsOdxepkm1mJeDjiLxFCi9ZvFitIALx2NQuZvWlAQCDRJjcJoNTeVzcRRuI411UUf8d
	Yz+GSR/ClIpZrSjyMb8xMPaoX4bSMkwRWr69AHaL1jowUuP9RBbIU7/przuzfc55ViZwZQamT4hcT
	hk7LsF307AdY8j/VdhrY7LsHmIuqRFg0+mfEEyyvLeP+XGeVyFUIndbh5cYJltIVO9IJ69vX9J6SB
	ZvZRcPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkns-0000000BkIK-40Z4;
	Tue, 13 May 2025 08:15:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkls-0000000Bk9y-35G8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 08:13:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-441c0d42233so5520955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747124031; x=1747728831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfD8KA5bfxaU+Q1NTIOmhw+vBh6gQYcxk5fcGmeOrhI=;
        b=dyxiAlvH4jSAGJ6asL+c5YjZbkZGKmfEYN66z5/C6xi/pvMTaRGCEARIMlyKC6Of9S
         vrU776mB8XiR1eRF+gwPKOmyppCZks7g0SYD+ki/zXVPRkG1m2TaC7r9sJ/cUnaoAMJN
         d5RLRNu+nvGN3z+5/gDMgcJjamrdeyYXNGQMqtQYpOvzuYlkmK97nOshpGh6Irky4U4Z
         NBQfZkgPa8pfnBJ5kCHwywQMB8t93GU73zvjHFNVFOl+0x41Pb3rQL+KTuUaoYW6S1Yh
         2WKPnPrPA6YlB40ha340W1Q2IBgTCuWqz4sKJVzCsuYt8A+U7Z7QiByFS4799G4IjSlW
         g7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747124031; x=1747728831;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfD8KA5bfxaU+Q1NTIOmhw+vBh6gQYcxk5fcGmeOrhI=;
        b=c48F1fnFAxBBFrGPtmcMePmNVxi6/2Rg6MLJNvCZoV3qEOQFJkvDvlPqSaxC16e2qJ
         c4AvcNRaUPlE/vpbxVq2ezgIbPUNG3uAtgXcYlG3qbRmQtDK9WfZ0xW2tFpO607K3vZY
         W5O9CnzwNnz8MUmnAc/aQuSdZjVOi41TJUMiWjeJLd+BJKxybcOdbTQnrHXhAe6Jlhme
         DuRsPy8vuaEI0fDDHeCvXRvGuxBuI5V97Kxq5mdS50kKVIPDQ+bsvUulb0oeJIKbmnOX
         0h3DOp+U5NzPysvWGTdMiE0Gs196ePlkkMAs9YMfeC+CAENRueNwkZXt2I6GGQQJpOel
         0RRw==
X-Forwarded-Encrypted: i=1; AJvYcCUyzCkO6zKHV/MFWRjlXA1YMLxFv+UDlHGMDzVykgPyA9g07zguEo4cMvvIeJ5topM9BJGWSfsiiu8j8WAiCs4Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwFbWhciI59oLJQ2JLktXLrBNHhcI7563s3Bv+zkU6QgMHxNxcG
	zkl2PZNgvWMnh327BBLbHXg3fv+M53J5S6c11nnK8ND0yG5KJjXJ7KVJCKngVCY=
X-Gm-Gg: ASbGnctCt9iXAgrz/tReli/Aqr/O80IIkTHL8wPkogLngtWy6O4OmVKs2LpINF+TiyN
	qR2hd5Wk0qBwvCDNU6w/N3dFZIhatZH4EJmudc3vCnwa8vdS8MOyORQG71+gL2K0gqYAUCIRv0Y
	dxffgLSYTHkLvYI6+E7UgHllOg35uhGeyhIMp9QBueya5nXa8IicaDxMmSfuW8XBhKHem3cyQRH
	Bpi0Q0z0802QQxL2nhBHzAWlqotRml17/mNwvORSxWYgJm/fT9dp/pw+4yGAXFxhSlDcE5+51a8
	NQQ3EKiOMmaRjFPKp+ADJQlCJNDOCKeCzURUKg4cuOFkuxtktsndeypThyhSNCNuvFGSJQnrAZc
	ToBx0tMuSi+/bks9uSg==
X-Google-Smtp-Source: AGHT+IHI0BUvRWvY4Y2/8bHQXKFDvKBHupqbi0BQODrVBg+55fcuB5CxUmKYcrieaLRvHUYS/EkBCg==
X-Received: by 2002:a05:600c:3490:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-442d6ddd6a8mr47990065e9.7.1747124030617;
        Tue, 13 May 2025 01:13:50 -0700 (PDT)
Received: from [10.61.0.48] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687bdc0sm155170805e9.39.2025.05.13.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 01:13:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
Subject: Re: [PATCH v4 0/5] Fix gs101 CPU hotplug support
Message-Id: <174712402896.10876.6908975403195941350.b4-ty@linaro.org>
Date: Tue, 13 May 2025 10:13:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_011352_788714_FB0FA811 
X-CRM114-Status: UNSURE (   9.62  )
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


On Tue, 06 May 2025 21:57:26 +0100, Peter Griffin wrote:
> As part of an effort to make suspend to RAM functional upstream on
> Pixel 6 I noticed that CPU hotplug leads to a system hang.
> 
> After debugging and comparing with downstream drivers it became clear
> that some extra register writes are required to make CPU hotplug
> functional on these older devices which use a el3mon firmware.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      https://git.kernel.org/krzk/linux/c/0475b0d8a1e0f80a47536dfb19c28dc4bb6adc05
[2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      https://git.kernel.org/krzk/linux/c/83b66cdb5d5b6aa4ed1f085b3b2f917af0c2890b
[3/5] MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      https://git.kernel.org/krzk/linux/c/20adeaca8bc6a084f2610e7c89a8601c9904a0e2
[4/5] arm64: dts: exynos: gs101: add pmu-intr-gen syscon node
      https://git.kernel.org/krzk/linux/c/aaf02428fdd50b818c77644bc0b8a0b282ce8ea4
[5/5] soc: samsung: exynos-pmu: enable CPU hotplug support for gs101
      https://git.kernel.org/krzk/linux/c/598995027b9181ada81789bf01fb8ef30d93c9dc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


