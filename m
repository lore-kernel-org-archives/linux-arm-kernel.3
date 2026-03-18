Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41880103E164
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=; b=c/jAKtY03NnnuB7PXcsvgC8Vlw
	pO9EIqkRRlJ0FHeGd6UgNjpC3RbnBbZGBTfXTVpXwPhDHKcCRYpVh++/KXaoH4zqgi7erAVfpMNDB
	Im2/GSFl8w8uYSnoIT0n48uWYFj04PbAHjhHUVAoCqA0+X+nGU4cS/8Hz2sTBVyp6dvZ1prv1H1k5
	zCeeq33+A2I3F1mvLuGEjHMTtWO9PTR2+ZcFFoJTvgoodsVFT4/1PlArsa4G/qmf8c3k+BRi6QxdO
	1gCtwiaTj9EG84O39o9Amq+kj2VBTNsLV2kIecMMm86ppuoguMBIVno/FRtH2qQNZjQLWy/Hgj+go
	1Kdk4CQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oly-00000008Hby-2iR7;
	Wed, 18 Mar 2026 11:09:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ols-00000008HZ9-3JUT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 11:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=; b=qrbsNqjaiQUFk3rk7XowFyj8c5
	+1zUc3UMdwgjAhxc+ex4XUctp2Z8JfnxWrMQJse+vlKxoF5oQRnIllFe1l1UhyzYVwSkXHP3/Igcv
	wVhHpX8TKJ55LqBsNsrq2E5uRsehN8UWznMyLL/NSbaT/e6uw9WynWOdEOkGsc0DoTWlgwjPtfHxW
	1l920N0N1MPW6EZ58yXV81c+QbFHTTjH0kLqlkuaTWhEQNkCCwj5iJn5QzFkTIz0a7zNctYNuafAM
	mypwkUZuQ5/Ck5G2ZDrKV+c/SDXG+Mua6mrtTJHTFtbOv+6JLs3k94Qx94llSA6STsnDA1JZprLWI
	tgbUPWRg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olp-0000000B2Ot-09n4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:09:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I76dIj2612647
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=; b=mIbYs81ep9WbbYOQ
	BapTIaBpEriJEWLwOZA3uIVP3HQYcHf3MkPRDl4rN+Exk8zf8Cc4I6bnKp6pb8ZX
	U5cafXU8ZLCz4aRjq+tm9GH1FqbPVpvmtheFaM1biNipilrrVuhSP17kOSUCM1pf
	n4Pwr88Y6HvJQhe92viMenlX6zmIyEuJDqfwQUMKZNP0LPK48eWsRXN33dwvIgQ0
	+CeSPgx4MiDWxnGK3Jz2j/BC5CIjj0FxxDNA1eJQHETYqoK4mAHPypyfyo71X9KU
	/dwSf7hXtCWtbi9Ic732YTwiU8AKPVGbbBOkFsCJ1JgEuYuUcxt1iQgJkRAitR1w
	nO0yzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcds0px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso128703631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832139; x=1774436939; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
        b=ZdkfOFN/oWkKXgJh5RuuCKBJ8FyxK2wJMFh3DhpGLuJN2nmJvhLg1j9Vb+GPcR4DAX
         QNQeh/EgRZ5HwyQc9SBRhW9S69rSpxMoEPCrJ/oGXKCZI7TI5GHnnbpEMcIYFrKT8Tx5
         3pmnUCT3hurh6r+PnlpfzX5T2qcFKuxqG9Y1YsO3+jLxfDdDUX52LmQ0bkDDRq30cjwb
         v+ZRKDI1m6/pta41F1b3MmHDmjFeUDU2obFpp5ZP/1oAbitqIbCZZohat+z+LMHxt7tX
         +3Q0Ro0LebMNCabkKQnHhUAW2V4KmG9XCrp0Bvz25TjtymGh73X3D2MNF8rn7+pYyX+8
         qxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832139; x=1774436939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8f4wOWdkvIrOAWf4nJEx6g4vy/GU23SFx8tLsGL9aLA=;
        b=E6xYONIca6xZvd+jhggRcK4IttI9aw7VKLtqaYPg06REDXEtxPC1SNux3J5hmCqgeM
         sKEAzvbrtMn+2boWV6sZjbsZ+N0ixXAuioVNhDispPebU9s+7g7fX2ZV2Oi+EomY1Jnj
         Y67aRHxtpDRo/jHzV3hfdIViJ9PMHVJ2cKApucPY8mb9HzHBHCz6yl3h6fAGpA69Mwwd
         YGmS4mKzM0VP96BiZ7Ry1kWQ41n/YUuVjfXl6MdPplw5VXuIUBCFgAh3yE7qnEOvHzli
         GsskL4QkEQxrk9dJVhf47rczRlilWI2Djz/i+I2/m7s/CRSVFn1fb9KGZgojOO81vATw
         wC2A==
X-Forwarded-Encrypted: i=1; AJvYcCX7xV+f4PJQUeMt8zg08X2i9E4OYBC3DReN4KRMhYLBq3b2It9RSOpvz6Z3Q0axCUBPf8K9BYiDId4JSK0iN0c9@lists.infradead.org
X-Gm-Message-State: AOJu0YzS15lyv0txXU6vkpYrSx3z3+V17Lf9F+kXcPORu18bweKKVGbb
	Y8Wi6OSybdd8LcHwMJrMGJZ9gZUsQ1lCnm1bf7fAUCFtHAOPeKErAjs1UH2YQNeGFlRMoLbOHUc
	SPKKMzHl9nJgrznOfFc/kfWO15QzZjw5dZmJR//HKE10DLetWEJxwN3lVxyJLNrXAn6VeUmycyh
	x1Pg==
X-Gm-Gg: ATEYQzzWQS+PRG6cYQHh7kMboRydhC/uA3Q198WRSlySIs/k31JHZA3f7gkewbroY8U
	6V3z8ds3k4drwFQ873KwWJBhXgrH7324bEh4apZ46C/N2JnkggPN4Nzjhe1amrVTMIfbAugYX6v
	thfotPER5n7gdnMstJhnUCn9pHTpFkrmH65r38P397iQnho6Eh7t0xWnI7q3Jpomm5tCi1UJmR4
	ZSXUZ08RpeUMvNA3CCHuvA8EkhenO5/PjL4Eu773fSJINhcIqgFORqrlMXlVTGmZ8gnn0Ctk9W0
	ykTkkILD3+z4ffRq+2D11xEMHLgC45YIzGYqgZ67dfaXCZVmVOpbOaaCP5r2b94CixrwWGG2plk
	n4q7dm+74BK2E+dExUshqBWco/ByvDpngrbosSpbDVge5
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id d75a77b69052e-50b1477e302mr36059181cf.15.1773832139145;
        Wed, 18 Mar 2026 04:08:59 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:509:3c33:9d25 with SMTP id d75a77b69052e-50b1477e302mr36058361cf.15.1773832138604;
        Wed, 18 Mar 2026 04:08:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:44 +0100
Subject: [PATCH 5/5] clk: qcom: eliza: Cleanup redundant header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-5-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7vmfmVTf1sjmsQtQiKvutgOgGxTZ7kdgXKEyXYC7s4g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe+N33ivwaWe6BXKCojvQtemLpM2oysrGfqs
 SGMVzmXDy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvgAKCRDBN2bmhouD
 11E9D/9X0bFqIQ0WUbs/0t6VOpmqg60At5JzdaQHV/nDaIdSLauMo/g8yEnoHKHhSWttJSl543e
 SkftcPjGYwt8d6vaFS7F+Md/n+ElnK7CXvwUOuP5BkZ0CnegvxkLOSrxnwka4gRcQPMZ1o7WZdi
 v4Mu6Z38qPc3DGLA5tLddd1zAUfoefkMNuVGsrIJlD1uRVjiNwlf5mazLxNdcuPmXvJULvRRjMS
 mmqkqjK8LneHUE/lVMo1rhhz7WGvhVgdcPoUnW5LLjnBxW0skHqF2/HvmlR/VHKkWLBwTkr6SWk
 dGVFLOyzV4+BHdVBWWnu51l+KGB1zhyNrb1rbXRtzCavk91zPVuU/aKkYaocvvSWOVBpHmFw0R0
 wOiR12Z5Rg02yFsEaO3Swa6sWu78jXdppkKIqYzkpPmkmKi0dcepVWE+nVReVm10tahEyO4rPoX
 wp6Gko3nWLsYGssJNiplPknAvkmW5xxFacsco4i3Qm0+lraVuPgDgZ2n3y1o+Y84Up/wrpQ122r
 dDj2+SYF8nnjFFRhTzsEHSWUS+gB8SynYItA9vqQdMqVXQxvDI6Yka/Df7hDl6B2xdRjzCBo+rP
 TR++V1c9me6Cjc/awkLQg7iRQFuOF76zqAz+FFFfbL6OI72pWhrV9U/ZpalblFpGp5Lba0c8Bv3
 x9syeqq9RIHeeTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX5YmK3O6Qa9AP
 Jsgy8ZvuZiDqqgys4bzdmxvNwpaEjtb3JoLo0jk5aYFqV3mKN3CvlBRHvyysyhp9NWbWN4zj4v1
 cDlHaesku3icJUYxrYC0l+wuEBxZAFMpgioen0PTJdbRYkEU/v8EMHfaRzPYDpBKj5R6k/vQAwI
 cIYNPhLFPU9w60U7pEp9PSS8OFsihWsKq5qYc+imBy+9rne9KTvyKdOmNLIT1pvl7h3oTIJhoPd
 uBLLQMhFFJJK9CEOWN+l+NmQgtaTiQA8+laq4MizJhX6i4nAyfyfNzGFHQDuxv4jsIRvYB0usPW
 Y9DPQTv1kwd12dbVQvg4Ed4ATKAcu8aVOpDrktywkR+yWXa80E7aZbFw68HFVU9tdIz6ecLjkGx
 S5+B0aBkks5ZCXRYgJnqpYYFA2ljhfzGUQSgW05RJIGxBatV/yDJ/gdCx0Ty0CUBlX3fa0F9mqT
 XCjdOszsJq7eLK9rV4g==
X-Proofpoint-ORIG-GUID: W4VIgM9FSJdu8tLja6X3lZ2KsiV-m0hj
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69ba87cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2pKPMeBpY-3N91LQmWcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: W4VIgM9FSJdu8tLja6X3lZ2KsiV-m0hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_110901_442292_66ED73D2 
X-CRM114-Status: GOOD (  12.52  )
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

Remove unused header includes - drivers do not use any OF API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c    | 1 -
 drivers/clk/qcom/tcsrcc-eliza.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index eeec4ebdd5c2..06ee1469badd 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
index ef9b6393f57e..5a47a4c77cb5 100644
--- a/drivers/clk/qcom/tcsrcc-eliza.c
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


