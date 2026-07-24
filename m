Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E5C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=; b=PduNlEMvIwp3E/GhEvcUcq6lXE
	ATQOug3biULvERjWwlwSFDn7z74k13PcU8nFbqGVaNF5bU9ERRgIhJfJAGxdqaANwqPubwveHHEt6
	eoJVZrl2V7IEShd7/TdAgqLn/0j8emAUScj1MuqfFFTDFK2QZPDUvj1GDrQnyPcoLfvpTMOyXVPzN
	Ra6X1yobiYvVL/I0TXsW4XhtQGIGAcQ02H7B/a11EueTAzhCjWJi2ASOR7G4A8exuFBo458aROstN
	GjL7ZOi4G2HLG4jGQMztr3o3duzHvXtpvV/ADB+wEmRhr7wrMCYVNo7KxkKy856OERJGidHMWZlND
	mjIz1M8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnACH-0000000Fgh5-1DNG;
	Fri, 24 Jul 2026 07:19:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnACC-0000000Fgdb-23Rc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:19:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lCuh2275931
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=; b=SRfReoF3mUtI5cLQ
	iPa1Rfmx16lH4+oLCZeIV0lGWOxyE6tIQVHkKpCPQXUCzkD/zdTgTqbfSTlHOkXc
	Ss4E3udo89bT2J1Yn4NNVJs72qofDVhIpC5xoDYT3GonXUzZelCynprqMEg414tk
	HbsrwjIZFhBLJaFUgee9nc/uwLm+hngYoczJDGbQzTYvTEUepKY0fXLCKv4pWEzF
	8kuQoXKADivj9b2CSh6704160BqH6mdmUwZzk1poOWGybNxGb0nFZrlE6i6NEsQN
	WFoy9QEBwJpDxEjKw+F43/jjw0v6Ypzx6t3L+g0E2SbGU+YHfbPPYRrNvdBDOBOf
	1NPkKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0ak89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so3265655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877587; x=1785482387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=BP5w2beP5f0lgwWK+TPBPoj6UZeoTeoB/FGuHiIv2kx7WdaQS2LD8s3piYUYUposYv
         J29fMFOv2p9wZ9vuqqR+y0kdafdenpWCb9yXNE9mhFrlucKkicBYgVWowfx8lcVe2gr4
         Z0xwuJAflXe+xzUJ3uiQbfTL1HOEQRBLaM7hme3as8x/dAcSE7nGOPAwg2WI4ksX3hBg
         cIytyhZFXyoWsAsKu/BXGNLFZ2fGLvRVPNZD8mCxhVsNK31rbaDKBDX/9rklBVxMSnu/
         6Eecv4XUYuBhClAWzBFYgYPjUuXkMusFbuFrZVG1o8Eq7uudJc+tf2r8ALKlqUFzK1L2
         cL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877587; x=1785482387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85c6fMwpf5j2iCdGRa9j4fuKaRpGB/lUr0+dZdRrE2s=;
        b=nEz6qcknG/4Oq9i46RVLlD+Mvp5DNyOUOG3HChIccifTeJwiznKnvIfx3KqlWKqJsx
         RIQwbNtT8KHgFGeQMHp+jdoLuUdKa+W3h2NI8f571AQQ99iM+TfwcmbuL1fFb4NAUSiM
         hZB/JzI8hc6+++u+l4Rwt6vLwX2JXCutDv5N1GAtYACuDDAvfSvjV9qv2bzVtxWnCiYD
         bsbvnj9wKupC+8PDziNA/4vlOPOjteBBDCO2T2I6R3HfjPlLBveDoogGzMO4xKmZQ3di
         k6ho/qjg0DX0tM6DDaUlEr8VMrehlX2ULrAAKdrO9gNEfbhPKBr1EL7TRJaAAlBl3dmm
         CcZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Nny4zl7ofcd7i8SmIqDYxXxZC7Do11cs3HpSEvtPBNMBIVt9fqErVsJRoSeJyDwtk/9MUx6vcKpijTXAc+Ky@lists.infradead.org
X-Gm-Message-State: AOJu0YywqQyqSCRsateAy5iMNrY5ChaVQaj5l7ZLLOipy8SXeO3jfwk/
	6fZmfGqQSD8ToSxoed5djxzxYwaqwQRk6x1ytjWM+z1yOLVuDd9muNIFKFdu9RroMhqafhYGv8q
	15lF9D+hriV6QlQV/sWiOyjnPvrUBCisuJAUJ9qJ/kTE23f/ojG2LtFIHinL4dgjJ9eLwbCdGa0
	2ouIEDtjSNdg==
X-Gm-Gg: AR+sD12JBHlgYctqyU7iI3yZFxuTa6x9S53j/rScpqV40r0p5llSzyLkw/3aUPFlxhL
	zN+9s5jC4Z2Uiys105A+zwur/JKOq63rjvFpr5n8THYrtMhGQU9XrtM+m+YdV9jCPSFRQkiI6wY
	h46UejILkM2bB+gHWyzslyFopD/Xrp1bJ4xpqpY/BhFLdFfFktrk22qLxSLSTGPEa25JTTtVd1L
	70Mcuy08xrle2SD3r7c1akelggPs8SC8DtQ0NGkwBTwih2SwhRsktbdhB9mglXSca8hmSok1a7L
	7zNFC/W1RjesDp60aqryJ23kKZjRYYUy2quJ6S3FGqifpHaah5pyLhlw5kjeQnztOxwXVVTos9e
	rxu5Lw6gxhFBldkPLrKBwqMlO++OjJ/AWgNinpBhFXDMnVVudUVXOqisoT/RgNA/4Q/kf5kw5nt
	a1Qm2oAPiAFA2PexKAUtDcpbQYgS4=
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555375ad.34.1784877587408;
        Fri, 24 Jul 2026 00:19:47 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr74555095ad.34.1784877586957;
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:46 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:14 +0530
Subject: [PATCH RFC 09/10] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS
 DVFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=1007;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=8tKdt4fKJhT/tYsqDka1HLDRza+yiVyfZcS7BTSC5l0=;
 b=ElL7bMtCXym3FQCEHsNOAZ7OqHreyEim7+hA/4Ik410F2ff4uLS6Ygqlqda19xM3CYybnTvEV
 WCJ5kWpaYhwCMF/CKunvlKt6HUtpNwDIoAQtQGMSPWQdpDEw01Z8B8w
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-ORIG-GUID: RdfSgvyrEOfrcRRI4RfQ0s65aT0JQZdo
X-Proofpoint-GUID: RdfSgvyrEOfrcRRI4RfQ0s65aT0JQZdo
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a631214 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX8hXykRApPr1H
 1UR0u+1+gad3C5bvJPJCJUvUYlea/ytYWOX3QchQeae1DYmq0ND6ID0mvK7pEcPds3cNJw/oAMD
 P9kH/tdjaMeKONToOGSH/XmMr+QkP1HTNd2q8yLGmKynEv0CmHdDxQEMB3Jegg0OVkODfkDTbiN
 A2/fRgCGM9myezT2nsWeNV2kXFFL0o6axTOr2YXfLNtZDJ7aU04QVZwpL7kteFg+rYcRO96TK5S
 fp/mIEVrj9piCS+gSuFY7mFWr/CqAiVGegpXg6a0qMdX+kockCQvTj9t2WEAk5SLUd/gQSEDUjx
 8eUbJJLiwyI1c/eEQxAmvZWZHRijUTaXRIyaZc0fZlsnHVgp/KVn8Fs9MbfrIYLDMF8KiYjACk9
 icUYm8E/OIDd7gsLKwyHqTpDH3pukFRSQFuwAnpchOnBxSwYF3O8x+OF+kH2EHo7KmA9HOnwLWv
 I1kYlj60juIOwyUVpuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXzcPRJCnMAuq8
 D49rynyNmwe6vOcSzRlJRvIpAHfBF6+8lXzhSQzpEEPSdxykzjiyfIiy0fSuYbsbx61VONBlWNE
 fpqgGvkOG+ZsRGmhP0mYoVk0f8B3HMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_001948_564832_DDCDBD48 
X-CRM114-Status: GOOD (  13.69  )
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

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe and get functional bus DVFS
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..e9e75c4c4da6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -340,6 +340,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 

-- 
2.34.1


