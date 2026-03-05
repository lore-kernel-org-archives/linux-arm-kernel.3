Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E57F513E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=; b=HaR5f2X89Bg3EGIB/rOYL+JOHu
	HmIhirLuaaRTMRXvt2STJBurU/wWxAY2kIEZ8NJRnid8A/pjDQNn2J1KjnjB48rPgHgx6hyxXTXrc
	aKogDGmbHa+ZcYjVA9Qh52BL8n/LSg7YTNi/K4BxkP7WTz07eRobOIfk29T9LdmmEaQhKDXnUTjHa
	FbLV2SJ7A3FyHu8X51hUm1ZqhYsiUmObMShzP4KZ8vKf0hAM4ia8B6efWqlBYkqqV2ioHNtpskL61
	S01qPkfVn7tGA4q89kWcprW3ibaTt6gw75dVduG4bg0pcMgHuMApoCEod2tLgM1dR3Bsgsd8UDTZs
	z4SJRGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWd-00000002bEq-45yO;
	Thu, 05 Mar 2026 21:46:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWX-00000002b7K-3xY5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmjJ72267293
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=; b=Ov+IYeXyCQyHl580
	YhbBes9RuhaotmCUAKz0h4zKFaOLd8/tSHTcFEVJdB6KXopiHp9iUXCwo2Fap0D2
	Tm631Kk4frs+VjP2udIj16K0WIpmkuQwAqmDaqP0nFv5H80yO3BFD/f5lb8sKE4D
	4YDPr99ljDYrD/YO59LlT12dnSK7tqc33oCibG7vKq3BS8yflyJCHAVZLTAjlWzX
	AnG5ISA08aa66pOBVm9ALdkuEAe7GizpbZdWTTNY5mcBpOWV3RTJe2/T+4DiaS99
	NWFYIC8KxY1qTqOhEPprHTKb3WbwGFsKvXNcqAfnkzrSR/HxANEXlqJ3bMERuPlq
	T095Lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380u81t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso1095478485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747184; x=1773351984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=;
        b=bCs4gtHhJKgHkIynK+dR53Eq9BEOYKzOxVkCUWM8jHj4jzF79220udW1z8lWajPHmg
         HAPCKEgBUGGH4QQRIF1HK3BDVWTnUoGv1ERtKGNnEwrb/tYFOEAISsArHVsQ3iirlNEo
         apOZZ1uCaniq1vZ7p4vqjofLLtY33D4IxaELvsnQmov/5zdIhuTH7t28FiNIgK6a8XOf
         DOM6OUUCn6NHIJJQLRlubhQVi/KI/IRZDvnGVe+Gf6LrggOWygI3YTOaiY7s1Fnxu8tx
         xahIUd2yP7vsVQLnXyqUhwvIwy3OHsOVyHCWNzfLyE0utTJ+uHN2laBxAFcjIkH6ENPy
         SOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747184; x=1773351984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=;
        b=GghvstzRuOAbW2BKg7A6bp21taUEgsx+FXOY5IbLhSnX8RJyIbkauGDVnRN4gxw9uX
         bzqGQoVHVH76Y0zvO+wIJ5Y25Dn7iz02CMnhKt5dPoztq/lG58nbjcrMj3x7NM0PiDOZ
         IiYqdaAg+MvRRagDT5JA1b+ogKAZ6llowPXm7mamkrvVmIUAiaqZ7yrAZ9AmSrP0m9QQ
         gqzprTc4nZ+7ET1PEJP+irT70mhhs2a6t0SR6bAZIKE3vz271B6IlcDm/rCZYiurFmQj
         uuiVpa0UCddhPN7fkhXQbFaH+WkWvqd7kKLOKHhjQGfSgyrPCuE4e9naEO24QLnZsff1
         8ZzA==
X-Forwarded-Encrypted: i=1; AJvYcCUm39AyIC/+/F5WJRM5irHyNkvIYvxQemiwBDN7zzyu24YPCo8bvAS7Z87wwonptBplZv9594XwMvXtI7Z7xuLB@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ4KwYnpWgVCpWM8QBdfK/JjV+uqWhNxZ4fh3Fem2ZHLLJy/P8
	Hpqwns/NXBa08E2SeExDdr6ojoHyGz+CXJBvMLsUaS3l9HHS9E/VPBcrIulqgQtTNBreWWQJM+Q
	3nNG1yOavaFtHhdq2Zie2cPaFXa62CXiRFmMjjD9Fg/l/5cWWb5LYHIGCp24+EpjEThfB9EJhKm
	DZNA==
X-Gm-Gg: ATEYQzyVDSvxDQzVmw+ohl6ckDq9xvbcOxyayLbbGeWF2tBAvmOmt5WO3K35e8X5r1/
	+/CtdDx8/T0QNX+tBpcCInCsEjYqf2naMy7e3wsIGBjWBcC0lSQtiz9o8EuiGd3i95F8fereA9z
	1lWul2fk78HrKwlC1xKxLj8jPp3I/60AhfYizQA+80mhCqUpUAH/yCJRlrlIusDVmiu8tZQpmA9
	Pzl0i4PmEx6WjrdcaovUirarm2BUP0ocTFCpUngI4Us+rMX4py+UcuMc/XwWEuQojqPmL0NQ786
	eYfV1hr2DcgbzecIcuhueDx5qUw2s0KRLp9qLhAIPHs2hb/MKcnw1JyCPvL5uUPfLlfusfq9Eud
	TOjmZ/sv49c6uPdQRQkmgSlpF5c+9gQidbk/vRKUA4cGx
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr5040385a.7.1772747184122;
        Thu, 05 Mar 2026 13:46:24 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr5033785a.7.1772747183545;
        Thu, 05 Mar 2026 13:46:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:43 +0100
Subject: [PATCH v2 04/10] power: supply: max77705: Free allocated workqueue
 and fix removal order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-4-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PoZ0eKm8MLgOO90bXKtZwxPlfboU8J3eYOJIbv0VDv8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmb2gO7y2En1OEl5OFrZ4KkZpCqXAC1BJCWa
 rs6OqZthfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mwAKCRDBN2bmhouD
 1xQjD/45+o2CDJzfafztbtIZA6A6uwd2/M6StDF+nW79PQVfIupsEalhQKwpwZ4AsUkT0Uw8RGj
 wj0rA71xQpR3ABUAkbkTWK29AtuiG3exU1uIDH9aCZRainZVaR7wkSUHCvMgKsaTp9dlIsn/7bY
 w4bO3g2L5ptohXvEgDXiLd7V+2bX89tyyI0oCiQhDwFCBlhvzFZ6x7iqZbQ4E/CLc++QQQA6CZH
 nzuCgbL17+egu2SJsyhPXHZe/+O2mKiTAYmgK1tYwfD3BErfUDoR2RNwOR9JzpmeufDlWnGqlTO
 EIDMTiPrXSaF4bQEb/ft3SNHmkCmKeufktwmwfOLdpfyL4Y3JXmolp+1IjpJeLodU4EXEOIYQqa
 v9/iviO4p0/enW/wWzn0wYZhB9qAUGTF2Zq4hs1xJqhr6Wd46MkRRpEdOFUntVvF0WnTuR6rHil
 d8tykmlOpdqR/4hP4S9icOrQ38dyPg90iLESKGi7zVvjVXzDWThzA60B0cJjcgCUxSAVtOIW3vK
 MXACsTA6NJTMi/oPTFMFJJjHJHXFLTEvTxIsHdN6fDLQTWtAHkD7Bate29s1YA3OC2CEx7umvTZ
 5nmi58PnCwirVetEziWYHH+9AfaojA/6g2yTy2rWOnwHbU0uXY75M11oJychETq9y86bCN0o7bV
 jVaMqs2Z9iuPX7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9f9b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NrNmjpoQ7DW6B6PU5UcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4i8DYBxdHE3pgBPW90UqAFZK59uBLnw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX5+2jbQpkad2Q
 UaviEMHigsdLfPl8JgPNS1MS0FjdtdAO7CRrcp79IZCOam8iDOvOewVUnuWDQ46p4vkAdskKxNm
 c+QSpBPPa1VeTahXMKz7kaVgbOqBd9BiB1Af1E+ZoMP3MH09Cumzqx81wb0V4XMR6AZvniXBJLy
 WGbPiUndkFToCnOCj643PBhJrKDaRyC1hcev071dynRKjqpMQT3LvM+JZo42WnaMTLdhMeRNdi3
 1xNVPvdcU1nbT2N5JxtEFxI7KH96NaCtH/PJN+b5NhxK6AMm5hwjns4CrltlvHG8YR89vjfBhsK
 GsOp/duNPgOdm3xITSqLRqsmCJTwznBKXFL6WeicDqvlteoEETHEI1xpzYDQggWBT14kfcXulGG
 8WKufI4cAfdqmC0DEJjaCLv2oyX6N0cHqdU6lyxj7/6E5OSUY3l3SkttjBHCQGXOiWZUL20Py+f
 7n3YByOnX6gXf0e7DBg==
X-Proofpoint-GUID: 4i8DYBxdHE3pgBPW90UqAFZK59uBLnw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134626_109577_A242CA8E 
X-CRM114-Status: GOOD (  21.24  )
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
   reversed order, but first destroy the workqueue and then, via devm
   release handlers, free the interrupt.

   The interrupt handler schedules work on this exact workqueue, thus if
   interrupt is hit in this short time window - after destroying
   workqueue, but before devm() frees the interrupt - the schedulled
   work will lead to use of freed memory.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update power supply (power_supply_changed()) status, thus there
is no point to run it for memory reclaim.  Note that dev_name() is not
directly used in second argument to prevent possible unlikely parsing
any "%" character in device name as format.

Fixes: 11741b8e382d ("power: supply: max77705: Fix workqueue error handling in probe")
Fixes: a6a494c8e3ce ("power: supply: max77705: Add charger driver for Maxim 77705")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/max77705_charger.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 0dfe4ab10919..63b0b4f0cd21 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -646,47 +646,37 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add irq chip\n");
 
-	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
+	chg->wqueue = devm_alloc_ordered_workqueue(dev, "%s", 0, dev_name(dev));
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
 	if (ret)
-		goto destroy_wq;
+		return ret;
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
 	if (ret)
-		goto destroy_wq;
+		return ret;
 
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


