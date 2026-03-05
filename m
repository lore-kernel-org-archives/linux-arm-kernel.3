Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357C9F513E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlyEHA9gSBE4x00iU9vPwkk0UY8GbFcxWCKm5P/2jnU=; b=GGNHmz/HQEecNl+svcAVYqZvGw
	EG5eUSp3fJiKZRrsgczKuhCIIukka5arS5knL2FbUHGUOJ4A27xIbvDeLDLyP7h8ZbrY+3/C05S+c
	vUMbAY5+sxstTDy/TehBTUbFq1vM9Z+5Kx3HMXIRGCqPekGquiWAvvCzWmERQZuZzPqLK8/f+vM+B
	uPLad2hiQcBiRrO/wqouta9AgZSRckWmmD4Qo3s5uOmZfUoHBPG3zlPucIBPIEP/bIqv7q6I3Nb3N
	VmSul02o9gCtdGxbCWWI1kxk5+bFRMFF/qnaoSu52Mo7qyRjr5Uap7uROpZi8O6k/clx0XSw8fca3
	b8Kfj7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWX-00000002b7p-3jGb;
	Thu, 05 Mar 2026 21:46:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWS-00000002b2d-34az
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmv153726365
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MlyEHA9gSBE4x00iU9vPwkk0UY8GbFcxWCKm5P/2jnU=; b=Dbao4P+UefkUl3rm
	ohOcd3z6FUH8e63d6S1tWZznd+NcnMa+/fe7JovY0KiK85uxX6sJqUHevc5uqS12
	xrJXjHZktFtvwh5IUBQztxzmZkXaFHD8uo7uTEKLpxQ3h8R6f3Dju0TNr9H1w3N5
	xEag2YOMrW2WyH8euzmseUeGEjG2U+2M4HPYaVlRhcfqcSwYFNPtOmAFZa73R4IR
	0wQSuVyrW5XByJxUcTi2hxzq2x03dnPFKoNJETHlc3aUtQqRE/HCYtKE2MLHhEgm
	wcr/waY0O7iN5L4AikuVHY5OqtJmqILXkZIHTfoaJyHrIpvaeO96J4WSW5CqHf98
	sOwxNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dj4h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso1088101385a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747179; x=1773351979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlyEHA9gSBE4x00iU9vPwkk0UY8GbFcxWCKm5P/2jnU=;
        b=cgv9wTuSJfAB+c7xKylNyOCbc7XU2i6bTN8Mhzj9CU4wD9KuiqpXS0QXCIJJ257KAj
         VThXsJvWE0iHwtFSvX6eCBUiierl7cXWrUEH8dDez5HxQ2xHaS7zLEg5oMWDuERtSpJE
         rfvRhobbcPtkgk9idZCRKeRAtPl3Vgam1Lucq7eNnOub1sPDjExr4xvWcnJSWgd+o/Wo
         ixo/nsTrrT7rYjEV/23Mlm3znS2x5myNeP2cWydmPu+iMW4DUoxrWOsQcAduAxMGt5jy
         QDaq3JuD7kxzzemKkpvyoy/QRoT7s9psr5FYBYAaVwR4DASPCET84sN2lyBegblZ8HeC
         y1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747179; x=1773351979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MlyEHA9gSBE4x00iU9vPwkk0UY8GbFcxWCKm5P/2jnU=;
        b=ZFzvbUTsyuzQKYafBMnN5AF0s01VhkgbVKFWQIkvGp0z2yiaf/6WA9Iq0D1uNioIwj
         8zVnFQBozX+yYC3lhk+9JtDt0Td1SimLYl6cC9nBNSv/jWKIts5OBhkTWcK0UfKS+gxy
         IXYqYZuxf42ft0Bv12YTz3YtSc0ibsDoTnLKrDIko98w/Lrr0sG7vqK2EDS+afSi+iz/
         v7xsz0yo6olJRAnESDslMwOPAPYrx2uAXQirSNPPziJ7wpQetL/uCR/s9vpojc/JvFbt
         9Whzf9pcYKvAdae6ND1EcKg9zMcA0WzCwoLFWxHox9dV+W8k66rBiVPEv2i4ilOKzxjD
         UK+w==
X-Forwarded-Encrypted: i=1; AJvYcCWDJuGtDi81t9XVvH3Q6atVslef5ROFw5eO/MvZ3/wXgMGg/jZuC20kJPTsJ8a553JbG77BF35LU2D7sHuhnmlB@lists.infradead.org
X-Gm-Message-State: AOJu0YyFILdjAzawtg/UaOpf+CXpzwH62WdlVd3OtVO5Uw5MU+JnBCWE
	oZ+FPMIkYvOO7v840FDulpCDmSRB3AJYR6JuHo1Mlv+bRDYatGC687/0e3SXMu6Ca+sms4Lm16H
	M3+6dgDT7C1ShnVrEtBUAPSj4GMXMIVAWuUMyuHPk+o35Qx213ogMXU7HJYgezFoSpASWxUhPxC
	XtHw==
X-Gm-Gg: ATEYQzxyF9z14Jq6XB/teYTrEfy0974Y+2Fr+qKkkPuSrLJtcSmFUXtZyr6K2xa+Mv6
	PHCksEZIZ/Y1ZM8Ye4Inagqe6DijUI4CzDe1bInRoBKfiTxQ4jEaT6ag5XE3DsqByhzUTrPLLtY
	M9Xwn8aibYBKUbkXrCDc1t2fwc9DOeyFlA5jIvDgzeIXcQVY1uF4S9i/QmVksBm3TNjTQrd3xqN
	hP+Pu5RWEwuoruifmoWv0E4vxi/pjUlkDHdFOHZNSw9As93Vd1uMtIJHX114gF+0c4dQrPsCSvy
	Ro7E+Nns0wsmFYbtrZHv2/8ZLwBYWxJt4JcaW01Kc4KQTPfxrMQTqywkMQDqUaUshFQcU9pqWK4
	Ly0X/19sNY5i1dSnRbnVKPRZSGfx0XbrXiMTXcKbmBGfj
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr3986885a.24.1772747179222;
        Thu, 05 Mar 2026 13:46:19 -0800 (PST)
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr3984285a.24.1772747178665;
        Thu, 05 Mar 2026 13:46:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:41 +0100
Subject: [PATCH v2 02/10] power: supply: cw2015: Free allocated workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-2-66a38741c652@oss.qualcomm.com>
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
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7qKBwP4RT8UWSNgGCGoui9ZGSKnXjO7Z7xGXOQ+rwgg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmaTscz30XpaIVrSvMJ9NmAZXBjaoCJD1Qtu
 MsSty3dB5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mgAKCRDBN2bmhouD
 15pAD/4uItAh0+Y/646A3SxgJMd3qGhnE6oah8kL+B+QDXVcgNkJZNqpTsWPqg1ukrpJ0ToFsQR
 RNiOC1FeiFP5X7vtMQJ3v4EOLkUXa0zCrnD+c1aO1FcMnG0Y7gZH+ugMGwOuPFct+bs88d/v49S
 ybptu2xzXKXKBEfAo84Y7OumSKn/LvtJUAk8kBIb8KDuEMZl4r2havJm78odbmy/l7+v9D6T5sH
 DPzVfzNJDdZxNGOQ6OcHWvqDGeNOCv54whjFfsAOEtdgR/5SPJoA4pUbUCWh3RsOMBNnP5h6hSF
 njKtVt2sOP9g2NsX7XKxyDgmUGmg0rLdisILsDZYnguu90Woj+1e4/S3JdqSgdurRvABYmrgiuq
 XQwY8Q6YuGYiMzqX+g5ZvpNN3/9o6ZI7SwqCKrkFeZ7AQaDocx911KL+I/1QlDyP+84NFDreBkM
 2Gj2nSEHDsqtUaRbvrwIAp1Vg4pE9vJrx9fVg6xi/PRznBpoB2kcPOd7BtrCcmYzdMrB/nhq9sC
 tYQqUety3kdK+MSAl70WKyZ7gGpo7fPGOTKz8HXxVEeHiGr+iBOg/MEgylptG4P56NqHhcXWMBs
 xZ0iALks8NvYwqQkLYn2+xyFH3k3z7qEemupGFvVcDLHVbAD/zRk6XrL0Pp2cZXlzqwyenzorOv
 8p1FNzzDKoAJdpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: eEZDH5InqmIhplcBFCHtGBiLkiUUgjpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfXzhdREs+WuBMP
 ms8ZEd6fHBCp3tXeSwzm6CRUDcNCUmfxIQDX7vVH+Ec3zhY15tJbQwqx4/xllNPuxI4lReQpUUe
 vJ0fjPJBO4d9ka+xpyE99X+50+f/JIcO46FR2VwAU7cEaYn8QxNrmtmHDs0OGznSMh6qNiczcoU
 khmUfxkHpeWiWBQVPjVb6gZ34N5p9TL+aFRQu92o8aaUtLILyd0HB2voUluTOxzjg4cEhUWKye6
 sIVZU0NZN+EHzaOWuZx1k2EUO+t6Ln6ZXlaXijmMRpzWhf3x5WOfYV4AqI99JiztdTMeMFmHFDY
 BhZXiZ+rL9xvQ/wsGZCOL5060XIM+oryWgQTkbdOLj8DUrg4N3fS0dHqjcyNN4gVFmNo7f1jV+H
 QKkD2E+TSkwfQu/GN0ZKG+cOwlMmIM4IYEujOjNOlJV0J3M4yf75cfqzDw120n7Jw/H0d2kX4v5
 hKF44QyIwM1iUupLBug==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a9f9ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zwXKoDzk-DkgMqbABcEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eEZDH5InqmIhplcBFCHtGBiLkiUUgjpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134620_929710_37C4C1A0 
X-CRM114-Status: GOOD (  17.39  )
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

Use devm interface so allocated workqueue will be freed during device
removal and error paths, thus fixing a memory leak.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to read updated data from the battery, thus there is no point to
run it for memory reclaim.

Cc: <stable@vger.kernel.org>
Fixes: b4c7715c10c1 ("power: supply: add CellWise cw2015 fuel gauge driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_xxx() from earlier patches.

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/cw2015_battery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index a05dcc4a48f2..286524d2318c 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -694,7 +694,8 @@ static int cw_bat_probe(struct i2c_client *client)
 			 "No monitored battery, some properties will be missing\n");
 	}
 
-	cw_bat->battery_workqueue = create_singlethread_workqueue("rk_battery");
+	cw_bat->battery_workqueue = devm_alloc_ordered_workqueue(&client->dev,
+								 "rk_battery", 0);
 	if (!cw_bat->battery_workqueue)
 		return -ENOMEM;
 

-- 
2.51.0


