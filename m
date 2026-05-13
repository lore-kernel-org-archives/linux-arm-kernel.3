Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB5CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=; b=sH4REyM7GjNJ1hXHzles03z9V2
	lkixxutoMmswhcN4Dt2SqDOUw9Un4RArczCDDKEWCFC3OlISi5ucANqlyAwZA9XJJzPp+ya23vKSw
	L87D5TEJ7+v7cG1WVkJoDIoBK/a7Kdzmsdy7YOA3ecUvXJe61n+RQPJ0yuRZABIiaNst6D3eegFqd
	r86vNspq1wHYu7jyK6nI8j1JgqSjgcaZX0Pi6slfSIlnQoWnDRBqRxdWHimqF36cz6wjBpETMAXGo
	5Nvfur5EdTgvT/CB7BbrGjZ+teKKgIk1AruXbh4na3LLBXxy/I+L8r05bNWpXQLNzvUzz4SZP+ZMb
	sUAIdmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCl-00000003JzB-21oT;
	Wed, 13 May 2026 17:17:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCi-00000003JwQ-2CX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:17:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC57iK3324882
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=; b=fQxQq+ogkG0kthGh
	83i0eWPeE8JdizI4q8NsjOSv25cMCXMfjG9C8NIJem68Z34SEDrIgMZ+AGG6OSjl
	DgFFyOYmxWP1JJDx/TXLFlXQDc58BkOsHdeIMoNnhWGkrkNz/IAS8RzCsELMMq0J
	jGoKWs6nCVaamf6Aj4YKX0puFEnbGpLmeI8cbdg9meGFixdKckeOnBm4/YRpNGjW
	3XSyf98t4OIxbgi3D1B0/8psNXix6XDNN7w7Eo3nYiKwGu1ZM0GtNB00r/KYGYOg
	NW903jrcHRD95MEMQCcBK2GoA1BKk/xtzxDFVYp4GQFp7pxOgL0xZpHlkblMopRi
	jlIS1A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdamk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f2d983d109so11356628eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692622; x=1779297422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=;
        b=i6nxWj+UtSrOudYSqUY5WLGMm9T9rcC7s6FQVJjScDPwsbMngBu1+HIOTXtNBQrq7n
         OztRhvP/njd0G1WQJpghu9bLEE1Ee37mu3+K3Rpq5cWvgzUWCSatWdl3wlaCBCVmPwqj
         i26ixQqsYGMJCwQpChx3lo1tJUKfl26rOLeGcy9YrKkEM+xFxQ9dz4Q5s4aw7tC6tBb6
         gwakbxe03nZ/FHcSXZAa3WVcIFbQV6DmVZBl3ZmFDOw9fmuuWB74Ln1Z3W+1Wdg8DW+6
         RzqUUsDo2IGut1x+YYkdH3nLabwgwf2B6/+UOjqZ4q+pPlBrKBQqMfWxmdwq3GVaP5lc
         YNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692622; x=1779297422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZhqeTaO2TDEjcP66wfCrkDg+Koq/B3QkWrfrf2cS9lQ=;
        b=NzGunR/TypDAG0hi6EarR7ZQjlSFKGd9FxT898aXSh46WQc1ZgDdsIuxRUvRDf9p1X
         KC+MccPFRDkk7UAyH0r6xKsfaw0quYoUt0rBLkGCamh3YAxa1IBEwLwffqgKgMnXftUg
         T4w7NPwW/S9o30xGnnV9QsLH5hcGIUgvs+Wo6P4OYASuWsc0p+AFx91zte9053XhtZ/v
         jHop9ehw41f8xI/JLzbP0/ebaOjkyLArXSwtfoiUlOxf4yEkTpRWEHGsstqr8DFBnrLH
         bXZXP/BOSbk8iE1mWu8hZaq8ynzVSkWSm3NhbI/Sj4pxO5o6hOjZkQlJusAbroFyfg5k
         IwlA==
X-Forwarded-Encrypted: i=1; AFNElJ/jSubWQMEVb4u1MSd7GRk7smIWmiVTw1/tj7GWlN2pNi9bGOrXlKCjZOBSS7AVPHBfJ3WeyGugGSCpLejTtu3u@lists.infradead.org
X-Gm-Message-State: AOJu0YyRrmrbKnrC07dIdlDDGYMQxo4m1guKNPBqIxBLY/0NBkOflSbd
	MMXSgOblwi4Jmpbo5O9eeTupyOwwWiUvPJmRUISSVunZ6oSCmFMnd2eI4zEIcjxX8rwXHzaMsDj
	Hw9XErQvh4q7piZmgQE0TPoFhk+O9e21kDxhUdhs0EyHVo8fysUHKQ6jaVPVgp7evBFeOyETd7u
	SjyA==
X-Gm-Gg: Acq92OH2wPesnujtCPzHYSjrL4iyJdI2H7Inv7r0n+hc7YY2nzGT5YXlxjjl8voJwvl
	0ca889Xf5RHvzBBoU4D9S93QyxPWYtzGoYafhwk2VxBXwyRBmK52lkB4UHshOHRAtfAq386moS8
	a8swWplYaSgsz8ia+vuMystJQdDavmE0tav4whx8qq1eLoaHdhAFHxZcwO0IzTRUMms5GejPa6p
	6DAbTkiE27scI8CxVdBUGb7jZJoU1jGmjGFzq9gnjD66F02N4T++m2wi690pSLjKR8GKlUciB+V
	c4h+6XRUuECmwu+y/6plClcvF1eii9WduCVR8zpH57WMlVU6mTVTGO3VY0LeVztZbl9PZBd5fef
	gM0Rez/+Dji6E3Tm8KS95MvHKw3aFT/0jOa+0tIyU2R59YG1ttkqCgyUT2qosBuu4i6M5vrU=
X-Received: by 2002:a05:7300:a146:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3011708531cmr2740281eec.3.1778692621907;
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
X-Received: by 2002:a05:7300:a146:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-3011708531cmr2740240eec.3.1778692621289;
        Wed, 13 May 2026 10:17:01 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:00 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:54 -0700
Subject: [PATCH v2 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-1-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=941;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWeomyOh1Ae5xTrTn3KT0pUIoKGaJ6fwTgGzVci0FIE=;
 b=eYcVU7i936b/87IEJANq3Fe77/zHJ+AvzRNx5TeCA/mVoSm099367r2A/+6SswcY3A1YG+/rf
 uHQ/wReFD31CuchIdzYXXVih9AwybSWgz42qZ6LDlL0I/3GrPN1/A04
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: MNmrnTz3nREWR_jjMRKfK-ZoBn6Du2GB
X-Proofpoint-ORIG-GUID: MNmrnTz3nREWR_jjMRKfK-ZoBn6Du2GB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX4oZJRjiuCl/o
 G1TFDy/MX++UgFAPW+mSne+stvNAx3ztJOP+6c7Ig5iNR80Pu+I/czICdSKdi60bD7I6vPlU5Bu
 RJUUvRtjad3RQt5fOry1oYTo7TAlcFLtYP+A9xa9Pp8Hb2NHSzc1Pdw+df4tUO8KxxlB+XPeIOM
 78puWVcHZQXdYjqp1lzoj5wM5Be07N8jJSXHqZ875zYTfS7Sc4SbPueTG9A9Q7HTRjZa8/N38+e
 IRg7TNGYEu2dGX06OBoQI2djYtXRuQIok68SC8d1PQRLegaJ190scc8eiwHiFqRS/2aWzh7jk3x
 cYKfiK6MXTJsmzRQ8e0j8QX5ADrz+NYNvsnh7SA8hnBj7cHNX04PdeaSH4aT/JfFIMr3SN10zpP
 r4r9ovqC/TovppnTaCh3oj/LLIIwQOAdko9c5gClALgFq1zTsyUQA7nLdyOb1EWzt6nIqg1sBzc
 /PqwPLF07Eua/EKw8uA==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04b20f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Bjf1dfg4zo7KOAcPRCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101704_687053_26BCCE7C 
X-CRM114-Status: GOOD (  13.26  )
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

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This makes it harder
to confirm the firmware exposed powercap resources during debugging.

Log the powercap domain count after a successful probe, aligning the
driver with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..3efe3743cce0 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return ret;
 
 	dev_set_drvdata(dev, pr);
+	dev_dbg(dev, "Initialized %d powercap domains\n", pr->num_zones);
 
 	return ret;
 }

-- 
2.43.0


