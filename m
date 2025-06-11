Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508C9C71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6bcwvX4gEpvYIjcBEapn8gGSYzu5mivrPS7uygKQxHA=; b=hCvIjd6Rqp5vKi
	sxQoFApaMpSjjmx6zTAdTav0Ja7q4h50KcZRgFndc1M8RWR+fA7LKtprLhYmbKyw0Wkl6fqdIhNPQ
	3jZBXw/yiLnsKq/VJK09APObOaaO2mHLEmqOz/S+T3SsCv+23GoPv5T0BhjyjC8wn/Ye+4T1eTQk5
	WyNkYlfDC7wXVOkZjlQsWn5EJyDAJNkCV/MxKa9HHdPu3AZHxlaztYJzIExx5/mQfocJXDsCATbwo
	tcJjOjpdT167jHF33ff8oUKqmtFAQOzsZu7CNVh9vWdrRG3hnYJNr5Ov8TvuU/EMUSfgpGOxULBbg
	7271liAj2HLH0PfrfG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpP-0000000AHCe-10fA;
	Wed, 11 Jun 2025 14:53:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJR0-00000009jDX-0bv5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:15:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DGlo009100
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6bcwvX4gEpvYIjcBEapn8g
	GSYzu5mivrPS7uygKQxHA=; b=HxXrh9DoaapoHyvbZTEERKhkYjwPTYRb1wFUpV
	Qw0ee7jPdhV5kF5iykjlS+oAAwRVI1bAZ1TZxmCmrYXsx4lA+s8QkzcgU1MIoltC
	v5PXVqgWDGVxOpeEQsvSrU2FE9rU17ilM47eC1pDZzv4YAIlAmZncOP0fXCL6v7w
	iPCHYaTaf7vu7jTnVG8PCU5roiw7EzUAS7CA5Eo/9ObNOKCwrm3MGg4KUf4dvhjg
	4JFlmA5x0tOAlQhUni8ctyHXANZTuMIDsxvyBsGMD/5VJ3KEiF/YTqKUC/rCasu6
	htulFI8VimDqlmGpe3jE1iBjbXC3+ZYWJ/17g0xN9dfjhHyA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753brpgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:15:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74847a38e5eso2278230b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640555; x=1750245355;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bcwvX4gEpvYIjcBEapn8gGSYzu5mivrPS7uygKQxHA=;
        b=a775ZGUxqhR6/3LHawkjgYeRdVUi3zfDPhCF1ndknouT/xu6dIIWghFzjpal+2Jotk
         rim0/B70f7hfKMi+6kqU3dZmmsGpxCOdbpf8fq577GI0Yb+gnkxcgKRt5pdqHJK+Xo0r
         1C5uArklAyQOExeZxVW6omP+NRqKTlVtZkr2W3A3XGUCgNBV5MkxFY1QkbMelvsBrCLR
         83VYikMtHSDVt1EXgXE8f6gxHCBti4UVvbgwBGrwOkMmcUZoML14L7Q6hUxB5VFgl7+0
         +SVxXcTdspI3uJ1iEeKhUfoDTsQYmSU6//lL7BS4A5jnujlyj6CclCyND0/ZpSQBiy7A
         aoxw==
X-Gm-Message-State: AOJu0YzrZzAgvubMw7bxyldnsCUs9SkLi1fzhM4/v5rZuFKaNVRAfvaY
	b1/ERuxaKj64GTwYsGZ8hz2m28sunqEcxZs866d+kT7WzullXw6K2dEC5Fs8yHKcB6X+Yg/7iun
	aFqnp1devJCw/CJXZAxyYTkjT3pqD/J7rv3DyuRFjXjqj/bRZ5ClHujktQL737f9wodYUc5gaLI
	7Zqw==
X-Gm-Gg: ASbGncu3+YkjRVlJWKwhzf6gfUdQKlLdMuxjENvCeLacpPxA+AgtdGxn582y5MibD0n
	bGFIo35jeZI9yGrCLsRaronknESTueCbd/YgsWHZ2BfkLGmFUzPymw+19tYNo8SQAcdpFsNEXPA
	1kd/+7lfTBV1THB/jy888WZXglybT0/0/dJOvqhdgAOwea1gDjXPcsiCCIvxKrRWXpXgNz6H2+A
	9XeySPMks1bt+kEA3ZNVXHkXX2KPQs1yzgQ/doc4RvNgBh/MQ6VylvqloiGw1P5nEebVc6ZV7Pc
	ann0zQFkwpxJmRzM9AZJ4vosnIKWa6/y
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-21f8674384bmr5182078637.32.1749640555075;
        Wed, 11 Jun 2025 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCzs/EwozS2+jM3nfZzo8sHxEcKNC8JH6C8JAdHxa5QTI2A6Hb8d3Gp3f9wRZbV5iIW6Heew==
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-21f8674384bmr5182020637.32.1749640554632;
        Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Support for Adreno X1-45 GPU
Date: Wed, 11 Jun 2025 16:45:30 +0530
Message-Id: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJlSWgC/02OMQ6DMAxFr4I8NygJlFKm3qNiMMSUSIVAEhAV4
 u4NlKGLpWfrP/8VHFlNDopoBUuzdtr0AeQlgrrF/kVMq8AgubzyjCdsEQNDZak3TIq7QtmotMY
 UQmCw1OjlkD3LH1sap+D0vyVU6IjVpuu0L6KeFs9ObwZ7oNXOG/s5ysziSJz32//fWTDOMCfMe
 ZNUIq8exrl4nPC9q+MwoNy27Qs9+9qt3AAAAA==
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=1468;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tir53TSjkw3/xfxcfRmGyJDlmk+DY/g391WffwmPdjI=;
 b=boSdoAmoFVFkKeAEz/t/ojFWCig1NztCZfwP8qlXEYtkZ0rhoNdUnxkTTjyrf8ntYT+9A+S68
 e8DQZ/kjg/kCF4HThVdDLAPhzajXNLrZGgxYS+L45XpzVh0R/cEUiN9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfXynmXCJ4O5914
 EBPkVfb630J/SBvrvxJY8rUbRnDXJkYkN2kNSg5RETZABgKs1dIxRCtBtj+VbdtPrJC/g0fgHUe
 8yYy1/xZ7ClwGLQnGJ2Fbl1T1cFiZtONpi2eICkzF2x1Cgpez2VzeCnrShuMoc8NerAWvKNk28U
 vT4UD4+cy/eRpcxe5Wats6dDGf06Cgp/YWIqA4irA7qELtwxNewjDayrGfn51jWbDIcbgAvuT6Y
 af/4cFV9Sq70Ew7enGDpNmNkwmy77eHzli0B8nK0Hdr9fXs1JDhZUfGlckk1EPpV7D9Vg1YWGc+
 AYOlcoKymUcWaRV/q/XCIwH6wqNe7Ls2Y6PZWfALKKT7dx7gKAtVcx6LT2Unch7Mk7/hPehJJAd
 C7Kr3MaXAyws0R4jDnQybz40V0NFs2CFxXl71AzgmvkNIzQ6X4hPtomx6WLlrDyAFSz5x4QU
X-Proofpoint-GUID: lHp2_tNYwme39kgazfYM0iJ_bdIYCwB0
X-Proofpoint-ORIG-GUID: lHp2_tNYwme39kgazfYM0iJ_bdIYCwB0
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=6849656c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=966 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_041558_304112_631593F8 
X-CRM114-Status: GOOD (  13.12  )
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +++++++
 6 files changed, 169 insertions(+), 3 deletions(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


