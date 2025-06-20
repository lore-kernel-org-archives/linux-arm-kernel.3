Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C06C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ScyFz0DOvxXgWzbjqqOuOf3WOA+3QVWgFuzW42VFYnA=; b=SKYpSg/RyT13tB
	t7vfbzOSuhB+d9USrreujJycZYp3omTl9mepRQ1AOmSDwNVQnf4sRMIBwBGr87e35mlR8OA7heQ60
	K/DCBGbs7RMeBEerQsvmkboJtPNWmhHtcHMew5H/k5G31O6drKU+J+dDzOFYb56lWfpAVeBhqgRJ/
	eOV27WfYNhHyaBGkngzYKchEDLf2DAAkW4MZ0rZLpNqPZV62IFijxo1B/0CkY5Y5eE3qM7LQxwzqv
	H1PLWZlj3/b8mZViT3lX/L1hdOuZK5mLIOfHn6lCQ/NwfinzrIfaYUkyuR1agBpoMAE6b8ITalwEM
	TDX6BcEZgHZ1v4SuLQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVga-0000000EuFi-1UX5;
	Fri, 20 Jun 2025 06:57:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVeK-0000000Etqa-3DmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 06:54:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K6j6J0027542
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ScyFz0DOvxXgWzbjqqOuOf
	3WOA+3QVWgFuzW42VFYnA=; b=TGTRMjbLx0KFwUzJWzDTmsEJoLwa9VEIFuwp5j
	jsU7zWmJ/IhoDXWw9THQo4l6FfivNaSyWcXVb1KPs2wCdQiDcpN3iBlD5OqvGZg4
	aIoRsLDP9x/izQqFTQ7qdL5i7yem8oNf55B/s+dJH3g3Ugl0B76miQTXN6XTcLMo
	1UmPUYm0O8a21CsYVxPJKOkra/1p+Z6J4Voocsx8gIhXE/gzYYCFTU1ccdYZuIcR
	eNOvRfdOks3Qq3lNkFQsi9keoRVyL0G5jhL2seOKhtDFvqZSWb0196EieY0Myhpb
	OP8O8dSmTtbzFCb29jAyduopU8Mhk1avUI6gN02ECVyrb9Vw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdae37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:54:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2349fe994a9so13651725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 23:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402494; x=1751007294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScyFz0DOvxXgWzbjqqOuOf3WOA+3QVWgFuzW42VFYnA=;
        b=Fgcwpg6v8/NiJGYhBBVoxt2ygQgqOLY/3gzZu0plDm9ahA9wLazDNDyhQuhWz7nW54
         Rs7bGZeCE0zLKeKuLrWqYCupwai6SQXQgGOPE7LwkwEi96iVWoanyPYTSX9ykq59p3o2
         g/F/8V9wObXwz/6F7/BAcphYnJ19PmxGcXIwLMI3QJA4rSD1AoSDZLHSBEWAjhCWj6WY
         9iqQDccmSbqF/L/gFttKa+S0hAWyiUdRqikSXkIwOVuifEbcBaO9iQHJY5VYYZpAyA0I
         P4zibjCxQMGQRx/3zGVJoTxaWmXqptYB5cCqe8z/xMcp4qMwgp0FIPMdfY0zCfKD5YuW
         bhNQ==
X-Gm-Message-State: AOJu0YzNjvhtgMRMqCixS5OKce4eyJzawCIyMCK2PPRQ5Ar/4xgHdP+z
	sCiOEsKOnZzsR6TzelF7YbfbMYZGXkYooZqNI5IgQk5gtbt/39qLT+qI/TaZd3oDrvTOrOnMiuy
	bBnlSWZbIBPeOvAh1V6qJ/0JIr2OljCxhdhoLKg2sEpgZnnbOXqldVgTE2MfppSACaN7dBHwpsP
	yuCRi3knz1OQ==
X-Gm-Gg: ASbGncsYg75StjsSMBen2i29hBR1Qp/+EnBR5DsdDzIPX4b0K4rL00lUFoPVJH/UQt5
	qi/FTfGJm+kxrPSCKH8rPeJfCirg8IXEuctFGU37P/odJo56huz6zmmK5uXnU5v4FV3aZ91OOKH
	vBmRvJ/WNuH6C3BCiPyGqLWJqIYMYy4Et2BIE0U7OjGcz1ACEcciCc0YcIq07L79gUwmSFsARO+
	TcB0jjUS2BYzswQEDq/TaGfrkOkq1iKSF0ijjZY/isYgupg6LQUm/q/2XSHhgN196NsnlEClxTl
	kl5vqYlQ59MPU1QnQLyyIm422kmLteeJ
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id d9443c01a7336-237d9775b0emr22386205ad.8.1750402493803;
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkIYHi1UT3lT3VJ7eStgc3F3RXk7Q+Nga2d2//COTAVYVplhFGtVV1Et8O4RY+Oflc3Ja1aQ==
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id d9443c01a7336-237d9775b0emr22385985ad.8.1750402493406;
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Support for Adreno X1-45 GPU
Date: Fri, 20 Jun 2025 12:24:27 +0530
Message-Id: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMFVWgC/23OzQ6CMAwH8FchOzuyDgTk5HsYD/soskQYbrhgC
 O/uBA+YeGnyb9pfOxOPzqAndTITh8F4Y/sYskNCVCv6G1KjYyac8SMrWEYnGKjQDntLOZy04I3
 OlchJXBgcNmZasct1yw4fz2iOW5NI4ZEq23VmrJNQpFBQp4B8hlvjR+te6yMB1unvzXJ/MwBlV
 FQoKtZkEip5tt6nj6e4f9g0llULfCcA/Ag8CkdW5idWSpRS/xGWZXkDHmfOqRoBAAA=
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=1837;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5GnSOkfYQ0nmtlGuh6J0RyLLVdXBVvnNx3z3QB9r3z8=;
 b=knES3iwBctiGuUKxjFzfjxdZPB02hxoct8ZdKICWABwsiJgsGhwDdTtm4RUIyGwuSVqA3bB2J
 4tIPAmjr4/MA/8qi0hRBvUAC9WXYylb9dY1lGiiUKJYTd7f6Oj3TKpk
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MCBTYWx0ZWRfXw4DCzlT2/a9g
 3PFaSBfwtGUJo03DIqS0uuiX6bGS2jga4rKuLQAAUlHcqp4mO3W2bFBy98NrEz1qZNBvNb4/B39
 dqAbTsNjkSOInz357I7Wu7GlO67YjktQ8GOq/yjncq1+fdaLu5OcfRJVjsiLCUvIKnpthXRD5Cr
 k+T5I1//NHsVt2PQm0zPX9hb5xjocM+EZs6ftuLVgdHPADOqGoDfDumqN/Z3oLIm+qX3LoviJ+9
 tph9uzmLg31eK0p1o8z8ThOK+MFG7IOoFtSmDojbtEWqP0u9RyDvTLLO6oN4g1ehAK8XCBHBz3G
 HtuAxYqVDAQdoF/ILWuKSMcRjlSOxUHQ8ACWyWcPU53JekDwZ3JFKOUxPVdepkVXbd1PrFaVnBC
 4RmLp5wEbWeU51XNeJ4fDzfMDdOrK0m5xs2Euh0Aq2k5ubZipE44+qy+SeshnA1wRJYHxYBz
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685505bf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: aEYBnqYGdD-QGRo8ixs6nUPTMxjOcP_0
X-Proofpoint-GUID: aEYBnqYGdD-QGRo8ixs6nUPTMxjOcP_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_235456_823588_68DEBBE5 
X-CRM114-Status: GOOD (  14.35  )
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

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Rebased on v6.16-rc1
- Fixed speedbin table in drm/msm
- Corrected the regex for the adreno opp node (Krzysztof)
- Replace underscore with hypen in DT node names (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com

Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100 GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


