Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF19EC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=Wb1muwKWMmUFPSXe7D+hykryMk
	boCaFCeWqzpkicSEYvHyVUuXVa1vURYq1ce4E3t6Ati5AgtgWwidT5dRg8TlHhFbPHtJDMH6gP8is
	V8YAnzzz8Sqkx66VfJkwRXds6IuRWgIe2qPPyQz2u0wizd2PqkWWWqfi2xT1rjg+Z4VMZ+hXk1HIe
	rGb165udIQMsB+sNgdfLBPVffwUpzd0mlj0qnkyxbZol+2w/NAOwdEdvxMPmisqvIEloPWtbptseL
	1jtgNdP0rtkgMyRta8JhxZfm/T0z/YsjYeVASO193RBBy499SghPQLfcHIgrNQ0GE8zZ278Gf1ase
	Onb9xaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bv6-0000000GPCB-2HpQ;
	Mon, 23 Mar 2026 09:50:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bv1-0000000GPAT-4Aoh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:49:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tog83468102
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=Mn7WVtANdLkIu+8d
	ykBDn7KOR2vtBgKonqxOg0r0blLWFH8TBhoKkUME5Bk0NcZySln1ruTj4QQn0pQW
	rEpWrqmMGi0rM5PveuriqY7HMp9LzXugw1t0AombowwSCleZ0sKJE5z/Avk+Qv7t
	Qv0mDQY7c/kK0WKeeaxvAtA/5r/qFZ9WF8Zl3ChMXON2hT+w5DejOeycpqwhXWrI
	VZLRzQl8IplW2b9MS+w1SmIHavZfa9mQpxLEEj7C+TeNcgv06Rp+kBYgWrwFL82/
	DXHD/nRVrXZrmvbzB1ryz48TcnUCNynZVBCNUspOI2oAPfTnPWvWI/eVhCSykXXX
	DN4KEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggdr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:49:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b05d170cadso39833045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259395; x=1774864195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=L1dKudGKeBRBUfQoagivOB23UA23aLI2X6Cn+pSdTih78BQkGIKcOcRSeTJB0EPQ53
         UA3OhKXQkrJSjxFIfQCZgskj46NihLfOnid3Ekwzi8TjRN1lidTESpxRndgha37rU5AL
         ubxwuWdZUGONqlSqPJ+SrqzjXMsDn61jEUt2LWBWKgMxXhFphc9UtlXrZ0/suLDXQW3i
         ySIxoKx3Q+JA/z0Y34GLeJLU4qIEuz+YlZ49nk5/62s0hH2SYhczVbt8kGYYdMoeceWu
         alNHgt9q1AceWaunu5xXwNWr0GSJBynGVkkmq1fC0Idh25NwhMbNtAq1qFi9QmHYuj0/
         Vwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259395; x=1774864195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=g2eBaYnrch8pBq7/WxB5L7agvxRMT3TzEc5uKqjJ4ZWVNBRZUz5DiOs1trwRlqdqrJ
         va8qnG0QUQlXR2CK3NX7ZHjjllDLkc+SjLiIOz3e4KcZ45Nt9xPHRZaYgVN4JbR8a3Dh
         zdgT0zr9etF2K22eaKW+cEhveph1C8prHIPZcavA2xneuyA3SshfDP28UEJ85zG4RaUy
         ktkU+GQlSvqEPuLTQrxzBM3r6oGIWTmpkLXPqs6fTbqICkOPW/3/BPLiRXG3uHfwF1xA
         DmiFXLO3kGF1UlgWVGL5GmOZ6gHtmskfYvX8p3zC4Y4fNz96VUlQYS6DzHfXLFqInLkP
         h8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUmthrhCm6nDA+J7pw7w5IFDwwQXEonHhgDDe2hRh1W3L0YaKid510yJ0WuXJ88qPFJ27g7S0KD++p0pZQnKF3b@lists.infradead.org
X-Gm-Message-State: AOJu0YzoQFL2t2f4A6uqkIoce7DjKZvOeA6wbb0hX12m2Li1tOTSH+bp
	relens/s62qVlynhAy7ER/ZmFK2+AMY+d9sBmcJdkSPS9P0nhh3Hc3eJuUYQylSbS+2Kl4DWUJJ
	chSHTN1Ur3uN/5hwmLyJWH+jYy54Emt6QHPN/n+KFfmznKeR3lCjw2OCxWkxAjVQZVzr/HCkIAz
	D04g==
X-Gm-Gg: ATEYQzwHwyZbhTXUc0ny7R97XGf2rvd9ytvhJpgnrqT+Am2M2uy7rqL/N31OtoYvv0c
	4SdouxhohbVKAGji4QRpwpmQjmUXz3RofbFjRvPE796JwEU0Wh8WliD/JrEPYZ45LeYmY13AmZU
	XvwxIuUOPZ9NGEkqqbDFR7snsGoyFWXSgII0twoLcffiHqibAbFSUPt5wB98zAElqBkNTdES1yB
	pxKfU/34nY3iH4Kb7hbpf8p0Vb9KLfMbgbbtZe0/by6ldqY5NGesKkKjCEILR9jqFkUBtx1embK
	eNySoJi4JzKWboEbml8a0p9s+o1OxuPH3XyyXBBdWL0v2atYBPMQ0dFvI9D+Hs4yCJzbX6GZKLv
	Yp2alOR7HDNpfP/EIAMS+urJ3BReqhNvXqBJXTvj6EB5C+jlTT0aFB9vk6FbJh+prnROyonSocV
	b1wclj/t6X
X-Received: by 2002:a17:902:f545:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2b0827556bfmr114909115ad.21.1774259394759;
        Mon, 23 Mar 2026 02:49:54 -0700 (PDT)
X-Received: by 2002:a17:902:f545:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2b0827556bfmr114908795ad.21.1774259394276;
        Mon, 23 Mar 2026 02:49:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:49:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:26 +0800
Subject: [PATCH v16 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-1-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259383; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=w8ZILQOnGTMowRbpwWpLUHa5OOF+7MJT/Ml5rl4sI+DJZQpFY3JY/QPQdMZL7gqB50X0CQjcF
 Ld7n0gX3kSYAOt22Gbfx3Q5bQ5n5sDS6wUCigNYTrtUhtb2T00rpytb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: Aiac56XEzaecv0A-gj9KnHQWT05Ivf0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX1Lm3XuieoEWG
 NpMOP6OKOYy30X64vhG0xn5se13+CJCte8K47jgiTOW8ZXffQyv9yS0UardRtJ3dlwQiuO8mHct
 mF4M+S8ftz+9tpMFlGA8U+3uWYiFZMQDXwCrlMYpfibt/LSSJgcPzlAcRj+6VDO0zqMLY0N5J9a
 +Gi16qSQNSG55+rKB8pX6vCJAui84A7clSM83m2I6NcPRimO9S7YQ3l3ObgVJFh4HvGmDUk+XqM
 lo1paEDGdcgVNqTdqCgGKtj4m6EWcsx/I1ewZSd8KLpUpXpRH4i9XL9+tSIOYoEg/5rgK7TnkBV
 3sIhXV/0Os1LjH37Mg0JOx4HpSiw48EkI/IIGvJyoIwrW85KaPRBbyZOxGDQHw4pDaV5QubSlcU
 8NWvKarRzIOub2u+hCF6GdsF1ad2qJpsiXaV8B9oLHXC9pnLALNclsCJVElHeQPlo66gF0T+PbW
 RUcVTIor/0Cgm+JA/oQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10cc3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Aiac56XEzaecv0A-gj9KnHQWT05Ivf0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_024956_045200_39DC9137 
X-CRM114-Status: GOOD (  22.30  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..221de57ca57b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


