Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0BED65526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dOceBZo7Lige2wxbRvG1+YEe9PMsaKngRhKApDOgGS8=; b=gDewEsbJ9296J1
	PMILiN31LJOPnerpKC/R9lFwajuzqArzdezCwkePwc1gwUCTrqecqLGjAF1jR+c11ya3bMmbfiWpX
	kQ82vvAXxBMEvP+VOGynryTErackpCkC1904m7Pzdhi4zef3UlqLi4jVHaGj2vV1Gzk/JTrv7T9rc
	NtP9QREwu4zv7FZ5c8w/bTOqUIPie/hcdSPO+M+/6rNUptymB68VE6tkJP7AlY3f/2U8A1rtqJ2GL
	OYToqazW5L05By7jtTR1j22MK63nf4gofIHf2If+2txih4zX6IvMepKYbyxjS74k38gsX3LB5IwEx
	O0KDYElW4L8oeMwv6i8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCU-00000006TD6-1OSr;
	Wed, 17 Dec 2025 09:52:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCR-00000006TCK-47mf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:52:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F0be2023761
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dOceBZo7Lige2wxbRvG1+Y
	Ee9PMsaKngRhKApDOgGS8=; b=b3QdQmDqNVBReu0yiptEhsaXofZdp1fsuHWoK3
	ge0g9/+8iBWhA0rzl0RmCweG2k1oBtbdH3oeGKe3HoWbsmVmec/sE3OqDNbJZGTY
	gtlj3Stf8VZtvXd1p29jXaeuzSOBCKCImdg9KOUMla0z+Hu3YCMVwTlyrIqSC6Th
	RC5Ve9CJYCN6U3RfRfbD8oi2tjihDjwBEC8P9G0VvkrKFVZFsd6Yx6Et7vwNmwCa
	+fVvJ34rK0WG8HEFxaIyq4I321IEIcHgRNnp1Ea92Y77xD4Zs02vDfxWMYXhq48x
	b6HnIE+e1ASEYvCPdGq2G/EdIHtsDuJraEFKvG/Gpi7wLLkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39hj0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee16731ceaso113481241cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965121; x=1766569921; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOceBZo7Lige2wxbRvG1+YEe9PMsaKngRhKApDOgGS8=;
        b=UXbmKIhxhtrKZkvzNS90Q0/cM/hfnBCq8oXBvHawx6yYZncWhLLSnW98tDj0mSJapk
         J9/m3skQ4pe+KnXpO7YG9pvHsQqfBnVC6rO6z6ifwma+DNbXQRyev0AhQAIqrbA1AfOf
         8ZgDSv28LjJJ93ob+CQuUdCUzOEx14D/tU2S8E8OauudG3lNeNv8EJT8sdISznnh+qBV
         mJbsp8I24Te5PXRzMzEzrAPMkeLAfKFpjFqhtXAaQC1oqEd9bHCEOPxbk8wblOTnQ34r
         8nX9TyofLL4lHApqAoGDbc1LPRV4s6OncxyBuj9/QLGNxAxo6HADSFbdIL/Q6wikRwog
         GQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965121; x=1766569921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOceBZo7Lige2wxbRvG1+YEe9PMsaKngRhKApDOgGS8=;
        b=k6n0b5/b0/kobCxtn/kQJmjJ5LZcsvJty8pPCLFxYjRe6pwZ73NF3oAM2SWG7qtrJT
         zmn6DCSX+UFNg72Ewfu0vQ+yh19vmAWhjp0vdth+NiNmwZtn8JfTJA/fVgBPE3/HIgzh
         +z3ihQiv2w7qNAhEE4777GR0yWSHZxgK8goZ4pI++Z+COZGBsB+kqMMB6qLm8Mvvx7d7
         y+E3GLPEstneVUemeIHO9DOvnpszpY/o3Lr37b3cBaK9K18jLxU7BOysctugyp/jMVky
         d9+EDVmR7t3yef6ReaLsAZpzNjGDBMj+sI/JmWFlFBAYVN/s0KTupKMA1iWQW4sY9Vwj
         L/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWH/L1r8wGLXhluXQWUPMQPh1SxEN3nmqAsEY5/SEdzBcHiKdWupEbmRJmORPPyNYr3oliaCgdZEKcjyq/X4lOx@lists.infradead.org
X-Gm-Message-State: AOJu0YyHh25VNOBj209U+x2C0pMyFrKMOGUq4FbxFzUltemU5AzHpHZL
	P10V4XkknaOKXi624ar3f21AeIZzfMqP6MkvU9VWwdRNiLpDE3mTlzSqb2iefsOW0UbsxAKR3S7
	u2nTk0i75nKp8uMliCwD51SagNx3yFVLZbs7r3n8UDnI94ZLdWDJjKn8gYXZDC3r81c12D/ZPPs
	CQSQ==
X-Gm-Gg: AY/fxX5s7ITO5iEzf1cxd/eMrDuvTJteuQHDkur9WRoThIdsSZXg/PAsx/nzAXEfvaA
	T6B+y3C4Ao07F76zKqzcGutR408YuO8+GU3qafTIFQ7i/vO1rZ71cBjosQtinUk+M/ckf7tzMaX
	QuLtjm4x4ryJZ7JVZMw4okh1N7Vp7xDeS3EQEcm87MIHrtI2IJdSpbMT1GbqL3Harbj2O2ILaj8
	ukhql/qyBsaXIFnhyu4VxNHbSYQsUAdS99KYyubqFV6s259WH4+186Ur9y+H/MGGQw+DwJfwm46
	SfsWgvpyfOiVNzPJPaqRDDHRgzCmJ+8g6u+oIbTHRI33VLb4mgJpeySEPcQqhJiY2ekY6WS9Lcg
	iopNvEgqlsl4H8HymhV/9LeLQUdjJ+d8+
X-Received: by 2002:a05:622a:4a89:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f1d06320b4mr257582271cf.79.1765965121378;
        Wed, 17 Dec 2025 01:52:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW5O1g8WvltuNum/M7cEnhFa1EcdU8QfUbnfhuoRsT0cINIuTq7Qu/PNM30t8RgEV9cpZJVQ==
X-Received: by 2002:a05:622a:4a89:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f1d06320b4mr257582131cf.79.1765965120963;
        Wed, 17 Dec 2025 01:52:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and drop
 S3C2410
Date: Wed, 17 Dec 2025 10:51:53 +0100
Message-Id: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl9QmkC/4WNQQ6CMBBFr0Jm7ZhSJFZX3MOwmJYBJiEtaRE1h
 LtbuYDL95L//gaJo3CCe7FB5FWSBJ9BnwpwI/mBUbrMoJWulakUvmhxYxcGTJVDNzH554yuJ21
 sb6zVDvJ0jtzL+8g+2syjpCXEz/Gylj/7J7iWqNBUV+LbhXRp62YSTzGcQxyg3ff9Cydzti25A
 AAA
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=I0XGlhNlBBsl9vkByyjMxMD0C1qFTDvEIM47UaNKPiM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn07tdxZryfaFCLlY7XrK6B6l9O/jW0GBoliO
 i3wC47HGDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9OwAKCRDBN2bmhouD
 18R8D/9Rb9xm3GmEye3zHH1mOMF/5S+DhZ+qU7E++Q8fo5BUovLldcY0Q/NEjh5unr8MB6CwLno
 P5Tcat0GRosyayr9qk5blbuuD2Xbgl4fXT8R43K9oTMEQckYPzJi5cfUiURGMfElnVQ1NrYvS74
 el9gHlk8TW44x9h8WZvLg1I7xzei6mDKd5692aWdEfvMHJmTBzbOsNTGRepEhipyDD/0guLr5Jg
 xANui0I6Q0M8f5t8WtL0hbLoIjQ2Ss7lDuK6RJH0P6Q6usDwKuLhjCJn9YYteA/0LUcvOJP/hvy
 C+FUP2ycAIqetuf9rc/36nYUflFWzrMUtDINcBC1qJsYOvPvfHe8GZX+ET8mPWG2uGUenluo1wl
 VoDOTY12cl32oEH7VJZeq72y4lYeHpUhoPySSwglulaTnYXDtY5hah4uzSQB1by94FOpsjMPrir
 k2OEn4w5qPuVMmd67xoAl6CYGDnLL6HE0ii42XGnjvqxgzOOpFEXs7grjupjGoSV5WayztaMjsw
 W9pZ8eEma4N8mBcvOmD2ivip48x0fdmlzRp4DtzO/Hz31WahIssF9WhFFrmwHiVZryRrcEt8KKl
 Ug5+1LdZR48sVSnVtHVTWT7D2QljtlmxtiA0pjxaERe8KecVaJDvlYg8vjHxch02bSUHWcuRtNY
 VIXNSvKzR9xXnBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX2KZY5hRWjb/U
 SL1NLHojLCtzd57ImHmELz6tg2Q/JLvbGg817mT893IKwqoq+ocMMkMkmCsLyJOvmuaAfJrfqxK
 HuUShdgOQIFVa//g5QJv879Mz+M2xTjBGwgyFExP1vhcjzPhAGY2SsIUdkL8UU5jJCNZiAyoSjw
 2Muuc1R7hrFEbvC3+k7a2t0kDYQf8GhKgce7Zrq0mjOVkLEdcaSHMLCoW+Ow6H7HBb56dDc9cqm
 lS4q8+PGJ2XHAJNEwC+L1WXR0JhqY34SUggeDkrGe2HRq1lDpvfxrjMIqxiTwxx9r6VpulNPNGN
 jFQZG4FWIFvUd+Gl+LoBC7dJFhCMN/NJVhiD5CSMYwi2hR6kthw/Xs/l3GWuR+n1YPk7GEqb8Mg
 Ju70n1SXFj+2zA38mj/NC6GKikk2Cg==
X-Proofpoint-ORIG-GUID: 29Pyv51o6B09Fgs2D0-9VQ8iV5Bga2IH
X-Proofpoint-GUID: 29Pyv51o6B09Fgs2D0-9VQ8iV5Bga2IH
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69427d41 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IkrQgrjNrYqhz69tAt8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_015204_149227_C6BB9C46 
X-CRM114-Status: GOOD (  10.54  )
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

Changes in v2:
- None, just rebase and apply tags.
- Can this be finally applied? It's waiting for almost four months.
- Link to v1: https://lore.kernel.org/r/20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


