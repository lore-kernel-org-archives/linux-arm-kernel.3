Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598EAC36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wwi3wAIpyCTSApBj4aSaPLa/2MoFwC9M++68JcsFwCQ=; b=xheul+hMbZylRZ6TdMlFIxGmSI
	hRZvKsyUHaPzhmngevFMXs4oNa17hPTCsz5yRDAt+TwdtnoJ8iGuH1Sbo8KA0t2D1UubZus8qchJC
	w4mIZeZtPTfyTriQ76RSy0xKSuBKVvZNBGOlMHF4RoQ4F1W27oolpJ0boog3jHVGkwjqVI2/wNpiG
	8h+MAATNF6STIptdrwZ0g9g678v95v4I8zXhYEjO5yXIvR1vD/T2689RiyICL6CNl9Fmw3KrGeMCw
	k8o6Wsh3ONpcPG1mZzi8dbqAv8jWYCUd7aJCwX9XziqFz3uqA676sRVjlOMWPOA/BMrPlrlItZZFo
	Tui7Jcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdj8-0000000FCNn-362Y;
	Fri, 21 Mar 2025 14:52:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdfM-0000000FBUk-3Yus
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:48:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1791669f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568487; x=1743173287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwi3wAIpyCTSApBj4aSaPLa/2MoFwC9M++68JcsFwCQ=;
        b=cYeJpA4iuGMKPS0YLZD5WajNTTF6Irt+t6/cJ9C3zV/ZcRmJD/2r73gz6FcJEZaeNm
         c7HM42ISp3o5XBjXVdiTRRCV9UFFmcGmO/en9mRQKH6cFpoV/RSnFuAEsp4NNIrOx1Uu
         9on813a0l2D5gX+XZxuxDY6ujxPEbBgdGUkViMSv9a5YfWQP1dUVxBgsTx8SxGUxyAyA
         VnpVOdhTvIEdUPQfli/k1GCMc+EcPb9u/ULbU+zOjGrATzclhXlemDyQV7qPjSv752rf
         jSORGjD+12S53i8YcOD3c7z4uX5YmzvphX6NyIfI0C1+ccB1cIy5tX8dl2T8DpML+bUk
         642Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568487; x=1743173287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwi3wAIpyCTSApBj4aSaPLa/2MoFwC9M++68JcsFwCQ=;
        b=WYXPOmI7nEy9laSjTG+671TLNE6UGOuCbvMhDgarsv7yi31C2UFBsvAhT6aLNi3rkL
         Ion+hpiHCtkz+RJDZODLIjwLoqgyPB5OrShfpitaoCeUNRd7SESkOCxASQW1d/2aJ6i3
         aOJ+HTDuJx8BqNNjWcQl4MtD92aItAVT28guWuXQtND4L5DC/D4GWe8r8WTBy+jgIPJS
         7UUNMIEI6RYSw4LaJ8y7I0/DngaQ7iCm+TGTDNw/5sSfM86dTuVIV+f+748MiXXQ6BVe
         PjssrCSRFxClefTgWGjrEIays9/hEx4AHDrhF4NK347lYB3eKTG54Z5PbKlKMD5HarrK
         sO4g==
X-Forwarded-Encrypted: i=1; AJvYcCUpAeTCDrT8JgCJPsqW6me2yHfwPLDzeHWqCq96m3W3+GtUFhYjKSXBEvB6Fo1hTP2lJCybSkb2Y+5Y1ORb6YiR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc6htxDFt9K1f/gP3Ol5hA+Th/Ub5s5Gr4FQK41Wvc2cDGYa/2
	eACnMtT3U9DKIEgl+J7cI0Lt9Qi2JgKESP3Pc3nYh8kkxrjtwspd
X-Gm-Gg: ASbGncv/7hyiL/KfwIfTNYUn4udzbE9lVM5n8wFshnXVG5JrapU3rnhkeNdVFzx8Pnt
	BEpfuwxun7thp9gyHdqVKHuQNvqqUBFwMgYx+8bpXDBASr//qMl1vMGf4Nzf4xNfrP3YsU36u6P
	UbnGfB/Nv7fQS4qcn0cNTxfbzAULZWimqrP1GfOMCCgE2AivDeZPh7jTWQYjXPVz/Hk8R0F/nEn
	zfxbhXBFtkrWKecUNijOa6QKVLWHuRw8nH7PNMnFEsFcwGjmvFbEs7+VNefMExmR39sYN6G61ZG
	M7tukueUF8CFo8w3ZBiuQQBQhQp/6qMdjQZuUIo3FOtgUyhQe2Tthzam7FjbXVnxvi3owqTv4W1
	UN3R5kjs+wIH5YKnNgpI2dFQ7tHmMkXs=
X-Google-Smtp-Source: AGHT+IG9ozHnjVC76ueR/+PL/g8GBD50uBvVPNeNxV965xi/LKWBDRHMHz2jEIzfTLpWAF7nbTflmg==
X-Received: by 2002:a05:6000:1f8d:b0:390:ee34:228b with SMTP id ffacd0b85a97d-3997f910522mr2973972f8f.24.1742568487046;
        Fri, 21 Mar 2025 07:48:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm2533851f8f.45.2025.03.21.07.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:48:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:48:01 +0200
Message-ID: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_074808_883739_97FA61D2 
X-CRM114-Status: GOOD (  10.13  )
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

Hey folks,

This patchset adds support for the Exynos 2200 to the exynos-dwc3 glue
code. It takes one clock - the link_aclk, and the dwc3 refclk is passed
to the dwc3 subnode, as with gs101.

Best regards,
Ivaylo

Changes in v3:
- fix partial r-b tag from the dt bindings commit message

Changes in v2:
- add sob and r-b tags
- drop minitems from binding patch

Ivaylo Ivanov (2):
  dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
  usb: dwc3: exynos: add support for Exynos2200 variant

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.43.0


