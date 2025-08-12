Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA047C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrGu5dBmfdMmzrfdvoTs2DIE+CWt05hHpp1+g0Qaf2o=; b=1fOGNobxMIlr8iuqN+Nz24auZA
	sdYuUS7wfXD8QCjxaBmzVQQI2ikzr66xgLCa7I2RJsdwvXnfJ7lqeCQWuFGgZ269ChGEEkboaNzC1
	Ts2YYcH40gD4g0lxXSfr4ywrBQJSsb8O610IpXt5ooTsR4jbcFix/8fJEkzbCjpP0KCvkME8t2Q4z
	5975I8HO/K2pW6wISzpDC6TWqLxTJdeMVBYwrUXZYbCeC/WVBYsvcqUEiROcSGds3Cy7prqWTWhd2
	njgfzYGKzFVVuPJRmzehB4AwK6hzBMWmfa2z6UDnp98jHZcD32CqrotAnGfpOG8Wquq7kheTWpQIW
	1SxwOq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloGw-0000000Akia-1W7w;
	Tue, 12 Aug 2025 12:38:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkVy-0000000AGQQ-2bKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:37:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Y07E028829
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wrGu5dBmfdM
	mzrfdvoTs2DIE+CWt05hHpp1+g0Qaf2o=; b=gufhqA2ZBtkvBSF2b8ZHeibVtt5
	H43hsVSJWZzwVH70ZTx66iee0kXSpyLFjt+WIp2nL/iJ10+tej5R08Dv4/VDezcV
	kajiTaj4wwFt4VPqzZi7Lh5wwMxkEAF9r516yTN3ncFqMcTyKkNhez8wbYmg3NSU
	ONPJprHDkB0q2vdSXmZ5QhokpifwubucDWxGjfMoqOIVrMZhX5Soc+NomHwPOww1
	uMKm2Bk05Ar3iiqkoi1r6LXWS5PJN+6dACdhWbUCFcZA38v0KrAbkVhy6y6mWj0l
	SuVOxLx9wkq/eJ8dmitZ8AsOqgluTivUGHqAcPJkB3g9RjL3Z6b5oYh3ahQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqkem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ff7d61fb7so51103985ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987869; x=1755592669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrGu5dBmfdMmzrfdvoTs2DIE+CWt05hHpp1+g0Qaf2o=;
        b=Ip5uwDU8riaUOP4ObqcWDe+2gcIW1qBT0dhN8gVI5W49gEDKhRTv7AzUviwNWiuk5N
         /TuQ5pSe50dwFwy9xwoHAoT1x/t9jkEAgmUwHgTqZvR0DkYoNr9eXfewVG2tFkBrEz3A
         6booo4tO+0Ftrl1TXMenHJ7/VdK6WBr9NJjhe8OcGtWH6HGDK7tCj2YvOMMrU7Ndj0RH
         giGcOug7Ry0fsjslZs+EUmoobzZG0KeDdsG/v6YQMaG9NNsu3ogg2Ee/oKMtOY6wB/sI
         xijOy6PyridnyfhZdarkILlNLV+Ck0d9tM0m1J4AIsosT0m/bpKG8FDy4RCEnBHC4YXo
         LBUw==
X-Forwarded-Encrypted: i=1; AJvYcCU7S7dKHMYhIKPy6q7W5SZ9a0yrE0PTeCdszNgBYC7mwa2OrrdXSb3zOtLpF7Htx+Sue5PwaoLbgwrT7ar9pzMN@lists.infradead.org
X-Gm-Message-State: AOJu0YzQFVM4P7D1OJrG/4GJU4/EaW3XmQess2oA6M7osT2+QaxRTUE+
	/IkPPFciWUUZ2R+2qJeUkqncKxCyKgabcoiQ0X7GTlVQzUzykqGmKtMaWLP8V6tBn7WhLAlyzui
	EQCbLpVw3751rJZb29ljMQWc+PS5f51+Wb2TFqrVgoCFVViY1xl7HqTD9zDjSHYwaoAgcmX9dSo
	7YyA==
X-Gm-Gg: ASbGncsxMMRgr4siCN2F7JhGZsVdBNK99y2zSP5/sR3q5pfoMKQplSJtO4DuXw2yh1E
	d9+rBbSU+Dn2TmoymCEl9qH19jkdTR6PBYfGMYlOpcdRsPa2KoA0GmlRdYNORsUG+nj5RGQSy/b
	rvjOzruZPrOHGupBI9RyGHlE8gQ9Z2rvXiZfLoYodBowfpYlzM88kZibQy6Q9B1XukFg6P4gurY
	t+cQdjED3IuXZcOpPv/4D5BcQc4Y/V+sqHCsJOvvGse3J4bPwqR/p+argP6dQ33DjdoSqxRuv/4
	LE0roBUQ04UNJF8UWCyNtfkYIFiMs2cFy+PWW6/aXFLSVFt3oDnHRi6BVM7I1axWKscgp3H0ZS4
	AuZD4Cm6QEFgI1+1t6aE=
X-Received: by 2002:a17:903:32d0:b0:240:6fc0:3421 with SMTP id d9443c01a7336-242fc2df919mr32672025ad.3.1754987869227;
        Tue, 12 Aug 2025 01:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1epWZtnF2IBB4X6gRIcAxheEo7d+5Pdk6LBydS5mLgAm0zXrYNJ+qesoW7cmIPGP6RrbrFw==
X-Received: by 2002:a17:903:32d0:b0:240:6fc0:3421 with SMTP id d9443c01a7336-242fc2df919mr32671605ad.3.1754987868720;
        Tue, 12 Aug 2025 01:37:48 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/9] coresight: core: add a new API to retrieve the helper device
Date: Tue, 12 Aug 2025 16:37:24 +0800
Message-Id: <20250812083731.549-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689afd5e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ViBFXQGRTvhYuEXyb1sA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VYMr-fXwfRZhWNM3o838NtHncSfbE8xo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXwZWpmaIeWB4B
 KzmlqkVyYTvXoHgc+kX0GnNCZKXqYtc0n60VVUMxoX6kw1Y6wZs476bo6sPtjVtS3Idy7lY3Ze6
 GmRabqq56xlkJG7X2KcXwAnO6i+b5qtzvo0tb5Upjyd86JFdONiZalnkb3YyqXCITJ8Uxa9VLzt
 Oevj2h8KwUve6pYmEwhjSfp6r5GEJyQypfv838Zl0YPYFju8XswEXrT4s8r9kw9DFkosfWLBP48
 kpGeGl3ZIq8omSRnjjPfqCuxVyJEvKu8Ct2k+5tUdfdvU2UEPQLmpjJHSD166tbwhGrmkue618h
 G5KsjLzxG/DTcUWLStFC9MYOQSu21Zv2kP5xBHZPLrUSJseLJq22EVBqhmAif4AxoGyXe4Z5OtF
 3wH0Ir3V
X-Proofpoint-GUID: VYMr-fXwfRZhWNM3o838NtHncSfbE8xo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013750_663383_9BF8A020 
X-CRM114-Status: GOOD (  19.49  )
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

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 042c4fa39e55..018b1119c48a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_helper: find the helper device of the assigned csdev.
+ *
+ * @csdev: The csdev the helper device is conntected to.
+ * @type:  helper_subtype of the expected helper device.
+ *
+ * Retrieve the helper device for the specific csdev based on its
+ * helper_subtype.
+ *
+ * Return: the helper's csdev upon success or NULL for fail.
+ */
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type)
+{
+	int i;
+	struct coresight_device *helper;
+
+	/* protect the connections */
+	mutex_lock(&coresight_mutex);
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type) {
+			mutex_unlock(&coresight_mutex);
+			return helper;
+		}
+	}
+	mutex_unlock(&coresight_mutex);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_in_port_dest: get the in-port number of the dest device
  * that is connected to the src device.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index e51b22b8ebde..f80122827934 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_in_port_dest(struct coresight_device *src,
 			       struct coresight_device *dest);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


