Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0281FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=; b=oBcscjEbLa5KJ2GhDSHCREsUvE
	PJYtMGjnWmpenguHYSjPGcv6yWOC874aIAYPI++SU2uoOaGpi0IRzAF8jnHc1d5cAlCnVE8NDNyFL
	ObMobVLX3buYtZ3lplC/gDFY8euaVylOvaWBTWLfoaLtgs23FoNj1vpQ/0KMTtN++BmEY+0IPvlx/
	AisJ1o9l1iJqbSBmwEKt1wDJ4chl11LmaJ4HIMqQ8WnBvnLMeb91K8k95XqXvJhPPxO4l1gZHuzaB
	3u8OvZY//TM895N3F4uA7VCQ7Rvau4/rSRy8hOc2WtjsaqnpsdFZOTbxbxPgKQw/092JeuM1Vh8e4
	N3dGsI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1A1-00000003ygN-44U1;
	Fri, 10 Jul 2026 02:40:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19y-00000003yel-46sV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:40:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KZJTY2917921
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=; b=OdkRUdt5AGZY24Ac
	D4wv9Hd+nCoQCg0YwCcAWBYSpCx9Ce3ulqn9brMuqYEE6EUh+CarLNIE73FUEEbb
	/B8U6Zuk5IryQaDigiKSULvrHc63C9oB6RSAevvp8RySHR/IIEgCyT9WVbTZqqu8
	LMEOGoCeYQwi/g//w8LwhdKYt2g1AVvdVy8TJ84sMS7r1/nv0+t2GEmMIrQlXLss
	bIeVw4FIUvFpHB2FY65TX81Hs6AI0dfUjC2LsbltpQDSmI24LSAJmd92/xLyXGpa
	wFqppkAgqcSMGCTksXm+CUhfSIqnUVz0+CuYwerHVlJGoD2jp805i39/8KJxtMWV
	5Mfg/Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte0ysb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847ac21582cso501389b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651214; x=1784256014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=;
        b=BHvXD3JB4p56yFosMZNwrpMM2F8RcC22OmzJj14TfgUqabe7ctjDDmGl+bkJLlJ5Rw
         X6xK+wUgjciuP+g8kLixEoRvxMZ6rR0dbn7IVbOy+BjI2lFC4rZ3eV6U3RuWuwjcLvSU
         6u4yH3gIOg1JN9xuUBDO3CWpHfKbl8jhpLxMBkf+REaZDsWRynzbx9ULqRjIF/m66i+a
         IjVwxApDGGEsBxEfeQljTkxaqDW7q2AtqTdbcKyWOa6uC+viBFU8Rut3zsVTQCkBfGQA
         fnBfcvK8Co4IuKb7wcRibPrqgocOVvFIbc4OHCwDgok9SbrneYLfZ8eBmmc3g5wNZRbg
         wdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651214; x=1784256014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=;
        b=SuxebVVl4rQtBhC5j37/QITZcimo61zFDEdR2ChdGJdljhPqGzUr0p9VewuzBkcZI3
         LSn50DYgdty1w3rFwKv/YdTCQ8CT4fSiheJQx7geRPCgdkdI22JioA+ZO3wq9jnNZ5Il
         imy1af2yegWyzDlVU/t7KgQB/ZB3a+ffjIs8Et6D7TjAokDqF02oRApDrrKCIPi9hZRL
         LbAA46e4fNGfDZbl2qyz0f9qVmuOvs+5xuiW4uXq077NwOuB5lpC9ZaLqSaJJHqq3DvW
         551b/ogQsjZUsZswfFr0b07zaGY5nMpl4LsKg0aOST8ivP3cwry7edumQVtk2QOWuFND
         IcYw==
X-Forwarded-Encrypted: i=1; AHgh+RqX8vxZN09ErYI0Tn/z84n4js0qzTa46PLB0LmCFr5wFIykqLw22s6d9q3DlCJ6OeXUw0eyZNDkRsPVp7HgSWVv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsf2FjpU2RhUTGBOvN09GTFn3FitTaSx16PXLvLhAQGIXHr8DV
	0g/2/x+X6JCJKfrZNPb5Hdq5suvMFjqQTanORdXPmKP7z5FF+gaFT5jZvuTqZAdQQf7/7+gACxm
	lXSgxSi0txaohpfxcaxg79+CrIRgrF0eYTBkubJXsJ1b1cIbPzVXSbRJ7njWaATrPMtn+Ld/fIJ
	fImA==
X-Gm-Gg: AfdE7cmRHG/JwUemY+k6jBqYQgfxfKTLay9mfYZXSMq6KFWRWggU/JcheuYkx/nAHDY
	BsI32MMnC4L7GRKladpVQDoelUIUOre3rD4hXb+S/I5NwZSi1tpQlEdfU2GFaBYvzUR9n8P7udB
	Ei6EIo8YMR/3uXFTiUOl7wqNj0k/Ma0Bq3TRmV+yAfY7hynqrKk1SRdAX3RBTRkf9GKPbdEiLRA
	U3I6as/AOGOu0OIRbZyoyBfNiv48mf8B5k+2yHIn61yXSATau/0RrCspPSM3oFzlRgIw7zkRaD+
	+9d10WL2etyde9R9jQZa9MJrYOCwBBgx9ThMJqFUi093Muq314gTlnSble70HMqe4TsYvagft/p
	vAlspwhOk9DJ3PYaOa4/joPoJKHAcK6qlwJ+5LFHpO1w8JuiY0Y55uDCyxGI4udcxfO7M4NTCYA
	==
X-Received: by 2002:a05:6a00:b90:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84842edd72amr9032061b3a.20.1783651213894;
        Thu, 09 Jul 2026 19:40:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:b90:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84842edd72amr9032022b3a.20.1783651213435;
        Thu, 09 Jul 2026 19:40:13 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:02 +0800
Subject: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1634;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4MVQmgwxUQUw39D/a4v3zOkEzV18aEDsQ8FTgHlTgXk=;
 b=9id1mYjoy80wRtGxcFyPA7kI5SvnAWvY6ixcWCAoVlNUvjuYNtKp78orzdxBYjBm3CXiuwuyC
 YYkFpe+JU/eBbIMC4Qiu2TzEhjOIALL95aS8NE6B/Vnki47ITGNGYJF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: RIguXYVzgVuu2818D8eeMLcydYbBeIEb
X-Proofpoint-ORIG-GUID: RIguXYVzgVuu2818D8eeMLcydYbBeIEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX88AkCHVG04OY
 2I6L0Aox9fdJpAiHjbs6LZZMXrbTLl+R97Nn6sZxfr3Z/FHKI5K4ZtdUl2CivaMh3fU4XqwEg6y
 NDuxPrn9BFPlH5ULT584gyzt6f6Jl8yVG4mooYxeC5f9QrDdaDDP2Hi31eLH6uPOfqV971XJLsu
 NbfeBVwmH6p2/xTYxesE5xLEBcG/L+l83Gj+YpNEnJ7ZyyDt+fWwhlP+q1f/xeOoqezTnRu/dc+
 jgn6vRm7tzh/TCkwBNmcs6V6bHOXc0Uo4ToBVzVHkKgsNn56WPpm16UspwIfDv1lGtJpTV/udPx
 5MOoWpzuQQLStx7LLLNlZ7YwNnmSy+mZtcSMxXG37y5Z6P3ekS+PgrwOLZCdqvgbkpbpd04J4/7
 d8NPCGMsW/nCY3rS58LzcBMmsNZQMjVFwHoLXWpq0uCkjt9Sm/eezak6Y6QnYjWAaFO7+sl+nIX
 cP/qts+c6gsOVjv6+cA==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a505b8e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX/pAyFErDzQsw
 7uPENgHfIoLQZVFO2RoCxcFQEVNOsvs2vj4LQm049RvWManARkQl+ElzVRMNBXZPfofrQo4Zz3E
 ncfuQhzGqjsn6+UK/tbTYjJj4mVt2Gs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_194015_029200_309AB502 
X-CRM114-Status: GOOD (  18.01  )
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
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..5d0e7e8c2e58 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


