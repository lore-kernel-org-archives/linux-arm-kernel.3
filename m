Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2C3C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C+Z6FeCC4nB3+cJ6p8StuQNkGv86+RFH84uiGZyNiQA=; b=f8CGsbEztvD+SR
	n6T+5dh0rMRE1EQMwz82wNLqrKY43ZqQmZA2YYBa4MJVauKfxS2a0Zf7xQn1TtQmXRGnYhpjCvkNX
	vMd5iUAsibFTMbKgN+G+1vxcgoFICOhL60QsOFzfcZESKyU5zzEblXKADwkLO7fF3nSifHd/PAq0O
	1NTZCzof5BQbrt76VHU4IgnCL3TAe0Kxuz9V08SXweC3k9mfEYwU/i0u+AGvYOQRFb3t4u7BVBDjo
	mJmbq4R9Qx4E4UTbZfCdPwgi3QbDOUPXEy7AC281q2tKbuMEFPYa7mxzmjEt6V9+lxru4s5dAIkRx
	fqbAO/lYsHGuffUD6uLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9vz-0000000Ae2R-1vwG;
	Sun, 09 Aug 2026 20:15:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9vw-0000000Ae1F-2L3d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:15:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IAMwK3372239
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C+Z6FeCC4nB3+cJ6p8StuQ
	NkGv86+RFH84uiGZyNiQA=; b=UYv5r7tBNQgTSSV196S3qJk5x5WPRoq92lhkBw
	f9+eckEVzDo0slwXABhzNjupK2uC1isRclH4rLLJRsedtgjLdyeg1z96Rteq/NzP
	WDm0HY75zv0hJYhqB2hndnfDClQC/6DaUywvv70UaJqy++W2GygYjLbpOyr+AKPA
	G5+G6S+iRAH/HXja1Bz3xsuoPZarNMcqJfyCzYhusPr5kwyI8GzAOWxdqBcahe9R
	dru/FTuNR2c2NiP+0BDfg63I9fxEixNwM2TVCTWulcSkUVxztGf6wgiQ/o6I2Bfq
	W8O0JHksA4GW4OGNstWaRSYS20stWgSEhA1HH1uRk5FkGBBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush3hjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:15:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d28f8737eso24792901cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306546; x=1786911346; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C+Z6FeCC4nB3+cJ6p8StuQNkGv86+RFH84uiGZyNiQA=;
        b=iknEM4OXxucbYf8wYxE29yuAaEI9/FmKwspm7NXK0LiohlnOBj9QPwj9Vt4mUp6IE1
         FeW95k+SPm6UA9pi1d7kCX0htK6uP5zRDm2MCQ/PZklYf+pvFfUoli0n0PvC/4pfX9cy
         lwuUioF60uBAE+pyWgq5L4k6TtA4mv71SVO4MZoaykghjgAjMHHQKnnxNo1ScIVdQxnj
         /GIN3OZOQBInv9A2BeLzsSTepqTUWs6idRsXF5YvsgZPkv2b+ENWZ34Vq4aoRV7SxEv7
         XycTIkCSbjnCvN5ITtH4cx+wkWxIT3lfKf42Gf0NYBZ8J0HDfpPudsok+KzYdX/p6OTC
         Zm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306546; x=1786911346;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C+Z6FeCC4nB3+cJ6p8StuQNkGv86+RFH84uiGZyNiQA=;
        b=IHhTcy8paXGX0BxJnA7wZx35CnfX06eRbIdxWjXv8974uq6thXr9Rk2e0V0sJJBw7e
         QOjscy4lmNC0640foX/2naMJ+yYoJYCizPSkPD5yeHd9c5qtDAM+nlYxJlykv4UqiZ/t
         dz3b60msNeDQAzMjkDoSCMoGz9GZ7XDwFLe5sWndd+gQqxAnU62juqaV77+SmDCTBMRB
         LfqGo2Car6GFEU8z/8g6vdn1WVR0z2RcX5dd4pGQAcRPzJWOMcl81BGbl8YHSPvewq5p
         axHOZ4P3UdrDj2kBk5oilctofIjbzf/ROgqprvnKE7+vPzRadrMuOwNFhqU/4xd1YblM
         y7hg==
X-Forwarded-Encrypted: i=1; AHgh+RpayvtXec0KJ/id60pkNpYg82A9Gfb54BJFzJKmkhfwrpkKCPwMKpyBcyhF2nY4QNGFHWCu05ScJRtwDms7egFn@lists.infradead.org
X-Gm-Message-State: AOJu0YxHxUPi+qc1Nf+9MI1fPC96iVuEtAv5h+Dvgk5shiytU7XzN/5e
	CGkQUgIvQvMJfVNAg8/vTmvagGicMrDNWya9QFf4bAwKHpDVPzVrwxoRLda/L5VChqcqbqzyCXT
	VhHGenBeY0Lxr3cazhEUqvF7Xmbcvqb9aX23dguumNr13RPFkGsMMV8VjYdlFIXDTzzfERoU2W0
	Nm2RjXEXZpYg==
X-Gm-Gg: AR+sD11IcuDDIP8jWUg7HUWahXkpFGVfANL2IMug7qC6R/bDNbKicWlJvWeeqF+wYRL
	qBhQ5GeUUkUIAZc5yVj84TMZBYxoiEEfAeHz1Gib18H00DL30RooZlv9sXuDf0f7WCnPj2hzOtU
	SxmyAwKsFEPskmxyEATFWnh2cOtAicZglujPxDQxIOt44n5If4uc+NXfuMOrDFK6IKeATCrB84s
	PNvfro4FeqXZr3tqA8VZt2grYj+l+pF9GCqBykkZKGoZ+GReXf0sc4CEjOLtJblqc/BTTz4qQsu
	Wj7E7AVCvohLHX+GdE/UbsQGtt9ei7vpW7Kquq96OyCn3A+kvOopV/FgX51l8lmINNyyLI8zDZS
	A4kjhZ/hxVuMbm7rrcCneoBvnS6wbmYLaY/5/zUEu7ZW4YGVNwdhq91BkHs6FchclZMCXupviF6
	AlrSXH+qPfL78rsQ==
X-Received: by 2002:a05:622a:e181:20b0:52d:354c:5b91 with SMTP id d75a77b69052e-52d354c5c6amr44062231cf.16.1786306545983;
        Sun, 09 Aug 2026 13:15:45 -0700 (PDT)
X-Received: by 2002:a05:622a:e181:20b0:52d:354c:5b91 with SMTP id d75a77b69052e-52d354c5c6amr44061871cf.16.1786306545490;
        Sun, 09 Aug 2026 13:15:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Date: Sun, 09 Aug 2026 23:15:39 +0300
Message-Id: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvfeGoC/yXMQQqDMBBA0avIrB1IQtpqryIuoo7tFEYlY0QQ7
 960Lt/i/wOUIpPCszgg0sbK85RhywL6d5hehDxkgzPubipTo6hU9cMjzyIJ06JrpCBove8suWB
 vo4EcL5FG3v/jpr2sqftQv/5ucJ5fM3fzfXoAAAA=
X-Change-ID: 20260809-msm8974-iommu-upstream-144b1e2a15f0
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iS0+HvRPMnjaMBIrBnifaAZYp0yH+UUeOB7gtsGay44=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/tOrgOI16LA45x/Ox0EJO6o6/tsToKA7nIH
 +rrs2dtFRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7QAKCRCLPIo+Aiko
 1TMTB/4rwEYJgew1e/uJmyrWp2cbYPFOFfOla5icjTzj9aO6/oWaxAgCvwjZE014WwleQQm3jWB
 /XXpBv143pWAnVsh8+QfyP6ZjyRTxfUuW8z7sdtfRUF2iyy6daa0UihSiv52mJFAZD0ihKeC79S
 C7BpuFB8+kq2hin2ZTcB7zmW76hN7+QaT0XqR5dBAtZJGGDO+vFCtJax1FE3cAQylv5Hs73qP98
 O/48zADmykv0wof7cpT1Og+qk/6Q6GJyT/pAQh9ij0T6cOBqx7tYP8rC79viohoMR1vngadtEtb
 FjKGLMxlcQryWwu63c7cPxPXVV7g5e4bfjfqD2wl5y8z5sg3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZVHLV8SX63MKDI_RWpcXvOXWcXhv6kbh
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a78dff2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=u2vn49mHtsTZZS3No3cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ZVHLV8SX63MKDI_RWpcXvOXWcXhv6kbh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX3N4LrXeRjGFh
 mU+2AsCAOGYiPFghDO5+xGG21CSjLg1FuJHN3mHVgz+Q55PmetUG9pvU6FZUJBbm8Z3TKMCyBLG
 JAnCB9x/FuF5SAZdOjj+GXIBwFUF/aDLkdTWIeVMWlS4NzUzEMVAb+kpEwqQi+5riJ/RoQkIGqt
 TR4QRcT/EqGDMiZS99+pPBT2iEukX0pgW9pzA9mKUfk2iJgOURnRoawEfWcrEYMQkjlPi15J54Y
 U7JT6veEHpNHKyZpaD1GryMf8sjEUhvydjAoftYoB5cmGJuY8hUWd7zxhW+gdYjB/I8BYvgNUAV
 Wrh2KW13VWJHRjD+z6OwShFGqAEfzWdyxNtbaikcLT6Lk5DzrmKVmiuGWF74PgoNQ668GEgDJKY
 MYn0ONykE5FFW+ZwXtCymWaQ9NaI+NBEXWYipTEYI7+zfdxw0EgClUbVbYEyk/gkw/rvP7gi5Tv
 MrK8ztz0m1obQXANGOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX90tmwbykq1r+
 Yi6AOGXab2ze4yH5XTSVil1KUhG00sozch0g2pXP5WIUyGlPMSymLfzfp+gX+vbBFc5ZNPDIEoD
 l/2beeHTpg2TR823MFtaICAL6lJh3JA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131548_744557_265D8C2B 
X-CRM114-Status: GOOD (  12.10  )
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

Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
spec, however they differ from other Qualcomm platforms in the
implementation-specific registers and also in interaction with TZ.
Venus, MDP and VFE SMMUs are secured and require programming only of
CBs, while GPU and JPEG require full programming.

This series skips IOMMUs which can't be tested right now (VFE and JPEG),
and adds only MDP, GPU and Venus (although untested, it is required for
display to work) SMMU instances.

Note, to get display to work properly one fix is necessary, [1]

[1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (12):
      dt-bindings: iommu: qcom,iommu: document the MSM8974 IOMMUs
      iommu: arm-smmu: add global register definitions used by the QSMMU
      iommu: qcom_iommu: extract context bank programming into a helper
      iommu: qcom_iommu: support the short-descriptor pagetable format
      iommu: qcom_iommu: handle the SMMU global register space
      iommu: qcom_iommu: support non-TZ-managed instances
      iommu: qcom_iommu: restore context bank state after power collapse
      iommu: qcom_iommu: halt the micro-MMU while programming context banks
      iommu: qcom_iommu: allow faulting transactions to terminate
      iommu: qcom_iommu: program BFP (prefetch) settings
      iommu: qcom_iommu: add the MSM8974 instances
      ARM: dts: qcom: msm8974: add the IOMMUs

 .../devicetree/bindings/iommu/qcom,iommu.yaml      |  16 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  85 +++-
 drivers/iommu/arm/Kconfig                          |   1 +
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  10 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c            | 445 +++++++++++++++++++--
 5 files changed, 517 insertions(+), 40 deletions(-)
---
base-commit: 6c5c106bff878247a9cc7255077aab9040df8bf8
change-id: 20260809-msm8974-iommu-upstream-144b1e2a15f0

Best regards,
--  
With best wishes
Dmitry


