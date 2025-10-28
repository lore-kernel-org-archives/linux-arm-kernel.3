Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAB7CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 02:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Va8zu6hMrrLXvLI0XHE958jJavnC6hBBXG7asoWjNaM=; b=oiqyt8TWEibWWc1oPVeZr59GsG
	81OuwBEPt9KoR2f+EMDRSGrdJ8tVGAoa1I9IZLLwTIcMcW4wzG3DHZ3qUHc6e+KkH/4ym8F1LbwJg
	dsSijdd12zzJhTeSuajEwXsVwTgqzMrx65YEe9loG59eS62l0YCcPvSf6GsRVvuwYy1ziIqWZy3gG
	Y6bZCC1ozeabpMSWkDcVv3VJUKCoo9BpSgygNdHoVVaTObZTbko7FxvxOtFtN4TtQsDMuQWwQTkFo
	AI9XARpkffXrrxlGJWLQeBiTLnkCN6oaTuEiAvAIOoz2vjhkcWtotu+XxmvJWDB4SKL3dokCrZudA
	Pwi2Ay2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ30-0000000F6GS-2Yer;
	Tue, 28 Oct 2025 02:02:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ2u-0000000F6EG-2dDw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 02:02:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RG3CIp3207235
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Va8zu6hMrrLXvLI0XHE958jJavnC6hBBXG7asoWjNaM=; b=EOUSOwS3tn//2yEP
	kLIQaKrO83DyzLqykfk/ZNg2LTTJ6XHIYARFugHeTC/HedfD4K4Tf3zQ6rltVKTr
	O/j3KwsOA3LqYBXME5v+zyaKtAaphVzVSyYufZq0ibCy9xmPAjBkUq3rU98C4mrX
	5OHFU8UtHa+YAGO68oNq4P2TDZy9Af/Vy4jzvXoI0FYPJVhjn7LTWjnoq/mFW8Rj
	/kUJqInquKAAL8fbwe8IhPSwCGYVO6bNLFboR/jxuXKChywfERKB93JGc0E+raeA
	RkjpLA2K+fCqyHkQXA4CS9j1GUcNSNNvBkjwDUvN6j6UMxGm195yOmVEhANmIOEo
	kAW8UA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwthd0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso63542745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 19:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761616967; x=1762221767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va8zu6hMrrLXvLI0XHE958jJavnC6hBBXG7asoWjNaM=;
        b=X0WItAAFsCq2f/AXXE9krRiZQpZHvy+oEXNLobPIS077bUj9pdR7WNuJhK7PvS6OZz
         yBvANoMDuCqDtB+NfP0FzU3DclSIqJp2Zmj/zvu2V4QmSGSzXBr5CwMB4U/Nkut7JMjT
         v2+KcPOcrXjjUXiiCmwmLf3D1c8BXCPP+n40VhgIeKCagpJ68RKzgZTBq8K9/eQQ0Hvq
         7wVLx3cDUfn3JS8OuR8M2R+js3C151003Gdi6xuHtqjGp6yQRWOytM+TIWqmX9fz/1l6
         ZlUxF1/Ke0HGUa1WJcww/aKfkzro2ag/FfHsiNkvZKT5Yl06bVBfiOJorTSIWusZR2Og
         R63g==
X-Forwarded-Encrypted: i=1; AJvYcCUiFxTXjKNh8un6VJbP+3sO4gM/uSHDCHPJsINitWpWCbMXk2Art+YtNUAylWZO+Ravc5a8e7i+OwYW1KxbWCtO@lists.infradead.org
X-Gm-Message-State: AOJu0YyqmOgvzNJg6IeIEpNcu5YF+pmDheCHLtt8Td2CVxKspo1WvKAE
	FZ3Hv3rTb5e0V+kkUbEsGpOCKGNEj/wJHhs2J+ZHyPQiP07n6twChySQjXTU4fOpbdjmbEJSjyl
	XQWWZjPL/1HN7GDokwxujubJwaHZYNdzZK4TyEnDSwI9aS7uUwJHovVRPNbEqfol+0cmveWtmVE
	i0ow==
X-Gm-Gg: ASbGncvC0w4EEX/pgLqoGEXFHefUMctsx75+t4bLvwudTuog7xMGFoMqU8PZ0nza0f1
	t6/7qR8bnlsZTyn5uDMhvt2pZWVva7BOdSmg0YvzNmEO+0MedGvi/vXNwQ+k4u/n+TFhlsKbgnw
	ZALLoZTImhyyqnIgwCgWv0o8Nm2GbE6g7Zm/NEcAKzuJOXdnFZ4uqWiZyQ4O4hnpgp+fcxZQ3Ub
	beTAGJzud33/1oSOu1MAniCQ0VI2JvhWbK4JRXUu0TFVZ6oFzUf0C1n3JG4xAJOVZMIr5996Dv0
	TjLSWpiZivKC9OyGgAcJW+ERpKSCQhYobtZKbFY0M0mBwG3eupP7WIwUpuaOCUIGBmDoKuQfcU/
	fOzec0kJqvWhVQi2khHqWu6Wewpccy8we5zFG5V3o10H44eT2UJUj4jeoGhjknsa1ow==
X-Received: by 2002:a17:903:2311:b0:25e:78db:4a0d with SMTP id d9443c01a7336-294cb52e55cmr22641915ad.36.1761616966553;
        Mon, 27 Oct 2025 19:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr/hPPl1psVSnjAW2Lr1uNM8tJffTyOs5FImuh36CnZYvweWmWbGcbW3fSoaAOQLKLUvHMRw==
X-Received: by 2002:a17:903:2311:b0:25e:78db:4a0d with SMTP id d9443c01a7336-294cb52e55cmr22641425ad.36.1761616966043;
        Mon, 27 Oct 2025 19:02:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2789bsm95861895ad.62.2025.10.27.19.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 19:02:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:02:16 +0800
Subject: [PATCH v4 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-configure_tpda_reg-v4-2-23000805d21d@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
In-Reply-To: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761616954; l=2127;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xMq1hphT88tb32w6fNQrV9hkQFyegvz+mX42/327QPs=;
 b=v6thXMIadp7v3974Nue9BRcN9ip4OkkCsEdc7yL0US0Rf8afWL4VCs//fGMH/9ZSfSuf+f2sf
 DKu4n2NxLKoCvisXnoL+FR6586rj22+vcSGFAf9TqvmxvT/CbTpivPX
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=L40QguT8 c=1 sm=1 tr=0 ts=69002447 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=6Dbyrv6SX_ztr3m6kfUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HfpH9IfIwbnEmyP04YMwpGxxGsfblU1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxNyBTYWx0ZWRfX0DCTkU5mQqrk
 b0X4NzVOvA8ceocUaeuNPnftPJm+DHDZUiMhYcJcBOnHCn1LioTmE/kaRhFhqCmxswjF4WEKH7V
 BeFtYu4seAe4CxrTBEx9MAY9Jy6YPUnlLdD80WJyaF0YO64Z7ub2BEW/nMGhh3SVneH/dFXONPS
 RkNZxMqiVMJfIGDHqGaLjzQTGyAmdqwDeQ4LUEJtVWXVE2zWlk7yxaJgOLSaSqvpBuSKI69XGnJ
 RN0DzPa8OcWgJVXbsB4hgMVaCOsaay345jze4O6yc6mfiw+Ogk0iuIRkwfyNtyYxNeL1j/9Luhs
 bLIMDf/kdZU0dGMvGS98TmHVgfyvGCGGxuLp7ztp1zpY6qK41fQgQorPpd9HHURQhpAzkpgzOQ4
 ylVD1C0S94fRi9JUeGTBiUu1CpQ5kQ==
X-Proofpoint-ORIG-GUID: HfpH9IfIwbnEmyP04YMwpGxxGsfblU1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_190248_826997_0E79923F 
X-CRM114-Status: GOOD (  14.47  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNCR register defines the frequency at which TPDA generates
ASYNC packets, enabling userspace tools to accurately parse each valid
packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
 drivers/hwtracing/coresight/coresight-tpda.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index a9a27bcc65a1..f079861da279 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -178,6 +178,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Program the counter value for TPDA_SYNCR */
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Clear the mode */
+	val &= ~TPDA_SYNCR_MODE_CTRL;
+	val |= TPDA_SYNCR_COUNTER_MASK;
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0be625fb52fd..0c9bf2fade56 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
@@ -27,6 +28,10 @@
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL		BIT(12)
+/* TPDA_SYNCR counter mask */
+#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
 
 #define TPDA_MAX_INPORTS	32
 

-- 
2.34.1


