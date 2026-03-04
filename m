Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B442EB7EB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=; b=flV0wEZp//K19cdUgso2r7WS/a
	U/93anIDXukFfz4lmMFla7FmTlvIl8uOyLqL9wD2edcaL3FIj6+adzgcZG7gmax/7UBWWgTilkVuL
	NHvxucNkKWwVqJzXaeglCvO/U8SYHrFfs0dV75YhxF6uW4YcQVD3AfQYPLc1mFz1a9pD1frQsbK6M
	OOLKiQQTp9TVHtlpDP3rgdTvs1PY14UkjgsfIfQqwUwKaDKwXVYs382CveRsDpbBmC/C1fB1rZZKM
	xyxeLgvHuN7jvdOG4sFuChRySCpnk3wGnJj01nv2FfpC3HSugIcVkzc5sQNFawMl2cHGk4EcXdilJ
	gX1jHtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8u-0000000Gowt-2Afv;
	Wed, 04 Mar 2026 09:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8s-0000000Gorj-1T1x
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=; b=SpFv7UooDOJtYZKl3BPqeC5dy4
	iRhDdlJKRM37Ku7FoOYE/Wv+20/KcNH6IHAVdQI0xCsJ8Pio8PvjNeT2Q2vCSNM5k/f+JQ7sG6kc2
	bpyu5z502EFm6VhA8m+dh+M8oQ617mQoQ3ycTUhw9rqeZ3hutYyfY/oxxxfBo75le6wuomzssNWkc
	IsgFlJRO2nwXgkOqqCSinMIMiuJeE1oY8ekHM6aAtXgDw8lSvlvX3dqwVvS1JW3jR9XVpjPokAshZ
	YbP0q/H2f8M/J9f1p9R/QUd+oppN36rOXH3ZZgW/mRneGyiN1u1HsBIYW3KfZGzxOfTLRrWUOx4FO
	1mOIAeCg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8o-00000004CKJ-0jzS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245TGZt1679276
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=; b=Gss/iCg+rWOjO0XI
	FXiPOngq3YEIyQmyihV0ROxspnZCr/RZST8qpwokUZCARGNd0v2MZcqSg0NdflPU
	KtgbPek6xlYE0v2Yqm5iaAUuATqBTQBVQcGuHLEXoOqixaaxVkwdoPeoL1goc/Qk
	EBCDU6QbtqYmbjnruimWpk05rlzR7HSFB9Kz0WyacIQWoK4xchg/NY4nekGS0qer
	foPIQrHahLgMVT4qZjtx4adFTd/8Hv/LtVOiAkTNUYFdPeEf2ZzDyLmRyhpGK10F
	6UkSbMAN/pYC7L8nfVWPOWzCsuTI0OcapeVVNpjjy2W+CYkkxvaMcy8E1OGIf942
	q7/Qmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73ha5gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:03:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso1144704985a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615015; x=1773219815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=g4YCKTRLOsuzUsHfM6tKRwHV/3ezcWCqeeY6HTvLy0FoOrM8nHd/4X62z4GhHhW++4
         SdJwK0CrVOFLl2IxC3NXBvJL3ENZAHCj5kDDvGemtu+0mgw8X4mEidjyxFtEaF5ZsvUt
         Q9IuWuTIN1p6sOzgX3KF3Cmy0r50iAEOfn3xpN2FFy/Ve7Fcei/zaaT6TegkZjtN9QmQ
         Iu65CmVti/c5xip6cQdAKraJCdEkyJ+3QFsis4XizhnWBvrnhbAeqU/g5pG7eAmO0mvm
         pWnhClLMlGVsfH6C9Y0YmmpwP0dY/vqUmJ+eTxJA56MntuhFG3BbFsY4Lk8s37jIoR4l
         JRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615015; x=1773219815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXe7yqpNlx0nn9pWZexCvsUEZyocSRhg3uagVwfHYkc=;
        b=d/ebQ6A0AXZICie3RrxATitZsR8bLTxJinPhXRFTKraEPouBH7JgPzXtqRIUAotqbg
         MvYhoGq1rRyOlS4IlSyKjxcFigoqGt2wLTPB/O/5XWQXX4DAJsW4Mkq4Nj18BnCu3L41
         nwJqLtmLLUTubBkhbIuc/L+hEBie2tK7zE8GvaKDrOTeLciNljU/SAolOuZpGKamYWeh
         83v/uZc0qa6AL2CPnAHKms95j6EE0UE+fvg/OiFDpb1TW1oUhTB3KTL5FPUcTzWg4kJD
         gDGRhd2Ka9kHWjZNRfk8t+2pDDRjVamQAx3Se2ky1nCmbj9ph/vS46u2Mg/iAFETvCx9
         fTGQ==
X-Gm-Message-State: AOJu0Yxxnl79mV1flfa7Snz/tq8GS0F4Nl6eYRj2DNiZzQwES/ajM/7/
	rts/5rJuyuRQXSYe+A7ZjJh72bFcJyz60u09cwkRUuxBS8LvLW2NeJiqabtbytpNnnVTZPpNg2t
	XZ/4W9t9PfkmQ78b1pa2xoepo0T51QEW5SeCc56M42LQJOoaTVT5D9n49TYwraYo6seqqVAuZfy
	I0rg==
X-Gm-Gg: ATEYQzxAFjCa7iHgNt2L2Row376n72O1m8vpQmDciuQEz3JQdMf3KKYjjiuwWKoO0Xk
	6/LxXET3fAQiTk3xHrIumTt+4ybijhpwMoI5AcbxoL57up/L1IWrwybtuRFUpGDmZsRXlHAtLvX
	q6QqUorMo8H2aydaQc+1dYwDz7NkkacGdjIL+MkGB+18X0Q/AmD1STtHTExt+rPF2C9DYV00TLw
	HUxxm7RKkzMToiXF/j699LSP5woDgmEJigboCbZD7ItWtec96kc3z+SbljAuWxLl/qMJ+iM/PDE
	DixARa8Uqfw2hx1/ArtM8MoU4cBKKR9bXGmfTculnq2AFdI51HPOy4WGgsWgQnVQ/lEhMO/2U6+
	41jspiBidm33i07iuFCeUdz8GYsLJJwGhpGNU0IPCPwaNIn51YQ46
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160328885a.38.1772615015405;
        Wed, 04 Mar 2026 01:03:35 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cd5af80331mr160323385a.38.1772615014945;
        Wed, 04 Mar 2026 01:03:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:32 +0100
Subject: [PATCH 11/14] bus: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-11-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Yu8AGLKirVDPA2TPrB0ciJheoHEe4QHGDZcNV0GmnA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/U0GLkuzkdEz+C3tJvMp4AQ7C/WH2/5dCKx0
 BCzpx6BvgGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1NAAKCRAFnS7L/zaE
 wwhCEACKXR8hW1IiOwR5KrvLRZgVvnxKgGPrC7L6xvxbiMUnVqeZDdh88R5a2U1Wr74IbeHLexp
 rrr50hvFMkPBnqhcQUtaCGZFk4/IKdKBTRif0xGrxJPtzugQE0tbQJj4lG73Ur+ncT9BoVtw4hp
 FsLDV54dVcPs4TKwLyNm+WCt8rpMjkD/eXQbVEZrw/xKLWNEZX2oRJo+dAPmsuAOr6paT48MdnN
 94Ek6kcqmo9P7VNgd7eTUikvn5ZQgYLs2gJyL3S5zXxaM7zGsEuE3o3qzVL4gUdOVrHxAMH3Vvr
 wo8TVnlirQfO+VngnItzgph3Ho4ATc95hFNirM8vjoCYiKifg9cziAaa82BZJmGJ43sIM3KpDEF
 +B6l+y/Kiz0jWsIyHHEqWi8ZrS34Y9hvIaP3eMMQ7OQpykM8x8ZbZRBd/sbK30im2Lx4fQ3qep1
 3DFSIMuHYg5sCKcgHz5zat9wm/aWg1LRmAohRvpwpF7dIsvpMDjrRDh5uQ9ryTHDRC9/3Oq20RI
 UXfzyjkKqs76K/4BmBISIcEVedtzYk62EOzPQ6hQLumZHoD8Q+OB1CeFKHjn7rOa2xQMVjeaqrS
 HsXOM8riL1ke+k9oIyQPPiwLnwdIqnDlE4yYfagLgPQTn81GkMlMuuQ9AVIKf2MaYI34UwFxZiK
 rwNRQQIFnuJE0Kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: WotPgVDfRRIOThCfyXmgtciviUE4pN9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfXwcEc2rOxM48Z
 INrMlAk9w7NubyyZih+HtnhG5Fm5BNFEQP3FAR2yEtiIohZOseS8ofw4AylP9PcsZ1NylQddINo
 lyw++z9aBW2HrA7vxRVQqxcuE9Fp656QyctG+sOCRW3nlTn+hjaS5XJm9KIJo6dc4k0fPNe+u/b
 nhxD583tB+ylAkBDP2uFLByiKWalLuXuJ+Ny2UzLSqJuG5jZeqGp/0iqgMeK3gRxk8+IYFhXJtp
 WodPSlTokwD3xR6wNSq3O1DBZERd6hDiHXRIaAHoB3nyssqAYc2XMZc/ahBEesB6sJSpEMpAZ/x
 ZFv2TS3FeifWO8jbFKwYly1NdSiHj2+zGCe46Q60EAFHhMcbwSa+kOy8XWp2Ye6zqzDto9y2wc2
 w9oG2Y81s6DtKe7I6gFsGNWQRmJji0RqCL4t9VYmp67lqHTtO6WlJQKkbj15I5NG06Uu9UJK8WJ
 jqUxQyo1561YJQSJPuA==
X-Proofpoint-ORIG-GUID: WotPgVDfRRIOThCfyXmgtciviUE4pN9n
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a7f568 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=myaI65ZsvjZLdZNFwr0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090338_684519_50CEAD92 
X-CRM114-Status: GOOD (  17.89  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 2a1b46f07080b3533a9787254aec2e67cbe98310..c7dca0b5fb857a263e1ee730ede6002e88c418e6 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -236,7 +236,7 @@ config TI_SYSC
 config TS_NBUS
 	tristate "Technologic Systems NBUS Driver"
 	depends on SOC_IMX28
-	depends on OF_GPIO && PWM
+	depends on PWM
 	help
 	  Driver for the Technologic Systems NBUS which is used to interface
 	  with the peripherals in the FPGA of the TS-4600 SoM.

-- 
2.47.3


