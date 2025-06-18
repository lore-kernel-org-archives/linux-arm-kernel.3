Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4094CC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aooWiy38peBjxv+9KQHPPSmI2vOz+cAS4Yak4J02roU=; b=md+DWpd0TgvjoIfD7NJ315bLp7
	Lfmbc9GLuJgeUiMKF5IWQZK+xeJnRFPLsS+WtOA1YAhd8lbyjXksAZLZ4rxqjTdDf5hyVzqTM9uuY
	BSaBjuxCq1G+qMdr2OAEjM7rZniXRrUnVZmosl05DT+lCz578O7v/9gpUYr5N1LbiKjiIU1wOBoM1
	liIKsZ4hlskC/KpzdjzZ7X44u8wCRdjD76xdwPi4iuCZXsv7ef4KDnjXrhtKy+l4F+dpcEzU6zOIx
	fKhpI/OI2hOs9L0M1aqWxZhUBuWTfxZMLd5nkdPuqgR6IwcwCKwoV2NJ1O5pcFz1DevGuLRGF26yk
	n7FHD4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrfS-0000000A5CQ-3eZL;
	Wed, 18 Jun 2025 12:13:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpz3-00000009mDP-0xSA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:25:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a4e62619afso585372f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750242331; x=1750847131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aooWiy38peBjxv+9KQHPPSmI2vOz+cAS4Yak4J02roU=;
        b=yiKXRf75xH0BKjhVEKBiRHc2HAMx4XkZWTsMM3xwByTEy5BTGWXbTiT/lrkjNGTIhU
         VZrr0SzbvxrspxXDfqlJ1Uk4KemfBFZN5Me8pcB73fcyktyjNMJiEWqCwU17a1L+Sq5u
         UcfCW1gywBMEp9Q+Q9/8PbYukD310AutFDsa/d/y4vnb1yIwWpw6VQYOch2aZ5nceYnL
         EMbv28wL6IIET1R958ePp7Kv1Uk7rGGsZEkhCTKA+oOPFehHvJaJKRGp7Fet38kTU9E+
         XjolF/wx5xnjy/0sNYsAKS0DbU3DFS1NmUzxahlEMQOrQErCNN14ZMXCSBba/KRcR1Qy
         dFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242331; x=1750847131;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aooWiy38peBjxv+9KQHPPSmI2vOz+cAS4Yak4J02roU=;
        b=vVFF74/AY3gGW4Yu1z0KXEPbgbzie5cM3jSJHXj17DIaNI3/k6JptQaJRaSeErc/am
         klHcRxhGPjuHQDZ6+WOCofu1mJfucgvXl0cgQpkzKus7JIx6wv8bjZLdFaUEeYBVmjza
         +xz1vUt6o05PbYZRSJdtmtDGxunyS/VSv6TjhqhNhxEj9iQIEqX3xQDjOCNeMfGbuUud
         mr+RtV5QNI9ktE+ZRIGOBBsYncQRJqYtJ9lQRVRGkbxdg+cCaDc99w2TAAW/UYnCvITb
         VEWEaiMpEGh2MobD1gtPfz3qnep9S5Mh4CemZTPJ/JhtjdgFfcd+KdRJu4Znr+ITTh/n
         ESgg==
X-Forwarded-Encrypted: i=1; AJvYcCVoT08lTWGB4Q2DbNG9SFRwPk5e1KRWUYsVMR8Q//h1S1Ge/AXotyCeNiI25fCbqjXWzIes+er++t7txLEJF87I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+9tUb7BMWh2r8czwvyLTp2YVTSfJckxP4JkI9V8LDLGr8gm27
	YDWoTnnH2f7BuMAxgI8JF5oUTfn4lxZDAicHAeE7KO+Yh6x4YWQXM+j4uBwC0cOKutz+bxLsEQU
	BL1k5
X-Gm-Gg: ASbGncu1m8p2ZL8RBdPKAvmsnfQiBm26aVRE7eFJsN5BR27hHkfiHlJG3KiWU94u1Md
	n2BcDzVnPKmGnG0THzWjIPR3a4m5ZmwvN12dWMjDQIVkSDTEG+pQnod4JQxf+2zg2nlJi8gmECB
	7ySTNY/HcKXwHCPpZNwP8EAZbLJSW++28b7xp8q9xxVT7Glv6YpEjHWrR4jcH0nzkCEoSYQn90w
	QMaO7IXaxcLjtZLQ7xBIRzcWFDVoAs3bfHxEjZ2igBC3wXuvFF/vK0EsJ+vQcL7M5Rlh2NCXFZp
	EySFySpkoiI7iF8l6ewoZ592MIn/b5wpgH5G7OVz6Tolcbr9ynUqP0Bmis5O5K7eW/IxHrFkFai
	7BrzOgnY=
X-Google-Smtp-Source: AGHT+IHJc2gsfkafUzYDEVgL2gH8eVceTDIyYVW64SCKXWQQR0AR9QQt8oTeByDjnRB/rhjrFb0byg==
X-Received: by 2002:a5d:584c:0:b0:3a4:def8:1465 with SMTP id ffacd0b85a97d-3a585f73c82mr2051598f8f.9.1750242330796;
        Wed, 18 Jun 2025 03:25:30 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e256630sm208260265e9.29.2025.06.18.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:25:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, Faraz Ata <faraz.ata@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rosa.pila@samsung.com
In-Reply-To: <20250613062208.978641-1-faraz.ata@samsung.com>
References: <CGME20250613061230epcas5p12c0a029edba39133fc0be22cb0aa1e09@epcas5p1.samsung.com>
 <20250613062208.978641-1-faraz.ata@samsung.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: Add DT node for all SPI ports
Message-Id: <175024232949.57697.16977719390655455377.b4-ty@linaro.org>
Date: Wed, 18 Jun 2025 12:25:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032533_269949_487337F9 
X-CRM114-Status: UNSURE (   6.86  )
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


On Fri, 13 Jun 2025 11:52:08 +0530, Faraz Ata wrote:
> Universal Serial Interface (USI) supports three serial protocol
> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> Add spi nodes for all the instances.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: Add DT node for all SPI ports
      https://git.kernel.org/krzk/linux/c/134442a04bb9a6981923cbb24f041b5f5690bda6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


