Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC9CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=; b=jnZPXcPWVW2eUNcmA8ix8PFo3+
	H74OjEQ99wV3HfJwUSqiph9ojRbhfLZ5KhAa2B0aEfGJskEUmNTf4n58iu2eCmb6+glktwU9kZkkA
	w0Y/TduWvNca7IV0xbL6rV+FOLn/1T2O95VhVw4OdgYbA3ieP5/7AosWMNbImtJ5rjcbg0BId0ga7
	4ZoaqyGoWMsH3J47kLo1HcGxHHdnArYzmKFaqT5qY7Dq2RpNHRmTHZpRhDxzaCVwWRiDO7XLWl01f
	bi1kz3RXeAgJRDyAax7oS2BMvsVmgYkKzu2cERX73b5NI304wFi0olajXw704xp/V41UJxQaYF6Hl
	0pFiGsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gav-0000000Gjcc-28z8;
	Tue, 14 Oct 2025 15:05:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gan-0000000GjUL-421i
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 15:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=; b=GrLXGZuGSam73yyZpY6+XVZ73N
	1Sm3Dq25SJcxuB1gRPVJsaxnCcI5Rsto1QanqpEMvF0EmwuN1PpVJtRnSqqC23X+LV3cZnwTyRxvv
	bwoguKtd2M8VohDkYSu07Lq1hpcDo8kbKFDt/F2WOwCd9VxT+NPkGYV61ZozMH0HTFAanjU0n+Q9k
	Rr6tsxG0YLIbHAQyj9GDgqTqzyH1tkJmK86EIm9gVzmuOdpooAwBtbqQQQps33q51C8VpraTCJ1+h
	modMkV+wlJXM5by4oyWscmeqv5UgsEJTkuHZc930Ald/7xDGs1dXJ74fufWisKisg3c8vjQlXSNNP
	juUpw32A==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gai-00000005GZK-37Jz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:36 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso4904234a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454330; x=1761059130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=HQnOf4xruOi9sI+j+ImwOMwnWWu8WdHKiHC0pvDpQv6ECn8kQ8aiC53JP5BC0BRyWX
         sTNLK9NJjFWfWVExe8X3eXWDDahgRbnsOJQ1UrGizloXdVmRVW1jGDw+vpmPxuaWwgk1
         hUKIgsLocoluwf/GZoEi9iIMe4SATRa35VgnWLi8LQjgpS/bLtL1IJMpE4YYFR2XDsIt
         mYbhWZjySxJXRMuO1kWgRkets+9F2oIF4ID+tS8IX6TVwTqLtBUeMs/Y7ruHQIHCYHh1
         K8Au8c/c9SqZS3obQyx5e50hdCvu7nHCR80OEfmCs9KqF+dL2/9dq/BrdbdLSpJelzbA
         ZA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454330; x=1761059130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=wTCYrwevYgz6qBEYOcutD5fa90tIonOscfnxDwGam1dLyuJq3WvainY+4J7YHtZac/
         61CpGcdM00yjAPorGCOK2sO2sICOmfYls9AtJyGI83vnQ07PKKUNKF8LhnTJ8A5ZVB29
         clQliKsNYXCk4jcFRugsFG93kUUnM1Ym6XkhB7gzoWMBCSCmcLFLV1dVCVr7gVimk2HS
         Xha2Ay1u6+0+IEgO/vaOWhSAavzQnpJ4s4/2+0xKlOPyRnLHUPWqJA/8clttTMbdU3Nc
         lvSEPDbgk5QNeQNEKjmTN3l2ks7CVl5k6UzZuqniJ6j4KthYoQlgLUGZuipG4Nbk5Ar+
         3zNg==
X-Forwarded-Encrypted: i=1; AJvYcCX8zsTyagIOtYjhv+nFUiP74XHqcuKG7PsMmPCaw05s4zd5lkJ9vfbtl9jKb+eTUxH+gnynwSVql83iIW8xeDmf@lists.infradead.org
X-Gm-Message-State: AOJu0YyBDd2YCcxVAkeNPBnKQWjGMMylz9kMWYEXjFXADWOHZmfLuIjL
	wX6v+bFgdllGc/Phm72vteTFWXEm4OXtPL7ptDcAYS9pR+LRppTtpXVx
X-Gm-Gg: ASbGnctHB/smoEPAOYCixywvDKfNHNRXEJwxNcSLlHwy+HMHmLIU/PsE9mF8JOd9YJ9
	8Ei+x9NKmqXh4IFbC6WyVBDOl2x0HUnP93Tks/MWijMyudHlxZbtoeVh4madNJ2mwfwgPZYLNts
	h6JFLXUuPe2+yGDT3mDTl1PP4yALbLBvUUR6AI6jCgdLF0Y/E9cZO52F1qT0skRz7cnei0K8C8d
	n1i76IFsSjFQOjGsYSxJ2OFTw7x0gSg1vXW+BXaTl0Ym2o+J5Y8DHEoJj3BGMQ7pNQV3dz9CoTa
	7pvtsjR91NM8PawUEfk/LqxUhh9XRRhCQOBJgBrWueYSkHBJ8qUPlrjXxYY3h+JgbjzcNibpor/
	0R/aA1CvLKH0HY3BEK0IQaKDjn1EZME7exGmSgkiBtEE=
X-Google-Smtp-Source: AGHT+IH4HBeKhh0rs/WsBsl8Ozw9jy+22oWE6s7x8YS6IasXPfN4lyvr/JwIJU3w/u8b0njenNKsAA==
X-Received: by 2002:a17:90b:3884:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-33b5112974amr36908126a91.16.1760454329752;
        Tue, 14 Oct 2025 08:05:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:29 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:53 +0800
Subject: [PATCH RESEND v8 20/21] arm64: dts: apple: t8012: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-20-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 h=from:subject:message-id; bh=aC00DD3jiZSVPA6I5+G806JpCyFv8tDWkvwqkbp+yEU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZvaGEqO+ZN55ucW9OJJdfiSgXdY2n6ZdLkV
 GGDjJh23h6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbwAKCRABygi3psUI
 JBpoD/0YSyScg6oLOOGpChZtwSJeca8rNagdikOaYnLGKmjW3R7hJi5e3gdGkunPGdPyfk7SVPI
 EmVSWxvpMzLwYgd8uVw0j4IFIBIl2Toxd901AgnsGUO/gBoILkvz+lzF/Px2HuO8n9scQMiS5pM
 7vdWYHXt/s3f2DLx482Ja0H8BdHULUw59x87M8nzGlStRpqp/cFGmeRFwSQMSADPgaz2gkYuQJH
 f2bA+gLhHnz2qJ+uYMiYQBOj9iK0oa42bUdXwSiqV/DXiFiaO61DreTME4PJaP384XepWCg7jQu
 9pUmhh4lbnuqhSqNDtCUupSCaYWNm9EvBk1VrLf7Lfb4ZiKxIfMjjytjLDxchio8brg9Spb/IPb
 H30YLe13hM8Ofg2GcaTSowwY0npE6vr5QSxixPbDu10uaAhaK2z4fo3/V/qrVuAQbSQafE7KgL2
 amLqImtDuMDbBOMzDfY65vwwZTAqqCKT+imkfjt6HPMA9DbfihgoZJNGZleeFmYVWpu0mI4S8ld
 wLP6m4BGRUK6alHAGcHXfs5sROr8f/F7V8pcBOMHvth9aKZkWxNRjYJpI6k88eUEb4GnCkAGKns
 gEbC0XPjHQz/9w4kEILzGbXYID6au8ewy4bc/mBEUv+QmnwudYoopjOUAqKhNKA/NMNfoMkYK1Z
 x/RqjAo4T1ySY6g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_160533_660629_CB0EC9C5 
X-CRM114-Status: GOOD (  10.21  )
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
2.51.0


