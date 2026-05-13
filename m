Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AF3CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=; b=huxxfuYciMYgxo/LvtzJWr4WRu
	VMcT2kQ98iu49DLwOTvxyBup2LBJy4ILcIFCQL2tThH26drsvFHHc1PDnsl6TdEWTK5AbT20Zj9e2
	KGYHUUEj8GjXamzHR6BcQzVLe1pgK/ekpH642IMpeB1x5CyXARvKelUwTx0rLAEHO49FgeBYWQ2ST
	IRyg5OvzcenQPGMLYiUPGWdyyVi1pZcT9Cj9wo+PyEMNPJYpjQ/emwaxu8VDalPsXvr8wFTyChHXM
	XaybBdJRp08dDIOIeNHf8afklE2TryKl2ZIN6ZE72UxqcfQHhRxC/z3gMbjK14m8jkLhi6YXS9hvM
	1cKukSeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChL-00000003FBR-0ena;
	Wed, 13 May 2026 16:44:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChD-00000003F8U-25Zg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:44:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFfBXw3814665
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=; b=WYPu6k/BQJNW8oOg
	bK051FHeGpoAigfOiAPGIvuNhcPXe0hQAIseeH7jeNpVOEiS1Mml8cee/9nyGzWs
	IKxTuDNZS45J/rydoe71x+OslrZTel6RCOzG+ENEc7AOAGV2yNPlvAb/4Jzd12Ed
	tDVLRDZ4ij38l1AoPgCyFlxdyfm/m+EVnwapvj1bRiuPue1ErB2uxk/M2HijhONY
	qTfN3altQ+N1146Lx9M02p+EIUIDqJRoFGAVxpRLQ9SCcoBsVFbNtPt8hNSOvQY4
	l+AbNFMikchb7/che9f+lgUe15nslDqkUbTYsD3iEvchcDlvy/sOBRqjQYiJ5htH
	FPyydQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hm09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so3950168eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690670; x=1779295470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=TIst0mMeg3hN/78p4KAAEa8eR//GVZtL+m8UBhbAgm+P8nGkj0dgp0i17EzWTYGUed
         n4MDPUq7MKdwNwNvgOj2n1PIbOSGwKnJsesWEqAS+12U4GEkoPd6MqL5IADl1TU98qHn
         w5X5oTT+y7ZQnfLxOKiYmxR+pT8zg6mLBuQaHr2qvbVtkrfkJeNVU455wwiNvSBgjpCt
         mQAhWnc58e+FczOZB3KGA1FdO4rHPlxKcG6r/nOSnKkUEyB9nBdB0xPmWXavSNtwJxeA
         FRoBEnb2PYRHPLl95srRPCaGKGTHLNbGW/LMv6G07Wq79sjeMNz5ok+3If8HG4ra13DU
         PG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690670; x=1779295470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=znMu0JYE14eDzL4+1yCaxtsir2SCzQ58yUv1qQfzVrM=;
        b=ck0O8KDBkchmubaQlxjrO9wYAr1T0qHUFb5lef9Vx4cdk5oDHJbl766M3mK33kvhLR
         1rFkZMwpw7SWdk+LmpIb8a5dRvacEORADZVlGxJex9LY+bOKf19RrozwY0Wj14BoEEfO
         KvQZSgbRzAyJscXoXIqEzysHNph54Ob8MAb17J6J7+lz+yVCQe+v+vuk05jw4kPXExy3
         0bfzcCoxjnC+wTVn+ll1pCsF8iCAXUocit0EoVJlD4its/+VJM1Q0emZOuaK1Gi7FaJg
         CyB13eU4M3n+oSElCBWHfCSfY6GM7Q4QdKCSu2quv5Nah7ggHKNevzK8VfLQ+mP18Exa
         LpfA==
X-Forwarded-Encrypted: i=1; AFNElJ8OoRdsjapGT2l5hl8/MTCP95lhgBbCUWOBSuRC1pNyf9O1Fm3vwNlRY2R2rWG8Bjj+ZlLLSwvrmyoK0/+l2pi8@lists.infradead.org
X-Gm-Message-State: AOJu0YzsXceaHF/Rjx3TZ7/HHN75+f1IQP0/91DuCaeqh+AXd5Z7uLL5
	lD5TUAne1502Sn8vK0Z5PNP6uzNWusHmsiLlewcCaIOigtIyedVmJW19F1qdbl4TJkNPoIEGMCr
	gTp0hQGU9UqVu+zI/MsWktZbqt8JjQGYHsFETRojE/FyCJPu8Ks9l1XCq0OIoaEc4dFgQ047GuI
	i+UA==
X-Gm-Gg: Acq92OH+WoD1CKNQDRRTQCEuKKTzvrnDqUeP4KuuEyXee8F9x6HEsfPDZvFbFtqAZ6/
	3NUj+FTrVEB5GtHq2c3VSuYfM80hZ6TWiy4smqU0UJLWcU25YhpPm2xLqPPIdDo/oJU9eJd5gDD
	ySNBxKkq2Og7WuQqXCoTUQZdKAWljGznV1NOyhY5kP9VOUChMdXCn82nh73fyOeu0/aKhgsKd0+
	kcYKAVHWDEtM5SZS6YXnOEkscLcf6Xzu8+Gc8vIqu3Gt/FdDW4XLZxXzz42ZTIJ9ng/YL4sVgSk
	JAYyDYWmaKoEFaOPbf74FB4HCidOE5BiORJouIhDd4PpkVzq5splmfNi7Lg3WllymKLoQ0JAta0
	WiMbxNPmHPxTAdDL9i8m1kXH1HPztwG8Z7NeNo2cmhrlLoEEOoveNWJHJVBUwBfKrjNw082A=
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144427eec.10.1778690669468;
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1294:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-3025fc493admr144398eec.10.1778690668884;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:20 -0700
Subject: [PATCH 2/5] cpufreq: scmi-cpufreq: Log number of perf domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-2-00b47b1be009@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1078;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWTJ66ICrMMYPDEetoAigezffDe9LGu5ZAq3+pTYj0U=;
 b=dKt2ltOsglRwirWV/VFgytLio3t+0trY/M1zjyG4lzrU8COWFCdYDtyNysYCuSfhoFQEYkG72
 wGdFMM1kbfEAUr+QPv0OImnPdu41r/pDiZbC4NCgA6VLy0lrdZgwyx2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX3HERuj2kKLXS
 hJbnEWploqVcqYp9xBYSduvNYMQ+QENxCnDt89mwc4CzxOvjR8ycEWl776DGGaF8ngXMZG/3mcw
 i1pLy6hfP3zA9FK6RTfvYi/hWkbz1AS/6Cj6C41UPl011KQFbH8djguk/mmi5uiptBkwu5oKWo/
 7TXbl5KQIwHnCKD1NjLXHu8OWDdHeGmBWrI/8WCUA2+6+48OnoSZoMW6DDXyTt2el14+7RLL++a
 e/Q7GirtE4xdFkWaw/Tnva33YkKk8JbL9YZ8YtYWYYVpWM4QlQXkS0RcxLgEbWoJSQG6lhmAqrM
 VpYbdVI+guD5Mndy4ct+0ywBARhNOewR95td4IInlRZ34L7cwLM9nI2sAC3GJhaJy87GTTeVlr2
 g5KOk5oQzjcdgQfzdph1TjkMw3gD+5B1Jf0iu7Cu/2Kdhhj8Cs+gpEZ0g8xwYHWY/mAHBFjw7JJ
 hpjaiLH+0lbbJIxeLOQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04aa6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xQYt0fwn8ryh7dGzGRYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: m9aqym6zGNS_AHYgL4diwtEc5qWh_GnT
X-Proofpoint-GUID: m9aqym6zGNS_AHYgL4diwtEc5qWh_GnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094431_656187_3D060369 
X-CRM114-Status: GOOD (  15.89  )
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

The SCMI cpufreq driver does not currently log the number of performance
domains discovered from firmware. This information is useful for
confirming the firmware exposed performance domains during debugging.

Log the domain count after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..d5c33eea2477 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -468,9 +468,12 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
 	if (ret) {
 		dev_err(dev, "%s: registering cpufreq failed, err: %d\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	dev_info(dev, "Initialized %d performance domains\n",
+		 perf_ops->num_domains_get(ph));
+	return 0;
 }
 
 static void scmi_cpufreq_remove(struct scmi_device *sdev)

-- 
2.43.0


