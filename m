Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CEFEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=; b=ruA9bsOGuVeEJJPGA2uJBDgHBu
	rNhjrGBnBZQ/qdkJrWkASOnRzsGGxSTmyMfLpBoZRll7Ev7V91bpxI8+Nq4Db6cDKjxPvsHG/ECaP
	4zNZVSSYukdBTu5Rfap1SxKmWUCMSXy/oAaIbVpgl5LZSwIf5lfwB5eVxxKyL3qPPbIBE+fzJA0vo
	cWv/WAymaJR+3za7AgxBoFH1Ipi+R4M3MxSvD6KKNNvykTdo3kmBKxzv15J+3urzTfCVqtKFVqU+A
	1BVhIzP/7//nQjfqkiFvvqlZhWLGIENh98I/Bmj9i1j5O4Il3BVOgwREpsMyZt5iEBENxIpGZuTEW
	jTeRk8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEb7-00000006jmA-3nEh;
	Thu, 01 Jan 2026 09:03:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEat-00000006jVb-3dlU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so11670990b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258223; x=1767863023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=KLih6Y+xrUFpWdEUjuWToAKgyHcMDuRtY+669aD7dbFDtqq8MIA4mZQ6xpD9C0Pcs9
         SCdLgAU8CX8zu0jrCQ19P7sbu49EgddsjvEzi0CkELQIvavQaAlb9ryoz97yDd86gXgl
         s5BHcrSBjP5Ji2JxqPR0WxnEg12eNTyhSO7koVJ30cdvlJS22YLreCbBpo5CwwFTAzEF
         iauiy2ZUBgggOQjaIuCSzuPVOJRjPtMNwMVLXioiNYePmKTyqguDOaKneF8RPzHc3HA/
         uUE41wtdrZxFzsHME+xZyg3bLnVdllINXm67x4CHLpw+qjXKGObCtwiGA+2obuHzjcNi
         ZgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258223; x=1767863023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=Ub+ZR4dgH9JIB2ffvef5M47O1kfT3154avlKHqPZztK0VXYopfm6fuCoezZ/gEwxfQ
         sux/IH2rpI5vp1QAdZRsPcVT00e1oRzUj90awZkTcA2KIOsm2wCbBGepdoDs/4kvl+er
         TdN897s/yOw4AyuWHnEcRg3WJYdiC+S1/hML9+1hX4meIw+p6LQeoEDVNl2ngNQuW0wP
         KQe74qeK+rl25CBNylzDmoaakpjBgl3sYuyAHrjuNn9VHt5w0op2y+ixwepVNdCyew20
         MVu+Wb0x68JpjswyEhY5TKKBuI42GPgNQEzq1YPu411O767Rflu8f52OvlVUTenGIfVF
         zdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRjv0TeKIG417Zt0VWzt+VVRXzz84p1FxHi4IPHHaEYP7GFv6qJ5VR4e0MdADBk6BkiXNM3vlg7j8VUOFcFPYl@lists.infradead.org
X-Gm-Message-State: AOJu0YyDajhTy8LVBKpCAx1nkYYKHCqIPDEHFEhdfIbhMdqQ1jAGQLe7
	kDGiLZXrhICEA1eRdZDDNM3mqUejlOnoGFYcSRzKvKHR5746bX5hXNWf
X-Gm-Gg: AY/fxX6sJ3sye+kUZIstxi22j3fQveDeqAwseDdukrMM+KFlALQyGEtAL5ct82SbPkt
	FgLg0cYdxGqUz//U4t+S1or1+xInPofpVU9AWRbs/UXXMd4MgoUx0STLyhQ2Jl9u0Hnci3gTQju
	YDp3LTSUN//d9hB0AnRLS8HyZn9MqTFBrJTGNGM0Ghbxwn0/c/P93P2ityGpnhGiSu+mpomp3bG
	igfaQhVe2JKObKpYRZ3eyjZgBhBYYRnaqirXoc8G9rnNgY3y4aAhUvqmPDSE4ibOCxub/mKaXkn
	CCmoL1YdMae0Hqpcdxn2oo+SSNlI4IGWB7NpSeNz5CFlZHjxgHmCphUbL0AeWuRb7/qq5Af8mYx
	3Xv11Is/8zL0aT/Ia8Qn7mijmXq6B15nuGlMZVypxmbiaNCQ5DsVNUudeccHELE1bMEarYyrSO+
	H8QMKRXT9yfTYE
X-Google-Smtp-Source: AGHT+IFPVSjDn35If4JJdkAPCWUwApX7FF/dix6EAElR4Vim/M3LWWrzlOgnsMJu8g8CeCTO8KTRsQ==
X-Received: by 2002:a05:6a00:ab09:b0:7e8:4433:8fad with SMTP id d2e1a72fcca58-7ff6667b6d5mr37775009b3a.53.1767258222975;
        Thu, 01 Jan 2026 01:03:42 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:56 +0800
Subject: [PATCH v10 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-20-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=2e/a3Ds8H9o2DJDRhuOCh9X1vWNSB/53Pgczil0A+/g=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpmSOXQD6QVHUKQIc9/wmCCvSC78EgImcU0
 Scj4chLGH+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JKn6EACn3FwPUsnDwR26T9WGHQmSa56fVTYQz4qnaN0v762/bzKhEjyrbRif0DKEHu5nuhSjqD9
 K92s/a5OSvOdIUMek6dSroTK5+w/Fnpe4lYbW3XjOZgVi793XboetGLP9PSkvg+ec5iDvrJ+qJE
 rssKT+JHQH+nDD25xn/wTEbZM4wBmAgZrRbeliA6U44Z8y3pYcRcof9GBGaQhpj47QDJVDm97sB
 nWz4qWxJvBCoxeUJA6xvvbmKdC0CTtVDAh/1/pt0dEpQNvZxmqP5xoZ7LypgZsLUFJvVP6V8FOs
 FLHtg/0PtDkZ+wHehmLxRgBi7Sqw0mGqCpgOE1atAFOWH9f9kmjHSMw8eCAC3C2ZwCWQfWmONQZ
 k7pqZL6xAWI8YMwrAJf3iQrRzQqUjAd9W/EyJRCJiImh/IDywKXboA+rtWH3lVuSH0N1m4iJjld
 nNRTNgDfvcw7yLzawkM1zArnPy3s3IdMou/x93oTtmAKsoqFJt4QOxFw7YjPrSPfdKo/89OFSpM
 zTgfms2XNyxSDYruE9M+bH3mttGKIB6xU6jvd94vdd29KqRKwdScwqRfnuFhpFgKlhAx3G1pEwX
 gUf5HSVnNirL0ysxdAff3Yfy0MkUy7rp9FPDHfZ21MgZYIVqWa6FPWN+ziZBEYZy9rHwSgzh8qW
 E+aytyN6Uc6xWFA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010343_990056_94A307D7 
X-CRM114-Status: GOOD (  10.15  )
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
index e7923814169bd4060706945561910ed1d5c2e0c8..579560de1aef8c311cbf66c60a2111e2d5ac37c5 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -297,6 +297,14 @@ timer {
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
2.52.0


