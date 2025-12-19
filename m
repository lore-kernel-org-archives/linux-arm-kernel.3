Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCA7D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e11O7WAtQq0V30sjydUBQo6QneVAGBPiSxZEi7Evnj4=; b=kX+eDD3nGVYnlA4OizzoBmdmL4
	fh9BBgX27Wwok4Ris93JHjTBhANpjHROKq/h/9ThisXDJ1+AtFPYcfGQCCS8CSTEdE+ttOMxtePE7
	YhsyX0OKkRPsmF70oTnT/niUy+LGy29wO/DaZzwyImDjxGvbrKXpAfHNuCGhvz6SJ89dQh815MEH8
	GsxqKdUr2ixhsBEfprSKsnbijBi0c6w+EcrR9qRhlIsKGw5Un1WqUr30XffQ/loWLFR5AzydH8ycH
	/CjX3Jt4N/1eSNqLXn/z8xXYiJ8K02kyaFC42gb40sKLCC+KTqq9kW2JiQPwsLDg5mJoEOKgMKs7l
	IaYwlNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXSx-0000000A2YU-2av5;
	Fri, 19 Dec 2025 10:12:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXSu-0000000A2Xs-3eq2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:12:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c0Vk3318764
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e11O7WAtQq0V30sjydUBQo6QneVAGBPiSxZEi7Evnj4=; b=GeF5/jDRzvlTX5tk
	KBeH9RWWuiWLoNcy4OQ0l5vlkkUN2mr9hTQRTfIwV7EYaZWgWpO4Ton/fzyJIYUM
	+faUlY7hnMJlOq0i4fpga/eQ4ZQ/zrWfasFDIF0vyqtKnz4/tHgNoL7TeW5lPdTM
	XrxvU9wwp0PXGU1mT7x2tcKBqHZGtYgCcezB5fLp2+UE3K9gs/Hn7wJNsRkLEEer
	ifcfw1EbWZHqMSLyqGUFAKHnSEIvOumcPY9LDKgdufupaaAze5i4aH429Rn/03EB
	FrM6zGfdfPaAwfpZmWniuqkjRfSTamxX5CMShKG4eR52WsDrRFbyVAeMEEmADSGs
	qxEY/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2et7qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:12:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09693109so28730481cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766139123; x=1766743923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e11O7WAtQq0V30sjydUBQo6QneVAGBPiSxZEi7Evnj4=;
        b=SFhax29w7bbJQIjNPqdjOV2rTl/0gPzHgw0tGO9RLd4BELSKSNXgStI1m106aDRZSs
         vsdkyCRAW80YJgJvmdWESgPM0Vc17qO5YgL/zvG00zz50R2fTOPkSrTk58nK++65C3uE
         aebRtwC7dlgZYa3EbsBjtZQTTc6lA2UM/AyCoL+wwlyWTtadz50dWBvAaihZWgy4e6Gu
         SO/Y8eZtM4sD1M0IVN5jP9Du8fQnmL6can1PIxy6PknnCMLBckaV9PkRUDwlZzmy2498
         XOxiuzduWac2fmeP1MMUDkPLBDgDb6H2chz4kaeg4iVxe9FppbYTZcwROZa1XkYXuDPz
         AnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139123; x=1766743923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e11O7WAtQq0V30sjydUBQo6QneVAGBPiSxZEi7Evnj4=;
        b=MUiL1lL/XW+FIR9xOngm+JwcV1eJ1vozHZXOUnqLDFL4GtMlxS74F7EA5EU9iDReT8
         Kh2roJloKxwkFdY984oEGirBTH4VTwRwRYf+zdCw6Av+Hh3YoNpxzzE12iiqMopu/xEn
         5rvJPrri1YLSsGHzV8qe4p3A3rA7mHQXm5ySbhh9ZIbkjc1nppJGJi1TEGI+Z8HfpsRZ
         dm+6Mjt8LLIGWNqOoay3NtfqxTLVEDqv6rXvVqprI4rycZ9Nwo3UMOzAzhm2UqX8d2n8
         7pSqf6eueOt1eCzmSqfMMMG5zfat9OQjuf+bkQeFtex3+LL11Y/9MXhtplwxJQE1MH0w
         3yfw==
X-Forwarded-Encrypted: i=1; AJvYcCU7QeloOJe9Xe3hapIHH5iL5CnD4oNWSaGIsKQSIiwMAzIC6ytmgvz+GCLkJSYrbL+wD5DW4g0RVPWJihHjmBOY@lists.infradead.org
X-Gm-Message-State: AOJu0YxhnBB9X/+ybm0iSCcgtuGGUZE03CNZadHRC9NTODrq/rvPfc3H
	4ckWBBJkA8yBftGnDpTVU3t1L/gxS9NtnCzHTSHdrpqto4Ti975RoewjF5PIRbdiJHhAmzIMdcR
	JJn7VD3WMBsVc8f+xZjwEv8Pu4GM1HzcHXGU7Eht97k2tNk+SYHj3xwJ1d31LcvqpAkJeQoeqX+
	1YfA==
X-Gm-Gg: AY/fxX7V/eRhrEyWHyIliV6BDgEWiFkBqCqBM/YpOxMieW7OvnXOOYaCWrlYdo1UfXN
	IPrLhqf/ZA6kPSud/QF502xLYIkY1T2Kv117a+ZiHPGt8j1sxEt+ZiNjywOBoVnVw2ShQrXHSr6
	ZyuSi5uQ0Vv43tQD/SH7u2PEek+VohS2qxc8ZeQKcvpW94noyyEeNRIE1ubns6zxntdPYTWXSDK
	eDH3palW4ZLfhPT4CsGYmF/mkBWHtMkWsLScgHec220ZtKagBG9GxrkFU5hyN7/A5oHD2hM4906
	1DaKQwLq5XykWws7R9BmPfFvGIYTsgroG/ILDFM9/5Or9xTqBvEHijo2DZZ3Nh6Y0/g8tVYue6g
	Yjestim7nUrYyKBwbQowQNdYfn02i3w2fsxNZ7S6eQcIQmV1w7eXiukhbf28yDTtVu7hd
X-Received: by 2002:a05:622a:10b:b0:4ed:bad6:9fbd with SMTP id d75a77b69052e-4f4abcce28bmr28251951cf.17.1766139123150;
        Fri, 19 Dec 2025 02:12:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYPgSaCcmPuoSfgXGVgvOFCxSBDDQbQDNSQ7Imo07pG5M/eJ4s1sl+/JwMksm25q0myLjohw==
X-Received: by 2002:a05:622a:10b:b0:4ed:bad6:9fbd with SMTP id d75a77b69052e-4f4abcce28bmr28251701cf.17.1766139122704;
        Fri, 19 Dec 2025 02:12:02 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm197282666b.29.2025.12.19.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:12:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:11:51 +0100
Subject: [PATCH v2 2/3] gpio: creg-snps: Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v2-2-5c65cbb513ac@oss.qualcomm.com>
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M1I1B7Udnpxw3kqOUmTDz8mzC1Q9PDPSdhxdkZyTeg4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRSTsTLtOg852rwGRRm63SKoAk11EUA/5yATfQ
 DO+VbDO5TOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUUk7AAKCRDBN2bmhouD
 19BvEACXOJ82lmOwWQMSgzD0/7AV53q93RIe1/uPbkJ700ZIodWgSNwvAQOuJL2t+iJjswOoa+5
 g+KiL3++EVh57qeKMhDO+yZddKJ6FmBBk54v2TYk//064TQLXKrq4uMMrpVAGNUTgdr4Gi5VuTn
 hSbJC+UO9+DqrqjV2LhTfdgKzfcY+eo3i2cECkxN4bt2o9afuPvaDF5tm3Dfd9RT6NeDx7ZIWo1
 jltnNlPO1kBiAyXo5V69KRadK/kq2KwNE7p7Ff8SOgUM/T0yzhLiLWnrEmcA4/2uyylVsf68LgS
 GXAo5JqGkrsUFhwEPqkYrtJWatupgA8Hoh9ihAlQZYOQ8+28a1Y7ynm+cTPJjpf30cefaQoAFj4
 oPNqT4X8N9lQzYREgZX3XP8fa4hQy3aoDPeL8CCmSR3eqq7zZAXWuKXDaiS7GC0rFh2dpQPx1nD
 HpYt6mxmFi99aEZ4Q9nuS+0+hiVhhUqaT0TLTYUAnuz8tsqnGPLLd8U+xkcUe6v4+QHCgtHjOOS
 n8RPq4/pus8WSdRRqeXiCgF1Xd3gtn0DukbIqFOnU5XCIFdtcp38X/5P/UNErhukcsol9d54//V
 O4J987p2MsiD4NhRY/wzcJ9pYnlb2ElML30pODiLxUti7Z391ROqFczfNaRqOt2rjC2ziiZV/g3
 BrFenai+e+qKnFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: TWdW1FUozQROwdFcKqRi6BPoAXYOH1Y4
X-Proofpoint-ORIG-GUID: TWdW1FUozQROwdFcKqRi6BPoAXYOH1Y4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NCBTYWx0ZWRfXyu/w9q0UWMil
 A+BYMja5JiYthyClaINTN4cQcmTn8+BBxrrguFDTFZOYIBnE7EA9kqB0UY6cyrdVaU3ZcchQza0
 +2q4FZa992p4IFwE1EXnmR4cBR3cRLi/2h7yRY7QuovwuLVYWfQz7UDs7aLmZaQ4h+KNGCsuzf7
 S1yxQf3k7XuGn+Xu9doWHJp93rzCQ0dJYxpFSgBpZ4zBf3vQcSS9pCRZx2omlxyQWooD1PyM6sd
 Oga6YDxMbeaVaDDAFPhr5KTGJC7CDq1GeINYKbvuK6IySlQHsz2eT+siAF/yuxgWIsH7cdQAys1
 YtAqWJY5uDFIyethvxqzy8cYICP5p6HGLt7aeD6fQAwrb8laHJfqaZP+Ks4vV+JNYTO1tZw/fQk
 2bNghxiJwhZYYjQ0MKKWQAlanQvbOaBJabNPRWdKJYre9bTYHf11lmrB0U/9YK5JCXas7wKfkTp
 Nl0ZbvTJdUUESK2vrrg==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=694524f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lsN0KVCTPuDBfKR-m84A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_021205_055073_C6E937D0 
X-CRM114-Status: GOOD (  15.97  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-creg-snps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index f8ea961fa1de..157ab90f5ba8 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -134,7 +134,6 @@ static const struct of_device_id creg_gpio_ids[] = {
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct creg_gpio *hcg;
 	u32 ngpios;
@@ -148,8 +147,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(hcg->regs))
 		return PTR_ERR(hcg->regs);
 
-	match = of_match_node(creg_gpio_ids, pdev->dev.of_node);
-	hcg->layout = match->data;
+	hcg->layout = device_get_match_data(dev);
 	if (!hcg->layout)
 		return -EINVAL;
 

-- 
2.51.0


