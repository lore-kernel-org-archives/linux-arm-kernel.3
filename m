Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB2ED1D864
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 04:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=; b=qAyV7UaJNd74nr
	hcPaN+T/T5qzCjqicKlBl5fUhz5PjMuS274aoROiQf2XgVHHuaitenM2JYTMxbLSz7Zp4nzNxBOOf
	m3aNxn/uRb3rv1SLZqNgGdvoyPei5I65LmNRGehmTq+iD08TH86qPgcFNh2rv841if2sb/smZ4v/m
	2pxVRQWgfq2/5Whe5iUlgbSLpNcL2JmanBWYUgjFDgtt+Fl9gydAUaHdYTknoBiael5yOTnLZVPsM
	1Qdsak/7fADmgI37IUqJtXy+kmRDqHQjVzN4uTiwQgwtd+fEb4WRa3jd5LhNq7EE16dejuiwzmt3O
	Bln8GiIS+Qwbb2/AMk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BT-00000007Sse-16ua;
	Thu, 04 Dec 2025 04:43:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BQ-00000007Srf-2hFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 04:43:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3J7rrX3123566
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 04:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I0tZsr+X9rb2BkuKPKohL8
	wWGapUv709og7lMSnyxu8=; b=BfmkRvPc8agafeCKP/GA3XZ7lToaQn3EvMek90
	5J1SqUfA+2dZKX+6dGWQ4cmfuxdFiAhAj97RG2Z2UEgZ9MhotKk/49bAksbRuHcC
	nUi2ZypI5evAicniL7Xn98mndzzKLJ8ASAsBodggqJ1FRYf/uZnl+5B95uVlSg3M
	sSSKDFYtZczFQuBF/qpR2qiJUc/IN/7lfaihzRZWREqRBprAKnzv3paJIg0bokZr
	nnnwqcfA9lbp6gZv3WpD1L9V8AeWsNB8bQYSFshxKlwOBKuFVxj+R4FoYt9RAd9h
	JtNslej7vhakGhcStnbKTgng1kLSyPRJHv1I3oiqeilblcJw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h1d3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 04:43:11 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7c6d4a76d9cso911676a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 20:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823391; x=1765428191; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=;
        b=Kx9z2Wv6/dnwPbs77jX8NIMPtbtoI3WCYo086Y1Z7JVzLBuR8sAAX/raEItKhwnljG
         n8LeH0576Bvqwja+xoA6KjK1esDKgXhgmkgfyghxG8R9oJW3dr50XethxROUnb302HoQ
         z1oNFNzhbuXYZRLWbLkNW2VQufy8MSabhDcx94v7xT1tp1OVNE+5fRr6aHJoDnzPfSd+
         D6SYkGPu/ackxlaZG0LQkeGpdyPJjJCGColNefn+YxS2ZCITBCnEWSrZUzpobBDIGtC1
         jQmiTBkmlisJJRxhZTBmx8d1KLZcV9VD/HjhBVDvuHgq3I+dadUnHgf0qgfjI2Rhrnoa
         9DSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823391; x=1765428191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=;
        b=MniKv810hAriW3LoWZxW8LRPcKwvbyL5nUvBRYx0IjdArzs0BqppaUL5686Ajab0T8
         fhnGoqscCcTICyFKmgViZ1Yfio7FeSL9jPMYTTeAX7sFvQnwp27Fco9ctceQl5Zfs5MV
         rmyltNUUgs1WSPpQTGDMXA1XxpCdMgTfj+ttTgT30DsOYvQmrdoBsrvGz0DdtaxjwnpR
         K941vbYdCWO4D6swFAMekwRvX+KaG4H/MdA3zi5D72FkRP/ZImAysave8apRk2MuGKrn
         eGNz2a/xjGM3sc7RlTbDhIvAjcN57yyLi/dpm7P/hJBNqeoRRwosNNZ86W8Ovvq3HKPw
         InnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwZZ4KAz0a9zbcpHvRpY0EmYV+owmvQpvWMN2ieaBXuX0ACgovqro2N7xpM11kIkf99Fu8SyGjATqvy4uq5Uxd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj3RTlQr5JcBpeq6E/Xzvn+xGUh05Mm3pKkSA2Q15M/Ymyy991
	/g/CfNjN2WOvzuzoue0CZRgiYHH9DnlGXcV3rHuvpO90V9Ro1u2XaXuYYfd2A5LFXco682LaoRY
	JKkifvdNSpUhdASn0JCs6glVqbaT8Y9dKMcJwWSzl3daQ5qWX4S3oc0Bxa0RIemnwRQwhhFuu15
	7gJA==
X-Gm-Gg: ASbGncu27Uvo7pG4sJHoXAUX2ZuuOouHRrrMgHMAM0fWXJ5IHlZufZKDJSIQWELQVCl
	NZlOLyZYezvuxItTszvGaSykgVMe6bOXKdO/xZMvSCdm+lFyKQTfoJLUrBDNDe6B6UK7EWLs3Mj
	0lHd0MGteHPN3a9R0hKZHmlDYRXikLJlQMheKC9bx7P0dmShDIplmVxkMtaPC5Um708vOQZ1WUd
	acg8NqX4NKfC5tvVTXnLvSIZ6duvMI7KnaUeo3hRBUngiFn4+0r5dEqNzBROUKSt01j9fXdueYt
	lf2/BGBWd2jDcwdQc/zQSkJTGgldsRqYIhFoFA00qJjt95UId32BeJF5DgU2e1gdJ0Fv5Lyk024
	QN4hIJH6MtJcUtnO6hENXyjWwgIR7p4pG+7dkrK35/4Rc7HU+R8xfV1/LNMTkd1MkaaI=
X-Received: by 2002:a05:6830:82a8:b0:7c6:8bfe:f5e with SMTP id 46e09a7af769-7c94db3f05emr3514920a34.32.1764823390816;
        Wed, 03 Dec 2025 20:43:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW8gU9SGAOFqdeOOxiZRb+i9FiBVHJbuzeoo5KLUW+sLNoIN5YvCzAMAGiYHOOjWH5MA/qIQ==
X-Received: by 2002:a05:6830:82a8:b0:7c6:8bfe:f5e with SMTP id 46e09a7af769-7c94db3f05emr3514904a34.32.1764823390412;
        Wed, 03 Dec 2025 20:43:10 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm213766eaf.7.2025.12.03.20.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:43:09 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH RESEND v5 0/3] coresight-tnoc: Add support for Interconnect
 TNOC
Date: Wed, 03 Dec 2025 20:43:06 -0800
Message-Id: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764823388; l=2209;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tBet7xd9Ix+7i7/6lFaf25DY48b+0wTDWRETSg/THcQ=;
 b=liS7F1EO49CTHomciNgURMU6I8L0j5wX8w9pGISUp+pHU8zh9jliKXP1i3Q/dIVu+LzYg63qF
 fdsWJBaSSrTD9NJGIcf5f+naKhU3A72xiiuBMk9u1fhha9pKips0SdB
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNSBTYWx0ZWRfX7jiZ9fBg0RrR
 UpgBU1/Q1L0Ju3PBaQqmqbJ0kGmKf43J26J5Wqmfi3lH06cvc7W825M2+bpFY0UyZz9lkQpttW2
 78rOwtAemNmhc7TA0j6o5r6X+aK4s1zBvSHHw40wR1KyutB3gEcwgbv2fd3nRrJW/u2XRvFd1+U
 MnCiyEUZX8bHxwaTxtZtc611xvL5h5VonFypHNj0d/Ll3zywIgfbZBOqKK9CuWt02AQLsOw4g5L
 LrvovSwft7/9+zlVe0FO6Rhq/2YUKTe+lY4bTMrrkcJVx/DtWK4E7YmfhXn1kK+J2S0www+4Ohm
 q1+WYy+uB66PtqK2LfOWaN9QtqxtrlS/cUhBQ3dPT/slg0XH6SrTkDb6WwRfsueKl5awhEjQ86u
 C6cXyFzlwAnUXw3L5pY10nasGDkZJA==
X-Proofpoint-GUID: UCFlJ8x2t4B4x7Dgq1KG_OWWVSXJ-RF1
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=6931115f cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G-CQVniXWX8y_UMPSkYA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: UCFlJ8x2t4B4x7Dgq1KG_OWWVSXJ-RF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_204312_703342_401FD0AF 
X-CRM114-Status: GOOD (  17.13  )
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

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v5:
- Add the missing review-by tag for patch 3.
- Link to v4: https://lore.kernel.org/r/20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com

Changes in v4:
- Fix unintended blank line removals in trace_noc_enable_hw.
- Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com

Changes in v3:
- Add detail for changes in V2.
- Remove '#address-cells' and '#size-cells' properties from in-ports field.
- Fix comment indentation for packet description.
- Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com

Changes in v2:
- Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
- Dropped the 'select' section from the YAML file.
- Updated node name to use a more generic naming convention.
- Removed the 'items' property from the compatible field.
- Deleted the description for the reg property.
- Dropped clock-names and adjusted the order of clock-names and clocks.
- Moved additionalProperties to follow the $ref of out-ports.
- Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
- Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com

---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
 2 files changed, 215 insertions(+), 11 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


