Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1510C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmNRahELJKfk7DGsqY94NUNj083rstNVN6mEe3rZUV0=; b=U+FmwqJ4jJHUtJgKBzy0BmHw3V
	cbgySiG/DjNDh7RsWb4sj7Ngq19mXsfkoKKttZmBYFEYNXIa2cgCcI3mlymd15/PtRvpVBMDJHApz
	corB6ps0z44REK26U7drguKdrHLGA+vqPoqwrrav+U8QSUx6fWQBnuB9IG4KBvaWXEFs3+mKiK0UY
	nFqjprBL+AH2LQGzVQ0HoVi+0ShmIxxJBgjdLgd28Ga2TvdUd//MIOqrrEHAF1DC17RPDCb2hvcrF
	1vXLL9etiHfh0LTSM69smS0HDnggzYhBC6YGCNO7cNLc84xiDTprSGu8Pwy1W1Z+dQJkxI9Vj/1Oc
	uebnVy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1cZ-00000000vOy-1S7o;
	Wed, 30 Jul 2025 07:53:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Sn-00000000uIN-3Sj8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:43:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so2713091f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861380; x=1754466180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmNRahELJKfk7DGsqY94NUNj083rstNVN6mEe3rZUV0=;
        b=GcbK5C3FPN9Xv6uDwhpV8xfMntPNXcZYC+/e2EPWa6Bl9uTP4KVL5OnlIGl0aAXLsx
         H7iK2a/RiejXBg8c+tFwKUDJCvjtVdk7Gc7gQhDP+rxw5CxTkA1EDpwNQ/1qaHhBWQQw
         pMRPItFd8Dbdp0kv5KcjYR7UG0dP9VkcxgmosC7qFsN0YXLQK+e60csYzEYBEmDDYlbo
         uJjbn3sSsJt7ihoKZqVq+aKxiLz2PIULJy4p6RzIJra3hvloO9YiHlQYzvHXKtq/Rien
         kX5tXSfRCOYYCYwS31EWYxpz+xRpuEJu5e0TsHiKWWzpUYY+BFVgx8CckU6dQVEE0s1m
         E2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861380; x=1754466180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmNRahELJKfk7DGsqY94NUNj083rstNVN6mEe3rZUV0=;
        b=omSOObHQX7NJV282QM0ZQXjC9L4F1AJWJUqgAtc+Oj6r4gbgmuYCvC4mqIDR40wTjv
         zAZiuZyfydcd29Wq0QtyQRDlUyqbfziE43KDReYnxVumeh69akugd85n5GbLH3V1KmM4
         H6yX++EpLB3RUPDijYw7YbgQvs947bXvhUh8Bc9L+kuY+t/WnArpAGe7B7fOPJItYQyv
         rbFS0p5u5vikIr1uy060dgOh5JxsGRV++IUrpzENb/65lNUw16GB0NHnu9i7b6ZKUMsJ
         0MnP3XQttBwv7qTq6QtU4lXC41/rarBpW2WPaydfkMUOzTwhRVj5qDSNwlgve+YNoFoB
         ngzg==
X-Forwarded-Encrypted: i=1; AJvYcCWij7nuwhUQlxWgD7v8xfYqvLYpMjuGk+m5mPiv4Fid5oYes91c4ldUNx0u1itvX//e4q57f8fmyDSWn0O8iHvR@lists.infradead.org
X-Gm-Message-State: AOJu0YwKjqzk9uBA+Va31HD4lQJX63vmaIIHxFH8N6PAJ55E6NQ/WmQN
	1fySUamtt935JQwPtCu0w95ICHbS0LbyqBufqe46PlWumL0POdcUA7uq
X-Gm-Gg: ASbGncuNx1bn+1yeNUnoWTPfX/BG0m4ukEZmT6b7wbwoTjJK5z/RymjhrLD61/ABeh3
	61AgyLa4ps43iN3SrUomVtKHpkFK6EISUQqZvALBJ8DDy4MRj87efQwCWqHNUjC/Q0sTqN0Lqzy
	86jMXSRmrytSnG6A7tDiYt4Al6jRZREmaib4APpNICgsa+w7PQ1awHimLZP3aB7Fu3HHZGrP7In
	S18GcJ7H2dizJpUQACEIh8kVrFtLEcHxfiFWoPlxXIfBN1y1qK7iR9Axj1JVZd+dyeIxefA3sk8
	M1XoWkW5HcfVRmh2s5pYDm2Uwou/NsctFhi56psIetQYiZWnR4tk89ByylbJK4uPH4dY4q1C70a
	IcFTD3kufk2AhvN389KARVciopMEJ3rItJilvZNJfz9kEi83nRruAl7U1hqKR5A0s5OYXIwQtiQ
	==
X-Google-Smtp-Source: AGHT+IFB7pO5ICG2nBHV3T8aZx4gEhbOCX3xN4F7+jjWm+fkyHGaPOCgYrlo87wNUpQ+XfcovVmpeg==
X-Received: by 2002:a05:6000:18aa:b0:3b7:924a:998d with SMTP id ffacd0b85a97d-3b79500f77fmr1842762f8f.45.1753861380235;
        Wed, 30 Jul 2025 00:43:00 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:59 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
Date: Wed, 30 Jul 2025 10:42:51 +0300
Message-ID: <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_004301_860668_C5624B94 
X-CRM114-Status: GOOD (  11.70  )
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

Some USI instances have swconfig offsets that reside over the currently
defined syscon ranges for peric1 and cmgp. Increase their sizes.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 943e83851..bab77b442 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x10720000 0x2000>;
+			reg = <0x10720000 0x3000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
@@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x14e20000 0x2000>;
+			reg = <0x14e20000 0x3000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
-- 
2.43.0


