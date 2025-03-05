Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E282C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM1N8e/M9qgsmj8kvDT3vhaMw3S3wE2BxFSjcycLBlo=; b=3n2vzb4rBSGoIbxZqHp2EK6iZ9
	by/Uzq1ychVQes13aIW5Tmg6/lcXySR9TM/WprA8C2LWtxDADD9EvVFMtoEmgM2fmTkOPdXDdvyrv
	w7NLkOlhX64qieOcp2o00EQSjl/pDmHSuFfhMXTOVaQ8XeNTOcmY3RTueZ+S9EQwfmgqWeoBK+wFC
	rvCkxHZE+/WcwzkgBU4hvMAfNK/O0fqNvjjuastRYRiV3cxi7OLo1mh6hUN3tfUvXcxIzqmPCdNLv
	VLViV/09GtxoNC9oS+E4USW3QH+gSHIeYZd4evMWlT8tg49sBEXiCIC4gYFuxEU4wV8rAu6BvZ1/8
	ghHjY5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx4g-00000009SZP-3xx9;
	Wed, 05 Mar 2025 22:18:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuD2-000000092hG-2FfZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:15:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43bc21f831bso3784815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741202111; x=1741806911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM1N8e/M9qgsmj8kvDT3vhaMw3S3wE2BxFSjcycLBlo=;
        b=CQZTwhyHJ7haCYJGG3VyzGNX4QdZ4BYb/4iDpJkaOHxqKcjRUYyQ+Ekl3ttxR+Tna6
         KjxEgXh+QniEQeQNIe2wqLRpn56kzZq3fGUdcexUavqIFIQwfNRMQ+tdiaLCemCAapBm
         pWcBERg94QQ/p9pAeBD6DJb89/R+c3ZYKjLrH5k/m5PFH58hJkX9EQAwfIu6RYiwHRqT
         VcT6fHGJn/6nLfe30MGxJlDa4mxPtk7cC+9CIh3yYZO56SLKxOYqgMjajTA66K12zKcJ
         qzVIllJ3scSTJxmQKAOknDkLIRb8eh7DMTOj8GZ93d74lwjX2cexcIqKew/FGZDF19zz
         6Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741202111; x=1741806911;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM1N8e/M9qgsmj8kvDT3vhaMw3S3wE2BxFSjcycLBlo=;
        b=NQ+5tPlqb5/fbLtOi3C+/+dChUUNSZ/YhdWVzb8t4BiwYM05BxIoDi2D8xZgTFTKo6
         VTmZyjJ2TahjmcfThKbQ2M18ba2U3hgv6QriZ/Kk/K/ugdeb394cyme/H6LfWkVEI0aN
         Tj82bQ+QBsr9+zybDN3FMpb5RxewEBQiZHUB8c0VbGz7xjEo5TFyhtZKHcTGtvtz8EUt
         NE1arG6WPfMApLRfSAzdsjSIMUMuai2e3LTWht+r6Ye8EV7trBWtc6+yfInqnh4+fDCA
         ru/O0ou1v+Gci2DwQS3GoM2rQSEUw9pHC7hqPykmkeqP3Ga84gsdZwDjaK0twmOEEYfR
         kYyw==
X-Forwarded-Encrypted: i=1; AJvYcCXLtE0nhr018SM8xdYZfycPxLJllCWfs2JniqSONGqBC2SalofrAYl8ZddX4X/xwn4bJ/f3m9RsF5bn6wQvPHKz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6lr5PdXVdzeSIz4yGKDGuDckkCINFqx3LwXRbrK1SGIeiz+5f
	oSVzpsrIt0gsi+TXjT9vdcNfj3+jo9V5p94J0EJ0sDW5q0QNy2zvvB2y5GQNlRg=
X-Gm-Gg: ASbGncu8e9aYXDVI7pBs1O7iMJ768Nv3s/LFAyrmiDT5RtFG/LF4qbKao3HOO+RilDd
	UkM/znofDmg1ZTNbS7RCUrnb0HpNZXJs4QKneRJqInwLbilHQJh9cdvEMlW56aZZNqCK4EupJ3h
	hFa9zTO2pLOxD/iRmRsBlqxpRJO5punrgrTUOyb5h5H8jDYSwQBEl8a92DazZJGfUy113Fzso6Q
	H4MzaJlov1wgur9XsMwjdebcXDPekYwkELTp9OeCNdOQd2Tp7czNvN7g2O9Wn0fBFjUQEvLxXrY
	w0/VIC5GGCZab+TNP74DqrzGRrKSs1oTrDLSYcPtSxZOwo3BpaPLM+utlVuZ
X-Google-Smtp-Source: AGHT+IH0QRpxP2cLe6fhf8H2SFYp0QMMo0PU6M+JQg0NUWa1IhswO3Lg7DHT3HEfhHYxigAaOb6sGQ==
X-Received: by 2002:a5d:59ac:0:b0:38c:5d0b:71ca with SMTP id ffacd0b85a97d-3911f593b5dmr1453208f8f.0.1741202110729;
        Wed, 05 Mar 2025 11:15:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcc186de4sm29421805e9.1.2025.03.05.11.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:15:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, aswani.reddy@samsung.com, pankaj.dubey@samsung.com, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Varada Pavani <v.pavani@samsung.com>
Cc: gost.dev@samsung.com, stable@vger.kernel.org
In-Reply-To: <20250225131918.50925-3-v.pavani@samsung.com>
References: <20250225131918.50925-1-v.pavani@samsung.com>
 <CGME20250225132507epcas5p455347acbd580b26ee807e467d3a6a05e@epcas5p4.samsung.com>
 <20250225131918.50925-3-v.pavani@samsung.com>
Subject: Re: (subset) [PATCH v2 2/2] clk: samsung: update PLL locktime for
 PLL142XX used on FSD platform
Message-Id: <174120210653.76378.2120670200586172536.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:15:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_111512_582704_DD4D225B 
X-CRM114-Status: UNSURE (   7.00  )
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


On Tue, 25 Feb 2025 18:49:18 +0530, Varada Pavani wrote:
> Currently PLL142XX locktime is 270. As per spec, it should be 150. Hence
> update PLL142XX controller locktime to 150.
> 
> 

Applied, thanks!

[2/2] clk: samsung: update PLL locktime for PLL142XX used on FSD platform
      https://git.kernel.org/krzk/linux/c/53517a70873c7a91675f7244768aad5006cc45de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


