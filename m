Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B4BC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odA1UbFuInXahoaueYcnkzROOat5/muuif/VvbnJ9j0=; b=GvmmEukSa6FcUh3gcVQjdD13W7
	3+QSAtFFeyE7l/1WgeSd+kxHzWn0yhzmQAcnxfbRXrEh6aZ85OohvHJGAGRInCW0Nw5ixZABR2yjX
	vCXV0dFN/2VD6o9ZtT41jFO57To3vdleOSEYjSC9LF0K36w7Y5vKugGewrocbKUA6Qqj247KNwWVV
	V3TsxXV5NsiX96o6FPzRPFfQ7jTCNDD1mcU5dtSu96HFnVrLsDvRdiUcYzLkDODpDGsPVfqp+094x
	JPc6trXJLkPgGoixZCeJgua7hLDqkVTAwC2/t6/8HI3AyPPP7hLZ6ObglufOa1tCOkTgfnCN/uKt+
	CVRYRb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyla-00000004CRQ-3Wso;
	Mon, 17 Feb 2025 10:54:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyUZ-000000048PV-1k04
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:36:48 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e064eff5daso38941a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788605; x=1740393405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odA1UbFuInXahoaueYcnkzROOat5/muuif/VvbnJ9j0=;
        b=PDeIXFhNHfysfnhN0qA3rnMBd4bR4qWRhKk/N2XvnfrhcI+kDRNZ+QQs0YMmRFax1C
         Qa0JLCUrPyNRxlbwPpGo13cP22V+JzcFFG5aI+9U2Em/vX/F7+MTHVLhI/Ae4CJPqdI3
         GAMIrTuSUhQiyXXdd/hSRQ32Zjx7zTcIr7Qle2suTwL/DBxdwCctc11Ciz3GWxdc1z7M
         1qsTA2547LNI7ihlEO7JpjgtewgvddzAfeQ9kkFp+APIRePG0g9ttFwMYPnp5bCsrttP
         1IexNZBbDSs+HxR0i5a0C4uD7FyqCnEXCv5vlVd0nT1GMHt2oyCKGeaQttEtX9CnSt+S
         VExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788605; x=1740393405;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odA1UbFuInXahoaueYcnkzROOat5/muuif/VvbnJ9j0=;
        b=bMfWwz4fia2W84vbuVmLfwl5T4DaeZDDPdm6T53vkoHjYZMUlQ6RY8LvxynqSucm+L
         PB649aTASHQROY9hmxVH9hmZ6uizH1j+8Z6eHvHquaC1y38QSTDJAuJtCfG2EaLoS3Kk
         0vhKZtAXWCgEL+TD7xS50qDyiKS+ggi3felf4KY6yV2WliV9ibvBNCEN334+cREKAae0
         JFMiRQ2l1Yz+Wfc911EkHh5byPtoHBr8YTCU6LL5pF9OrCc3MNeo9xB/slTikz4Kcmtl
         wMav7xaV0+1px0zDgD89fonAx2tXsuN+Vm6X2piLdDxRnMrbMC7VfpforsmfoB7l2qWP
         fTaw==
X-Forwarded-Encrypted: i=1; AJvYcCUhPt1CvVFU7828ShmmBxh+We0PxG6ZVAj8LOwpq8dQFfLCADn7atcVE73a/fcZWm9mPnTcLH4sykc7pYQeh//H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy43ue1vBYguYdTXba4ROvd0xIBumOO6fBbfAYipo1kTZb5Lys8
	1L/LezQi0itURGhxjfqmplOfaaCPba9KAYo6fJs4XSaeNkD5dLIpN/g5WbUp4U2VtyV5/5WnRLX
	p
X-Gm-Gg: ASbGncsK6NzZrovYF8jDiLW/KzejNfW09t9kv3Ro2fZdkgoWUgXgi4fqJR9csSA1Xb1
	lb8BMQtw31OPowU/G8ApmG0Vr0hNuhXftaEllllZSYOu3pi3+tvPxx6gD/Nul46vLfKJVpGlxkX
	Frna+R/bvb4AaQkcDitTPDOtrgOuBOTUpt6JmaC1I66I55yXAHSCmYVAgtxnfB0mhMrZVpwAu8X
	dsEzUHvNHN60FvG3V7t5pX9sYSvs8jETIHjbVOT2Fv8WJdv8s1pPz2y2sbHneGeOieeguCMv2oZ
	2DFV5YwhsSnGzXrDIw+YFPLvp6/DP5Q=
X-Google-Smtp-Source: AGHT+IGLK9kay2HyRqmw0YxEsi1Oq3aDAG9+iUL0UrTRPcqhtxeRK3H6GewyV/X09yl8wLNmhln4kw==
X-Received: by 2002:a05:6402:5254:b0:5de:b604:355e with SMTP id 4fb4d7f45d1cf-5e0361b8ac9mr2830518a12.8.1739788605299;
        Mon, 17 Feb 2025 02:36:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm230383566b.111.2025.02.17.02.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:36:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250217091341.297401-1-colin.i.king@gmail.com>
References: <20250217091341.297401-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake
 "Faile" -> "Failed"
Message-Id: <173978860321.144850.18127886620209008962.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 11:36:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_023647_458855_CD745746 
X-CRM114-Status: UNSURE (   6.13  )
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


On Mon, 17 Feb 2025 09:13:41 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> 

Applied, thanks!

[1/1] firmware: Exynos ACPM: Fix spelling mistake "Faile" -> "Failed"
      https://git.kernel.org/krzk/linux/c/8c47b744b49f61604a2c0b64453bd410ee0f3f08

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


