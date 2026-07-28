Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D372C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLk3uWuhIbtTq5azyeYc0c82fp77L8vjc/P1AiWnxX0=; b=WTkd7juTmEuUl41SP7ZE3nldlr
	Cmi5nEg7bnFWlkzLLI4W990EIfFs/pCU/SiWUDrwhLp53o/jB4LM7SSjtvk2maSd1MOZ2zoybnkj7
	rqGsGDRn8Yf7E5CrBNbt4WzvbKBsQ96uFadFqj6zX6dRD+OT9itZKk6pcXFcaENHNs8LHOI8RkRcF
	on27E5Xaxpb7NLZWhCbYr6kyecVhw8zOTmvIRrid+zosGwyoKMn5D2p5uGYznYasbeQr1ziyGjqcq
	Y2UxmDbu9jF8WkkiRHR1/El2Y3/dbzjq+G0lOrgcwLT/b9fveGQ3FlEwa3olRotw8cyxOLi52coeW
	nM4T7qnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiTB-00000005Qfm-1Hnr;
	Tue, 28 Jul 2026 14:07:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiT5-00000005Qe2-0GE2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:07:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOU8l2773175
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLk3uWuhIbtTq5azyeYc0c82fp77L8vjc/P1AiWnxX0=; b=aqZCTTBDuzXa5nI4
	d+RCnoJV+TSWm+CXJPGv1+b4QxJ4w6WVfFCq6PdSCX0ku4QbqdLGrhn4fnJh4vDs
	HiONHu7rCXDYAPKKXip33oV17u69Y4AfwxJmm02sdWH1kyazM0eHEZP+e9tjfeJB
	3CJ3QuPgoAO6/sfY6sdtyc+zHl6gp7ki2GpDhmaq3RuXxmcd2ZM9q+JlqiBwFlGP
	+wPHbW7yvuNC4Udm+gCK56xWbAa3gTDFaFTZl+KFszIJFKdFmJFeZwyUlG+352Z2
	giNnX/O++W1l/+l5CClhdzigMn8gY40I2KNvKgwrhxlblbFctXcZFZ/SaWQ8jFQK
	IZnuoQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpw7307cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:07:38 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bfd13481easo824070e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247657; x=1785852457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLk3uWuhIbtTq5azyeYc0c82fp77L8vjc/P1AiWnxX0=;
        b=FDpfggNBjjhDZd2y7+Vyu07cVMhgamRNVTbaJrPy/+labc+gf+WxxZYf7DZfEn+A9Z
         ehXOpZS4SjvxnSrXRMH4QmjmcSvUXy6GpLzZSQ/0MSXxPwIyYzw1s7AQ7ptkATzybN6c
         JNCtglIplZoF+2JLIgq3xFH+Sx4KVs0iL6UCFDPSKhiT3HFW63QmmbDVaZzmKYURUB9g
         plO/qvpiqzs9Zuz4eQU6kUJTnNEc0rvIK9KeemL8rq4YkYUPc+JW7MNrOcxKUW2aKG+f
         qNwJ3syoY2A53cVnD5hl2EInnCaqogyx4MQQelGCdZPc8NwIqas8OUYTnfuQOSmTh5EV
         ERrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247657; x=1785852457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLk3uWuhIbtTq5azyeYc0c82fp77L8vjc/P1AiWnxX0=;
        b=pa9HDZhque19lVcxkUIq3OeYkJ3/fM08YsTSOvBxFaO0K6vTTvVVMUbhLxUbEn6nb4
         JMtdWJjyHEIPmH86AtZ/rsg0hoNCf9T15Xw3rEliR5WPm+P+AibOg+oJ1kl9yetSb+rV
         41O7ywGfL/oWN/aRV+tn67iyJN+Hdz8GJsgBLgkrM6JDVkkFhq59tIBy+FdEyR5O86yW
         6rGnQuJ5QbXiqrdplEHsYGH9gFAlkqJWD3BNe0N6VAAqRaZGwFipkDOv6wDh6G2F3UEr
         PAxwP3Qm9nZO/iRcB/7J9Cd9y810W9pRA9P1DT5LFi7fk7yuDoOuOcPpwrDaIdz4uSzo
         BUkw==
X-Forwarded-Encrypted: i=1; AHgh+RpbvgmlJ04eUbeQz6ncWlk1X1YwBGF/ixI8UT+sXI6gBCKUZbtVK11Oqq4lODMCFcmnf1I9qpdwXKtpN42CkVlj@lists.infradead.org
X-Gm-Message-State: AOJu0YzBjR6rf6AsdjJerlibKQuYQiuoeAancoxWML9KU/odhDBKs0x5
	0zyOnLJYZmtCFOJO33Tv1q6sK87yoIK2RlG9qfdqBgDBWOBnbcG//k3HS07MPRc5yZW16fKIY3H
	6ufyXkIPCcE/EZmTr5duUPRLv7rJ4NYCfZ5OlJrY8RJxBytNtPSGUOVGVlK0WCasOeIh7P1ZTFy
	iUucRGamRk/A==
X-Gm-Gg: AR+sD11lum5NCLGlL5ElDUHn0laozVMIqKSNBFiwN9Ezz9TfOV/SZ6gePNKCzAVVnYh
	cXmu0AaqRTLb4A+IUzdpTPQPLl/EG/oSaq1Iihwf2a92iu+lVcj4QPiX2dKvMle+eXTFtx+0fk5
	SqUn1zqNVlyysOpMNdBh8rf3OJH9vVgSIQ/NZQSqPCEglERCfKbqARo/qWAYpsMA83ES8VIg4D4
	A46xp2bdlFHqMWGjO/P5GoOrli6hal0MgrTagmC5Is073rn65u645ICuIVT/fqUkVlJIq96Pkly
	+qRpHbCeAiQzrjexJGjVdoivIW5YQYL0r7Qb1Ntz9ngh+LXDpYArKYMY1QxLO2vT42VjDfhyiBP
	Z4oacggGUV72h/DM2U3f0kZmkjbCuWQ==
X-Received: by 2002:a05:6122:da1:b0:5a4:ac74:f5ba with SMTP id 71dfb90a1353d-5c33fa0ee4dmr1011776e0c.11.1785247657377;
        Tue, 28 Jul 2026 07:07:37 -0700 (PDT)
X-Received: by 2002:a05:6122:da1:b0:5a4:ac74:f5ba with SMTP id 71dfb90a1353d-5c33fa0ee4dmr1011727e0c.11.1785247656815;
        Tue, 28 Jul 2026 07:07:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d2e3:b407:476e:c977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a9451sm91612285e9.1.2026.07.28.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:07:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:07:17 +0200
Subject: [PATCH 2/2] ACPI/IORT: use platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-acpi-arm64-pdev-set-fwnode-v1-2-b5aff9b2235a@oss.qualcomm.com>
References: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
In-Reply-To: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: brgl@kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=609zGTHd2sXvyAIn/6xwzneEt26Mg2SLydEgvviJjaU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqaLehTkYFSP92zuLtM/89zK0mw5GmTQ28kuEfS
 xESnjLd+/6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCami3oQAKCRAFnS7L/zaE
 wwTZEACeYztdijfheHFs7GiXVPTB5Jlq26VbGxt+9MbRmjkwETqWTHDHXMVAeFVW8mLVcE1L3vS
 fDxh3NeTUya2clrg7SJxv0oJgboCtvEGv1snqQvwogBgZEmFKkBrnPK+6pMb0/gRTdKSooucict
 q0oOmzUms/fvnBRFwltwRNuh97N4sxGayfkc4zP0Ucaxa6wIUWmHNaW8QsfutOjQp8KBUorHX7Y
 sU1xFBh0Sd9izaT78U5WOketF+rwuBSpiRt0m8VOhIpWl5tyUJ9Jc3vl3DNgi0TLdhk9O1vAE3K
 KYa2ftyCoySAeewRKZIWaY0xAn6RNVoxt2XyicqacX6MP1vLv13cqTO5df4/OXUFotM50dhqsVP
 UiH/e4W2DZUiB3ipNFzKEnw3xvAuyxha2uQvIl96TOyr4p3UB7PjemdELsxLsgM30Imj2mkZ5DS
 nHPb+g85+ZsSrp4mqQL9IO0pc0kottYJzwVUTf++MnGK/vpgHRCk9aXQlhrh7U4cBVVXtqvXqEK
 IX2AGUqHbg+qMY59IjRKVCO00xuT1HhwqSvO562S40YKA4T9YLDJwpk3wI9h+fjjfTowMgIVsJH
 KzNZk+PIpj51XpzQzH9AeeuhR8TJHldmAoF2BLiHRiRQ5A0pn+MnEq5ggXZci95zxE+SSDeV+Xc
 Mc25f7+xftApDnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX3Qda0K6+ZpIK
 xufoD9k4KX4yBQDdt0xusNPxXDewUTBBcw2pxXZwY4uT/3dl5zeX0HZY8OkLziXr7PPUnjmv0Ok
 2rrEts7KUXmwc6Fyqp/xIa8j5QZNUwI=
X-Proofpoint-GUID: wlJ6KIDJcDUjrtVjwJaiFjvzjqKS-yTC
X-Proofpoint-ORIG-GUID: wlJ6KIDJcDUjrtVjwJaiFjvzjqKS-yTC
X-Authority-Analysis: v=2.4 cv=NobhtcdJ c=1 sm=1 tr=0 ts=6a68b7aa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fqL1emIZdJcgNPYfUqkA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX/xSPT00K2NGg
 a5oImHUGAAsxfe3iqsDKCqjD3ZfC/lBaTpqGKv7WPQhzKgZIrkb81GsPrs4MqZITaseAHDpXLbg
 iqGxLGkA80PDsd/IQdmMxxKOd96H7ZArGT52gAFpLkWbWeNeB8Kq1l0OC5psPbOR25ourBW91zc
 zB3kltuRZVB2hghtswgVD7k2Q1prnbxJlIoCY4ASsBLZNEYYhmU/sVOAQ9XrG//9W5xkJTUvOac
 hiW6DapoAXhhnwYvmYJMH3mRbJOF0Pc5udDl4e5Pi+aoXolAtOptQGgCft1ULuLYa/B41meap6+
 xF5MKo4nbgQElMaFcZxwzrpt4H+0phKXgaDBkcbflMspU4zGCD5Qr6H75Pzg87MkiS/WHsmKfcv
 /IT11sOeM8sq+0BkXF3Tmm2v2wMfc91O21Fgc/OjGU55Y4Pvz+gjaaYziwf+o5QFnQIqKTZznwi
 rNoBukz7dq7D6hmGojQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_070739_223422_7013C769 
X-CRM114-Status: GOOD (  15.83  )
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

Platform devices using the split approach of calling
platform_device_alloc() and platform_device_add() must not assign the
firmware nodes manually but use the provided
platform_device_set_fwnode() function which additionally makes sure we
track the reference count of the firmware node correctly.

Replace the manual assignment of the firmware node with a call to
platform_device_set_fwnode().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/arm64/iort.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 34412cd697d8bdc3654c40ca539ddc695a926a26..1020ac953e428797b5b90bd73c6c6ae35e6fd352 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1992,7 +1992,7 @@ static int __init iort_add_platform_device(struct acpi_iort_node *node,
 		goto dev_put;
 	}
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	if (ops->dev_dma_configure)
 		ops->dev_dma_configure(&pdev->dev, node);

-- 
2.47.3


