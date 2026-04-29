Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5807BFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XwGRnQC1kznCkI3mzdzwu79hRIMT1AKu7AFKtwugjw=; b=nSuit4Es4EUOVX5SyWKxa6ZOyb
	giLKWv7ovqlMqM7sDL4l0hNLPxS5YBQKU54jsuINJ1wF3ONq/OADQbRPkT5fXhWFkGKrkdnDzW4I6
	Qru0dj8JouYRmFrLOwchPckVT5o/NPjQ/X13HXjfv5B/RWHHLkHe7hf5XR//z1DV4DQMJSvJeVSCj
	5ErtOiTo/K7LCm+aOv3+dCyoOyEWSCNqpU4yrWpk2z6ecmL8c+E4DKMx17+yPsToXmTq1W6jxmtm4
	/MF5G5JinOxdukKJAuCpXRXQ7q0pi4FOSyVL3Xo89ztuW78FYMgQgzRN1x1hTbzDO5OCT6N3lgfce
	QazYecXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2jq-00000003V6P-2kAc;
	Wed, 29 Apr 2026 11:05:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2jn-00000003V64-3a8O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 11:05:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488b0046078so111871135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777460749; x=1778065549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XwGRnQC1kznCkI3mzdzwu79hRIMT1AKu7AFKtwugjw=;
        b=YscWwWTi25YLktpGg/1ie88FAzrfM69pVnrkHSLithSOlomtnPe16rFnKHF1f4RrYD
         3vKGtl0x3KOoGAewpAUuW6KtiXfZLXTRlQR2YeLPxFzq1wm+8HhICAgfIM3JMYFG//UO
         M1E0KjZfIYAFcL59CP+X65MPSwyiWbQUWyl+xfDp8wqQgnqKJytpYSMnOqfNvZGVCmUd
         5gCK9X2mDCvebQWn9oaqR8+RDz9c1uRX3Xzi14f1Ja5HFVXx5vBbim3YWNgyXfm6YZTz
         SrzX1Kv+4pgUo4Luu0LuUmQ3rbLf0bBI2vK9X/nhi7Y9jFGMvRh8oAYEz12iMTZ+Ck+M
         FmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777460749; x=1778065549;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XwGRnQC1kznCkI3mzdzwu79hRIMT1AKu7AFKtwugjw=;
        b=lwA4q4Q6HLBHgmV8oRNGZGGSFdvdfgcU+m/0/fFP3XQmUJDZKiKzskzdVRqGnjUHxu
         tS7gIUVKv4Ge4li43iROePKDLdoV80w3DR8FcFHx0r9tJPtgJcq3HFDsLuMlxLkaRI6p
         i/mdhabWYQhrPoMB1v7fk2qhS6XgR/f+h4FqVtl86xL7loXgBwVS5Nr9SOh4XXv1a9k3
         OE2/xa6rHX5unjIrffMoRX5epXcDm2i/mdxhDyrVSKHhJEXR88sNdWz2gBsws+LjQzzW
         dFqMBNX5qY1onyeukQHwlICxCQyMc1b7cIaNzJpwPBWnoSIn7ZCkV4uEWVcaSGBnP6fF
         fFyg==
X-Forwarded-Encrypted: i=1; AFNElJ/4izOiy5XeTvzq8tT5iRJcYpi3AWEgFA4T0QhrscZJc2OIwQVmhTs5op0MfE57ndYEsK+6jkKJZI3O8BNGyrO4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnx4/gDaHMvFfEQGOa8gEPUbAvgC17UAWPTYdsShcZscdZU57X
	Z4JVfNaVTBTr6U49bnKBavC9e2GSzNrBrKwgEDoNhcOCppW/shHd6G4k7GSG+TIqTG0=
X-Gm-Gg: AeBDieuMoTuNmilRJ5ZtJCR5aI1UeUn8GKqPd3BlIwT+GgEtItBSxJD/OAt01go4K7k
	Zoyr7e46AG5/U4VJqnLEBMIiEu+ch+qQ+3S5dcf9MSYBNkKTkTMCC0yLTf4JPeJQ2xnRR/xc3g7
	Ng2NXYJdiEIg1eDye6bS7oMviCVMaXD52pXdlDlH402XQQ0uBek8qqIi+/9qKdfxmhUv2izvqN8
	bmQ5Z2becJdMXyqTzFgjs3wYx0nM+VOuiMECqVjpHx8wnAzI8uQVikX+LOBMI6VG4UIkROCbwp7
	4joeVAUATczN2SRjPRq1h/EP8j4YNDAkszSYvYn/+Z763i77i6mIOWX0PZesqep5x/LaLkeDU2y
	UWAptaNGKM6ZzhgkKspgWG9AhQ/UME466y8jNhP3FgNP+6gQROmEjeM61Gm5ojmJQbRyuwZH66e
	ct2Efi5GQ1sg8ftT95afJIAbJsdfvFXl33t26c0uayRdc=
X-Received: by 2002:a05:600c:4f92:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48a77ae5430mr109685855e9.1.1777460749283;
        Wed, 29 Apr 2026 04:05:49 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2fb999sm23367655e9.6.2026.04.29.04.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:05:48 -0700 (PDT)
Message-ID: <6d21cfc8-4686-43f2-a320-1b9505d38338@linaro.org>
Date: Wed, 29 Apr 2026 14:05:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] firmware: samsung: acpm: Fix memory ordering race
 in RX path
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
 <20260427-acpm-fixes-sashiko-reports-v2-4-1ff8de94a997@linaro.org>
 <6bba950c-5527-4613-8c16-b52534bc75a5@kernel.org>
 <4421c95f-3ee7-40ac-b239-d877709b498a@linaro.org>
Content-Language: en-US
In-Reply-To: <4421c95f-3ee7-40ac-b239-d877709b498a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_040551_943601_4B416B80 
X-CRM114-Status: GOOD (  15.29  )
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



On 4/28/26 3:57 PM, Tudor Ambarus wrote:
> Another thing that I thought about was about the reordering of memset
> and set_bit in acpm_prepare_xfer(), but even there, the internal
> execution order doesn't matter. Both are guaranteed to be completed
> before writel (wmb).

I need to correct myself here. While the wmb() inside writel() does
prevent the hardware from seeing incomplete state, my previous
statement was slightly misleading regarding the local CPU pipeline.

The wmb() alone does not prevent the CPU from speculatively trying
to wipe the memory before it actually finds the first zero bit in
the bitmap.

What truly prevents speculative execution here is a strict
Address Dependency (implicit barrier). The CPU mathematically cannot
calculate the destination pointer for the memset() until the bit in
the bitmap is identified. I will add a comment in the code describing
this dependency.

In what concerns that set_bit() in acpm_prepare_xfer(), we only need
to ensure it is visible before the next TX thread tries to allocate
a sequence number. That is completely protected by the tx_lock
boundaries. The RX thread does not care about set_bit() at all — it
only blind-clears bits based on the rx_seqnum it gets back from the
firmware. I'll add a comment documenting the set_bit() safety as well.

Finally, regarding test_bit() and find_next_zero_bit() in
acpm_prepare_xfer(), they are functionally equivalent. Both are
relaxed, barrier-less reads. The non-atomic find_next_zero_bit()
introduces zero concurrency problems because this phase is strictly
a read-only search (if we read the bitmap just before the RX thread
frees a bit, we simply skip to the next available one).

I'll reorder the patches and put this one as last in the set, I want
to have the find_next_zero_bit() before it, to not touch the same
code twice.

Thanks,
ta

