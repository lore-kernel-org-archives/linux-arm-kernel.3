Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47CCC61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=; b=V4N/ekLaSCnNjYn8RANW3OD5+k
	D6Zi7KtV0x9Dmzuk+1BakWhIlXJlg47Y/ImIa2+ctDEg04nuBBRv63NtGYPx0kNlix4rCdKcjuzQV
	wlF4pqoRm78hLcOf3q7Hxnr84rSHCgUIE2+i+QDSI0osDSAr66eY6Xjj40WcLdOI9ThFbYU043I8r
	qC9+OnMPPIH1YnUfuv8tpfbwUvnWDL5FToT8CXEMmNDg0ZMtFP5gP8KVHYBcpABeQB5wkMMz9ga9P
	nXKTBzjiPhIyr1SrMcvWgNLJMvSGYGTrjLCUGtdSs49z1oUIQNEdVTWJFuAG6tx3nhqsXqpZ/JN+K
	E2+W9xlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i0D-00000007tNr-0ml7;
	Sun, 30 Aug 2026 16:03:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i0B-00000007tMi-0QRr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 16:03:24 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2792308a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105802; x=1788710602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=lmRqOX/q2OMxRMazux3wki27Ts7dj1FmWUFdZDX60YFSnF0YQStquc7XETXgkCv/ti
         r7M+Gfn2CCqslirvqjTeIVd5Kunu1M/6ad5OOR3YVXlIK4+XpTNkAZvctKWOH5wq71K5
         8uEk0aFB2tubBBc+5mnW9kMiEFYHnIZlRIT70FduSkAsQDDJStdQkp3pi33gPUEbIbbU
         PAF6YSrG2Xvn4bCPjgK4R3qtZlh9vnC4t10J9UrWzYpf0qxk1qxVA8frbDfo8X6AZxyS
         yu+0kdCx8p6tI8jZOEIpP4leJtYFbhbi77sKDxiHEj2Pm8HWZ1ktKs1um0EYvSBfvOy9
         hiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105802; x=1788710602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=HKuGzTrF+oM/tLQdFxnyEBA5SDlXu/Rop6jo+yMQnEwZ9J04Ddh5Rkl2t1d+coxKGL
         VDVXq22JiDHe2KnS/g8eLN4YCYnVf3zLZh9QGsVerZnINuexOkJ5gNCBS5ZZexn+P1/O
         8dLYjurnJwFpYcsiIJiw9NkS2rpseDLKXwO3veaMp0IK14ttznL0E5WQN8bQ9eb/V3se
         ql5JjI5rfNaIIRGOYA+6il5nF9aRMw0pFn0oiFryTRfUgD5xvcbHzwUbrm/xQU75LAv0
         l0xopbRYk+T1sv+7L775sgNbc9BsWxu0E3nkQHCJmk2mNEbrDoeWbGhC2WWP9GLWsEiO
         NMRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQAgpbyLLDTmps0rjpfAIblUizHvhBKSFf/vxug4hUGVsCRXe6zASZ92WT8Pj4MOk56MoDdfBmL0vedC/01S56@lists.infradead.org
X-Gm-Message-State: AFuF++l8j0y95cVwRHzmmXHtpmYLOemkXTDw7pEbg9SuneBnHXm84WDb
	R/VsijrtsA6CXHYhgz7LhvXdjhY70IOXIJEuja8vfUPjLiUCKgx3/maOGx8NU1Ij
X-Gm-Gg: AR+sD10DMmKO2Dz+Jd6QaHngovu+d8s3t9oNjA/BI3Eh2L4s0HNne66JE4a6shQk0nK
	V3gI+Xrdzj5LieLq9DKhn32IZoK0XX/wf1ngoDK+keR9Aq21p/jxbyz0yntpzSQbT3CjTP4V8ti
	EBERFENO9hlhj4EAqDn4T8PenDPHIy+yAK0nf2KgGf15XFa4Y3WHN+7yX3yJLM3S1HHFsYxzETZ
	khc/TnfloQ5ud9pv/x4HM9l+h7H/jFKePyt/2syQj/7FdRWJD85PbMWaeE1xyX5kQE1b5GBekv5
	7o6n/VDwqh1c1du0oSQNdTv0OVXEu8YnR8gjK/KjB6QQnyWvdBjA0xD1qGvOVAM5nPa17CN1sAG
	klpRMO31eNUQSWJCBH2HcY5KPEIZZOlyJ8nd5yXgJlgy/elnmqETRdwNbHaRon9f7/DzJdbMsXQ
	DIMv/X9E/KMLmdwXIln8Rto5tE76uf4oxPEjOZA68SoeERlo8xyi4vT0c8menzwbt8SjoaRLjHZ
	q6IpXf0NrUZkuxgpms1Qum/g0kWV2MzZjEPrYgPh6zGeyaKBDDe
X-Received: by 2002:a05:6a20:a124:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3d2633a1e56mr31289054637.0.1788105802212;
        Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:21 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 31 Aug 2026 00:00:25 +0800
Message-ID: <20260830160025.211384-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_090323_148245_A8EA38C8 
X-CRM114-Status: GOOD (  11.62  )
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

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / mipi_clk_div1 / mipi_clk_div2 =
25Mhz / 3 * 90 / 2 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.55.0


