Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978C2CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=; b=eVRpZeQh8evjndM8aJrcdBdQ0u
	ee3QpBfTj8vQGwdqRoO/KXUN0tUPWb97OP2suSk+oFGi9d7qJMJ33mpQhiclbVZFF5bZ+q4Tedzuh
	1CBMzGK4nwOs+w5bvPXnjjlIsjrXRifar+N1jumPiHG5SiJXKk0GYD/SYfxyL4h2CYViXnoJJib7+
	fgnQrBBQ9mSWzMgJdmAA+47rnUKoVI2YU05ZQ142H+nd1+cC95QniyuZFLtUbVtuquXW/EELiU4mK
	KaXW/6wvfumYjpyibAD+waN089Vrx1kIjns5QZQt1VL9D5cWhVnaH/dx6/ymP74X96vzGv08Z5HIG
	Kf/5AUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCq-00000003K3P-2SfC;
	Wed, 13 May 2026 17:17:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCj-00000003Jxy-3SIk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:17:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEba5B2887912
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=; b=a/Ber0gZAjGFbcyA
	DcLnT3cvWA0zHeuNw4CkdOV9sEaTHQ/CC5QhPsSiBi0HD/gY+hUW42xDhJmRWHr6
	DK7/4Qt+fclHFLvyZXWSuA23qblGmuo8QNq7M0vhEkaF9NZCBHKAKdreKyf4tpep
	9YZEw+OxxdKy8jFsPUIQhmdBlueZ1UXJCZ+aL8DByt4dO3SgGrp51ypjJfQS9qiy
	iGGcIlr2wWoqGp3TnDLw/f5mpt5kgXvR76/zbPTo63RfRtrPH1v3fPErVKt07jtH
	seb8k8GGNF4ttDv15ylzVPG/Yt6I1fkP/N147zI5Wl7OIHVQL/vxs111nUqC3pv9
	Y8hhEg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gj1ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so8923461eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692625; x=1779297425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=;
        b=JLUWZmplMU12X+bB30jFFt2CwCzXMQPYNM9SYpgcvK7WNQervXyOMOJuXG4Yv+3RSu
         Y9Qx5hEaPvV7alKrOovmFiJ/3LHuhWAZxrZVc9hNkR5HwsJpR252DSsOQUWUXO36IK2A
         zTEK0K7NFpZFsEYOCtGKsgAScpXPW2jNDUrg/OL6XPbk/8kBrTtpdjXjMw4ZKoI+/z5v
         3YSHgzUNdbyvvJk1hOZpob8LtYVAVfb8/dHBXWrrs966l7XwQEBBR+hAsIYfIPOVHvZl
         l/5B/pJAoB1qmI9yjRlocYcwbo8irozjf6BqAZG0LPcpKxh2leHC6GG78Ydi3gjmYwMf
         yRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692625; x=1779297425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=;
        b=JkWqxECfMy4GxynwsO+XYKtpWqCLmUsmVWraAbQpG3N4/DhHfx6ItLOJvrYKPp2vyu
         OYecz4Jyc0uFVRcUJabBqsvvivHd3WprlSOXXFUk3Jj3vIAB9Zbq0FwhtFDp/gssiFRG
         GBE1J/6mcwqVYl+dl6HlQcoKCriUFD3qoXUvw5nRSmlEEXkwFvHqRYYtYz8yw+re18gY
         whA888H+3WPtGr+YvxScORAhTmH1B2BvEjTj5KQVfLhDDCEJ602EJRv9HYz0e93IJk2M
         g61rQf//COYp7c/ADx7AV0M1gM/sqD/I2pPxKYATnIOqDUYmTNMOTVlOueCQs+vg7a/x
         EVdw==
X-Forwarded-Encrypted: i=1; AFNElJ/KXZrvBhHgea35pmtSr+EiM7JbcUei9c+kmf7aVTvd6IY1bCJ6346dq+fGRE8h+HCNSkZ6rNntHDi+JhjEVMid@lists.infradead.org
X-Gm-Message-State: AOJu0YyQSDmm/TV/EHFlX7RJuCzaOyIIBBPD7USXB1rfHgSZUgrnq/fJ
	KTdeL/lQzQ+05coUVy4SOrxKG1t8UtsH3GBgEkdo30I6k2plNsIj6GspyaKmQuKLSzU64rXzTdL
	fnJXh93H+0uZylULcwy7NSk83HUofTwOyjSvZKi9R2ZXuJ7KvaGTj7v6B0wTeWNN91T17q5KpVG
	B0fQ==
X-Gm-Gg: Acq92OEmWaFCxkXmFj++J8uvE2XwTl8zdEZL/NObfC6yiXEZ/qnOadzzNaKy47p78BP
	SFvbe0LOT/SVOXg6VRzwZbYt+uhAWlovbaob97oKxIvedMafWG755Hdm+p8GLmAvw1jaKYaYXxz
	DzqqSyRfeB1J5DIU7yfWzMZwRiyHFu4Vpmv3oMvifddzxvmOUCN+T+DGNS0NwNXJFMLsUZkvM79
	m+4N0EQgprIOcxpHjxqRwQRIfQsaxMAT1U4BIc8BPJ/70MHQmECKN27TqoWe4vSp/KtnwQRrnWM
	zXLMHQ2M8mbHYo2CIwRTdYGhWRxlOVGZRR2db1gRZOL/iNdHdBdU7/IkX4dB3YaVCO1IFjUbcA7
	dh+ahG91Pmu5/NBaSYdB5m14lH6V5HjF2RI1qL9/IaoXjAfctaalamaTO6gXAupVM2VDfdoKDEq
	eI6MyNbQ==
X-Received: by 2002:a05:7300:d706:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-30116f8cbdfmr2657877eec.1.1778692624710;
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-30116f8cbdfmr2657833eec.1.1778692624174;
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:03 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:57 -0700
Subject: [PATCH v2 4/5] reset: reset-scmi: Log number of reset domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-4-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1390;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=O7ZY1AdiQuRGIWpyaBs7jFB0+sTG7KoUgEQpHyRFuKM=;
 b=jxL4jV0oBZIyrWaKzHWraW6cLXO/KQj3WbcU2TE/4/0plegLFbNVGLvl0thcoqS0D2Btudgxl
 UpfJ6sQLaoJDGpSTD2IgN9J/pGAioz38x5frXs1rnPofpkMniCZtxas
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: U_KeaLfYQ95HBOE81cwbIgS5Xt0KVlKY
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04b211 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wud5Z5ZUIjVBoUaN5zEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: U_KeaLfYQ95HBOE81cwbIgS5Xt0KVlKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX3cjvUI18sT/9
 L5OUpw4i0QwOaZ89ycyttFvStnhEDKjTxjpQwif+qatkt3Zod2bWTbD6uRlTNKmzztc4/8wGnve
 UJU/VUZ4DvbfnIbrtgEZZDodSrk0Kxoba0azW58E+C2Q4YigCcGuVlzew+AXjW1LqdGienHglG4
 anH1AzcXPOn7e+Sb43YXntkNTpWw2tVt3p+nDK301WncLuDamqgoh1+YjXNjowhhHBPymHzNxP6
 WkNGw3VE9i3ACSVIeDIcz7DBG0X2qxfKLs7mY7AOmPfNqocFZN3/vgrkzS/6DpxOawKRVQXBXUf
 u/ksFzcsJ3cU3nTH0WN+Kszqbyh1lUIFvfASPqnMTN0Vvwg+obaf2vZhB9C4uMKVUFYYrhYVJ30
 fglNbXog1kVqMGBFvsSx9Ce0nUYHC8OTSeTuJFHVOznzgKcQS6irGjakZwbz3X5JHxMWM5gz/PC
 ZRTbj1M0VYpIIMG60HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101705_871287_491BB162 
X-CRM114-Status: GOOD (  15.61  )
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

The SCMI reset driver does not currently report how many reset domains
were discovered from firmware during probe. This makes it harder to
confirm the firmware reset resources during debugging.

Log the reset domain count after a successful probe, aligning the driver
with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/reset/reset-scmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 4335811e0cfa..114470c12931 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -93,6 +93,7 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	struct device_node *np = dev->of_node;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	int ret;
 
 	if (!handle)
 		return -ENODEV;
@@ -111,7 +112,12 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	data->rcdev.nr_resets = reset_ops->num_domains_get(ph);
 	data->ph = ph;
 
-	return devm_reset_controller_register(dev, &data->rcdev);
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


