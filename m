Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253DCE98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=; b=JhTZ4ejOOM1QRmHS3uCbfgmEy0
	CIWjgRTQpFdssYp7R9LEIHXLGqGZduitf7b8fgQWRfb6gDIZyEJEtnYwW8/w9jzxNnW+wwmYmkKQr
	VNIcCdnkEkDaxW2r7qRYkYgA5ignCwZh37Tsf/QfYm+EQ14IyfqZs39Vm3VQ6xHrA09Dyib6Iy0wM
	BtNoV3EjpaIpq6OSmk498PySp4fDs5ewmOSMpbtK5gW2IbVseglGJnMM/56gtfFCjTermPyfZf+KC
	etR73b4WXXDlhv+57J9ANW8ZGhwvUDO+L9+bzU9pLGtgxgidRnC/R12lSg/JuIrL8zCwliTj/0xwm
	RaIXXP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPrn-0000000HKSm-2Oub;
	Mon, 23 Feb 2026 06:56:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPrl-0000000HKRt-3vev
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N00DUV3424203
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=; b=kuS4Z3VDVKCT4T9+
	nswne+i8IhKxmzOfGol0A9lEqecjh/H1sZ2WJsquferkgFOAMoX5Ca6ys0Mpt63l
	r15Je5qvEl7DsU52E1FYxj/+exWPfYAy57vHCI/fgJdfMFizFOxOrOlaMnuNfSJm
	yxYkwnlDPSMY0DgV9Is0x+5BLhUJN1pQ5AVv5+NJ8PL4xkey/4dZkXo/00G18/6x
	PN5V4cn60hzOndj6NHNsSKOLf0x5i4w451RVq3F2z36cLxic11NAt5mBtNDWU3eB
	ltJ40Vo/cj4jHIzt66Skef+1PWsaJzTBECTh0k8u0bWvDyjt++aNGOYvKL5fF4jI
	PS8hbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk3nw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad60525deso313186465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829785; x=1772434585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=;
        b=DjuNKzzX1Pzrj/7kZHq+vxmEYhfScTrCDDCRxlLpGf3ANAO8Bfr0+gRmKAAsyNuy8r
         DKkLGVJndLYp/BvttE2JBR6g+aHQYFu31zfaBZzmH0KTScRriWWpT2S9JV6CPe+9UKX0
         B0ygdD+dtXzgMRLrF13JzGixPc8iR5IzLrxQlh2rDvZozvUPCKyMXsRI2oZHUHQ3UYDK
         5KzFzeKZ48fOjr58Ipf1sN0ENnoDfIJl1TZXM8AxX45mWpcqI3Z5j0OkXH3TWcKdHSYo
         B3mOQjNOub0HbOiHegwlM6D4/46zezCx6od1qCdKXePkPT/9cWQGOVwR4Ht1YiJg49wP
         sDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829785; x=1772434585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=;
        b=JBKoWaJqdnxqoEouscI7YYEamS8fHHIVqNyysQO6tRKcyCh17PKDzoE09Xb2pGAD3C
         qDb77A9rBh/dnNOBjy9iytMBwZ9usFM2F6R/fzEohp1bpil5OZ8c3eHqH8rznxFZuwqq
         aWnc74zsWVhBWEDCRNHOSKYUmvHfl/9NKBkd5IgB3GSas059Z20IXOGpuZunsupVcuOe
         rxVOlWteKghVGSpA+qUEiXFmVy9JckkNi8CJcwetMhjiaH0gID5INiw7Q+aJBV31VFqo
         mAFfoyTDSuDkIdknlSgfw2HoYGkjw5XZ0vrepsDx6uZMSrlEM4k49fgB5B6l3QvbPVzF
         BnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX86bmwitPmmQ42uFLc5jA/VILyYeeX//l7IhN8KbF9Keb2gf3zjfk09yZw+Q/nc9fJDeSaE1bpH4coND0mashU@lists.infradead.org
X-Gm-Message-State: AOJu0YxCu8UDgx46P69OWRjj7z407Fv5q8fj36T3FbnEeNtrdLO1iSn9
	Oro0ygrTL8hVXZRZ5grL5kOiH4Ki7PLh1AKeq+SC7dzO+NKGJ9uvMU2O/7WSYhfnGU1ePsvPwsD
	Hg97M+YlfG1UVKylqKNNGfZklBCtPtfZMB3PygUZFsga252Z5z7S9Z17WqlPQbH0V1BzOLo7gwr
	Fclg==
X-Gm-Gg: ATEYQzyTy6sWnOPtKtDu0BCpR0Hfbd9jUU0EkDHNEkZPgWkxaNp/WG2WqfkwSbgubzb
	1exV3jjgUhbrDelP4YlikJoUfyxKrn1ryACaq8NQHNSV2mZqoc17UiCUXA5wh+3TaRRTCBSo7lh
	QCKo5N6LXEi1S2tJHyY4rJh6Jue6ADNR2Qre0050PAXGSPP55roRYf0DCAXhRYEoITB9v0QLAMW
	FvZdpDYQlIbriyK0Y0XNKPAdbRtPic5qHzPFVCsQhkzOCK/R4kivd0nq4xbsPGxVq4IJks9f7OU
	vU5WXhNZqLLip17hMG1J60fiEf/jVT3uNxOGIm/KDXsYUKD/p/XW0D9lUTvQbLenlwqxkGena1P
	nG/jbX5ct9zQkngSYTxWtpUWJMuv9nrtepLxZWp3mhvSvNuCbyI7U40LddV6xLpifAD4sVUNwRh
	fD5ZRpqF8zeDZt
X-Received: by 2002:a17:902:f68a:b0:2a9:2942:e15d with SMTP id d9443c01a7336-2ad743e2f1fmr71818495ad.5.1771829784706;
        Sun, 22 Feb 2026 22:56:24 -0800 (PST)
X-Received: by 2002:a17:902:f68a:b0:2a9:2942:e15d with SMTP id d9443c01a7336-2ad743e2f1fmr71818215ad.5.1771829784230;
        Sun, 22 Feb 2026 22:56:24 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:42 +0800
Subject: [PATCH v13 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-2-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=6164;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=fR8lvHhL4oSY/n5eSl541nai+feNwPd8lhB8kmyGxEU=;
 b=TAasXX83LQMCDwpga9xn06zrx2OoGZ2NngshkxWMFt8//DaX67J1pXx4PXUmtHwqDy374Amms
 e1JXTevSTNOAkkHxIt4ga6716mNRdc4HbZbCMQgS2pUGjPECOovKf4N
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699bfa19 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pN8Znu5onTEf3dnVCfUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX9EGD2JU/q7CN
 6O4xUw6esOuydhrWkYxk8cA6n2oTw7R/q2nGqZOiKFOILuIcRFhQymsVWrUn/8YsFuWhWysVZ4A
 nhcHDFn0hlXi2UiBCmv5FA9n3aAToqJgJDqD1JSWmKL2DMLZ0ZOdIshdPQOKUwEWJvr3VGsO8Ux
 0QUvPzp0JSa1OUKYlSnyqRACmq42QGtIHJCJW7u0IJjZ6iXHfrYCDSppPFU6LiTC6p9V3/Pa5KD
 moGsshfnA/8rD+6dqH20h89IajIX3fpUOW3DP+FoXJGDbyP//yCNv7fF3B2RFWvs4lPeA3ADRVm
 NdJQ6i+Jb6SRJAV1FPHxIbDiwzXpmnuYTbVsgz4077Osm1tVEuhjBinsdhm9LW05MUpIBUVEH3z
 59B+6AKGbHTOfTKdUfdUFz8VlYZ6J4fzl42eM55ATQBhMD33ZjKc7ARqR0TWm+LflNwck7TDpG3
 9wExP+qcS4JNgJ+WN3w==
X-Proofpoint-ORIG-GUID: -y3_GwIoUhcO7A_NbskQIizyq8W83cIF
X-Proofpoint-GUID: -y3_GwIoUhcO7A_NbskQIizyq8W83cIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225625_998996_1A2ADCF6 
X-CRM114-Status: GOOD (  26.76  )
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

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 19 +++++
 3 files changed, 114 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..1ea255ffa67c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -840,6 +840,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index cee82e52c4ea..081498162011 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1920,6 +1920,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove the allocated node from the list and free the extra buffer.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
+				drvdata->sysfs_buf = NULL;
+				tmc_free_etr_buf(nd->sysfs_buf);
+				nd->sysfs_buf = NULL;
+			}
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node)) {
+			ret = PTR_ERR(new_node);
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..57d8394d09b7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +290,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
@@ -447,5 +464,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


