Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09545D64093
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iW9wZaWu0n+wWXjapGPyksjgNP59SZ0JKHgFWwFtYnc=; b=i6vRj58pFDj81qxBG6uTlJmz9c
	OyIcmr4xG7IHB4DlcYG2sv4oSsT8L6HrT6SoySLtVJxDwPo++cH83goATbdaFUD4DKdGql63fY64/
	QgTu3G1ypbLvJ+/E0hE9H5OeS14w5uPHuN2tWSmXDzo/YNcq9UeLrArocabAhuhSQMc8c/1tMEkLB
	TwhB8V/mc0TwQDcs+WnYkV/7rTMdaw0amHW8LtkV5nHXEFOteT1T8ZQtv49O+t0nFxOzkVsAr+U7+
	aP2bxw1uop848WdfCb468/6D06JZj9JlEq2RuIeFwrevUQvRMRhvBol/3gP9rjrJ9v2B7sjwnMRox
	vqAvI3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnfo-00000006P5F-04RM;
	Wed, 17 Dec 2025 09:18:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnfl-00000006P4O-2Owq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:18:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FKuV1215349
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iW9wZaWu0n+wWXjapGPyksjgNP59SZ0JKHg
	FWwFtYnc=; b=mAqBTl5t0c2GZ9tM5D7wGlctBgMNnWEyYmSRMZ8ng+V/7lMsi+D
	BDhpISb66qWORvC0uIQXtKsWYGfzGAr+SKwJTWQ+a8LyNFxh443w9WdB+zu8QQ6d
	FPz0j8+5u07A5XgDzF3qNKgt4CCDnMUNCl2TzS4E813/Rp1P0v1h2U5e/oE+obF4
	7RF6PQ9By7SlxGY5+l31UQ6SgkArDrb7elas4ZvxTNYdIkz/KyXSpTC2Qfw24w8u
	k1FzDH2P4VY8xv/P9pnlZIU/6qRQb0CThZGZLVZ5QTIKJaVuOjngtJGm5dJshFGV
	o6zLLYg20elb6P6QA/qyKQ726cgPfiuG7FA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g2ntj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:18:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1dea13d34so96681191cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963094; x=1766567894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iW9wZaWu0n+wWXjapGPyksjgNP59SZ0JKHgFWwFtYnc=;
        b=F1NJQN8rBHF8JBPXuN6XpAfhNBd3+nm++tp1LblQkvpDOmTVI5RaUq9Fe9NdMqwwI1
         WEXjSJhcNITV8rTAiRd1LTB7fJ17C1DfE3mIe3W0mBfoKwoLUmhyv/SectxfubMszbzp
         YyaBpPZ6k3YRQR/SUv+T0gnhlfe++9NP7KkpF4nJ6q8KwbpAG9jgbNCqhbizDxKLqSf8
         hNmxUYuAN3x6ZpL8gFoZUFa15cm4gPPXvd35NXdLHqZ2Ew5lxgDF+bt56fMKJLHJ/M5E
         FU/1ST546rS6X8Q7Z5AIo8sqbdJsajuMBE9pTqRsSXAT2DQdNGmz+nIoyCWoY5OZrIJO
         ekJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963094; x=1766567894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW9wZaWu0n+wWXjapGPyksjgNP59SZ0JKHgFWwFtYnc=;
        b=RqzR6jEy6Wsu7m+DY6miXBGpYX335B6iBFYm4sT4jvVJ5SABqqq7WPweD7GDIxtFNT
         QZjqhSW4pJYsgb5QgONIyP6XzaeTWNefoYZaGpaN0/vuJJ9P4UxF7xXh6EMllLJ0GIRA
         mtxkuQAQn/gubc6OCXY7aSdQi0KlGpfRbTY0UnWVg3NrrFubdeY195cvN2oF6Tlzvioh
         yakYKHM+UrBId9Qt1MsbTTfBwNYVErpzkh2z6uvxmeQnASteeON9KF3eqnEJC1unewfI
         zGX9mnHtYQ8+0O+6hWxlSUrthCuT6q5Oy/TmHb8EJWj++cY+No9a73Nh4GlP+UBcpYYP
         UQIg==
X-Forwarded-Encrypted: i=1; AJvYcCXWw+lLWQ0Po+wYNQx0984C3HJncptu+UMTUDdVUR+A7qSuQ585ZBUYSRFBvfTsBGitFrPlqhRPWEyLcL/Bs9A8@lists.infradead.org
X-Gm-Message-State: AOJu0YzqfMm54K/kqTnzA6CCLpJGWPe778pP6qqsdFqAWbjg9NG09oPF
	nWYpHVEC6DjJGo+AOaGyzScC8G6oKYW4EeJJJqfwcf5JUsOYhcO3OvD0TlDxWXmG2M4TY30VvKd
	cyoJMUVOXvUIYmB+y40sNgaEIrljSofDW2l1iff2f6UdKgodUcBZLhHDguY6vErzUMdToJIG8BR
	8HRw==
X-Gm-Gg: AY/fxX4qhehC9gxutMm38P3jPQsaznBG0bW6oiTMBsFIfwMO58hUzOkCy6trKRZrfXC
	0YqZxHwp9ZvGU6BsZO6ViLXKHO3JxHhMnHBftPZXCOdly42i4eeiHPRq9m7ScZ440ogEAr3B8T/
	vDBaxvizC9R+m8+idN4UxJaKgNFN4BlBVsC4oCdzS8uGjp8gyMRA6dlAfGp8zVk6oZ/W8kYxw4c
	YXLxLxAm/t2OL312qiyV+5ji4kClyAvuUNh0/1GKt6eTZrAFlpLmq5h6G7V6Q0erV6jqJh8pkeD
	2aF74eIExVzDxSaPRRF5sb9+ONnAvujUSTWh0+KBMHYNLqtQJH1lLslHyKSTxSAEZ0FFgRd5TBJ
	aJcPJet8M1Xe078inLKHB/BKu
X-Received: by 2002:a05:622a:1f88:b0:4ee:13dc:1055 with SMTP id d75a77b69052e-4f1d04a5c72mr244396871cf.3.1765963094253;
        Wed, 17 Dec 2025 01:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtrR0dfojc/ThO1CYaIhIbMVYq7VrKAdbcV769jHmAPjb4iV4IyeMoWNOQ216/0hFUXszc4Q==
X-Received: by 2002:a05:622a:1f88:b0:4ee:13dc:1055 with SMTP id d75a77b69052e-4f1d04a5c72mr244396571cf.3.1765963093762;
        Wed, 17 Dec 2025 01:18:13 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd9965f70sm25297475e9.19.2025.12.17.01.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:18:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Hsun Lai <i@chainsx.cn>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable+noautosel@kernel.org
Subject: [PATCH RESEND] arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B
Date: Wed, 17 Dec 2025 10:18:08 +0100
Message-ID: <20251217091808.38253-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ZwxAd22PGTtRaMdztqC7ee+P15PZUdzpFtZpjJWf7mk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQnVQJOZRK7WoSSCXcBvccA+6D7B5RBBrZFJXL
 4C6f9+Y/NeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ1UAAKCRDBN2bmhouD
 1+HhD/4sPPN7zlglH9UDcsI99AT3MQQolUFpdyiyOCuu0AKcWNv2AhVTDLo61shgrGkiN2zVcKs
 eSOIGQ1x+4K+1dJWrKfQjy3QGOEhNLkWlTKecc6xLzpVIKYDTC4MlzFma2wgIXZa16QTFNRzLmF
 /WkkHYBdhFDpVB5So/tH8lGdKtGcCFnBBu45/Axugwx/IFfaULtGE3Bs2FVKK0vKCoV9pnvlv3f
 7/T8afM+iwObo8hdeqGS8ANfPxWqOPem+00GFZjCY6Hn4LqYZ60J+rqOTe/vQe5AzvqwSYH1z2r
 FyPExejpMgwH3FeUlEMS9thHB51FJ+eniXGbSDuER6XIARWuCrGSevA83f5Mf7UC7933SaD83q0
 J/bBTp/A5chnZ+8YzmzJ4UfdWvVXujBoLKtBBZBN3R3/+3NAVjR/fDy0CUw4C9Q6IZaNiv4/Ylu
 KNCXRta/IPBe7j3oagGXMAmf1+UwgIrYTlhdMiOgIZ8CeW9Wg+vmaRZ8qTlYRffZLVoiaSUqnZz
 /u5o00ARb3y+zoDYEnkYKMj/GrjznBk4voRV1ujAYo0XUki3/1lXO8gPQUdcqEUf93BklaqzFBb
 K3J1+1EVxCfkiuP08ksIFzLIh2AHNiFKXXKvlnSyVk7RTUeYlg9EFJVDGuRtE7Vo71DGoDLLKzp fLEz9Kl5Y0Z3YTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8_ZO0QG4bu3OuaLxNdmk-eipbbmQvGo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3MyBTYWx0ZWRfX8OcgVxE0Oom2
 o3Yn9hpGRrSMZ0Ryb7vu/3i+aRV8q8ykkbP++o3Gjm/cZIBRZawwH5NAi71eaQF12BJkyMh2gRi
 1l0sCuv/bNySKsJl36MhDQi1AAzy0hu2zRDhpIZ0nnJxchDUWErmFJTnPrPgQpvq5se5VOMkuPF
 erBy+BJrPF8nm7K0sD3jgsgeEqCnrZ3RjLzFjl9EvzlMmnm+2KS4qBDKhOYi9+sogQZFgOCAYY5
 F1eTto8f8n1T61QQpGNz4k6CfPCQZEQ62mFAR2fbjI3tjakbXTCAh2wobiInwJRI84ID8dkr0vx
 +aYAIpztFtQi5326fq9S8FebVLd+AmY6QV6/NMXEQbjGUjVKgJ+wPTbJjAUXbrM8Yc2KpMQdNO3
 yxCxAZ+o7mXH0/zOkEDL0t+iRCJ1hg==
X-Proofpoint-GUID: 8_ZO0QG4bu3OuaLxNdmk-eipbbmQvGo9
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=69427556 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XBPufoqijqhy9oh2KWMA:9
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_011817_718341_9B8DFB03 
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

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: GPIO_ACTIVE_HIGH = 0 = IRQ_TYPE_NONE.

Correct the interrupt flags, assuming the author of the code wanted same
logical behavior behind the name "ACTIVE_xxx", this is:
  ACTIVE_HIGH  => IRQ_TYPE_LEVEL_HIGH

Fixes: 79f2a1702441 ("arm64: dts: rockchip: add DTs for Sakura Pi RK3308B")
Cc: <stable+noautosel@kernel.org> # Needs testing, because actual level is just a guess
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Re-sending after 4 months:
https://lore.kernel.org/all/20250818090445.28112-3-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
index e5e6b800c2d1..3473db08b9b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
@@ -199,7 +199,7 @@ brcmf: wifi@1 {
 		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
 		reg = <1>;
 		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PA3 GPIO_ACTIVE_HIGH>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "host-wake";
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_host_wake>;
-- 
2.51.0


