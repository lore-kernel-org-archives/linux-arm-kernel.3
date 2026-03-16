Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4707BF46426
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=; b=kMwFi1UJQBxKYYtn9H9/F6iZlc
	mCp3mLJ5nZsDH5Rqa+Fox1JbLau7PG37L8826KRBteZRC8jiyPA33pzZ2xxq4sPsxxeH3TQ19PySf
	G8Wr1yd8S+cFfweOeT3gTTxnXBgvhzZmscaXLF9pRa1MtID6O9AFYkWXFipaDGZD355ZidxVvf140
	NnnXihSao9NWqhaNnsEUnfol4VEI39QLnoCc8saJikWT15ze0SL1gjKmRp1/a2iE72W+Co1vf86E0
	aHNvDJdXbWn22JCxcPwXTjTthl5UNFZBwJiezUNF8AfH95tUJgxp++ZI9Z16RQHPWSOUwtb92rGnO
	Lxae8HoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Wc-00000003h0H-1voE;
	Mon, 16 Mar 2026 09:46:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WJ-00000003gnp-0848
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:45:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fsm2672200
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=; b=Ah6jhUXpoBakze2y
	2w8SGxWQtyIX1qayUBDXigwddz8W/9QJhjLlUh0bV3q18J80OrfPQMFWSdfoGXGK
	Qq+AVFJJUFKI/dIkiFwNpqLSh9yBZ46GlXE7CP7SeHZ2e/aLjXodfZorqDK5nRPf
	OuA85HORY8DDw3pzGERKU26bAV9rzBW8eKmq6Q8+CQMYf6KKb7KnuWRGHT6llzy0
	MRWGzlwyQbJC2SYHpN97KCRd+NgvsnIPQim1aXWSOCoqdF052iOQaMGxU4W/gpqX
	qoBAsxcuRca9afQbM32Nec2Ro1LaXlML3mqQOHfb10aznyfePYELWQ5VIGmGpaOk
	Rig9RA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xn4bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7c4ab845so2121297585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654353; x=1774259153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=;
        b=E5yQAlvGi0O1Thy54NEeuci4aAbdsKJLhM2u9eRJQLz7jNnfwGS2Dg0a5dUfgk4Cbr
         VYXLMaHvys14g9N66AGOtcu+qFboPmTDAb53wN8S2kPBrXMwKuIzAy3vLt2Kixi/OfiW
         fyDTzx2TJaEleUXiwWPAbYfJk6UrGQeyLi117LiWGXOy6jyAXHgi1M9KUyoRe+e1f28K
         qHN3phP0iymoNAIiLjGFRnLr+LUQd/IkAXTBw9v4w5+fUA7DPbwmAbqevkQW8tHlqJNF
         u0HefeMhrIO3O99facuWdHkzR5TPfrw6TJxn3833e7hcbEusFS03Rf4IxIZCTTpuam4f
         t0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654353; x=1774259153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V77ZeRO5gkyRLxJmGfiVvPBzaaSm4qWfHkN94gbvCVQ=;
        b=VIj2W6EfbtCAidrBY6jLABUNlEuw3SuEgYxvx53upYcP/XkXuw3gPmBoykDKg5wMgF
         EcOHFKNTEuS0/JPzGJfe76gh11DwsdWwl9vPzf+zdFlxfsE/2apw9MLhqceRYWP5MVas
         v2SM+U1ZPtN73N/Vf0OMgYWzbrHJwOoMMM7LLHSymJt/JM52m7bGPeD/2RqIZBPfeZQt
         voMsyIiHZOQMEJR7DbFP2OiJdEmwLIsZtDOZ3NHy+xPK8PzPf+dKkyhqID8UiaqN1Ce1
         4BcrwPA8LCirVTXNdpmcD0g0seXC7CDnprXGUMryM78Kg7+Y1G4sZBNId8Ik9Bx2Fz7J
         Ls1A==
X-Forwarded-Encrypted: i=1; AJvYcCVpRynHpD4neNdqBEdpV6/egbUiqgQ/If0zk4EsiNJ7llP4H5RTltqn75eQG1RCjWA/iUMmvk7J8PbJ9lhcTAG6@lists.infradead.org
X-Gm-Message-State: AOJu0YwS3GEZ4E5Su+Lmoxy7aYjWiNKN0S0I3I/U17nqzCrf9HTeqf8l
	EZUXylu61gmsLs46UROR+nUc3DB79vt/cTwv3TOU9hRHNIVAD2AlwInl3vhSoKJBwsD6cNDMZxc
	YSUyx0hCms72pAd96f4uWBN9AamPFO/2P0MojUQH8jIxGrc6mol3lkfg06r/DiKOAFosom7ipsX
	lICg==
X-Gm-Gg: ATEYQzy8EjTyzuYYuFAhH5cQyHV+w6wEa98EHxyZ5dnt0Kgp7N1wIyhiTDAR+09C4FM
	Ms6qDK5j6MGP0orWnpmUHDjwKr01TJOBPPVyUQFBxGJafViuvcwHqp1Eom/Inbi7tYCBV+ape7k
	zvnfxw6k3ywtcSby16fskyPEV5KyiIcHC5QZHi8Tk0PX/32duT9Ds8c7jBTm0y4AlQ1FEKhi5Yo
	pRXVeKlJjXEmi0FWDkuzl8bytgNut5P0EjcDotUmgZKkeL3tINAt9ADzmA6gKOcilvEIoqRxRgB
	X57FCbwJQk1Xy9kHc+jVV3osUgsC5nBcOBzfSPpLAseXZ59rGj0P5rNIjtgwRVmt/bECowjLxts
	CMHaKdL/eWD4A5g/Qzc17hlqvJYAJBWTio3ZIBkcBEYPfAd2/mIKT
X-Received: by 2002:a05:620a:4044:b0:8cd:8447:2438 with SMTP id af79cd13be357-8cdb5ac4741mr1453872285a.36.1773654353314;
        Mon, 16 Mar 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8cd:8447:2438 with SMTP id af79cd13be357-8cdb5ac4741mr1453868485a.36.1773654352832;
        Mon, 16 Mar 2026 02:45:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:45:25 +0100
Subject: [PATCH v2 5/9] watchdog: convert the Kconfig dependency on OF_GPIO
 to OF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-of-kconfig-v2-5-de2f4b00a0e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zJiRRZHOn7YqYQ+LwAzSJIAhBCW3qgcwJUw7el36TcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E9Wjg25U44jwuhf3siwRv6gc1FrTGrZYCag
 DWx38GqUKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRPQAKCRAFnS7L/zaE
 w8FnEACjGpR8zaC1w1NeBaLCJvktzj4NhYyW2Td8DUd/H42BEdQFLueq4ukzXtCUXnHdHSdYlxX
 5u85kdqwdApTbieFxlcUadqplP0P27zARAEwj8BjR6bXmDtxbyL9zA5AskPF15evHuAhtsb0vLp
 rWJ/hPriZFRMOTvoiz306zGosgjHeo5b7IFdBRXQKj9pWZu9KC+6nj5Dde/Ek3mIsw7+7RlR+uL
 QLlJnoVNjOKlMMbwrMF8wLuyGxcetuCLacwTtrAUIPDb8Wvg+XSlQ61HFsVAI+6edYFrdWNBKZO
 qAuA/aWE+2oLqr2TcjOEd9gTRLahdebgddcpyr3CudMSPfCe0ZsfO7omWEYO+mh4eu4gObaIOFi
 rSbIFdwsXpTDZyGm8d1I5QasUJ3+T+m5Xxx3yz/Xnw5U+5ch1XQ2oj8rtwYXR4/xPwKE+PhAyev
 EfAmjkak0AwcGfVxvGVwN2Hsn+3MujSJYtzJKGNWR7FqZcI4vanexFwbfhQUBEab+O3yPbi9B8A
 /L20/ccFo1EBkUthx1vFD1wCRe5aIuUQ6rQ3XskhBK7QPd07CNiGavrvpP18ZsC13Tt+iPg8Gd3
 9cZ+OAZ9R7FbhBlqGEwWzhdvmPW/KCw3MbJmuyMjozO0JiauqgeMASM0B722UCBXMoO1nFINRbo
 DDxY+Xizi+tKYMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX7H0PulPnGjxy
 nlTlhHGui+vVFKbW5qdEM9Q//Kb/YLNO6SSRmJXzCXlrABCPf0vTEabsPZ3gOf0SkWTItF7Tezj
 xz/1tehhMJGI5th2FxgYFjLXGPZHBYDu7+uJpJ3UCnA4Qy8/UdrgqXTvbewCzR7UMRjMl1llMoJ
 87jmGaiFKFA7p9MiSIRssSbeOmCtMGJ4wzIm7MlEQg4+eM/WjKLqPg4IqbVy05/mPbeUqhuvA08
 8caGkJkq+hHBX279gzUI7a5Kb1p5umRDasd+JWQkXcBqlnOzZNYpS+cF/XalXU6TTw15KY2QaOk
 jZGfFTtFLIHueQU9QwZ2Wr19Eb+JjDKvfcQmUQ2NyVM5HfVcXb8k3eL5aXoYFRmGuFMGx76zNLv
 XGqGZpcvxMKsRXaepET90h3h/qTyngMVknXUuhPYY5Tfy8cuy/m+5gRNyKJv659PlDMBsu96aKW
 kkuo7w2L+o4Xo6F4cvg==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7d151 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=_jlGtV7tAAAA:8
 a=EUspDBNiAAAA:8 a=KiQ1yeRyPa_UOXqLYlIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: VmHf7UCTw0gSMBecVVEbkScW_VZtNb1D
X-Proofpoint-GUID: VmHf7UCTw0gSMBecVVEbkScW_VZtNb1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_024555_306936_431EF000 
X-CRM114-Status: GOOD (  16.93  )
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
explicitly. We could simply remove the dependency but in order to avoid
a new symbol popping up for everyone in make config - just convert it to
requiring CONFIG_OF.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ab1d5d6df5f32f084c893a7af54d040082a3b6f3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -250,7 +250,7 @@ config DA9062_WATCHDOG
 
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
-	depends on OF_GPIO
+	depends on OF && GPIOLIB
 	select WATCHDOG_CORE
 	help
 	  If you say yes here you get support for watchdog device

-- 
2.47.3


