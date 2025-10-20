Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802DECCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnPFmndDgQ5IwJj7APl0bxqe2uCJD2IB3khq/qdk9Cc=; b=Xgn6pOm7nqkI1zP5DDwn+Xepkj
	yu3/dZe9qb9bSx5p3Krjro38dnEtArFqGLXd4lw/Jo9aHRmyG5Tx35QraBF+3/wfq86+7MN8wuqyh
	phbDt0sxGS93r1dnr5MBd8sv5VeWQgcCNX9W5V9QdVeCLkGPXgqh6+XywEabHTUmhiuDpmAVXvzyR
	4c06lTR+tzR6Bc66wsKZkUa+k0667J9AjT+SqmdDx/WS0JvbWwUnlm4ZWs91jqoXkNZXr3M2Vmj5T
	THvgKRxe1gwaKDYhD6ANL2Tj3FROv0qtKdNI1HJMaJjqFfYYVLPI9IXSCtiPiAXmcd9lv9CBpqKf3
	8TRbV/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoL-0000000C6KK-3i8O;
	Mon, 20 Oct 2025 06:56:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoF-0000000C6GV-2VaJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:56:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b43a3b1ae1fso105158466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 23:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943357; x=1761548157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnPFmndDgQ5IwJj7APl0bxqe2uCJD2IB3khq/qdk9Cc=;
        b=rJDXUyHFGLMr1YxlIZwNkkyzZ8gtKAJC6C1witfa4jtFZbJrmiozqf63Frjyte6ESQ
         5YWFh0U0Job4CLwWFUeTxYU6/wPVfzZBr0R+/RjCBGNGHwagmkLPUwPHCkfbP73258v/
         aLM/BkhN9VcrNLd02kJ0Nxl9es4a9fQV6+oYz3ad/1jZxXO9o9J3Pln84rMR8BHzCiL2
         DeIlOULYiTlH0WBVDBWF/4hA6EjCz2iPUrCBgNMXf4QzE6vQd629V7YvvqrJblCQSo+E
         Vrl2KeFjcUb8O6749I9IaLtsAJcjJveJEmXym6xTnPnq88tLHYx0eFErTJhp/USFQMv3
         cnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943357; x=1761548157;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnPFmndDgQ5IwJj7APl0bxqe2uCJD2IB3khq/qdk9Cc=;
        b=hC66pqKBDt/ssHSNp1/TfrPQeD7QAytv4QR0RVIpe28/LKWHyhc7ekWJNxRsaYja6R
         XeqnPDe4cAPnE86YtbJCpsvPTAc8hkcj2bCbXDgfL8YXmJr4I4bZj+7kAzDGeU8sk3Wf
         Cm/3rFsSOqVFm4WCHgdtv6KmVHY+kZ63IzXN3t4D7nDFERQ1IpFWJSYQzqMIc8D9IDYi
         Yv9Rg2uvXT/wNrBWfGTy+K1Um/9M7tqlCyecsI7fJwJInsmbds3eXqMVMapqY65epOhA
         Nx+fEeRtk2VwcZl8FGd+SlDaSx+skV9+MII5KNPSOzDofc2WZLGqIHimMU7YUie/c51d
         q4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWkoY6HNJ0FgIc4m+rwP0n+rwIBEWQPjuSrt6Icys6A2vH/aNiqOUU4ulafYlAknXkcEIcO8r8JyHH9sX64RMhM@lists.infradead.org
X-Gm-Message-State: AOJu0YwdOTplQ6zqFox7+cECeVTKpCwiEOrXUTaUrTmpiHGYZw4tSRDl
	uhdHL0naNqojW+FPn2ffptAT/h6e7DXpung4DpfuVPfZAdCzE+pWcloJCZv6FQNLbNlailwWeSL
	rM9/O
X-Gm-Gg: ASbGncvLVfrvk5e/jXjeZAfhz33n96mrp9WVd9gdQ8KAp/tUCtsreDwxXb7EpFKunDs
	fRCckRSLzNxi6lQikc8ptcw9sCkGdpbSI6z5VtsuuP8IAtyZWO+Y2ZhikUblkJCd455P1/7PDWO
	y9t/f+Xid/SIT6mvX1NKZnPG+yotiy4gf9GtCqkblVjisAYIiNfR9GiinE4Q56SCLfOaSXmEk+v
	assDCGevQoqDMoHHCMTaM/dlXCglOLdgWl2xhqoxAXnNKDWX9M9JeD4BNSx3uIsXUP7s2RMFFxO
	2VZOTTk9i/XkYOLU8ZBA6xtHM79RRpbz4i6uoSB1XcBl0l0Okt8OAh/YQUDw/WwLcGM8GXC+Wx1
	1MCHD0J9/SlHj5GUluh83HB8GAhFNFv9BC+sCQUEE4FxnOJN0WIS1ceRIlbo1/6UL3G9WSDEcEj
	omWz8kcfuxT3CHVCdy
X-Google-Smtp-Source: AGHT+IGM6LazFp2mSfgZ9xBnbGP6M9hpAAYO7X9ryVeCtJlSZaxmstc5s6rhO0igzS0nmtIalIlyNg==
X-Received: by 2002:a17:906:7312:b0:b3f:331a:a98c with SMTP id a640c23a62f3a-b6472c64be8mr763154366b.4.1760943357324;
        Sun, 19 Oct 2025 23:55:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock
 driver
Message-Id: <176094335539.18498.16396321408282036378.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235559_663266_84173026 
X-CRM114-Status: UNSURE (   7.89  )
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


On Fri, 10 Oct 2025 12:46:34 +0000, Tudor Ambarus wrote:
> Add the Exynos ACPM clock driver. It provides support for clocks that
> are controlled by firmware that implements the ACPM interface.
> 
> 

Applied, thanks!

[4/6] clk: samsung: add Exynos ACPM clock driver
      https://git.kernel.org/krzk/linux/c/40498a74205371400a5b0088acb886ac47a523aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


