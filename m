Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D836E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQDEF2kC33/fyL2nBGpvpqqwbZvWsduAc47Gm9ODysY=; b=YbjK2dql0vH/2KyZxWIpso8ite
	fYlEZrTSr3007p1wNHf9XrsHxnmRw6LpJpMLYifXIsOkgswqQBsfYulledGz3pa0szXP17pFHHtO9
	Iovc/QnSWqDPaAZmMtcP/VQasYMr4O7UX6UMOHPAkkeIhK/K88CcaKX2r0JhQe/2vId8Nr4pUcg0j
	0m832teV7kFoizR6ZVCzQ8MEuaMKiUUIUhX9vLg0dt7vlHxKhrMuWSyl7TVIjzABSnRrqSfL7pJJw
	fcH8kNLun+lEPDAT84Co4mJUuNaQ3jZO2qesN2+L5Uz3/GXNtVpjrvcRPo7aavzcxANKC+13Qe2df
	rFxGIkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmf-00000006NcF-12HG;
	Tue, 03 Feb 2026 09:33:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmc-00000006Nb1-0tBi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:33:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136V2Fe277541
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQDEF2kC33/fyL2nBGpvpqqwbZvWsduAc47Gm9ODysY=; b=QdxbBZbo6CS8MT/+
	gGA45Ze9Ix1Y6Y8CwK5/lF/YtVt32I0KX1kKcfgZ3vLbSxDeqn00E6V/FAuHa2xn
	7jkxucU2kpliK3yreysqT6SySJwAcdrAOGSm3Q1EJWxUEqmaK/FGt3/cQohy8D0j
	J8S82FLtgS8NUOZ2UZRm8aYXeYxYGYReL6gczVr8qteMGP/C0d18YM8CWecBQs6J
	yMh3d4aOCk9E8zb10gYr2w3MS9ekK9JA+T8Otb9LVYUPTvJqN7j86aZRZVNHNivJ
	GP6daCiKftq7P2SnLuZR3BaztVzPUPUJrrg3Yle6LmiMpYzndAjmCV7gWydB3d9G
	dhckgQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s3a2x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:33:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so5024385a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111197; x=1770715997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQDEF2kC33/fyL2nBGpvpqqwbZvWsduAc47Gm9ODysY=;
        b=AJQRbHxqedaH7h/KVVzcTzbMpFZR8aZxcr7VhqgiuPxJj8AMYhLfB3tSKOV5NuOyuy
         0SSFE6r+k3CrKLIH/YAiKL8Iv0/PAJFqIgPh+kjmvgruMvrlA21vMjrzW7F8v6oxrr7r
         BGdwWfvBGZ3pSE0FIUMRJsbZkUun3aYVt37Si8OSdunlT/cfENshL639825RYNOr+1FK
         B6hTxFCPfRyzdllRX4qo0KK2Az3Fhe7Sitx4aS/A/WD8jpEF5ynm5S9y6vsJZn9lS33+
         MImtEqXo6wbHAqtwXB2Qf7ic1A4PiPOglpF6X9bP5t9E4yPyN4/yEWl8yit6sBNGv/0f
         DI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111197; x=1770715997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQDEF2kC33/fyL2nBGpvpqqwbZvWsduAc47Gm9ODysY=;
        b=hBJmvcT/42twyW5NPx5nwBoNPM7Vs6PaklHDfiKeLJQsVTuMX+sgbrchuXeZXqk43q
         g1CaNiJqmpVl3Lmv6I+N+JJ4dK2dr8/y2Bq6SftZkHe1faG9P7+nuU12K2w7NXZT6qCa
         UdN68AbuxB1JIHOQQbhAAOhvklc3q2ByYWkmrAtwhs3uNPY1WPXXz80XMqgM+upZXtor
         hN4Lsv0s09QFDgLE8i1QUG7qMi6SB07uh3a2Hcmt/c7EMtUikEmmbkNl8ENyd/6MoyU5
         QErHKEUu813BBaVUmXDSY+SfaOa4ii76dk3V/cxIrr8eafSE/Ch1ESTApozY+Zdbnc/U
         sP7A==
X-Forwarded-Encrypted: i=1; AJvYcCU8rIlgqaUl4v28guZ8PrnP1XeLWgM91MWla0OqvJSeJ/qvHi1Lv2eEUEIKErcUthHdAf7zesLCXowy1Ch5u6hJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwGGDFnN7SGRhqw++8H6jhsHk/pbF/8QBQ7e494h5StoNwGQwJu
	GU6/0LdvJUM7yOH5TX79611kOPhqqXPP/b1gPciQrH0UTr3N65oo4UCJmgenUqBx2AusuBSabWc
	TDWzFdUFgJo3HOOxOXE0/xJhnKxVV/1YAMHZHRSX7xg8fW/Z5XLePNSxhv/ixYycKUzOhxk/zFR
	bxSg==
X-Gm-Gg: AZuq6aIZGFYYFrMMEwIFiZ4QnImeokdhYWoXLZbBVfpXyl+Smdv7t/Vy2zDfbXcgl/P
	hcVup9/pgl9fImMk9O2ZiKlZAQcOvZfJv0GncbsF8x/CMinLXgWqWdkVv6KlCd8/4PkrF+ThWl8
	TblfsE8oy2MscemR8P7IWN0Lzyj91crzj2Y+h3WGykXyh3S6PoaE6BvHJA5aCfPLarM3bH0zvGO
	QZ6ngTAa0n3VPtvFMDMnRzL6tmrMmrt1eoHxCVP0SaUvi/vOUav8OSSCwgktAWpTegNswbw+AqH
	QhafkO7pu9EhMUhxnk+iiOPdN0VujllFql6XefC+Lb3KxUp+tynvUkv5svmf8JpoGoaqKlZe9D/
	+DwQRfujurTv/y1ycblT0ABNBX32zCADVlYSbFGOW7RL4KBR1nQ2GuDsyR3Klh3pg0EmlX0pL
X-Received: by 2002:a05:6a20:2d0b:b0:38d:f084:e349 with SMTP id adf61e73a8af0-392e0143724mr12396454637.54.1770111197074;
        Tue, 03 Feb 2026 01:33:17 -0800 (PST)
X-Received: by 2002:a05:6a20:2d0b:b0:38d:f084:e349 with SMTP id adf61e73a8af0-392e0143724mr12396417637.54.1770111196608;
        Tue, 03 Feb 2026 01:33:16 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:16 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 17:32:49 +0800
Subject: [PATCH v2 1/3] dt-binding: document QCOM platforms for CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v2-1-aacc7bd7eccb@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111187; l=947;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SddJbOlXRemaS+xs0O5DFcYSdAaiAYACiMw7pMSHwMY=;
 b=3FDOhsv15jkr0eG+Zt0bF/AStNg4Qs3wZAy6nUUTYvvXIp3doY/zOiE46GrxOAMXTswMlRfFx
 nM2jVbfkQwvBVdhoYD+8WXRU0ZHH9eHjurpCNaVAzNaX1kESoyax5Et
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981c0dd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K-gU5Sf5JpjFIvSPVLUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: P6eFnJYHlOZP44uLipXqfYRBbYzu7hDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX+f4deIL5y1pu
 bddnqYktDqBCPYHNBcKi/7kiGvIggXqVm6TbYPz7Hv6zvTC/XI2jmzsqD/NJnoypZjDmWhMqikJ
 rYoR6usbCdhclStZt4xZEX8H4f0VWzh17MKTwcA0cvOf81TDNgWWR4JVdfD8zAXbFo8/Kz4ppbt
 h3QY8txoUx+5n73vMY00mzOoexZz2rWvZseEUum5aphTn2Fu7naUoQ2oQNAAnY1Uj2qhCIEWu5t
 tTdZEhC0wp2pmmi9BdG5bOnhGZqlIIFKFfL+x3bWhpBsB/nAABgnX1diWIKKGUegaEh8ch835MC
 sws9LwNzDl7V7JN2dxmOWo5P/mdQdvq2ftv17xda7Q3M3Ko4JXzc4qFrAUhTmy543JRlcP8Fl6U
 wKdbb7LFeAyl3uSz1klkFxKUu4X5UlG1OM8HMNH69WYxqy5xD8aEpnvQoVX8Re/m5KxTkPUGBi2
 y2gofhZqblRJ+/HoPxQ==
X-Proofpoint-GUID: P6eFnJYHlOZP44uLipXqfYRBbYzu7hDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_013318_257550_A1C864C3 
X-CRM114-Status: GOOD (  12.48  )
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

Document the platforms that fallback to using the qcom,sa8775p-ctcu
compatible for probing.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..1b5830579fa5 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,7 +29,11 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,glymur-ctcu
+              - qcom,hamoa-ctcu
+              - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,sm8750-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:
           - qcom,sa8775p-ctcu

-- 
2.34.1


