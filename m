Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5878FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=; b=kSVHsNKnmjQnWWAd6UveBIXwWX
	mPFXvhh00UC1GqOcbeHfpbYrJFCEiCrUeA6r0JWqtzlmyMkjKI179NymFAdFxZ/2eGMoii6bsv7D5
	leEADoKLZGU2n9hdHiXwnEFKWdd0d5uxyFJwR7twgBtHdVU6zcQA3i/Jyh05EAgCntpRBaixt8MEm
	IJoa+fRrp/fDkYyXPfDoIptYotCDS1T6AiI5DkP/godlfuDkjOUXLQ6aboH91gQVRdvJWL5Ci+DUI
	5a7HhwJ9667nhV56PVT338MlDqZb2d71y4cWC0JutYU16TAKPZmkXGraG9lnXd5i3rJsfguULraS4
	RZdf7R4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cWQ-00000008IIA-2fVY;
	Tue, 29 Apr 2025 04:24:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btm-00000008DH2-0rRZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-308702998fbso4679056a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898285; x=1746503085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=ih++AMGxeCX0PqxNtupUli+aUUOvoarGLUtqZuf6AKULUWvYhd95ddXqxEZZEyBxwt
         3tjZFOmS6wNO43TOa2PHap65j/nuyh6uDjjKAx/xX8XjIb9TxhOMbloXJmN+PYHJ/cFs
         PWtRhwFQvnee6wEC+pBTWdZeXczoP0NtV3PTYONYIFQANbGDpSUmQSRPx83+LkBkW9eo
         gvNNhq/BK1Q9no13wCNQV/fclMJF3EBdtaNjzco+1HfpcatRQLtezwOczgkVZpKufWFA
         rSs4EZ/x3GXOXSXlfZas2hWj2tJMgLMTy/c/DXpQScTXMaX7E6mPkhFaHcNAZbcGBtAI
         04lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898285; x=1746503085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=qMfrO3lq1f+TTGDJ/bMaNyG4OZgyLpsXuy684RvVv6ucUJHDxjj36d5QdeVJHhOQdl
         9ZxSmU/Ala0Mava/on+loxwIFN97p8kbJbpUI4HPznTX+/2x6t0GHCXEF1Y478wYXnaC
         fEHJQjk3LAXQRWtLEC0zeZjDUoCkSwKRXo15mBdcMqqM4af3Mqlcx+GHjB+bGYXdNgLE
         u59668UNIInGOCffa18iIELZsDIIAEGJymV9CVqWMUdOGjbOCSDMgRwAw+75BQOj0ks/
         OdyHblbbTZSPToz2nZh/uKTYPpqFhPKjIzjpbt3EkkCKouFTEiFM9c/LrJPkPLkPWKSS
         njCw==
X-Forwarded-Encrypted: i=1; AJvYcCUP4cPkBGHrSM/Q4Pycz3hvypqVd3PhG53I0ghpQhaRwxWNn1wrU8IkweyUMCI7opujD22LnzPD08EkBVStl16G@lists.infradead.org
X-Gm-Message-State: AOJu0YyPROgzyLKyh4SEoo2WIvAwztVueQ4jcfS3rvf3nKzTyqT493/m
	/+r29G861tYLE61JvFJIiRcfAXJHtfDaAc4xkeLHxhIU9zijgtTZ
X-Gm-Gg: ASbGncudT7jCPe7s4i3lTqCBeA8FOsXexEVx4Dln7Ut9TWHqOnIsevOWbcAFz3dKk+M
	ChiDaR1lOIj4cKKmja/RadIWhbR/bFZykP5k49I+aw3i1pi3XYURE0jsIT5moTPYYOny9MpfK9/
	3rHSpB2VXjWvG1leT3DcHtQOMhD6dnME66AhY/Q4yYru/NAvZlaFg+G9WZL0EJJZiAWGxQj3p8X
	BS9+0st2TgEF8gj1/YZ0u7S0qvPhvII5c2BXwPACr9RGlHL1ZLoUMWgqKCIiXmwQivNilxO5znM
	qAsWxJa4NfbLUo19icyzIdlJN64X5F50ftlq0xjAgmZXVWduZiuNFPwUJA==
X-Google-Smtp-Source: AGHT+IFEbVkPWYNQnY1Eec1Z/JJdXhHAO0h1WUxh3tHn6ObSEJqONbzchnPFoKFOa85JTrCDNEdlqg==
X-Received: by 2002:a17:90b:2dd2:b0:2fe:9581:fbea with SMTP id 98e67ed59e1d1-30a013bcc03mr14963519a91.29.1745898285220;
        Mon, 28 Apr 2025 20:44:45 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:44 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:44 +0800
Subject: [PATCH RESEND v6 20/21] arm64: dts: apple: t8012: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-20-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErmBO4nJnK5mFPF40lad4p+BSKJJgrH+MZn7
 sq2/grmPHyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5gAKCRABygi3psUI
 JOtkD/9p5R5bmRzF8RZxw0kgeMs0uNsPHoqfnYjW+vmoqBbxtxeoO6ad3tbGJ9wfuvHxK5mpxMO
 wIxI0CXw5vmijcdumpsQcOkB7JVaZqrID7+Zr2ye58YFLpFWKRi77q8ffHFHrZ8Gggm7Og8Xvol
 UNbMssQR1fLxePqjUnfSST7/n0t+HiJWcDRdW9XFizJH9wyZ/NrTeRki6N78F3yUwO0cH/z6F7g
 /TORZXoKldoHsSHanyvFdJGj+lsrBcabdzp4zokYekXiYccfG6pqPXMgdBhmfhwrog/v5reAbIx
 Kvb3p8CQbxgnD8rLuo7rq//4nOouJoC6oHHuRWNs8aZHw7fNea65Qhy6+yodo6haAjiZASQrhnp
 jISf+cvhVA98LZeijP2N8717K/qZj+ArhpITbGmD2GKh8m3bfrqvvIF2OvejSuqODpIGuSHKah4
 CsPh8tcbFe3oPcUo3P2gyvVUCpEvTzo+g8ZG6WOWFdNK9nTQkfWRMgUs9qIbDERPFJL6B4X8Fw8
 fxb4Hc2Ua4zgvnDMgO8kkTA/sIHAKOQh7D8g/GSapyx5+cynYVtm7CAPPs1JdiXnfcScaCm0W6N
 +VAlmG7IVsFIgUXnJy1avWP9WKc+tPHEWi8FuYEaAmqrzEfg4cojYwrn6aedQDgUxNR9/9KbXbY
 cZYlEABjiv6VR7A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204446_247658_3E3D2383 
X-CRM114-Status: GOOD (  10.04  )
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
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
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
2.49.0


