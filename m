Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3072CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJPzNroPQWOtDnw6fNmSbwn2Jxwjo9RD6cA8VRV4jDs=; b=cF8CJm5tvjv6zMKhvhwKdB5Q49
	qhpUiGodUsopDCKABsmUnbix7BlVRYxll/hZ/f8nUt5DCsg2ZYjL0DP78vuGEz7ZkyC69TBdM8Erc
	OaGSzxqCBN+M1xc5egZhP088ANuIxNZdaZYiEVy7sepEwAUzcXz+CTMtmZoRkcU10Cg5s/zlyp1FD
	OCv8mDO8n2yMdc5QVjNLbaHUHUidbpISVQ5IKk3QSh8Vo+zxMx+rWTmzN0cTmu8Q1NulN05e07fGX
	Lgh3SGIYxYNZhxVWv5QjH3RqriRxy9J2QYxVMPMjwb1vjIdrRewFTAMOIypvLRZSrQMfryXrUXj22
	fVtYpzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChL-00000003FC4-1lbO;
	Wed, 13 May 2026 16:44:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChG-00000003FA7-20RH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:44:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgXn3007391
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJPzNroPQWOtDnw6fNmSbwn2Jxwjo9RD6cA8VRV4jDs=; b=k9DJ3/eOBorwwk4+
	zKViZkFVYSkOhuK2Zf/yp9bWAkDC00IepLkab5tzvVD6RJgqHVrkznwqIp00sGwF
	zTMWU9uiNNckpMBuiOm3wt2n/x+dgtJxQXNZnPuj8ptfD8NAf3WakVqSOrYpcol8
	sPMCpU4Rha5ok9LMAB2RyU3mGAdLvkMQuLPqlnQ9cNai0scs0b+qR5zpxIGjpm/C
	mvvdebiTPTG0ZV9XUWWdEbEl4ntx5LpRd5qX89JXWMWdxaPW9eRAJjZJhD3Bmp3H
	hoSag84tFXFccKZENy/C+BGsRT7Eoda2sg7otQNzvB0ccUzNajELJP3hv4TQKQnd
	Sq1mjw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hm0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso8800837eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690673; x=1779295473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJPzNroPQWOtDnw6fNmSbwn2Jxwjo9RD6cA8VRV4jDs=;
        b=JfJorvbr9Xb9NV/dsf5xvIsblPF908yd3gdo5Zzi2h/BNfA57oWC2PwGgnbMqX6Grt
         rSd1AWtvq37g4MrERZQijmwuDnYYtEaSViLe/tzGaUt9/wPXHpvXjK+dJoi+K9+dkxIv
         NQMIf/YVj1oyZ2SLxrdqp+uP3maPWLBtMIa7xdFKROqzuxvL891hmN7FafLpq9QWMsEf
         szEdpK7orOpNDpeG+M3ogh732/yFWkr2RghNydkjO9jSV7+G0quElLsExHHsaWJ/oDII
         4L6rHhB0fzmxjSjfIe4Y+sGiQEvZmP1c+AConKsJdKIxTK3pC0TpjCvpriF00RHedXq7
         KSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690673; x=1779295473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJPzNroPQWOtDnw6fNmSbwn2Jxwjo9RD6cA8VRV4jDs=;
        b=VHgyEFphGZO3+ujntvUBPDu6+Eqy7TiPFX2Vi8BoiRTSXRWA6NQaV/vsW3xmB1tj9c
         ox6dk1hl+jMyKlh8TcrHSCTSF0hkCMU5sHI9unB0qMM+I6QX50RBzvUFcj/0zQmbVfky
         u++shmr4ywvd1FPQbTyt79tOCtocIjeQiMMCCGeIK2wrME1n7VVgJzvsXCiFxRE1uz8G
         68bRFRozgpj4BUqBDN++ZGadzT0SQFuOkvWajNI5R0haVRXCpgSLnhNUyDIbGWDAtNwF
         IxSR2+lpTqiCCpfDiwpLG2tyLvJvBnGnBu4s0LkgdyEphRqGsb5ZUZIQPJwFBB6cYIiV
         fP8w==
X-Forwarded-Encrypted: i=1; AFNElJ9CYAR/QpaRZ7CFvUKDBGproX1hth8OMzvxd85E2/9rAiXbMukV4+8wxb8WeCX2BmD/9VcbNaS1DF359O1PoO1B@lists.infradead.org
X-Gm-Message-State: AOJu0YyzPeD1vDFDfsplsuBz7+fI+G2b3S6XGJU4j05a2/RLGDQji2gk
	6LIp349cerj5ir8mkBrk2Jn66JnZrUQb8JkuL91Sqrf1P0dVK7sjvJ3NWUiI/BpJsWNv9rFuNbC
	psAGt5TEq9+9152kVk9+t1jgN5ka7MKZlOvz/QfxUzYab9k4qYKdQ6J/3nrhIRleqFmQ7DgXuQC
	wohQ==
X-Gm-Gg: Acq92OHd19nRk/DU0lf/X+1kSFISLoZiZvINZFTzMEcoH4GnuSOpcYlJvpjLgNmevm7
	X1xiByfmeOKljw04JEDt7XVjk7VxyTmSTLGWS0jTOV+u8ldziLGb3mhxyckOZZfRJ9QZUXhMphF
	ESZnNdHMIYnrU0iTbwWFwwSkICbNV2tYQ/kDF/olE/6/9wsYf49evUifa2752fMiRGsurdj52qE
	MASyv0CyAEcStdY8oemmBsnHzrmpzWuXWluW0PO17Akdsxx4M1+29veg630t2zjvSw7SsvINVzu
	itN3R8dScxeyq/cHXO2f3+FFd089DXwdAgOqbZNCJuaM+8PKjy0iYI+QA+f9d1NO7Wi7VTZ+B+8
	bY+lFTSfs8w1YywqT2FMGAQuyK4SHBqxaq58WDcUreNDlvDpdAoJFtOnpYNBkB/RZNYxU+Bc=
X-Received: by 2002:a05:7301:600c:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-30156511808mr2025510eec.23.1778690672488;
        Wed, 13 May 2026 09:44:32 -0700 (PDT)
X-Received: by 2002:a05:7301:600c:b0:2d8:df01:d9f6 with SMTP id 5a478bee46e88-30156511808mr2025483eec.23.1778690671931;
        Wed, 13 May 2026 09:44:31 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:31 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:23 -0700
Subject: [PATCH 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups,
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=1457;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=12DADEarUp3gyIYLo4clpW0RLu3uLhIZfXDpYh9E1eQ=;
 b=f8Z4VKh3kEE91Iigqa0bRxoLVWmVWQbHnG8x2yHuKGTYSe4kcqQ+PrzEu+FAzIg8VOT/Il56e
 tXkqUQ93A4lC6rKJcTD1nMijrqk2HNyOstseNE6TFsoECw1hvHSuoOq
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfXwwLngSQQ1FeR
 5f65cU3fiCmbjPUw1Q9YwWMxNWJIiKN50USDPbI5XJnSOxcHVgav3iccEqN3vijOq3Cfv2hTwbs
 uMJCcTQS6kkqgLRq7CaCLkS4YWMKKV6zglgqTsacn+1GveYIDhFAj3YRvlfGPtbKyPjWhyI0OiN
 KErc2MGOqqfwdzN2dRLWp1EjSQqaiRolyvbIlMmvi4HpcpZus14jCU1ag77j21TMbCIuOuU5fW/
 hqUBlbixDR9+jNU8qa8EPPsxYGWcIM36KB5ezbXBY13HsU4TaibrOyEOEKPdNd6l/5kKiNlej8R
 y5dlHtpA85N1cZEvaw3GLUv80MbcHfE3VwI4iw/S8BgUyciIChCKo5wBGxaAAToC3Gx0PgWczbl
 MU0H1+/PEeN2lCCw8dCLmCsRWYjKVqWw7opWRx/Mf0jY3ukTgh61WZET+QQl5sDrEl/K6LvqKj6
 nj7SzQ9K9ZcF9gmICRA==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04aa71 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HhDMDxCfm6Xc3nGqG0sA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: KV_xnZUQ9K4RVpNW_JNwKh-mMFBKW-IH
X-Proofpoint-GUID: KV_xnZUQ9K4RVpNW_JNwKh-mMFBKW-IH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094436_358691_D5423BE4 
X-CRM114-Status: GOOD (  16.62  )
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

The SCMI pinctrl driver does not currently log the number of pins,
groups, and functions discovered from firmware. This information is
useful for confirming the firmware exposed pinctrl resources during
debugging.

Log these counts after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f22be6b7b82a..abc90a3a7eaf 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,6 +40,7 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
+	unsigned int nr_groups;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -578,7 +579,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	pmx->nr_groups = pinctrl_scmi_get_groups_count(pmx->pctldev);
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "Initialized %d pins, %d groups, %d functions\n",
+		 pmx->pctl_desc.npins, pmx->nr_groups, pmx->nr_functions);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


