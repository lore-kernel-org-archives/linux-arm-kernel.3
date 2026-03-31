Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E8FF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSpuvvcloGMrG66yfGK5yegYI7xNngjDRANNlQWkaWU=; b=iK0EeizN0to4ZGRem5tWjxBfFp
	+WNsUepav4uS0WTuECyLTjbsQ85evtzRDoLfwk0FJkhgPkr1qplD6rdyZ6UMkteUw16dtMqlKlpmZ
	hXuxKyhfISrqumxgg59vBYsv4tLheONp+LdOuA2ITCTH9WcecgyAYtnSmWh8qjBjN4DjA2dgLog6x
	K7IPlXDVJguPul/vRSmBQAk8Wzq4mt0gbO6ecQwXlsmE1CI6+gU3zgOymWWAUwMaK6N/Fqv/Vm8BJ
	ilVdQa9YzXjHUEjDA/XWZgrvt6Udv2mPMI55QTwsL/YBJS2lfzoDNW0BY6WW4/ai9q3oMR8IDwxcQ
	sETQg3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7t-0000000CewT-0f4W;
	Tue, 31 Mar 2026 09:11:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7m-0000000Ceum-2jYM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:11:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V84BnR430979
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSpuvvcloGMrG66yfGK5yegYI7xNngjDRANNlQWkaWU=; b=O0Rwd8tVtn+F4sgd
	5t45365WubVTdakkxtcJu07LxAG5/ZFJ83ZEJQVW3oCc3xFpmIc2mgfF44jk/57k
	f47Bv5di/r5yLbMNp7XdfBA3qdLLakFDemG5U6ZEoz1P/p+AYmXgGe03TvMLN7M+
	pkQBWS6VMq4c0vOssCeIo9P8G7AfHkHPVKuc6AX04tp5ihtHFs31I0yg4f889MBe
	uNaKY62Q7ZPio9uLGzQ8SIqtCXGKrKRz+nNqWvS3jnZ6l31AuKzlzMaE5ig58bOA
	3gL7p3vkZjgz6oUNEkRPGs6dyxPjcybkQ/5OT8hBgFgfpq2cqbhQONM7nmwrqDkg
	i+Jmvg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhmt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:11:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so140717041cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948260; x=1775553060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSpuvvcloGMrG66yfGK5yegYI7xNngjDRANNlQWkaWU=;
        b=WUf69TU1Ium1FGiLaK8ZoWGtGKcZAnNT9hvM76yOrEkrfD4nVOOFWZDIr9wQgoFDwM
         BisEWVU23ZORPqsPU0Im1K0U7l2RmPg2LCBQ8zNqxlW+Y2jg7NalcU064bnCvs3vuvz+
         GYamSIZUFJN2jZ2RjEvQzNES3hHZa241N0p1WGI6PlfKJoQYPfD3+weef5/uUta/2V9+
         G/3S1j6pxYCfBwhvJtt1bYYx1MzsIQQjdecJoVi2/8PhJtJOBzgKjPRR4aPc4mrpYuuJ
         nyhMMB7NsLtMBkHvL9z1FsfaZzoFCB2p2NiVhj8NDaZ69PRiav9n5eNAtEhCDmmdBlgV
         YxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948260; x=1775553060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSpuvvcloGMrG66yfGK5yegYI7xNngjDRANNlQWkaWU=;
        b=U9QSlTkA4cH+XIOaGrW6XM4QhBCj8/zK+NqQ2yXsE3JRlyt8utZmnJTVfmqkWP1g7W
         VgR9mI/ALELSnJKD31KM46eu3J38do8WVVou4IhM2RnjV86saAAp0j+xfOyHnAnmOuiE
         gXYrTZnPHPcuik/53GiX1vmK6p0LPogbKRysYgn1x9gIJpvFU3OlFir+TOuD/s4cnxe+
         Dxtj4NHdIwA7y9ogs3joQdCic3kJ/mIWOZn89JQoT3KnnrvjxAzt3QtZdHbzn9KTK4D4
         hrpnns9/HFt0FNqh4b6BBuHjIchWPHxeAKKwJth6ay03hItbQOjiN9V4JMxaeysfy1mF
         S07A==
X-Forwarded-Encrypted: i=1; AJvYcCUQvYBoXflfyLtJcxv+QaEG8M8Q//ugk8a1lHXo0x6O8/UCXYw+e3JJgah/Bj9i7f3YV6S2EJdYNjk/ts7Y39nt@lists.infradead.org
X-Gm-Message-State: AOJu0YzzRCIl8/fbYYpAvuuD2zckG5fMWZoCqzZN7ljiDWV5KQ7bIBte
	3T208a+rhntQvDoa/MjNbbK87y9+vlRAYJVo/rkIB3Wva59KTzrHWbn4LYOpcISF8ts+cp4shwq
	tMq6pxQmP+DtCk2WdUJ6TPwiyhtjXxJcy1AC/l+I4TGrtjQoE3qGLMUMC8Xw0IIZvK/v8HOEzNN
	a8s1Y8GRbWyA==
X-Gm-Gg: ATEYQzzTR/wXMOj7da+2sAHi9MufF59XbXqZorb+xS5A9pX987lQ3qRJ6urqHlkRWE6
	NuNOx/WMd/wRjLVkY8RnXC7Z7yKEcmodWPdVi+7tpKFdobu0wLX85uVKU2tw22HquWg6SoNeEYz
	bYAyvFh+zEOxaBty/h9YSucY0dMhhsqG/3sm3HpxWOR7PTOZbwkd+k0oSnW5QZjiBMqb1FGTtaW
	zw8HOQvuMfxGatxQAgiwKeMfxKgNBLiICSYJFf8FhRncI5A879DsoB4V9oswXU30OmNJdGG4sG9
	jMx4bV6sSPNMALjwGNqc26MKzKqWQ/OOSsSByUWfqMm0UmmS8zyTmDusS8TaKbjd8BP/AFezP1c
	UPHNNHQaAF1STvlIfslIyWuQi2IoBJyijnyVOwU6fK3xx4Qof5j8=
X-Received: by 2002:ac8:5995:0:b0:50b:4f14:cc with SMTP id d75a77b69052e-50ba38323efmr209386751cf.23.1774948260476;
        Tue, 31 Mar 2026 02:11:00 -0700 (PDT)
X-Received: by 2002:ac8:5995:0:b0:50b:4f14:cc with SMTP id d75a77b69052e-50ba38323efmr209386401cf.23.1774948260070;
        Tue, 31 Mar 2026 02:11:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:10:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:10:47 +0200
Subject: [PATCH 1/3] ARM: pxa: spitz: attach software nodes to their target
 GPIO controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-pxa-gpio-swnodes-v1-1-f66d86d10d8d@oss.qualcomm.com>
References: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
In-Reply-To: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vVoq2g9K6Gk4rWjpyColK9933RhDDhxL609/h4+87yk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+dty3ESXbcrc1Nw3rSHCB+DuRDOqGw3iWfs
 oAuYg1DnYuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPnQAKCRAFnS7L/zaE
 w0jAEAC4ONnzjkcvHbfSnMBVN709jON6TbgFK66Q0bNVBSjHLK+TFYiZIyNSebweny0Y+fix6xr
 1cXaHRQ5TPTcDrI+ggb1UdOXg2JbcgvCg9bOGD6fhPyMX/44cIV25d1qzBtvsky55HCjjlS4j2k
 s1/qBw5EJ/WptzmSuFtDHEFlPSj0ZNOltBGnOkMZXVoWyFcrJ0lV0siLqYSQ6K5Rja44dH4r/+B
 M1qDjawyDRi/188U7BfAU+6SuHU9KV0BiG8qeLW8xBFMp+Hk1KTYZGhmBXIzfxnCUQvdYdOe6AP
 m1qupLwQHA2vumpeoOiXboAno2l2Qk110KZ/R1FaKHe1RMfDcolRHWfMM/iR7HRjtiGVG4VfzIa
 wzhq0aKGD3FOQGvt2848ZM/mZ2P/N25hzHTcNFBNVSlkFNJr7hcUa9an61fKNq81t0Q1mnmAP29
 G/IvbA2IWN11xwZOREedFGVSyEInumpjOIzx0TDfmaaqmkYpajWbR5+qJ6d+RjRqdeBYvr7zPqK
 v+33AILVnOXe8ot7of3ZiL4pPEUiq6NlNlxAJd6ZNWVnW4GYkXj2KTMF2q3aA2at27Z6DjV/4PB
 hd0255sb8MPC/QvEARhCC6WR1eS8SxUn2sVXGWm4peUQPYq5PTds8epRhHmcQ/M2sbxqX86PHrK
 O5VtqJYCaSBsUqg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb8fa5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ta5-_S-aL4JQErPj6J4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXwKt0OAZSWX9c
 28VTOSwUrc1NHFhTah7smYWhYNJEQx/Q/LX7t0E8GNlzl7S2DdQ69NN6iTRGOXRhCho9y+3KcSL
 Yb+SQBfQqSGkho4Cc9DCb36efixxLeSWCL9ps84i9iiVT0Qta3H10QOFOOspq0ZwVDwIDpBreKW
 7muikwphrCb96ic0YARqvxotc7YTnuw/+6c0wMUrDPpxrD9Le+MXeZm2i8f862trx2QAukoSeGG
 8ihnogpqzkhY8fFIrrSFuXoVwTOiLqPpwFwI/MMrI9UYeVrTow6rLX9PWgSH2y0YhjG/MQr5I8P
 okshKN/WpuDjPUuMopbkuXq0y6ua6qyBuiFn/98PEEXIoQ6j+Tfrwj5mzLGQfEKLkwuEbsed+Yt
 Tzq9Kk7I1lfIdSGFSciFKLD4ZrNE60Mlajexru28FAq0yuG6MPocF8d2YIIZyUjhEzzT3HZJjzc
 zCOBZwxyyDyloDEdnSw==
X-Proofpoint-GUID: PRExHW4_TXSR3tE1et1DDJwvmFLpZVWK
X-Proofpoint-ORIG-GUID: PRExHW4_TXSR3tE1et1DDJwvmFLpZVWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_021102_835469_7A24758C 
X-CRM114-Status: GOOD (  19.92  )
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

Software nodes describing the GPIO controllers for the spitz platform
are currently "dangling" - they're not actually attached to the relevant
controllers and don't allow real fwnode lookup. Attach them either by
directly assigning them to the struct device or by using the i2c board
info struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c0b1f7e6be87411359b0020257ff12c73bbcbae3..99deb672999c675c25c9d03b0320618f571aa0c5 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -204,11 +204,15 @@ struct platform_device spitz_scoop_2_device = {
 
 static void __init spitz_scoop_init(void)
 {
+	spitz_scoop_1_device.dev.fwnode = software_node_fwnode(&spitz_scoop_1_gpiochip_node);
 	platform_device_register(&spitz_scoop_1_device);
 
 	/* Akita doesn't have the second SCOOP chip */
-	if (!machine_is_akita())
+	if (!machine_is_akita()) {
+		spitz_scoop_2_device.dev.fwnode = software_node_fwnode(
+							&spitz_scoop_2_gpiochip_node);
 		platform_device_register(&spitz_scoop_2_device);
+	}
 }
 
 /* Power control is shared with between one of the CF slots and SD */
@@ -988,6 +992,7 @@ static struct i2c_board_info spitz_i2c_devs[] = {
 		.type		= "max7310",
 		.addr		= 0x18,
 		.platform_data	= &akita_pca953x_pdata,
+		.swnode		= &akita_max7310_gpiochip_node,
 	},
 };
 

-- 
2.47.3


