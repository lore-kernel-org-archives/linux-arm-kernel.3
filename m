Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292B2C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=; b=2JfcDDBluPOO/b5DTHOdUIJjFQ
	yRPOXRK4t2eQRi1YPP3wQPAj0PLEiew7q6f/d32OkHwN1Kqn011XgzGuWqLSYNpsd2AmfYnVO+2bl
	2mgtZ4ASDwqISxnmaus68XCf2Hxi8n/OHMuoj8ENYJzUYe5vGxf9SLPfH/nVV3jdIDsJbMcG3pMDo
	V3fZIwShxea+uSfLi25wZadMzFAWTBdtGyUVqaeSkUQBlpGkeD5G0hHO2CdoH9l6yJaAdywFbBQSI
	RmZBrjL0AUTmQl1r0qJ49si2ItAe+nJWImJsWi0iLxPfzzihrckj1EV4ojsJKaw5HNw8PXAbsCUqm
	Y7Pzf0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ote-00000007Fru-2CRO;
	Sat, 29 Aug 2026 19:39:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Otb-00000007Fr6-23zk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:39:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxPUq2792646
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNn
	cb03Lprk=; b=X1C29SI3DG6AfSyUc8eSWJxCrwOq2ijIiIAOi7yP/sIV0wxQRLJ
	Je6fTeLxeCvSjbhHLkNcKsgWh5BIZdhqwP3qU786gzDoJV6JePIXWh9OVoNy4a2/
	ufvxlGxt3rep4+tkpbTbkhmFXSvfcQxSsPzd/GJgclnCFLjV/Za1+9n5MhA6aqFf
	vdimDCUC0rMClMq7T79QAK9K8DYkF0aE2aJGFRY3vy4k5GQv6iG5iH0Jg7KIfrbh
	2nlcxZL7cjQIisnxiBC9OyJyXknJQqy6ZdjdYmBaKrodmSiFs7q0Ex6D4uabd8sL
	uhHtnjHqnJuL7cfjcGFuHih58gKkySiQgqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvhn2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:39:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52faa0dd18bso60302541cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032357; x=1788637157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=;
        b=GRF8XJT6e8QZXbpcZ+rM1P+kCOBEZukC6/eoF2lw3Is0dgWrJ55/xH2uYuefbMQEmC
         WjdPvgd1KSOZYRoFAMMwp4EMZCIM/tXexw/Yw6PMpiy0quGBrXnpdW6+pFMYxmyH8PkP
         O8p3DQqyTKxIB0jg8/LakyWJDL/bzyQV7oo6z9GFvDv2X7baYlEDdnd4tqyMfeGqmVhv
         Ac7nQcivPDmfMBL6+8njDLqb4YMEJ7XSnj9mZfM8LEoxBrvXZIZG1yOKQp4MqNdMlOcH
         IaodwoGGohiJGy0nKXLo2PKEuQISFEcNPZ1cPFVjc6zp5sYFP4baQ1TWassXxEMoTNr9
         nFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032357; x=1788637157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MG4HiwRAfo4nKnx8mRL+C2bMS7+F3i5QnNncb03Lprk=;
        b=OfasvPLkoRxpXK7+NBq6RiRhhvWUe/Ot6b7TioHAtf6W4nTJH3tK37lWWRbqHzxMyl
         gWxZoNa0YzFUR8JnRxJe2kJbIOQSH22T8XhGlphgIJuuCD4qbS5lbWElJQCaKp0+bdV6
         vqgFbAJn6pFS63q/2B+taq6uoZ1lTLMdBE3gJQA4QtVTtwXvsuJIhb96ta9wSG9doChc
         SkC2nNIF4acvEf0sbr9L1+QBbyv/0qr/euBZvtvGO/etIlNGBju5D33gi1f4fur6LXok
         9SFdRoe+UHEvdd3bjbkbBNhjM4iciHu5JbFET2eKmXapK/nwXuSaJ4pgwVIvsnJk3p+S
         aKRw==
X-Forwarded-Encrypted: i=1; AHgh+RpkQsXlSJ27BEe5VTU0P/b1pUrXYlU3oQ7wDKBglA0cBcwdaYRmgDdGFCLqgMFf+cGqTVSQxDQrbo0RL4ZFbtEF@lists.infradead.org
X-Gm-Message-State: AFuF++nRiR96VF8qDusmAs3eebGt+KTq+SHaPyTNA7YS5wYgiEF4lwwK
	+Bp7ftlvSeJByiEI5pyFt/iaXaTf+e91GZ3GxudTUTqNIJD2KTnQJEvqU4FIZL+21llJf4bLI6q
	nXSk3JYFSH1o/eC95lm8af/k1cyowzw02KzRRu/14MeIDGmxYmJT65WE/valwB2KCVmlqwEVAdQ
	f9eQ==
X-Gm-Gg: AR+sD13VAEUg1ahOWjTNfMoMDMFY2VCt562kvoIhorTBN4FwwZOOARKs+paCEGsnL9A
	Xc0oYwJN/AzCqo9z7ukIARWPLSsyBNNzk9RmUmP1CBEMal47riSMg3BW0Pbt/JTsH2SnN9vaeAR
	jwGIzhjN2KM/GZvtjYn5FG25LDqlTBJPiwEQqARrF8u+2/ZXFvorFD0A3Ujf88iZWFj7kZkFWjC
	HdCxYAEq8okaxxGnvIAHnzi4yYhULrTvq7FEDMa0JzfPP645HbnQZNyLccOF7BTWsXUyIIrqQg+
	nEsNYfJLyjvjyynn3IjlgM6aiMeSp3UDEZyyK2j4FCxyRaWvcFI/gvnBw/+EPB7X1EBnx35Heb/
	EmghKFlBwmfiXt8o=
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr111562481cf.23.1788032357474;
        Sat, 29 Aug 2026 12:39:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr111562341cf.23.1788032357099;
        Sat, 29 Aug 2026 12:39:17 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm221100935e9.4.2026.08.29.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:11 +0200
Message-ID: <20260829193910.107418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sTguRb7ZzQpQAAqmHNbVH8fJafv+ZQqtpDncDKi8RyU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzVemZt0DvfAr/vLICEjLQkCnCMztHioVx/9D
 6bi+sDnTy2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1XgAKCRDBN2bmhouD
 14q3D/9+DYXiJdw8FRE5dDuxkc+cX29OgqezepRXiMivbAtVx0PhwCEgsithchxNRzjNurDPlIX
 ZxnP1FbvRxgSicU31k0Dg5+89go3KWez7OSCawgQVGEId+rF8EkaTZbmncUc5IWRjpVfhjNQAuQ
 uduXLoc7n+e/ZxjkafituTQ1ZiGfXGLtWVLJp9WFx47H+Di4WruoJJLpzOS7GQc0H2vwaGm/9BL
 yoa67EC6v5v45Ko09MBS88o2EsnIh96rBNqezvcc9n9Xsy36WdMz2DmJcw3NxvziKvRuzpM9ljb
 l96/m48UzWE5n8wOxCZEbuu9VDdriLXeRNaHVDEbIOzRAwgGl7W0PxGJE3r7JUmj+I76Oqqf/5/
 d0kenyrmvc72sifpwgB+VtDKEWkluiJMyH+zm8U0ubX10u/QlT93uU+FXvSvcGyGxEcwpnBxiAY
 VrgEefSGBnptWz1TX7QzvPBvwTsmd/UoQpu4+9I950ejJzjs4E+lOCu4YlmPqWEGjXmUnMiLCkW
 yQW250nEWL02FWJu8t9fxDpIyxLSERkYopITxl6NJXw2+nGVzBBb99QdSplvjNHShIaVmQ2FdeJ
 IUwqF+Deb32gC8p7P1WCp1wdq2n7AJkSin21gMk46+jLVZH6TO3KxoTkqcInsTrjxJF/5fKWCOK iKJcSuZjOE8v2SA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nvt6NjouHNe2xQmJIpNePkh35Xcq9i4m
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a933566 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXxJwsg2fuB9jv
 Xq/YrFoIc/FIBj2gQf7Twe4YNVNLkf5hJlzqtD+920iJ5WaJ8PYwU5xSA5dAVnav5oU8gQ76Aal
 RfKgadJicX/VdGpMhKCOfxgKtJwMtqvRyf/hpQFl2PeCn1GE/Dnnjqcess2EX7fnQIcoO5CuA7C
 Z35Rb7ioR2wa5I/AnS5CfbFbQFAryAxZ1v7OUH57u7tVZmRep2yb0VL5/OvraWhqsdX/kC51uOm
 9F3VuZa69sbJt7G0qLkWo7qBVu23QQIX+GNJjFX1jI44tQc/s2SFOeDjBESpz7ZHkUUC8oGD9Ig
 bDnSYhrF5LjHh1RK6/z+5Xqtz7e3dg33H2eGmMZ+aU+EuM37Dtbmd1sDSBmtZHqSMUzsLXg252i
 5/CJPGnS1ytnTSninKFhTAMeyWNag65LO6zNwlqexr41nYul2lDKiOIoWuHyjWus3GpkZ53Wgt4
 WxxK3qPKwaO1OvXe5zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXxzNQqat5NgZr
 NodjX4PYulIP1wrSzj3GYmtpyPFMrFVDgqAOjwsiaMftM/oYEKpZu7S1rifQdgyZ+dhD8awOJdN
 sQfTQByCTuCXm/Gxmql/jfSSOcQt5vI=
X-Proofpoint-ORIG-GUID: Nvt6NjouHNe2xQmJIpNePkh35Xcq9i4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_123919_640771_DABDD622 
X-CRM114-Status: GOOD (  13.86  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8346f0207134..d1faf84b431b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1291,7 +1291,7 @@ mutex: mutex@14020000 {
 			clocks = <&mmsys CLK_MM_MUTEX_32K>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
 			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
-                                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 		};
 
 		larb0: larb@14021000 {
-- 
2.53.0


