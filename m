Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FEEC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=; b=bVB0703/w1khgbXX3m+u6Kx/FR
	Gwitlfs6hLbeb1jhRUm3GkmNmZ8y4cfoNH/UOHyeR81MUeoTpQ/NqBqNdM6NlKfVmQQEzjKFNHObk
	X+vOXZn1OiSdHv7LqZPYKC1QFhpLlqIhFHs4j/Wz7IF8nxRa6Nc1cvP8H70keH1oNCuuk1xLe2Ka2
	mK1sZZQ4wCw/LKPYbx1UwY/nHoHTXlEt29OZ2CXFeEz4By5hll3ocdaJsbrTIOJ6GF07jNoB7v7w9
	hZFCIMpNqaoluJExKwMNgGm36zuk18sY66W3tGpRiIGjBPaT8sPmTzk2jjRNL0Z3IBejiwu8HZWOi
	FBy2kBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7v-0000000BwNQ-3fm1;
	Wed, 09 Sep 2026 14:18:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J7s-0000000BwLE-0QQm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:18:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7O0599841
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 14:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=; b=HTMUhvzMXZ0j3YmC
	bPGSLVP1p1nVZ3cvPkaQVDLucKy/thmkXWUbQ9WpbWzEu/AtPObtC4GPsJccaqDq
	3zscu4A1wHPvPD4dyVzU5qcWEnzvH6+zbHc8lTg7+nI06RehQAR2XRSZVYc1yag3
	kKdyrPSVHGi7xfYowG5hq4wtx4j3nXEKFWZlJpv8EHw36eae/CQ8Y3HuwJzFRalx
	NQFc2aYw0OOz+RXfgMDhnNUWV3Mz5k9PdtKdv+5NLy/VyGlRtFxNZqivCJcaP7QN
	ODIbjKQN+ZJS6QkcYPdBpf28yAXshq0R8yWJ5uhB6ZOwq3SXJ8n785VkXdj19SvG
	dJAl4Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2g6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 14:18:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so3932077241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963490; x=1789568290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=;
        b=OtUS4MJsDz1Ej5u5ATVJUk5Ieb7G6oRs0o0ap62Adf5H7HfOFYpVBJ0pzdbgONVJMi
         xYxqqPK1vcEATO+sN8ihKDG3qAwr4NzTV+Ps9o4drs+OdqCZDQC1310IaX+8Zth63jKQ
         1CgEPyyWLf2Y6fNWq83AcLKTMAvnxwJfp2US0oEUBlRQbx5V4hdWZ5pIkDVxF8rKRZUD
         5nXSdQcqLlUFeHnUWCP+6kapDUTvpSULapG56Kn7JaR0/y8lEsSki/8VRtPCdBfmLmnW
         bJuIdP9kAyHRJuR1OTahZAyacN3H6yx8Zh04sYvxhYKFSE0BXohwbkGqUTVKnO1WuW4p
         PgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963490; x=1789568290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=;
        b=T307SloOhJtFAxdLn+OxdowcBVD/TJlI3JMV1DUfbVZudE8yDTURnEHinMEv/DJWw0
         XUAuzCpvoDzQcHbWRCmqfYxBtB25saz3MDOelHrdTTT6bRX3GV7lNqoRM/rlKl8iBXsX
         oKi1NM3AY0c2xNJ7XfVOBYxw5IkN7MC0yU9EMB5BqQymqSqw58Drl5KIj3mMfoo5/iEE
         uBTAY0vbNq7K69fO319OHMlzDcHcdUSLRJKrWBtpeoEzyi3ZCUf8BH0S3UrQ3/oaejQt
         W4wnqF2NmYXbxCUua2JCd2IsgTUhoy3siIv9ERPtyMfB78smgx/dzCAuVdqvNDCus32A
         FmjA==
X-Gm-Message-State: AFuF++m8p/hvDbVkx/AkDAUO39Du7sI16LuIkURQTXS16bNKmQodCX7Q
	obbj/wttU+HxYMcAVRepVINVESA/PfD8lixVY7mf0beLH+KK0I40FOM3pinnVcetkf/Oe66NQMm
	htTMsgLJXa1BcwTseot2oj18o0CI7xNrqU/rMmcyollLMcbrl4WXrQcwvU9ddNZeXbB5yBgsL7t
	ykxQ==
X-Gm-Gg: AYBFou0DMhm/BewZdQNxdPD9adQL5B5K0CAkTu3v4z+HpBn1u6IglaRvTHf3A2+2acd
	3T1/o/O38/3WtPG4xfEYtxASUhqaua6tHsa3Mj1BgJBhYugi1tihBbeMjE5/RJ5SiaXbfTdtrur
	+GSs73SeBwWVLysmhKzgMwDx7bAHsB7bqZi96DdBQHdQ/6fOJwfhPl1z7ef3iQqnTkErbb4Wbab
	3JF0k+047Pw/csvKRgnfYw6pu7eyPdfzee/S7VxmnUS+BSHkNKgUUCQ+cG1lqtsU+OPl4dy2TkD
	gxRIamT9ojs4A9Qq0isxJu0ATcyTVk58J4TYgeXv4d1WUxW6DlyfOuasOozgCpznCC6qu02LI+H
	g95h5cCVzq9igyrKL59wxyMw=
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr18051694137.8.1788963490359;
        Wed, 09 Sep 2026 07:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr18051663137.8.1788963489968;
        Wed, 09 Sep 2026 07:18:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:54 +0200
Subject: [PATCH 3/5] arm64: dts: fsd: Move idle states out of CPUs node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-3-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=krmELxqcbgXM6Rh62+xctNQkB1QdY6zAahtn4he4JiE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqUyWqqT/d0ZxoDFOe4+dUmzZ6rWpAp8gavL
 ig+4Z626SyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqlAAKCRDBN2bmhouD
 17vTD/9vzZ1YWIkoCQp5SpnMM8IKibI/4N8y5ntA1s60zoALRjMppWICygInruoxeK23W9U4tWr
 uUbfPlgNDMLv2ahrHP6kmX9pm5cht4G7OnApSWJ1YbkaqA9/1OKV40mgFWivUPrmXr3I7z2iBHN
 7nj3oUyVloTfIS7//gUGPZjqoqWeP5G/uKEFDX8uPdwQ5+6e5RFh7GOSX4WX2KR9uc9yUtlikRz
 fP0Zo+GSRCuj7aHVGa37OmInjclbURiS8E/04KHdqOQnhJwl7/y0EJRRVSApgVCSHL6yDiIMIhN
 w02i4M2z1Rga7tj0DkBMOFZ8o8i8kj9k0kfhg4PPznZRPZFOMwLTNgE3q588QsAK325b/JiI05Q
 ABa9qWnV8QEgbOX0IqbrntNkdEqs7p9UZ2o6SIxVM6Uo2wPdVlEffyfrIl7VI1+v1UV7c9E2K++
 mkhN+euGsEp+7EbRwu5orNASuxLdcAnNCyvvaB6V5KaK6K4BilistdRxoD1TIm5peWYv0EQHYv/
 xgfEu7QkJ4UUemeUmTtD3JpE/Wn/NIi1B9rutra8JlAkPypt8ZSFmgvWgC1FBrfGj9q5sXcKwZP
 r9MpSVJD8p+/qx+cZ/uj5HTT+J+KoGx5eAQLS9tXtFw8kELmipHthKAvJXcVyul/Hq04KaOMLvx
 29JewS4yEWH6jMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa16aa3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VnK6_ChGKNcZOvS6CbIA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX8UjxnDLXeHRk
 7mzfJEdLimoOKBTzdYELxgckMX8bA3XAG7a5ZPKO/HneFPkUm57q66yr5Ea8/w0Dhp5VXLdTyBU
 VqW8EOGlBroQW/8ckyd/WL+ymD6PVskPNypG2Sva9W/7nAbkGpi8mm9QiecCpxkMIJ7L1gP6Fj+
 5rBzAheLNZTlYSn598+efRotCWgVtmU2Kw61r++Uo/4jcKZkmRJURXdwx3lFfmzrJr4xC+h8df/
 Uiyke+5KcDHEvO2m9Wt1x049RlK3wwYawS/accSnEJTJPGdyuGSPMnz400bqj0uEg2c9/TgWLNA
 Mbpf4FdexbPXF2Ewxcu3KwiCbN96vEOC+jFU8eODkFotqFMhEbp8QjqXEwnXOW1y01n/94D12hQ
 PSWQCc15BgkTU6NrzjoxpWRp2ilqEIa+67wM6cA1H7GchOguijNujV8ABkeD6rTQ2dOi/qk39c9
 QAD9PPrebRK4a1egMZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX/fBQyD561OSS
 ryQfA+AJ2cYCsh+UJj4X9Gz/IiM21APniAFk5reugJx44l+E4xn5dQpDDZ/HIR7AYggCTIsSiNn
 1AQxu2JNOm3qmcsLqQv80a/zYqZJIg8=
X-Proofpoint-ORIG-GUID: anyB_ILccDUiA-sBo2SoT0EPmX62VwHG
X-Proofpoint-GUID: anyB_ILccDUiA-sBo2SoT0EPmX62VwHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_071812_194356_73BBA963 
X-CRM114-Status: GOOD (  16.41  )
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

Idle states are not really part of CPUs, as often they have domain idle
states, so move them level up to fix to fix dt-check-style warning:

  fsd.dtsi:300: [child-name-order] child node 'idle-states' out of name order

Also, re-order properties to silence:

  fsd.dtsi:305: [property-order] property 'compatible' out of canonical order (should sort before 'idle-state-name')
  fsd.dtsi:308: [property-order] property 'entry-latency-us' out of canonical order (should sort before 'arm,psci-suspend-param')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index d076ea634f4e..acbe93756a76 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -296,19 +296,19 @@ cpucl_l2: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <4096>;
 		};
+	};
 
-		idle-states {
-			entry-method = "psci";
+	idle-states {
+		entry-method = "psci";
 
-			cpu_sleep: cpu-sleep {
-				idle-state-name = "c2";
-				compatible = "arm,idle-state";
-				local-timer-stop;
-				arm,psci-suspend-param = <0x0010000>;
-				entry-latency-us = <30>;
-				exit-latency-us = <75>;
-				min-residency-us = <300>;
-			};
+		cpu_sleep: cpu-sleep {
+			compatible = "arm,idle-state";
+			idle-state-name = "c2";
+			local-timer-stop;
+			entry-latency-us = <30>;
+			exit-latency-us = <75>;
+			min-residency-us = <300>;
+			arm,psci-suspend-param = <0x0010000>;
 		};
 	};
 

-- 
2.53.0


