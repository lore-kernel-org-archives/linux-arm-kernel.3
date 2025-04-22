Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F73C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WE6B9+Jm7K2DIy4AwhiaVSJXeDjFiEqYGefV6SKsX4=; b=e//Qs3oNSFOuhl3/Q44ml1GyL0
	KBK+zRBWLgtPAk6n9uE1fkTKqtlY1F+VymzJXw1F37aeq50XDiP8trQMm8EdflPoGX/oDXhqsLWt1
	tCzoPmimFRuzZZf4UThjaOuJw9W6ShUMLJ4akTKoFroaEux54tlsuRm27zdlCMpgYEAjW0PglD/Su
	n6EZmVa06dedpPGuHrWFoItXpGtbL2tYXbJQks39GaGXe+LlIcbh0SLloc3rUIaINXGbu6IVVkkgY
	DpNr1oX+R6sEhyPcn+cWnD6UAi1XpHsWZstW0MQV1xlV0bN2XO2H2Hn0coc3cLQcxAXp6z3BDBdV9
	gD8SXaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ae7-00000006i8O-12xW;
	Tue, 22 Apr 2025 10:14:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u784Q-000000067Zu-3ia5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:29:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edb40f357so35549715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306969; x=1745911769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WE6B9+Jm7K2DIy4AwhiaVSJXeDjFiEqYGefV6SKsX4=;
        b=wKSABc0MBPCaEgrAV1Y8YljltXZddGDvp+p5MQoX9XhMG+mvAIEDKdI1vpJdorhtU6
         ZqTOXwGsz9xSk52+aUJNfVyXlcbc7c1IXu75SQwcsosQHIEEoRzFewbq8q4lmnpf1fG6
         90aLF1MgeuZB8O5f3rw7XjRPU2HrV4hfG2NICDt+0HvCAC0GomDMW2o/5zbqbJ4qX+TQ
         VaVdRkqCNXZIPd2dc77of1gnnhBpe5HuNJFCqv9PYrvKkvK5GTku9Z1Wq/+TZ6mdhszq
         OjikhX13MmblwQKp8iDeAAyEG8YVCe7tSr/9CXLzLpGMoVYJWn8BqT45IdJF3vKrAivI
         euxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306969; x=1745911769;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WE6B9+Jm7K2DIy4AwhiaVSJXeDjFiEqYGefV6SKsX4=;
        b=LGpBuwCqjMD7A1WTrRxs4bZRJop+0Fcy+vmKXb9HOolh0caJO1EO1eqJUi8oU3raIJ
         ExuW/4gTbfzEYrQEQdw5EHO1M7eQg7P6o2tga+vcxtBwUto7UJwNBmBctJatMIfy1vAa
         4JkXWVknxo6skFvx+6AL4XTbSaUv5ND0KPsq3RCfIXeXtpHXzJmRbgUdcr1AuVGp+TJ0
         SBli8U42MPSBjGFNGHnC/PvL2DSCcLWjRJYD7dyoKgfxRBzQtevFnfPRQU/0G9UCYTNH
         mcEPCJ/45VjE6uBgBBZFlly1O4IXFmxxTpA55ckjy3bvto/tXs1XG4EqMzldFEFDMOz7
         UgOg==
X-Gm-Message-State: AOJu0Yxh1x/70o83LH4aQLFxRNlQ7sscRLT1q/Jq3rJrI6K4AybsYgTv
	RmFWlZtERNGuMjLwppu1ANUT+Q/bu+5SKxKOdyWqvd9soWsRDM+FeIiVFEZk1Sc=
X-Gm-Gg: ASbGncvBEdMl9wG4e/MQ3do031cBSNU4RkMwaTmwqa5pOmZpIWnJCUhf0xQ7YU7ORM9
	OG3ytTytucmnTJT6CzkTciTtspx68jkOxaC6Tm+xI5H1s90wpmZKsqjXvX4YKd1aTnB3ioJETKb
	kxOLItHNGqU/OrIY1XoWuwqAvZwHd66zYBgplRZ4mWCN8J2N15pFo16xZi8aExslMRWJCTEDrfc
	ufDrORIX2jcffQpKVvR73/wvqlIX0ve0lacCIyD6y44ZDqgh7MNZgaMSD6ljASoyXteQI+VkAwY
	j8/qjDelSg1LCfW0UtD+pQsm+OmJPXX6Espk2H8KHztTBHUQdFMcvJKMHm1tiw==
X-Google-Smtp-Source: AGHT+IFz4RTYks1mswTos9a1X656QS1hSeMVBYH7QIElbSw016nR7YtAIfOCTnGOtYvHrLhJYdnl0Q==
X-Received: by 2002:a05:600c:3c9b:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-4406abfbcd7mr111689315e9.23.1745306969235;
        Tue, 22 Apr 2025 00:29:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbcc3sm163166975e9.19.2025.04.22.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:29:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/7] soc: amlogic: clk-measure: Add
 clk-measure support for C3 and S4
Message-Id: <174530696864.2791401.11812769907891409745.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:29:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_002930_939713_C0BF184F 
X-CRM114-Status: GOOD (  11.31  )
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

Hi,

On Tue, 15 Apr 2025 10:45:23 +0800, Chuan Liu wrote:
> Add clk-measure support for C3/S4 SoCs.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/drivers)

[1/7] soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
      https://git.kernel.org/amlogic/c/ac2edb9b7bcc34de804d9c034d7387bdeda3fa3d
[2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
      https://git.kernel.org/amlogic/c/e5635febb4f063fba40bcb4506c7fa5704ceeace
[3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
      https://git.kernel.org/amlogic/c/97533fc48892716e5765b390b2f03a7ac633c55b
[4/7] soc: amlogic: clk-measure: Add support for C3
      https://git.kernel.org/amlogic/c/67c618a5852d9066ccb3b6833df8c44839bff5c1
[5/7] soc: amlogic: clk-measure: Add support for S4
      https://git.kernel.org/amlogic/c/bc93a99ba90b06e478a21505d07175a0f66849be

These changes has been applied on the intermediate git tree [1].

The v6.16/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


