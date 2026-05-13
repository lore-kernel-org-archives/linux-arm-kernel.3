Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950F1CD4F3F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=; b=S3NDr+0kmJ6SkHqeDiTfODFNwh
	8rzzMy0PTBb5V0wlMC4+6t73nXWF8rDyHvLRcecPXAbZFemWhekKkz1PTiidLycKxRWwF81zKu5+P
	mJ+X2SUQAfPMWHVvbr50qGKJISCyxS+xXO+cX+PwFtD0Q0XAzxCTXs6IltddPxJm1zvwvU9u7pr0x
	+CeZmnOx7M4nnrexXxGAy19Znmb2fu/4IuANJpJWZSOwtDcFBUeYWm0dLd+sV782/oGP2oLd/8YbE
	dmMv6+5WQOypfB42m7WhHO6TwIvQc1sv2+KX5n2x3NL5ovSUOZbkeKEHB22ln2FbE1WSh9NMGALHt
	dKeEJdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChL-00000003FBh-1BqX;
	Wed, 13 May 2026 16:44:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChF-00000003F9W-2Nnr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:44:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGRpOj3007657
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=; b=Lt1bVYRowP5qG43u
	feMZAugbkgbmaoauVWkYsoFwKUZc1ImdfR4eUSXuqzHTyyu/EfSO07EM+TgdnuNq
	eh//W5u9d9zIpGlcl89COws7rP5oCQIOpMvfV9W7xZ40al8bZE+4CHHqbWci1mJ4
	vvOgXrsNeI3wdPxsly0eDGDa5BAk5m3rgwJwQ56q3/3RZDeZSFnG6K1Ek7Hhth1O
	WfPURlDIy9MwSQNijroZCoQQsIn6o8fD5mHkRI5imwNG6nVclDfeH7uMGHE7PIfq
	P14RBWkDbTz8v86ehMAl0ecGaB8VtqZCD0lY4w6Mmu76EG6yMy7yQeZlVjghSVJz
	TenaQQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hm0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1329791f18fso10247121c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690672; x=1779295472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=;
        b=eqklPsZKIYqYc/s9OIrEgntseq8vr4ebStpyhFTi1psCM+4tPZwlx7efr1saLsfteE
         xqyq05pTfoUR3DGagj/qaUG6BO8J/ckwBK10xS8749MvZ6l2FG84yE3e61agH8DfNrj0
         oeTVmK2TOlS1L/BUtoszr/JkIty4z9fNd5fnmGTc+oWpCA8YBvkd9A1eNtsfGoGoD7op
         dUR4f2YnaLBp8BLFFvC5lLwXGe9c5wmjpJcug3UXQYijluZCjs9OMpn0mvymLucHaQ8f
         kRuD6b5FQ96qGlEUpLwi3aju293fzzEwVBeLjHPJyWjzGQOsK8tintVpeVB188jATK8s
         Q1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690672; x=1779295472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NGzEn4QHnOns3GVJPYdbSr45vl6CTrSg1yOeRmRags=;
        b=ZmC/Xnsp4vWfun/Ztq3vvALOqx+m34H2u4+1eU+UJ59n7b+hp8/pyY6uYY+0KxiedQ
         a8u6sSrUMRwIiexy30cMdI/JIG5V23c/JnwoJfqohkZ1YSuluoM+v6QsaHv7HQImOieO
         0ZTJ4nWol9Imoq0QvN2oMjP8JOufOd9rrUZc/AxlxcTYn9Lzo8y/UTX3E4jXyUH1UpIi
         W3hhVKuH4yYhd2c5DJ4sw0xhiSzeDfwrT8PUi4MfQhgaaxEp8EQI06+RtyDnsiy17wkj
         RQsGT44VfA6sMk3/VauDpsYKqFgbRPmkrj5U4dAGFI34NzO2OTM4sDvrDLhzBWbUxwX2
         EEag==
X-Forwarded-Encrypted: i=1; AFNElJ+DPtatfva5uK6UB0D+z5XZ7qmM3idVURArGavvwDrUVdtLfMr1he0pbuuDB4H4aV6smnDKtZRCF4N2POSrgyN2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8H2My+as1AxL7BnxP0qn+uWsBTJYhPO5aHBCihaA3jyY+xVDZ
	58PWDdJOMkx8UKWbGTdg2YEppiqGR8wTGqUIsr+KhfquCDnSFgH/bwV3y3fkbZcExA20VF04rmj
	EqxD/Eqi8ulw0SBw8Klv3C7XSUPOlOds9bRHtZnWGSAviQYakqLDQfwY34aVVjSq+2cIIZ4PxwR
	CkfQ==
X-Gm-Gg: Acq92OEze8+IduH+ogsNhTWuHF3tcWonYdLE5njGH1n6AAAvOcSwZXQRVrwQAfF5DmH
	SeRvNx3T3E4WEpcGXytbvEUMzH4ZDyY0yZR6My2mjTcK7IKil9Beit7xyydzturU+M5H66kw4OJ
	kWvEAWfTeHP0aZ7w7RozeeiuEFpQFbGmm8+K+9A5UNjao+JR1TXIO/Nv7Ga8b/FhKrTnGJLMaUJ
	zBIEcTWszTcnGM6JidhTC/gXGxvlt2mMvcwRv1qtqMM1Sm1FG5yRUgwHJzxyIBPIJT7DPBj5pfV
	zzP++GyVMuieJQWWeDPiwsQNQu8YTVaKxUGgDuJRZ9DA9RsWnTa2d8UtfNM76pFK8C1UpemDUjq
	fyFo+NL2ddqS+lBT+rvQkIfi4IgglXjT9Cs2rZJ1y11Fk3oxqoJVWeVoZOoUCLpCQea8gP0I=
X-Received: by 2002:a05:7022:ec88:b0:132:956b:3c6 with SMTP id a92af1059eb24-1349ad870cemr2111964c88.33.1778690671482;
        Wed, 13 May 2026 09:44:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ec88:b0:132:956b:3c6 with SMTP id a92af1059eb24-1349ad870cemr2111944c88.33.1778690670855;
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:22 -0700
Subject: [PATCH 4/5] reset: reset-scmi: Log number of reset domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-4-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=1391;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=kkkJUN2duKjg2tEPhVJygQCN5sNnHuJItWMYlqkT/wc=;
 b=+zDDnh3MxrImSIBbNC9dHdn17TxKkBrO3UxSfoKVDiRqAoPHX67PJnTILBR8G6xc1OVPmBa9v
 QzLeLBss5/3DRkX2f8GlrLsX4oJLNM+GlL2wId5D0DyBXYzzWOZZr6I
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX6zeZLRwm4C1t
 krXRyeLAdBNbUGo5BGBBLskKZgdcpQzrMJdoGGH5UfiZdCAjaWfZBUwMXE+vDtsdgLu4KXaIths
 xcZucjP5YiO3UaEegyiBtRH6IEAjT5SRawxDoHXHqW4CNO6loWjbF6/mALt09tTwYOb/V7uk0lM
 uvYpw60ZWXpBdDCGSGLDJnzOjAVqVxI5hadLrdGyYH1taL4LO7TeGugqWZzGr4zp1/eQGDK7ulh
 1ar0Wu1kwuJdkB7NLLup/BTrVkUgf55r+AfAFqZU/I920By0F+EaRjA7zGGAfsz2NP6+7Ux8dcp
 HIMG/ILR79u7VMk9GH9j2S8yKzdurOR9e8U50g4mOL3nmOCNu18bEODliNTNoOk2ytEUoDlW7sn
 RJBO3gugQjfI+uLaZ8QOq2C+aEh4Bmyow9Dn0khvqKvKUVQPfikY2YRipL0ifwdXQsG6mbS2Lkm
 zcRUdItk+xvelE4LutQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04aa70 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wud5Z5ZUIjVBoUaN5zEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: BnwiTbdvXmEIMBsYNzYCKIL_i1cAVeW_
X-Proofpoint-GUID: BnwiTbdvXmEIMBsYNzYCKIL_i1cAVeW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094433_732560_25B56409 
X-CRM114-Status: GOOD (  16.38  )
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
index 4335811e0cfa..f26fad0dc726 100644
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
+	dev_info(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


