Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A5FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4pUbnlIaFpXwj2FnC9KQKdRLGokSGMi945pdWEyQAOU=; b=Rq7j45tYTJ2BN5MJQQmYnEW5mw
	j4Rly9JDXC+/688enmxTUfPgIZjeIqvrPgO7EVkSZZg4PEa9JY4myYV+n8meHdIMtGWpa05rvZzJ6
	AWHdDh+e8jBD7EQPKjr5STvtWoMywldenfPWVjMHlMMGwKofT9ChUnLt1NlVUUJxo9Rg07kaqG9yp
	3pKgjV0ok9wPiI72gszvOeCQnjKV7huVxJLsRfWQjr0B0HYwvxUusL7X2vB2hOG+6ymls7plciza+
	JxNpmrhW7MfnW5fVCiLHuh/8wdDHcPjyDVxg+a6Xn7ujit16v8R/m9vgXjnnAkq6PV7JpHq8nuqr+
	j7n/olag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuMK-00000003RJL-3oOx;
	Mon, 17 Feb 2025 06:12:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuKr-00000003R8l-3L6b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 06:10:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220bff984a0so70436055ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 22:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739772628; x=1740377428; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pUbnlIaFpXwj2FnC9KQKdRLGokSGMi945pdWEyQAOU=;
        b=AO4jm4LVF0z1Ynfj0NBOnUJVyQQQO6XtaSXXE9FfTDcbCL8Z2F8R1FE+m5B99E5y1w
         cRutgiw0LOP3dJl8mC3dHmEyO7vf53lNgBLvJ2bPdI1mOj3P9j/byxU7obkhv+/BuA37
         41Rs2VqOhLDUFszYl74IfmwRu5ovVYnjJggeNaQ1UHguwd7UqJnDUlqqpr4rSUOdgf0T
         FA4S2SvHvab522YMws8AhphwJHSkJNJ9750NP9t25RknZbmB1teFslIoXWRru5noOhth
         +1pHNxFBXgFz0thadTU7Y2onNbSrbabay8KgrxJcPwpaXnpF+KOa5jKHH0z1qzQyQicc
         xOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739772628; x=1740377428;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pUbnlIaFpXwj2FnC9KQKdRLGokSGMi945pdWEyQAOU=;
        b=Hmxhg65VgsvMNdydJeIC4GN6p5kZJsa+kXAUkiREWG2oWs5mWeSsExwbxyTZvrgmYc
         Xfhs3QUbxReRWwgNno5Y1e52R0a2xUHocQJYbRdG6+0hSB/sMxFh2U163XCSpB92iasb
         gNJ1gRozBtER6SOCqYrieWCWgeVCeRqnv8SFNlBbI+vi6Ci33hy2UgV78bZ1XrU1qcYF
         TwT/RsGQ/MGRZwM2/xj3ScIcjiTSaBO2r6b6ZHyA2teah+hhIuxv6KyzZ7Ayb+PTQ4xc
         dO0F26D8HJ6EF80j44vBd3q/xMKV6W9+JDU8ITQyjy57dpXjsKq6FJ99Hdn+Pea/ZGGn
         Nfow==
X-Forwarded-Encrypted: i=1; AJvYcCVqwbGOE73FggiCBECUjqQr8GTZ+6JzDCAnDqYv5IeKm30kNWXN8kvusoWXhfcpEwAago4ibPizqgW3QrafGCJL@lists.infradead.org
X-Gm-Message-State: AOJu0YzzYC4NEtGCVu3i8Ey9QY76cQZRoJ8Hhrtbh1wxpDkOL+90KUOx
	5rvlBQQNclyde6USeahbcfyuOvbNPUtj696moR3ochnKyh1LPqTm
X-Gm-Gg: ASbGncs6ORZ23kszjLuT/zAFgBhwZLbL/B0s+1JT61eyZsQhyVvSYBZ+i4gEp5Mcalo
	ERpOp00ZsfgC8nlHyUcGli782lv7FVUJ28aojFGqbx/QnhvbAuhn0dci0RqWF++TOEupJHkPRyb
	wk87FCOE5sjlKH1spzsoi8oRnN6Gngxay8qGhs8qPfoN6uCDzABll0Q7ysbFWBFxcz206+FPX9V
	m/0YzfrYRTRddPjbVVDiKY/8SnSEwblRP39LoboueUJGAtFyWnyIhugP/rb9s89v2sHHJm2piFk
	OMVzqUTB2z1FfSE91A==
X-Google-Smtp-Source: AGHT+IEP/BxIfU7rsnxdSBvVts0xAblW8C+YTQavZsFPW0gEu8GetnOdrXN3b4iJF+M3Wd3LdxRhGw==
X-Received: by 2002:a17:903:240b:b0:216:3c36:69a7 with SMTP id d9443c01a7336-221040bdbefmr126914955ad.45.1739772628094;
        Sun, 16 Feb 2025 22:10:28 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d559614dsm64411795ad.256.2025.02.16.22.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:10:27 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 17 Feb 2025 14:10:05 +0800
Subject: [PATCH asahi-soc/dt] arm64: dts: apple: t7000: Add missing CPU
 p-state 7 for J96 and J97
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mini4-cpufreq-v1-1-8974e90dd806@gmail.com>
X-B4-Tracking: v=1; b=H4sIALzSsmcC/x3MOw6EMAwA0asg12tBwmdZroIoosQBFxsgBoSEu
 DsR5StmLhCKTAJddkGkg4XnkKA+GdjJhJGQXTLoQteFVl/8c+AK7bL7SCt611j1K6umVi2kZon
 k+Xx/PRgxE6PMNncbDPf9ABnQ8cJtAAAA
X-Change-ID: 20250217-mini4-cpufreq-fd6c19346518
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=CrIuLPMpgJln1b65h2U3ovn7OZsssqG71Lr6yC+n20s=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnstLQi0lqAMVlCeQaVyeJCczo/BDvZTB7TtJJL
 U0OzcAix9GJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7LS0AAKCRABygi3psUI
 JK6LD/wLOjw9QUSMfzkPdvScw4BayFO1s3XlFg9mn7p2X3CgI+q65LpwMpolEcUK+tGk5PI80fU
 5qzO3YX2nj5octVIGyiZOGlu4WFugsfVqC625tzy4PjSAG7kriuVdkG6dE583nlIRGvECaTyB3U
 UP1je8BCtMVGA05El+/mAdq5n9ZYpmlJz6to+OeWWq+230qovTrKYnreAYjgV2l5zLqQb8lUH+1
 8ljoCwi54eqgOzY7qvs3xlx34VNIxmxx8SBDOWRbuu4oGEJsxlTP41edIGxL82vgjTnmEFVVMTH
 lBNF5ZDc5DlFle5WaaPbkqEUqSdRS57zv6FB6mexeuWXPVd/Q9eR6/Rf/omxdZCob6lKaIz5agT
 6cQKeu0amy3Mawww1G8mZtiU659aIZHJH3wtpjpi3Ckl3kaM/nktXeIS+z3z6vuAmIacGQzdWvB
 r+NDps/RepRzW/3SCT41riRHDIVWLsAH6C+IfVun4C6fo09ypMAwxSNKnf+MDITvDke/P4RKhrq
 MVIAnUjLsBHZAF5tlK/j1Emomp0Gw/MZUc1Fed5gaaPfey1MGUfK98C4vz7lN8JvsyQa4njF8sq
 7a4UaCWlDytYMXrZ0MSzDC+UsicQXbF3V2GGWtBhT8k8ukWFTHWRblZ0ezOW9E4pZdyU8HXAS/l
 6HsT7FIpygtDj7w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_221029_847339_A2A01C63 
X-CRM114-Status: UNSURE (   9.86  )
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

Add missing CPU p-state 7 @ 1512 MHz for iPad mini 4.

Fixes: e97323994f4a ("arm64: dts: apple: t7000: Add cpufreq nodes")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Note, some sources state that Apple TV HD has 1512 MHz A8 too, but that
is incorrect, the maximum frequency on Apple TV HD as configured by iBoot
is 1392 MHz.
---
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi       | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
index 6da15d15601bcd553d6d0e3fda93df4685b57ee1..cc235c5a0c438f3f07ce5318a75dd928615b7818 100644
--- a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
@@ -57,3 +57,7 @@ &framebuffer0 {
 &typhoon_opp06 {
 	status = "okay";
 };
+
+&typhoon_opp07 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index d4b479ccfe8c9309b8de6c23f1e90000ad287992..32cac8c30e62d657079dbf32aece8af0fd9cef38 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -84,6 +84,12 @@ typhoon_opp06: opp06 {
 			clock-latency-ns = <42000>;
 			status = "disabled"; /* Not available on N102 */
 		};
+		typhoon_opp07: opp07 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <7>;
+			clock-latency-ns = <49000>;
+			status = "disabled"; /* J96 and J97 only */
+		};
 	};
 
 	soc {

---
base-commit: ca96d759d8d24d90b1726c2cc7c568ff4728bb42
change-id: 20250217-mini4-cpufreq-fd6c19346518

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


