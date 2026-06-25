Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E59ACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amQLXC3mPMBsoTlzFWETG088elIkyj3mulEteTG2VJY=; b=heEzLCKaFYunKMkwgEh1xmYS+3
	S/WqSEuCGowrJ8zn+3lYR+T8WE9q/kfJapgi7NE7/I4Xy8ywMNDZ3y4rOE0spGMv9oGekVkVIQHC/
	kJ2JIJLOEAnR9bu73egd8U0O/vAtUV1u3iBBKRnDfEfTeZu6QH89PbnMjFhXvGmFMnrw7HxHHs2UX
	Nw3IvTordh6efKWIEWz3UvrqyJHcxyW7wlggmRQ1JaEpJveFF3hA4h2FuZrMu3WDtA4przIH3qK3l
	rdc0ziMLPNGvxr2ZGQhY+7dVXK6OTcIfYC0A7QoH7+2+E2HrnHc1exO/HAuuZWjW+8gL/Epizl+qE
	+H8Fb+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbt-000000091Ps-3cuZ;
	Thu, 25 Jun 2026 10:47:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbr-000000091M6-07AX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:47:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k4gS1755406
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amQLXC3mPMBsoTlzFWETG088elIkyj3mulEteTG2VJY=; b=fk548a1p1uV29Ju7
	HiKgi7JjavYI3l9tEWsM+32xETGNOwmd//wdEPeROdcxi6tpSdOEAv8TP6glRzz+
	xfmZHlrscoW5mL9oxQRYsike4DhOAPMem9lm5w5Eyz+oW1ctlSw16up6NcpaIbCb
	FEvS/jZpXjTcKbtCj+dvb7xJghvocdP4oGIn25Nq4F8rRLx6qGLrOVnGcXGva0nq
	T7cjiaTDvb1En44a5eK4bvu/UowrQFHX548z9h/irPuFBf7WpSoubFOnPa2ZoGon
	ekwc8Mm+PyCOSfysnCrFebyCxchHlGsNecJy0TEwkdZ4ftZXz0RG3a2IkEEqSDht
	fn7ZVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q1dxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:47:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6afd85980so18304195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384421; x=1782989221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amQLXC3mPMBsoTlzFWETG088elIkyj3mulEteTG2VJY=;
        b=aqnrnA0gsGys+5bMYvuMetXRxOzLyHq900awz42RT7UypItFBr8Yb2SAYK9uKSVaMr
         r89l28FSLILdthLyAUSB4jP0X3QPJUT9U0rY/3Fc2i5bDz3dtEC33Ykji28iqLkYRXG+
         Mw5dzr9HDMHdd3VOJRWd7qoRvBwdGiP08EM6lHSC0t1g8XxQAB8Cog4H0YbH7aDyQC9S
         jxu/T/yaZz1CZ2LlncHbVfXA0ca3GvuRwXmWQgRP8wLRlyCs4v9ocElsI98P/NdLWKOx
         Xo7ucGg2jSS0gGn13wPa0BPI00+FjjjGuiJciWXBDVWPJ5rTkCwgTDzKNcJE+PbSwDoe
         dtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384421; x=1782989221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amQLXC3mPMBsoTlzFWETG088elIkyj3mulEteTG2VJY=;
        b=V6FBcQnRQG0azaGNttW0BtuokDCDkrsSW+SOzWJu5xF34qqOz4/pmIOu495VtYnppf
         1GpAk746u7TLFoOROsuc2ZQ64BjgVe9gHOnWKBQm/wEvgOCycgwY2xiwbRHAM9BmQYLH
         zw4RAY0U31cffrDaLdZhepsV3QQ6qTCTPJ+suMsWN24u67ZEDbfeASXoNs/hu3JRQ8j7
         olIMac74UgleWWSWQTZF9WtEs7DlQZ9BE8QmQjDOBgnNdb8YiwNeb5ywicngQo57OIPe
         va10dxedNzi9xVLtA3vPUb//VtDoLIdrRYQD3Q/xevdZQaGa2s2fymI2yxhZGnrrKXyJ
         ETLw==
X-Forwarded-Encrypted: i=1; AHgh+RqRn8HH+5niRne08YgnQvC/O1B9GBBZfBF9XN3U/r4sm5tLYA2SvtpFUP/5sBTRTCDgVg34G2UhvIzmaW4mWdJu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2yHYQUQ/cqyQo0irn5E4OIcKkOEfj2QtL7JvJD+xk949w+x1D
	iIS/a1JZ6Aw+ksR4PVJjCGCsb/0bxhy1Cpt5eFaMFZ7vEQe83SJjRFMIWILU/HCEkqUj/0oRbTH
	fHTTcauM+Y/w6yaf/sHfAS2NzGwVnD40iSpz9f8BHjvDa+fzGIyU4Tw5zIsG6cwmhyFYei+5rEZ
	6zrA==
X-Gm-Gg: AfdE7clqZHt2/hWZ+Ph6Dvhd5gGbHrTCmiy5sJS/qoxa6U5lgXJ0Tml3pY/9P2whGcn
	IaBgm6JB8+RPU47dZUwiX1pSDqTRdJ5hp2Ki/OA5IaIdnjq12HE77w1Z95kv5iROmQUiX6m+SfR
	CXDZ6kHD+WEXAxVxG+W17icEaeTaXeay97Jt0wOGolaXlqpvgG/iFL48ZjueR5BHHd6eHTXYmAK
	r/pcK0yN5ND27VQ9EbkNrU0rv/MFL3R8mclTa9QhyHM3VwN3tAmSEmkcFJawH4kFsQ4RAYRSL07
	+aKje43jC6TjKvT7FZX+AkGntbXmx4kR4fNMOJb60Lc881tHCn9GgwqPXEiKuA17tNqugAGmkD9
	pRaysMXQHOETYNQ2WuCe8QgU8opEjRkW/M4URDdW+JMsoKlnCV5CGmC/xVi1sPDbovvMBvvhv7g
	==
X-Received: by 2002:a17:903:1a08:b0:2c7:f7bc:633e with SMTP id d9443c01a7336-2c7fc743afbmr21143035ad.13.1782384421142;
        Thu, 25 Jun 2026 03:47:01 -0700 (PDT)
X-Received: by 2002:a17:903:1a08:b0:2c7:f7bc:633e with SMTP id d9443c01a7336-2c7fc743afbmr21142825ad.13.1782384420687;
        Thu, 25 Jun 2026 03:47:00 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:47:00 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:57 +0800
Subject: [PATCH v19 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-7-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384373; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CUIELfXlwJTfTZB2/mLXR2/oqYjuzytsMwJ/vjvrA64=;
 b=peF9+aYTtaL21BpUX6WUviTZt97HLGhKOLkRbA+DSbfmcO8COqsEDQ4DiHiwh/Fa3HzjlN0UH
 tXcMvfWfVCTCJC5ldseja94DiRiDIVDztU6S8YZ+EiWMXc1yjECxhxT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: mT7Bhl8HgF7EytzU5sD6EYHYuv0gxWFR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX+dZwUu7KMW4U
 Gl2FYwTBD/v5K6ZCPj5TxoS8l1BkEZTWA2/4P+Uqol9eRIrER6LKrImvOtOdd6MVTctw8Fsymts
 zupu13ReDsN3ATPnfk+KWSf+0IaNJiQ=
X-Proofpoint-GUID: mT7Bhl8HgF7EytzU5sD6EYHYuv0gxWFR
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d0726 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX+o12+xfYRBre
 LOaUp1UsKWdrp4p7113G7itd0JMSvE4K61F52ut7PUj4rjUpJrOh3C/x7sFLWjmDq8JQJMVx4Io
 CkXKG/a0lmq6hx7VC1mds+M3l4YgbhYR1P+nkZ10gUkpF2wpIb4xVRRYtsiNG06E2N5J1wiPMRa
 gmu1ovruKdT+N9zgDvSUpSgZLcD3xq8thJoxN/X9aYHQ0pNVXKi9UM0T6Le49iJNh0HzMxY0dkM
 ctA55NLfcT49Ll4+aW8ge14J4uMfgrm5Nsj7hRs339BhXDuF6GSxmZkrAQ0BP8Rx42riszL2gmj
 xxLmxl46V5SYRi9Mm3SF+FOcn/8N3QXMdGcqGQJuueg6pGNGgqXtsQjOZmd9bSDRtSxy9ZhZ+T1
 GLfPh6srfV10nzGDBvKNdIAJpgwxfHLbY6SQ3Q4dhGFr/gyeczDeOFS+cUBkicauODt1gzuccdf
 lmmQf9LP+kiFQZCVjig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034703_198375_F6278ADB 
X-CRM114-Status: GOOD (  11.82  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..2b4debc39db0 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3150,6 +3150,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


