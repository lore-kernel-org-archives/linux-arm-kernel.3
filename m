Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F270ECDE008
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=; b=KmW2Obouz2sOXI3weA9fh0CX4i
	LSg7vEmUSvSQ1jO0+e2H1z9MzAzvylQFmBjCXuJrmKTfn2rVQd9gFwRxlSUUTkYi0Dmpa/jEcLxUY
	uUAL5NarXxnGmkBu2RpqQkTAmuPaKz2OWShZl85drIu+ifjkNhJd9Xi4F/mkN25tfYwy/3hb5k+xE
	WCreGfewKRmN/hsbNp5bcH0T1lx2lGCbcNfCRKtYqpaJb14+RnvKCPhSFfHJvsyrvXs/63Ei0JbNq
	lVOzDe2LHFTqImFudlME9qptl0xej8epE20v6ol5wkvOtvG0HAEUSuTtvaSeymVetnNvKHYhL9OrI
	ukJOweTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbb-0000000919c-0GOb;
	Thu, 25 Jun 2026 10:46:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbY-00000009183-35dW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:46:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jtks3077514
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=; b=nktWvLFFua3yFrvd
	5B6nj7vGsAE6Lr5dZJwt5IA3hJuKA9DKcIxxpr1gYLk/OnGRIsih3W3n39YUVJKi
	ioA69YxoPwgudCSl7IIvK33sJRokav+1zQ9ZVU0hi15A7kxxi16eXu4lTnHjmjtq
	oBKoXnTZ4EAIm2UxbibrJbIQ7Vb02PYSImjzW0UgLReajzEgQdxpv/ACh97dPixr
	Dj3BruedT6b+9nzI0J3bM8ZIgaVhaCG1Hwtm1uvTAiEZdCYFVd5tTysLusvK/QIl
	qsmF7FDNZum+Rx7PFSoH43uw5ek7/k9K8VwFgrMWG9WSqH41i9s4EfyEmWjDgN56
	MaCh6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynrre2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7edb8505dso13060105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384403; x=1782989203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=;
        b=eR6j5ha4ZMtIxypBwdbw3ayQ6RcBftVnIbLBl++ocGL7g7J6dhycBbjgKhHXBxRWAP
         32WjkrWuzy31kh5fcpD9B487OEzlJTWYSJZF4ozDbMZ65sisUI3SCyB6njU95HniOwsJ
         jMj5+D41TnMD1urS72cMgrZ832skoluH2/R4WOZomfs1eOoSaDYVd+YXfmAkYy8Cej85
         P+X3egKw1Frc470ufgA167OPOpDtkt1m9CAuiBRg1m8tUgDKGy8hBB5xzG6/0tF0LKhS
         iVqXWFSac+4Np7fOG5eRYdN5P9/sN/KHBMUcAkRd3UizC+SGiePzcQ4S/t0Nwz3VXSc3
         MvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384403; x=1782989203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2gE10b7DqflojsoJUwYlVeY6chdArR8ZAvuFavqtsk=;
        b=EOVccCvY8i8Xru20qtO0tjWFWKezOQov8adfv01BtIy0MSv0t0oNwiudEGmtIgSiaV
         C1IUFE5pcqv2k/rLqobcqYKNLXx/vEv+0EndtFa5yUY5cvXPN6SmOnWS+5ha1T5HTcX1
         n9IBcHRlbl/52Z1etHIwBhZc1UyDkE6cCPuUKB70xvPTCi5aZrJgwfByunqc3Q2lEmX2
         J+uhkTtS+u8usbMQflUCYi8Hm1en+0EwNTsOfoxKiRWCAuAzxRtm5qi5ReOsbJLtu0r8
         o79vmn9aSvQScIFnzaJZtVJQM4W1/qJzws0o3FOlNiPbVF+ZgdEr6qEOXyLiExPsGBLO
         DzfQ==
X-Forwarded-Encrypted: i=1; AHgh+RryzukAACE6UEp5JY29eCcKwWDl5tpnn1+8AUs5YzVFv73isX5vrI1nyKagLRovJu9Jj8aO28hp+G9sXf5l2YEo@lists.infradead.org
X-Gm-Message-State: AOJu0YyiQvOH+c/q+A9n2kl43a81H44rNeUqD3E5sb4yJyxOwOjfmobX
	9sCSSJwL4xT+xZaqiGKhxmVq4qyO9khUd9m4wPMFJf6Ccl4qieZxTPm+n9iLw4XhuSKexT5SBDj
	a7Y7n67zVm70E614AElru4p4WYNpe7z1Z8oGYW4NxzHbj7gzw4bOR7H9BtoW8poJEfAylrzBBu6
	CzuQ==
X-Gm-Gg: AfdE7clOAczEDw4bYMo1rXe94iQYb02EyFOxWDoBAX8gFhXBjk99+4DY3mX1LdvepQ5
	lDKaYztnlKBcEE34eFF0JWK3ZA0sKJR1jJiUvPqZvoqhNvTG7ZYQh4vX+mDGyauHRhmjuwvU2TZ
	LccA0KWeKbyneh50aJ/QtSFpRDUBYhNpBcKWErELXRItyrF2q2wfdC5c4NFu+/egAvozwyfiqeN
	DUXq92luf85RvqJiMLOETa2OawZZWJtf5FiyhL3rpuU+T8NyCrpyoLON/nY7/1QJpffzoyjiy6E
	3327HNp78dPYc1HGycO3Lq3yhnjEkjG537h4zyU4ChrnXwu2s4Q151Gf2TSX0tx1RhDViERwoSZ
	TI69X0Z20f2xutJMPG4S2vB4Ybp/ZXj50X9fGkeJHu/mvFTszoUTwjrMY4N6vDKlWyYPFeKWHvg
	==
X-Received: by 2002:a17:902:cec1:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7fc7309b2mr19682075ad.24.1782384403459;
        Thu, 25 Jun 2026 03:46:43 -0700 (PDT)
X-Received: by 2002:a17:902:cec1:b0:2c0:c14c:bf38 with SMTP id d9443c01a7336-2c7fc7309b2mr19681765ad.24.1782384402956;
        Thu, 25 Jun 2026 03:46:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:54 +0800
Subject: [PATCH v19 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-4-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=fIhJzaso9N9Xd1IgveByjqgunx3Xh6KSxy4FjeYwCkc=;
 b=KxGEjMfdJvyIiidzq8F2ZIosQs0uCJGWkZa5FHiQaLch4Vk5w2VVPtL3MT5jND7sa+axVhvo/
 NXNHyXdi6zaBGQNmRG6wcWvxqdFOS8qRrrxEyaqfei1DNGJ1U1Xbtuk
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX8QcWaIzLxUYM
 O2cEWDYC68RBUwHcaoNUk5p9pbZ8PpOTIQKuDNjEMU91JK21yt5dHUByX6usbPSBDIORh6Tj267
 3BP1vRLAunwsj+A1I+7SSvFpHwsK4oCSabZIg3ypaJXSgPV0J8rQBXyloesBVEodJw7ZwziWik0
 DPJBsWeBqynUfgKMdXjBWLYl6KYvcMufsDqlL8OM8zdF+16O1yQ7sjocg59cJqLJ3W+dSQYy3tv
 h25Z1e4v/XiD6wSMqXo7+N1NVmnaxjdwVPSLS4jZzrA0Ter4O/YMXJQ9OdOQT6oy11rwRil2k/K
 GuU4PyJu0HC3YpmEKweEQHB7GNK771VfhjABrWDtSH2kRPQrIxz+GD4dpmROJzWS188qG47A6Tx
 Sh7hvRaiClc7n3GvkRG4eb8I+yPKeek8licKUCxL+spZwQpPSn9ze4bYPa6ZcOgQLaa499vU4nJ
 ObJpCRMZv1SsG88UZ+w==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3d0714 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: kKv4JrvxNpqQLYh7YcxCpfnUiyM7hVXT
X-Proofpoint-GUID: kKv4JrvxNpqQLYh7YcxCpfnUiyM7hVXT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX2TvHYmA/EY/t
 6JqXNUR2h2MKLut/WYdVkTQ7upEG3cGNjMhVeba28n29Hw3d1TzrvTLbIUT0bub9U8DMK4VAdkl
 M3HrhyNUKNU9F5uUDVYX38kf8nXGFYc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034644_797607_B98B139D 
X-CRM114-Status: GOOD (  17.45  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 9b3ef73e9cf2..2b26ce6455a7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


