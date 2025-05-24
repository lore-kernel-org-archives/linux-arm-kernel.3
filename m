Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88130C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 03:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z0KfmMjgOEpWzo+0u3yfDTi/IRtsd5mxIqnOYASIlOI=; b=0tPdpysXjtbGfbG/MJF2SqAPk2
	qDoh9oTsrx833SzWWsuNC9QE6e++bdgvMp9dzSOkEvPIw8gQdhI8JiDgQBpU8bTD3Hzq5/qu4xE9w
	uHlD45/GXIJJ2J8QqYxKikXtzYc1EENy91A4EZVuo/o3pxASeaaVS+5DZNjWOWhKnJqpeo5odIzD1
	M0fnQEh9NUT2mkWmOniqHnb04ProhfD4URcrg+uVGN+7LycnrSk2SnuHuGtXGJpttqPTudCBnYuZt
	JK4YT+IH5lPDEcRC1pXi0ilj8lab00IHbLyIA15kyCqJE+R+dQeZP7ILKN03AZ49LocwAN91Z2GKq
	z9PzPgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIffk-00000005G67-1OXB;
	Sat, 24 May 2025 03:35:44 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIfbu-00000005Flk-0OJz;
	Sat, 24 May 2025 03:31:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-31107f4833fso506080a91.0;
        Fri, 23 May 2025 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748057505; x=1748662305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0KfmMjgOEpWzo+0u3yfDTi/IRtsd5mxIqnOYASIlOI=;
        b=H6t10ECXuDx2b2FHjG2kZnYAkJndblZnuZTfZyD8oG+uEOxW80n61L2KCckh33DWwW
         OMQgtiDjGcCGnq2qLzED49AYeDcxC0Rqka5MN8W3dHSanbWm7uXtwiLBhiEpp+eG2nUA
         BCG1/5bDf7n9UQ4gIn2ZCFbLl2vc7LGl+Z4xDYUmd1NLVoz4wIeYWmI4AfUjcB6YYzR6
         cGYOa7RzqH+qLeuiuKeDWOhriyWDdso7rOKV6QW2chBPgHsqiDlQVmb1RYke1IkdTorB
         JlQ0ImPQEPG5rCxljwD+DFHXndfGHcvuuz/p8DJ2o2WdJHWtwkKj22+PDUmPHK/ZR9Cg
         klvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748057505; x=1748662305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0KfmMjgOEpWzo+0u3yfDTi/IRtsd5mxIqnOYASIlOI=;
        b=Rt+DwdUv7NLGFlwQAJyubVIUNn8ysqI5nszSa4zrZSOzhfeY2hk4r6KvpW/lpiP9j5
         mFWVJGsu7B9FkWLFFFqJqPYO5PtFPLAO6UmV0PgE3wPYLg4sJo5Z2iUAkriOrh6bo9C+
         fz6JMYP7yX3HEl0r66GRscgBTGVWAS0v4uRIlxZDQALKxYmPlO29BaxWUvbn9cqUcmAT
         bLS0KsOo7Tdb4MsgQJEuhxl+1xWCmBTsDmm2RrI1QLnSXGBLJWe8r5BUSAJmU5K6Xd/j
         2WjjZdY2hpyL2UkyYsRiQXb2PiepGGCG1jgu0lV71M+tyez2QyJpjVgg3v/NDvjBAmUS
         W2/g==
X-Forwarded-Encrypted: i=1; AJvYcCXDLn41VvW/rtdcNd1Z2kiZLcyRf1yQDkSGzJFnC1Q0Y7eWEwlddG0Shfamexr0x69wMoC37FjRgy81EdtDvuD1@lists.infradead.org
X-Gm-Message-State: AOJu0YwHh6jUOQi5vgdVWiN8xpTvh/wbT16pjm6C5WR6NrHajhmsNKkj
	igXSROExO2YN090hnhAZ9rWgdzptjxNveCbAB/qcWvXZ/FKzoTsnTNfDhq7/SoqO
X-Gm-Gg: ASbGnctWRbKbGtdXFYgnriSndks9MCpmYW3YtB+4NhSRliFehxkeOg9zgrOf6W218zm
	HND7NGH7PT2O2RJSAjleSnsYGMgtxnRWn4iAG1cnvikWaUV5tz49F2VX3sckkpjJuluJ5XQKxfX
	wpMHC9ENG3bYaj/yMhFX6VyDD9RaijfW2BDHqv9l8kjKy27+XYF27JWiS1nDpsZ0ROrU0VpELIZ
	cfofMh2JtGwxxuwftmev21dVat+LkCmtdoxGP+ak4FjKTOFev2x0G8Ipyh7iWyDn/WVKK5pExDI
	DJXPhH2jyRAgR4uARFxuj45rIdrv1jHRGPYQVqmvrbvAafFp0RL1qrbzAhUvY88=
X-Google-Smtp-Source: AGHT+IFQTVRjmY+/uCNbktEe6LN80eKzA137UEpFZA8kJ1//cPP2NysUTgu3Y+saLRLKxZhfvfekMA==
X-Received: by 2002:a17:90b:280b:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-31110d71ba8mr2169730a91.32.1748057504692;
        Fri, 23 May 2025 20:31:44 -0700 (PDT)
Received: from celestia.turtle.lan ([2601:1c2:c184:dc00:e71b:d5fb:fd1f:ff05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365f3487sm8074630a91.42.2025.05.23.20.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 20:31:44 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Remove workaround that prevented Turing RK1 GPU power regulator control
Date: Fri, 23 May 2025 20:29:37 -0700
Message-ID: <20250524032937.7788-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_203146_150375_471C8C8E 
X-CRM114-Status: GOOD (  12.36  )
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

The RK3588 GPU power domain cannot be activated unless the external
power regulator is already on. When GPU support was added to this DT,
we had no way to represent this requirement, so `regulator-always-on`
was added to the `vdd_gpu_s0` regulator in order to ensure stability.
A later patch series (see "Fixes:" commit) resolved this shortcoming,
but that commit left the workaround -- and rendered the comment above
it no longer correct.

Remove the workaround to allow the GPU power regulator to power off, now
that the DT includes the necessary information to power it back on
correctly.

Fixes: f94500eb7328b ("arm64: dts: rockchip: Add GPU power domain regulator dependency for RK3588")
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
Cc: <stable@vger.kernel.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 60ad272982ad..6daea8961fdd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -398,17 +398,6 @@ rk806_dvs3_null: dvs3-null-pins {
 
 		regulators {
 			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
-				/*
-				 * RK3588's GPU power domain cannot be enabled
-				 * without this regulator active, but it
-				 * doesn't have to be on when the GPU PD is
-				 * disabled.  Because the PD binding does not
-				 * currently allow us to express this
-				 * relationship, we have no choice but to do
-				 * this instead:
-				 */
-				regulator-always-on;
-
 				regulator-boot-on;
 				regulator-min-microvolt = <550000>;
 				regulator-max-microvolt = <950000>;
-- 
2.48.1


