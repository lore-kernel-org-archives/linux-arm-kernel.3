Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A62AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=; b=ojxjP2lmvh9XYokI6BASrnNG16
	VX3S0nKEx0IxRjTSUgJAdgM6aGg5J+nQvMPQOjD2NM3Bj6HRiVOaMAvOr52PY/nMsp4oa8bLDhwNg
	1L3xyuxqB/T8SU3+/sGlhtp39HxICo+wW03mip0uaAn4ATUKnOJJFU5FUr4Zjvka8gCj63UGPTIba
	KIuUtuy1F2uzq/X0BTjCW8kFNDVBNCbEJOhdRAnk/IhzSNzF/tsa9/yX8ddV8a7AFT+n/YOxAGn5u
	92SECHw4JakvAKons9OgXlNGInjoNx+zJU4+HVqM5KVijfzYknPmyX+/ouLrznonMWyfdgRdBJWCa
	Mr3gGkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eqb-0000000GQm0-0teu;
	Mon, 07 Apr 2025 05:16:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNx-0000000GMs7-181S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:47:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso2692629a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001221; x=1744606021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=b/PILXC8yxOVqKShlYHvhdu6zrThAZVY2I8M4SsNdGHbTcR6RjucdGxbPaz/QdcUMC
         PQJ6hvtkj0qd7JVvugL51qGG53Dupv6RI//hxZrpHlpKpBpkCvtWb90cAJgUH12ociES
         lT7RDblsRfIURgaiKlGUDLWUwJfJsYAVJYYUarWEi4n9RvXR5GdQ0kc9cPo+TvBlRQkv
         QzjIlOdmsc9Ody6KjDoiWUlDuonyHAEIPDbmjNZAZr9I1zXVW2etKueAN3BjHV4Ua0Lw
         9GkP7NZMNuhsGqdSp1BoV6RF39telJHaWiDYAgrui7thfhv+/L6017yj+pfWvzg0VkZc
         uZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001221; x=1744606021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=p8bHHa2DC9BMGdvdP3ztUy1G14F/qMdUvCQEwjK00b4zfjeYJt8CwRm4bv4jAFThM0
         4FmThtO8s54WGu0/P1FVDaS+I6Ai8zwLSLWd49k8sj0E+/D5ROBwT/toSOQ11B7GCqHp
         zFOyvlln3/uljxXN6HbBTktywlQXgIyOOlHijwo+876Llpsn5MGvMPwM52vgLcyDUwi2
         PFa/bzskcUfntxZnvvV9O1kV0xWZSKPF6DHXJYYf6/RuQSA9JFbeYVSfE5MIOzYpinfd
         ksBXsYhrYD5m7ytKndzXVCX6Sx0vyP+TrdZ31dxyBjMII5XlpusLTiROXttleZe6X1sm
         H+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUyLQGn4OYVi6/3WKOm0CRWJKNn4tyZWZxWWQKeqtdg/4CeQktiny3qzUCLnHnZ5MlNMkLjQjPXeWcSoXIP+tj+@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZI7u2k2fX6ZdwVnZjWP+xnDD8wy+DV/7NLnhDXM8x2MZyj6p
	J8dGFj3EiU3Tuepiu9T4pO5vuGQPKQtj6y8JYasGDNdnootj4JYM
X-Gm-Gg: ASbGncutSE8DeqN3jOHH0xzRnUWnoEFUx4hQ0QXOIpKpo0yho7rM7rjWAZKttny9X1g
	g816V0XSfotBw+1Kh74EI0XZdab96/RM3fJ4KMPYoLY+AdYVcNk5vtNiPO4pXPnObi7NoFT/Wqr
	cubmNI2RxtVpl8RohkoR2/EGpHIoNdaOcKEXTvc63B8xXJ1HMogUtze47j7fOF9cFIdRhVCOOtt
	5aprtHcdoczIodQ+OLcivQrkKUuYNfyEJPcbHEReejhoRCkrXSmKCkz3KU9H/A2MKAIaGvBYNCW
	zAOGWm+3PCuecOwj/cXcScrKnvFq/b6QgTzFNrxNmE0jhbw=
X-Google-Smtp-Source: AGHT+IF6VKTVoaa2v7ROypT3rc33cr4X74TarWm5WZaI/cJLc+61XLoqRW6SGcjhOzMHytKH8/7lPg==
X-Received: by 2002:a17:90a:fc4d:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-306a612a138mr15716200a91.9.1744001220725;
        Sun, 06 Apr 2025 21:47:00 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:00 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:26 +0800
Subject: [PATCH v6 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-17-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIqdXyLmDtBvsESjN7HS2mBfSWCzi936p7V
 fm0906jqguJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JO4FD/9tOpeq8/h2OPsPrKBHo/X0tvi7bpPuEBKJm8FiP6qNhpcV00eoB04+3MvO4h5Jc1j80iS
 4J8r8owDxAdaurNMGOEPAuqW4QQlNf9ohTJLVCWlhqxmCTDqfEFWO/laqWUe4gaXsTR0Xe5/zBH
 T3skkVKBOMvyujzaCXiESZyYAO+Myg7UcLgizWstY5E114QwW8WmOP0ASvkmVJvj+SfF2Ms/QoP
 mRQCoWoD9DznWery8KoU66fDtlZisCtN93RZfsUFOknoXTkjlOzMEu+hdlc64s5OEt3P994g4tL
 sHSft2GGuuLYTb9LtaPmxKaXaoKF9bTdBdeweJwXt8L7fcUltOBUPluwF16yEJjmbDEctKB6cPe
 zOi8Q59y2z+tOYXbkSj0CUoN7PQXReakggUmmyk/95GwRqUmDNs5UkBnZRugIswRfcxV7YcvC2n
 hl9D1OkpKBtoeV5wGt+LgNYOy2pBbBPO2AFarPxYIH5SGOgD650hAS52FkDdVEmXHOlfv6Wf79t
 epTjMl8qohJhPbPts0iX8J5tNJZ+i6S/UZBsIiT9B0+TJdGl8JpduIGlnjb7lCQTnUfeacEM3ax
 t4bZKn55++Qs2SowQB88diB19ByR3RLNJ3PJCRhft1jY1pOWME02FAZcfTRzgbZ93qpLD/UDqA9
 7VwDTC6CBdvKzyw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214701_513779_5C5621F5 
X-CRM114-Status: UNSURE (   9.62  )
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

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..33760c60a9189df5491256f81db7f413cada27a7 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -209,6 +209,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.49.0


