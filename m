Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D700AE6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=; b=MK+PoRgrrGDA23l3syH7XpSHCF
	C+P7LHIRvjhlmApp0Sf09kS/EXjw3SqydThs5+j5F7cNEXsO2J5bUCI8T6oK2C1ypjheyU0xJn4TN
	GXUBZq3xls8BqLXFlQSzwQgTSFQxrpqa8U66ryJyE7Nrg8hQrq9Y8Kb+TIUUQFvzmR0nzBECogL0p
	QJgpk3bEQ3M6l2VBEzsiGopOIudHd8wtty1LdD41AnE10LetJt/+UstQzZAJVMNrjCXwApY0cf1F3
	OvfOPNwuGc/RXHDvc2oKMmbQS4g0esKqv7ekzuaA4q8tUp3zi/K9mmU5RMJ9aoQSoUHGiRXVatII+
	YKINl4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEG-0000000EoRk-2fPl;
	Tue, 23 Dec 2025 10:02:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzE9-0000000EoLw-3jGp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:02:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN40LwQ1358161
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=; b=hG3y2eBhBYv6LK+z
	1gL0yrBRHY36kK6tWsTAZs50z93bty8jefw0oJk2zhNokRswgV3Vu0zE0e0pU+01
	K8xNvRQoWxZkFlv0ohVF+xl4CxuTiz0CeskCHnmGDfa7zJAYJ5wsECLupZN1+WCa
	EIGTJV1DUwjeBWdszzlplx8YYqbH6yshlF0CXRi2xJMIfTj4hwljaK/uQ2OzCrs0
	qlNfZ2iaCLz/lQb+dJpEQzzmirkg49C0m1UONoGOSEYhoMHmj9o1Pi73+4JkTf5u
	rfK5s3fH+6/mrrs24LERc2HyagXov0pf/WPkZTqqF9m94mL/z4QJ3kTZqRc1RT3+
	YLgXZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2sjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed782d4c7dso85023721cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484168; x=1767088968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=kDLeDK/wQ3ll4+4iPdM9Mlb8MdISFjkitauopIscJX7QyxM98eoiYDfJ8RL+mkKMei
         pp2YzhmaM/YjGCqJiB2KcqSnjyY9LZRHbqaWoZ6HqDK/hxmhFw5kjR5YkxjvzxEO8/Yh
         Lu4c7hYJBT6Aatw4G3IuaILJR0uMTPJdyJ9UB8QORnsFlnSjhikBlFxLt8SZoXqnUamu
         tSTRJWBqf4HKwAAZf0kuy2x92sz7rDH/m9RNPDMiCwaPYhQu35rh5mxsuwaoPkae0exO
         lanI3GD9L5f7vk+VKNNsOzvnsBs+eErCcE/5WyxwZtt+PWhzHBkDs9BPEaDj8WT5o4p0
         LXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484168; x=1767088968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=YWtgyl81feq6dzF0G1sfukm6aAbrEoA72EB6VDL25DF6FjUKvze4Ofim9JlPhVz5q0
         T6ZFd8XiTdGXqXixv3xBaM4Cr79gW2Iu7eScCuiZYZKuTs7Kcpq9yecQy3l26hRGpqd3
         4Jt5hDDeI5gFUbtw76h/qnkTi78IZKBrd+p7p4mARmamRZizuyzLMDcv4XPEUZwgxXmy
         QnZJgekL43n4xeG16IIqwgO4rQF4h8L/1l3qMLmkY1tVhy6cR2RoMMLK7D88tvCkI9V/
         X9wUiHfwiWF3cFjYLA+oDiohjs55THJdqDJrorv0lM0zaPU/6mlU2ufmpiIuD5f5zCTo
         2tlw==
X-Forwarded-Encrypted: i=1; AJvYcCVZO7oiSpihqIhFN90LPkFSPa2OGrMZwrZtPHF1hLfRCgS/MyvmuhMWg4VzY94UYFgcC23DwZcDLi5yH6VMFwiC@lists.infradead.org
X-Gm-Message-State: AOJu0YzZkUUKs10k+kCoCqqx/H3XrOLLTWxfxgj7EfxGhuspQUc3uZju
	hzEmPBvqr1Q5zOp9kzmvuv95usjdfgJ1V0lMJGW98f5Hkj1b29kNgmATlSusvcz6egnCvAKmtAT
	03RfamRhhfTx23KMKnRrWwEAidkdqy8g1PIVCliE7eZRge5hHPMPcotpz5kaBnrt04UvakIDTqY
	3p+Q==
X-Gm-Gg: AY/fxX46lMiwqifHeSVrD34mFhrARaWzTVKjQUrEa1xi5fmnhGKvt3D0cFFuYB8u/QY
	jDUvwyxBmdQvlUI8oTFe8tSEPMtAuZvqoSsbT5xQ9QZ4ebrbiIFmNGv2im2cynpfRo6OV5yKhPl
	GUROnOoGeE7nPjvOD8RVYNq0B/6of2z070yOQnK9Fobt9AhRz7O6s0Ol1wBk3OPZczVhh07Mff9
	bicHyXu7LzEgV2kIJ3eGdH/mfnd+yTD29yld460XXgI+86rRcAz1+6Xsy0zERWEvXegcDeK/DdI
	JltTEA8ClYG6bY1GFwtz7skurgrhY9wb1uCwRJWMiXQZxh1zbqiq+/iKSL7XjG/ffc8w1IwugWp
	HaWnJE01lHm6mKPmvYsOunihws7JQ8YfjzktytA==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204127461cf.39.1766484168140;
        Tue, 23 Dec 2025 02:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCbCcOwt7PwsENXNFXjD41YHGkGJlBJ34XwvIgIwyJ9Q2n14TG1CsoAxoooPIxMGGgm4WVfg==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204126911cf.39.1766484167633;
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:24 +0100
Subject: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cKutYeAHpo6nJsViJWxWS7S+6Sn49J6bFof6YwzIKbI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi4lDcQCifG3TxNlV3pNhaduY0Sn/XzxO1IX
 6KkowPlTIiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpouAAKCRAFnS7L/zaE
 w3gBD/0Vl8pDykw6ETOkKFQljl3UM1M3CJbnY+yo0kZT+SiECA8eRrap87iHfm19c6mC1Qcm42T
 fPEtfuni5DTWZzzF26TvLyz4l7ZEcMg4Q6UAEZVAc8Jybc7WaVUeRzf8P5rwSki+HdZ0W59W/XQ
 tkJ2GtOGSQ52XE7I5wmASiDxxX7bp58IR/I31WfS005D6EqhpvQAwKdTw8gYYkkxrY6ZwBe07BD
 kae+CXffjmnWs8IFesCbYHseao9A95f2UvZEajaOvCjrES9W44cGVaOCP5nGRkHwN/bnw7qzwSh
 N6n750a0l8S4etcjcnFPB7Zc9n5xNi1P2y4T/bU2WrBBFjdph7PiXgS3ihaM0CEWiriP2QIYzjo
 jk0daF/965GEziSPEoFBLEF6McW4lhbsKxmAczTkG7A4UHMU3OTc5iu6IN2YgVs/uD8bMeN71QL
 C/np0FOY3cMZ8FkJpMSHXO9JA79KmO4grADmcJ4tsK/H/9c8Og6oDho35TdruxQaOq4TSjxqOrp
 ihqJqL0ogTI0cNTl05hoyvBy+uCPa4qWxn032QvCPq65yamv8Ry8abNAW85T8Ai4ipoyuFAztmY
 drDCsNvroTIdVEEfDq6tyj1ZxfrH35z+7tA0DKl41RuWwf8WOfeeOVrdH63KV5Dtvpq09ygIY2k
 pKhjZl4zQIk8Vyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sIpHvRap3h0V-QtgonsiINFZIz1PEx84
X-Proofpoint-ORIG-GUID: sIpHvRap3h0V-QtgonsiINFZIz1PEx84
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a68c8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3lqC0MzlwKypD_ZaiT8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX94c9s9epZGhV
 el9oAMrHoBwOg2vOueW1H1EDOvmCVfRanGzwZ0eC34aluG+eVQLLBRLsBlC8AKofKzpToOY/6MM
 4kgWOoi/307R0+6XcKXPBsRDScxbAyhSNvdsWIP0sZAi7N5kgHsXOfbWnOj4cFtLxVw1/WFJyb5
 3zTMq+omVGIqXYd24nsDC29fhynnOmXfrYtVC1WDjEF95gjb0rfIK2ZMOobegRLE5jD3JizUVHb
 tYXtLjJ8GWlFRMGNApMDgakq2sxKltggiYRoRarJie6ptpwHoMapu4C7IBstZ6gYm5xNJAbEGFD
 KUvwTg76D8cChs/qyE/IiE20y554TH1WQ0RC16SQGRQeyaRU1fcBxknxXIbUHbFnu/Y+jDw5UFi
 JqM/JGP5Uu7pD65BqVUz3OcTJ2HjNSGXVs2eedgDc2AlLuMQHgH4Vu8Lnx9De5GWD1XieRly4OZ
 BnvLWcj7nJUrrA5/1cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020250_067091_9EBB22D8 
X-CRM114-Status: GOOD (  14.63  )
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

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648c082f319d955b5e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
 	if (p2wi->target_addr >= 0 && addr != p2wi->target_addr) {
-		dev_err(&adap->dev, "invalid P2WI address\n");
+		i2c_err(adap, "invalid P2WI address\n");
 		return -EINVAL;
 	}
 
@@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	writel(dlen, p2wi->regs + P2WI_DLEN);
 
 	if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
@@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	wait_for_completion(&p2wi->complete);
 
 	if (p2wi->status & P2WI_INTS_LOAD_BSY) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
 	if (p2wi->status & P2WI_INTS_TRANS_ERR) {
-		dev_err(&adap->dev, "P2WI bus xfer error\n");
+		i2c_err(adap, "P2WI bus xfer error\n");
 		return -ENXIO;
 	}
 

-- 
2.47.3


