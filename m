Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A4DCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 05:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RvST/I7tIUlGh9vWEp+EZm+Dpv+zO8gesAQ4YHqr+Kg=; b=WLilQtTXTF2ags8WoyzQeN6i2J
	IxBeVeR4spuUr5+GSQt3Z/F7QLHRPzN5meVx1n9XFVT+VRs5ZzXuEkh+zQL+e7zvEQN7ExiBmlp60
	TULUfAhE1kJTIaZfcd1JKEDLQNbe/+AII6uYY7mFvybTR/OJ1PGzMEIYcidr6x+Mtlq6Xhuo2ozMz
	iXoAq08/6+NP4xfP34ui8x0UVitQKYfIVYx08ufGS4qF+hAIVUlB4rdsNEt8xDogEvLhNnGfz1/Vr
	QudqRf7MuiyOaN6O3OuEv2vHqfMOPGWyL04k1ZRZwIihOrhXsPIxS5/D+Ov2/tTi0yBxOWo7SDhNU
	tGQnyftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE2c-00000005fJq-1Ewx;
	Fri, 08 May 2026 05:46:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE2a-00000005fJg-39PP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 05:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=RvST/I7tIUlGh9vWEp+EZm+Dpv+zO8gesAQ4YHqr+Kg=; b=MSGVGGyR93W1g5MS/lMHufPSZr
	HkcHJI6HR+ZJbYaLSYvkVUOH/WXU2MgUedgvet2i7tta5IloVlTXJ6eyNXk1jpdSDpRcoxl5wSczk
	hbmqBvVqUP1etBFUME39XWP76GnC8jxSQED/6LQiH5Axas/dW66k/n+SDxvt0bINK4fbNc67ftYJa
	FPbDytJLqr9bMLLgBPk3jJESskURkO2ZySjV1WA65eq6hodZnYtYcTad3tLP5GEUDsveUDHBBV3ZR
	Kj/QHkX4J7ZvY08nDY9NMO1pr0EjV6kxGKLk+ejRV9kGuCnCuD0zXSshcoIx3AUXwYczgwe0n7AyT
	aaXjyzQw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLE2F-00000005IPL-04Xy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 05:46:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6483F8ZO2734318
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 05:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RvST/I7tIUlGh9vWEp+EZm
	+Dpv+zO8gesAQ4YHqr+Kg=; b=jyE2222EXWlRJbH/emPHEZoVrhOal3NX/f0xtj
	xoR1+gNbE9HYiAiVjGi8SG+v+pBNFkpmRceSVdUNVx7kcs44d+d6Rf6s5l8MrB3y
	1FeMWTdxZzF2KR7CZRGreOUhX2Yxmp9u+MAcZzSVFo9tCHADgIWdCA3sjnb/beH5
	GP54Sml2hW9n8tfqQTHeIIX8OmvWs2zbNUs2vz5zRzgp/8eupKb3r2URq/lW55mh
	ryxChBP0wC6scBeT7bLAowDomIHNZv4gKJGIwXAGI48KvGHAltJuHARJGzkemx9L
	XZUQpOBJE5cfk4HVpOUVPNM1yz7i26mL65OzIOC9385RfFyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqujk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:45:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so1623902b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 22:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778219158; x=1778823958; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvST/I7tIUlGh9vWEp+EZm+Dpv+zO8gesAQ4YHqr+Kg=;
        b=Zl8HWypG8Lqvmws6hb8dqVZz1yYidfDfDznW6YC3Xpy9JhtEF2dRUITtMFXVJfw72U
         sTeKTDRGlw4eCnbiqAv1Aumdd4CztDMVhn3sioBHO9idxc2kPElkSIUOEMwRC3aPqjEW
         jZ7SVWz2xuOE2+ipwAQq7GCKAe7Vw4H5sy8/VxGmLEiSYx4szavK9ct7XprJI2RLJcpi
         rrrjo3Etxr9LPfkdEHYcYXtIjz9C+U1X3vLmjxvAwqZ31UKWYuZyVScaVJKeZ4O/uLaP
         o5skEA4twvO3UiXftHgHJ7x3Rgc/NKIOB2r7tZ3074wwoTctVxtGzRBIqHLr/TV+4UNB
         c06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778219158; x=1778823958;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvST/I7tIUlGh9vWEp+EZm+Dpv+zO8gesAQ4YHqr+Kg=;
        b=aBh0vFIp55l7E2zL0yDJN5k6PzuDoF1f7bZj4Htjn0TqoeTnc75x5h2pXKJjqhbQ/s
         INPmM4/9CE+rSgDBvdQ7+0EMsEmHnIMyGulH+UCyjI4vRgOkbHuPgpJR3i2MeGiBvZS/
         JF9dg+31ak9P7zkIyueAvrXqDRxFB84XMSxWKy3PkSFsxReRiOGp6U4sKv9baCJaO/hx
         mM6HjDfkcsARkWcpSTl7FO1+Wez2SN90Ml3mEIdTm2tEoaofrHBaC7gJrOX3ubCZGjBo
         kDQPXuR+uElm3iHMLysoRx9YnpjAwxdrvZ0hf0F0bO6pIYErCxcbVUjrWYINfjpjsT6H
         ZWcw==
X-Forwarded-Encrypted: i=1; AFNElJ/Q5Fvk+hmSxuQwWlZ6zcqWyvCPJUPYXjehjVEJxx6cgZsoPjpWHS49nHKSdixpbhr6/nX9l3vLG4mb98gc74o4@lists.infradead.org
X-Gm-Message-State: AOJu0YxnD+uU3YfpzJTo2RyESyM9jy6GqjjXnnIkRLfhmk7+zNaapOke
	2VY909Vte8KqXZeab4K/cNq6UssBah8F6O0J8DPNn9689jHUXAwRyhGBjPZdBbULcLson/Aq35n
	GLXiUaXo5WU6znQWMXT3W5b6AQiUIB8+TPun5jLSsMivKd11D8tEpU9DCM9eaAPMsQnxjeDEZxR
	Bn4w==
X-Gm-Gg: AeBDievzY91UQ/tl2EO5H+pVZ/aRwGLev4gDbrX7iX+aIr+HagOVyJr0yAUdjh8paGD
	dJjfEa4H0LeYD3QYgmdpEHA32qqsog1BnhkvgGBXIgDE1w/E5GLhnCZb2Ayfy4axfG9AGTuskQx
	1twLXWvBwSu+MXQYXtqgcBamWQpfQ7uWf9lmSlIoDeGdm9lOmOwqTIU5hMNO5FBU4sNcO9Di7JH
	+bhOJ+kZmOFKnQejZTOknBb533yCIpcQhxfv3bHxbKX2Xu8blzaFjjJ0RJAFvaoWhttP1SI4SUI
	Z84jzkHnVvm2sLqqFws1N/zWa5rNWibGmD/apF/gVHAJILFBE6JkJ7k6mEjwVZTjDJPKSQDAUqj
	196gMVNqFkhe1T9RHpWaQ+miiVTUC04Zxak5OHYE5M0U2z1Gh20ab8dvLEmEwd/qW42auj5PG/Z
	kj5F78xYY2zEBUW+tH0E8=
X-Received: by 2002:a05:6a00:1d8c:b0:834:ea1a:4b25 with SMTP id d2e1a72fcca58-83a5c0c170bmr11144136b3a.12.1778219157434;
        Thu, 07 May 2026 22:45:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8c:b0:834:ea1a:4b25 with SMTP id d2e1a72fcca58-83a5c0c170bmr11144110b3a.12.1778219156929;
        Thu, 07 May 2026 22:45:56 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm14235835b3a.16.2026.05.07.22.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:45:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 08 May 2026 13:45:35 +0800
Subject: [PATCH] coresight: fix missing error code when trace ID is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIB4/WkC/x2MQQqAMAwEv1JyNlCLivgV8VBNqrlUSUUE6d+tH
 oednQcSq3CCwTygfEmSPRaoKwPL5uPKKFQYnHWdbW2PQW481S/fgKy6K9IciBrqg6MayvFQLtY
 fHaecXwLkFBNkAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778219153; l=2312;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tUI+fbM9hZlLRW7XpYtSlSf8sGpkz4jhK/VKV3GOiO0=;
 b=vGjBAQ65b3wspSpaDxehkEDdbhSfgSShlYJk4UBDymHu9TjiwSq3gX/wqx4Tn3QwssV0pIEwD
 /lSca0bKjD1Al8KmgFd7TMc9TJS/7gR/7aFs/yq67QUyQaJhUGxsse+
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: -otRkUV9yddqSkMBapuuGNOE9M8ZKVT1
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fd7896 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=f2pQIliOnLl42a33m6AA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -otRkUV9yddqSkMBapuuGNOE9M8ZKVT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MyBTYWx0ZWRfX/KxehjYiGPSZ
 W2g8FkE5idVWEuErRKkopzG70iEXfgKqmlofFAlwDYfPe/ghbu/gWPgRH0pNOGOP2jVWn4RdX7D
 qM/GjP6zs9liKyba/3crJQqx/9eoiMr2BUwLz1orgJHoATGs3cKwGzjbSeEMb6c+G1RY85i7BnR
 a3uGXPJI4kILwcOohnCnx7rXuwTyhgtnjEqGWEBrom9VI0W7AnWSiP6UN0mbVIylTsa5FsEaVch
 734GiH7qkKfySeln+0nuK2lW7LhZsNkzCcNeSkYacx5jrTfALr97H2JG/OAPQtfkIO7mTWr0Lcm
 MbWMzK7uKcjVvku9FGlRiutJpj6nx6wXwuRQgdD5nJUfczCWNjsM9EOah5xMIVplmeJTUu71rbi
 POtXbk7014ZCA4M1U9khaWLtqwYCQfM8A03TAgmKNW/yhvcnVSkJ3P6Jyn9rQpUDuSMZA6FbttJ
 km865v7VTXRrt0Fqmyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_064612_795515_3EED3DBB 
X-CRM114-Status: GOOD (  18.02  )
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

When coresight_path_assign_trace_id() fails to allocate a valid trace
ID, the code jumps to err_path without setting ret to an error value.
This causes coresight_enable_sysfs() to return 0 (success) to the
caller even though no trace session was started.

Set ret = -EINVAL before the goto so that callers receive a proper
error code.

Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d2a6ed8bcc74..c9338c783540 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -195,42 +195,44 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		 */
 		if (subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
 			csdev->refcnt++;
 		goto out;
 	}
 
 	sink = coresight_find_activated_sysfs_sink(csdev);
 	if (!sink) {
 		ret = -EINVAL;
 		goto out;
 	}
 
 	path = coresight_build_path(csdev, sink);
 	if (IS_ERR(path)) {
 		pr_err("building path(s) failed\n");
 		ret = PTR_ERR(path);
 		goto out;
 	}
 
 	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
-	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
+	if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
+		ret = -EINVAL;
 		goto err_path;
+	}
 
 	ret = coresight_enable_path(path, CS_MODE_SYSFS);
 	if (ret)
 		goto err_path;
 
 	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, path);
 	if (ret)
 		goto err_source;
 
 	switch (subtype) {
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
 		/*
 		 * When working from sysFS it is important to keep track
 		 * of the paths that were created so that they can be
 		 * undone in 'coresight_disable()'.  Since there can only
 		 * be a single session per tracer (when working from sysFS)
 		 * a per-cpu variable will do just fine.
 		 */
 		cpu = source_ops(csdev)->cpu_id(csdev);
 		per_cpu(tracer_path, cpu) = path;

---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


