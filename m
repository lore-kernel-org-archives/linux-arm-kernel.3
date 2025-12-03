Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948DCD1BDC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAL8VogV//KelnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=; b=qsmOwoDjFxxmcYFoV2V8GkJv2L
	vxCqKYJ1PrBHa62hp7jLjiWHoWtJXl5ZKDxdoHeIp1sKlzoFOagHFtn7fOrSg3WIjL8nZH6AVb5jB
	bdCXY3tp2tHp87Fg6cZSQIdcynkmsHb2GsM81OHGTp7RsLx0eNWqyQxhRVx+ZW5vP1vC9ff8rxk2L
	e4PJacV0GCMv4FvKrRAlcj/6/xj2JhjByLXV/Pr6E8ssPe+UneWZvY5Bt5/yxq1d8JIGia69jECE8
	xuRx/bdWe2cSbv0xC2LG2zz7JZRc+ib9piWbELwHFK/Q4nvF2BC6iZ8yeaYNb/ODSBbYFSZrTijjl
	O0/LTH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr8t-00000006tk8-170U;
	Wed, 03 Dec 2025 17:59:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr8q-00000006tif-0A4d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 17:59:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B3DTe1374607
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 17:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yAL8VogV//K
	elnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=; b=boTCbJncTmkJz5Z05YGhH3tfyh4
	PFoPqhMzNKQW7Jr8kEq0S7a9FxV0rz5qyY6ewtXZHCVAi97ENyCrDdog39hCkbX2
	3QiNzLYU23yxTIaHmy6aQdxhgK2d12K6wbgMazkTLk9IY2Qndx8xR1AkssrhDIqe
	3yO3U4MmonorDK8ogIcCG1RCOwwhWOq1kWLsRVXBDcY8Z1zlHO1Ihts3dM87uaN3
	WfJ24PQHmV4xfKB+kYqpWglKtEwARIPYm1DMRAtPKprmsp11rlQnvjDoKrSsx+S1
	csdVQkiuEImnG/v4EXUfft6h5dT3H2rSeRHHCgD6RV3YCdkRNZRvAfE5ujA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0b97sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 17:59:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2217a9c60so2110698985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784790; x=1765389590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAL8VogV//KelnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=;
        b=AlgpbDkDI68zbrqAbigKbK73sDVZhaf+GtNVJiRDdcQ/y8ibi2ftlYK/MpnB+aqV++
         T7lKXVrQzRgD16cF/EYQv2WXNirovG6WTtJPPDhiY5MFUqFJgcP35x2pL6//E9T20IEY
         klnHxSOOFKrc7dcXyAj8hJg1ociO9mw1FnLatBGxJ6zoOT7mdHy/hfQHcHXsApLeeQ9g
         180Q6Hm2oCwA1SOn+6aaniV70CC4kjaB5Af274vUtppwr0LoPNzjim+bSRCHFgJ/hldp
         1Ys8V32PAM+c3FdWGDm8GrhqMKL/C9Sc3yc1s8Fxs6NqhNIm3WPLNSZzAsChB4QsgHn4
         EiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784790; x=1765389590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yAL8VogV//KelnNwELfVxNaaor6EtvIB0pWxQsb0ZsQ=;
        b=rHtTR8+qULG/NMnw9mxmFVwdbCkypvT/5p/F6I7RpwAM3yhjK1ACwb5D5Y/s8bkDs8
         3xSYxkKOYuTb5BVaS14RBUYIleQQI5En5cVH6B3ryF+uHCXvpePWe8z0NKQKEOzQyLvp
         noHrtyckvMnvLNekzqRYlNdECdPWG01yrZmpov8RCHVLPkkd9tkAGFs7/aicyFT7nDMI
         CZLMJwUsnQ5lXMYZ9KknmMheBc2CL9ZMKSyeVjVoU1zT1ZeNf0fM+bvfAZzKJiMlHaaf
         M4DNw1eU3TkMsmSCUbtNnGbQcpR8cu0nR9wTcsGQeTQT0ChG6myi4A/RSVh2QJXWQo4A
         NFvw==
X-Forwarded-Encrypted: i=1; AJvYcCVMRFZFsTSHUUXBtD8eXF2Kw6RCKU4GOkePKXLbrY8QWeS7O1tBGN1Rtyc3vf30fW+ktLKTAqYLv0qfvdVCPm1y@lists.infradead.org
X-Gm-Message-State: AOJu0YyzZojQ+IAPqCh4dCdy0Lvnl3u2CcZQKWVfrQ4aukKJLtLq+Vlz
	yEbzk9Sjr68cJNhJYWnvO/XyeOmERZhuIidl44tHQdETr3DPsYQli+Jp1vEUKasBfpDKFJCiyiJ
	GeJKtfuZXLAa0KeFFDU85gNT2Yn4u13eJZJ5+1O33G2zUhnEEqD80DwPbOnfrZnzTmdLkw+SfX8
	OpPQ==
X-Gm-Gg: ASbGnctxupqiJCFZYTfGYBebIstaMsYEdMHgtix7U3aHqSUysAMTT5V8vu4VxjFdqqU
	9UvMxoFoYNyxjwvxOv8Bj3wGvs6pTD7iWPHzETC5oXkMVd0K/FB/aLCDOXnV5LSjofJHynPdLFL
	ht8kTk3sFIt4E6fbkrG32sU78NmUPvxwRSEkIPPDUBCEJ9hbd2YjQSa3WoP72hA1rG+m2RRE+O9
	ldUXnekirsWjYyjgMzwnZm+xRx09EMwDZx6/kW+qwX5+P+EzFOL5yDBhHT6K+epoV53L1b3/Kob
	GJDYRb1HbVBWBbT7Jn7Uo9TegpFf9kKe4pOPicq+tY06WVcAv3ZF5Hg8PohJXvBXZQFLcffWvj5
	Ku7jLsla5PyfKlmCz13zy+d5stw==
X-Received: by 2002:a05:620a:2699:b0:8b2:e8b5:1ea2 with SMTP id af79cd13be357-8b5e47d2c2dmr403590385a.30.1764784790564;
        Wed, 03 Dec 2025 09:59:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMqNQEARbZr9/oK6MMzo9BUY+5vFbT++kUu/tsZ7SRGCq15kGWqxGZNGHCNhXZ7PjMLuDsvg==
X-Received: by 2002:a05:620a:2699:b0:8b2:e8b5:1ea2 with SMTP id af79cd13be357-8b5e47d2c2dmr403586985a.30.1764784789940;
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm43022473f8f.26.2025.12.03.09.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:59:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/2] ARM: dts: samsung: fixes for v6.19
Date: Wed,  3 Dec 2025 18:59:43 +0100
Message-ID: <20251203175942.296554-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m+NCASzHGv8zbwfQcRW8e9SM38FnXWv5JTQtDseDbCs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMHqPNP34dvI557Hyptu6xyKt0sX8hkxyVjedE
 Odd1itsAv6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTB6jwAKCRDBN2bmhouD
 1yW1D/9IbiKc33R5Dh8VWT+9Pmo5NLig72GQbFRrfnt5zSv7alB/TSPA+FeC/MT+XwoA1NlCbRC
 vyuXHeeCYjl+93h7eztnSsHgHf4wqnykc0c6sCR72k47nYp0NK2ZZKqSkhi2RE6h+4GAvetpk3O
 EA8i70AO/gqMf8MBiZXieuOHIhTpgpN5HH/4qOVIZFjHCtRrGoUJnTRPltNflwKUmICW4L0RsQd
 4SawfPw3t2Be/7P4zbtfylAqEWILfFkXICqWQtVev8LVMyivcvDGv5Fqh/zBMLnnffqkElMH+h/
 UQz6I6x+1IlARp3nzKj/dKQuTyeBM9RA8l7CNfjhEIFVrwzSOTfkpl8JSyWlKh/lhi7i61jfyYY
 /N2o5DnDkgQYWT7l9adqxEmzWcyc/1GPSPAS4+RD+rOC1PiJkhik5dq9P8d3VhY+UlsdX+I55KZ
 dF5cum3CmfO4UQAzTaWZMkbda9TGVuzoS3kQJcmeMT+x+ZJ5dmv0xWQyVYccKNIikdDIneVHELE
 Ap47Zm7gTOi3FTX+WUmgur/PsCfDRhWZxK2p/BaiuVRTi/ZWIITMXkjaDxpfVR/21afDzhTxU4Q
 oewr+T255Cpc31MofCF3I2+gltpyXKqx5/t+eTbYWsDSxf1/8r6Ynnrcoa6qsE2uiTG7afYjw4S oL9ES9x+xhWZkUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69307a97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NxKsXlmia2VYF-03mHgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fg46qXFWWDfeDSpfwXEEFyrlnOKNhEAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfX6DykEF/F295Z
 dBbtJ13RNAujollOh/MEpBI/zTBIjiN9H3e8hV9W2okAqGBcd3mWxr/qUVkWuDJWBa1Fl0LOz4d
 4iCRbfZNCkMJt3wMlCHl7WJyiBONVu76ZORZAtdtBsEE9MX1th4LiHaN+MEfGBZF4k+LB0gWcjB
 jDMN0XqrBTI0DRfWRZV82Uqum/6pJ5k2f7mjevyHmFW96u7Hr7oVvkqSUi1hYijTEGFIL1w1WC/
 u3VKdiJLoVY9YHea3TvlSyEJIUk4fIQMGJ2ZAl92B0utJvuwoMtKORUO/bOt8T3gefgdp8JLNGX
 zB52FpHJ6H6zzCIcfaYT45MRu6BmV/ok8yVDFPOcrablrEYoDbCQd6HcN0WYzcc+VYPu5veJOL1
 xqmkXE/T1ksrFTgukD+HMnLRGn3n4Q==
X-Proofpoint-GUID: fg46qXFWWDfeDSpfwXEEFyrlnOKNhEAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_095952_079823_03155A68 
X-CRM114-Status: GOOD (  12.67  )
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

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

Non-critical DT fixes, broken since v6.14 by a change in brcmfmac driver, but
we noticed only recently.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.19

for you to fetch changes up to 2ff147fdfa99b8cbb8c2833e685fde7c42580ae6:

  ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend (2025-11-27 16:07:16 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.19

Fix WiFi on Exynos4210 and Exynos4412 boards with Broadcom chip after
system suspend and resume, by using cap-power-off-card to power off the
WiFi during suspend.

----------------------------------------------------------------
Marek Szyprowski (4):
      ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
      ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi         | 1 +
 4 files changed, 4 insertions(+)

