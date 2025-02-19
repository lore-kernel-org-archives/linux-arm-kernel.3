Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A180C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdBoFnuhqMD4bPK9q59QOYbccPf40KzMHKr/84iucLw=; b=mF53wD406u5hwb6aEAGByDz2LK
	oIX3sO6vgnTk42PAjO0rvM/9q3AmRfctQvheDCDfsDKe6ln6VGHhlsFzj5/aPIDMqpDmq3PDghrex
	I8qpuHQEhTKfBqV4M8VrGpZuYa2ZoXszSm8vCF3SwNEMIgcg9M7d3yBk/sagTL1uPddl0bGcXYxIZ
	86Hj9V55h347JagQC2+tIKfKCk2TyGxu0Vlclt6zuBNJl5mB+jPP19Jz9QGkFoE9NWNy5tMkyIbrA
	gFnGKQGyD/x0esUoRcippcfqcc3sV8GiwKCSH3rPMIabzD6fKvOUhuEFRqBxy8/5sIqIreB4iBOxy
	QCNqdrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmgm-0000000DkHU-0Nys;
	Wed, 19 Feb 2025 16:12:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmdf-0000000DjAo-44Tw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 16:09:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4394a823036so71336205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739981370; x=1740586170; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdBoFnuhqMD4bPK9q59QOYbccPf40KzMHKr/84iucLw=;
        b=W2jTpBrHV29Lsme+rUKBeM55sE9dUJnqYYgOcRgaYt5xLzNR7huOTkMGB4Fc7N7iGR
         mg4v4++VNSGk6m0GMcaoy2udZ1HkrVO/PmySxfu00z+Dg7CBmW1syiVDNL8y0/Z0WNSJ
         dk0IXgr8yzEp3W+MS7skhFtPA27jdL6NghhIje9sovlK4OAPq/Ww2VbgOzJE011DZVEi
         9NxaxqCRVzLx8EO+HJysIyS8jgpNlxCfZCANVW6wsehjHo9H/Za/Em7VDmwUCCmpUxbw
         Ev5M63vxbzjzeVw6wFFTvVHUPXo/IQaZD99b13p6vFESn8ULO7CSz0yJAOhS5VEZ9QM6
         C3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981370; x=1740586170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdBoFnuhqMD4bPK9q59QOYbccPf40KzMHKr/84iucLw=;
        b=Kwc1QNzn7CO8RZP/XgZmOQyUZlb6anjRWOt1PexwPoqOVxnd98e6w//1/AHXyR32JN
         lBu3GzLKl/C89+aYcR4kttyBbyc7NfxxRfbyS3kwgWzTypMBYhLu4/uDW3GpB/uljl3Q
         /upK6jBODOXno/L1j2lmkc2Izn75oaDut3b4YLGr6CM6WTUnOa28+2BUyhsFAzsL88wG
         b/QYCtZVQJPmSayRmmXjF6Pje6psr4Cg0qINM86QsJPf/fwCBq3mTaIwOK8wzKHJX5aU
         6zRCFlDo3QZeoA+GXm7xXiEvbLStDdkXIJcTd2aBId3M9KicSZc8igIPOS+5YhkfA43u
         IE0Q==
X-Gm-Message-State: AOJu0YyvNDoB77FWCfxTi8JnvJkbhWmx+vsGMIGB6HVmB9t5SkVsxHqn
	wOZZaF2y/xVyQRFH8xqM0hkTYhpyndm99mEgzmww4gj2gngX7CTgT4I5YGDFhDo=
X-Gm-Gg: ASbGncsK9aYPnIYMLCcRUDMmscfw3Z/2D8lwzPDD1j1cCJrJ9MQEqMp4RksdYNJ83ey
	Mm8qkGwmFiM5zCFmnK8O1zm5lHygzNALAmK1H2sH15/fOnUhibuLnFjWpIDC9qMy3D1Wo9eghrQ
	/mV2Hgj8QaWlwsgynllMNNNNtHY4+cng+s+6pfhmGjdw8Sy7iQhY17wWv/jIikJjilgaTDIKwG8
	4qCR+Bn00ts4NAxH3Kr2218Wy4YFnoob0N+ZSMcaAKaxVPNlkLoXRrloCOqphpSp9u+T87411yp
	1ReNS75xlDoXKU0zoSIF0hKM9w==
X-Google-Smtp-Source: AGHT+IG87mSbuSo594YlU8iwWTPKAQqVV2chSBKXzyuZ7LJ3HKDzFEKHoFoqCd1APAlb8lVP4Vl8fQ==
X-Received: by 2002:a5d:64a3:0:b0:38f:50bd:ad11 with SMTP id ffacd0b85a97d-38f50bdadd5mr6657402f8f.5.1739981370330;
        Wed, 19 Feb 2025 08:09:30 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm3617686f8f.21.2025.02.19.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 08:09:29 -0800 (PST)
Message-ID: <f8f5b7bc-0219-4891-9ffd-f54102b90b45@linaro.org>
Date: Wed, 19 Feb 2025 16:09:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/11] arm64/perf: Enable branch stack sampling
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_080932_023255_407B9AF5 
X-CRM114-Status: GOOD (  16.66  )
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



On 18/02/2025 8:39 pm, Rob Herring (Arm) wrote:
> This series enables perf branch stack sampling support on arm64 via a
> v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> on BRBE can be found in the Arm ARM[1] chapter D18.
> 
> I've picked up this series from Anshuman. v19 and v20 versions have been
> reworked quite a bit by Mark and myself. The bulk of those changes are
> in patch 11.
> 
> Patches 1-7 are new clean-ups/prep which stand on their own. They
> were previously posted here[2]. Please pick them up if there's no issues
> with them.
> 
> Patches 8-11 add BRBE support with the actual support in patch 11.
> 
> A git branch is here[3].
> 
> [1] https://developer.arm.com/documentation/ddi0487/latest/
> [2] https://lore.kernel.org/all/20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org/
> [3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-v20
> 
> v20:
>   - Added back some of the arm64 specific exception types. The x86 IRQ
>     branches also include other exceptions like page faults. On arm64, we
>     can distinguish the exception types, so we do. Also, to better
>     align with x86, we convert 'call' branches which are user to kernel
>     to 'syscall'.
>   - Only enable exceptions and exception returns if recording kernel
>     branches (matching x86)
>   - Drop requiring event and branch privileges to match
>   - Add "branches" caps sysfs attribute like x86
>   - Reword comment about FZP and MDCR_EL2.HPMN interaction
>   - Rework BRBE invalidation to avoid invalidating in interrupt handler
>     when no handled events capture the branch stack (i.e. when there are
>     multiple users).
>   - Also clear BRBCR_ELx bits in brbe_disable(). This is for KVM nVHE
>     checks if BRBE is enabled.
>   - Document that MDCR_EL3.SBRBE can be 0b01 also
> 

Tested-by: James Clark <james.clark@linaro.org>


