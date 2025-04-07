Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=; b=Ux6cCCGKTUaukj1JHr0tp/B7pI
	PyhxUgHdtUD7A+kYTzOKYknNLqyL8ydnOp7LzkW3Zw+aj2APSHmT9SdNH9M534h/VUx35UbpHzWwB
	L6b7drROQPR/qcDtyD0EyGE9PgFdO10hTBOtka/QaWiTDIKvhAVLJN/YNlfIeD7jcl/z4RS2g7zNW
	aDFPucQasVfRdvPvuzQmnPkjSQUub8K1eTkSmkiHAabnPPidS6HwM1GHFfrQXZNWSc5SQPkqswiUU
	KFE0H6fmmNR57KJgVVoZH8E9Nrqf6FmmlqvujkQzatUr/Jgb3c2A8x5G8ZQ0KBwxGrnQAKXprznvR
	tz/mkQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1emw-0000000GQRt-3z77;
	Mon, 07 Apr 2025 05:12:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eNn-0000000GMpq-303m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so3165304b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001211; x=1744606011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=biaMacHdGfRYyGbCo8XOp+3VkjHM+gu81fX62F1h983TyRKCZfHc6gE1JWvPhCC2tA
         nDOy654uU9FQnZgIci814tuhz7m2sA3OL8AlSplNTjhFVVVKzXdhDG4tceo/RLMZuM2m
         uGB8JVQ8zQ1FXlAD5XJmJVH5zlGHeKGKN7CPMGEU5uZrFaeew8Z5fEgCIJBDEOUjvqJ4
         FI7Uuz3ENTre64uI4STEIfF3xNNDbflnEyarzYkwrPK19hgY3ByOzu8dciQ2fVD6eenp
         8PtAaeb8qosQn7+oSpcxTs29GO+sd47fVl0u/XE9miRBoLiFQWigWROyFj5eu8pH9koG
         OqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001211; x=1744606011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bV39ciPbYxAqyF9bw5GexYzHMHyeT7cFiiGjkDg4x0=;
        b=wLmcttmqzQHR+hQ5kFDbbnpbIKqZyq6Y/qKQF35SFGsfi3v6Z/52H2+rbkG5pQ71LW
         63QfyLqLm6dunNUTqsggfZBt07Wpxlpt3WqQYTa+c3LKOa4lx1CcoZWJtF0S8YbAUktY
         XBFeSJzN4bFtKjdc6vnO4sCI2QWqUiLQptKzvK9qT7YWxvi9oyT+OAkV9EmSDV6GUV9W
         3W7u6FzRh1+katWLTwJsbGq080FRhJphB6qTE8ubi8MHoh/R2LDLSw3+zIXfHGKHmmRd
         77cI6ew75pfGILjKbEog4Dcg2cqd6t9Ic/lW1JyajxFVsn/1PQqVZERFmnx7ooHZ/p93
         fsQg==
X-Forwarded-Encrypted: i=1; AJvYcCVD1xf5OOEQct1M1nKPOHDZSUJfFeezS6TyUzr3yM6fc8cpj7cazfdByeoMVRYpZXhYVEH2FNrp2FVKgFgadJrh@lists.infradead.org
X-Gm-Message-State: AOJu0YyfdGoKCB1f9L0p/4gIJ05OrjVExANnDOBESsHkcSWGMg9mFDko
	tK5G20HqHToT/Q3/NwShx00EQ3On7RahlRp62UadH/o4h68UK3s8
X-Gm-Gg: ASbGnctRziXz5b7oMNbfShzgjv42gusKlIxZ+vEv5Pu6cZ7qmM0QwdRGVI9ZQD181MY
	6Oqntsmw7UFWpmaOhpjI8M97jZqMhvumRvmrfHo0SgXlWKoOlayKvHfeImmAEWNt/WK6F8z0kFV
	WGf29mJGuIMa43QSO4FvXiPXiikKVvJPHunhOsc5Qy73BXeLaxhG9IRa8P/aebIobuahq/xpUFR
	OZroRChS+Cki+Xs09/mfcXs96hX731m1TlYUnPQiK+ZlBsWLro+KgZSJYw5UQewf3OmsVcN6rSY
	JoKjMyX9m6Fu6cZhfptdEa6ATBF9TVhE6Pc6oVhhzd5twr4=
X-Google-Smtp-Source: AGHT+IHmg+dGZ5ffm359pcdGaL9W/XS2EUKol6XAMPziDAzw3x2N9fr/np18kiZDHh0QZ5bpJTIjHA==
X-Received: by 2002:a17:90b:5202:b0:2fe:93be:7c9d with SMTP id 98e67ed59e1d1-306a4e72bb7mr16105136a91.7.1744001210730;
        Sun, 06 Apr 2025 21:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:50 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:23 +0800
Subject: [PATCH v6 14/21] arm64: dts: apple: t7000: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-14-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gOE3a46CDNX3yVDAoVpyrWK4j8QsbYn+HXz/rfkRHIk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iH3+YmlrIk6rELKJ921/3DC4VYqrmOTFL5Z
 IKYXrgzhP6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhwAKCRABygi3psUI
 JPPXEACeYWZb6Qe8nVF7Bpg87QTBRd8nTaQXFDxCft9qSVL/dChn5t40irfJnq2OmMGGhV6/oO2
 FHRe0zhsQmy4E48rH83xK1VBLheqa0RZjwwLptucJpXKy+qXq35buXrD6bKnJVHTM/Yp+0ju5pd
 0oV4SsDH6hZGbWDVlGM16qYK8hTWjc9sPwNNzchy09+Tsf+pv/gw0UpRtKRehaEwqYSs6Jyi916
 oaJjfVxCqgY7rI9qjvyOT9Wes6MatAmXw7i/M/vM/+UhrhoOUuov2qhCeurLJ4j/1CLmjsgqnwa
 WBBCQLxF7dLZ+unE5hFTsIHn4WU7OQvs4Y8PSmCaBu2rPfK5UENIedJ+jgE29pYOEEq/Ko5Pjm1
 OpxwE30Ofmdd6KjuFcnfX0JwDPiEfXBKZrEofTOpW7gkxGu+K30zNOX620C7xPkm4NOS6RZYI6r
 WfADjrIsRFhbdn446jIdWmW9kGOvwW2+vJEwNqrSd3aViIMmYXbFlby0GVh07x0W6zTE7c/ONlS
 qGazaEzlrAhyd0CA2K7jQfvQOO+bgtBLGYFZh+9+SApOrfaY+fd+80hS+HOaKn3WiRcP9jyVJfV
 9+dl1gPAxMIsSI2G21SYfqvkkWR2ueWEiEAdhICY6HoKeTqxxpB/Kj7G5ifdC3ezDjjtZWm6mPp
 lkKgDgnKC85RB6A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214651_756540_92111FF2 
X-CRM114-Status: UNSURE (   9.72  )
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

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 85a34dc7bc01088167d33d7b7e1cdb78161c46d8..f1415f50cb150ce1d33999c817243c3dc9184199 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -193,6 +193,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.49.0


