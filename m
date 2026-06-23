Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0352ECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgTn/WbdLvg=; b=2/cRZEV7GnLC5D7xoXU0T19BuL
	kyZ1QYG9/uOD5ILRgOFmmzuts6CN6htC9GMt5MpE3tblGbmEsP33i988Ww1L8pM2hIK7DdNo2oVJC
	WzTdxtutxOaH4Pv9VlaLXQx0J1DCJGGMRg9fIv5MMsuqU8u/cnQGFwBLD1v7Zf1WKQEEzb/Qlj6BV
	PkF3qjJWwfzoUJpOQwv2TnOVOqj8fOeg/Vg1h24Sx0+UU0SaRPFsgzb2clhcUvktEG1xCvay6SAOU
	jN/8oAuMx518q3CtpmoTal54XpeE9rEk0NwfMqK6Wwf3QoolVJNXYDNPfw/kdFNYlUPlZZFnARCzR
	1JUc8zhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvbE-00000005pkM-0fn5;
	Tue, 23 Jun 2026 07:31:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvb4-00000005pjk-2CRk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:31:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6ckNE1628476
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgT
	n/WbdLvg=; b=oaqV/eaRWEZ0FU6GaybmJ8Egzx+/Ugo2FfiiOZwSLlcSccmSmjd
	Iu2CBl6rEBJUJPUxx3++jGIh3Kw8pvBobSx5IgTH3CTCGDd0LFLHRefDrkQKT+ai
	ZrzT3/bjoxOqsVmjD7jjxGh+sx2P1I9CmAREsEvN1FdrVpOlgo4ql6B3ibH+ZFIm
	F3Dgss3dmN3fy0njG1JyUtjJn8t+bWS61B/r7Lx039dJy4/tl/EG84ozamUAMwQk
	AkDUfRT0ylooHUrKf7mYz6AJYxBLbbXOJChXBA4wPNZ2R+g1XkV40Wa14kjs6k5X
	P3n/NBax+XinwE7rjA0z0DJIhH/i0kOC6hA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhv5a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:31:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9159c4b210aso137185085a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199860; x=1782804660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgTn/WbdLvg=;
        b=ijNvvttSBkRvzDXNmGSi/Q9r3T2VlNc4REWKyX2ASWSJDAhjzGiYMzuHivL0ZZClxz
         DtNRtFIYrgqdimaCY29zYhADtUhXSnDXquIQqTG6SqjGdPSYwSEQxrdAccaSc/V0BDqB
         HhShyNRoJrwplMrFneqgdl1q04kSyyBQV8uJSXu1hO3teUd4HI2Mrj1H3Jim0yTke7BU
         iF8rCFrHAZndu93vOaum2OW2yDe3HhkYgvuVHWsLDVXR4qG8K7HoMzgZ7OjwE2W1qLOB
         UJhbTjX7NJ4P1WHC0vh8Wb2QwL9h4BNzSpcOEdwG6g97TQVTQ3PWWaHdgzrx145CT6ay
         ziLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199860; x=1782804660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgTn/WbdLvg=;
        b=rBRu88CnLlP7mIj/v/CivazamAXOLOLC8ROJ6Nc4ITa4V5y0bNvquCopwmWnxh7g4x
         nZFMLsn/K34aM5DuBK/A3hRxSGdvZJ7yVtZUK5/XLnFXypEuAEI1fU/tH2ITlRKPKvDi
         XNQV2XSlMXM80V+dNGIgrkCSeHUA2XA6yk/fbCryFDNKxmT4ylMnwbgQ8HXcSGskbX1S
         XlvkQ1ra8Zk2kd7OH5Kxhrhwhza0sP6xqqdG27L0eNZKgOIR9V1unD5ac6ZkkjKysglK
         7MQIWQ6GD9BRYi2YjW0Y758E9D1/L9X1CtJBtH8wcNgyynD7MhKl00tJSPNfzzWy3p2c
         nklw==
X-Forwarded-Encrypted: i=1; AFNElJ83J5OLPBlUxupQouDX9vTzttEQGHH3CZgQ9b7WBFqFbeuKaoOiiWSUucqVoWg7Gu2KyIjQWL3F1g51DYRMPdvj@lists.infradead.org
X-Gm-Message-State: AOJu0YyQx8hfAHQ0K0ev8prh51zK2iUWyLAHXlrnI27BnNSTHAWPLsk3
	XNGPbLVEgV/Uuj9tsbO6huGoSeRw0u6CurMw6eL1rSdN8q4kuF72kc9GVQy+A9Y5vt9YMNH8Xqt
	WaBmqV77NDqe5qlZh8ZSQ9aAVkHy1mrpGe3xydFufOr3l8xx/vdeulEso4N2v+txHEsoaFGMsGv
	qc+mCTEmx4WQ==
X-Gm-Gg: AfdE7clBIpQ/SZLHwElKtbgkSPdD0i8JDEwVlRsuYlbb6mJdgZla0dPmlQejTTGktAw
	JClBLWyKaeRbGynTJ6AI8zz5hP0I9MfMxlzzUz8NDGn4SZEV3dVbrv9kuKHsXGJPvDsdvK+yj0A
	Q44Xredgj8ymYgP2WZXIJ/ZZNBvN8yNOu/OIbvdsEIM/u1Wlsgx6TbGdR484e3Lg/CNbniT5EMX
	QgmE/70GsE2AszJI3M0BcxCB1csulRWkW7G5ZqLK43DDSmnxMy2pTiWPBaBdYC/ctagAOgKrAqt
	kZwVW0skpfM9bg3MPeWU4SXO1QeJLfPliZstlB5NxC+Ewkhuv5lFPBO1thyk9pvSpqypktcQ5q9
	smJNTV+iEE3XArXzXMyAjmMCxICM=
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id af79cd13be357-92600a83287mr479173985a.17.1782199859844;
        Tue, 23 Jun 2026 00:30:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id af79cd13be357-92600a83287mr479168485a.17.1782199859316;
        Tue, 23 Jun 2026 00:30:59 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm32639666f8f.14.2026.06.23.00.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:30:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 09:30:51 +0200
Message-ID: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3511; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+z1jZQEnVR8n3wdnGSX3AbHxBd+dIKoxZwO+RTEadyI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOjYqw7+RyPgYxYdPnTEFX17TqOfRdpBrpFk/9
 nECEH8iYtSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajo2KgAKCRDBN2bmhouD
 1/zqD/9bOBLllsidqTgIaW9n/Im7ZNh21uTUYpZWY9l0c6FHAd7+MgIBIsgU2A5abk25PiND4N4
 iFvurm6lE04BJQw1is8lJTiAudAunnJiVSTVw+xHD1fIxYqvkSx4MIUaYS2j8ZsTPMYhfGPLAH/
 owqpUIghS7KmlJeNmh3ttEzlrOph8i15uhtev00kjBZVpkjDgGsFj2bfzlKd/m+YYFnGx9nr6bN
 XBwCmuCBiPaXM9fU72ws3xZPCYo+xOMy3QLQLLe7bKq9IAn/TR2tevde29XIuXDdgskh6pZA9Yv
 w0unRiwWYjy3T47N5i+IYEylB5DsfjmN0Uz6+ZTKCXqLG0KP9az/FqYaUt0qqLPJ9ePTJQ0RWpg
 46j53S5D2dyNgpwfpDiPe84Fh+78+SqhDuniTRKh3TUCO5Y7fFfz+mQktvxLOPwwNxA/H5DXdB8
 DjUA/dZp3Ud8PrXE2DbzXfIc1M7VsFydkLUXrkfWgrJFIL0m+ErF4zPIknL9RkH+JpJBXhMIqw+
 PLfM6qcvuWRoTmHWLOlkrINuZBjbwA+S6Oh4P2TYHj3f1dlrKbvmcKvA0waBdx5Mq57WaEaKtbH
 Ogq/Zd7Z2fiFN+Lg1tjTtHQySJ+eJmHx6/exh+CNAlDQaWps/JsuBs3HtrIzbISytV+/5MXVpqa /5mVdW5lFCl3KBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfXxNvcr8/aG9Q1
 qJBldaPXi8iPIZiiHTblrSDjDg63FGyBLBh/COC3JrwagiAQ+bI+IXgAGy+/IpBJW8XUSPUmmFr
 F1suBdHZAz3YvF2T2rGW3dxH+DWJbfk=
X-Proofpoint-ORIG-GUID: qOtogGVu-gjajo4Q6W3YzPMCKwN3JJg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX8mA2xIf7uLli
 1Zawn6S8xSWjXLm8Ha0fn9leGp0nU9mVx756KOD0c9nlPaOatGkHUUMWVGC0es/xR6+SkbkQKFU
 uE6Z9yhpCGVQwaxaM7Ys2hHthKlYs59KxfhD5Kn2QUNyCkwXCQ0fCnywGUatVCCPMtofI7z0+UO
 q+P1FG1jfT/DpkltTGKJPaC06hF7GYlxXgQcEZjCEBldixMs2L98+lFdWhn0dXww6gpM5BjjdPv
 TRtKgqZoPuQs5tUCMPSZkHCt1it2+wOw6Q/FoFm7UQnDqOJ/uxLgQkpmill+TeayQayvaivNgYB
 5jc1Djgzxbo4TeO0MeKSe/zwgPjPUpzccd7PaWsat4E+8EUi3EgFnBixH8F0auMH2+S9Fa47o55
 AbdI+jFMnBGvCA9yAJwEzWlK0h2A2pIsfboDXJwGT9HJ2vb66TdrTju+6R0W+BuLgH+cvFyySyb
 RCxvDsiEA18f3Icu15Q==
X-Proofpoint-GUID: qOtogGVu-gjajo4Q6W3YzPMCKwN3JJg1
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3a3635 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=OuZLqq7tAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=hD80L64hAAAA:8 a=eM6w23YO-tvBst7BRO4A:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TvTJqdcANYtsRzA46cdi:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_003102_875167_1FA89617 
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

Replace permanently bouncing email addresses (550 5.1.1 Recipient address
rejected) of Adam Skladowski, Chanho Park, Anusha Rao and Sireesh
Kodali.  There are no new messages from them via other email addresses,
so drop them permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC
clocks, because he looks at other Samsung clock hardware and drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Stephen, can you take this directly?

Changes in v2:
1. Also Anusha Rao.
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 2 --
 Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml   | 1 -
 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml | 1 -
 .../devicetree/bindings/clock/samsung,exynosautov9-clock.yaml   | 2 +-
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fc0360554f68..9f2b970bfb48 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -7,8 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940, MSM8953 and SDM439
 
 maintainers:
-  - Adam Skladowski <a_skl39@protonmail.com>
-  - Sireesh Kodali <sireeshkodali@protonmail.com>
   - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
index 5b128fa841aa..1337bd87fddd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
@@ -8,7 +8,6 @@ title: Qualcomm Global Clock & Reset Controller on IPQ9574
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Anusha Rao <quic_anusha@quicinc.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
index 7ff4ff3587ca..a35bbc7b1924 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
@@ -8,7 +8,6 @@ title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IP
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Anusha Rao <quic_anusha@quicinc.com>
 
 description: |
   Qualcomm networking sub system clock control module provides the clocks,
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index e9d17d48b4f3..3dcdfa7a8792 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos Auto v9 SoC clock controller
 
 maintainers:
-  - Chanho Park <chanho61.park@samsung.com>
+  - Alim Akhtar <alim.akhtar@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
-- 
2.53.0


