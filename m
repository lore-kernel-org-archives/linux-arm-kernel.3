Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075C8C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/I/UV4/s1jFi57l1/zTRTSQC+EHyYYP8Y1oNeYIevY=; b=gD/qlSg7OrsZRX961lH4JhpGKu
	wFwYRzeGMklQNmRJy54KYEVIlYdBszd7IA1RokKY3VRqmVMa02HuFbo4gvcW+y9vxJsIdjP0QuNAw
	pyjtBjdM8X5N1bqqkS3su+FJA2O8PYI0xeCa2JgcDdre9i1sz1lARs1yls9e6XH90EkotAzC5WAUz
	jcKj0FMNPARdqlxzt2r5ahzuv599GdwiEXDHAygP5MaQC8qdHNIL8XKvMaaaBAdU2NjsLM04ItKM2
	AcUGeuQS6sLB4XSJmOOlx8M/YjQwrLqMOTu09hheogmVjohNRqZcqbVR1VAqnTEwNtKOiEQl0nuMJ
	mTGuN7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9cT-0000000DVu4-2R6r;
	Wed, 13 Aug 2025 11:26:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8r2-0000000DP5n-2Xsq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:37:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-61539f6815fso1035697a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081431; x=1755686231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/I/UV4/s1jFi57l1/zTRTSQC+EHyYYP8Y1oNeYIevY=;
        b=gsoNnFhqbm2fuYwp1cbLFcqGnGITYZKapmRMVEfLKQu6jUcscRCWoGOaE/BMLplUZ7
         aUO0Du5nfna3Np4R40utf65A9Dtc14p79s+1lSou6ZIjYKOqW3JGTQItuXjI/cx48IGS
         yrKULfxkNrDYR6bFCgrF4zgtKAQKMsRmomvtYw1YcTyxHbkxOscgsTO8o/RufeqhJBXy
         W7jgLNlEfP3QDDlZBHcJabYhhHx7168Z5xA76KjC66HLQK/LRe796tYyrOraoh4nlAqh
         b1eP6YW+XUHSCbX37B/slWPqrClIE8/zN4vtiBgO7Ya9IAY+JqSRUPUhTWZk1v7tWvWW
         BtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081431; x=1755686231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/I/UV4/s1jFi57l1/zTRTSQC+EHyYYP8Y1oNeYIevY=;
        b=dXlp0ii+oCX4sqTOwMtvEiWUL4Eoz6AD90OOywCH8sMl8y74E9tJ5NQek2fSam/m1k
         VxzitN0X/HZQtRLYh0rB2ftegoldJI9Cx+t7Jb54LsBSN99AZ3uQGiTWDXaEBOoUDURl
         FInK5t/OkWZzUBGBV82WjcoV4DMJGdXHFp0yR2YGrpNSsCYsJ4lvXp2D9JVBJWfhbz2G
         hPAGTb+ZH9nzpg2DehD70iB2mY3Bwu0wpAMhuGyLm0uNZfolNrEnRgAWi+igKKtnadgI
         pGi4OdphDAUUIK0VwsR11dfDjb3wEt4stDazMSyMhyGbTBOXXbroYPcX4dRulTq572oA
         sftQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7m9yCPO5kOLU9aAiGGoRrVI2A7uIlda5cfp8eVqURgeNtemPmtQRpiXpi2GKA2gEtF+/Sv594YKqfjFa//dGB@lists.infradead.org
X-Gm-Message-State: AOJu0YzMJ1LoGL4I3VjefJPY2kAH4Fxq8qGJ/Y3yihQLb1SfjBMv3T6O
	wuqRDKJIKkZaFVVPLCQb/Iv0ZpUUSn7KqPcseQWguWZej1v9g9DzYxk2tfCmFjuHAiRvmqWUAKE
	mW8qt
X-Gm-Gg: ASbGnctPbrUSQwf4gyYLvVvzSNzodFcRH8xC0FleQDhwQTjE8iK7G/TCMvapHj+Wuol
	rVBGyK86Z3+n1W03X+aSi0xxe0RZYrPAnu50yRz77ebN0A8dpOhiVl7RiUdsNVL9CLItEpxHYLs
	q/awB/YPsZE+yiQCsuSL++QBxmCCMDQIa9Cx9+ijKbYD9X75qTXPJKN7cRV3XYKsnRtB61/T4Bm
	GoZHu/envTTzKmqRlZiBp6+Dr9MFb6X1oXk+xUvj3YaMPYVg3OV0JxSKOAj4NS8Pbgp8gS+Hx8p
	IdoEByj75nfLBWP8czAND3zlvyMdSeBAZkpXiH2YDAasvX6UA7HUkxoKB3fwA+vsQsYydT0sMh3
	IuY0AQeVV3vSva1xgneBg2AhuplXVc2aOExDGjCY=
X-Google-Smtp-Source: AGHT+IGly2ZK68mNw/1W/aNJtrzffPyIHLrPFRXdd6pjFMKVKce3Kx6411EXu07l2T6GFNjgHfafyQ==
X-Received: by 2002:a05:6402:3591:b0:607:eea1:1038 with SMTP id 4fb4d7f45d1cf-6186bfe6deamr918459a12.6.1755081430915;
        Wed, 13 Aug 2025 03:37:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm21042215a12.36.2025.08.13.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:37:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
Subject: Re: [PATCH v2 0/5] Add watchdog and USB nodes for the Exynos990
 SoC
Message-Id: <175508142927.40586.1715682122583711068.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:37:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_033712_649127_1D5A24CE 
X-CRM114-Status: GOOD (  11.40  )
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


On Thu, 10 Jul 2025 18:50:04 +0200, Igor Belwon wrote:
> This series adds the nodes to enable the watchdog and USB support for
> the Exynos990 SoC.
> 
> The watchdog consists of two clusters (cl0 and cl2). Unsure why Samsung has
> skipped cl1 on this SoC. Both are enabled and working - tested on a
> device from the -x1s family.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: exynos990: Enable watchdog timer
      https://git.kernel.org/krzk/linux/c/ad211501fff48d0cda35dd187aa7e356a4fb5581
[2/5] arm64: dts: exynos990: Add USB nodes
      https://git.kernel.org/krzk/linux/c/d3830b5b0db59d0b8e33083462e4c0dd021ed300
[3/5] arm64: dts: exynos990-x1s-common: Enable USB
      https://git.kernel.org/krzk/linux/c/707181264badf4f82c78c18348684cd06db31ce0
[4/5] arm64: dts: exynos990-c1s: Enable USB
      https://git.kernel.org/krzk/linux/c/32532687a9ce2f1c5556e082f957200a81ba0ad7
[5/5] arm64: dts: exynos990-r8s: Enable USB
      https://git.kernel.org/krzk/linux/c/e28c1117deda5a80df14b579170c1a90fc82bf5f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


