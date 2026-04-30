Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A89CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=; b=ivFiYoLEV2jnPcrY9H8qq+rX4Q
	0OXwIILyC9/EUUVMmIaRbDHQnBqgBlaYYbrrae07VbTMCz7ehByvzOOUp+CRjiJ3iYry75BxifsNK
	Qh3hxKitU4v2Rboj+dPLSxkhtqN8pstVyh9xC07regU/dvY4Kb22q4ZCwgr8TdEvJ6uD/5kRucAxA
	ZfUMDRkJSChK3oevaEpGe8TQ7ywnlDcuT3GGes0R40Tzg/Tcn67YGYJwCLc692nARRIJcZaAHLx+p
	b75v9nOFwzwJSeegXoTu/Ou4QaV0ykX6oiSo/2PzSb45roF98zYijoHaGs/VKV9OeKIFXYyCFCGsY
	WC/ykrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxk-00000005Uo0-3n1c;
	Thu, 30 Apr 2026 12:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxg-00000005Ulp-2b0O
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 12:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=; b=DEMOumf/8KFBFoNN9IXC+3Zrt0
	9fp1E38Pe8+55zFpnwXLaTDOyVapVahK4WaXkY1G9TyQlEARBDKYpWno/fBMY71+Es+5VDcxnOzvy
	TukEMV2hQ9qYGvvzl/MYGYTmGLCEXj+0tXtCIb7smI7BeDp131jKCMnVS15TFk94Inm42uA4RF1Ty
	c4AJrwbQupfxqBblTMqt2k3d0qCWxrLZtaDVmSEbTSAVl/pFLT6viafcKSAgNt2kpW/e+yzrsCbos
	f3OYzkYBoejhXkhnRAMgVwJzjUCTOEui0yo37s+uEllGo9RSLWbLV/uDyPsqRJ287ASqnfi5PBfkI
	Oc0S9kOA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxb-00000007OYd-32LB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:57:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UB3ioN256282
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=; b=Yy7XT626PHb6gbwl
	GR4racNZu6IoNPwFSzsOiqlzvKT5+56sIAwnqutLg2Z0sue8RgHadm0Nu1WVhNvC
	+1a8QDZMnfbDM1gmSIqF32Sb0Ux0S7VYC1qx96lfvK6whA+NptSGHXiQ5AVI8rFW
	RhrKmK/pgcqoRmtHiLaPlen3WXkdNalMOHrPGjSKt9i56EOwE4OjEelnw++7Oh7t
	Kiauf7jasgFAmq/5F96cLO0tGrrDsnc3BFIIj/1REdKPYnczp0B67ClKEaEWUzsG
	N780cHytshZDEDSuuY6aKqE6yvJAdvg7MYKlt2zt+KroQVa+P7VLqh+u3a2lGy//
	VX6UsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71mcnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso17723731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553858; x=1778158658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=WznP8iAoFDULe8CJb+U06ahY5UWIamaEgDdiBz29KgzB19sX/RIlIMSckKs9BQoA70
         CTaED0NDeQwaThxjn+52kHWnX/Uh/WgOROohwczGUJx1/hbe/ach+KFzI811OyB0o1VE
         27MgUq9KBsaUFSgy/y8KcPX4Hkolygpf91z24pBvQI+/6qhPLmSms8TFQs6Ouy8Lqu9n
         QzH8eH1Nx44Cr90qgd+reQ7P0GyaSc0QuQ5AgNunE0XVbOutc8EhrULNgzyP8H5YegNk
         E2Gvw5diqyFeDeOiKvdvWAvuATNW2uw6+yj9WDRkm0sOMVQ1HbTduaDTN5GPVA8lpHe+
         d7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553858; x=1778158658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZwZxR5amoXAOmwTJ88OLojORvzs3WOM8khIGdJcZejU=;
        b=R7gNDiTg8xnAC1C/386TWaXQxRYNvqH4IysMLM1lSxHm/IYTHKXLrZj/ogSy2/fkex
         MET+EuoEQgNcpv3wMnhTCq8hsuBVzwCyQTDSC/7SstIJaNdR4ccVlHlbWYv+sFHAyvbc
         EtT3463ySkQM16LKqxZa4N/x5nDN0RFZTZdwy/21TjqI+fvzgYw2UApuCNAAGUv45dUJ
         ZBK7K1OTEyspYwM/9EYAPZnMQ7Kgo+SG0ofQab6KXejTjcm5JU/hQ7tLhVIdMBOLksap
         N+c3AAL+Lt/nO5t7zvadCpOLFLv+gsbU43+ZN4NhEjlqZvOs00CJGbUwJEX4oY/wV8RD
         39Og==
X-Forwarded-Encrypted: i=1; AFNElJ8WokRsO+jDt/TvBs2wmUMgYtVkizMHV+jLbTHt/d+O4PVrkEVZkFiERQoGeaC7OLD3BJOokk86YOTL0owBjDiO@lists.infradead.org
X-Gm-Message-State: AOJu0YzEu1Nln/UAdGQXn7bBPQrkunWSQnt3hE7W10cblmlHlPoztS51
	ahXkhdOe92TkIsHAGN4J1GAZ628WHGu0garGm+yxVj48ftlFFDsxbES/jk91/RWujQcbYp/seF6
	unIXDjvHCqLPkWyW43aQNoy+UoFHEAMcKriL/3TK7R1RRJc5tlXtdlmJ9CJ7YSUhV7TnIvxHa+z
	wPGA==
X-Gm-Gg: AeBDievwtNh3emOfRJj0+Edn++JJ45I+Bo+Smt9O7ujfKjvP6ZoEbg44TTxcT9KsJMT
	AjYn1qT801bWxYWAI4saSDOsQeNxtY4OeyNIF9FsYqTXLJ1XA5PqRy+9D49WH2Eto3+5DcDLh4z
	tLluc8IQXjLwZFVAeIBfXlPpiaysozeFSj1xdqqVynLcr13KaKb/ezyh4q+oMBaBCBJ3lMNpjYY
	1HFTYLlvXPHITWJJTlQx01nf2TqrSrX++ydqBa56KoAeLs0LvkGqTUbOGaKs9kg1Wzvb7krs1y0
	xF5W8LsURy12Z2AVvmP1chdsB0QAYRxo1l9xpwvHy5ibNTO8wLg8ot6w8tT4DiaQqD9Q6MEnSIK
	2dIO7sI4dfrboILdJV0BmLjqtc+2QIcgrNWpJc23KeUbmYhoqS1LDCKhNZhWkNg==
X-Received: by 2002:ac8:58cf:0:b0:50f:c245:85fd with SMTP id d75a77b69052e-5102ada857fmr37604771cf.31.1777553857756;
        Thu, 30 Apr 2026 05:57:37 -0700 (PDT)
X-Received: by 2002:ac8:58cf:0:b0:50f:c245:85fd with SMTP id d75a77b69052e-5102ada857fmr37604291cf.31.1777553857192;
        Thu, 30 Apr 2026 05:57:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:19 +0200
Subject: [PATCH v3 2/4] ARM: pxa: spitz: attach software nodes to their
 target GPIO controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-2-5142e95f0eca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jxTrQNR4gpZPqvGR21t6SEYABvNS8GOQuHajItmONbs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G4td6vKMjcnRYLlgZL8YJLvoiB+RlPSmWzB
 3IeNSj1f+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRuAAKCRAFnS7L/zaE
 w6G7D/9QRGEyfE1oRrQo1BOEria6ZMr29PncdqcS3OmG1T6aAJrRo+YYf2XQLsac3vs8KjnlPNq
 HPzO5KVBW754iR55zbUvnuU5/Gxv5Xcz5ZMy/2J0Mx2hyyMGTyN85Pfkbx++z+4xuVhhsR6JlXX
 yCJdd83oBRY+zlVihJOsuNftZtAz6zgG1rZ9QmpUcPebSFbZxKaUkVTFf2oFkw7SuPRoRh8s/+4
 ILJKT/WdEzxEGj5LKtEq5bs7Mb9be4UKwyb2EjqTyhlJtuhVd4HRLK4JZ9OOFRY7hwNbnZzAJ23
 4vLJrcdEnZ5NCWK2sHGjkzv4hd6Pc7jfByoV63gYPnoMqfLWNQ3NTKIEABgqyqG6C1T+TLceooA
 SreFr+uRMQetfV9i0sISk0/taXP67TTRQcAEe9Jp3QXyyeVumoAiV9Dh9O1zTgtW+jxlILynJ8z
 dq3eh5yIawnVjYzuEh3o37uKm9edT4ue0/DB28YJg6HFkQWDxqgOMu9cVueUQGiQzeEk54zH9Yc
 uzC4s2eVSWinns3+GMRISd+3UoGyqEgyPHKd8cjZ2XUWu/1NMK/3DGaWE6WuE0txmlmZkEDIAOk
 QYO8A8lBtYiS0rZCYBt4BW9IvPZYzlodE3yE3wUJ0EM+UYCVVR9OINPnKvWQPzjnzSsvlxN6sHz
 X/wgDAxzR7oBNwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QRY7_7igeTAC9W9PPulSQ-ccox7Qx3o3
X-Proofpoint-ORIG-GUID: QRY7_7igeTAC9W9PPulSQ-ccox7Qx3o3
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f351c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ta5-_S-aL4JQErPj6J4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX74btMdRStvDZ
 E6EXWqK3pxUgZ4oCD+wlG0L+eQGIs3Mw4ZV9P2BGj2AgWqpioolKB0NUIsFf3VWDGSQy7ekr5+c
 hVs3Fu3YhcQcIYtZ6AAS77hw/26kgZ/F0lSabRH8LI+wjJtxNHVH07CWsF9eoOIS0zc5G+QNGcf
 ndMkpGw5MnXVjemPe/WamQ9856D6kBK/o4Fnc/D/MGs07UcUzVPKNc2jC7F/II4vYZLjgx6WxWO
 ikDS58vr+rZH2XIBt6VsYGwg9/ecNGMpU5qOnfu12c7Y3wabIihfGTABLFdFFdE8ldmqQc2MMpJ
 oX6ppO+ybm0qUGY7iNMU5YmNrPH6P4TCww1J0Q0xAfw3cMpQK8Z4o2aozBkeEjFMFBcdI2ZTpO3
 ip6bv1NlkEXqyv81Ir+SkWs36tQhzstev83g4gSjcK/zXiC/5SVyVLd8jMGUhrvFrnc5QSJ84jB
 04oAeejZo/aZQRzfyXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_135744_276360_164C15F4 
X-CRM114-Status: GOOD (  19.71  )
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

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 3284b9f62be970555042a7292993e45d56fde47e..5091b601c4e1bf25cfee07429881894929853dfe 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -204,11 +204,15 @@ static struct platform_device spitz_scoop_2_device = {
 
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


