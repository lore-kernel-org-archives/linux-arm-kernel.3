Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42947C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=; b=14ipeKvXxWJ3NoIoz2PaleYnzi
	gXqck4FJlf4lAfqbl6yGCd5C4pEFX4xq0X2YILVWTiVIR6O+BXU4o+Y0weByKt6BQaRP+X6/l0nDC
	LZ8w2O0TqTZvzwVBuYy6W0QSwmI4gsezeq3oVKKl3AIMV5cVKwxEq+SZudWWC2AHS53I/tscR8YOu
	4sbtdO/PgTSMU1eNEd9zyvNQ1Upacp5rhT4iJlLCtYK14drp4ouAoogBb0ilZyVcOuHrY1bs09Oal
	LuiB7uKGI3TiHXzOZGqPDCLOC+ojRavxhGbgbS8oF+JVkUZEM6KSmNvyqzFndhrn0kdtucOC8nOJ1
	2Y5s8nZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiT-0000000FiQI-2Fh4;
	Wed, 02 Sep 2026 19:33:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiL-0000000FiLI-187p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr5eP2209789
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zozg2cEJHYL
	XQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=; b=DLFKLOo0q26OrbncUQUU88QZG2W
	y3M+K5gS1al2wODWXNVz4vP1N0nWAqJzrc7fzDguo+yXsSFRhi6aJmkT1y+AEWyw
	xypvzrLlGH05FLzvt1UvLZyMPXRWx0ulU6lUFw6aO2FrDgptM29iZMHmr7MJi0EY
	JB7BrzFvVvxsmUAd44/Wor8bCUECxMXot+QtC3u1MY5rfG7JvOSSGFyVUTIeVeT3
	Ki8+wfnvxqid5Iy3PGrxwfj+9FT2EYxyTGklHG7K/2hUYRk/ZpCSAxsJhSjNnzQ/
	4dzW+7dK4hHzwD/4w2WP0daoGEddQXApyIcZLqeJRwOoOZEleTlodfSkuqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s05h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:33:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso255976a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377619; x=1788982419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=NMReCdT13iinUC9QwEPmRRIdXMqyycfXarcLQ0hAMJRNbWP1Vt6bDIxQ3rcCY0dqmP
         SvGCesuubnUF92kwa35rsI1g8WnsrBNUBbRR4f662G7RAMJoZkhTsAy+EztE8agYMWRt
         HKMLmYxaftDLR80jbZKS8P7oDkJJm8XRlrq7KbWhjmSAQQZXxXAZHG/w/Itk/Kop5KyF
         xuYuVfSzGSqu/gSXUPH8ElPBClfyQFmhZjKaseAz5OufMPqCvXdCOMjzjV7vYp2mYoAK
         ToW1HXeynCUcHuVrUbFwUnm2PskjVjg/Qb73FsT8MVy7MCa7jn1K42GYnQwBTfLKqaxt
         nDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377619; x=1788982419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=gaX9MCvhehYoe7tQLw0wagTMR+xreI2duAaDFJ+QVLS8rwlV0lcSxzW960xOHJ8sPg
         +/PSnLANhoJ5Ar8UIUMSzfOTkjEwfjWELePgxe2RiNvVSSY0JTdQfn2GK2srdoJyn9+u
         KRV6kOSIRZJPVbgZIU2/mp+wqp3dZI7/JOWim9nQe59VIbIZPPJNck8w22OzM2J/lU7i
         bCq2bcfhSOsDlRlMcyIA4NkN1mAO3KKZT7v9s12ZMc42VxNOID9wXkicRUBX5GdA5c51
         gbOa6JoPb2tIgTvB40lqCW5b79rZ61STf/ZHrCQRGKPPClYw5VFoPls1jYQ8qUkp0W88
         C9Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzDgLDNb0PA+3WEXsMQXN8qKW1i2EfVWSqcmzScHRrGLSiibPZ1o+HBMUDZSKu7MPC95CM3SkczAg1BosErdaM3@lists.infradead.org
X-Gm-Message-State: AFuF++mrwWfAjOGGu4KMEWDGEklTPTUoUFjmTHqVaHUVDGr5XxXSkIZo
	yflswB4h3bG82JET2VPIMbRGxs7MmwHV1lGBMBTAWw1nYMdROgu2Nld4mf8MadmHzPturvhr0l0
	9anWpYRb+gY8AVOqcwm9bpgz01zFyCi+1SfyXlGctDBeZLJqAbVhEXeZFwHQPUHCd0gJfUy0mSh
	2gHg==
X-Gm-Gg: AYBFou3WsMh50ZVaCjD3cuflpgStaO/mce3ueBv9NEJ7foQhY2+C2eQpMB1abO7Z8tx
	+bZwqFoLtw/SHgKYtUQGA3URPBmUgJMSOLh7m/zACGN4eh1lAia/NqU9RSxZlDae9KgPcKFI5mG
	55k0OUAuDjGV2qbsKRgUBtKjBFF3Ak7sFHi/3fCpyey0RqVKdh7ih97UlO3ZlqYaE70d7xSwkdD
	PL+8MQbtg3UwrgzArSO6dAz1ZQ0rphJHXAvVXub2X4ckGU3J0GeYZ+FVeF1l0o+iIeBTwKi+7kg
	Y64I1cPdkmq5lpCx06I3TSEymIAj5rnjs0xPOM3mIu5rfNHv8PsC07VPJ8+pAmtctRgqO0quSAa
	f1YB8DhpZVi/1GDKtxqwd8F9PCM8=
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404425a91.30.1788377619328;
        Wed, 02 Sep 2026 12:33:39 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404366a91.30.1788377618602;
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/5] remoteproc: keystone: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:15 +0530
Message-ID: <20260902193318.1996827-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987a14 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eZD8004roD30yaJJyL0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: DiG9PwgzdXvIC-PgxbXMKZ6MTTxj4CgD
X-Proofpoint-ORIG-GUID: DiG9PwgzdXvIC-PgxbXMKZ6MTTxj4CgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX8TPl2uEs07c4
 nJ6Fz92mFQZLeiroeig18M28vg19Vg09lvhVQyOTHzTSVnWCpVz+BGdpZzyjTHLvSnyYUPyqnbz
 zTI7RLMmqQWfSgJY5gcUV0W46p+nL4O67rWWZjVBYhLH9g+YWtAa/sbfc0AQY0DY+zCZPN1RDdC
 /rcFM/CPBFFh/7y3rzDbZ5jx7ZOu6ulCXjGEKAfEVf1teSAxAzx97e1Z8yWtAnSIJfrAuF0u5UA
 gqxYDDx5zBC6sk1N0vaNObho0kSByayRWu3eWQ8lMcMqQebYUm2/d1VL8bXW7SqQ/6PA47J7d8a
 ewE4bdVz5bfCMptAqLXCJj2G54yJMt0NkT3+7C+Tdzedt+mjaqESxRED+9e77fV2knxBFol+LLy
 Z877B0S0jqUKbvs6DxRNRs5lxh+KjnEA02PnzeNVhv63DJGcOmBHlQyJpwnILnTlho7XrzEZv42
 lHUYyG8TPndEDRmQ6WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXwR5U1teqlub2
 4Y5RE5rckocrgXJRtBLQIluMHmp8R5NSfFSM5es5+FTXT4TnNTD0oAWrODMWCGIsS0vEnTTtN1g
 AT4g7606k1at76cOXYTWtbCuSkeu3Ug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123343_395802_305107CF 
X-CRM114-Status: GOOD (  18.05  )
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

Replace the hand-rolled keystone_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 407d6034f748..d390f56b4994 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -330,13 +330,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	return 0;
 }
 
-static void keystone_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static void keystone_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -426,14 +419,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "device does not have specific CMA pool\n");
-	} else {
-		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
-		if (ret)
-			return ret;
-	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
-- 
2.55.0


