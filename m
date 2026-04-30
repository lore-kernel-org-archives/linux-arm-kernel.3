Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153CAFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmmA37b9V70llXw40BdHRQqoaqXVueLY/PN1wGIlYwc=; b=YjWE9ZhRKGl6IlDv3X0bfc0AS5
	qErpkMVi1xHwmTbJfbqw4dpETpAvywi/1hhdaQbq2XePAiAnaxqFB7FxjeM0J95lbh4OWGxyyAs1S
	L/1+Ic6cnuJhp8GZlMEy2iUFNiUbLM9BO+AbNzsn/QTds5kz6LTsTyvDLUArdc+j5hd9CTg84n9A4
	DJXc2ie6nlghjxmms0jeq1pmRnsh3U3+15lOdvQAeJEmBBLd0HHNopykEuLqkHAvCDwk0/ceFegKN
	EdRb3GymenzPa6mOwzIsRpNMrvELfY8fNYC2WAV8c5xBh++KwJ5kAmmGUVRhscOVFhAqsOBS3xJfy
	5+LibGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxk-00000005Unf-2U8m;
	Thu, 30 Apr 2026 12:57:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxa-00000005UiH-2KrD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:57:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBk65U1820431
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HmmA37b9V70llXw40BdHRQqoaqXVueLY/PN1wGIlYwc=; b=RkF850Js7XMgA5Cu
	JNTjxIT3Hz4/1ZdSIO7YR6npi9Ugdx2ZFJD69rdNo0UGpszh6t65V6/5errE0FnF
	zRnb3/iWY2twpkmUG5dETg3kD1U4e0qE8AzXIoM1gmx1yvadiPDA5Y7Lnuykl+NI
	FaxVPiELBXMWFAwxbdjFG6wECZOdmW5L8/UK6eZk9CyLheQBf9n7XlsKZYYQi37I
	o5tjHeIM2ZTGy0fD7Nq+McWVnFMccyawBQzEc36ntg6yfHoGgTU+9YWD+orcfR8m
	s3hprkvrVdtp5oHCbLjcGDnPGxEakfRpF3eimqEvz1OfdBm9CTy/uh7EdwNWVkVR
	6BZe6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6geraf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso17724421cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553861; x=1778158661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmmA37b9V70llXw40BdHRQqoaqXVueLY/PN1wGIlYwc=;
        b=Uie5HerGdmJgTTtlFzMOzYSVTUX/EooKfjVxA520x3Ra1NHdnNm6gPMXYV7gSYQnlz
         yBqkZsVOTpY6HIQDrtO/MVwWHDVMt4JOcOzZfEdLHh1j5eBwyWAxKYaThUBtM+ks9hop
         XXOLO5tr6aVygaqtCdHhhmiE/kvr+4rAo5IyOC19lOWvG2X2EBVYJuq7g3RLfi15E71M
         0bThnykFhW+Ok1NUT4iz3dt+1RxIpJhj3Gzk6F4QMHN625mN/MQJxln5j7QYdf7lNKGm
         ++EmRYo6QwuuNHaUiZKbWmJWSd5VZT0rMBr2RDtIhPPyDcqS7IA8b8vDfIxPH2d/6Lly
         PY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553861; x=1778158661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmmA37b9V70llXw40BdHRQqoaqXVueLY/PN1wGIlYwc=;
        b=AuPGO6wb61nvfRqChwRBwM1dxCwVF6rTIp9bhc8Rt74df02niT898inwttyjQlOBqW
         pSgGnQ+3OkJunwlDpgdDKtIkq+ovP6gguzfH4+9BNYuTwQT4wdV4l6ZtfknTuSAZnYmW
         8f2UAD03IS7RD+l6W6qWHw14y6H2x0ghDMnS4ev7T0X4MKx7fEpv07WwGtICkYhriV0m
         K20qbTDV/XR+4F+Lvis9jLh/k1y8j6p80GZsAJhoJEzJOkbKbMowceRl61sTZsp10MNs
         OE/wq4crxKJA86lZHlHDy7WSeDUr0xGkCJnnnhMzf+vX0/c1JGjcfA20r1MAmRZ1kWbK
         KlKg==
X-Forwarded-Encrypted: i=1; AFNElJ9tg7hnvXy9PodcA2V/QJQk9RuycC5IOHflBuwxGc9cYbceXoZ6m/tVgET6xL8LQAjZOgIawOZWY22efHy4KOna@lists.infradead.org
X-Gm-Message-State: AOJu0YzGFk0badPh1lqSEEa5VlmBCzjlNzqA7FIGr4adeRfAK2IsJ1Rh
	ERb/03lPO0Y/EduQDcVJxMIPvanVUt4FUPSqudA3vzPdsW5AiaASKRuonkINNVsN5rkBxtdw0XH
	06pbAES3jq/7+WiB8d3GzGZEm/nPDF4jUyXihKMrAqet9a7rtrAOUoGLs1PuUoxW6hmXOR8fjLS
	3OFQ==
X-Gm-Gg: AeBDieuHaiVjjiQkJia+s9oIDgdwwmGznjblTfaqBmzgujVGjYiP17Irh64byrc7/kb
	SO5w1AyUmf/gNBMhrGFifhWbVLsmrEfyiFpssHKKwGjS/bjSXU9Oj6yI+c86vwEKEQgXbCJgoC6
	r+jmw/NCT9BXJ1+WVEy8QTA9OmjiAtUpJZ2tyVd2Om3cuoATnv94DsYgYlP9bc1A/wDDzp47u8a
	B9J18pJZR7jLng+19eW6gy4mT+FJVmYgcu1c7Qi5TdBoTjhveULPBLvlsjV5XoVIzsMi/UFyuPl
	h6cjyp2w17DHFGBI54nfNw0klqejCCVEKQ3Dl+v9AWc4qNTUWWr4UitqC/mxrRhjkU1euqxD/UU
	4Jr6jDUFmp2DW+MSw8mV1A0JiOZl4/5rSz0I68SB53lLkwrvk5xyFa75R6AdCrg==
X-Received: by 2002:ac8:7f07:0:b0:509:4198:5468 with SMTP id d75a77b69052e-5102aad8c0emr39478061cf.8.1777553861216;
        Thu, 30 Apr 2026 05:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7f07:0:b0:509:4198:5468 with SMTP id d75a77b69052e-5102aad8c0emr39477491cf.8.1777553860659;
        Thu, 30 Apr 2026 05:57:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:21 +0200
Subject: [PATCH v3 4/4] ARM: pxa: pxa27x: attach software node to its
 target GPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-4-5142e95f0eca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sRwwAiKeMHyO5SvmHLhg3nZFiqSlWPc3/8KyY9B0WvM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G7lsemaAhQGwp8DzE1EQtKgjLCcc03NHecV
 9KWPYXyr+6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRuwAKCRAFnS7L/zaE
 wyiaD/4osK/VCN1KShAl8KxL/e2Rzik59VUzrVYEeeA/Kxc7mzIwe1Fs+cVz+u4Q49XV+mNnPWX
 xSy1jgS1hhBTMlj/ykWCAGg8hH1VNTZv5HYy+60SZp2vNawMfqc3oHQKhSBurXskc3xzpCZqpy2
 f+1zZWTGEgt/+dvp3HN9JExqTmQP5YJblqa2PcFtM2rziR4tNhgBQYYychfUBUrrRzpDqvlwxuY
 CdpG0YKBCuvHgVHfiQHWI65rBVyGmiLZ4niVoOLzV9YwIjwVRh3J7zw+Ta1t1HjgSXFatsczHCC
 Fd5jijciQgFz9BBS4W7zOwqdY1FpUCyv1adWjYH7kfmvskygkI5Z1gogZ+pAkdv4MS7cTr5trNP
 J+gUZM5rKD8dYcxVj5PbazyJn2DPpuShYaQLdl3sHNGjaEScDBcldJmJjCR47unYykNDP7URFmr
 CXtsgBsKfSVwJ9pH6oHH30MnPjPYgn8OxktXdOxJzyacfM6oFC+/aS/l7KaNVfkIkZAI/byCkjq
 vgiIbbb4Q/U5nzUuBpij0xeAvrS71d2lYldDHEiKVJOrgaVGwhYoF0LuCrRfdAsarS7e+nCiLvG
 4ULFZJZVFg7afHnKKlZ6NNSDkYgPvp57ZrtWl/yxYg2JaouK5TqknsLvnmK9VdbhU8oy8Xdw3Kh
 PTviyD0n6ohQ5oQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f351c6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZhlRKAb300cTtwB8qGQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3AvVg7OJmqKmnqEJ8AdAvV-UlNF2efmg
X-Proofpoint-ORIG-GUID: 3AvVg7OJmqKmnqEJ8AdAvV-UlNF2efmg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfX5sTJpePPEyNM
 6vwvfbbxx9nzgrptqu7KexIACxXdi0HcFK7bYTinY5cE8nLoE4icw2DQcvPuSHqMrRbdlCzFvwe
 3H7URD0L02jkom9e4eXWN4ZkNKKPHL8qtLVyJD11hDO3wQcX8xVbMl8qhZ1ziZdDcK5f3By7JxX
 KGc8E91uym5xMkbyuzVDtKPYmdcZpDOwkX8DTKXcg/SVN9cVPWF0l2sCaiiMsjr5wwzbN5RFXDB
 Lb9kSs8yY6ZQtMCYyK//BZVBDk0Sbd18uZKGaoZeKbEDJMBTCEUMHRdpr14hvGI/da+2OvfNOiL
 m0kalzV6LKtSXpjLvBZvtQzefbnOV7NYSBgv9anyGCt+V8nx94BomxKpAdURlz7qhSF3upmrbxE
 UKGBC9WbwNd9/1UNERHhtwOB6yi18XSLOZgJmJV4DF6OIgbQHo/pjELJchK7/XsGRbngbhgvdIC
 Rbb4SD34aa/ek6abLXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_055742_625867_7D9EB5D6 
X-CRM114-Status: GOOD (  15.78  )
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

Software node describing the GPIO controller for the pxa27x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa27x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff63619790383859ba111e3efe7619aa6cbd248e..49c677f2dac156445447ebdd7a99f3463a762d20 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -342,6 +342,9 @@ static int __init pxa27x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa27x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));

-- 
2.47.3


