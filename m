Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BA9C9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+jlV+CAPs310WldW/buR8RNLyPHwhl+Y2cQ6sQ4HpnA=; b=CkftNFqqmzeuajQGpn5DQQZdqA
	hdfXoZlcgIFcOLuoZgcrjPNfRlZF0Cv74HLqJ7Z6hOtqEpRjBe/15rOQlteaYu5SeBgWCCRT/0+Ko
	NhPrGbv80ohCEgqMgkJF0h23MK91QLy7EZcFhHqrHZUDqnTb8bXwlDA2GskNGbOLWoyV3KiOIRA9O
	vVNdA3dKd7l6rSTYros2N+YbULVssijvgNH6HCKXJWeOJH8fMlQzOGB3ufD90q+OonuRyvbY7veWI
	yfXHFfxsrEmTHX9ezJumswFf33iN6+dDjpOC3yb/olMD/RNWEyjqxqOk0npXbPmZ0exWbkQyzgeFm
	ZDr2J4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIff-00000005V1k-34yX;
	Mon, 12 Jan 2026 14:13:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIfe-00000005V18-0vgU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:13:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29f1bc40b35so72196245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768227205; x=1768832005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jlV+CAPs310WldW/buR8RNLyPHwhl+Y2cQ6sQ4HpnA=;
        b=F13T5ZcvOt46p4X1HePBMvBW+a0kkt06A4w6M4222ydwppGeBJ1cvG1Y70uYcXGY7s
         2R2Mh8FJBGvHdjKDJnIjlVkPZKUw9eR58Z3rVM176mVrbitMqK+Y+Sue41CTZazax46t
         Yi0SUCzS1hwybItkLDYlAfsHgsUdm0rJUxiZORM71WzRfsRL0pvERhjlt6zaRk7Xb87A
         mhHC9Lk+0NFs/EwhtR6Xeu+BE6gUkRRuwKcel+LLjdyVX/2LZH0/RBRBpnhldNWOX9OE
         Dx8N+HYyfLK6lq3AZksVI0OYxRgRu1T1e3Fkzt8YqPlez+4cHzVzoBMpx+wnlgo7rCYo
         7HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227205; x=1768832005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jlV+CAPs310WldW/buR8RNLyPHwhl+Y2cQ6sQ4HpnA=;
        b=C+TqNxEupnZJUh/hEzOTULjBLw0gV9uyOiJlRRULKaWwZaEiMu5bgt71i73WocS4IS
         546/9jQksRUUmC/ZWVGmPH/nUVns6zaG8TJjzQ+cVbPRPU/tMnYY0qpmSr/t5XB87+GG
         /BYcs6Z2aD+y1C0edhnOzVfdqfwzI0sQ9V7uTuF+AdNajV7OQwxhg1nZWpx5ZMDhD5Sa
         cVuj/e2+w/oADbfBVbtM2GzD3gvVjFiE71S/kqxAT+nCgXYAgcHC+cPQLcz1rPqkGFSJ
         t9A8t6LVSVVf70r9u5t3NrOWwV9rQqrxLb+INR6/sScMshJV1KA3xM/3KLGnxJK9DMY2
         iJSA==
X-Forwarded-Encrypted: i=1; AJvYcCXJgYVRsZhKPJBkuxhjvOjeEXd92+C27RI/huAWsRMlCEvqBzpxQPrXE1K1KOft042hRf9CwtxyeleefMjK8iRs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr4HXqgePJs/0h5RUho1jJVEwiRikpANDXbODdE7JKgIkbtFwE
	Q5dL2JuPxvhldo2+X+tKJcuaO0Kb7kJPSngGdpZP5VlsLij+ufS30Sm+WA9HyLHzUnAd/A==
X-Gm-Gg: AY/fxX79uRs21Tmh8TVV5w2skZglpX/vXeo1V9YjruO1Yuzp+aHMkzQMBmRqFPAnoZD
	obddCOLTrovL6AVp19krXJh4iMSMp7MwOhq2+h+v7ebdDUfUNDBbYpmDtA24hBhPPdPpINFcV7u
	yI763Sw1I+AMOi3dV6D+M2GzWbpM1b9HTmHg3dj/VF/uF3vJ6M50IOnBsdfA/8dYJwbmZM4WYuY
	bQ/FwFlbnUYUH+uRNS1EVVkc31lJq32AvNoA5xeJtp0SbyYnt3zqFSiEnxuXd8LfV5saAD00lcg
	vc+a9wk3KKQbriyj37FUBrDmBfuffqqUL81Kb3fD8f9gOYBw444Qqr5QVyeoP1XzgiRw3B0kvYf
	HsCKVRVO1oCQpv1VlJrrXqk3KMfxB+9eDgAOwvOgMZge2iQDylz1cp+Q0vpfG/Ge4vhxgi3ql+V
	9USh9SeTlt
X-Google-Smtp-Source: AGHT+IEce98yak9gOUEEAV8f478oht3gyp/nFi/fv0TYVmXF4aE5SsLzQdDp3zKy+V3GJSQ3S2BOSQ==
X-Received: by 2002:a17:902:f54f:b0:299:bda7:ae3c with SMTP id d9443c01a7336-2a3ee428923mr168226395ad.14.1768227204669;
        Mon, 12 Jan 2026 06:13:24 -0800 (PST)
Received: from arch.localdomain ([2a09:bac1:6500:8::19a:1f0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a512sm179660615ad.10.2026.01.12.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:13:24 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: heiko@sntech.de,
	pbrobinson@gmail.com,
	dsimic@manjaro.org,
	didi.debian@cknow.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Remove hdmi_sound on rk3399-pinebook-pro
Date: Mon, 12 Jan 2026 22:13:00 +0800
Message-ID: <20260112141300.332996-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061326_264231_FB568AE0 
X-CRM114-Status: GOOD (  11.25  )
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

According to the Pinebook Pro specification, it lacks HDMI port,
but hdmi_sound is wrongly enabled.

This fixes the following warning:

platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error

Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index eaaca08a7601..a6ac89567baf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -421,10 +421,6 @@ &gpu {
 	status = "okay";
 };
 
-&hdmi_sound {
-	status = "okay";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-falling-time-ns = <4>;
-- 
2.52.0


