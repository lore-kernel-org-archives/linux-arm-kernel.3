Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECF8CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZdAtV2YZsBb0hQKMGQt0w1Ml8ZD/VcTTQjpNBpL6SU=; b=dYuGVvjuxIaAZG77wJaV00ryQc
	vpwOuizSBC8fHp5cVk+Xuu3OfKyLgvSzEaLFJDpqJq0dDXhaK71e1Ku1ZddyKSVNapZXUcXmn65+r
	djyQZoQwC1k8Yucrvle0xkAzgx4EMipzARfhcdNnJt9JIw6Q1uzUwycVbxLcuGvWYtqa6SHpoNUik
	R7kF+WFE1S7+zIsS7arh9b1hICT9ds7wy9pVBN93O4l90hjuRjMgWi40ht2YsTF7nfCLzyA6yjfGj
	TZwkSIA2H2gQQWO1fVbr96B0ellv5TV1tH5nE9ZsWS26ud6rVR1T5AZSAYbZZVBekSCNWVjsDT3no
	CtKrseeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxb-00000005UjM-3Ihs;
	Thu, 30 Apr 2026 12:57:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxY-00000005Uhg-3ukm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:57:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAjR0g2907478
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZdAtV2YZsBb0hQKMGQt0w1Ml8ZD/VcTTQjpNBpL6SU=; b=huT4BWk+ZQURIax9
	z2kSYBLRdcHGQXwEisMnn5JSkee1w/VC8q+AUabNFAxCOZCm5BiTKekgwRXFKsj7
	p86YBfHWhROLXtlgFqnguDliCGR1deblXMWaFVp5r5eSZaHdNV+SHrj4nRHge9lH
	+TB2zMWnh2OnFGc5I7EBRlcm/uHWnRry4wp62qrwD/fqnBHAsDVExSWJhSret0Q/
	QMvuVH2XjiLt0wUkjaCFGz/QwjTUZukc7sTXcIgmk45Cq+D6Cd8FfqXwblCldSjP
	CSx3CY1E6w9xzw+35/uZEU2NYoE1GpTi86wV+/GFUH/r+XR6gA1E5BNVioDqafcI
	Vd0Shw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfa248-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so13402781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553859; x=1778158659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZdAtV2YZsBb0hQKMGQt0w1Ml8ZD/VcTTQjpNBpL6SU=;
        b=Wzf6yczus1mffz0YQRMnlG9ZwNIPhEcg8Q1WSpwf5HnnY5MrZh+x/7bFu5oAhvkjCJ
         miULTX9077MQ5KR9qlRCx7z5qZ1hiE/+Uy/FCXoT92d+QcyVN6aSUTT2UDg0Iq2W66vB
         e/jnjbA9KabCT9z70CFcXH7dxoARp++U+mIBfLzS7QK4jFEe4sU1jHkAc5/+0lup2fuX
         hT2IPP2MqFLSgv8gcisVmjw/3k0YW+0q36YPe2JFSFiMp/TcCwbZhrcR1igSk52OlWnQ
         8uWIBYnEZxU4zYGiduwwSti41NFoADZHSZJCiLkagGc/noVFuf8Z+dEBp0qOYNe/EwFS
         YDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553859; x=1778158659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pZdAtV2YZsBb0hQKMGQt0w1Ml8ZD/VcTTQjpNBpL6SU=;
        b=RtuqosedyNFwP7QYg/dIIGIuQwYEGWQm7zMg5Re1egXFt3YFDI04hewN0H6GMQgkXG
         BJJhxu2qWUE5ko32yEbkSXlG1AFOPNvN7w+fihsdXExx/WIMPam1rTnKgmI1vCD9NCIX
         VuHn61eJG4iAKiQz8NMgIE2HZxHxES+cw5fxlBygwTmu8C+eMkuskP6aAN7i5VzJ1K++
         z0WQFS0pDxpO2iWzVpYus6gVtG7vH/VTL8EuE/odDZm/mLNP/sue4fKU3QT17/TGuKti
         eJGAzuwVJDYnMluG3QXJ9QyQ02dPkMkYa4jh7m6yWrnprQFI7If6LlFhLOCT406zmfqu
         zsow==
X-Forwarded-Encrypted: i=1; AFNElJ8mL96Npit4WwPQglRVTgJ1AARs3F6zF4bqebKMDamz+pjGW4zQOdgMLLmDpsoBh7PAew2JdGMFksNbippq0JzX@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmKAB2wThUfPra4z60o/xFvyNAsGF4V1A5Wa0iDKKIOGW9gNp
	CekDnpNQRJN6s/nwsCJEyQXSJBZtB2PH68dEJulgUb5YSRhuoxbhq0DOnvTb+d0LMYmxJmgyC/9
	WxBoBFptZ7cBSXFEzVHYXNZk/PZ7jxiYJB8sFEnDmXe59zEdNweVKRwLqvqCmtQE+TuF75z3s/x
	xGlQ==
X-Gm-Gg: AeBDiev2cE6ApxaBQril1XMQEQONuTBVxrhhJeaeRDHcgiJt5K0NbkUtSGhpfqxDE//
	VpdxIST+CWExaKVV+OCAbAafPPU1likB6oOcV+WQFZpjvylPuBvVloK4CCOA8UPJIrr7UeIkIBP
	CKArSeHaaJPnrcHHSTw520h6d13Zjy5Px55fxEffp+kEAx9KdQKZ0atbQnmZ12KGbVsyiXP+0XW
	urGMXyaoTtA8XeuJIsMADgYP5Lz83bBH9DEDyKdMUh9UPKT7TTKPdtewynoxS8ASKY/a6S6mmpM
	9nHDbyvj5r1AUxJGx7zXkD2qkmgUa5voWKxSguWMTqt5pdJ0gQMU1JRledtMWBZx3hIK2RN1LKz
	ox0hALtW1hsyQyb6C3hGWoUAyqtjO95c9LNp4Yb4tLzb99qtdJKIJgOl5NkxbpA==
X-Received: by 2002:a05:622a:1356:b0:50e:ca38:e220 with SMTP id d75a77b69052e-5102adff28dmr39936971cf.45.1777553859400;
        Thu, 30 Apr 2026 05:57:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1356:b0:50e:ca38:e220 with SMTP id d75a77b69052e-5102adff28dmr39936161cf.45.1777553858768;
        Thu, 30 Apr 2026 05:57:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:20 +0200
Subject: [PATCH v3 3/4] ARM: pxa: pxa25x: attach software node to its
 target GPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-3-5142e95f0eca@oss.qualcomm.com>
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
In-Reply-To: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fRUFhZvs9BFNojESgfGSl4j79htf5MaPeOpkhlIGhsA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G6Hc11QA2pqfvg89qy6KZ8N5nAcR0hzj92F
 WkPoJ6UqBWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRugAKCRAFnS7L/zaE
 w85tD/9a65DSS/d1E/cNu8ujITQPYlKFFSyHz7++kViUZGR3Vi5oTWwQCUCaEICfoobxP9/VHXh
 ZIFeeprix7a/LfsG8G/Z0tnKh5yIQutno/xHw/lRkyPi9jF9xUDoOaJGqCcpdTiFYElOWBH9cvH
 5oyMe8ynkGumU3zKXyf1udvrRrQ0OEfNUECaMosvF6Ni8SQAonf4oMsLxJh3mKRy7u8Y/xUvgzu
 0klAkbQ62UWH/eWSLrYUO9cx80Lf60zd8JOL/TZpfaCqUbnjYaDC3Fvfz4bF80gWG8KZR7IkN3f
 txiHYghUJsyR6xgcw+8hG5UtoohLchvgTGkliK3YH7LYDZvRErppY6k1xjb2kBpXA7ZdQz2wnNC
 FNXApNktURCOEHGtlKBOvk7EBCAO1wf2vP2fj9ChGtoYwQsj2Fn+vuxh4C5aVl23rWiTvOtimc0
 qxYsGj0vvzREnk66Clw/+5ESDgmsWVCLFmHtNNQqaOAc09YKLEUMy3RDKu3QHjvvZ/lA2QFaovK
 aawM14c6YCJ29/dRFzes6hIxNVaaTJDCh8eO2PSWhTxg1OOfSPzhQTSL0bJmMFF8CVjlYKOVyje
 H5SgC25ipG5CFTtU0hSof+s6io9jIZpkWUkay2IdhugDQwwx9bMTnQ3BFBt2bGQ/vFq3ZQgWBj+
 eDJBqANVY9IDRbA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX3lR7Y5qGcTmB
 9ZxieGNWNFIuU4jlZg1W8zHfbgxTw/fDvX2RePdQl+D/ge5X3nFPMu5V0XbzYjBZGkO2DRVpHHd
 IKGDR7euaixgWjm/dq2FdOqjMtGWp2L+UhD7meEJokd4JlKXT1ERNbRKd83SXw2FVXyGsVFx/6c
 AThHVZq+kl5h/Jg1A3FtZjVCkVKjt2WsZ6jSWL11dTR3OJDLIFZVbtEjQsdrV9NVebhxCgIh8KX
 C9F/lK75GmZWN5hRcF84sXgdjC9EyhquM4//luNMftrYT0Poqd0PUlwv0tvgs6oyCwXY205wf/z
 Om/pjaJqSaMm8j8XEJs1AogWRKyD0ohDNl223JwvEirQEf5Re1RFnfgEb0Il1Ns8OQKl8kyHyQ6
 XCxcilMsBt9I5je0D6VluEDt2gumPsI2WmcBK8CVRXu+CLRVu2dRDtZ3hqYK21mT5iilqOUa6Gi
 hF9FnTNmbmJwoOhesuQ==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f351c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UqNyx7J9nSqjioJOR4EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: vEGBNqULgYx2xMMShdyx4yj7BVdj-5GR
X-Proofpoint-GUID: vEGBNqULgYx2xMMShdyx4yj7BVdj-5GR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_055740_980050_3BA3165C 
X-CRM114-Status: GOOD (  16.28  )
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

Software node describing the GPIO controller for the pxa25x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa25x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 70509a5998142ec6b9c484e5f094751eda6db6cd..a4e878be004a09a6ee464c8f09e91be249a224b2 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -240,6 +240,9 @@ static int __init pxa25x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));

-- 
2.47.3


