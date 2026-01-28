Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD213D46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TG/VYLW8d8WUt5vElKzMRZGMulWbxOL8O7SIiAnHR0Q=; b=zSiifwBgCt6u8b4k9NCl1ChL/u
	Hhde9Z3O2hMzjR76nXYmyVp271I/ZSlhPIM5DOTzt8Alg6xx61J8hyhsoE+wfVj8T7VVmdSXAtXUV
	FfNp+CEYqhbaK7Jg83tnk0jprKX9c5JEGQBkJHZAlDM08yQtvZxZwLA9AROwE+/R7zazxCA6HUH2/
	m8gtKuwUO1dooi5UXQWF4y7M9aaESAOjLFeo8nl7ynlRjzeaeSj3ZfkyS+eQUM1MSnr9mGbn+nyuV
	JZ2/X3fqK4XHlRJyGKl4AadMbz6XTIMSJTP2sLuKzyzJl5Do86StQ4BDy91kFdFw3+qAzZIobXNnG
	TUYqSxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCG4-0000000GmHW-1ZdO;
	Wed, 28 Jan 2026 20:35:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFv-0000000GmDM-3v3q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-435a11957f6so232501f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632514; x=1770237314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG/VYLW8d8WUt5vElKzMRZGMulWbxOL8O7SIiAnHR0Q=;
        b=dBfKdNKXlplbWaAoO21eXVYrRdfVc/hnPs6OYOreVnPgp7yG/U+J3yAMtqsa2ZCFpf
         qw4ZP0AZjSCCg8gpfsQrnuhwFyL7iOQdLhFp+PHJPxx5jXVH8xHfwTqaqcox3R4JnQX4
         lfcMDpNqd0oZLhwAcfHjkUYXCsKZmOMjtq5n9OlqFcvi+5/+QQ1T8OUHi8CWUNNxcm7R
         xKv6EHnoGF+LwuEmdN8yymVF5JEjA9LisROC1hK1zu4dvL2xFxywNKRNo/N+FSaWwD1y
         EqdsdGF4GbxtVERbCsLfGWCQuHicwGjgMUKMOJWLbpXLjQoyC4gHb+1c6X8xumACIBCG
         XtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632514; x=1770237314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TG/VYLW8d8WUt5vElKzMRZGMulWbxOL8O7SIiAnHR0Q=;
        b=Y75cltx2DCYGQNO7QnTYRdIWQWNBtLm2q7q5gC7wu7tezo5MPWaJLfJIc5ekmHqN4Y
         ZiowSJM00a0oXuNefGHLjfTMuMLaQwjorT60odncTgQDPUjW4JzS4bSRpKW7KsmB1fqK
         ig8vrtjVeuZ4PtK0DS11F9hpi8rXBvEEG/NiOxRokrm5i9B5PSUQS76ENSAHZV89NWnk
         aNCxtI7ZRUnKQ0FIoFRp37vpZHwKLB0dlufDDtww5shTmkINkCkNBL5Txu7MJBvsf3ib
         Yy8IWtKj6FEghCV00jl+UQOiJDJ9m/DQGAusWaNkRkp24R39NTzlkdUIxfEKXLQtRxlV
         gE9g==
X-Gm-Message-State: AOJu0YxIsj0rvxK1Fe5vzOxIhTQb7Izr9A3WgcKhxc+VleRwVzjDXO3z
	1r27h4cFOVPhs7W8q58c6ytgB0PwDuZ5G0CvcklhiHF1z3LuvQT3khSqf3DtCtMr
X-Gm-Gg: AZuq6aL7pSaSrHV9Njjd5N4QAv4rh5F5ke0ZTvtYwqvlw0mw7x+WbHCMx6C4B0vBGmv
	6v36B7PFLlzuF11Av0Y46kiLBPLC/mZTCJZQ5QONxlMUF8RWqLwM7NALEhFdvqZj1hGIpHv8M/I
	Ge+TNk+KJ4217zapCr58dNrzDkzuOT0xmfC9g6CiyxsDW0p3lx+I9DfiXgkuceptbhV96OX26bN
	mR8uzXbpuLc7Jf84HmB4gcvntn3tDxuWiaYTwdJb0KFoVYpqiJ4Qt9s/BOzTsGysZ9orCF1hq7o
	EmJ1n+zYPKbV0DKYRVPwpfrJ7KX3ovn6wF6b1IPx2wHJSbnc1O278e2FSYQB7IQYwlD8zw9+NJU
	yxOaQxCyxftxImqV8t1UHFE/kB8YwhOFeSHksLo3nT/Y/nGVKOt17XbvWFGIHsRxOiQ2XgdCm4n
	LKwBiwOfi00/THwzDMpVBZ8XQWLNnhqf9WNGU=
X-Received: by 2002:a05:6000:2c04:b0:432:da3b:5941 with SMTP id ffacd0b85a97d-435dd030495mr8986801f8f.21.1769632513968;
        Wed, 28 Jan 2026 12:35:13 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:13 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 5/7] ARM: dts: Add an armv7 timer for zx297520v3.
Date: Wed, 28 Jan 2026 23:34:53 +0300
Message-ID: <20260128203455.38569-6-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123515_988332_1EF63187 
X-CRM114-Status: GOOD (  16.39  )
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

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index d6c71d52b26c..ecd07f3fb8b3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -24,6 +24,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
@@ -33,5 +42,20 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			clock-frequency = <26000000>;
+			interrupt-parent = <&gic>;
+			/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+			 * arm timer at all. Since this is a single CPU system I don't think it
+			 * really matters that the offset is random though.
+			 */
+			arm,cpu-registers-not-fw-configured;
+		};
 	};
 };
-- 
2.52.0


