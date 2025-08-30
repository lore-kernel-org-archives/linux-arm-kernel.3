Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B51CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwyiQhik7suc6gbVzjEP6jIHrXVEYERHfJGEwviQmSk=; b=Kz9Y4ssnGrnUNX9JQPHJ/vJiqz
	b3ooqPWCieAoc6xnhzN3ffCoyT6L1kyc8Rg1yYeFGwrPeFDlecC9zqKeM1evc0V9GtPcPDXiRndQa
	xqhHpinqH9m655PCSmt2K5oZjBLesCw7NKFFg9nm700cZTZXraCUEmRQ+26VcgHmlIxzCo98e/exR
	vdAM5UrVpBIH7YPzQ5qC+Up9b0+asY6zPKHuKHK4M/rCm16DCrf92KEfHdpQEqsQSWfzqMwDjD4Va
	+1FS5HUgjOKFurnP1vxIC5C5t7X+4xGC6AdnOz6qPNnzwpg8wFbhptUNYN11Fyp775vMYybs7E37X
	7G8oUMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHsC-00000007fjG-47dM;
	Sat, 30 Aug 2025 09:27:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHkb-00000007fBI-3tUL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 09:19:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3cd151c38ceso415630f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545596; x=1757150396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwyiQhik7suc6gbVzjEP6jIHrXVEYERHfJGEwviQmSk=;
        b=WNHJ6MMoWNgRbNpD2QfPv9F0bNVO2JVo+qLBTrd0sVpYwndCq0ei6igUotWhbhJDvE
         pdBAGMrjNPdXM49zApluqStBb3pn0NTQNG+XKzJClpaMH+w9va0b3wY4RzVnaWt1FN1A
         n/j7DfB2ZHeOyG/zUhpG108DwHs/5bvGlgzPfVCkAEtsBLZzwzFzm6sVwcmi1XEKqQ7i
         BZcU2T2XsRy1KdYCFXs//VPgCd1MF2C95L2CRs4gVG9YQm6SJfx9YxxlyVUpw6xgHvXP
         onbRByMuVr/BalddFHIN5uTfzrlK0pMIr41Kk+zY7dqtmjfDlheAiGJ5RMTpN08fqF7G
         6LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545596; x=1757150396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwyiQhik7suc6gbVzjEP6jIHrXVEYERHfJGEwviQmSk=;
        b=GvB1N1UtJT2mKGfvustunG7AUgh8Emy70Z8F2DaixqZiTI41bgcSARkmwoy3ISAb5X
         hMntow/Y4inNB2+Fav1jTebJnjgci6qVvmZm+RibP79jUu+2vWu7nN7G63mOXsXa6Nts
         E5vMyM9j+Xb8f9PjHYhx97lJQHZBMHnxmLAcKCRVHpcDpgfjbZWfe86jZg9YxDzibbvi
         Ubnv5TKR+fkq64tLPSjTN69BL26DIfl2fFshKOyQYx8DBPzZxQ0Z3xJ0wSzeEx535tZl
         1tPCJu/b3h5Lg8oG4EZeo0XfNHFfwLpqed64BeB0Pq3qtDpc7S8n2s9XX1h1UTxwEMcz
         mEvg==
X-Forwarded-Encrypted: i=1; AJvYcCXCJFpw9DR64xXH2GsO3sj8P2gl36fwMZjEw95NUlQ3A6degBfagNh8lLNZiOvy5yc3dIc9Nmf4Zaelw6+NrIHv@lists.infradead.org
X-Gm-Message-State: AOJu0YwEs1yKL7PsXXwaQ6suuZPg/nqjXNGLBduVGK9TGuT/2BpXKh9n
	p0VkApS3lfoK+tGcWWHoRRb96/hLBn5sUs3AhV9hb9toS3skYatBlzf1ZjsRhukoE+rk03qY2VQ
	Vs5/l
X-Gm-Gg: ASbGncs/nkwAnUStZ+pZ6PQYc2Bg5DA6I97rDF3G5AZfWhJ6A3DbhL0uJgSVeKhbg+L
	NM51X1P2MiPpRa/Cy7fE5eFZCmqdZoCUPWn9ROLq13pWmJF6MSSdxcBN9P6ZPCqC3OkiNauvtVY
	7I0F2W2iFkGbTEpJihuHOovHm0blmXRQ/LSGgce5T9vokb5lLu+0nruvGYtfH9VcC8apyFCQ/pl
	n/DyJfPOVtlMn7oTTu85JG3+HjJdfdyW++J0/4eK3K0SfBJDwnyN0Y+aNkA9PtT2xD5mkG1U6lF
	YG3BOhCWA+RNXXlkmRUWbCqyiCPqv43bBFMNcBWanoZgGbBAlmdrzWSYZhIuhj2xgP6zn8rMR2K
	kg3LmSeBUZ05t2qmQ2Gz1vEl8A5mnDPrRTqz9BUz7QfTNM3bqcA==
X-Google-Smtp-Source: AGHT+IEqjNRxfqqCNOguFU7c3K/j2n3eHHM7h5HhcZ/u9DnUpSaUb/8k8UWDRGTaDD9Zj2mt2IJwjw==
X-Received: by 2002:a05:6000:4310:b0:3ca:4e3:6e82 with SMTP id ffacd0b85a97d-3d0fcaaaef7mr1613229f8f.11.1756545595916;
        Sat, 30 Aug 2025 02:19:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:19:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial
 busses, except spi
Message-Id: <175654559458.10738.12093256253809127560.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_021957_981818_F8F99C3E 
X-CRM114-Status: GOOD (  12.16  )
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


On Fri, 15 Aug 2025 10:04:56 +0300, Ivaylo Ivanov wrote:
> Hey, folks!
> 
> This patchset adds serial busses, implemented in usi, for exynos2200.
> It's missing spi, due to me having troubles with reads when testing.
> Serial_0/1 have not been included in the patchset, as it seems like
> they're encapsulated in usi blocks, but are the only implemented
> protocol and/or do not have a dedicated register for setting other
> protocols in a sysreg. That'd at least require patches in the usi
> driver and bindings to add support for.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
      https://git.kernel.org/krzk/linux/c/1219992e16689f4937a333c98d90cf80ba91860a
[2/4] arm64: dts: exynos2200: use 32-bit address space for /soc
      https://git.kernel.org/krzk/linux/c/ad8ea30db80f825215d071370989b8ac45298a1a
[3/4] arm64: dts: exynos2200: increase the size of all syscons
      https://git.kernel.org/krzk/linux/c/0dff00633bbc8566fed6483daddddfa0dfdcf83a
[4/4] arm64: dts: exynos2200: define all usi nodes
      https://git.kernel.org/krzk/linux/c/1bc8f09ce98ca8a56f2059c9a8fe26cc351318f0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


