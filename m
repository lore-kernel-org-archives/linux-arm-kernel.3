Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A17CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 04:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=; b=mq/CHqFJV4ViF0rvzcJm/mte0F
	tDrTAiSplYnb13ZwgdXhIlfLI6tj6K+tUEyznaWQq+1YH7ngalsnbIzmGW2/RL5gRKtb3wFsG6RqN
	IEAArwjAJD4ytwaGqbviTLbrmqpHDiDlHUAox+I3DikPpDSLLQMPO2HyQmR2XchHcP8n2dlyDuPSz
	El02cyiUSGFk5IQEePGXT3cKGamMDVjWMW+f626hM6yStx4yu/xMxaj0HtqWg+mPoGOFOBhonVhIl
	4e6XNfLg8bES1GBSfOts0CkYu4d7oyXdO2BQztvNO05fRfs/kmr/l6xs2UJnYOP7lACnv3XSdabph
	mP+T5Rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5dmA-0000000F6y8-12ZA;
	Fri, 18 Apr 2025 04:56:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5dkI-0000000F6ph-3lN0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 04:54:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224100e9a5cso19110645ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744952073; x=1745556873; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
        b=D6qpotn2Ia5ZulBhTLtvC58UUzEJUW9eVPI+/J6LESZlh7ASr/+kxvE+jxYpSkJR3/
         ZZpJOGFqI4UKEhkVNJyYIo78GfgDgl0qGHgFgYSHHhaUjWwWpcGN/30nEZ3dm/YoO7yG
         G7ou09qhEWT1OVe+0Oj0MWKIusIfNADIDYSBTIijvaTxIyEB3vXUXmr2cDcbEAqCK4MF
         FpUXyCbebYYTNyEX8LgYD41WHspQccMwnEZoWRF9HVVx2E4LmFKYAZo5rYMe57zp09qg
         b08KcG/O/KozsfYi7a4D7w+eMVqVZer9bmc1/hVRQ84b2C1IYan9oUc+0TQTfvU5e0yS
         SQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744952073; x=1745556873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miGWfcaPFFeXZKyL4q8RKZf6XsZtwS2QXeSpQEPB9j8=;
        b=d3vPHG1l+XYZoFhp+auMczDeH9BIlgoCeDFVjjfrr2X83RbjOl/twfRBomUutTW96R
         Gg/2IrUHF//ZbWWH4CqepFljdmhMQs2w1x93wG6LFGDv5Ix4+GUaLfynrB6KDiFA5Z/V
         oXKCqSmAY6cNLSf/U7qRcCusTA7gVoarGD/VBEVLfVDdzhYfyFwHkHpL/Q8xhQICYANX
         YRwnpIfO3TW5ZYcxC0OHob3P/aGPfA7+B8kTyoWamidDwzgV/VwlG2CqipowX6C8+hJa
         2mamsoSIQkSiHmCaJLyFseT4CKLF01TT7C3f1+BsJN6yDw+BjoorOe2YjG5Dn0vwED8S
         l4YA==
X-Forwarded-Encrypted: i=1; AJvYcCXUEuhNsjIpHcSpzjwmT6jAU85HGm131i0oUBhYNzR3w/NJwYCtZpdTH2sCJFMIMKtNyKspEDtcuILC9DFW1OXJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxzOp7dijZxTwWQ+OPignzU5p/Giz1DKvY8vH3LKuYeA7HISPZM
	y6wpNf3KhOzaUS7sTdExoMEi4Loqq2sX4wSRNLq/Q/oEGX0CZkKT
X-Gm-Gg: ASbGnctH4Hg2dwsTusyjLBcm5ewh9g/9ce4Q+atSGgA/BWqcpbL4VvgtyjbzKHary4c
	KSss3zSWmfTqkyyo2qqJPGJFnhDr+B5rG8nJy361Wg3BDNbqoV5Ndr/gcG6kEyto7S/y3Bv8gL8
	oXjseEGxYMQJJyBgklpiF8FQFtFVBNlnKNKNO4WhgUf+X/EejQpOLbFojB67hHlc8Y0XHCwGCxm
	9s/yunGUAFtSh42Gf/nAWZuSew/AYIV6srwQvxRSZpoTD9URUXS/l8wLDlcjlnbrZJpocns6ECb
	3hd3UEp9MOD7jJ6qRVQIhZ1aj5TDsGhXp2BLSRMvNZ7Ggp/k5hkQj0JKSec9zw+F2QEGkg==
X-Google-Smtp-Source: AGHT+IGV/fWbJMmWtA4WBhTr5NRFS7XNEqC6SndfF5cUfWSxSGh8GbNlHBkKJARuTfoFoRcRWxs5jw==
X-Received: by 2002:a17:902:f708:b0:224:ab0:9b00 with SMTP id d9443c01a7336-22c535ac5d7mr21475505ad.27.1744952073304;
        Thu, 17 Apr 2025 21:54:33 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf1424sm9178635ad.53.2025.04.17.21.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 21:54:32 -0700 (PDT)
Message-ID: <06b513ac-1734-452c-a967-de3c178ce80c@gmail.com>
Date: Fri, 18 Apr 2025 12:54:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add PMU NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_215434_936058_2E8F7E13 
X-CRM114-Status: UNSURE (   6.37  )
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


Sasha Finkelstein via B4 Relay 於 2025/4/18 凌晨4:14 寫道:
> From: Hector Martin <marcan@marcan.st>
>
> Add device tree entries for NVMEM cells present on the PMU
The commit message should say PMIC instead of PMU.
With that in mind,
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
[...]

Nick Chan

