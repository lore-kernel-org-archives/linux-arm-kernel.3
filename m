Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49852E74916
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o36W/UCDfdMLf9jDIcIrUIC4VX+sHWM/PvTKPnn7bn4=; b=E+c6HrnCLGHTKQOQ4ab4jmw3v1
	AiyaLzhkVM06nudQG569T3L6AME9DOyXzdOMDRVibj9BTMgLSVaeklZ1FXBOcp1RxP7+m4h5xMSCf
	uRfhhd063XrUvmLLG0IG7YIIvGVI8eOrzmbJr1TkkyImWbtUIv4LgvBbvZ++iKurNhkm6USeJjIiN
	fAi6GPrwNZhJ5pJKyA/MQKYc/PKqKWKRmTGgw1LozXHrFBulpWZsgOuIygJTa+fo1cevGNGerRT5R
	Ajiw1TT8xuit7r9Y2OBNO6hdxdcxveK6MRGQrnRj2bJSimjk3KP/5590yY246QB+k0nq2U7Z43LJB
	3mHUjW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNG3-0000000GkoS-1rBN;
	Wed, 24 Dec 2025 11:42:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNG0-0000000GknK-3FxS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:42:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8wHRo1206421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o36W/UCDfdM
	Lf9jDIcIrUIC4VX+sHWM/PvTKPnn7bn4=; b=buMhrigVH4ZDUFDrWpm+HEANSyS
	ldTIrLwuW88+WwyQut3wdGNdZndgnO+SOvmBJxyP7/bZPjeGVMivrqmU7hIBlYMh
	fK9ugs0UXN2IplbkKRu5KfjRdypxg6jdG8V7QkHXfDSjb0i7z2guIbt3F2iNv7T4
	PahEUx4Cg04Xt/c+Xm47p0q+wxm3qeeeTQ/ywjPVDer/TZFb7u/lgljNcSM//RWs
	UlpXi4gbWwQtr4K74iZB2jmCWFD15POKZHT0XHJJVbyuefAqSj+rkt8MqTLcXlYO
	Kmst+H+fToS7rSrMdt9csgX5YSVnnNeM7C49zwDx/lcBLpl5EBsTAKkpARQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r209k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:42:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so127385731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576539; x=1767181339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o36W/UCDfdMLf9jDIcIrUIC4VX+sHWM/PvTKPnn7bn4=;
        b=RUC5BDr1XCz1JLwZ+oMPvvHyNDwuCLRe3T9Bb31gvgxXymOArBG7bdhm4x1AwpBnOg
         YIjwPauW0PfnYEEpOl7v8UzTpaBGClIl1pqp+oMJ22l/fCZR/5HtlXfN2UJ7Uaf4YN6w
         pPgo3TpcBYWDHGNVM6Ou/GUKaR2kBl5oMhWUzIf3VA8zOQ58al/YUl50ZqvdQUf2Oyt7
         SGdKjwdVaswtF8yiGH6rF0jpSE4TA6zgOdODmxxuSW7TC9jGU8ago4NPJchROBwe+KCa
         973FDWeGpJ3tn8ezxiIQ4j+lSzLeSiGNxGhGesulwl1wsxRHdePJHLbNyL//CahLQ24X
         YRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576539; x=1767181339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o36W/UCDfdMLf9jDIcIrUIC4VX+sHWM/PvTKPnn7bn4=;
        b=TkVjA/1Vr0G1HG9+uOKyg0jtGbc+tPOdCHtr46/t2pJ0w6S08c+oNcEsnzMU+nfrDq
         hAIc/ycBchetXO8hbRGaTGiQDiPiNCWqvpdReivb6v0+f/9LQozOGu3H2nImjKK7kpBz
         xvDaPG8lvmNMlLsjftkgAQBF86uhoyOZLYxTWo7RwXSWFwTnwE//699waSTcEmMZ1obe
         SsU+Zgxpz86NsKauHKGFWJbFjLA/P+B84efQ8TBp1ieePf5dsXj2ng0rvvc+n+ijKKcu
         CJTZiPI2176pks9gzUurA5y7+g02qxcrAfWQ48EiVwaml38re6EmuiN7NnaHyBnoMBIK
         G6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXotVz3MeZEtZMjtaYMxjatLKm3MIiXJq3pihq//XUn4CDGl2LXoBy8DHU4MzfcaRUEXCJVOS+pcs4PG+6suYzT@lists.infradead.org
X-Gm-Message-State: AOJu0YwkeDhXjCUw022G1Y07uEI2FYkbcn3VsVEOek44r6MVDa6shkU6
	V8Nsc2zE8TD+LOujSXY9DC3W135ivjTTcHV4PEEqAaRH5CVYwL9NmsiTofBTsor32hw0ZALgCwf
	FzOCbFh59sfj1Yl8BD7oVR9Lco3owLX5hBNFJ31ueIDnCsI+x4YWqDDrbx0eoZ67i9K/sHPZ96E
	Eckw==
X-Gm-Gg: AY/fxX5Hr9DZNPaoO1a7WTeqABZSKBhaZK7uRDdSmjM7cYBhtR18b8arrvVtnDl4H/z
	FhXvcT0GosFeWWxDgrW0kfDUX5pbBAaTJQX+6IRyzQdGnTHSpyrLPr+fSz2radoG62/52Bklrva
	6412uLH0ndmibxcu/AKMmVB00FqOhJEAWeUTeIHUW7zct6VdQBg3w6gwDjDOURqeRU5XxzLJy8q
	7IXbwpOBm9cjX6qpSJz+53EL/pocdPIhLu0fKsYf+AyfMZzGpT31NPgd4BZfmpyRUc3MK7xIujm
	upL0C/yiS9K+l6LcqcM7LyWAwEfgWPR2BXGmwLt+eODUs9pUFMZZQHgJS6OlaFmpbDiKnhAdACf
	Dhui3V+Hj0cVyyybitudOADCVYCAufr1GE8uk9fCxCEyzn9eWNKvxOd0J+rpYTs3wY4vz6g==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr263159521cf.49.1766576539274;
        Wed, 24 Dec 2025 03:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI4UlmGlu0MWAVxKPogR63RT71nHEFMEspnUNlDF8ULNBFqE58DEi7/oDJNk5A9lg5v8vC5A==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr263159281cf.49.1766576538846;
        Wed, 24 Dec 2025 03:42:18 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm16468342a12.11.2025.12.24.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:42:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] clk: zynqmp: pll: Fix zynqmp_clk_divider_determine_rate kerneldoc
Date: Wed, 24 Dec 2025 12:42:12 +0100
Message-ID: <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RuwOw3DAHE/Y2QWOnS4biJhtv9S/TCB51Bf2DFn+Z0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9GT6UGXyVn6co3YB9IIpVrQAKiyF3irFAvdQ
 NTfPzvs0BSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvRkwAKCRDBN2bmhouD
 1zZBD/9zbcAbN/j9Ty/PuH0sKooc3rFnFKjPFG32zHcTCdoFfNwJ66T5VOYPFWSo+DV2mn00XQO
 h4VHFLSMmxcymj/zHUvw4JsmymhKUvCSN/4BMzzrOpsmRshlJTqSqR/RdlzOy/tHWxIQeNRFYM1
 5fBCDNWuW9TXj4v1G2P6bcMddxcvUnUwmf+ElBwHXu7mJYBgnPlibQQpiMwhDFlijA9ZEtbUUWD
 K1pHN6Kb5vEGTq+sKpKI08OxHVI3KaTYZ3hBXQBmu0ZeGKp5RON0xI+I7N5DPdHZn/UZo9FD5we
 XePjyZFsFCTMODj3iQ1ykYeQ8yzeCEg4Pb/Squ/vEBTwlINlonJUGJJ0daxgoXT5qW/OyfNhokj
 aENHYVgiz4jR6OJiQluacWOaSFOpNcCOkpTjztPQLD7LA42y1Wg77LWGge3jo7sfcxgviiWU5PN
 fnmarFtfhh5zg/FcOYs0UaSKgYikIBrjiw+harlE1WS3p26QMQm9JpaGdlPMkSb7I/iOS7rIiGu
 vSDQrR5AYq2BtdnTciKtQHSRgIUVuAIscvDlGcJQfzAwkb3psYkSeGS8maH+2PFFHwoaKODF+ct
 QdLeEZ5V+3OWewJtSSCzWROVycMi3OuRgcS+46K6UudUNTr0HSlV/tHD3sr6ZdY1zw2yKln6CtT jkFN0gbT82ZPXig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hq1bbDFI7-GzRjrW9XTSj30_GZxqpWfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfXxr8IxoldT0rc
 yQF7PhNbTLSIifSJOfp4gDFPGfrlxPYRKQAaRHrrAHJghISqILr6y59BuQxwI74JypVBbtOnbJU
 g3F9Ah1Mx7AgX27tl0He+mx7DOfmBNzAyuf1BgGbmlcq7BRovN48O3Zj7zlDDilTtFUfqIb1Xrz
 S4JMulGOk9/AQFMLb/+FfDufXnzNYZjOJCJFYgNcN5vndULKtG/1TO6bEzaQFI6DlgAbkPvZuvT
 okFYXJJH18ldnbdNeNpj1SDHdNigoKiQePQVaiPbAxe9OrZyTnhK1r93XoV5l1/Z2mOyNvo93Ti
 rVTdoJ8qY7ZVgxpqkQANXGgYZy4RwR6iUgyKTjYZQJFZjLJd5x48/ECVA68ViGeNLYZHCRr8zmN
 ljRNGrP4mpb3eCd4v8A3vAx22XMP6eZ6fq0MSEkDl6KXv1hFGyoPzncVGdfnHrDA41teTeYAK5T
 u5oWp6ysd6O/4BudRLQ==
X-Proofpoint-GUID: hq1bbDFI7-GzRjrW9XTSj30_GZxqpWfE
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bd19b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iRxSLFVWlc-pLDnZHRAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034220_931290_15F8C6C8 
X-CRM114-Status: GOOD (  13.65  )
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

After renaming round_rate->determine, kerneldoc does not match anymore,
causing W=1 warnings:

  pll.c:102 function parameter 'req' not described in 'zynqmp_pll_determine_rate'
  pll.c:102 expecting prototype for zynqmp_pll_round_rate(). Prototype was for zynqmp_pll_determine_rate() instead

Fixes: 193650c7a873 ("clk: zynqmp: pll: convert from round_rate() to determine_rate()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/zynqmp/pll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index 630a3936c97c..6bc2c3934f56 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -91,10 +91,9 @@ static inline void zynqmp_pll_set_mode(struct clk_hw *hw, bool on)
 }
 
 /**
- * zynqmp_pll_round_rate() - Round a clock frequency
+ * zynqmp_pll_determine_rate() - Round a clock frequency
  * @hw:		Handle between common and hardware-specific interfaces
- * @rate:	Desired clock frequency
- * @prate:	Clock frequency of parent clock
+ * @req:	Desired clock frequency
  *
  * Return: Frequency closest to @rate the hardware can generate
  */
-- 
2.51.0


