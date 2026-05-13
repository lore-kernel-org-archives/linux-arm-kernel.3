Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A612CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jMP2TqROTeV+TiFaVGks9cJcMR3oF9GuGRUSfBYhhM=; b=cKJPhbsihCJRfU97o4a+g3yYr/
	x6zM8K/u19xio4/decEmszNS1xBtLKM0Y4kJEhi5MbTTu/enlgEcBUmDYFbbHyYwGYdmmVETaXaUc
	yns0RbHGtWz/RDw91K/3aMSaBuzWzca9ICadexdF19s8E63eJC/Rw7t5YuhroMSFo0Ma6EVvL4ojl
	vyyQbpCelSQ7e63LQVDGETE+mj8N1U8PBthwR73ZoV/5AFCXQvia9K7rAfVcaztyI2zDAY4pszlXz
	on5vL5Lr34EiVn+fiRQypVwZExv01laE4B8ezGAkDXd3dkS/w8RxwsMusGzjiMIRHpCOVw0wJGbbi
	cQ/JbRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCq-00000003K3l-32IJ;
	Wed, 13 May 2026 17:17:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCk-00000003Jxg-0Ib8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:17:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEm9Xq3474831
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8jMP2TqROTeV+TiFaVGks9cJcMR3oF9GuGRUSfBYhhM=; b=b0Z3rieG2EfD/BoZ
	T3kWa4Z0iSk71q8mvLzrcE/5+q6RWrATg2PHtZdT4gEXnfEpd2ifpFK/OhLkyJM1
	jKezqu4feWh5iy1I+CwZ4dftZq6yX0cRVolF5xvYpCKhe36Y673sXn3pEqbp6wLY
	IlqTG02j4opHoogiL+oLpj1BjrBhcZUTaYr3G5Z3JH2fW04iXVDSAYft+h9dZpqM
	2FtDN3qAbdComPMRGgMWKGmKTwP51dbpEBsXuy8gWuIrGkKSlYT8tcx2WY6i3EBs
	kHLoJj4/VfbweYqOPzdeaU79oGddXe24hjTHMv14niTiQFEc1oHFFQPuLWsmvK4v
	3jOxTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41a0qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:17:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdd327d970so3970489eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692624; x=1779297424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jMP2TqROTeV+TiFaVGks9cJcMR3oF9GuGRUSfBYhhM=;
        b=YsX6SkTFq+DEKgL00XSLUKVjW8Lz7BLWj39ibYpmVZOoY1hdT8VRxqMagln0n6I4qp
         fj/cNMhDIPn6coZPxwctdMKIOH+RvjC+GQk+qRr4jLS/mzFh176OQ/LpQzgh04Nzky5h
         ivf40Xt/5/4Jl9DwbBcPxElQAnnyBw9INBpdPFjxKj4dbwlPvp1sV0IuWZD1JNHBO4UN
         Ow0r4dyWXxLubc806El0kopoIMKtHram8Nmg+/cdQo5yUcQBsZlot8L4kObOSKBUeeem
         blwdsoEc1nEtBEBW1KTZ+VSMnvvAGBtHLxECBss1HWF9/6Lwb+DqYTGjSiNfpp5RY45Q
         hikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692624; x=1779297424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8jMP2TqROTeV+TiFaVGks9cJcMR3oF9GuGRUSfBYhhM=;
        b=sqYcRnioUMHl+gwpg6xishoQW8mQrqD0w7AitAYnRjL5zLL4rzFoN1ncr0nHGNiGIr
         N1BrKsBsA33Ep3hc5fUEmgD7FGRzhPZrclFCYG+RyUrt/Z4alydu5WbCMdU68KOOmHAs
         vSNtBkNfgwEknWobolkBszGq5H1cKAVIV4wXq7iNZqR8l5zzWx3nSQJTZUpy0XUD7W1k
         Cx9hdxKzC26uvViNIalGTTqWG7IixdMTo7qUyDRs/JedRVhEExTNDxr78nO/XecyUHNV
         y9EfpZcQqf3O78+cFlzhjVms0p8fOA/bw7JKwTTHRkNcIW9DbsiyA+KDSemxc8W6pP4E
         zK6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+w3XkrtPMm0YWghi4IwhiSDx1T3pTYYOqtjq93ueVuRGFuy/PnbvBwK2dsDAmh2G8Ebnikh2RZ3cJYXd35fcas@lists.infradead.org
X-Gm-Message-State: AOJu0YyOPk1VmrKQAiY44eMI8ykGRLjYK2iMr6Lq5CRU7CneTPooLcce
	5eCg6DUYG3f6Yt7VKWNqkuvBRdaanoYdiQVlBzTH7rWAUiF+Pf7zUHsHoP1PN/U+JWfmIs0tF8U
	lAw62XP0guMyR4bRKu4wxJmF5kuz2AQzj+BTFcYxxS5m39srrBistwegPjqnEA3hIHCvSSf+UT4
	xJMQ==
X-Gm-Gg: Acq92OH1ieyFq3m0HV1GvQPhWX+Q3xgSMDIkvw7XeZMtOpQS/Ddeu803mtr5JOomWKb
	tQmVrMh/6vNKjfhcOYJCUBy9ShFB3h1IX0XYM10XGtXkmobizteyPK+EuX27A1ZguefQ0sh2rrC
	YbQV0lGgivSrCxBXM4mLsLFWk+6n/JONZ5tFV2cASCFXjnyKqjCLmmsOATpLLjRawN1P+vah6uc
	8PoLCyQTBL/7Si+Ni8LlWqQkpwrDD6KWqeS+S+1nhzv5ngCGpIWhgbnnVDPZBT9LyPqs+Ew+Rbu
	mWSg+DbhxJCWbu5YgIFudppuv3aa2v3L9wiuAgytLr6AVoe+vFHI6bB3ShOnWsl6VW/iCvftqgF
	ZxKGKOPvUk4n0Lx2bcJg1tWX1JeIrm6opHsX14matnh74qG0f4bBc3BNktSvK6+ddl09uY+0=
X-Received: by 2002:a05:7300:d511:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-30262f3895emr226699eec.20.1778692623962;
        Wed, 13 May 2026 10:17:03 -0700 (PDT)
X-Received: by 2002:a05:7300:d511:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-30262f3895emr226653eec.20.1778692623279;
        Wed, 13 May 2026 10:17:03 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:02 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:56 -0700
Subject: [PATCH v2 3/5] hwmon: scmi-hwmon: Log number of sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-3-36607e9dd540@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=817;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=3u12ZFfeWx/fiqk59TYJupRQ0n5DvmJHNYpFAAetJB8=;
 b=drMsL9zyJtm9O0u5u71mfEb7eSjVSIhSmM0g7YOeZ35sVG8AknsYYy0u0vN6Wrm6jfxOHGdtg
 gHPXVlMeN7JCUSGfnbjCErOB7V68Chpm7qkXicucNIo/rWqXvEyxQR9
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04b210 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U6dIrDiPZIM1rF_tHS4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX5A9jKmGoUAOb
 MXg+TRWaf+zJddW5iyWiCqyuYNzunNZ+LPRaRL67PFmCJs1K8X7c5c4ZqgCikDPUvbSI5gA5lOu
 onHTLKKIhGOmKE7iBDlaPJNCM5MdFd4HWsT7jjH/YL/KMQshd8Xw01cAMrEyuirHmpY79XCy+Nk
 rjpbFCYzUVLrbiALdxVFFsxxkCHja8Ns553TVPJy4Xz5fGV3k4oiBRF0zkjwnCOX2TWjqaf8sLe
 VDHbImMsRcCD/UD+yIz9+tMbqmkOdcReaNcNLkib/Kb5cr3hnbf3qwSq4xygUSeaAA2uMfD3Eu6
 FCzWKPuZtKVAhT07X0FCrPQsC4YReaz0e4MFeAsdrmt2nGoiRx7cIPhvarGislg126EcoPsQJzH
 UuS3jPM/BWXhL5iMYWNN49ZT5k/WR/1q7+iFI/8468BqkrMtoLPR8MYzfJEktaTgVTfdHssoz2I
 np/Juahbb0Ffdc51HFw==
X-Proofpoint-GUID: Qckoxnho5UPZ6KJK1jv3kU9-ucra2RAl
X-Proofpoint-ORIG-GUID: Qckoxnho5UPZ6KJK1jv3kU9-ucra2RAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101706_232398_6FC4B313 
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

The SCMI hwmon driver does not currently report how many sensors were
discovered from firmware during probe. This makes it harder to confirm
the firmware exposed sensor resources during debugging.

Log the sensor count after a successful probe, aligning the driver with
the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/hwmon/scmi-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index eec223d174c0..456ce11d050c 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		}
 	}
 
+	dev_dbg(dev, "Initialized %d sensors\n", nr_sensors);
 	return 0;
 }
 

-- 
2.43.0


