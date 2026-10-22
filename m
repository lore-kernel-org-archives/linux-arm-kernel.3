Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CA160A6F73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cpdlfMHk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XPjEMR0m;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bFeClgzS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=; b=cpdlfMHkbwIDMU
	wfAt6HEmgM66zwg5JMRJXP//lVzB8lsA/4H7MY4zOW2lxwu9GOW9KL6iJnBejA7BI3hwFiIeTk+et
	FgcdApAGTR4VEbLO4G4fbjo2WH1snSGChnZjBIteZHNw/SkSPz8xiYvZw/KW5x6phw0+PzMV/UEPt
	yQ69HhaBqFAwdwrxy8FeO8aGKRnIQ4XR+71P2Xgq8U8GDvDm7t3kIZRbMswFkLSldkg81IGb8XQmB
	THDjjeDIathLisqMMSwMCHp6Nx5iOKfbQJvAx6LVcDTWZOBjnjjkm5ZlJ6AcYBG17xMfuxPtQtNcn
	1YDCwPNX7NDYA+xZwavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZb-0000000Ei4Q-2h9s;
	Thu, 22 Oct 2026 18:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZW-0000000Ehw2-2xem
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 18:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=; b=XPjEMR0m/VBwbuRM7SH+o8gkaL
	sFjtK6BsyGdeMMH86i0j0NHpT6ZFi8FrY95tbXm3T1jjjHWy6ZGSLDvZGUqhsJT6rWEUhfNbPWJh2
	v67hJm5cg9aQElQBOw0azobqaJfiesenmoQ4dPSf9WQTTGyPJLdmploNB/hCLMNJTfdKFx7ugnrku
	hqSBLrqCzpeOjCI0WqENHlcSkbw1Rvc2GIsxo7qvd6v8BB5BSQtDq9vZczTsv68il6SQDy2KKA/m3
	IfR1fbkzlWsb/Bswb0A0pBv7lfV6EY29ybbTHg6ZOM15okj7I076q9O8bQusWcfWgzaEutZO1x0W8
	GScnsXEg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZT-00000007jXv-0LF7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4956869750eso704925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693881; x=1793298681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
        b=bFeClgzSEGxoskK0Ddw02YRQxjmchlL2iiK6XmRkaL/0sWba00PiDC9DXP/d2dKF+9
         yu79LbJ6Ng8Wpdb3kbJT/40e6E0vnEzFiRuNITe/ko8v96LA4k+2HheQYUlaQEoNr/BI
         YWhlSkmQ5CYdYKfNCYpLlQmfdD27cDMbADkXmtbiPyhPV7NA6HfSwAyC5wHcZAEZwpAH
         WAXDLj9fUs7OJiXooJ9ZsXs4tLA+Cruobvy/5NtcTgQVelkG/pt822yEgocbTYwehEBK
         ELZOAR2t+CG1yDW+sUW7/OlISvEPfXknJG31DChx7su0W7a2j7bRPANv9vZ4gd360wDk
         qx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693881; x=1793298681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
        b=Us8TNNKDECKCFF7bZDPJo//rB1nFLYi2mzF3NSdCi8hydSivY3o28qHXDRODO7C6Pn
         qxTVJ51zKSWnKetFLlRV1orhiJxOpz1hNbPyavK82iqF3cJ8/teeJedKvbYveE1czqNY
         grYkeBg2CRoHs+3mkNOQS582wg+vnQA3xGHaNqwA9BLwsQLzkxYBzeuovuV/IWxbGujO
         nmoS34lc6HK7Wtfk2aK8TBuVViyjPlK5C8PnWdQpWrATr4JDuTVvVtgAUoBvSswQk9RV
         F880scw9dgrGKCWYqRbh6+e+kN0HXJMSlrj51U9k1A+rZb1taoi+EFvPzKIho3XxoroT
         aKJg==
X-Gm-Message-State: AFq9FYJfdR8NetAvFO3HM7uKHyWf27HgS0g0Onu9QBjEz8QpjhIWaNRE
	Fg6G7MnFuEXhiJxjgDXw19vytlPGYle+7sgemz+KqEvlwd5wAOrCde5rDAqFQhej0wM=
X-Gm-Gg: AYBFou1Lehe0jldVxT+YOStkKldP/WZJEGoyXB+XDcrG5IIeKIUNgFZzJFc4I4khyAi
	zluqVTWrItwnaEah7fRurHn1OJNu7Ic10Dzbo4d9VJageGn/wMsTLy+QQ92o/vAX0hRmPmFx751
	G3z+ctv4JPZ+5/CJVm/J20WyoaZlxFVY6lAcwj0PIY6g4UwM2AlrqIYuW3gG6E08bg9jkrCmCt/
	eWwC4I3If2YpTnk8CSj/cYsukM2qQxJ3xEJ/bSvMMXm4Xn8yQiM3TTFHBS6lSYd/nDEcWed9ouv
	0ozm5YiFbWgLWgWY6ljz0HScWTr5xkgLV27jca5UQbaiWBCqpjtrgV6yJWI2WUR0YODMiKxwG+j
	ZZiIDHVjySQmQnXPcITawOlYVK5Xzp0rO9I3mDp35UQWHe15E30YpdUldw4UJsK9jIvZz/7VK97
	ram6f7Kwy5dvVADNPmK15JGc/At+e8LTe1/6t1ssVDuXNevpcMUp58EQPPtFJphJrETFxrAA09q
	WfoBqaHSLeEoRQuSFts/TFEC0/i13TKYAStucE9ZVToDdxPk2ZePsS+pU77Zg5d4sJOj0xaFMw5
	aSR5XKcmz0xd1Dge0leNSFlgTZsyKLEYbfXMX/WqrA==
X-Received: by 2002:a05:600c:19c7:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a1fdd2f2ecmr113114475e9.16.1792693880575;
        Thu, 22 Oct 2026 11:31:20 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:19 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:29 +0200
Subject: [PATCH 3/4] arm64: dts: amlogic: s7: describe the GIC
 virtualization regions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-3-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_193123_427013_E80069ED 
X-CRM114-Status: GOOD (  13.35  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 device tree describes the distributor and the CPU interface of
the GIC-400, but not its virtual interface control (GICH) and virtual
CPU interface (GICV) regions. Without them the GIC driver does not hand
the GIC over to KVM, which then runs without the in-kernel vGIC.

Describe both regions at their GIC-400 offsets, as S4 does for its
GIC-400 at the same address.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 89b75bec40f0..a337783c7783 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -121,7 +121,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x2000>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0


