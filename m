Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BB5FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzdubEe1zjaZzPfQdb3cvzL8K8lTR9h1uHrdmQnj2TM=; b=FHzGk/0MVwi3+mS9veo2mFrR/t
	V1t4zMERonQ9yAo5pFLpP+Z6d8dWVQMgCcNPl+KV7u2LKXqWdzzT3krHVT7WRqFo6cpJSCIr8bbGZ
	TrinH4HQi6qSgSBz9eIBx3lEUqPUq2e5D4KHb57wvaFMTVcTjXnfEGCUGb1UyvjK9BpH/ZLl5Mm/v
	zbnBNjmnywuHh6szlF5XKHCpx4SLbNpbgdu5LahQPfxHEtsZOzc9SPROr42ZcuGtJ0zrD045vdN4Y
	BiznVYjhq0NNanuTj+ZBGDU+uSpAW0QdxfG8ykdL0NRsDcjndjADPDElMZ/mfoAFT1RSb7S0MYsPq
	0EQSKLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxb-00000005Uiq-20Cz;
	Thu, 30 Apr 2026 12:57:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQxV-00000005UgN-22ve
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:57:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCN6qd088818
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzdubEe1zjaZzPfQdb3cvzL8K8lTR9h1uHrdmQnj2TM=; b=VLdaDsF94a7DtHmA
	m098gqynMEbhYaHiLcNm6cD2lxaP6+jy470C7+YyVZMH9h2TgCTc68OVTLhPuizi
	pkpasivJ6Ro3wzFavdtlo5pvlvqkJyUgBx9b3zGRUYauhxdmUJgwMUapUY86NP67
	mr4EtSTHVPyg+zsxauTy27+wR80ECz5dk/eRcB2OCl2+sbOR65T2eR+LC+BSfQBA
	amc6Yv5YstoSXyJv9zkMqK7lST8rPY13jj6KBvCsfi1X0E+PP2xVul9bogwjPN9m
	bPzaS17SCKHDwJCPJ8+40eeEj1kiloSS+tzA+fcrmJAqKoMUHi/Ie3QmbA2tOdkW
	9SpuiQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u41g7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:57:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso10046471cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777553856; x=1778158656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzdubEe1zjaZzPfQdb3cvzL8K8lTR9h1uHrdmQnj2TM=;
        b=STBijptxn14JbcU0J489UnOD2UqAtHN2ldXp1Wtx8Q3uYjBR8X2ulWfNbIxRmezIzB
         sUxENJlSIVominHIJtwrzsW4K6NcosUBwOL8q93zMmt2cfvFtjko+XcY6k0ATFU3qKTZ
         sH5UMD5qNxT9Dsa/gnfanK+ekrAAYzgWPwoJg+6zM7wUskyO7cFim7butHfS2l8O8Q0p
         zkMmg/SbmimuCG5n7Pv19f/61KapH9axWg4ChaXO/F1TQpZ0F5jOzAiqcB9/0HZq/gRK
         uyBUH8L73gE21tEgjkF5Da0+jRtp1UwHEb7vPypgIFv1UwEkPo4qL42DAW4XKJLL5zf+
         wCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553856; x=1778158656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzdubEe1zjaZzPfQdb3cvzL8K8lTR9h1uHrdmQnj2TM=;
        b=SK+PvMC7+5fk3UjQyQr32X0riVQ5//ZWOk3E7D5qVljZoBIinF7wVwNF2sa3XJ5Ujk
         frtr4tKLOLILq250P0J6haTSrFAyf7MCkq50sG5Cgd7291zDgvpHBJkQ5PoWz9e0+mxy
         10jTmHrbktLQndFGQVcI1jb0DE+ssDJ/fO40jlyv1d5RrsGIqs4aZFy4UWg6omxSv8bZ
         CBqz28W521iBaQuMTGeuli7QC7WBvN3rfA8NFsGB0uMwCB2po3sjTOydVu5QqsE/V7vB
         qWr9jEW4CpES2LkOjXR/0tXbbLtjMic+WltKjjgmScsXQmC/+DaC+SD4wB+q/meQXldS
         v/pw==
X-Forwarded-Encrypted: i=1; AFNElJ+T3qJuir+GPLIW+iW+s3Asn7N2XOMYwWoXWNnuvcpZQfZ4gw5Q9Mkaf3wPYaxvNzUoi7ptSZeII+cTCFlrr5Dw@lists.infradead.org
X-Gm-Message-State: AOJu0YxcCbbqnQVXzpzjGJ8hmo5Auv6BiAg1ywUwEBvfbWkuXKwmwR8W
	Y8xI/bAMGNBtbVYOeQ7I6OIHxPRoqQW4M1EwZeuZKT5IBy0mTIUug/vBhsw6KLRusntQXjBvrxj
	eyGjj/2tGKPPpVWTYV3RnzO7Nh6XC8YGWyCRqsthLqSj36wAIdtWgm/kE148a4MRwp8kNXKo9jq
	PuhQ==
X-Gm-Gg: AeBDietocQF/+gI8QFHTYs2cqPhYeuzwNL1UHVqXCewwAQmAjFhbOfkGK9k2cT0A3ug
	ErL7PiGVljrKMgAOOhRwILccoPv65tovZvHgzDq1ddh7lbxteAaQVpVMv0L39X9EXi9vhu0dOEV
	WasartnRQ30PE9NxYK6YkS/j45RUAM2QEZaeobegBZThWc+PEMJ4USk5k8Vb+aLxzLGm2vQZ8Pg
	gjMofUBRH6xKPDTiuillJtLW43JMMwmz/6eYo2QaBI1DDsrYAA/7JWAkl8ZnZIbfMqblG6Nk0zx
	TK/oluDNRITvmOF27WLu49aVkC5zd/e8QF1xxzw8JGryaukG5sjxghNnxtJG2x28RukgwXTTB6W
	mpvMUatNb7568LxsEBEOfq6SHSfeTovoVkhvhWSwadjbB3gA6VHd0lL20npXxTA==
X-Received: by 2002:a05:622a:1116:b0:50f:ad91:890c with SMTP id d75a77b69052e-5102ab5ce84mr39085651cf.22.1777553856084;
        Thu, 30 Apr 2026 05:57:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1116:b0:50f:ad91:890c with SMTP id d75a77b69052e-5102ab5ce84mr39084991cf.22.1777553855520;
        Thu, 30 Apr 2026 05:57:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c326873sm41899315e9.34.2026.04.30.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:57:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:57:18 +0200
Subject: [PATCH v3 1/4] ARM: pxa: statify platform device definitions in
 spitz board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-pxa-gpio-swnodes-v3-1-5142e95f0eca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=le5OGgEvHvVZGP+20XqyMZWAbVSnN5nMXc6oeFBCxJE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp81G3t8nzhFRsjrDI9eGbHFJU9emBtQhe0Q5Cr
 YR8J1JNY4eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafNRtwAKCRAFnS7L/zaE
 w9rrD/0QfmraIDyLjS5UdTWnqXIPC7cPhdiOzzY0t4KJ4Ti5SIbbTHmiTJZdekxHKxQOE+Fjg/d
 Jnk1J/fb1e3ESI3Oy48DQEEh/nXUzu8qpSnpg1vIfoA0+vASiGA9jyImIkWcQX0NeD4goUnAYng
 /OPmzwCC1mfaPUCJBmoYuuXud9h+JDi7CIU5PfzNp3WB4ORa8KpiJs8d6MjUyVsXDQUKdwvZzQc
 2wNVawe7vAioKc7x1tFb5hXqxuw3psadcFaGiLwPOMNy5J6FmAbpLj2jIWEqegeeGfYVMdAmTcy
 yz5D19dJ74rP2t7AWceTQH+zViGLeZV3ttO2hmLQGBD8wa1D9Ar/VwRCDAV4mrU+TR1Ggdhgguk
 uROCkb3BOcaVVua1rUkTD1Lpj3PKSKS0dIEXsjdNgIhQ7HsN1Iorso3+TLUMnqVFqjT3MLLjtg5
 FYdxngjoet5BRG1wR5KMm4Mx1PBott+oHhW+FwFl8tDxLTc0yRyVLJxP3WY1qIHDiUW7jO48AYs
 ejrkXp4LdwzDCdUYP522X0nhSOIWa9+6A/+6BXcvC/B86TMfByQZIYwGloKjxekOqXyPUhdQH8Q
 9PIjBe1s3MqdJRcSzpDQg/NKk9EC/jZ1WYgQcH3Rpk28Al9CITfxWYejKIjnvYFliXgD/9N9G8v
 uYBoiSMnM8UrkYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f351c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EpCYgoSSk4DMBEGV6jgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Dabr3o7_rdnxwGYxYpeji7UPt7i415E8
X-Proofpoint-GUID: Dabr3o7_rdnxwGYxYpeji7UPt7i415E8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMCBTYWx0ZWRfXwo4Z+J38o1W8
 t111XenShTzao8m20Qww2bpeZ6txAvMaqsKrgxQensXXBr+0HGlzYZJWvWRHnJt86lCxijXHvfR
 KJNmbYozgiS5vkZUyjJXAPl/bZXWsvqm1rSVPDb2xCtvPFBSm2GWPf5jO8+FtZMjbLHXrJTQ3ET
 zYycnY7kgXzKuJng0eb8FQRNuBNygYcZWVhmAczXgbcGpQGx+CAXKRK0uxGw8f2gvzQGBnoMuZy
 70ylBDGVgxqHvQGXQtOodJuIW/bto5HfkAibBZHUhjEWUtZRLJ1vNjFIwuceo+AqbDyGeRVwOu2
 RRM7KeD9P+vo9bwZEjrZWJ7soFsOlsYdfngBdtpMHaM1Pt2RrTqFtglhG0rpZ32u7B6Hw2UdtEU
 kWdKHpWVinc89hPj32Qb9feAxynXoOJl0P+HQDRsugepKHvsOwrc1dKTLCa8bBT2lNPoGHrOr+c
 llYfGwYlEEKN5JpdBYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_055737_532278_7989F222 
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

The scoop devices are not used outside of this board file so make them
static.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/spitz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index c0b1f7e6be87411359b0020257ff12c73bbcbae3..3284b9f62be970555042a7292993e45d56fde47e 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -165,7 +165,7 @@ static struct scoop_config spitz_scoop_1_setup = {
 	.gpio_base	= SPITZ_SCP_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_1_device = {
+static struct platform_device spitz_scoop_1_device = {
 	.name		= "sharp-scoop",
 	.id		= 0,
 	.dev		= {
@@ -192,7 +192,7 @@ static struct scoop_config spitz_scoop_2_setup = {
 	.gpio_base	= SPITZ_SCP2_GPIO_BASE,
 };
 
-struct platform_device spitz_scoop_2_device = {
+static struct platform_device spitz_scoop_2_device = {
 	.name		= "sharp-scoop",
 	.id		= 1,
 	.dev		= {

-- 
2.47.3


