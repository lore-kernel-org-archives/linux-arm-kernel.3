Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4998C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=; b=B58j3P5YV8Yaxq6yH7m1k3kwCH
	TvHR9yKkikHhbek5EWvNG40ZKWziE8gsWKfrCQ2X2svS3HCsGdLffM+tGQpRSiBeM9q2M3vvHtQxB
	2Nm2Ox7l+yLTqcE57765Xv0y3g7E5od+ERB05liSlqZH1hvOZ2CSV38PqqQQf3+vXNiwwd4MMOH1L
	52S5b0LUrnd/PtNg0x+7/dQdxcjPZE3i0GNbTV2Cy5BX4l/hAJ8jIqxB95lamDz6EagPiaJpyJ+am
	vnLIWnFBmpw8l+ygtINV04KK13Ck4f7FRWrBBawROlXdSVJRVqOGQ39vR4KrgLNyXtcQSYU/4bmRU
	Ookg+DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oe-0000000EaGe-0kxH;
	Tue, 07 Jul 2026 09:10:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1ob-0000000EaEx-2HwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:10:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EE1J3203466
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=; b=ESmUJMH3xIUW8a7E
	KhEtY0ZN08EolSjtQF/pvNXCxuQd+psQ+OUmkYfpN3sR1JlhXSZjAiE9c5NmYeI2
	UerlU7x4eHVzgzRgI9jHJaqkbuy0VI6SVe0VB91bI7Pclj7sz8AD1GiiSrgrwllO
	Y00ZgygRuSrb782sBeuElMEPKyixyVeFZ7yj/AM83i7FcFoW1GgOHC6q311I1blO
	E6fWZLjb9wJo1bB4QBYK/hF2wlnIxfUZuoK1pAOTHtNcHRN716dUMxA8Sro2Q2Gs
	VfdThWvGF7pZCDB1zc+fIbnmd1htED9hTOvWowV9eZnk4gtuwYNxubQg7vRh8uu3
	44kE9A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8n9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:10:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8479b45ad08so6708473b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415403; x=1784020203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=;
        b=CphGP440sczG8hCBRV9UpENbgQMk2bEe2Vs00VCWTZn57qZHcFIn45V37s+b09xxiN
         +N/rHSjtRiqA2aWd8wDmAVSVRP0ZGoFYhzQ67cBhLPadJPqUO+rn9V4zxRjxhmAavPr/
         Rasd/E3oQ+O2RZrvA7efpuSxwYXmhDZL7NSXajAyo4pwuJZoTJ0ecQMR1JCvzzxExQVc
         7QL+s5mNbDWmQT+7qNqc5svjbufzuEklqnzAeMfAdNyswLgLQp/ZKAX8FxBm+nqCVm3c
         /gWYGaN6ipqny75V32SGHpnVQNjtveajkRsBFX6uClEoQXmX1EGN0qNP7YiDy9pqZLEJ
         L1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415403; x=1784020203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ma8Qglin4wLiiN/jJxaHvIWGG+yKZ6gNvSxOg9CBQqM=;
        b=Z+qB43rWgREuxKIKSZ9yyMfZdLsFcbW/wUom3TrKcPJnqhs/VnGcrD4xZqUsO/JQxR
         iRLb5pJIDhYNIx1orsbvIkMmJdJMtAs0IfUakFpSfKYffO0wtZcNOsTZ/mhzFLKJLydi
         X6Z6eCbpKrFCWcFn/rwcHAlIiIZWTWRFOV/xbaahwJckyGYWYSyQpagiYrowPBsqAb2R
         Ou37as+sxHNnwEpt4UpgWotxBX3wGycW/UM6widJqo1LHJ267tAEH51o1EHj7FS+OJxz
         xqcUrN3O+MTqTp8iL/eaKW1+iNLCywhXwLlUMvg1SGKNpAQzWRKI5lgdZ+aoNc6olJ4Y
         kahg==
X-Forwarded-Encrypted: i=1; AHgh+RqTSds5U4IUxtUVm0WIrpkjMH5/jIcUUIPPBYaUKuXyP0Igco9aNHAFjJ4aJefO8I6GtZzPesGFSAOVBNHo//+j@lists.infradead.org
X-Gm-Message-State: AOJu0YyMH+LqUKCXZvMhVtUvBS51oe3cNDqedYAMAGVncfJNgQss+86W
	nSL0LQxCFQemtIdZ5EB4JksaVXQv5Gyek2DwaB74M2FdF3xGnspSS5sb6EL/Fjnno1zCo2umPKI
	5pWVonYxFGReRJRK0N9n72/T8Hnh9xxobJ1iipoGmCH5nBixTtAUdsemMRnCAQ1BKA/6JU0eAzr
	aEaA==
X-Gm-Gg: AfdE7cnJAOdwsKBWayfujNT7c+Vc5651dNljDMBo6PvmiMhOsuaId+MCR50HWYitcXr
	SKr3bI2Z5dhmDkcGvq3HPqF1uXtuP5Va6SZqSaYoNMyOoU0XuhmdoOe/+Q96DXeHiaCotMX9EL9
	GgrOGux0FAql7CkwOT9MmgzvxCXwt8rIBd+l++uUWMJLWrN+jY4xnv+dl+gYEKjAuv8r3wwWG1e
	pCrbCJo/fMJNDxMO7XTJa1UhKSKUVdPpUVS+P1HrhlXlxG+dNeBlyINO5XysEuRV96n1MwKYT2+
	Mi4mHdAWHo/08LwrXM8c+s52jJvEmqY29IDGvIuF8ntNCVPtOc7QfD9s3QG+HHF0mK4LOqA3aOL
	OUEyxGBCwrNA4StUoTSPSypnbMu/8nW6WnpfNSvw4+h+PhSwY0C0Jyauf4GVtjbViVNyUXD/OzA
	==
X-Received: by 2002:a05:6a00:b84:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84826e24587mr4002427b3a.59.1783415403514;
        Tue, 07 Jul 2026 02:10:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:b84:b0:845:e8cf:139e with SMTP id d2e1a72fcca58-84826e24587mr4002383b3a.59.1783415402910;
        Tue, 07 Jul 2026 02:10:02 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:10:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:52 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-4-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1592;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=AX4e7umZ/nF8QTH3oEcp3uEN2fG0HNKco3Yl3M2KAQc=;
 b=y9rBBL4cpbeysm0K+/fMtdsyTi6NsNikvfJPx69rjKtnxuyTBK26xKkDxeNOftMHiiQk3lssH
 QqjEHt3ckVxCtdy2auPmbWzYSbbxYPbL/XLAu+patCqwFX1elXxeHbe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 03IAjXj2hZ6GGMeiBBKxKVu32-PsZTaf
X-Proofpoint-ORIG-GUID: 03IAjXj2hZ6GGMeiBBKxKVu32-PsZTaf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX6VSRnNW9Tuls
 dIaKpTAXoPqKZoNkzTSoBudctx70BeHnUUrFXkj0LyC8qj03aFyx1sr0egav5NqG3pxMBIXM9t1
 4yG5ogZIjE+rGgYkZtC8Gfv52NONDeE=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cc26c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=i4VRK_AS-aeX222KLmsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX5XEa3okhK0Eh
 FkaRBC2cumaIicNZuWtzgNdtgDfuy7RevG77cfO92g+Eg9uoEzkFWZki/UjzFDb/mXePciXN2xJ
 qlSaK89SAyzGsWjQlGOBm4gMhyIP56ja8zw8Bd7z0Vc7p8LO6+yXJVPabYEJr309rwDI2PT+yL6
 DbWsfv+XdHn1fmIL6w2oGqjwfFFZT2DOTArhhFcHVQdtVsIYPzaV2bIitkaK9UGz/k7OspSViO8
 clEM0sW5MSCj0ccjM68aAgfuQWyPJfmNAWTaesMN5h++8Yv5vTS4hwt3GWyCDaWybKfNbISuH+X
 e+eXWLE6r7npFwmsRlArZzDqfC5StcONm7f/+52Ja+qCDB9rTeEe+zbPPvT9Q8tElbH6rUaWa8n
 /u2pYfQBp+Yu+dp1UGkOk4qFQrYbXQqh1PqvMob2k9go+6MC/XA5krxsNOAT8dI/ZAi7GEyC6XM
 2eYs/BIp2FvF9gSmsOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_021005_730708_0B2F23AA 
X-CRM114-Status: GOOD (  17.72  )
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

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone
"qcom,coresight-tnoc" compatible, which binds via the platform driver by
compatible string and does not rely on reading the primecell ID register
at all. This lets the device probe on hardware that does not expose a
readable CID, while remaining an Aggregator TNOC that retains ATID
functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..1e25be41aef5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


