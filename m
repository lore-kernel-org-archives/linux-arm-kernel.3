Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECA7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBN2M9cMiE7Nv+ckCsZbOUgyHJWNUYkdtLKpVQjtD08=; b=mejtHW3luMW2/wGrCHbrT6i6Jt
	d/hrmeqgFKjV3DmfNC14ru7b45pzzrmLkqfj/dDVzz7ZIwjOMNxmhH6tiErAWeH1tIfHxCwJFbrqI
	sQ0rtvJfVf0ocW9jb8iuPqlMc424csf/jbiiocUlsTMwbM1+HoQq6G4z5C6SM/P1PyoI+RGm5YxBs
	EUz4HIAPqAthy1kqc6wJrni9Y4K8gbL0BYpg4vZ3F11GSRg69HWaP707Nc7AL1NWeokcDz8OZPA5G
	zSKuuHz2QDe4UCyoRts9X1o7n/QHdyB4HNZuqWROnYjSIZ5NTIpPg7tBj/UlpPh1slfG9TxACfeOx
	lDID08sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86OR-0000000BzNk-2Ag0;
	Mon, 13 Oct 2025 00:26:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86OQ-0000000BzNM-2J2W
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 00:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WBN2M9cMiE7Nv+ckCsZbOUgyHJWNUYkdtLKpVQjtD08=; b=oxVYFq54t0Q39s+LVxeEJJqHFA
	iW081qUsbHAch9bsJk2phZrLADJ0lxlQ3FZRSGkTRqs778feyvkhYO7UT5ZQxsOXG1JZp7N98Txrw
	05iZgiU/evcZ2Lqs96TA44gZQBQ1ocX5IFqHmOnhPT0EFLzsRYK1ztbcUXe3iGNzbfXH8I7D+PPTn
	aDkBn1zawh78l2CGNmIRrig1CalAGZd4+HWBjV0ggaHR53wx3WboV5gdB6gKctfU5xVfu19GSeHYY
	l1e3vAej8Tkxnu+q2Ykio/uTxuOtSbCnblCxxDEKB0G9MQnB8a5XbIoAi2qAsvSWcBAhF500EQRE0
	ezOpUzeA==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86O6-00000003x1r-32my
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 00:26:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-26e81c17d60so8370565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 17:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760315162; x=1760919962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBN2M9cMiE7Nv+ckCsZbOUgyHJWNUYkdtLKpVQjtD08=;
        b=qZHhyqhZvt8h6ZROrZRZupLrK+QLh4LGE/iilyqlutvnd0go/zaoNnw+F0hHMPuhr8
         8wOKbhu3NnLIuxTaw5ypTixd/rT3w2dXxYKtY/3s7Tfqu+K8jEn4Fuaiw7N6gA3x5q7A
         PyVoDpD6B1OHFAM1MG8rVY/3oKuK1laa/ez++D0+GSTVYM7Zabf46kdOdvTxDnZLEtMQ
         w/43xqDjJ5kQtAWDrZyZOx44Gr/LMTLtI4HNUf+uPzqUwRWtLv8NHY1tzkmVFPI4gNL8
         J2jEpSbHTe6VFJb4qS/rHJ17nlbRSZjucx7dQhcgOmXcLb+X0ZU3z6mU4fzTaoFoY5FX
         Grlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760315162; x=1760919962;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBN2M9cMiE7Nv+ckCsZbOUgyHJWNUYkdtLKpVQjtD08=;
        b=av7wOmNWoRttgWMhinIwZ2Y1ZNJXDoZ4ukINfAh8b6PhS6zgCChtYertFujRGwBfdP
         8EXiOr3FTJr9dOvdUXinH2l9fH4zNtwlz9V4devHr0D0AzZ9hCCgXlgZuQErF62yTzmg
         meAZklrjuW43HpVLFllGQAmgZE1A1eLtXyiK8Ffpmlv4TdLPFpG9q0HCev5m2KnwcrJJ
         89zHdX634uRGwrruBuVZd/h1SYuem8ly993tD0AK1LiCSPSiZ9+Z64drVPTXUrUoeEPj
         Hhgq41cWy4DCsZHctuqvHU03nx2520R9ByX7vaigL1bWwZB7wxDyZQuKxxQiqhLM4q5L
         vXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkcQs2q8IN8HjuKGHqMAsa04tLVC2WzW7GnylHikHR1c5HWiWn05+kLVwVvZZ6XWTdBfBk5XxrdzK1xnRi4z12@lists.infradead.org
X-Gm-Message-State: AOJu0YwQpAr4KsEx1k85QWOsGBMdgawGLhdN3ZJvm1Dy1IOnoqWkHzjR
	LO+wDvGtISJKDDXRbnLZDpWWW5ibVC+C1tCBtSXghSxwnuVac6Jk9AKw1M8oyhtshhY=
X-Gm-Gg: ASbGncvC87W3QDRHubSc/mPX0AeYl9qMKIi2V6vxjkgrH/LN8Q6aSkhatuv4mPLP3RM
	oyW9iG5ZPwzvyHKg26CC9638mdK0nX80Sn+InaRwbWudQwmVQaJOPmamca5VA3lpN8YzsWkeq7A
	/KLqQzAtbweNYLrdfx7GKdQzKtGvFH/dY0GafswiBafXjaTqLTJ0+UtuPQMPVsDzIPmwqZgXRKy
	NUaaXhOtfIMl5vIlfepbGvLDjMgChi8SYo9I3em8j3JWp2Pu6NYSPCktRySnkCaMvWstmqU++6n
	T1DjUMtsomAXbm6XVVP7yq/V6y6Rt/AAFnENbuEmi7SFsLSw4qFV+8EHekEeMaWv1ql6nigNaSA
	1Tm31KasUdMS4eK9xlvnD+Qrp7dkfGPbViV9WtnsfkWZNt31LCJ63fp95Hmbxon1HHUI/7SsSaZ
	fPgvE27A==
X-Google-Smtp-Source: AGHT+IEwIgW8gINldWjknWYV8MJ0j1jUN7u37O93AJbcBBhfRalcRq5iqyc2MYvjmSLv9qtnZvLvRw==
X-Received: by 2002:a05:6a20:9383:b0:2df:b68d:f7e with SMTP id adf61e73a8af0-32da8461710mr14706065637.5.1760315162189;
        Sun, 12 Oct 2025 17:26:02 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm9624862b3a.38.2025.10.12.17.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:26:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-6-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-6-a40e77a73f16@disroot.org>
Subject: Re: (subset) [PATCH 6/7] arm64: dts: exynos7870-j6lte: add
 bus-width to mmc0 node
Message-Id: <176031515743.11660.18346080313426927067.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:25:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_012610_938378_62125A09 
X-CRM114-Status: UNSURE (   8.70  )
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


On Sun, 28 Sep 2025 22:13:57 +0530, Kaustabh Chakraborty wrote:
> Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
> assumes bus width to be 8 if not present in devicetree, so at least with
> respect to the Linux kernel, this doesn't introduce any functional
> changes. But other drivers referring to it may not. Either way, without
> the bus-width property the hardware description remains incomplete.
> 
> 
> [...]

Applied, thanks!

[6/7] arm64: dts: exynos7870-j6lte: add bus-width to mmc0 node
      https://git.kernel.org/krzk/linux/c/9e3e37939362ba110c341cae09acaf000c0edb34

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


