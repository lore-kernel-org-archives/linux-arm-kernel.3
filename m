Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108A3C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 05:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihA46zUWoj4y9yH4wv6zt6EYeKMN/ZkRKZwdyhiNCYA=; b=Qxe03ALgfb2SvLZOcwj/Tb/zsO
	zNkrwqXDkvP8NPur0f1lMMOxaJ1XmtZwfLbYMccuVkFTxouKPkUVM2fCIVE7Tn34P6koyQEB6V3cl
	uav0/pKDCXofWJYZTVeaON9XD7NGCEOdc30ViNRmCh01ojvJFZwzRtVgjPVg0zPzZ+LNTFEBgcWWo
	+aY0VFpB/hs/X6RbfnfSOCwrc/lB2YZqExPWCb042aIST+K2+8Zbva5UcuwgivpuBmGDBszIey101
	W5HCD0cbffxd+SP+7exfNWTaw2PWnIryFj2bQiJkTR5cb4FrRs2UspBwTvTHYthaY9jPUTC6FNmvq
	CvOvN1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV27b-0000000DeIA-3bBi;
	Fri, 27 Jun 2025 05:59:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV259-0000000De5A-3Xqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 05:57:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45362642f3bso2515075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 22:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751003822; x=1751608622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihA46zUWoj4y9yH4wv6zt6EYeKMN/ZkRKZwdyhiNCYA=;
        b=RC/bHB+FRQPUHincyeKz1QdbuGscwoxQPnc77SwbYR16pKdypFJea9DLisn08FwvY3
         Yj7o8MGjDiitWnrsQKMGMEKn7mhla0BJIJJDzkAqI+qa+ZK0heTGxQ0s5Fn7qvx1TFMw
         R11Dw8Xcr8xdCWJyTgMbbd87y1F5Z4pP+X5cuexLzH2Sc7tw7PsUxs48+m2u1CPEZtFb
         OzvCaUU8s6mvd+tuui9bLozF9484El3Q36SdqEV+qviP4fRxPAusMoCvWLnSWYwv+3ui
         FUZvX3idfzVcevP/4wfu+XUlApvb8HgAfmM+teUSZhp4DzOlZEoTXy2D5SR9W5o3Fq2c
         bAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751003822; x=1751608622;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihA46zUWoj4y9yH4wv6zt6EYeKMN/ZkRKZwdyhiNCYA=;
        b=EnjjVo7KcsdbKYmHOaORzJNZDTZWAgGU8tymfA6dqcdCTV+3T8wSLgFQlie8gMxVfW
         XzzQJpC+v/AHsfdDmGVk6rXU1J8XkFDKMHiA63FERDmpoN5WL4c5+2yelTS0KHro2r3H
         bnQX5cSJnFBPPly1hn9DmjgjOYZkra97wBvxxU2irLr5sK/mi8bl5joVxfK+LDU+OEYm
         JABfHLn3TgYBXduAeu6oRsJc7iDYBBB1Y00DWt2Pz9PoTDVIekPd8LQfIfsgQcWYaZUb
         eq50JFZac8TLZ9j3BdIPAE/YDZW4NTuJmTbyluEZrlZxzrwsY+sqgMaULYIaQstzXIBg
         yKog==
X-Forwarded-Encrypted: i=1; AJvYcCUleZ1dBA8xsfKAPXLIs56w9p4Ng+9Tcsiert4BbSybM3On3RLZJaOwut0nlptfcnZqhQQYfr2kFA41UoQ0aAT0@lists.infradead.org
X-Gm-Message-State: AOJu0YxepSSVl2g+q56bwyQNk7QVT7e36BRYqiJIJ+QVKvLjF0Edlr2B
	pA6wA1C1NUkCrOC743987+kzixZGtSQV6I72zup23U34xQUkshFZ8K1LXn/eNiB/jfc=
X-Gm-Gg: ASbGncux76UAH7fB1Z5DvkFfwYFNh0C+ZXw0d2v/dhTBxTZxaPAIJ0LdjkGRWm+/dc+
	VwnB39VX4m4WmH51P5bnMpvir54j5v/xIVPlutO3xUFvGCfHZvKNs/7is+BH4OanAAQ1YG6Js5K
	mLMSZ4KtYLM/XloKYYfrJwCYX/a8dbEPrDB9iSRbgtYE7qSpHMm9jEiqKgWJP5LwDj0H/ZmXV0k
	tPoIKK08DChqH2cOU3ERvyeyFsNIim0k4a1ex6OvSOqNgMJAyNsw9SkUZs2La6J0Zrha+5GzoOD
	MkzTnxX3qt4XwCeAUXr74/oI/xik56IP63d6UIF5K09XYI0dxOoCFqBuw9SxR6Hd/97uGOOxsWN
	O
X-Google-Smtp-Source: AGHT+IEO+Lc7qL8+vyNa1Fzk+jCY3AgG5vruLPblFHJDruNTVICQAyjisLLGwKbaVbHs/dAXjI2hxg==
X-Received: by 2002:adf:b650:0:b0:3a5:77ea:2d36 with SMTP id ffacd0b85a97d-3a8ff8f56a0mr556159f8f.10.1751003821836;
        Thu, 26 Jun 2025 22:57:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390bf8sm40414175e9.4.2025.06.26.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 22:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
References: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
Subject: Re: [PATCH v2 0/2] Simplify compatible matching for brcmstb_memc
Message-Id: <175100382008.7419.10025995325292671372.b4-ty@linaro.org>
Date: Fri, 27 Jun 2025 07:57:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_225703_899726_2072648F 
X-CRM114-Status: UNSURE (   9.22  )
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


On Mon, 09 Jun 2025 14:23:54 -0700, Florian Fainelli wrote:
> Since the conversation died off in
> https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
> here is a second attempt at addressing what I understood from the
> conversation back then.
> 
> Changes in v2:
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory-controller: Define fallback compatible
      https://git.kernel.org/krzk/linux-mem-ctrl/c/501be7cecec9aaf9cd52e76d0820efd6d0b952e7
[2/2] memory: brcmstb_memc: Simplify compatible matching
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0e3dd41a94b29d5d9973dac356ebd37f87bd8a37

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


