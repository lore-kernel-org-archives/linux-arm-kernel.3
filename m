Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A0910BA452
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQTCrz8f/s=; b=cGF7hG+I8YRkdYGvZAE10HIaro
	dR4MF/gbTP6KucFtKCBXTbwf3geFeL9N0D8NfZ6FpLwIBLnD5w6MKI/wazUeejSxTIb26Y+uyw2nt
	ofC6rD7GKCAPI3u9rpo1pmT59/sDqKWhnxy7hg9lGW73zEs5gYIt+OJDA5+75ss/2X5D1yoUYgoX9
	nRCLr1i/2deZBCQha9cZ+6RXlXqDQXX4txsRRIZ57gdSnQcVUeWYMNYX5zqSKOgXRolqqUX3FDP5u
	S1yNxbxLNpuc1DtvVYgpiPxREj/jp8V5ber2exIsybQZELsniUhgJzqaWDncbYbTTvW5fQAQfKxsN
	5BVFX0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62b5-00000006yKn-276I;
	Fri, 27 Mar 2026 08:31:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62b2-00000006yK1-1fdU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:31:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsVm1226369
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQ
	TCrz8f/s=; b=Uy7AWE672acoWX6cinbSAuztHNvJPClRKCpowSCnNCLUBbHmvcG
	F1mE80tU9xIfwD8ncG8wKq46plLIaQ+jvpXoo7t//71ImOIBvfQXJjFblaawf7bT
	Wy4/D7yCkxcGK7Kxrg07jOm1FWN0yOWC/82uSpXAf7ScdRYlV9ZBDOSBfBO8N4rT
	3p7dVZY6WzxLSXybGFiMcVbiFJQY0qZsriX26FEqs8cpBuxQySqEZZGNCbhMIVoF
	UqvaUP79JfjjMcN6NfH2HVSIa+ZBV1VREXdf3FYs68+yJtZOBFmdtBDM6bHBnwst
	mln6gmA5ARz1Q5k8e4sxzfgY6CCsgm1igjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1apjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:31:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0cac007cdso5937815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600270; x=1775205070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQTCrz8f/s=;
        b=F4Mq6d0m6Bk5QgxkMJsZvUkUinD6Fley74spZ6LdvEymmNKktue1AK7ntRrZLJxcD6
         WEroxMPqlf5jkfC18u7apqextRqT1DclBlTyDDviJm77A9Cvx47eWlEwJo5UC4a3Aq6p
         0SPBL1VNepWNjnE4LZugHiX0eVnQhlx77D2ZNSLl+DUZQlJoJfkOJc9nz9KVvRE2BGyX
         vUhe10oU1O2jAD7VYN+JhKXjmFufyyTq6oJAFRbToJVi/0P1oJwEGvv6+eCoO4IkFyrE
         VQHuRe0Pzp5GrF1qexfH6gVRcacuRwu+F+BzfElPa6cQ/SdPaqn44qAIRdyIvc+fJIyd
         7skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600270; x=1775205070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQTCrz8f/s=;
        b=ZcuwRDCrub7VBwu330FUEfrp1CFk2ccm5BgAvwx0LRnkNGY8mcSksHHrHGK/RcRXPF
         je6OxIzie9/oPHTUzXb4kX981D5FM3qGbznCmp5sHw9MtxCNs98/y+Lm4CSoXF8HpE/3
         VUioGcSb8JSuf5Ddn6tzxF2u2oLq92BIbgSf7R3Mw1XLMwyi5iampRqua46FMcoAd0/l
         XAc7Xl1pemRaPkfXBBVR0SuPo1aF/hBPgFHjQ7QPdrE/wgTg2UfRTKzSAQLfZvJ6xlzZ
         +U3hUxFr4gNlmGrNorP0NL5wPMWwzeBbkU4sHPEMfnBADN1hBSCmAZ2Thrlse1YM5AHX
         LC2A==
X-Forwarded-Encrypted: i=1; AJvYcCXUeXCeVe3vXdUMglV/b1fhp4ta1KjbvsjiwhYgNWKmapLcFvVFRQ+4Ygh0pKL9+s65Do3DgXlWUsWZUwBlHM/Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1E8RBcITITyY2V4Qz1/heNyRNekzLQ9HQmf10Vet5QoDYRvDk
	dw+nfjBzzVFWWj48f85SiLYiICS0a5/AgWoVZlPiYamQuGqzeB7tuIhpUSe0zszetek8Th4VPf8
	L9nYrbcgVgUDYXcM4SDsuIy73h1P8gCaWNZYoCoV57gpIkNwVR2O3CDO8MwgYsmUcpbawavl7Uy
	oFkw==
X-Gm-Gg: ATEYQzyCL6DXd/dSCfljY3/OnePBj3O5y4yunWlb+PrSqLgt3lX2EFayYgdQNXnIk5e
	dSLdcs8C6gmeLizIlWS9gygxo4BRivE8uH9ukYfeY5X5FiTsLqMX4c2PW40+2nvHceikQnA2ubB
	ipLZi3udSfasn79C8O2KmoxGy/WhLONMqWN9fKoi9gLRTYvGIPfw6+REimPxjs/rAOhrYpt2VIv
	9J4VSrDWShmtSUEJ60HhCU5drWtfV84jl+BgqX7BMSGZHzdiEFZDzO8p6y6TpGBzGi3ffDseUHL
	13dYvlXTnHp6zGt1LKWS5oytYzVe4CNe87ae1krrJ0bxQn0FJ03nBki1N9V0NCeNIERnJjbkmnb
	P9p+gQvi4r5vyGeU+gvS9dD5HevR98CFu/mDS2nukRBKiAcabfhFUyyTm+1E=
X-Received: by 2002:a17:902:f690:b0:2ae:cb0e:fd60 with SMTP id d9443c01a7336-2b0cdc23332mr18319865ad.5.1774600270187;
        Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2ae:cb0e:fd60 with SMTP id d9443c01a7336-2b0cdc23332mr18319455ad.5.1774600269707;
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: qcom: enable UARTs for robot expansion board
Date: Fri, 27 Mar 2026 16:30:59 +0800
Message-Id: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfX5qyUNqKoELAG
 lTMTfUOjt88JGhUwUmSMfj6EAzksiRKrm7DnShJWwFFQLYkl1OO1pIJf603I+hzQwDZ5vuqIUUR
 L+UvZ2U8arN5dJ0PpfgzzelubPn7y4iVlmC48ppyOd3pvAfa8340fego5lHgPMIK8OJjKSMFcBS
 umd6V1MdPeJHGEIu2ly3dDmyLhlcq7bku4ELEyVm9PEebGcxLWxr5EPXdmzx27LqRrNQDBgHoED
 VJk/lbl6t/nk0cuvoJl3FcBuDKZLjM2Odms5IhBBYlVP4CZhbJ0IFElgoTS0Z6cbJqj4Ge1Ba4z
 s+N/Ur0Yg+KC64x73enykZRAUFPmRLzbdz3R2e9phNEUvmAGJBao4idv/rBMRzVs2sE3G9giCoW
 CdkBvjSuUS6F9BxnQkH8q2En0/dKhv7/lPfj+9RsFDgzvKFvPPrZGZw+4E/mmg9ixG9u5tIBG73
 zRsN/HJk9d9N5a+p2wA==
X-Proofpoint-GUID: VQGothq37RaQbgoznmqpGIx9igBY6Qbw
X-Proofpoint-ORIG-GUID: VQGothq37RaQbgoznmqpGIx9igBY6Qbw
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c6404f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=x6rImnyG676cKauWAWQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_013112_621147_159FEAD0 
X-CRM114-Status: GOOD (  10.35  )
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

The Qualcomm Lemans EVK and Monaco EVK boards expose a mezzanine
connector used by a motor control expansion board.

This expansion board hosts an MCU running NuttX and communicates with
Linux over UART, with all protocol handling done in userspace.

This series enables the required UARTs and assigns stable serial aliases
to ensure consistent device enumeration across platforms.

Canfeng Zhuang (2):
  arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
  arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 5 +++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
 2 files changed, 10 insertions(+)


base-commit: 46b513250491a7bfc97d98791dbe6a10bcc8129d
prerequisite-patch-id: a877aad0127409ffea7c0a7411968d336497b035
-- 
2.34.1


