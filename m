Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446D0C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=; b=E+nh/AJsEEBvElm5EbH+QW52Hg
	rVzuQFJ+Qm/2Iof4IB/lirnNR/1h1XcexfBw4Qsq/q5wRetXscqMnVDBl1J3hBuH5Sc4eH/vKdygD
	5qQobxLLKUdnNhh6LTZ0EfeqS7SzQ6tB9yDQuml02wNIb+CiPI3OI6elX1Hcr2C6EqM1Rhp6bgOMx
	Yhdb+oTV2opaMAO1zUcGwLlYL2airLxKpUC7sAfblMQCCEymuSuOd7cFeJQ7UInVotTns2n5pSaQ7
	BHBhWAZKZF3XnTvhpzW/JUlxGRr2Teu8L6UI6rgD0gXVIzmBE81NbUrsPV1r6AAgB4Mdn99nfvi98
	XDEKDYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oY-0000000EaCx-05Ca;
	Tue, 07 Jul 2026 09:10:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1oU-0000000EaAR-2ZQE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:10:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Drrk3209308
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 09:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=; b=RYN0mCQ3Pb6m5jTw
	XDmivWKvVyy5pgTHzV+Sw5a3chhYQ+3N6g6kniK1U9zHZ7wYKY1PN6IiCU1ZYviS
	caa25KcRKwgjSWDss3cncH+40XvO+zuyxlF4ZLiLnCv0K0VaXbGErQzvx98gaijy
	JEFX8M03+qA2BZoKeCO7eFAEEqhQ1oFDXfk9faZkHR19pXoDJdAE7QFP//BvcTn2
	D0hLoIB+wse2iBywe1ntfOM18K/aV5rpuCv7+LTx6c3BZzU/t6P/g/+x30YJkUTE
	vlu0Kn7AAjJiN7Ypm5+6NK3TPhIHLu8s2a6JUHh2zFSDomB4PAksADqI69+kts3m
	oyIw4Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj8kj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:09:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845317fa7e6so6208503b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415397; x=1784020197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=;
        b=N7ZJPHoead9zRGcCwyMKaF5qpL+h7GTIK/I2JwfzX+99rYwuyzilJ7quQBXGeEz4RP
         ue/d84qnRnj8/rHILsekimFSEkMTCkwr40ODcQOTfe3xub29a8Gdt/aa0rNUQ61yWkPs
         irQraYenl351w8HUnE0m2hLpIt8BnUQox8tM2gbZmiOvOAMDycWobIFXEfTaPH+8be+9
         eBjjQzYz34f19Kq62/dKTJkyI6yxiLhFSJscJCUnaFtuEeOOzhEaC50xFelUzbSIvaBE
         Lf52KUxqWAFLQe3+lersKZqEp6BIyyUDMGC0heQwn637I1EcTawTl+g/syhtdfBDIzsJ
         LL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415397; x=1784020197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XN9EZ8Vs9RFpXQv4qKlvuP40EdHpXbacHIHmoFVSqpk=;
        b=hxvERhcnhgW6y6N2e39oZDCtH0mI8tZKPsxqd8EnqUScBgRuQsyQBxt4pJfl3YMtYl
         yVzyh/s/cgHmHDlJwfWq1AFjMlwk8bpxYLjcp1NBF0cL6COPQc7lxkg49dLtg2iCtM26
         RwT9iU8JAFBf6dTbxza28D17p1E5P/bTp5b1Ufdlr8liz68ruMewRngD6XmkICSdvLJN
         1FXTfi27F0jAd8a4H0PVSEQY7indvJeUcc1XJDKg/1m052KQHirXpXQte8nXlppjzbKX
         9+8SknNI4JkQVWPcLNnBon+F7qrHsSkUu5RNDeZEZw3DNEdo8jDbrrhXLgVI/rMer7LT
         HbEA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2cAw5IULPObupJRW0U/8xN13kuF3qoQzb1uDz3Os8zv756QhdR/NQNuFN181XnOXIZ6EeexwceXZlEfLLF7YC@lists.infradead.org
X-Gm-Message-State: AOJu0YxSk6NDQvuC5129PzSZqbmMmjXZI7Tx34IUoc0o0c3sR0f3oSit
	sXztcT3yojiO5/5GAMkvtFdn3zQ/ihh4S5JiDSBgkZUPDuZDC99zeT4ZXGBuVoY1PxyHqX1xupW
	9awr9Bzz19BkebFp9YDDcJN55QThSxAftDAcYthOXCUEwN+eP5hS2apk5wLlBaMWhcAjo+ektH4
	9yvA==
X-Gm-Gg: AfdE7cnowe8qXYTasGfaKiUXeH7Urr5/MtR7WtPO9Kac0QSrUHso74iNGoZxoDACJ4L
	Rv1e0UxSJH7TXzSTxjTrUiT0+ZYR4La20i+G5cAFRdImZHiTFvRBXUFiKiVYm+Vxk1idneBkdzQ
	MgRjeXm7Ms+CFuZ6hFUgbofNVCCIG/qdlhttB92MhfS0smF8/kccFsKIqiFJ+fhMqojO3yvNQoX
	j6JsXPCsDvAVMghQGLEVuSlSTS1P08OO3F+zqmTAm02kr5ZrzEspBm5RqIWrJrbDlxI8xmRAlXv
	fuiZPn8lTdW47dU1WJr2K03Zh2yutmcu6M8Fkkv36HFOSWFSh+grlivm0kCiJ/Z8t5QahaEpg2I
	zfMJkBhipMIf3tw7w84OtFFEX+1koKnTF96ncdiaajFc2fwSTTLqspP+t6NMtjvoDBl4NJgk03Q
	==
X-Received: by 2002:a05:6a00:1c93:b0:848:2f84:f42a with SMTP id d2e1a72fcca58-8482f85045fmr1704897b3a.67.1783415396625;
        Tue, 07 Jul 2026 02:09:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c93:b0:848:2f84:f42a with SMTP id d2e1a72fcca58-8482f85045fmr1704859b3a.67.1783415395991;
        Tue, 07 Jul 2026 02:09:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:51 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-3-bf733ed9ebd0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415366; l=1610;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/Mt1ZVMxcVAHm03erAsxjaKR2bufRmN8oCEQ0sOATqA=;
 b=w1AYUlv0hOvAn87Dq+iBdIZwsf3tpRAjM3BSzLkQN4a+eqx/waUGj11eHa+2GHAgRA/i0PZO/
 7EhCux2xmOQAaDaiv4aij8yNz+nuBnEQNaKL1fmXJjMgNyBJ0SLR2y7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4cc265 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=06MyHLLTRG02JqLiNUUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: jLISfG6_9OG3VBp8slUR3tILE-94d_qW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXz/+pmGbjeUUA
 qbF/LNcg0K1C4IcG2vLP09mt90q4d32ftgMhv0dM51hLV1gCnnhM8jpD4ctkWGiBG+bPOVGbMBx
 YbXIjdBxrc1kSnIA2Vqioe2HOCyZyXX8Im1YSFfL8ukvnstLV3prA5HA5HVUWe8qyMIJBLlZ9q3
 lxdnmaHuWRMDhtM/0Fi48UXphMaNLfA8Ur43kBIK37RquvMINFo4pq299rkVs5GfUrKQ+kvULXW
 cljRUC/CEAU1wRIBq8OU0sPGf3w7EQeQBPA9+QnKCoshoNkD3JS/dnzqnYSX0m4qOyQ3NzLrMQ8
 aunLGFk+LLooyQjpDxoxSPamOzGGil5jP4hGUYvkOTmLMRvIai4UKklC2YtVPj9lv7k5OR7AMAa
 qrb7w51up0U7pclQiSilgTEEaL5JoHDUFbTjtUdeYXcvEWoUn1dAKEDhFyLdcD8z+TKsvJhO/Sq
 W3JfQb3fV6AEmM0lB9w==
X-Proofpoint-ORIG-GUID: jLISfG6_9OG3VBp8slUR3tILE-94d_qW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX53MVSDzPsndj
 AGvGEDyN33BtkC57zJjAA1P7gwT84xwq3BtpCdmvAFVTc2P1+NQkvRhvFqGNanvL3Qd1eVkYC7T
 NKvs/ltAEJxBONex19/Ai4JnaQ756lM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020959_653608_066D38D8 
X-CRM114-Status: GOOD (  17.75  )
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


