Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6946C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8JFZqlB50uswLR58OmnyCXaxlSBWX6UZAyFotochoo=; b=NGwMlKHU/wmGS5eBGlSxnRh/Kr
	e9wLzqJLVrxek0YQbkzH3vnidQof/hJmMPSLW+roUNvKqQkivBdIh4F1nhU90RuIhT0vHslIs38Ll
	drsbZJdXXgSbV8qzBMS05wsyh/Yd1QO8VZUEGpHujCe4klNT/YrwNWHHkcuIJhaJnCUTOVQQzqvKg
	ntD3AgaAW3emI8iCbEVjD+tsCOoJzNXUi9YckCBYaJJ//+trz5ZjV6dmD5AZDpowOMPLXlyoPs0iZ
	nvVwDUOG07ZGYgfAe/4N4j1TthYuAFy8ktKGdXnz4zfL4CNJpaFt0bbTU5AUXJBzLxDPh7gsZ6FL2
	Oaq1iAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5b0-00000006jGw-2Kym;
	Thu, 06 Aug 2026 21:25:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5ay-00000006jGG-1yPf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:25:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2caced6038eso18221405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786051544; x=1786656344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U8JFZqlB50uswLR58OmnyCXaxlSBWX6UZAyFotochoo=;
        b=EJyQF1IOQmSB6q7WZyOeErOPvMi4h1hnF7sTpXBXEI/WE2fMZNQKPj+fFqm3HH6ibx
         MGEnUU5BjqaN0gRWqJthSYiUX0a8OzhoeNOoOxnEybt3sxiFw2tnsP+L65lZveLxGeNa
         JP6wjuX3dBAcrI2P+fdLSDjLcuuHKvQXI4lAOG01rCf7k6/Xyt1Md1aXKQkRzO0yETYx
         WAbwNbv5Y/59zHDgbk5ZFO8651xXgHSBHUEO+6oU8ol9kesQPkj9L/90oLMD5SAvsalY
         D5d7LE1WuFanZ7JMa4uX3yY7vaDesda1Cvv4aoU761fSZA+fwFxR+lea40phh53ElB4c
         k6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786051544; x=1786656344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8JFZqlB50uswLR58OmnyCXaxlSBWX6UZAyFotochoo=;
        b=l8faf/UmW1Qz2RrzF864twfYTt9P0Aiiuw7lVwAiaNAZXy3RFhm3zRbVUm7b28oWwS
         tDUgTmtabMMjZJ8LL/KgtPlEU50fKLiEopvi2KJKRz6VdrXq5a3VwsqJsxXpvVuBkpXn
         vzZnRkyfnsu3+O3btMDG16Fd8+RtuMYBohX6Yl2b9ODVGSv7c0LY9ccE32ni32z4XZtT
         yhREevm7yocwmyPrWD3evElEfPcAQlw1zE097r7k5KMDPMx5fkT9De3oO0S541XL7sUy
         PgpIp8l7euzC1IjtE9LQe2sx6mCyEnc0dhSIP922GnK4qx54h7SyPQ2+Gh66iJAkdkpM
         zXaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqQ8xy+95cP5s3XDbhxiS/WbAAg461e3hCb+WN/8kKZ/uDjo8qCP0HQ4b/ao6QAB01ms9nzZR6TwRrQq3Lq5Nt@lists.infradead.org
X-Gm-Message-State: AOJu0YxioKuLAkLez1Pfz//rA+RGrulBKVy08d4mp4PYF2DYP27HUXiq
	ky9q5/XDQuMlPI1Sl+fMId7qVwSV86MwtoGWiQWHPotbT7KN1Be46QI+
X-Gm-Gg: AR+sD12ejM/Y74Kxk4lrLEeysnnq32WzTNaFpAH26dI2+XswtgA5pXZYoOPQ88ZH78c
	L4IDYvpfDjxiszLwsZDXK+5E1SBGNTYOLbPRzd+X6rmPd41riVzJMf7dri+Pc0tqG5oateHElD7
	U/nqj6stc76WnAsiJlqumbfxh9TYJCCd4MFCkkDjvn13gYDW5kKnt/ypjjsv46CaU5yhmNyB2aO
	n4tcOh33BJBIslZOaOX2BUA37DY2q3eHtz52IqY5mfIt/EPCLdWDc3Ov0sK0YTHc9wX8PFXxICD
	ceFNPxYFSWBziUPCD+RPdB3TyWhGv2JZwLS87vDTKIbRhxbR14qq90A++rGbjy9my9AWV30leNR
	lmQtDqSVgqkt86z8q1BhKimDZJKEE3uYjOZLtxqiOdq098Sc7Par9Qe5aZbK2a+4DgdoWleC8Hx
	mk2UmgGUcGZVfcUs9Bkw+nsw64mrE28GhqowOyLiTDb2WXpCImytpYYgq+SVNyb3R+pAo9uad9j
	g==
X-Received: by 2002:a17:903:3846:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d0f1c5f19dmr118531195ad.14.1786051543613;
        Thu, 06 Aug 2026 14:25:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4ea157sm179095ad.78.2026.08.06.14.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 14:25:43 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:25:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver
 support
Message-ID: <60f4cc17-d545-45ab-8fe1-589dbbd153ef@roeck-us.net>
References: <20260804070351.1846165-1-zychennvt@gmail.com>
 <20260804070351.1846165-3-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804070351.1846165-3-zychennvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_142544_507929_4FFF3EDA 
X-CRM114-Status: GOOD (  10.88  )
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

On Tue, Aug 04, 2026 at 03:03:50PM +0800, Zi-Yu Chen wrote:
> Add driver support for the Watchdog Timer (WDT) integrated in
> Nuvoton MA35D1 SoC. This driver provides standard watchdog functionality,
> including timeout configuration, ping, and system reset support via
> the watchdog framework.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>

Applied.

Thanks,
Guenter

