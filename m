Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A38AFF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qig1LQfZqj+uPc8nSdpLCAnp0N/nSYgIaCtvzTFOc/I=; b=cR+YiIhGR0mHlhOKLxVHxMIjRR
	YxQf8TNRxH0RxXQtBXgz/sTztF8O6GYrHdCpGQuJ5YTSYPc1vkpqfcuM76GoZfnILQklQtTPX1CSF
	eMw+xXA2m4aFmceZxrhpmDJdKUIbfxmp73QgNTvlS0nIgKFjiloxyDYn3iEcIEnC0ALJF8zSK38nx
	xiuQOVOyXnQGwsj5hXsiZNt+IkBuobI4lRHRIo2eDjKuOtMvuB7Mg4cz0ivwt7n0D8loURlIuMQNb
	3/gje1NBXMrc5sz2eQDsR93uWxagCtcEFliItxZIln2EC1x/8LAdigrqiQr36gfHiEv+2vQjFs5jR
	LZzk64Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFxr-0000000GK7j-3kGU;
	Mon, 27 Apr 2026 07:01:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFxm-0000000GK5e-2I4P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:01:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMO3bl2391624
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 07:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qig1LQfZqj+uPc8nSdpLCAnp0N/nSYgIaCt
	vzTFOc/I=; b=B0J4qsn5vbzBpy4fP7kR/IFkESfBs8yHz6Fa/Dltl4WKTkzjxfy
	vPSM4vlAQ6NDUDR99Fpd12tNM0I8cBV6QOmHXMBnvSudKQU3MuUIHQQ0CLXAzyOl
	u52Rts7L6urINzuhEFhD9c1TvOpSXMsH6Yltj1V9dueOj9Ndpaz1MgUL5+IyN6ys
	K58vyRC0waWlE/rr+wd6su6oVDlDzIfpZ+4UUPdfygoJYMERiSR9v/RjAqy/LlkG
	9RiUXp/vfgUvoFLxa1YRyjaL45EStb5QDPgJNjLTTcu5XT8i6BRP/pjaTKg++dFZ
	GvvcXpoLph3u7oD8xFskguO+DVqdUgEdQrQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgvqe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 07:01:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5662a21d35bso20513091e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 00:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273261; x=1777878061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qig1LQfZqj+uPc8nSdpLCAnp0N/nSYgIaCtvzTFOc/I=;
        b=AYLjd6IEfpY3QFRQrYbbZc1MDAly3aMz9xDHpDCl6ohWCsoX4+tGRuMqrS/VsNC7CV
         tPauhdj3wiPT8Q6BkfVhVrbrLom/8hnoohjKbWSpcWZIohD/LzvvOAFKAl+JEemrPguU
         aOysupVJC/JRvTEQqxSQSbno8YOzevPoZVZyOyorctpS+UTt3DnJP9MaQliBLEKrKEvH
         lgXFcYcxYCSdHwRJCXBf/kkOvoQfM/OFeZppWNGXFsbbxP52c+9v3xZsZb6MlZMmXDxp
         ytOvP16ej/tSqfq5aFSXiDK0bvVhk+C7o8JgTrc3F+V1Kjblfd/0Hwu1YaGyA0c1wxts
         mPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273261; x=1777878061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qig1LQfZqj+uPc8nSdpLCAnp0N/nSYgIaCtvzTFOc/I=;
        b=bjyHYt+QOEqxdwj1kVdSgPToFY11RFnFk+lk9N01+PTjdMhxZEK4B1+pJAJqXV1vES
         wO6rwpK04OIIRV4qORNvPB/PWBtnEI0ON/X4sIOzcNqyaEpFqsGwUlTKq3f+jY9DEZZW
         0jhXRRewIlyQa8XJWd65IQy+/XNA5YM8sy6hl3Cshq60T4g99erY+p+G/oQtRjjMkGsU
         piebohQ2Z6si2HgJFmOuM41xpDTqgsztZWgf48w048uTXfdpgtm3i7zFwDlwzOslCtqo
         tLcf6AKO9WDM/SGSKMIX4/POVzLvRTz3EhmUoep9RosgkAGUWZqh0UNFnL9zbsusz2Lf
         O5Tg==
X-Forwarded-Encrypted: i=1; AFNElJ+XyYeTdHAVhI1muVj0AessbSrH4cmO++9S1hcIUQxYM1ufG7Y0VNJXi9pzLMNZ/3Rq4sFjbMrI4sHvuzvVgZ2s@lists.infradead.org
X-Gm-Message-State: AOJu0YyXTyukNn78pJ+bKS/6DCM665qBy93I4KIHVVLiJ+ZTV/yCiZlR
	LWKnh6+MrGIm8y4ALGjb/Q7Nn+hgLSW4URe8AjHjyQqpOuNMkSIDIlLu4AxsF3YVJ2Vu77DHaRA
	E9htLwWPp8+/QpGkL/pqxUD+XsGjFbq83FoltJfqn/TwVH83fH3OS8nZt2GVqujfFl42waHDKX9
	dBGA==
X-Gm-Gg: AeBDiev/9lCUKpGg/YKCMdqf38LHR56b1ffxkcv62hSToPBOLKxI0PiD8KQ7DZQFpNm
	R+iIgcuUqo5sw5Ze4OxjTp001Lqdp4ut+Tctmy7fqQ4fFr0qlPXJfGFjGem31WhFLdo9UitnvXO
	1edyOuSIS9j0NV48tEham91qL8sRNQlr0yR7oJ6MqiNcZDrJIgHKSjgrT74YMADiWfGq0NR+f2I
	r+ysGHKqhMuZzr+EiZlUc0+QUKvkNOXfk/bjnbxc2QnV4s7vQKZP6HfwX6GYgSJ8GYeyerrA3Jm
	aKr4gA5lw9EhJDAAsUo81UHnUKw9i0bfELIHY4oJniPvNV9wIs9KEcaEPRXCituk8GdLWlNm4ml
	/ukKCmbFpDXVF5/7pmlJrkkMDY9UK5ZmQQsDirqiSBVHkjXM3YzM6rqzzBlpIfNpirU5TynMTX/
	RJApme8GIJqg==
X-Received: by 2002:a05:6122:3a0b:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-56fa5808124mr21604531e0c.1.1777273260909;
        Mon, 27 Apr 2026 00:01:00 -0700 (PDT)
X-Received: by 2002:a05:6122:3a0b:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-56fa5808124mr21604507e0c.1.1777273260493;
        Mon, 27 Apr 2026 00:01:00 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1393f5sm716382795e9.9.2026.04.27.00.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:00:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] perf: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:00:57 +0200
Message-ID: <20260427070056.18140-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k4YB8opbBw344ozjCeHK7Kv82EegIQzI3fMHh6g5Aa4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmoZdv1uIlmrphTPV8l2g0yWVfZOvw+HHm1F
 LDm7hSUJLCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JqAAKCRDBN2bmhouD
 12udD/sE1ZxN1kMdztPeX9tA9pPE23yxt0zdodni29mmrl2fVkfYu0NSsuogiCQjiHZVJr40Sr4
 pT8gXASC4Q/t9+KCZGtPl+QdrPV+iftPc4yzSlq5I7t4B9S9K0LEu25pjsySY0nsqPLqMNY/nLZ
 71PxlcSqTsgizHMvYYMyprbEEfBf3EhSMFOZgZtu3Qncxn6Z//zE6cYJXD7+12FL/pzTzXcRtNU
 GsCy7ooDGs7M8rtE440FIx+CjxvkIqnYms2L7k1A/8DQZVEXm80QqhYTMOsJPECbzt7JYUn0eOW
 4hFAnmmepUNHT7jq2wdUA2snHrFp/LPX7cQJm7aFohTyCDW60Sm8Q/PaMNH+gEFDuD5jrCDMbI/
 r2v1J9M5EC0GuInTn0ZWFC0rm9FAM07oRk1hcFifoR/gC3613BM9uMwPpaLdnJZs9Fv9w9Nz/kb
 K6/amh8uVFmaYqlW1DUkuR3nh0lNsfhHciNekzqTJ4cbBdwc/CfPXzGyugKZa9Nf11blCzWf6ny
 ASvZtAdbrl5bHG6zGuqMwC2Amyhp/rXfjHhobD4fYGWb07XeSd2bc8e2WICY6xhnJwwBxR360xt
 CxWXrot7kRGTDGO2PtLwEN/60x0pV84n7Dc8UyNj8BXwcH7KUuC+myfSJVHjcwmseXRWGZbJRN9 xPlHA4xGvdOgFxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2KPWUfe3NP5cENKTaHxtmwuC3eaPDHhy
X-Proofpoint-ORIG-GUID: 2KPWUfe3NP5cENKTaHxtmwuC3eaPDHhy
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ef09ad cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Vxq8--nCh1aH0Y99WKwA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX4cXiiCnJxURS
 DyCAmziJUjxm2DNCSQD38xMXQQ3e9m4PiGG1OmT5kln3WknXCgt5gj5UgDuS26YLf1ZeAFrsxTx
 sowMrWN7kf0zrBadBgtgCZZW535skrCJ8u+nVCsU2ChtKRGGGYb82ueraFZJUSPc3sZ/CftZh34
 s1cs/SCq5mV13eDXQolQ5vTG7OQzfMzhwkSs0XTSx1m968DGRqZM9/nyZvIYhX2D82FiFn2s8eh
 pqTEs40HzMSkmz5FK4hQR5YN11wrZqPqqT3We7imeyDLgq2etwDobaK1rIJGZjvp/CSA0appX7j
 RCR3b3a7fDKultqPpveYtzD2ha5yOuTa0PRVk4DihpxkjAbyWFNlH+iot+/pHoqN29yuG2RExAd
 U95Tc2S2OcL22zWY5ETkJD4ZJGXT4JRYZQee/8/sj9lP0cuViQX8ZxUtVwkSDL5MyrOvop8BhYC
 MvMvv+F8xZw7i6CtzAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_000102_589185_6C8B57A8 
X-CRM114-Status: GOOD (  14.82  )
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

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/perf/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index ab90932fc2d0..245e7bb763b9 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -188,7 +188,7 @@ config FUJITSU_UNCORE_PMU
 	 monitoring Uncore events.
 
 config QCOM_L2_PMU
-	bool "Qualcomm Technologies L2-cache PMU"
+	bool "Qualcomm L2-cache PMU"
 	depends on ARCH_QCOM && ARM64 && ACPI
 	select QCOM_KRYO_L2_ACCESSORS
 	  help
@@ -198,7 +198,7 @@ config QCOM_L2_PMU
 	  monitoring L2 cache events.
 
 config QCOM_L3_PMU
-	bool "Qualcomm Technologies L3-cache PMU"
+	bool "Qualcomm L3-cache PMU"
 	depends on ARCH_QCOM && ARM64 && ACPI
 	select QCOM_IRQ_COMBINER
 	help
-- 
2.51.0


