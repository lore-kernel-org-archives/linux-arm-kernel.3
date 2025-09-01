Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8994CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3XJYMdC/URotMh7n5CnqQT+z1WEmHwh4bKzxafFeMU=; b=WgpyWK0rnU4kHROqZmwpTz5Gpf
	UHLsUEeQ/iNalBXlsBMeCVHgokeWBPhr64jGjNejfUMLoDNzIVhFsR+41GW10ilU7Lmmp+a3gXEDi
	lr6HZyawHkO6VsJ36jMGhTuLPh9qhjFvCxVFtSc6M+wx/j2oRgCuNuXu1DcVD0QOjhA9Wv7X2brQa
	XrXKEa58R0e2ZHPFQOh/YYdAiX+EP0eI9MQhj0UuczRyrbfMFYk78LHzZ3nC7DA36n7Df5mBzDWda
	Dk/eSATc/5nLmKHFBfcVQ5f9LcfL0Uiq0YW1dnPOq0lcUw2DS+qyg58ILMTCMjjNJYrOL0STPkNBa
	3wq2u5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnI-0000000EIHu-39Fx;
	Mon, 01 Sep 2025 23:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAxR-0000000DlC0-1JKm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a3XJYMdC/URotMh7n5CnqQT+z1WEmHwh4bKzxafFeMU=; b=m+/h7RBmU0t8X8RB2na1rDh25d
	LNCiT3bSg4ifQmefh39JLI+1Z5LqlKYb/J09csGadHMzGYX19QaDmSq8kVWGWcyR58xx5X0N12aLj
	gxZXsHB/+/BrSROIgyT/wi0DIwx+OFTALy7CtZUFWXPUmwJFiZwiXrCXF466C0v3f1hjaDlIGmNic
	mEAAlf52MQYuOCoC9TQgTj1kan7isUGNsUM418ZwKSHA65jI7JSTlIhY9JB/yYtkkgxZ2x7q9hDJ/
	ECZEMKpdBhUREr+g3M3VEemcJvTcjDVMSUb6+To0ON4PGwmz0nlyWTpVqUngAn+pLcPbPwcBBL8Uz
	4O9HJxYg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAxL-00000003rjC-1Jgc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99F5643D5A;
	Mon,  1 Sep 2025 20:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54322C4CEF0;
	Mon,  1 Sep 2025 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757805;
	bh=CtEv3CBI4kkNr2BDMp6aV34tV2Uzi0xNoxhyaCK/+ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sksU0OGemksLoVqZQqK2MeENZMFvIQrqhFj58IivMXRTbo+PasivLrs4B/Yi+Hf/Q
	 CXEjb/pToy2+CxyeqF6jLALTPqXAztjRcdVSM/3orskQzdTGmEYN5DrC4iMeRLfI+B
	 yNkRg0JoYY3k1PeYuKar7wSznc737viPC8QhRPfpSbPGlU9teXb7lQkfGBtVuSA/fq
	 d29eNp0bm7XMgYk7rJw4EH69RrwRAzId19NmrYA1EAK7MHATMWysFICcvbq7iiYxrf
	 QmTtd0NmIpuOY/XLl+YiPlphDH2+i3/1gx7q5Kjhik/uy/2EMI+sXT5RROQTxYIp3m
	 XnOcNIHsiPVMg==
Date: Mon, 1 Sep 2025 15:16:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-spi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] spi: dt-bindings: samsung: Drop S3C2443
Message-ID: <175675780389.270864.9232160041092038362.robh@kernel.org>
References: <20250830132605.311115-3-krzysztof.kozlowski@linaro.org>
 <20250830132605.311115-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830132605.311115-4-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_211649_829957_77C50FD0 
X-CRM114-Status: GOOD (  10.18  )
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


On Sat, 30 Aug 2025 15:26:07 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


