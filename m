Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7444AF4643A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=; b=LSu9d3IvcNzXGYFE9kcwrO5853
	vf4z4HRyxsOdwIyzsggPlmPpI5jSDiAQImj8WouI+qREWXwx6alBAQPX0Y+Whq44v65Z9wuDI6aVD
	4CLbkBTl7pLSQouB/3nBo8K81t1y4X02kqbw10HuOpMIgZHw4Bw54ZZgBQKwc6OGXf9QoHtJx6jKv
	xuXtr8V8IA1vSkKbC13rlBixTMFiGDHmSSQff1n0FZET7XhJFW2yUasuCGaqw2OKZUz3Uoh4aZeXD
	b4HMINOHXJE5dH+brf337Lz/IykGoBxm356zViAFlRUAQk7CURC6EOHiQLhROHfDmOT84TtJBVTKp
	mbY06YUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Wk-00000003h3N-2ULs;
	Mon, 16 Mar 2026 09:46:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WL-00000003gpb-1Jwd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:45:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64ej61282063
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=; b=F52FR0EhvI080Bw6
	ZAJNJx0a8UcwiT3pF4CZaST6zvv6FC8R2WEUPwGU+gRdeFs0uVCgYR0x2hqAuiLq
	GIJPeQG7Jo58rFBq3l6pxK1KOXmL1nNKvQp2X4lK1ud+bBmUI2E1pj7K4OrxUUj8
	EreZJmGtfRbMrEwQsViN3qglzA3t43jI+pdjhZ1Y/0y4aDYlRKhDWWGw6X/9f3gL
	EImt+siXIOQQXUd0q6gCYCKY7EXGXlB2sCDkSi9xP1qBslke5TS+K6Qogxl/lb0F
	fxkLqOuUO8xl6aXBNz+gJU0vXnhRPkgLnhTM2E4mq5EuExlAd303cZSBrKJuyyj8
	uiS9pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc50ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7fec8d44so3137489485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654356; x=1774259156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=;
        b=Iq4mR7bY3z9kL6AIIOXMrPGNWmrUnoYAI0q8QjGWCEl/rqFtBk6QxsU2xa7c46t+GR
         YM13pao4a0dbMpzlxICO3mqMR64FWugwJVy9sVXx8knIB30d9QqTV+GjtM/iJQi3x0ms
         F0+dnBuURrZVQxj7wbxDjdDgCyU2FT9u1pseGOB/8uAGHxE4rFSE+Ig88zpFajBKgx5K
         g+V+lJ8Z9x2ZvSzFHmqT8dlXg2vKEuEaSlJjqHeYzpYsb8Jh3JFQ0BuIW8ZIYu2ZhtoZ
         EIUiVM3dx+MIybakFc4UjgithM6aesxIhspxUontYnt6J4nTUVh9avf137LHp8EOv6Pe
         TG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654356; x=1774259156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWPerG47//Rh0t217I+PdOiAOICa6opjKtGqqyPqftY=;
        b=qaNfNuPzd9YN3rA8dpzF0zECuRC/RVDEqGVn0bUDty4zCyv/8i38B8dFkTBzEojgZs
         lRro+BbkikbqvQM0kyZ+Rxi6JypiNtFUzm3N9/92YRRhuUsSs3ZZON72OqxpyJcgNgFJ
         ZxaNfEwN5cU59mRD2uuC+2WlB++LV5vasupfL4GKUBCUAuX/NLbOIimRtAKAfcBWjTMf
         VGCPqS2KEFIFzrwpxOK4e5BidaPpRbnpTWxVEUup0Qj8x39loX6vPIRrYf7WSllkomQc
         slWv20uRULoiO4IssLlNmg78+anGoq5mE4RMNVg7oPJC1u9oI6PM6Shgdr25AWS4bKsU
         Tsjw==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZD5G0Fw3YUMClf0FgxxkctInj10mfm7SxrISqA0kQ736MVzFjAXKSomI8q+uC396yHNGBK66FFbaWlkK3NPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv50LpLYgPZXOt3IB9R6Q3r68yTcT0+RC23WtyRINFXzlDPile
	2FvUJC8s2nTQ/lbBY9E8F5VW4f4jsQubDkzn4V9rykWeyY/O/r7jp1K5BH4LcgtkLlhSxbrNYZc
	ZqeIF+DniTS5WYLMZMujF2ODsApBGzOfG7wunttbc7SzWoxF0dDw6y8jU2OnnzAvzp5/cjdMAeG
	911Q==
X-Gm-Gg: ATEYQzw7O1gtlvWCAl8d7MntkGtfSkfP6+nW1ToskvFDL/W9dkAWIvsCfgQDXflINOr
	xP1NywyoFspPkvFoLjfeJusYLjKaQPvMXj7KQw+bS9vxmrQeviafQCmbORf6PFv5Rjxf6gGQLI6
	stvkjb9IUW4qgOFhmRQaUA6GsAIMtkaxC2nvbvgNOX7MOvozEslgRY3LH/hRmoW23BlSbUSRNbp
	0VJel4d6bSXbUzfQAmwdQfZLj9DHNgJU9U1xD9O3gsUcSAHjTDrDg2ZGMcBWdlr/fbDPnsVt6PU
	Ryhjto74RBMp6fWI6Ca8xq3hylb8v89ZRUE7/D+HIjHOavLEwa0/ZVeRmepHrxeGWO0L7HWCymi
	nNIuC12ZbEBgJ3kNdMt1Mt+afVHCYmuEQFObXFWRmNqjP/vDys+UD
X-Received: by 2002:a05:620a:7103:b0:8ca:4288:b163 with SMTP id af79cd13be357-8cdb5a05dbemr1624641485a.17.1773654355877;
        Mon, 16 Mar 2026 02:45:55 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8ca:4288:b163 with SMTP id af79cd13be357-8cdb5a05dbemr1624637685a.17.1773654355478;
        Mon, 16 Mar 2026 02:45:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:26 +0100
Subject: [PATCH v2 6/9] bus: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-6-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vpj7XblcOBfhTzLdpL+R0P+2mUUD1VQIJTUYQBBtQPc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E/BPk3re52ZJWSY5xhnCOBbXVxjU7260Fk+
 srsoMcqMFmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPwAKCRAFnS7L/zaE
 w7ebD/9C5UxsVXbQ5n7GRcwj3aymQcwnmyJt5yL4Rjo3loecX6xlAIkCw6qE4wVvwlikpDiMICH
 Hlu6BqVViA68+gFZjra+HVX4cOzmIN5Etdo2UQVZnpgLkbtFl0aVyfjMXq/KEzefEF1MQ5xW+V0
 8P/5vVxEo/wTwSEUeXu91SjctdqANe9rV+yw8Y7yvO7/VxdJs97L7trXK51vWRpKzzeBGFLwgSM
 6BvxbcfOouG1wqurT5mzb8ndXlGrBBwkK3bL1VwPLaOpprLSCibrFFUHcr/Z+qWyYQOxPjfipIK
 C1PYQRPoXpfYokNYx/wtSlLunVdWAgJUBCbli+AGoHcqL+7B016/ejjMfBXYAMj3ez9oY+Nx2lX
 g63HzmI5tbWpMzltRMaOqJvZ742jn6tUPwfmbzhUwRKb/vZd2F9cQ7xcL5JS5j7QO9OXDQW7Kwb
 bm3sTzDWsRqJLEgbM2zLYkSo5Pm2sUoTFTndNwjNCY1r0+ltSAz2Lty0J+erC8vlj2FyHUIORQu
 4morlORo1RMu3RvdZ1tDEpXN4wof4XKnugvEhbsmPlsYqNKUt5XbyCFJP0/LFquiiQWRfXgPI+i
 Kzs+Uv2OCTkDZo9Oq6IwDVn/idGa4h6W7vMhuxVUixG0QCg5T46K09qvQCgBXcwz06G15PzWuDb
 Pd1gyza78ZAtsXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7d154 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tMvFuq0QiVTRqkuSJkEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2EgDuxlkTRrbSQNoWUK9EQ-ssKIMRj4S
X-Proofpoint-ORIG-GUID: 2EgDuxlkTRrbSQNoWUK9EQ-ssKIMRj4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX3oNC/d2F5QRR
 H6xhublLQS88Ajt0cMfxEUlVlFBQfdmjQuQoSELCCzR/TNxtZTna90x6+BNGPV+9cQWTxTIdtsc
 5UeQPmASRi/Ni8x/ovYRanj+d3i4wNBuL4lhs2IGEjUOLqxnqpNBTA3W/QwQxmqGCqI22CLcmW/
 AIu0vsa/QiGLE7cUBIvuih9ZrY/6ZoatOfifJ2iLTV9ykDq6Jrkm+NpSQTuwKHv85vxTl82LcRt
 fmYquKKiujDmxxW+0HcpRLJjc90MXeBxvM+c9/z0C8p9xTHcDIgsZX9deUGnaWtlVf4Z6Q/sppg
 cTyMqG0wvU9IGyBag7X6VmkXBh7aXRob65oHpqnxGYpPNY3No7bod3CJyIBGN0fjRY3aAGYvqWP
 PG2HfOvlPyTQh6lmVw4Y/WRRukv0goflac8NvDeaPI1oBL9Oj27DNy3TJTAPgyHzS0cirgp/eRa
 DcrlfqVc6IPc2lVo9Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_024557_372180_AC6D0F2A 
X-CRM114-Status: GOOD (  17.05  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 3181d8aa32a3e3ec26935afdbde1ef647f425fd5..e4b1db809187fc5f8b39e3950776df94005476ad 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -216,7 +216,7 @@ config TI_SYSC
 config TS_NBUS
 	tristate "Technologic Systems NBUS Driver"
 	depends on SOC_IMX28
-	depends on OF_GPIO && PWM
+	depends on PWM
 	help
 	  Driver for the Technologic Systems NBUS which is used to interface
 	  with the peripherals in the FPGA of the TS-4600 SoM.

-- 
2.47.3


