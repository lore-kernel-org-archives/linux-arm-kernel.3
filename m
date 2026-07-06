Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDo8MoMAOCaiYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=; b=fibKqG9DDt0AFeVSxE7Z0Cnj1q
	hxQYKldYpPCVRSaSSfJ42N3z8CJgESJyFUzi9QcLwfpk3Yt+KqCn2fO5N5Jgo+YYjn4qt9/y04qNQ
	8DnT++ZTOeL+x6qsWvP726NdrnInUU7BrAd1kglS1UUO+qFd/++3NmU503xWdF1fMXoPR8sx0BpxL
	8BEKxcxM92M2F//7BzGD6jMKy1DSRNGcs2gfXXXQZ+UYosON6PQQrDUUbhWbqXmuZxaZntuhbyZRr
	bf9/vNrkzoOzIg2mc1ebbIhYS7ggEkkg00q0EN8nW44I0dRBJ0YMZyvW5u4jWZqStxNX8/lsPYuyX
	9XSYicNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPO-0000000CB7U-1vIg;
	Mon, 06 Jul 2026 10:18:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPI-0000000CB4T-3t6u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:18:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666A3r1S122980
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aDo8MoMAOCa
	iYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=; b=XGMI8M3e4LdeqaHl9ceYdOhSket
	+h0mjNB3HwKueGnasSlh3QfXzk9ZYYKlH4x2V2VsMlxMImqCSvbBmHF3FCDoFdWM
	RItxRkWbERwmCVd+IYoGbWssvARDPpG6gKwFRhUNPfMFGDtIHG+jCVvGJbkhrS/G
	N6oJekey7owg15tHsGqB3VNx0+1kv/JhbqdJ/FZKLepFbOmi8Ur4d5eFBZpPdjh2
	xYwxwiPYeIdjJQBavV0LQRfHpeZFqzNOMfcAithZ2jzfKgEkJwqnn9qXh6lgNVLD
	w7a4jJ2sYRA5pm8QyJrRjplZKMI6OYGIVBPYMghw8eKb/6UCRJVFRKAAiYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g1yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:18:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so296175885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333111; x=1783937911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDo8MoMAOCaiYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=;
        b=RSqKaTpmeoybbtA42boj8BcIngjT2+0Eoe97drxXGIVU+05hVRqJU8q0+xAezN6dVN
         HnCeZ3ELfHOohIZrvzsYLaUsiVdIxmrp7xi0QXcrB3xmIGVrUnidv/3aYEQEwUSq1tm0
         NO8kA5DjmhC1UeFOs6wPdhUH1s+AiKI+mAYEQ+UakmmPBzrhd0rI6pHmRJwEqN5hWnfY
         H9ZszlGXD/Ph+Ka9vuppkz7Weq1T5uKAwdUvspTXf/ONo8GxoI1hBaulztydQfFjuMbz
         1gIM8gx+ODjiVFVvkiBj4O0PO729bY5NZcnt3qDOMUbV9b4Fy3DJ9Dv1mCdsFmrRsrom
         NStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333111; x=1783937911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDo8MoMAOCaiYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=;
        b=sYHQHYPqFvT9TN+oe9mCkChavOFGSxUd8ppETn+RRfXIiIz6UAW306ufC907DRpQDB
         0XSCFpnjXYg0uN1cmWix7bhLrXceiLodezu5i06Groig/KVWqXrB/vW/WY9XJuCSFsva
         ylmjH4/gHsEdS/xQmcKgfj8L2TqXYdUklF6SQ3SgUcXxzQDeg8Mj4PmRPV5Qpphra6Tt
         /Cwrzqwtq1fnIiD8po0WeY13oYhEEy+XSXvCcQVY0ARdc3CNzqCytIa3WYvNVMzsu+WK
         Fmypf+lFJTuH5bSVdf1lHaqCzLaqC9YEXOGgj5msPwJrEzj1dn+Wikb7FhZ0T0xqYOOU
         tZ7A==
X-Forwarded-Encrypted: i=1; AHgh+RoVM82Ox5qUTj0kYCyXIkVGu2e/WJ9Wf6poCclbfsRpgQSbB4WCcP7z2MyxwMQs9k9N4lZFaTq5dVwZATq3wMa5@lists.infradead.org
X-Gm-Message-State: AOJu0YzzZJwx4/uiYamejzqeEjhdIn8EnzsDYMwCIuCOG9JvMJJczHYq
	oeT0hYGHuTIvlUQUCuxn/nvtE9a6hJM69weqmTvDln67jsnaKsIiPQGB4Ar768tDaL3H9wnvXum
	MceK/KCEe60HS3L+CTQYp9gNacPTsPHPtath9JPbm0fEl5xbWu9QfVIlQPgvC7KzEBQf20bzGat
	L1eA==
X-Gm-Gg: AfdE7cl2VHYRh7H4KiTHm9pViiyPHqUbEtlWMTvYIrSuwauYj3ZKvgaO1pIHWmc0Sk5
	upVGhpZpf4LBy16H6pUTfgUeQuloHS6rp8kHeaQpolzDXyO5aTlWjO4JsvvJD01Wbz1JXwqE7Ys
	qUeweXbLzEzrDXdyU54dOo4T7ApmZK+93Ichr5vC7F75Ph1P0xaXQwhQpLdsUb7qMaRJ/Z7iLjh
	pG5ZrNItX/RoCxhjxlFcVU4nQ6+kP/e0kSMzBgiD2/rSWQWQz3F5qKVEPOwVRdMBTWDPaFJcCUy
	l6bCyOU+1iYUfLVUnaWoblWy4oegoJn/npu+DwjL6KlfUHr8709dk3kswXTGCsTZTo/+e/jdhrz
	cfuyqg6R37tQ0OeL5ZDd8e6/EFPk=
X-Received: by 2002:a05:620a:4515:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e8b25e823mr1742914885a.5.1783333111410;
        Mon, 06 Jul 2026 03:18:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e8b25e823mr1742910985a.5.1783333110963;
        Mon, 06 Jul 2026 03:18:30 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm24350402f8f.21.2026.07.06.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
Date: Mon,  6 Jul 2026 12:18:25 +0200
Message-ID: <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4345; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=J8fceL42EKDgvezoHCZX2Tw8NeF3KSJd25+8oOQeLGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4Dw2EQXufGRpxmk5Rid8ltVbS+lkrBjNViET
 5KJPgUjwJ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA8AAKCRDBN2bmhouD
 12yzD/9SExFX4onHKFPfLA2LoB8/Wmf/a4TbrVGowWDUpYIEAW7kjaLY5UE5bwnLJ10Ts71c8Xt
 NhoixDDypxaKj9292THd1+wjz+ObgyF+v4sispqlf09zNod65LSjwtmyqeUHOQiqaEagEVcdKdq
 RFmbshpoNYzXAdykDP1ic999xNf4FSsBjhhftj43fIvcXOJpsJjXV02Zcrh3vMKOYbsicQqtPfm
 zV2wlQBoSQeOSyCEGYyrSi3ajC5k4OrSLm1MwCt9G0RdSf4jV43fEQFXCpjCx/leZlYbEjmXIq3
 rFDsxk87DZHu06J1KokFnhfE608C0/dYhtVU+4y8N4bD2B3diusPwoZlTP+GdWKuxs4jH05iI3V
 Jw+bQQT7DoWRaTqsGhqhCyyO8Mmq72iyIwXXr/PdSy47b8WxgemCN8N8lq6e0Dv/Ttecuq5Kl4+
 zS2XVQOt/i7K9nA7kbt4cSY5XSCoaIxwHlZziByCygpunhWczLXROG45OglIlu3ihl4Q6/hj6+y
 5ZeGCTXJbGa+ydGZ/j6wLhErFaXKQ87Z1uISvqqxZPiPmt4MphL67A++UQDODn/ce2voCtSGJP2
 NqvtDdpXNKInXwlJ4DFd6Zzqci9Tfs/OC36P1C3rFzoculNd1+TeB9wLCgEvW5VhjOxCAf58vqi IHiBC3T5YlH31kA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b80f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=muePWa0SRqB7cAwnof0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX1AU1nizoF65I
 nbUmDoHGGKyLB9b8LXhoHwoFStbK/IKhDZyZYAsOFF8UHdTvYXdV2ey15jwj1F/nEXBvQkySTPc
 xC1/0b6qtbmS1cDh2f+klFN/HLL0ztKAGxq2qeHSzkjJEie19SowRZUA1PKdLEuUnXhg2qi6Chv
 HjVupi5kFHqaZL4TtbEXDMxMUPSAzHVgfRnWUDCjjq4scBl9nRbLbMOW1jhA3ExVk1+DwhdWy/N
 oz8dHP1E8vQW46Z/grLM9kELC4x2sXfWaz2/OaXydrG9WPY0FB8VWkNRJdcWmuk/Rkbp1HPgluA
 PC5NsaXsDjvsTOHoSUYVIVb/4QVkoRuF+C27AuCPFFlpcS/EwnHhE/BdhqPhobDzxuiYwpR7yEC
 36Hm6NUfUz2oeGAt0F0v6M6QnewzxiH/0dkBvxO8a2VQriYUIHTLgHtcFqFignbKir65jdnxlaY
 MWiutziFVkMuC+LMb5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX0BX22tIvKill
 eyj7xWMBG4nSWskc53noF61fJoDMVykTcH7QjKqQ8SJIPMOx0wTT51KMK/FWGikPMj3hrwqRSfI
 45hn0LVlG+Vvts0yZXGfujtPD4XwsQs=
X-Proofpoint-GUID: mAssbeiE71-pqdVoYObnZ0rw8pq_V1Du
X-Proofpoint-ORIG-GUID: mAssbeiE71-pqdVoYObnZ0rw8pq_V1Du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031832_995579_59620D53 
X-CRM114-Status: GOOD (  15.09  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi              | 2 +-
 arch/arm/boot/dts/st/ste-href.dtsi                | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts             | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts   | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 0f87abeddc33..25a20fafc6b9 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -1119,7 +1119,7 @@ msp2: msp@80117000 {
 
 			dmas = <&dma 14 0 0x12>, /* Logical  - DevToMem - HighPrio */
 			       <&dma 14 1 0x19>; /* Physical Chan 1 - MemToDev
-                                                    HighPrio - Fixed */
+						    HighPrio - Fixed */
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 2 3>, <&prcc_pclk 2 5>;
diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index fbf0309e108f..a85d87665610 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -207,7 +207,7 @@ mmc@80005000 {
 		// On-board eMMC
 		mmc@80114000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			non-removable;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 1322abfc7acf..14ed1079ff6c 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -295,7 +295,7 @@ mmc@80005000 {
 		// On-board eMMC
 		mmc@80114000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			no-sdio;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index ad9a20ccaaeb..0c3eef7a294a 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -402,7 +402,7 @@ wifi@1 {
 		/* eMMC */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <50000000>;
+			max-frequency = <50000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 64562a3a262c..18fb7263058e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -452,7 +452,7 @@ wifi@1 {
 		/* eMMC */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <50000000>;
+			max-frequency = <50000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index cdb147dcc1db..c34d43a2b750 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -274,7 +274,7 @@ wifi@1 {
 		 */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 064d6fee8821..7bf4287f6e13 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -253,7 +253,7 @@ wifi@1 {
 		 */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
-- 
2.53.0


