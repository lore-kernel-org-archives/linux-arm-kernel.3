Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C69CA0ECD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+iSjFHeRJ5eiDxIcF1+Ur75NA+5IvcpuSZnDo7kguQ=; b=BtweiOgHNdHrFXK1zt8IMZLjiT
	XtMscW5FcVEcVziRFjVuAjN7eo3CFBnY06tnl3H749TWgTo8H4LS2KWzt0AzGqRNjPXqDDIl+fU5g
	GFj8hOHWJiZgap1Eww5SqsgByVMPFlqFu+WOOsSddk6lBdPBmBJU0prt+ABSBJQOzB/Vty/Om8Fhm
	Djo0kCwJ1MHc6zCg+ffGOh+Ccyay0nFB+htoYG/EI5Y3VTKIvKw5gN/vlV1gjQMUFK1wnnnwcmKTn
	CX3GXwhT9YsSVh0cKXc8+mMDh4xMHtTmWOhyOqkSq/N1a+Zo/bFUWY7Ydog8ATCDGvpwzDSlDYUZD
	XOkEfiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUd7-00000008ENm-2hpr;
	Mon, 11 Aug 2025 15:40:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT1D-00000007uTA-2gmL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2407235722bso43707655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920615; x=1755525415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+iSjFHeRJ5eiDxIcF1+Ur75NA+5IvcpuSZnDo7kguQ=;
        b=dBhYtzDLocwJ/NnO+0FyD9teUj+q6cghm1fgu92jPAy+Bq+QTeCFcfuSLaYYUFNKYg
         yVCFmpFSQish3XbFEhJN1h6nJVzKhrs+cFMd2tD2yeangDEAoMnbJdf58TEnUeKh87VU
         xD4s7o0R68S8bRFYFnSDxPp2bYZkMwNZKafNemUuRUUTRE+uSLloogUUsj4AFF5rJp0N
         hV/TAwf10uVOaziJ8VruFeSYadxMF2qWaNffkq6uK09dbI+PYNWxK5O+4T5EXFVgz1Bn
         yRWQR6R9Fpbh621DAY+u+ZKsNpdcrtslT2/xg2uLn/uZ0hnI2OsbNsiF08aU72EdzMIz
         zjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920615; x=1755525415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+iSjFHeRJ5eiDxIcF1+Ur75NA+5IvcpuSZnDo7kguQ=;
        b=bf0fMDPmJrHK8p16uG43Nlnz+z/JdsN7O/tYKofc0WBiQMXXdv5HPczWch5QyjyMjm
         QZxznD1E8myKZtLmdww+tbmuhSXEQ4vJyTWsYxeDmyQx054txHhZMjoiarMH3rlmQ1XX
         TW/5LQc0ljJUkKgryaP1HzKLkC1N1uoAih+kW2JrM048u4azMaWFlqpN9ZRCymF2AHyn
         MGoP5255OoMwbnyd7PGmn0lhacSXYw37bOc6TcGbZF34TLWKIgj7VR6S8P1OJNNWbK7g
         E3fA7RguBz0wFZcU6jdBKNOj9hNXwovd7y5biWURIXpyGQVz635PC2yua3QRZiB1zr1U
         k8kw==
X-Forwarded-Encrypted: i=1; AJvYcCXeu7tnFySRVjpXqqGbFxQP4yTV9qvOqGgwE/sgSls/IfExGY38lGMXv7waO1aC0CFmcRYM3GaDQn/vBrMPMX5s@lists.infradead.org
X-Gm-Message-State: AOJu0YzvyfNw9QedlNwng9PDv7rc0mypGZapKXo00q6LNnT6oLRKoqu8
	9wIg9KgrtXjNbGrbL1SxrLTgP8UtRiMpwJqeyq6nW+lkwbuIUZVIfeJ3
X-Gm-Gg: ASbGncuHENAgieXiHarg9FXRnvf9gPFD8Movx/yONkTkQ7oAVgtdQGl2ysRITTck9hY
	5PgRP2DSZQDb00guan/trLzbPUXXTnQlRftcZx8HMZ0/gKqdMAMRT40uPQlqcbIAuSCzm9XRuI5
	e3H40mEOVLqEdWHhaitgYawcjJvfw3xAFarG4zVeslhLXkR+bbsxlRbiL4b4GGIBdhB/xeGPLtk
	70Klmf3y2L+Cbstw75a3crOrzWyKNEybiRKOPPZPz3i6pAwaza9nUzpDpr23HSXQgHaKPy533O6
	woPrRxjAdeyW85ZVXK0FTsBUzDEglu0MA1H54HAHMmvu6j/8CSen45Ju1Abm0Iq45hd59Ha+JCw
	4texn3SLEnBkSr7HQ2/kyFf+4qcc/6Wik7OFEXCwyQTLCifk=
X-Google-Smtp-Source: AGHT+IGAEKa4dcvVOWglncYu5qHSdxVoMhR4DaF/6EMtEufkq5ee1uvDM5bHuBpczqPXUeWRNZ73yA==
X-Received: by 2002:a17:902:da8b:b0:242:8a7:6a6c with SMTP id d9443c01a7336-242c2008342mr219863425ad.17.1754920614853;
        Mon, 11 Aug 2025 06:56:54 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:54 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:52 +0800
Subject: [PATCH v8 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-20-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eTbqxhjvOODiLhj/5157aFqKwPGN5aKmzyQKBhjppd0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDTxdZBWMtJk+fLj4SOBpL+aisv9fok/sfs
 4ifj9wkreGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JAsIEACtst6o/4ptTPiwslKdB7Wtd+dm97D03aR+XgqDPmw2bzdXBOOhfx88znmpdLchjjeybkt
 hlPwh/kmHjJCTtMyD1mIZViQ7whhClMBmMYD/+bRjYzNrUH269xN6I4HQU3l4XQ4PpsTR6FMu5I
 AFltvdjs40iG/FKHyZh2xnChCEpb75Y+tJJ+ns9xL0MzL62NTIprA8Zf59LhrHYLcryOJd0tI9e
 sL+4DVQIrP7N4aD7XyHGR6CMvsM5YtgSCGh2G+ZMTeU2KbGzr7+FJuxUa2pvNLadFvYoKGuQgVa
 QSFlkvdYQwYpnEj9Ah81+HbUbVhxcTkfk3+pSvU51v5ThhNm/xnn5153x82jiiqS4KXucgPuxMV
 l5hPGcB0w8j77SWkp2bGPoY9rS57/2JXJ/yvEb5MYhj3bTzVRU79j+bnF1E6TDNk+4xVtAMSTyT
 EKS0o+XQpi76zFf1+oKYxUKC+I8yHjmwj8efB998A58eR5mnOtm+EEK7dWCNZOTeQUsiEDx3NbG
 egtTvL+wHupMMHLrZ3a7+tn0IG/Qo3+WdeXPnW2X0z+9JyrsyB04JwwTAJyaEHxrQiup0ziM2kV
 u5VNmCdaQ54UAIG3byHcoaec9eLFIEB0sl+5GgAftNYd8X7xg5DBd5MYrKDgJMijKkhTbvcZDpj
 9ZuVedWcZJ0+Iqg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065655_687904_A6C3931E 
X-CRM114-Status: GOOD (  10.46  )
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

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..fc87ab818d975974dd811cedde27292ec79f2c8b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -289,6 +289,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.50.1


