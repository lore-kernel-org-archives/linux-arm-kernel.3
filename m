Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB5CCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=; b=eGLK9fXqX/kwfyhAyWg+0shVXd
	Feg4NaQMV8nN0OWOLsOGXdFMa0hivvzRcpO5d1IGKacOR+iBb2EudvWRCrjL89XfQQCFvnqO2SYCq
	5Z56HULxo4qYpdHj2yRZkKkPBaLau5ZBPVke0wejTKSeCG+QdCfSFnFTThgp2FbBgTxBlVMX/Z1Km
	kTww5fYdAkn5mg44iyaA6iT3irC7SzDp2G0tM+/SMTwlgVmTtouomITGbLB2jSXycCnH+Y23CYLAR
	zGNDlWGnGjDQ331EhexcTwyarCMIOGp0aPuLjIqq4oR3WVDjPbHewQpL9H/5EiWJ5kU6ocbncGofk
	lU+H0hpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaY-0000000GjKF-2iFE;
	Tue, 14 Oct 2025 15:05:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaR-0000000GjDD-05hf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 15:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=; b=UCo7XKZKnI34hiWWKLzI3zAD7A
	90BnkY8SJDZwdKhxtt+IKG7u8ktG/KfSQGH3TbNXqy5yPcQaAL5XRMUEkb6p5OL0/IyfJcQN0//pe
	24fsiLZEkJ11Kf6zhs62blpCEf8T6dO2XrtHYlJOFnzS1J1UD0YwZw01b4dDuOE420IxMc37UAGn1
	lfb3v9x+smTjg69tkoGoWG3/tUhd27uplj6xUBsODQ7cQexfa7dfaMPwubu9eiO1oxLYl8oLYMLNm
	0mYSlIDfwMUyJOs8lwUV8BeYsrCGOdD5JvSvNVUn+jDQ5n4mpk5ajqcpGdBzWm6rtWUpuaimjvgPy
	lw6gWHSQ==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaN-00000005GUj-371d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:13 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso5841789a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454309; x=1761059109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=EUOrdHKvl8ZXOHWkZqIt8iQcvsn0CLMTNe4jYl0xvmmX9T6MFlS18sdZUOJruX8Smq
         41bWtBbAygJi967aIHmhS8Pw46OeDAgVlDv9cnmFuQBJIpK16Lo4u193lVA4VoCB3JmZ
         I/ZH70hTUAQCsLg93msM4wp2+zy57HDlfA8ywz0Dzxlwy8oxKJApWd5FESGLVr67ekPq
         xjkIl/Qk5W2Qy2hww5IGmcgVHpQwr7Z8R4neYXb7lhBNQJTm/BHi0qRIcBBIqynsNGdH
         NfXiSS9mdInAFiPfWfhN9uzZ5J98aMR+NiVgmhrzgeJC91NlwyUHp+nNA0oixa5rB4KG
         r2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454309; x=1761059109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=p5IWG1kSMJwBOWzv9idDhT9zo56Q1iZLOrkV9oVSd3W6wxz9Na7xstHSiKKoCcmoTA
         sxarkH/3K1xB7pL8c9kbQoTECrW0H53oSHU8WHdQgFBr+nPotwhKQkG+l8bjaH1GkJ0a
         Rlj2HkQRzBcPUmLNg76LOq29/WxgPjFAgEnM69Pe6HdFcRz0YC4kccRIlbnMeW+yu+1+
         K/bG8aaqz64H+hX87i+2Lsuwole0dyxc3h1vzYzXaA+sDssyyduYBF98Nh9DIG3F82tC
         dvb+jZexA+mvAsIPspv/yvkF1rgesPYiC9/79ErrU67iSqv0TNd1lyatFH+grsmtPalw
         lxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYVpdsad/4bX5QPn/gPuW/cqfPs4lxJ4qQuP8by+Eqyt/d5LxH0jqn/nroC9v+EZhomudGGeESy6QHu9DDjSuB@lists.infradead.org
X-Gm-Message-State: AOJu0YznRw8msqQbO1zolmpokTQ/p8ouQfaScJJwSY6hFKre7wSHKC32
	CcKiPDQiCM3nvctR2l9rGbqPQYG7TNH5zX+6pbNVc4//o0FBULTSToRL
X-Gm-Gg: ASbGncuED9TpM+yI9q5KXWOjp5FKQsOA5ml4W1zQWdaZix3k1L7oZeDX5HO9lTzo6R9
	CxdLGheNEwraTAim/hRTEENQSEkLTEEK6FjHcw9E0GgrqU7WCGR1PhPxbtxtC66wGSlCbqEpItG
	MjL6LEpIZWbyG/GKwagEwlKigazoEiVHUu+5R6A20hwraugcHhGIYeTveCjP0hZiBCjGS7bjnjC
	+7w+XsXG/+QHrZjr8/++t1BpLE918BMI8AWsAy9+HAfP62vKjNzfjR28lqxP3xMwMhVAqpRf3Pm
	73k48XfFvKFQzKafYDUOCQojftD7qRso1r/ksJ3+ngurf8whMMETla7/lTspvU1iBk7OBwCbL2O
	a9cgRlvMjiP0ZNKiwPyiOsviYtHKjaFY1LzTk2TA4TNg=
X-Google-Smtp-Source: AGHT+IEjY7bDQyIY5jvN45R8h40HRz/mrkV41Wrt6tjyF+cIPRkH0RZhP/fAaYofUftjWnewdxxDUA==
X-Received: by 2002:a17:90b:38cc:b0:329:e2b1:def3 with SMTP id 98e67ed59e1d1-33b51168d95mr33754194a91.10.1760454309043;
        Tue, 14 Oct 2025 08:05:09 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:08 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:47 +0800
Subject: [PATCH RESEND v8 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-14-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=1JKajXUwqRhul1ka4zSxgmuIZmZnF5dN2V8kqpA2Ejs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZugCbmni6EPY7dskM7QjCDK0rY7DwO1/bBA
 DN+fo8D4aqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JAEbD/4iBlLYvK5aeVArd4aJpETMdoyQya2/cnTtxya7scu4bEBXmzUl0lxJiBj5ca4LuUsXV3H
 gPSzIS5mC9pa2dL7nGt+hTIZUXfvIIktGfltui37vlUFxUPwopY+xcs75U1bjVGX7b7+gTYagjY
 FZxBe2W1f6iwEIZtUcT/6sEcQDjQbuqWUWX9LlzO+LFVa8wS55Xmf8gBwA/UIFn5O5Fj48BjhIn
 nOEWG/kV9QDPi7GvQ8Oenq6HT57WCMGX1sQGMTXIUTftuSdGbTM03sN2amh4K7g6X6YVoass1VB
 IAKHZwYiVjObkjB5zXQKz83tTYq9ewTqR63fSmuGSmaxfkX2q4fZXKTMjPlyMU2NeoNsX0Ho59K
 yydP42BIWTjH+9g53VFhlPUsTBbSdCghjHMQesPf8+GSQ9uzyeWenr73lA4nqVxqVIB6ftJOqus
 z8CGKz3bVyob8Zhg2OGhAz8CEu2pxZonXUqcH2duqy3WISGftEU1XxkxXP4W80dFbku5SlZKve5
 eoqx4vvPKfJArysAkflnRpKJ5bDqUUcLLYGo/X/x6Dyv5Bj+DIunaRNXNHxjOrfLUh5SY1s+uNU
 /cwvoL0wK4LBZ/pw/RWav3cNh+cbohqQzucWj1yyQyCmewgbMRWc+1LE/A4bcbRMQnAnkCndhzC
 Kp9YaPmsU82RlDA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_160511_995114_8BC5C7AE 
X-CRM114-Status: UNSURE (   9.80  )
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
index 52edc8d776a936ca5ba58537d4d68e153023f536..98c41473a84098bd70df86c2728a8080b05b41f4 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -206,6 +206,14 @@ timer {
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
2.51.0


