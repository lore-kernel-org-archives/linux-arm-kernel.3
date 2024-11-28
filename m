Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ED0D6911A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gySyX3xb7lz2NAGHoDoeS8CCZN0aAJNXyyTJzm5Bn3o=; b=PQ//n9xSdNTLlLfR1oxjAz76tL
	7fRv5928xCr8s+3PchdBRXqU19cuth3vHYw5AE+f8rHFNAwWuZD3UHRBYLIbIP1F08/5Z3EGwMPgB
	afsGIkcG1lG1D4IbE3Ke5QJS1BI5ylvb6Ymi7Gqiwo/oS9aXKYDx41hn3dcblVA9qZThTy0NessQJ
	vKjuE3yFfLx0jz8qbUDL41dAivREEiQ9jYPBUuREaF682lGY36UJChvJtFWfexly4KUCJl1mM4QSD
	Krz9j4Gev7FdV6UZTIaXb05YhchAia5jbk/IhCGqg2HhP1YGDm7CdeJnwTtV0GIkx0yvyOv2FWEIx
	bBLEWZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgkC-0000000Fvhe-2rt4;
	Thu, 28 Nov 2024 15:47:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgjC-0000000FvRq-3q9x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:46:52 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa549f2fa32so134361166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732808809; x=1733413609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gySyX3xb7lz2NAGHoDoeS8CCZN0aAJNXyyTJzm5Bn3o=;
        b=TMeUDf9YfO9pxBchlmGHYwbSLX+ivxnN+hIhmpkS/RcyQqdKfEfjJxFu9hmicL9APu
         XuZtprNF3ZKiPA/5RHyC7ubcSR66I3v54GG2EqfW7L1DtttJNiq2wvP+ezSV6d60YRoY
         W33FJ6YG56ZgymhXDAHcL42lV+lw+NvgBqc1KWIX1IwxTN6ZU/1APjCGcPHfNJqc+izP
         9B0ARoFx6ZkhjjNHpYkJguHyqLJu0u5Q3Kbj1JkgyyUo73sEdwxpqjv17ubRpDn0EpNh
         SP37sM//2z5nL9yOdAinlVhoO6s8ruOysbv3SuJhaZJbApchu8906fUQVs+uzG0EkppV
         CYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808809; x=1733413609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gySyX3xb7lz2NAGHoDoeS8CCZN0aAJNXyyTJzm5Bn3o=;
        b=kIl4drlvp/s89OjGOJSENzB3fc01LNGc2g9khCOFhzhVP3MuXfSSI1Fn78bR84l3tG
         dok8pF+q62ntO5wMx7+UOKZl2l9pWZ8FpdIPoSacd/vNBRUS8Niu4bLuQa/mbKQvhZnM
         LIjg+aA7t38TY47CTD1mutsymtvbGq2muXNtfxeJXEnySTM2bg3bjTvH/pkHErmff859
         MU5ynftE8iD1a5tMpTIS8anGEFdz1bkiYtClhQKJgeTqrtucHVQsVicEeYPAni9R9VQf
         7sDWxhYLIgCLpG2XIJIq/yTVCS9CfKB1x+l6b0Yo5308iXR0qwwzXxBmMQdq2d4DRb1Y
         meqw==
X-Forwarded-Encrypted: i=1; AJvYcCV8IZwqevgxn7yqrcNg4SYkH8mMmlVbmS83nFVhA9Niw+sgXEo+iJQR2wKoLHNC6hIItIs476+OO05mm3AuTn15@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2NkEBC8hs+n+n4kTpDjyxtsRQvFemc0VJcT2aqxLY/gBXc6Xa
	DFoP6dTah5PPyg8V/4OpJhl1drPfzvPD4No2BPbca2JxFawYUHP0
X-Gm-Gg: ASbGnctoAXjCqob00usmmy/sz/zdhqvpI4Yhy5bMlMUuacPFdfYE5LPjj7cDD3tADm9
	jKUUOJwvN3ZXFiXUaZ1JtsX0S11tn4cElsg+Bpg7Fp1M927vG1bbT4eyDyCr2Quxmfo/abeq25C
	7mnUhxn0FtVYKOAEPkFEa1Gt9W/3r6mejQRdrOY+2hXgHu9bDa6zYMSi+T3H7xgz+ZrJ0a8uo34
	Cum6NqVpyGDW6tvozSeJ9x6CKLNbFklko3YgvsDpxOyJe579/bgc/6CgkwkVMyEm3CVq0ONAKfe
	M7qlDT67JrVSt0q5iFJQQbgwzYz9kz5U4WLhoH8=
X-Google-Smtp-Source: AGHT+IGbYgbDaKacn6oy8Mz56jrQShpX/zaBxCgc1Y2PUaxFezDPqSG9ETGSHYc4z4+CFFxCm/VZhQ==
X-Received: by 2002:a17:906:3109:b0:aa1:e60e:6fe7 with SMTP id a640c23a62f3a-aa580ef31e1mr547320866b.11.1732808808516;
        Thu, 28 Nov 2024 07:46:48 -0800 (PST)
Received: from localhost.localdomain (229.140-242-81.adsl-dyn.isp.belgacom.be. [81.242.140.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59991f215sm78390266b.158.2024.11.28.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:46:48 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH] Update H700 opp values
Date: Thu, 28 Nov 2024 16:45:56 +0100
Message-ID: <20241128154556.2743839-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_074650_951378_7D7F3C05 
X-CRM114-Status: GOOD (  10.40  )
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

My H700 (RG35XX-H, RG40XX-V and RG CubeXX) devices are very unstable,
especially with some OPPs.
Crashes were fairly easy to reproduce with any dynamic cpufreq governor
and some load on CPU, usually in matter of minutes.
Crashes manifested randomly as simply hanging or various kernel oops

Manufacturer (Anbernic) is using more conservative mircrovolt values,
so let's use these.
While using performance gov seems stables at 1.5Ghz, it still crashes
using a dynamic gov (even with Andre reparenting patch), so let's drop
it for now, like manufacturer does.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com
---
 .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
index dd10aaf47..ac13fe169 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
@@ -50,24 +50,21 @@ opp-1008000000 {
 			opp-microvolt-speed2 = <950000>;
 			opp-microvolt-speed3 = <950000>;
 			opp-microvolt-speed4 = <1020000>;
-			opp-microvolt-speed5 = <900000>;
+			opp-microvolt-speed5 = <950000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x3f>;
 		};
 
 		opp-1032000000 {
 			opp-hz = /bits/ 64 <1032000000>;
-			opp-microvolt = <900000>;
+			opp-microvolt = <950000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x20>;
 		};
 
 		opp-1104000000 {
 			opp-hz = /bits/ 64 <1104000000>;
-			opp-microvolt-speed0 = <1000000>;
-			opp-microvolt-speed2 = <1000000>;
-			opp-microvolt-speed3 = <1000000>;
-			opp-microvolt-speed5 = <950000>;
+			opp-microvolt = <1000000>;			
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x2d>;
 		};
@@ -79,7 +76,7 @@ opp-1200000000 {
 			opp-microvolt-speed2 = <1050000>;
 			opp-microvolt-speed3 = <1050000>;
 			opp-microvolt-speed4 = <1100000>;
-			opp-microvolt-speed5 = <1020000>;
+			opp-microvolt-speed5 = <1050000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x3f>;
 		};
@@ -93,7 +90,10 @@ opp-1320000000 {
 
 		opp-1416000000 {
 			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <1100000>;
+			opp-microvolt-speed0 = <1100000>;
+			opp-microvolt-speed2 = <1100000>;
+			opp-microvolt-speed3 = <1100000>;
+			opp-microvolt-speed5 = <1160000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-supported-hw = <0x2d>;
 		};
@@ -102,9 +102,8 @@ opp-1512000000 {
 			opp-hz = /bits/ 64 <1512000000>;
 			opp-microvolt-speed1 = <1100000>;
 			opp-microvolt-speed3 = <1100000>;
-			opp-microvolt-speed5 = <1160000>;
 			clock-latency-ns = <244144>; /* 8 32k periods */
-			opp-supported-hw = <0x2a>;
+			opp-supported-hw = <0x0a>;
 		};
 	};
 };
-- 
2.46.1


