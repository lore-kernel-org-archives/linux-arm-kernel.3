Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E36CCF2DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=; b=YBLnw7W/31psarWjUBqRtTQgMI
	8vwT4eD2VoMop4Y1EpT3dRWH3wDK9YxM5CsbI2/8bfqRk8rkbaq2MqKPETdF9MeC9Q1IciVLPYYC5
	v+t5v3DRGuVPNsxo/0RR09945FHI5kM1sn4KwtYQI+Jcmk9tz5pV2HU+w9ae3qDM1uCALxEpORLSc
	RVtgNrzz7iGszv+HyJM49k2WrlzrKCQAAir+laI3LDUxusuAGHW0FgBX9Or/lpBgVmsZXasxwUL0Y
	cp07VBkZCrQkr9A1lhL/oXwvDI3D8fKlf5WUxVYdwAZzmm+Ue8GMXTAOOIGDFe/OSBkjH6IT78TW2
	wKZvNrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmga-00000001mpw-2eyE;
	Mon, 19 Jan 2026 10:40:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgX-00000001moX-3MoF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91Eph1150115
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=; b=FAQzRxvEmOkq4nwe
	6X908BdsC1UZgvdO3/qB+bGuI5yR1xBBxEiEQExUjqEMaEM8Jlxl3e1ibPb6qsKd
	mXEjmF/F5psoWQgO5tZXQi2phTwz+VlyzIMh0oMO35YGv4JXiAaoZGEKusEAnPiC
	f5MBTEfoWvsLIe4Sg1vzdQlW+s23AuxICYj2AUMxtSd5PxmJN9Z/ExawqgoiHq0K
	E+ux4kdd7FLsmVB9quWalT/U7JX2KVrmnDiCdcXakwkTr+96+BKqKNGL9uJsef4M
	5z7jP5VgC3pJQISC9gM57gVMbvJFY/r+Hndr7SwpMPcYJmrN5rX4OAqyFTdKaTMT
	zu6WgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e544r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52fd4cca2so1054105185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819235; x=1769424035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=gIQmMO0SGtptqimudRcXEo8g1J5oGJeus4MuKvO38pGREH/A6WTOcyyyNAoNXGuq4k
         lZntAJyaizCbrP+3WT43d43nKU1KUO//yUPzokYitDc2Dk7fvZVcOq4T9cs7wNGnp5Tb
         oNdtJrNynta8mMasudRZhkMNcWKh1WvQybDcl/pCjq/41B1Se8uGyBvXsvJ1RK3agWdj
         ylFRXm9KxG4VvddFuZuVHBtAmnb9GBK3E9RWYojLSL7OLjhSonB6OO24YleRt5OBKJQv
         CsQ6da2IFkbRkRd1bsFI/oKCr5IzMnhwyyPcZEFdDSKmQA4C3Pr7Gz7ROtG7QbliNWNu
         FRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819235; x=1769424035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=Fh1Wjq0/jYb+0TQYCaXPczP5XY3cFPKrmhWBEB7ws8xz/DAXu8/IU/S9LVoZ5/WqaE
         Ysc1scqhdXIy5Ppjou/D5tKr8ASyQ+YhviPKHtlwsaZqD3PHsv4ftUODgCX+82r+u0JJ
         WQ8tLAnNWwsvRuMTQmVUcJXRYb361yZtEp7CTfyt1SRBuZT9Q25YZne2Xs48akrwHhe8
         f3+iPYghIfFudyVlxeLTP3wFLn4SJgiT9aQYCtAd3dBBtCu6U5h0+qznWDjugYBFNWAq
         dUTUsw6byoEwHCSNuhGeBHLu7bGs9zWopqULQAnVQwBi3sX5Tpja1ma0PdJNx7O1GX5q
         4szA==
X-Forwarded-Encrypted: i=1; AJvYcCXwiogctTufhoA4LR/1kBIew783Ax/UFx9JjENMgeLB2QekzoIQ8yBdCeIWm7ApCtLhROm6ZLRUkuSqKsJrEmvM@lists.infradead.org
X-Gm-Message-State: AOJu0YxFqO05txXvbTinYLXyKzl7Kw2ydpIniMV1kzyjSqNelDoHGwcw
	A8jqpfoY7J6ndKj5OcrDmhRaOczxYzawZIh1IaIjxOe7hMzefb+/0saKt9VMwdu2kvBDM7GMMAZ
	sfSTPnR2Qr3B8xHvu5hJ0bqY94t9kOPpzFTdvfGtkdw7vdYh9eBrb/lrKkmTRSBG1MQ+116cOe4
	DNwg==
X-Gm-Gg: AY/fxX5JuAnAm3uY8SN5nQlCJ17/wDK3SOLIVjRdWn6fwPiKhh5AdZUs747NDbrbg2z
	Xerud8E4kesF8H+fIDsNTRPIUuKw4J/wvr5Yqb0KcFLypY3z3q1ecMxew7xMd9nrWuzzodm4AwP
	LjOfhQzGaoYgSGxYykyzf8JpHe0SF/v0ad5Q3S/BfoBB5ADxJEi1th1YiViimsPJDaiNt3MATb2
	W6NTgwTn2jkCxuGUi+2eCV5tjuk3xtRUyeicVfziSnsueuezUmilZTerX8h4TTKs7bCw3/WqIsh
	6c4IWeQjlo/Rt/PC0W7RgmKL3aDCIICQEdgXjDNTVSQTf7d9n/0y/blgDbyh9KZy7bk72OwI7iT
	/GQazgc7EAXl1TdgV49YQ9wlMTbb29t2SBXXblCeK
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549988585a.16.1768819235435;
        Mon, 19 Jan 2026 02:40:35 -0800 (PST)
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549984985a.16.1768819234996;
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:13 +0100
Subject: [PATCH 2/8] base: soc: order includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WqigZ1i/Zqs+7y6icbBSDn53U4awykhgsyQ1e8C6gJ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoW6Dw6clE1IffARf8COVJxpRB8cEAp2x9pG
 TvHKRUu6z6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFgAKCRAFnS7L/zaE
 w6xoD/4rWvH3uol8I2IuxI/o8//O6VGtI2Wbz5D5ZYLXz0QFVJIXy2WIu6Ah7+ZEr0Efsod56Kc
 n2bdeCvg0FKZ4aLOs0Z0MwUwBiM9dd4taI3YhDwKv9mYioJwJKuwQe/XO/b7XuA9ao0/7tBOaCn
 IuV6Scj50Yg21Nzr6GRDYnNwJ+uyE+tuwUd/M40ldOm2s5EwYhEp7FsDBBP/E+omcFWjPS6Nov+
 kX2I2V2/yIUGQQWeG29kziuKfleRHlV1bU5cUE9pA1HNciTqA+mnvyxzxVWIkDQrharJUgQRtMY
 DlviBwLuIHWnF2ovA1my1PVrtpVBHBnamhoCKE1b+Juw7Y9sAYgMn9XHTfUliEBSAMWkrz1dlqo
 +zuMqU8zOf3a/BuE522FyiFZzLic3mZQgMWObGa6fVltN2UmTUFtssDi/u5JGQ1frFckvuQfRmX
 vfdP9mV6kZWAM8JRdKRr6Z5JyxG6XfRwQGGSMCsIBWJPIhZ3zRERqGaccJJmDFmb+u5F4+Y5T9M
 Y92DHCIjyI+KaAozrJzVRFGDtOwa4JGy649HKu5mRvgXI5D0G8lz3pTIYj/cmQPBPZa8uajAHFH
 ggYVJLo6V4JR3841jPEdpWhak9LAKC8Zmznb9a7qT7A0Ch1sKfQ5iKSJVloQbXmUPWuZyO8A1+y
 A1GAbxKMfKxOKAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0a24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ZFCmbahrWokcDKAChN0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX/35VGd8iRtRl
 FHC1BH9bgWPC/WeX36RjbkblGWvMQADKR/J9dgsj7uviZCHdBTJI45vZf2mbmS6KrpHYTtQ54Qr
 XT6P+P8gQmjxZiLWYoM2UpI+dVZjhcTybBjB+C3zx3YdAL0wB6mUaI5m5NoMvzYNR16sfR5tWu6
 X3DgIJbT66C98UcvD3vlE+RazkMPNB+/duEUrt6rnMgECNcOQ7kupbls6ZXOFBa0jZ2KVctckJz
 IksQ++N3ySeqmwzJ9N/GKK29jVU1jLf4Ewwq8tbmpmrkQ4ENl2y1XDnnbeUFRe+YCWfG2hObBiX
 AJqWri5Y+rH4f7/FsNZyNO6q3gBzFTaJx/DR9C6XdPUO4086zqTOYnbWv6iHNWQ11BI5MaT/mIC
 p30xmGVVagYQsRzQCEzHZjN4fVwTVXO1iigd3WfQ+i3cQHp7dhz8BZY20P6yjaELLeHIeMGLOkR
 zKeOIYvskpuuxaUeX9A==
X-Proofpoint-GUID: mPWSO-xrJDJB47dPYQ97NwMX7i364uL2
X-Proofpoint-ORIG-GUID: mPWSO-xrJDJB47dPYQ97NwMX7i364uL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024037_876736_28689CA9 
X-CRM114-Status: GOOD (  14.30  )
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

For easier readability and maintenance, order the included headers
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 282c38aece0de88049dc1e6e9bea00df52bed1ea..6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3


