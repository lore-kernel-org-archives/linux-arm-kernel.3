Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54FBC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNwkLAnqK894as9s9mKIIiJB+bRwSGT/2fsFsNmBFKc=; b=A185Ht5zRanlEqPYYQ9wpvELhQ
	Ow5JIpwCte2KgG50jMPS4vkh+uWfUV9I+0Rvm5nNVRjgPMWBdpzNsdvkSMa9lWPVg1rDCNiW9PEkW
	UsgwQOr9suHOjIdhO6z824jNARw06+o81CxdMBexEatXL11AMzWPk+QVO2lRPP9U5jjNVMxK2FW6T
	BEVxlbJyB03URTfxF2MRg1rdAbNu97NLPyLL0WdRrAOEnyDa56b5vtK61BQTmZRSd/1j4U2ZU7ibP
	y4Q7CkVOQBWOCqA6/FfesObW72xDi0kkUzp4JWynJqRwQEgJVsXb45Wswr7ijVbUBzWkVPE/2lX4M
	8K/V7cwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgot-0000000GGSE-3GSP;
	Thu, 29 May 2025 17:13:31 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgml-0000000GGDp-0vYH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 17:11:20 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b271f3ae786so841044a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748538678; x=1749143478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNwkLAnqK894as9s9mKIIiJB+bRwSGT/2fsFsNmBFKc=;
        b=SrmlhvXuynwJyRK32Zgp4R8VKDtV5brTF2Or8mkAefiTMxB0oHhV47ZYrXQYHxkjjj
         D8DrqX0yyXWdFqgVNNTec68HMZ1BzVgAIqww4slQD20xQYedGZhlKWK23xgG409EFMEs
         do0bXODnAgSRk8ejvHAp7VeL+fP2Sk9Lw30YRRDE4+wyDDeMDRPynsArO6q0s83e41rX
         3QEBarzIfdcE4I19v9JxjT/m8cfMCPXSr/PrFYujPs7iJrOWNSImHQSweQPyjNT7lgue
         f/VDQIUpGB6qGBINhI5Z14XEzDplYb7LWQmk/ky41LNBu1hl19TbIx/dINW1CGqDHj8/
         I0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538678; x=1749143478;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNwkLAnqK894as9s9mKIIiJB+bRwSGT/2fsFsNmBFKc=;
        b=ebD+3Q8ow1k67FMVH79xv7QI4C2oqU5HoQHQDlxGlZ/aBVmaunBlAMB5vxUQubWfuQ
         3lFoV4lo7/s88UR4nb+DzUoSrIvzrviUoKztozjsHXF/rPWLEf1cxfdoD+Wo5SHJo3W9
         uOuuv1Qnw9GsMKvxqzF2PTw2IX4htSlS3ipqXJJtCDPsb+QY17J8SRS6ZbLQa5hFQkdZ
         elx0kICYfO5sTLpafk4o5TroUFfJfSjYNRLfVsKUIFdJvn8bhaom04wWCPnVhQie48OM
         R/41/oTuL2eHCeSdKUt//Hw1u/ktJY1HH6GLw+FAaXhEDCm2S0cxurhwq+u1hEznjCjv
         oRDg==
X-Forwarded-Encrypted: i=1; AJvYcCUWU+KB0vUWSh485ZKipKH4VgxonKMVm0P4NgkRjgeNyw+G1C6Z+eW506QiggpUVr4z5bmKahgRmvhl7QtOP0xI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd3xPVhNekWJJEqQ47qmFF9KiL5iGwCHTcydOGENwAe+/QNl9W
	SNnbf6Y2gLRczGGEuKGYl7bXiRRLkFAU6M8wHqCvLqNW/4xsl1Awj93Zb3tf3UabFyI=
X-Gm-Gg: ASbGncvXNvr3kuVz9qymCoMNehYcfz6BSYMhIjH8zl5LBy1Iproy/jNWUptfHOpybWF
	rHYfwpiea8Y+JubQ0nb5Z+BKzmnsSnlgyiBs3R1euGLmh0CygZ6o8xLojnESwpywsPn+YVt89Y8
	sdTB8/GH1hgx/BgX9BbOHCa1+zVtXp4bd/hkUwCED7WF/H2ov86B51H1nr60Ri7n2udYDZmXDZX
	yqEur9YDpzVP2z3NojUtgATafBXSvRDNUHTe3guwu9MjmFLr/aIVvQLBRhQ04ir6usYhcpmwmyC
	FhyMTdKmHKvzC2Pccl0k+Ia2XCQZuRwV8Jx3SaO2YDCljD/cUg==
X-Google-Smtp-Source: AGHT+IF8U4LS5Ha4ZVJlb6Xexvhz/gVZeJ8PZz0LFT+vBQf4rmFuB/wcLf4M5M+AqpPj3eAYBAnv6w==
X-Received: by 2002:a05:6a21:516:b0:20d:5076:dd78 with SMTP id adf61e73a8af0-21ad9966437mr590567637.42.1748538677957;
        Thu, 29 May 2025 10:11:17 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb29b20sm217068a12.30.2025.05.29.10.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:11:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: s-vadapalli@ti.com, Frank Li <Frank.Li@nxp.com>
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, kw@linux.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, 
 manivannan.sadhasivam@linaro.org, robh@kernel.org, tony@atomide.com, 
 vigneshr@ti.com
In-Reply-To: <20250411153454.3258098-1-Frank.Li@nxp.com>
References: <20250411153454.3258098-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] Revert "ARM: dts: Update pcie ranges for dra7"
Message-Id: <174853867693.3632160.17627654159190851191.b4-ty@baylibre.com>
Date: Thu, 29 May 2025 10:11:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_101119_262679_8FBD6FC6 
X-CRM114-Status: UNSURE (   9.94  )
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


On Fri, 11 Apr 2025 11:34:54 -0400, Frank Li wrote:
> This reverts commit c761028ef5e27f477fe14d2b134164c584fc21ee.
> 
> The commit being reverted updated the "ranges" property for the sake of
> readability. However, this change is no longer appropriate due to the
> following reasons:
> 
> - On many SoCs, the PCIe parent bus translates CPU addresses to different
> values before passing them to the PCIe controller.
> - The reverted commit introduced a fake address translation, which violates
> the fundamental DTS principle: the device tree should reflect actual
> hardware behavior.
> 
> [...]

Applied, thanks!

[1/1] Revert "ARM: dts: Update pcie ranges for dra7"
      commit: 8c178057e734188eeeceaec33848eaca2766ca07

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


