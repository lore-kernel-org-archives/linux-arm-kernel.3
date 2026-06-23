Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D98DCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaQcQVT5n9LHLCVP7PYj+va6pm+vVtEUtpzmlxdT3Kk=; b=eHZSMjJd8SIODMYNklVLHdbuFP
	nV5OJPLu2d/fka8PJKDSL4FeQ6DecvwdYDY11UqCuNhHTgjmcWjC1JDa6pXdVnR89CdkKmaLq6BdO
	72NdyJ9JnW7AmVa5bHMi2x/XnDwQURwge4Q4ZHS0naoJTr0m1zys2gt4unaUVgkAnGdkd0OqIfp/O
	HgNC/ioOXAywzPf1t9rHyjwcC1BBAve10udX0+QwJ2d3Y7tMIVYq/BBJYtKWt9ZjHSZr6SiUh1YU8
	MRzeDgnGosWLNTtgyF4kq0tOU543RvGqdzAypRIr5yrmtJG6mhy4ZtNzvL6EaJL63th5iFcJoUQRC
	tQkym4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc081-00000006Fgj-1ABD;
	Tue, 23 Jun 2026 12:21:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07u-00000006FdK-3Bji
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXami2308476
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GaQcQVT5n9L
	HLCVP7PYj+va6pm+vVtEUtpzmlxdT3Kk=; b=Gg212elX8YWQpGYnRY7LnqyzNqV
	8rdTz6d3EdWibWgx7AmJQtRmFGrfcg2+2JnNVbOuq8pdoZ5gPVvRQ/oRt0dmSc//
	x6hb/ct9e9bTnEjzzO9x0UU/YKB8qO8x9ZzE/MXA93jpLHkesWlVNA9Vw3Etyr0j
	tI0WvJwM+S4oVy8XFU/YU7wqUPQKa8Pz/ldmTUgNXUYSJ7Mr1fF+r8gsSnX4l2Ei
	p2KjzibpsEh7MzOeAwXmd1RteQFP7kFMp5qDsn3wukO8m7NUIVxkdMmOB6Qlq2bZ
	ycEpUHPj9/kBcs/1D3P7R6IREjxjSfnUielRKmkxeEYkluzKvf4teiacKpg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gs2xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c896349fe5cso7568339a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217273; x=1782822073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaQcQVT5n9LHLCVP7PYj+va6pm+vVtEUtpzmlxdT3Kk=;
        b=KL0pWWsqlbTfNZ9gMspY/XCR5eTkqDsObzb7FzZPCQMcTgvF284owWkL44tPXqFAIV
         25tzBUJj/Napg3RwLIV1S29nVZN28hatH5BjqhI3Q7ravHDFdyhnGDiDd/2fxrLHDQAV
         IqlY9KEcWZh3+KrP7wgW2ncjdFooJH3F7cwKhXecHlPxF0YquxIxCG4zUSuTSJMRR7GO
         nymb8ZkQM2NMbqlMGH8F0Tw7yK2ezeqVmYGo9Z563yY/6fzmYq+gHCuWKurt5tkhRTOZ
         uqMsakm30E68ak8Rsw7RxwEQDURFsgnBMN4uJwlNAEaOhURQX/5ooAtDenX+u+0xwU1u
         YeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217273; x=1782822073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GaQcQVT5n9LHLCVP7PYj+va6pm+vVtEUtpzmlxdT3Kk=;
        b=k13K8zRN/q+qa6s+JJQAdNH6XsIy1GCnSJcq1VHMLzbEUtmO0OV3kEE7boAXSWg9xk
         jglJg5DZ8BBJmZaY3zEqoTTp8HLJ8Ot+xE5EYkDRaTS+orsoy+ogHPCjU39UYaLIWCLx
         JSUKky3OjqBZxqWvDjgiLjAxUUaR4V673xll1rhFc5/dYOUZIywxZH0E9UzAAKp2ZhO/
         Y0k0JOY8uscOICZhJanM+j7EoOnuDAX8lozIZDRxBhR0NPMlUEyoUacz/u4DXpRK4UET
         zVLVBJgUPycRXlEjcJjotHkYkQf2L+DQXYBXM4QdzbaGaqX0zJj68Kq9LtmRD4BjH0Bj
         47JQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yy3km3Qk24z6zSLWC6TZ30OptUPbaTD6m/XhB1UN8PQtY15HbS1wqgMQoNjdwN2IOfy7QU94RgCCVvwkKGqs5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3xa/Nm0SKdxIx4eaY6slQkNDqhncxl3rxQeoen1+zFgGiZRc+
	85zOtkjBmZOtPhhU2ZR9v0XM6zLZYZIgA9MG8QYkzZxH/3xTVb6tcoXWexP/tmeSNGQVA2pn9qE
	yuRQXQURJxYSCyMoDfJCclYVkBjJ3vBUiMAV24amVtTMwczCzW08vU9xOiucYxqd7pqydfxOGHC
	m+CA==
X-Gm-Gg: AfdE7ckpRZtMgoE1siGjBb6kSO2Aoavb6krpOER9CXJ5aeQw+ftsOwMsB1+IOeyUO6S
	Tn8c2+RgCsV/tb3yjdZ39aJaa8k6ca3xukldCLJWfvOLOMGGD0kNZYELRb8K96B6m94xk4yJUQs
	sK47uyivChnHXZJ8uNsr1X3hhrYWWSdXG4BmgSeqL3vTGFng2z+zkJVRSaJj4Yb+RMtYgpwu7H7
	PqR76y0i7g0Zil14PgMzM5DgmXNwSsXL0EVuncvSONQ5gliyqml1FTCOMsg4o/gNih/QnA/yqcZ
	0sHjt1vgo8M8z8Ue6Qfp52GGirRnvpXWrGJZQxCTaolMLVA+sBapJOHblbp0k/ZoAQBo2kKzuUS
	XdROnOclzfJMhlF46Q/qrXOZq2JMlFyKi6/pLIg==
X-Received: by 2002:a05:6a21:6e97:b0:3bb:1629:17c1 with SMTP id adf61e73a8af0-3bd151a94bbmr3396899637.35.1782217273369;
        Tue, 23 Jun 2026 05:21:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e97:b0:3bb:1629:17c1 with SMTP id adf61e73a8af0-3bd151a94bbmr3396862637.35.1782217272829;
        Tue, 23 Jun 2026 05:21:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/8] iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
Date: Tue, 23 Jun 2026 17:50:30 +0530
Message-ID: <20260623122034.1166295-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R9n2F7dECicPffj3TWgbPHgtMHGuZENw
X-Proofpoint-GUID: R9n2F7dECicPffj3TWgbPHgtMHGuZENw
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a7a3a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pv9nQ82OMFi3fEhVMZYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX8uRRLBjfueA4
 O2fikNGBkzklIKvFEP44R2O/kpjagOUh9fQBmCN+42hzZkiv/mheKgh0RZ2kPHPUW8JL2s4yker
 Ykc+6SI/1Fruo1YrAhAin2JMRA1fLTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX6ZqI/25HV1uU
 /aiEFwIwldk4z1UN8NT5/x1YufVg9s+mTu33aEsaqSUkf+OKqlVVvCgfokc0bNy6YxuHOL6YlZG
 hgYuBilbH5wljbJWCnG2whX+3Zo8Xo+FB/NmOCp0jh0EpN+61EMll+lvuKbnNtA6HmtTwj5HbDC
 PRW7DtuqCfEN2H/xrUPHVvqW+qYWFRnlTpORZeB76t7F5SV51XcZjYnmwLc2H2Hdh0mnIzZGlFq
 VyK6ueYEjwbnRrHLfBPO47dmqBvVRW4DeoMaUO9GRa5JjHGkYu9ZmoEZm6iyDFRTIf5J2qfxpCI
 Ct7gtb+ReyQTUsfuz3ACTWiye9S7f7XDr7YVoCBqfKxeV7D8ROfwP569E9tyB+4Xuqayr1aH0Ry
 rQhs6FHJxV3YzDhx/VvZnV8YIPOfwepqHKbyZWwzEZep6C3KW2+4kmcoXTFl3SfWeWdwPim5Tc0
 H1iveE4lPwSo6QTKizQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052114_804690_C9C8DC23 
X-CRM114-Status: GOOD (  13.46  )
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

alloc_io_pgtable_ops() can succeed and then qcom_scm_restore_sec_cfg()
can fail for one of the context banks. The goto out_clear_iommu path
only cleared qcom_domain->iommu; the locally allocated pgtbl_ops was
never freed, leaking it permanently since qcom_domain->pgtbl_ops is only
assigned on the success path.

free_io_pgtable_ops() safely handles a NULL argument (covers the case
where alloc_io_pgtable_ops() itself failed), so add it unconditionally in
the out_clear_iommu handler.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 4e714a8e1fac..b6ce85f7f923 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -314,6 +314,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	return 0;
 
 out_clear_iommu:
+	free_io_pgtable_ops(pgtbl_ops);
 	qcom_domain->iommu = NULL;
 out_unlock:
 	mutex_unlock(&qcom_domain->init_mutex);
-- 
2.53.0


