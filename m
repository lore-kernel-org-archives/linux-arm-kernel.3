Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F2AC71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=; b=H+U0AUJUVwRCWE8X+moNUGrFgI
	IxnFONvg8i1WkZM9PlI/paGxlSf0R3xUj/daNDd0uIxtSDgXszoE0hmfXzBmsg8F2gD0E/o7114Dq
	qXPNH4VTvqGZif7AJOmfn7duKAvvtAfe1DT5wbfLoAqjA/w4fP3OgWn5kK5+9ONr23nbo1xHzYkxF
	ATPWI2WVkClJ5KXNGWqMEpbAm2KHiHEjsaN6X3/eevM7/h8vu/LcOsNTYsEH6TG5Xa3LU34ZQXcFX
	o5darp9fFHoQ4iAMWUmthGDnbNjB99tn1IWlx0J3EcDUcaemQPH2CUsIkqquA3Qw5zQS4y2A6yTIp
	7aqMQNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzCS-000000037ti-36W3;
	Mon, 16 Jun 2025 02:03:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyiX-000000034MF-1KOM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22c33677183so32081465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037577; x=1750642377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=FFXbyPIrGmkRQz1fSz14DCpRouKxDGWRZ1x2Y2rbUQfG8hjus1xPkaygE7QhSp1eYG
         zZLrdfFNFEaVSHjp+IIENyjSmb7Lzx2/9mtjsPip0cXxFzrjPXqHGWfSrc7H03unvX6h
         vrEnnHuAFCjsVnKqAY3jZPxOjcb/bWbDX+rYHd0zP78/QFbDyE+yWdyl8/qeQ6YdtJEZ
         ojK9bGxqwaJyrDgqQmNL0R4uXMJWCsFswA8YT4ztMcnDRlyYPxl5eY5v0AnXMxJ0L5ut
         k4WpeY+yf/0/KxrUgjG7eTqT7n5GmqcRN48Mu6fCpx7mUWxMidxhhnVQzOMcOr0Xbumk
         JTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037577; x=1750642377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=YigfdXRIFov3MrTZEu2vpZn8iFzMW2QMtFkpY7WmNrIdeICJp+aQHEJjKejX03czfb
         gwoI4VfH4e/IkZQO59ruIs9IjPEkrUJQw5PBXiJqzxnyXy1uhQwQ9eZEuZ25kB3/dzTX
         nSjG/RIGdGdxfq46SyT9wU/WxPbXNvCTiIXkXZxEtJ/9440xcebx/Vfctuge2N1AqBFP
         qRaAAx3ceX8znUbcOEpUprTiNSi654qMXT92oZQEKU7HgmCeS261XGns7FBDiHF9J1TH
         GIOFj3NtviZOUVYLE1zOW67i/cslF+4Wudd34qlA4DsqsUynlVIxJAy8m4wapIzLlftU
         72ew==
X-Forwarded-Encrypted: i=1; AJvYcCW8f54PHHnSivMHVHH+FBTE+24FU61xJv+BDYaL0iXhbEITjJ4gYfEirlnCLS1vsYQAa4EZzuqBHC2xFz60g3+u@lists.infradead.org
X-Gm-Message-State: AOJu0YxcUcRWv+G2W8ilenwoePFZ5uUjW9ooE/qZUTTXZgthgQKhIICK
	Hzq6SYX9xo0JZjKDGix9Gw873OzuZpG1I1tzlwQJCZZyGuSpcumgN7am
X-Gm-Gg: ASbGnctQRyvZfwg1yLoZSNnV8kcRLEapVaQrjj7DgBBohVBmLgLqyxIkppQIR6geQa9
	zHyvargLlutgy5GocGVPBL58FJvW4QgDhCw3cLFguRlzyiSTyz7lFyey8GiovpnhM7UX4whInT3
	kLU7uFamkTtvb0t7OjRGo+s9zDFDmp2aLphPqfCHh5HnC/2QSAeaSF5mHS5nrPxkAmwscplv+oE
	2ENXDfdOHPe3eSkcvPchk0DuMNpyyDDFcAEWgPFtvlia5zKIqIYeAl0JuWQZed1d8mwPcKwxw6w
	8v38fs2FjNHkVP/kQIMJJMO+pYdVKjiZsoC2dqYOkvCV3QIQ8Lc9Yy52lx5vQHB2HQiiQPc0Tbx
	xqKM=
X-Google-Smtp-Source: AGHT+IEVCoFVOutZOc58iIzo5g4oFAqueJ0SPgfdmz6BnSJcYj7dC2KnJRB7dzwQBr0haF+R+zbkNw==
X-Received: by 2002:a17:902:ce0f:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-2366b00eedemr118831265ad.21.1750037576712;
        Sun, 15 Jun 2025 18:32:56 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:02 +0800
Subject: [PATCH RESEND v7 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-13-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QYaNhoHNVpoP2f2HSS8k4EzqiYo9wg7u9tE
 CJZOqsVlqCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GAAKCRABygi3psUI
 JLN4D/0XYiURgf560pd5iqzLJHOqI/H1/M8LUyqN0RZfrm2CAKpRHah6xfBnNtOQbAo0ZJARO9w
 2jdbUvU1Aj9DWOjiRLM5AwS1l6C5n4kyAcn2OtRFgQlAhjgwpw9Mhy7TGwhpfSA+QWZvg62Qc7A
 VA3wbGfk/pgaOdbrEZ13wxie4Ats7ZOPyJck6YRGeHChb8onEOsPQoBprEt5byAGO7z89zaBOa+
 028KIs6+OZOhmv6I2FvvjhLluiLjphCs8QM89gJuL704Gt1UqcstaMqfRyWflt2UdyKNZHCDA/O
 suhAfiU+MpVBgXC1I7GSFiR7oHSc7jl02GIN2tD/QqUBlMuHCBBG4XZbF6R5T0rAa/8yGscCgC5
 vqFAPyWGOgjsp/8l8iHhMKTOI/bW8L/ZP3vOB8kbdPDaCbZ+yqVT6hgM8BKUbG6U1MKxkj4qz5i
 jnhF0MxPUcOHcmP9xF0mCK2CM17obf3mBHACb+87D3v1zEXkbEn10913GE72DAGkxiWbfHvkq1/
 0GdlXm6h3aejsyTiVEIaJFiIjMIxbmZ+67QWNRqERjUsfbLrHK7ak+lmhNFzJ8kz/QNcnf1pTcs
 20aj7HHtsBXThGqOfGfLYXwU+vJqP2KZSaqcaCbnr/jvuZAjCxoNclniNzNtrCf8fs+6tGnIkiH
 r/dvfmOymQjqd6Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183257_359172_6C765D1D 
X-CRM114-Status: UNSURE (   9.46  )
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

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index d820b0e430507f681a5f2aa13a498be98080e1db..62d528d4b7204af28b66a90d68e27e1c78e2df26 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -138,6 +138,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.49.0


