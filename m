Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F92CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2AwA2f/f6W+wFYqRdKOL2857kAZtGdLXYTnjc91Eh8=; b=ebpFsKecs4jPbWdX2BThvXK+J2
	aRDTgFpibNVtodMFuxM32mRjlJRpHVm6Hfs95ryV4XPfIOpJfyqGFJeCP4Bx3e/lnHHYSoWVDIg6L
	3ifZq1Acuv2cygQpoUcBdx0mWZsLNZi1EntDVin0WX3scGMrRywqSSEDo2lqnDFaFJWzdB0sibrxy
	+NdgQ5018aLMlOwWF4g2+8W5o0x1qhJvFDPvkNY8zzBclxOfJ72R7pnlH+/C95m4T4YBGO7/dd/FT
	p2GsNwotMATyWe+/7ZvSgKI0+ZYnr2NCdolEOQ2eDAp8XNkIrsiluScs7eQ4fUXyRT8/bF0sfVDpr
	bMZISMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0z-00000000Tvr-1SIM;
	Tue, 21 Oct 2025 19:27:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0n-00000000TsL-2bfm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:27:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so9662435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074832; x=1761679632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2AwA2f/f6W+wFYqRdKOL2857kAZtGdLXYTnjc91Eh8=;
        b=Clb7CLLqD/dh0L8ik4QXkfKKUushuDuf21t2fjehx+gMHxUlxk8cEZHXd6nJZJBaxO
         vwAbY/Yd0FastOs+sN9M1YO1U/p1rarR94xNXmavx3mHFDM/naQ+wz7po7AfraR0xU2O
         Kh9nzGjXpjz6NMYk6tEWqcCHMrqR8/FCn2cHuqRU1gR1l/l+Bs8YN5k2bv29uY7m992H
         4Akx7CiyyNnhkEzRSLm04C+xJYv4ipJUwcUwCwnSvNFRg6Amm6/L3oWESac4SRpGRYwn
         np4XcuuS0xCbm6XVcCdauKM5QHPBxGaSXA3XHZn1KkGdHn316r6nX6CujrnO3RlZIwS6
         ASOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074832; x=1761679632;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2AwA2f/f6W+wFYqRdKOL2857kAZtGdLXYTnjc91Eh8=;
        b=bO7nZ2Oc8p06B0ehpuLMKrq1+h7bvasSRm3FRuATPBGkXtvA+EYynRJO+WYEoiE9Gg
         0U2/9hJykkGp2kKxfancxaJntYkLLMPATmZDRGbZs8n0aLNgOYV2hna5+laKpfILkg06
         L/Op0+FwviVVbE3PBPWf1/7blDjzSjxUuxuX6ciOdow8L2wtL98MPFZwn8Oqr8t3rP5b
         zMVvkWsxWKIYqOBFCkPIrb4rPXhG/7nRXpHGMneGvSPV4a8COd70Jfe68T8SDjFTcm6D
         Qkmqr/XZ7JYMRWsbOVjzNrEI/9283u76aikbKsqCPYMpfkEky7Vgem91KGoJRNW2fevc
         N7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCl6s4GVsUVvTkiHKGqSp4Gkeq+iRQ3W9ws59kSDUXqGsfTX3C9Auz521Wlu/L+DjTENOxYX9O+OSrj35Q/qYC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TsLCkBE4jKwcek20Qz4WvJWGD7q0gpQZc6NoEJdYS3vSbkmR
	VvcC8HyBocFI8WdEdbWBI3umVnfjMsJozV5RNmWPDaHK64XrvA2535AvSEZWNRuRXgA=
X-Gm-Gg: ASbGncvr59UDg5Lt44pGb+hG4okoxQ0Yo4+OLLuyfZfusxhgBHVFcqCCISD7FVRNjFj
	H5YksCkpsXjdUwdZ163UN0vg8pXdlPz+d4gfXoHBMegv0jVb5quQa7F+bR0NS58p92iMs77nj4D
	7MvsvQ2gUTXiFh+X9G+fAq77PNoLvtY0ILWRxS5oPTyNdwUOsxTaqJj/7tkuBLUt1drIcAtTYm7
	CxiSOmMKOeAo8j9VNYudy3vRqrKdAn8K1iVpAbrx2McCWMcNSs+CeS4eyQFP6cFBeYzc4ydbPl2
	5xjJEQuXoVi3RnjOf4F9vk9IhiR3IoqCuOSooVF5YNiqHqCCxB23osDdZW0aDlJNJWkW8H8FctM
	5YUmiA7bc7VBSdN+eVOuSGupKJfCwfi3vVcppHDQnzZe/Sxqn8+MQCsXRZLEPQEnwExTs70v24I
	CaUgbcdhOXc5jk1O5a
X-Google-Smtp-Source: AGHT+IEAsN4GLGZOi/gLAJB0fdHh2RkmlNERThaNChpJGeL/SOfJubwUVSTNSVXsVki9aW7gKT0ayw==
X-Received: by 2002:a05:600c:3b04:b0:471:12be:744 with SMTP id 5b1f17b1804b1-47117932dd5mr72625585e9.8.1761074831798;
        Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm
 reg property
Message-Id: <176107483030.33931.17680247324177119299.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_122713_670753_6309A0A9 
X-CRM114-Status: UNSURE (   8.05  )
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


On Mon, 13 Oct 2025 21:51:34 +0100, Peter Griffin wrote:
> Both the start address and size are incorrect for the apm_sysreg DT
> node. Update to match the TRM (rather than how it was defined downstream).
> 
> 

Applied, thanks!

[5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg property
      https://git.kernel.org/krzk/linux/c/4348c22a4f15dbef1314f1a353d7f053b24e9ace

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


