Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9981BD68BED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xua7CIpsfwXMGEG0aRsvIhJpXzyieh8r6ETzlhoAhW0=; b=F55aI5GjxGaCEJtKYoG5H2+UKw
	WH8QmR3zYpiRbYx8xJQxE82363qBFME0eoywOHmki3HkQz7YpKQuG20bPwYckr0GzojOSmE4TusB4
	NFA8xG0vJN/AOZvfr06SS8QsVOvhpeY2ArytWjfZ7kAggxHMURW0qbRfKmOAY72LpdDbQXeOX1+B0
	e+FdjAUSE3N6D9HndwfBWf2pSqdAY4Wt0M6pobEbOAIS867WONeDA2Z08QtjJW9cgISurligF/2ws
	CKgQ4kAO9pGpsaxVo7L+/jSlvD1scHRYjaTL3Ogd9POp5q0O47U711llXkJf7rPTKH5EVGM2kO2jG
	U2+H28/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW96M-00000008142-4Ac5;
	Thu, 18 Dec 2025 08:11:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW968-000000080s8-31Yh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:11:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Ykod680787
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xua7CIpsfwXMGEG0aRsvIhJpXzyieh8r6ETzlhoAhW0=; b=muXZr8P+BJD1vjec
	BrEryU0X1Vu5m9Tau/J5PBxykaYOoV6x8FmVXWFIAZkfa7dh4fpM6GZaGgzunGWR
	CkEP+NxCKTuG+w3C3dGMXOm0Z/FOREDuDz0yVbW4CoheKJ7kymMusWpaAWza35Br
	bZErVuCdQ9WIwcOxD31psCSvn99tRCVsrwflmYAVtDNaWEq0KbsmqhCcWKORUtIM
	sryuEcgWbSayA4FH57+9Lg2B8U7rw8GVIFgcfrTBMgIAyUQ/UuiwsXFZI31TIis1
	yKUizWCPgYYOAsCwH8oIMCaKjyIBQ//lpc3ll4wTbdsKDnj9ZfZfMu1e9lfECbwv
	LJkZyg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhhcer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso855662a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045453; x=1766650253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xua7CIpsfwXMGEG0aRsvIhJpXzyieh8r6ETzlhoAhW0=;
        b=cgs3kiI30+5psX5JIodKoUHnvUoioIbHY6/p/2YuPMWuDOrmQZmo4ukPDI1zgmJgkF
         m6ayOpYYQieRFi29pjsllrL0XFgBMsrv+hbv7NjwhmqA/zA9CwqxHergAvAac3ycgz+F
         P/8A4nbma4uAv2X99HUD7mr27s21/GYO99zP8u2U2Is0/G0mrJVGAQ0C3QJVYNamiuG3
         oAeewIqyn6ORznAxrKhwxBObXRrTzVX6mp41GTgu/SqwYGiKDvzKjQZU4JsGbRnBdXbw
         dNRh/B0YY26P5rtGRapNZTfP1HV6TzSUV87hFOn6YHkgbbh+encJ8jdbiV5fiWeWoi6x
         RILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045453; x=1766650253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xua7CIpsfwXMGEG0aRsvIhJpXzyieh8r6ETzlhoAhW0=;
        b=ZuZb/3oJAg6rEzvIsHV6o6lEybPcKfRCHWSPqlpLm6DrldawsMcLkXGDwpr5YKaOLf
         /zTy2cZ5sgYspgNno1da7NSiPus9zJUsd9k8WcPdbwNmMCOtPOkgJrOBroc+jNNnfHl8
         6O0fkCG9oFvcdTMeM8pocOgw4rFMUMC9Ba5/H1U0zjfhkb3IpvDmfv4v3aPFBAFN5mB0
         7XE7jTMPVWx+KHpULxBQpV+XzEy8bxsAwZ8qH/qFP5MQ87tjeH4YyWnF4ZMr1MJzI2eZ
         QSyIxfin6e42SG9PPHiN3F7bPoyESDdgfYZqKPN2a7Auj97lrp7crWDCSM1eVrvNo9wY
         TVfg==
X-Forwarded-Encrypted: i=1; AJvYcCVqK+5z00gkQDNcq1NIjHPyFbgwMCFMGq3E7O54/DMwEN2IcDpLyzFClYYfXSZlJnVq86M4YlBJ9FT/bZrIZmYI@lists.infradead.org
X-Gm-Message-State: AOJu0YxXLs+IJbG9FD7spCj2NZaV8otcJL2AHJUcHOuOnMERL6KXYZ26
	arFKdb7U8L0DR7k+Cieoy7prOEPT5sDCipfGntqXrtlDRvesmFhEs6aRzumn/PO9RMwSEwe4kWv
	jJNpD3WtkWlcZBY/9Rsn8vt+pDI0cHxkZZa13oBnyG+gGSZZk3ZhMkK3BMtWlRD8lVHNyyFre4p
	SzZw==
X-Gm-Gg: AY/fxX7saH3Oq/Ays03CRwFe1EQ0DV8+CcQtUCOUSxquz+G+nkn83pMwY/HKxuhA1j+
	WU25/PzpLX8cqIAyf4bCan4x1IjIhOpD8mpr8dDxbwP8Pz4HUd52bqrYbpdmUfvGTZbH0338UIh
	F4OMJY6qqqEZvKx0/SWLhfoFIMLXbWCsNo0u6HxIpncInn+++b2cKH8OiQd8KvY8WtpU/0zmuVZ
	IAYZjuIFpCOW8HJVT5ey7wqxCFzwtdTaJn4qes+7fJLkO0IAFFkfzbpbF3T0YZH74eoLCrTZLHv
	O27cI9Pa1GbGIG/Q/3qqNPaL+EmLkOJ10yPiKF2vnj6b0chHN5DXcdaCluuWG45Q9gGgz3V7RhB
	t2mb8VPpHSI8TFpJZFeIdfv2dq+ZPQbCrK0fBnbsCwU73qxcBwNacQfUUAEb5A9MTKlU=
X-Received: by 2002:a05:7300:dc05:b0:2ac:2c08:9017 with SMTP id 5a478bee46e88-2ac3025c46bmr16758027eec.28.1766045453398;
        Thu, 18 Dec 2025 00:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzIYOYrzKJNgMYGQeIIPo2edSaN7oTEFR/z/hQnoML6t+W4zedgaa76+05Aio82gg6/tgrTA==
X-Received: by 2002:a05:7300:dc05:b0:2ac:2c08:9017 with SMTP id 5a478bee46e88-2ac3025c46bmr16758006eec.28.1766045452887;
        Thu, 18 Dec 2025 00:10:52 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:52 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:51 -0800
Subject: [PATCH v2 11/12] coresight: Pass trace mode to link enable
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-11-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=9596;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ZizRFuPaK/LitwSdLNplW7Ev2jbzENlbotIRtyE7yN8=;
 b=DvqIqB9difxf+/WNfzFJe9N1imzh6BaFyNq7kAFHLDqhsY5fPBidwE1QfWrPkOYyWGR1N6cRo
 d8tKIhkyqE/DoVZXOYngviSgeIOuKSuS9KNpN6JPBrG7YgwGpi32Fhr
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: YdkCQtgh1rFpIaXPSz55WdelMNb5bLtG
X-Proofpoint-ORIG-GUID: YdkCQtgh1rFpIaXPSz55WdelMNb5bLtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX3geqrrV7PqSD
 q+O/wF9aHj2fYUXywjkaZyI6ELgY8WU7uWHqK159SLAT61s+uh6yy6Ckl8B8NZxydmqEzrXNOQA
 8MVvSVXBdCTljdUjWcDqkHtbRfjaOkqRKRt2FTcBtwMAu8vJVRx1gfSbIt1D+9SIc9E1Z1XsF+q
 QlBURHDwbdxSguHX2I/3lwN9PvYETV5+ZKjXoKb4itbFrtE9pDiYZ1agoR7Q2ZRKAMEWBEOkOoO
 gkBa7kvbJ9gC0rPmsne0xat4lH1jxDOaTO7zsr6UfXmeKOA4slTC4Nx3+rQdB2hC0Vsx7Xjc9PV
 ZBBSGFWF5XLOLyOBPjypDtTluKQrxf1AGHxpdgINaftcV5N7lniVb7hD+P90WdcU47duCG8RjAY
 cnUeWz0+ArMVa/NiMXWJX82vr9srWA==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943b70f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_ycWAoKx6aYVZ7XB0rUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001056_986912_52141EAA 
X-CRM114-Status: GOOD (  19.37  )
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

Currently, the link enable callback does not receive the CoreSight mode
(enum cs_mode). This prevents link drivers from knowing whether they are
being enabled for SysFS or Perf.

This distinction is crucial because Perf mode runs in atomic context,
where certain operations (like smp_call_function_single()) are unsafe.
Without knowing the mode, drivers cannot conditionally avoid these
unsafe calls.

Update the `enable` callback in `struct coresight_ops_link` to accept
`enum cs_mode`. This allows drivers to implement mode-specific logic,
such as using atomic-safe enablement sequences when running in Perf
mode. Update all call sites and driver implementations accordingly.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       |  7 ++++---
 drivers/hwtracing/coresight/coresight-funnel.c     | 21 +++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-replicator.c | 23 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 19 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-tpda.c       |  3 ++-
 include/linux/coresight.h                          |  3 ++-
 7 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c660cf8adb1c7cafff8f85e501f056e4e151e372..1863bdb57281b4fd405cf966d565c581506ea270 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -314,7 +314,8 @@ static void coresight_disable_sink(struct coresight_device *csdev)
 static int coresight_enable_link(struct coresight_device *csdev,
 				 struct coresight_device *parent,
 				 struct coresight_device *child,
-				 struct coresight_device *source)
+				 struct coresight_device *source,
+				 enum cs_mode mode)
 {
 	int link_subtype;
 	struct coresight_connection *inconn, *outconn;
@@ -331,7 +332,7 @@ static int coresight_enable_link(struct coresight_device *csdev,
 	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && IS_ERR(outconn))
 		return PTR_ERR(outconn);
 
-	return link_ops(csdev)->enable(csdev, inconn, outconn);
+	return link_ops(csdev)->enable(csdev, inconn, outconn, mode);
 }
 
 static void coresight_disable_link(struct coresight_device *csdev,
@@ -550,7 +551,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			ret = coresight_enable_link(csdev, parent, child, source);
+			ret = coresight_enable_link(csdev, parent, child, source, mode);
 			if (ret)
 				goto err_disable_helpers;
 			break;
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 5d114ce1109f4f9a8b108110bdae258f216881d8..c50522c2854c7193a8c30b1a603abe566a1c1ccf 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -121,7 +121,8 @@ static int funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 
 static int funnel_enable(struct coresight_device *csdev,
 			 struct coresight_connection *in,
-			 struct coresight_connection *out)
+			 struct coresight_connection *out,
+			 enum cs_mode mode)
 {
 	int rc = 0;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -135,6 +136,23 @@ static int funnel_enable(struct coresight_device *csdev,
 	else
 		in->dest_refcnt++;
 
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->supported_cpus &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->supported_cpus)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			if (drvdata->base)
+				rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
+			if (!rc)
+				in->dest_refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return rc;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable) {
@@ -183,6 +201,7 @@ static void funnel_disable(struct coresight_device *csdev,
 			dynamic_funnel_disable_hw(drvdata, in->dest_port);
 		last_disable = true;
 	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index a9f22d0e15de21aa06c8d1e193e5db06091efd75..cc7d3916b8b9d5d342d6cde0487722eeb8dee78b 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -199,7 +199,8 @@ static int replicator_enable_hw(struct replicator_drvdata *drvdata,
 
 static int replicator_enable(struct coresight_device *csdev,
 			     struct coresight_connection *in,
-			     struct coresight_connection *out)
+			     struct coresight_connection *out,
+			     enum cs_mode mode)
 {
 	int rc = 0;
 	struct replicator_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -212,6 +213,25 @@ static int replicator_enable(struct coresight_device *csdev,
 		first_enable = true;
 	else
 		out->src_refcnt++;
+
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->supported_cpus &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->supported_cpus)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			if (drvdata->base)
+				rc = dynamic_replicator_enable(drvdata, in->dest_port,
+							       out->src_port);
+			if (!rc)
+				out->src_refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return rc;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable) {
@@ -272,6 +292,7 @@ static void replicator_disable(struct coresight_device *csdev,
 						   out->src_port);
 		last_disable = true;
 	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 11357788e9d93c53980e99e0ef78450e393f4059..f1b8264b4e5c8a8d38778c25515cbf557c0993b7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -427,7 +427,8 @@ static int tmc_disable_etf_sink(struct coresight_device *csdev)
 
 static int tmc_enable_etf_link(struct coresight_device *csdev,
 			       struct coresight_connection *in,
-			       struct coresight_connection *out)
+			       struct coresight_connection *out,
+			       enum cs_mode mode)
 {
 	int ret = 0;
 	unsigned long flags;
@@ -446,6 +447,22 @@ static int tmc_enable_etf_link(struct coresight_device *csdev,
 	if (!first_enable)
 		csdev->refcnt++;
 
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->supported_cpus &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->supported_cpus)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			ret = tmc_etf_enable_hw_local(drvdata);
+			if (!ret)
+				csdev->refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return ret;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	if (first_enable) {
 		ret = tmc_etf_enable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ff9a0a9cfe96e5f5e3077c750ea2f890cdd50d94..48e9e685b9439d92bdaae9e40d3b3bc2d1ac1cd2 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -73,7 +73,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 }
 
 static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
-			    struct coresight_connection *outport)
+			    struct coresight_connection *outport,
+			    enum cs_mode mode)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 3a3825d27f861585ca1d847929747f8096004089..e6f52abc5b023a997c36d74c0e3b1a3de8236ba2 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -190,7 +190,8 @@ static int __tpda_enable(struct tpda_drvdata *drvdata, int port)
 
 static int tpda_enable(struct coresight_device *csdev,
 		       struct coresight_connection *in,
-		       struct coresight_connection *out)
+		       struct coresight_connection *out,
+		       enum cs_mode mode)
 {
 	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2b48be97fcd0d7ea2692206692bd33f35ba4ec79..218eb1d1dcef61f5d98ebbfff38370192b8a6e45 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -383,7 +383,8 @@ struct coresight_ops_sink {
 struct coresight_ops_link {
 	int (*enable)(struct coresight_device *csdev,
 		      struct coresight_connection *in,
-		      struct coresight_connection *out);
+		      struct coresight_connection *out,
+		      enum cs_mode mode);
 	void (*disable)(struct coresight_device *csdev,
 			struct coresight_connection *in,
 			struct coresight_connection *out);

-- 
2.34.1


