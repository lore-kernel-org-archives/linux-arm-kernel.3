Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2E2F513E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=; b=Efj1Wam1wDUVOrIYKsZ+jTkmg1
	K0zdR0Wf9BrWACk+RgIOS4Hj2bi+RuK3pvqY7+6WQliZ+14yL1d3yW3ZkN6XtVhwhm6khGoGp9v9/
	7CFWp5lp/wSadUkrS/Ti3AH8yd079A/tLtRrkLq/uXR/NZ577zOP+G68EWmhwHveYk+AfjiF8yxfU
	M+ukZJOY0CXBnr9GEba5gXPM0T61JVifacEQlJBmayC/H2vbS5d1SHOObXywqmrb5kSMs2Jy8LOpV
	HTbNXM3bBrPPkUrUCY/X7oAToLjg+x05qYBvzmi78HsjCuMxlqtWqytjrUgbdPmvq4NXLtbDsxkQ+
	032isKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWb-00000002bBU-07yK;
	Thu, 05 Mar 2026 21:46:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWV-00000002b47-06R8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KnoRi1813216
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=; b=bKCS2POPMQPrhHTk
	ngNEQyMtdSUmID1ke5PQnDAWyP62jpHAdCAGQ3Rlru28IR2le3f4V/FpLO2n1OQm
	cMEG/XkRS4ik+VDEjHAlj3RMPaUE1GYVcEGbUy1wtOhDdF0n+sueBWvOEY5tn+fK
	YsXx2uEnAFpLhBX1uiUGNpRMLzjUq++idIRis2YSfm3ulhsiDpsQLOS2P1GdAC7m
	GSzaAJGqpZpRcHQsXXk6dZjKo1iW6zpEH6ZACe75dKr7H122JTczXqU3o+Qszzbd
	Iv3WjqUH0Zbam5CljqlClCvQCvJjHeuzykxsgbwm6k8fUfxCAgddNktl+SoLAnp5
	dPt6sw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp407ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3d11b913so4848717085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747181; x=1773351981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=;
        b=dAAjxE8p5FACRwrJDh03QBDopQs7gQftIZ19HxXqZK9zFDtdhg4ovRVfEcZVbHLp2r
         Fs1va6WgqVCOCMV27LSkfBfJAjDE8VvpJ2E3ODJYztCnENcQlm+3tu7N2CM1+dhCFvS6
         ZgCpoidm4h51y8fA8YWV2P9ZeQzEKJqfI5kS1w6yRiQMtaWD1cqQ7Ym6WuKc/y57BWlx
         BIk4suaAzUgVdRVSBGkF32fjMo7ztb77whnlLdZiRO4PWQDOFHgph0c3Sr1tD7KmV8BO
         PVobCmi0mleWBkTbl2QxQToG1MZag7wudP3kqUXtT5wdmS7CoxOEkMI+kzWnMNsc1hTV
         zILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747181; x=1773351981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=;
        b=nUDmDx9jRzj+PPK+tWDAhT1SizqCmbhJtOiW0i2CXj4KtTzZMbZDbDNHfDWuDyUYxU
         XFAnwHDGiLzqRjBsclsv9oif5wb7KjmnC8PeanjZFZLUDPKxFI0WRkzE4gapPjFOHK85
         jkVhvuOv7pDyCvxKq0B2NW99Rz683DDLVGSi82/7eesZ9scLDq1tM+r9hsyL5/3tKRfh
         YkDslpnB4ZitychvhdUBnnM+d0zWRdcHi0hODwIzIdgHjeovWUQwl0KF3JydMhmYlqhb
         tUEPijgPYww3feyXPvXDGt9agU/b+oc1dxpSWZdjmH18kK9iSyajaINqNIfENyRddyri
         z4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX94RQLOT0/IKX17avDjSi4amq0WwV/8jtN7tA2hqUPfkU1xru59FP4ucLy/k8dAkLpn2mFgY005hTSR8Saace5@lists.infradead.org
X-Gm-Message-State: AOJu0YyMEzTw2ahdNS59GTEgx8bC9CMp6FqTQQufjWb00uH1H4T2KL9c
	9jzGat7hT2P/rGdsfzOUKVDGzWObthHbG7eDDyY16fnvy+Wxp4Bu11Rh2alKzfS/mAx2BGy/jtA
	0PFEt/YO49hFcNyp9odggvcQUoKo3aoAoBIXqFTO0RmqvGK4fN1BxIhhkBY1G4vVLVkpCMP/S/M
	Abvw==
X-Gm-Gg: ATEYQzyDwHHgR6Kk5vs4kzj5KPCgSqrU7G0OYCAI/hpp244XP2y/7AnJRxt3iL1r08v
	yor5g+pyugLGbVZhLBRt7n8KxEmnESQcvtRHuhFxk/vb9YZu/LKOEHnZ8a2cjT4nBuM4WmdTXRp
	DUKjD9rFrVrAD2HE8kS/01GLcnW0CgyCcbrAfcqDdb7gxG8czciDIplkRy3hKoN1yqw2TEQew76
	XoXco3D0oR/tD/99YJmM9nHAfuKmYl5p+szgkQYQbxx0cm2aLeTIS2XOYbx7A54H5oUPMoO7le8
	UqErAe2R5/excHaJhKEHlf7/00OTP1Btif9N3gZmgsrCOtzE/se/0ClGz+VP8cW1adksyjcxeUs
	nIZ7RGkAAuEYzlNXcadGe3okDlP8bZyWmxZYXZr7Z5ykv
X-Received: by 2002:a05:620a:4494:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cd6d3966bamr6926085a.33.1772747181610;
        Thu, 05 Mar 2026 13:46:21 -0800 (PST)
X-Received: by 2002:a05:620a:4494:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cd6d3966bamr6920685a.33.1772747181120;
        Thu, 05 Mar 2026 13:46:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:42 +0100
Subject: [PATCH v2 03/10] power: supply: max77705: Drop duplicated IRQ
 error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-3-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6wTg5DsJ+ATD7iLynQ18x4EJDM0BB2ZAPMsN3b8NZJk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmb4FqaUPE8Ufhusp62MvQj/z/BudC05PFyG
 lRWQHQ+flSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mwAKCRDBN2bmhouD
 18oJD/0TgRoahqQolkN+HXA2B7CERLNPQLecC5FxtW/Y0TeM3mpHkMAh5y1xBix+0e9BayIEkGg
 SMrEr3kgC8I9FEc8Mc8G2UFY7AQpAHuFGmjnjIhj9YCfgJaOB9GLUtsDkzip9AjWYMuEPNdg0hH
 N240sOUOBCgzBgfGY+5U8AHaK7JKZp4nA257ZtiwWR/9Ua7KEXVvyXL7KujZzgWoYIY1H3CJ+p9
 T2MII1isUfaViTmqZnLN/EDTeHMwvh2SUwRMBc0x+oROHzkHmx7GkhwhXEFpFaQlJpLhHdM0cr6
 UCteNGZaYTAhPBNZ3Iwwg1g3kHUQpAtuxMGI6wP2TM2T8thzx0lOP1vpCHoyAKS8NffvVE4Cnlk
 LJeRT9kzSPj3mNfW2tQPou3NDRouDud3eSUX7dHRCsKEgWH94aGzbAGxyuCFcq/tWFl2XXBOmfm
 44H+Vcs8ff43di9cK0YWiJtn5Sk14hXiz1sz6bEFr/nKpKDdCiJw5sSjZF3+ODc93BsQWiJXlsI
 8T9NZ7c4YdS+9WfiGvwjRTTPanrmNmgtAZXQEooWvgiGwxRPaR1whqMDEtiuFeAauioOIxE2eQ7
 +MCgY2ay1ZTUSZ8QjJDAT3LgPa6Dqw/0s4NcwNpP6zqW+ya/JiSa/HNOPPnTzOt2BShhQY/QI3E
 YavCWFWns+RI0Iw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: MwltjLB2yOq6-BXohxDcKfz0uIxTmzRH
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69a9f9ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=e9VCzvh-DsFqsbzuLP0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX0btcZHsWStBU
 SjVs7hGgWqazkpwdx2Aq4A/0fGlx2UIvICXiF7UvgxwfDgn+qWpFSpxUBBHrx6LqpHX+lUY0fZu
 lgAD1Ce+bbD1EtvGMVLp5K6EQO4W1qQMINqYAXUUDfxQ376Gdesw52cu0J+OFAyrjsANme8/F38
 pUyv/+0oJ3fh7K6mm7ekFwN6EEypENz18URpyZH41g/YhtyadLg517YqOI3Zz2CI/TDZYRGPvBw
 hI1J461c5XBV2EsB/RJrlAp0R5+ggbA/d5moWF/2ewsO5EVxvjHRrCrNDviQmF7d5qVxlelS3eO
 Gb6y+m+iemENfEVss6SbBovo9FtQkdWnUUvoE/SH/aG99wdNpjYphYgMgvuixjzxVANV+qZndNN
 29a0+ANHkIOobnI4U4JL+Invf4FjLVAPNthCIALPs6BscQKHv7EtOjaovCSAjaUoJEQGjNK2N2/
 4jEd9XNgb0NDJHGcDHQ==
X-Proofpoint-GUID: MwltjLB2yOq6-BXohxDcKfz0uIxTmzRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134623_224229_D92F4D21 
X-CRM114-Status: GOOD (  15.76  )
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

Core already prints error message on devm_request_threaded_irq()
failure, so no need to do that second time.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/power/supply/max77705_charger.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 5dd02f658f5b..0dfe4ab10919 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -666,19 +666,15 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
+	if (ret)
 		goto destroy_wq;
-	}
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
+	if (ret)
 		goto destroy_wq;
-	}
 
 	ret = max77705_charger_enable(chg);
 	if (ret) {

-- 
2.51.0


