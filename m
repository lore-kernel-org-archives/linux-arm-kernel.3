Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201F8C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=; b=0dS2AlWT+4p1oGfv0riXM5jL6U
	kgqgi6rGe0ZY03Hk4N4AK3dsaKtErcyz+M1Fr/dmsGRtc2N/fLO/RTOKxSuPBoYGCGQRL8orpqwrZ
	WiZlqJawAA7UDZQBmVsEao9SVQYdJKBsEdpH68sLAOkI9pXQwoH5i8UDH+TAjQqrzXVbbIlmVBNn3
	PdzBpseuxJccXCKrpdqXU1SIwy8JF8zGTFw6ZiY89SjdnJ2BCRuQbpeU2k89CHiQJ32uZRhtY9Dmf
	Iz5/l8bcRanBl7yqFEAYV6Mtt1dbjXI5mjU4zWbktE+bEkqI6niTZ79LJa6o9H7Hx4rCJ53JiFIsX
	eNyoZAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljEh-00000006BAd-2SBU;
	Mon, 20 Jul 2026 08:20:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljEf-00000006B8o-3cax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:20:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K774iK1896276
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AySNhEFQOTN
	/wXML7Im2LDtrkYAXvBDqSS652rSteso=; b=JIKteCJX8orE7wUxGG1lubywkxU
	FALVxjpDSMQVqIVSP9ni+w2B6tHuOHYHc/kCtGMBjdGA8LnIluT8WIZnkVmhSHZq
	pnk/PyPdcAlKRAiqbUUcKYjM8GaNBPnjtCzOCQENpd6FCwapIoy32gDfj9QRPXQO
	l0C51Wsj865NmqRz33R0kts1lPqUaiopCaTyy5zGD1pVBZ/Hc6m0rKSwLwJ9EWov
	oys9OPjkHFUSHVyVDQcKpK4WMBOG0gNeq+8NsJHQbg5RnYQvoPPrCFjwVqfR8dOI
	7H1kynKrkL2kDFV4z25X6KxSNUGgDgpw97n4jCMww3scxLQA16NwUALjwGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kr9b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:20:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso2444537a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535624; x=1785140424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=M73W7o4pKYuaXp54I3tCryRJKTHhzLJTtgJJ1y0SsGg6X3W1b/UpzAm39dUsMuemGY
         dJq3Ga2DJ9hmFkfMVVdxdTd9RzfDXbnfHcsrJ10fSBFE88cLYUVWpqCwrch9Qnu2UATU
         cChqqZo87b9Vt7LBkoxFbqeuiiongBkEk3FwZvanLkfGNQtEHfUvTufmT10m6tl2/MQo
         rWotTeK2WvQMuK3phoYGPgcbbqvGeB1QEbTHuL5bJX0sY5BlCXxEKZ630Ptpu9vluYdL
         6lsRhUK9EHikEX/qYfI27daKt8MlFqTqm2NVfy805H6vuT6+2isED7MPnOFYVlTYaW72
         ebwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535624; x=1785140424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AySNhEFQOTN/wXML7Im2LDtrkYAXvBDqSS652rSteso=;
        b=SDt12gwvM8FSEEKDMkX12sMdoixkLGGtZoKpW4GWgq0jfw/kH0RSw2eIKxDR6KJbiN
         m42Ebmafo6PermZ7fOAU6vEdUZWMzcxyvSTx3Kc4s7XI7fBA4Ud1GgFB+xHXVkhZNrbY
         Y36I2D/8U0YsPs40dmHbbm/CLpWeCuOZ7xMX+PTsBJM468pt9dQjyBVyERG+y0QE5Clu
         T5L0i6TM1Ky+6ms3LvDAVjY2WD0ZwbbQOIR2NeTHdHqsmB0CX4qU8XglxbgBwydL7UAe
         tOxf0uyjGHnVxtKPAPJ0fzHS/M7Uw/jN8ZZRSnWdOKG8W9B1Yl5JTkgw5SOyffxqmHVT
         7V5w==
X-Forwarded-Encrypted: i=1; AHgh+RqLamSAhrHcjzboeaPQfn1xLKvxdVannsGFhRAanWVh8VdsDjfKBZSO+9pSd/qJHiN4ApA89agbv1DYVCl4sYKY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl1vGgKH4yb8DGd2i6PWPnhq3l7aKvr0un+t3Ih9uQkfM3EXWn
	C0sdDQ+SNiRL4q8AWbnFOqt3tqhA0mcgYFeiXmfTECaJ4sWHRW7thGkkw5eWx9iYqPl2A2Yb1yN
	1IIO+cXUGc5P/YO4RdyF+QoboEaJGxF29niT4JvFESPbr0o09FeolQSkEaSym1S9xeg0bo6SNH7
	WKdA==
X-Gm-Gg: AfdE7cm3csr1wUlWitiYW37VY3EolrvWueSfSM8TyxDiQ3d0vq0anv3yZaOuyF9dXUI
	ZWSUplFivyJzU736LS61e5SjaI2tzY9HrEJi+2limbJAtUet77uv/sxnscvqkEQU8UXrU1/CEtS
	o8cH9QLsKlNa0K5yzvSqnJVtj6Uls4ngVWxRt1wgKv+gzPtijs+43eUd5fj8S24BCbpR5+pDDKK
	9f54XNHAglKLoLyOx28P+zlFxo8I7nsBKAdGJeqv1oGPfBCO3zXPNEDRq+71ByfaLO2S77NaVzH
	ZSKiJfGBXpSTyVvMh37cp37zJpuYK9rmSo/5I1Pa33up3GQsg3yHRxuyy8iMhZIPpN+lv/vYU/A
	YKzpy+wx1K6h8aFRcJuTm8HNm8folKHY=
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163022a91.6.1784535623926;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
X-Received: by 2002:a17:90b:264a:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38e4b6044fcmr10163000a91.6.1784535623504;
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:23 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 4/4] arm64: dts: qcom: lemans: add RAS error source nodes
Date: Mon, 20 Jul 2026 13:49:54 +0530
Message-Id: <20260720081954.1858180-5-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L6QPSTfOvHzaGK10R1cp5hYm_gLnYPso
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX9pWUakCANeX4
 BX2+ThfiFQC4amqjrUlvOnHyClPKaw4/EDkSHNFjG8CqQj9RW+tZ1dTgQrqpEU4jmMGPPyNJ+TZ
 3g0gzB1o96T9ZGA8pmAWFb2H27mL+Z0=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5dda48 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=isxhWOj3iQD9eQR5az0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX6wwDVL84YKE7
 7IKELiAJGOTocxKLqc0ZrHcNXoJSDJXPTSTdtIf0jm7DDH8IGDpQqNZ6YOJ//lWQz5dadfh3lSe
 vmVw2KOuQA1YPGIcmXj+c9LcZphz3JSWx2ZsslbKwJ/2hT14PMAigJibc0V/POPHiyRQnpzA+Lo
 IUe8Be4v52cTcJBF8vgrA/sFC83XCKazuBoZAfQkE1N/U/j9MlH6EeN893Pqb+06lgKpIdz0Hzw
 Rm86EX9ctj0o2xsZf90ios6IKWdJsZwydBbVnd6daqP/WaABtijDoRWz4cfVNCGIh2ykY/xOIFJ
 hYCVRDTAROCR8+22hl+7QSJUSmLYsyiNk43lx9VxNgIdXftwuCVY3GZH9zZuKT8zNfahw0khwIw
 L7teEp0c4ZESrZ6ZPDg0CrirSWuXCW8muBMP5XCig2eWuSmuc+Gj6MwK01chXdJwriWdBUXCWSO
 KPDxjHhKaRVo6rgeyqw==
X-Proofpoint-GUID: L6QPSTfOvHzaGK10R1cp5hYm_gLnYPso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_012026_016015_6EB60DD5 
X-CRM114-Status: GOOD (  13.46  )
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

Add RAS error source nodes for the Lemans SoC.

Two processor error sources are described: a per-PE node covering
the L1/L2 cache hierarchy using a PPI, and two shared L3 cache
nodes for the two CPU clusters using SPIs.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 3b0539e27b51..64d3370cba82 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -619,6 +619,36 @@ system_pd: power-domain-system {
 		};
 	};

+	ras-l1l2-0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		cache = <&l2_0>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster0 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	ras-l3-cluster1 {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		cache = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
--
2.34.1


