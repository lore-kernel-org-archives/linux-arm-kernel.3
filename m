Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F182EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jQEDDMTmKsjlbrJ1T/mYsql9DaM6HWHTltiou3XAwfQ=; b=H6rpmkd/qQGDVc
	vk4lmO7vEwUE9I9B04XzrB9c0983kDWc4AKNqpfZD1n3wBXXurJBUhL3qHBggbd9QH3lZjlPd31oA
	nMkp28jCf5SE7GHOYYs295LFfFPtKmaQMFiVidIs4niFei/2HZ0EPCBwBtnOH12RLAm6u0b5ESHva
	MDHGrup9/TGumc6wj5xU52w8JC3g+azzZntmyJZP4nl2d638ZdkT+eKATGHi9mFZj38uewPDONy3n
	BIPy4oe9exNomH2fOCoMrc8K670mEnd7bRh3l+yIsypvfZjgDbIemwJ0nvx2OnezuDXbUezyXSJBd
	Dnz3hFcy/dVISpZ9jjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuN3-00000001kqV-0zyt;
	Sat, 07 Jun 2025 14:18:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuKo-00000001kWQ-2qv0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 14:15:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557AODfY032638
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Jun 2025 14:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jQEDDMTmKsjlbrJ1T/mYsq
	l9DaM6HWHTltiou3XAwfQ=; b=FL8FIhGiYfRPpEb5zkLb6X5evl8aRpePWsUbgj
	woUE1/DwDvnrHExHMp86Y2NnGAGH8/6eHoXVwl16OL2JwcBbDMgPU+BeKCwWRkEX
	64IVk1M3Ymg5qahJWQOyE049C7C5MfZzR26IjVHAgH4DtOE8wXEoA5Il4rsHSqqG
	Y5HfoXWT4TSlOhEICgLJmvhmdl0qxpl8oWL9ND0t8lGt8H8nWaGhkJA2wk3qgPrE
	FD3O9AfKYzcbbK2+/46BQwXO/yiQr5e6FjlpJsbcZH/vOktcLBEcH/729bn7MLpj
	ZCIirVPQgI7MuWu0Fuk8GMWZF8V/fE3hPnGyhjop79OUPT+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxgnx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 14:15:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2358ddcb1e3so44068085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 07:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305743; x=1749910543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQEDDMTmKsjlbrJ1T/mYsql9DaM6HWHTltiou3XAwfQ=;
        b=Rl+q1cZ7F7Q0AgGaL62ZMbxv32PtoSbzIxP3BbiYiOfsowHRIUhKITKDDerSOc3HI9
         PgBqBy6SX8tGJLT2zrXbw38H2yPU+Xij7TGGFF1lIOcsj0tlayAwd9ODIWLCRBYVCcLR
         g0vjqDcLoyA0yZ7NjRY24mmHsz44/1Ww6WsgmHTDsjfnf9OJv3pnrpiMqempvAlOz0T6
         VQzAzgzdIYjQLPhWTrxQztxrbDO/PxAT+bf3CWskN6WrL8Oj91Khcz6ZI0/A29lc9yiJ
         cb8Ot/FNHC0RHClmNVx11tRzqCvSOxgo4PSgkT+7hflxFgJ9PGtd+pBK6RDhyaMQd18K
         Xupg==
X-Gm-Message-State: AOJu0YxfkvqSOGAkdKBKnWPcS8Tg6ip+/iKN5WF16IgYgt77GC8fQSj6
	AiRNs33Kd3Ezel8Oc+SnbsvA1DA5+TVhe7rTgJgFyOXeV5unzlIQUREIHPAqwc5W2jj2j9ALi5r
	sxZdYZ18DhHUooqXA+3BTVE9w9b/QBYGgbZV9wcsi4hknpt8tQte93BoMVawr59+hPzfJCge82Q
	/ypC+6qEvRCGyX
X-Gm-Gg: ASbGncvwjnqhzMQAN9Teeso7+sfpHmoa8OmPW3zRHgjQEg6vxR1N4jxhGKDF3Ll3ZZr
	oobVkYaasOdpaprt821OGg5BxqqVU+musYMN6RmdgNzGHyWfARdQrafkDp8kSgekDCTlbfEzPhW
	aAfI6GsLgcWVudcM0OSJqnNVmmmB8aW0HeDGFj0fu0LIKHruYQJuegHTZmDJD5X9cqgi4zYatBu
	s+QnljIxh69BebrQxbzVl8Wu5JO+U78+RHxRIDcKZ6lKx0IFDzDcP8p4d6XxNI+iyXPE8THtnV+
	ox+21Ons9xDgoKb9s0Keo4xmhvEDReWJ
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id d9443c01a7336-23601d09641mr109277495ad.22.1749305742570;
        Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjF9YeOEhWSWfxr+m+2RrgoG06THK+k2+nMjTup1J4LstKl/tmEjXBkTr4o+5QwdlWwirKMQ==
X-Received: by 2002:a17:902:e750:b0:235:f4f7:a654 with SMTP id d9443c01a7336-23601d09641mr109276915ad.22.1749305742176;
        Sat, 07 Jun 2025 07:15:42 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/3] Support for Adreno X1-45 GPU
Date: Sat, 07 Jun 2025 19:44:58 +0530
Message-Id: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNJRGgC/y3MQQrDIBCF4avIrDugNg00VylZTHXSziKaqi1Cy
 N0jSZf/g/etkDkJZxjUCol/kiWGFuaiwL0pvBjFtwar7U33+orVLEg+cYhozd2TnXznqIN2WBJ
 PUg/sMZ6d+PNtZjlHeFJmdHGepQwqcC34d3sYt20HBKPUqo0AAAA=
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
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=1043;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1R/4cAeIAzLJOWp/GuFrSGG6zEJyy/eVJqkUetChkPE=;
 b=T5B1TBD6n1ZXjWmBzYGz79OW1hjAwODNgkAjFeCeljEAqh+W/4n6lU8z1zkK0ykWF3R7mJUA7
 8yVMyFfn9g6BOOwS52MkZTyflD73udKJg7pyStIQ/5hNiAqyx8r065a
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: m3Xs0pbD5Hlt079CvAp6LXqvLCg9gRwb
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68444990 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vb8sKYNj6oKrwasmUUsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: m3Xs0pbD5Hlt079CvAp6LXqvLCg9gRwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMCBTYWx0ZWRfX/EFCETXkH5Ir
 lqO63KmBKGbYTwdGjMB+ZfmZ6RxDCoKTsdo/mtsYoRDrcPD7n20GYmUWYk0dF1Ag05/lwiBurwo
 sO4evdJQU23Mf5XzWKV7qyziEku+HEoDeqlmbX6Kjqh0MzxHZXjZO9PD4P7cFwPxqJhh/bWUPZI
 kLZA61SJ7KMjCvUKt3XepJ1H3l6neVtvcZ/7VfP6hONsBUYHvhwvb170Y19AErycipE7zwMX617
 bKhOk4SAnAKE7lK4p5tshCBT+3UvcMMP7uhcrDLqZLPT00fuiBZZCf1vQKukaZIOQyTR2J7YR2H
 S4wSRJW4IW5AgXBnPYj+q4F3Ti5jtpVNghHU7z+jvbKbQBAADy4PV5hhJE6BKu1860gc0RSoj3D
 syDayGOOF0ggLYvOXVAFYeuz0DUKdXRohF80f2T82Kw/fCGXtI2SeEvyLVyGdI83I7BO+0+C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=586 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_071546_866079_CB7CFFBD 
X-CRM114-Status: GOOD (  12.01  )
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
Akhil P Oommen (3):
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
 5 files changed, 170 insertions(+), 1 deletion(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


