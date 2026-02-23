Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3320E98DF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=; b=SD0JP918axEq+kjXPh2G+7Gicb
	Z63224Ox+LWZyQyxEBxSrINnLZJomgKUlhhIsnauEgoK+mYIcv6nvLYe5QhSe+Km4I0lv2u3pj+gN
	tqYLqhedEemtapE70QJw1LvK5CMzHA6f8R9qLuQkcfREsAeCNty2K0zaagyw+WL1V/ywX7Q/V6Uca
	EqZ00XLfD9l9jF3XhlTCHBMJ3Ti6W/L2v+wLPNTqs+H/VwOcE/L81Dgv5MM/thI5zYlZfWh1cLTt6
	h0MBpnDGNnuFPo9hUveDeEJbphHSFJf7MkiFn0q8patCcoiiyXkZxfjkX0zPnnQge/AIHvIn6bpE/
	zvXiiZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMH-0000000HMhl-06R3;
	Mon, 23 Feb 2026 07:27:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMC-0000000HMcm-3tm8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MIk5H81249093
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=; b=AhVNzKi/n41rbMtm
	bJgATnTFIfFxKfHJ5a4WVIV5+HHTe8orLjZ7KAno3WPsIvsPXCcEn6lo2+S69uzB
	M2i0Kicl8APo20JMse+4x4D9AOlSYN8ESi5rtS6g8AwrElhexSIzNnd7rsCcSu38
	ex4c2JICHfVu9jBgCqirckqKD6jq5Ip90iOgBaaVKYaqnj1c5UIh33bRuG6Ajz9O
	6qYpdE+1S8agq9pQd5h8IXySalWBph49742vem2av3piY5nbjVVHWDeQVRB9Nrgf
	af50ETrukk+Q6rR84ZOOLDmYYiCubub2e+koxbd0ph8cxUFh8xiBrg2UH8cueYWc
	Ssgmag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9use1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033c483b76so544706321cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 23:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831671; x=1772436471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=;
        b=bda/qJyE/tnDpMOn3hQUnFr4FzyiZElrsrstEzTIi48tdKW1EEOOZ0Sl7tpE3s9tae
         op3Jes5X09pH/j2b9i3HvF+ilWGoIEYkUFS7jOQ6F1O9g15Ujz8n5BUczrM8ddX1TZha
         lnHfqIkRS9i5nLlKqBNPXIPCeFwA7sLaQLGRTqO9FY8dYXvU/fdhNpz+G2W/0/HMM8Jt
         Qaf/v/NL8f2QmumS89eq4PQatitNbkrvLJAhQHmwUcPYHlUI28/zDZXXPjbs2FJ5quBY
         Xsoeqmu1UHr4AXNioScM1UH9MIvtMh9ZsvGM+Zi+BfNHD6c1JUIRo1V30BGsJnblz6Yt
         d16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831671; x=1772436471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=;
        b=aSfATAqO6H8W/H1mWRyyu2Vhl66etXTSiP+X4aYDi5L5i/a4GQP36AAhQ591Kz5SC5
         2d9xOCiL+7vYFFvSdad1eHUVMjaHwnYsrjn46uHPw+XO9qi7NCHYRxxeFsn5MaERL8tD
         OjVZVXZ2hTM7cqKfA4qO/vxkGM/9ib9BAJIKn+5BvK8CTGakr07/QpGO5+e4Z0eLQtYP
         GLGdtvF2ScYSjsyFUtUI72CjCPjhD5gI+4Ui88w/Gdx+lZJyPRRGPgE4bx8ndq8Nel8L
         8cttsTVBB2T9cq5RuCHMmGpTcjVAVJRG6TaAWfbtA/Sy93CEGeXzvkgxkXYNecWvXjNB
         wbZg==
X-Forwarded-Encrypted: i=1; AJvYcCU7JER58xQjG8e81Rn2CMfenqSBVWvUyQRoUfkzddUBxOsyAnFV1TTJ9dxYC2UVKZDEkVV0pSVwnU0Rz7FypLHU@lists.infradead.org
X-Gm-Message-State: AOJu0YwJYTQMTgFmRdLjIdwnr1GNPqawhCbkiKrRCNoqWcYFlV1fvnCa
	LJMu51dUDJvwYv3tKdiuabF0D+ZSGOb90ah32RcMx3d9F8fof3J4FIb1Fjx5vrnoas8CYW4HWjC
	fMPR1cgPRdcoxOTCIVKT3hotJ4CIOiYOmvdTj2daEsor1WazASc5ofnV8q30uID04WnViyYyK0w
	n2ew==
X-Gm-Gg: AZuq6aIBKhK+cxsqvo5Wmm2Saj4pyNfzSOYgS4Azq4s+y5IQQJWXqBBEEXK0/7xd/jc
	iVwAtdEiw+M1shInFcdXmz92ZZRJPhcsrq8j25NliFTnBM9sW1Ii/y9TtpLK0M7mH3+D/J5d0m2
	o3XbgNFTlfLDbBMq0WbYN4KlgsUTM6vvy2AivKxrDM3WsaVlyV+bB1Z94TlZVNhD2GzQ+0WzrLR
	uWko9ldvSJiyvE0BzQJJHcPc7qszx05wj7KV8/rxMbgTdfQMUzeWYmeaA9v5jmlmnjqhhLnzOUC
	+SCl4Bb9xea1G5Imd+PX6FzTEe6bQ8SrJgjmsdyoiiakFb5DaW+Sh1STbxGI2eCSXwBJaYcn/Jd
	FOa2sH0xlRIZjvGyAHekFC670Mm3n6gYcHsHIPx373CUBuA==
X-Received: by 2002:a05:620a:2994:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cb8c9fe5a6mr1011978685a.30.1771831671281;
        Sun, 22 Feb 2026 23:27:51 -0800 (PST)
X-Received: by 2002:a05:620a:2994:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cb8c9fe5a6mr1011974885a.30.1771831670712;
        Sun, 22 Feb 2026 23:27:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:31 +0100
Subject: [PATCH 3/9] power: supply: max77705: Free allocated workqueue and
 fix removal order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-3-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PuW7vlRiKBG5VvIHCjRT7mt2DV/SLWGdgcWu/vmtLTg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFo/UKzNCc8KS1w39QKA5O4bC7woFna1QIAf
 BiaUZZ1gFmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBaAAKCRDBN2bmhouD
 1+EED/9RkN0mxPd4BItqsLJ3y1xwAvEJApbWLIpmsMJXLty2XG8gkwjO8hplcVmzFYS+iOGPsZj
 aPSAVj2pgSAUt12aoLw+ajNWfgCUzP7nsreSR3QFvNiFQf5rQ/wuCbRl2e6IlMc+i5McriHEnrd
 bn3OdqIahOkjSN2RSB24KS/ejjWMDLFu69ADWjuiFRRia+TILRWHGMqWjgawoOLvZPPHgMLEuuR
 zcuVoogWJCE3DW5Wti2+nzH1ufXTdWzHu3m37OrR1ddxunY7RYs9gqBHCDZrGf0DkJnEhBtfUW9
 0IRlqNW+vrhKw4ggkuAe6KpzRUXK+Vu4wuquJBbJDwOSErn90S6sv5DwZPwccOz6O5/2HUAEn4p
 75WRc4EDngZ6BirtmvZ6V6FON6OABNiwAQilzGnyrXz2wTf31hPLCPT8wyTsYkINffmY2/OY5Bf
 NB/DRkDRPUxLp+3wERhCwqCqB7+B7QAKjK2CjdfXDiRFJIsKn0Z/fyVxOdFCZiJwXQTos27zmFV
 tl2P4mW9+CyaKoH7bnw2IulsbIYWkicoDpPc4BlqaIt0iWInuAJMuVG748eqTphll4FFndqFk+o
 6ga4pYKmERVHVmgSCqopHYyvccnuvgznBMZst0XYRfruAygHMVgeyT0VFowKtI6dRsCoIncJh6b
 pQwLQ3EyvLfqsXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX8NJbziYbrQe6
 wDDY87azYfrdmFZq2Zlr6EXF1y3V2dyvm3wtLF7zK9+PSAneMve+A81i4z3JaivbEfWVyWuAT13
 U7VSfwJLH0vO9+joN+XLTleB+p2lHY2SMEX962gMSyo9xBz7AJiBj49/AxUVe8Mf4oCJHyBfuRx
 zpnxjdYhB+29OxQz5oiygTAYkvOg4KMcye/9GRF5VvTPTUMZFMsfguWMVlEDDhhtN1iLZDWS2+4
 xOiQnrZ+8BANBoAz6KbdUEkRDocluH3rXefRvm+1bzjGbHpuIl818jIVFGz3/nS6saBFA4yT3rN
 Ip2hfm0YqhskYCyoa1F5j8mgDwLwZaNetOPdU/KUo8KytKD1A+zPPkbpkyg0n/zgs+O7jgl42QM
 QTOhM+MO5Xoq90mURuUMFIlFciTMksJS0Roo9gkCgiZTiT30RESLb49itViAt38JKeZcsUy2MBP
 kCr98HmIXBziS51JzaQ==
X-Proofpoint-GUID: S0TjL4EeUvyQcK3_UyU0UhwdgMLOFz4A
X-Proofpoint-ORIG-GUID: S0TjL4EeUvyQcK3_UyU0UhwdgMLOFz4A
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c0177 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NrNmjpoQ7DW6B6PU5UcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232753_114590_68A3C0F2 
X-CRM114-Status: GOOD (  18.99  )
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

Use devm interface for allocating workqueue to fix two bugs at the same
time:

1. Driver leaks the memory on remove(), because the workqueue is not
   destroyed.

2. Driver allocates workqueue and then registers interrupt handlers
   with devm interface.  This means that probe error paths will not use a
   reversed order, but first the destroy workqueue and then, via devm
   release handlers, free the interrupt.

   The interrupt handler schedules work on this exact workqueue, thus if
   interrupt is hit in this short time window - after destroying
   workqueue, but before devm() frees the interrupt, the work scheduling
   will lead to use of freed memory.

Fixes: 11741b8e382d ("power: supply: max77705: Fix workqueue error handling in probe")
Fixes: a6a494c8e3ce ("power: supply: max77705: Add charger driver for Maxim 77705")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/max77705_charger.c | 36 ++++++++++-----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 5dd02f658f5b..de12c215366c 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -646,51 +646,37 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add irq chip\n");
 
-	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
+	chg->wqueue = devm_create_singlethread_workqueue(dev, dev_name(dev));
 	if (!chg->wqueue)
 		return -ENOMEM;
 
 	ret = devm_work_autocancel(dev, &chg->chgin_work, max77705_chgin_isr_work);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
 
 	ret = max77705_charger_initialize(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize charger IC\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize charger IC\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
 
 	ret = max77705_charger_enable(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to enable charge\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable charge\n");
 
 	return devm_add_action_or_reset(dev, max77705_charger_disable, chg);
-
-destroy_wq:
-	destroy_workqueue(chg->wqueue);
-	return ret;
 }
 
 static const struct of_device_id max77705_charger_of_match[] = {

-- 
2.51.0


