Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE408CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CjaVJjBu7KFUWLsssWAqdg/1GILppArgSj3Gd6utzJg=; b=EbmTtIkxghtnjYDexptB/QbwV0
	MfUQoigpBmi/GqJ7e8DGvunLzYtyTH8iKHcopohB3dAwoxF9KTvwWD1C0dS5LdtECojBv3NmDAH8a
	R3J85puutqttZf2OJzhpdCW4czPjajxU2QNFZfuIQKsur+5RYNEsWV86xuwol0KsLoOT4z9AFo2A4
	rMhonIcrD5A4G33RcQ1yon5WtzKrG6Oly1Dn8S/rtasuB/rGhO4oRZouk83OPXQtXu5F8h96OSwnM
	a1pQ43jmf5eLVrlUA9QYR85MqhihGOOTFLNZSreQUz+ieYpZgBwX49/dW0yB45KPcumZIBiO6GX0a
	Pq/1YIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMZS-0000000CqCi-0FZ4;
	Mon, 11 May 2026 09:05:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMZP-0000000CqBj-1EQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:05:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8ME2p1352882
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CjaVJjBu7KFUWLsssWAqdg
	/1GILppArgSj3Gd6utzJg=; b=D/DkiYd7i3qPwsm1GhdsUGexLWW1x7RK1S/aQ1
	GkTb7KNlaL6R3/Zp5U6JXacWAryVHChB8gdHxtZdWaP3YQRseJj+5hgEW5ikdinw
	Y7izW3dV40oAEXKQUgu6Tkw36e2enBf6qQYBga268ZLKDny+aMGk4QvJqjrp4O3K
	dBd4wSpP7ym4aT/Ro1RXnZ9kENwvwFquev2g5zvXQ+Yzngb/VwL97fPzfPgp6ocL
	IFijFb866KzZ4AtrEdv9WO1fdiIrFz7MYV7WnD8mfufeRgBmKS+vcepF+2ulg8UA
	tQWx08PplBq0af3kQ13YTyvGUTnz4Rxern/MB+q3NIgn9wWw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h4g5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:04:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa366fb79so4342525b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778490297; x=1779095097; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjaVJjBu7KFUWLsssWAqdg/1GILppArgSj3Gd6utzJg=;
        b=BrbT7vlRotvFkbYBlZjtJDbiUi/OL2yNkxfTJNYoTFc2LvPQDpjfc6pJStpVj4Nw4p
         6RMpZAlNBUUIFJapU6tmsXx2F8u8Z62vaY9tcJFhUZimJHlRXl8xZ3MlAWO16W9W+M+Q
         1o5krrZ4qTmWcDZdlnXiLdjBoOfdUmZ8mjWTt+V3hleYGsR4GOdYW52GnVp4YGHfJa13
         CjlrIXDhNPH/pzxE03MBY0QtSNu2rsfRVkIgyKG1iCp/bnNhTmBfRiqbYRNHhe+XbwKK
         tO5mrFaVuta5CL4UBad/EJJ2wJ53laJiYX2kWKcZAFfGkuyB93JFZeQhT+EyRcUTplA3
         dbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490297; x=1779095097;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjaVJjBu7KFUWLsssWAqdg/1GILppArgSj3Gd6utzJg=;
        b=pr40kx6wfXzXlhCR2oR3xmJ0cXfofPL07DolDgokgJYobpV2bGOnKnLKae4r0hQVyC
         YEebZjDlCaPhp02cdrlhKy7E1mk06XoVmioN9duuCIelT1pUvzwkpSmtrO05qpXy6sWx
         p6t5oaoGyeMYzdk6lJZfsKwvew0sYecY1AcdDT1lb7O+hIa9do3SIy4EfH3bz8A+TPUz
         z3RGarM1Oah0Y532YpLLNYwum8rR4H5ogpQfinn95u5NZO/NMJtfGtdLv/jZtXAiSXzo
         Cp6iD+erkq3VcaYYx9JbQ6bHXdjBUsVCG+pUh3Ee9jIAWL/IgMkjS6saIhJjzMJXzhhH
         HoPA==
X-Forwarded-Encrypted: i=1; AFNElJ+2YMXXKyYB29IpRkm40miia23f2hPCrN1GtvzJ2e2Nw46kYSig0dDa/3VDjzgTM8qWvMr2rayDKN8u8B1VSiRQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxMqoVyNj/raQzjgJFxqoCLU1M3VXHTnzh5fbEf+N7rd3+hwjYd
	v5EXZiLSBalecd19au36OGNrJ8lwU9kCpU79hKC/EpylkepCmxD4NtgcY0bD7gxuVx86yTN22FH
	lM0ejnzTNcy3rmEiGV0FWjduFtcwfrlZxXhkfe30qG4dAsudEOQJsXycmgHwpuz5UC0MuH32Skw
	1Log==
X-Gm-Gg: Acq92OE1S3+9eqOdELOgHalVWMjX5yw10kuHiDTjBkK0D+awXrLYIS1A0NXwvBW50z0
	ebfkemG0XWH1LhC9J1+fqWl2XeNdWuO+vT5nZDcgbCyxQUi6ehcFd+qDDjzruBrhgzQMvXp8rvU
	G7svoKEtx6HwDjdXiiSeh4jVFcVJatAYvRYOr4Ywmgf1kSMLh22nd/Vko/dO7V7Nf1uyZArqwQP
	HN/VIiJlqdKEMnep1kGO3tnQ1Y5xuNLxcdrHDMi7kvdwpFHwsNNIMdL1D3/dDKuY6abEuBfslII
	GADcjP57SeFfRfNyLZQKYXqXzJffeJoGfMiaSrKZTuWddlYJafOxiUcc27vgCMJRyELOEB4iHn6
	suHu2iaT3uGgR2+EX2TxYEVuiZWdy+tdgY1f5nz0x3jQdQt0vnRj7GxnxB+dGM5IOaMhHaG9fMI
	F5blLWtcH3
X-Received: by 2002:a05:6a00:1891:b0:837:e9cc:d458 with SMTP id d2e1a72fcca58-83e39150f1amr8719928b3a.10.1778490297198;
        Mon, 11 May 2026 02:04:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:1891:b0:837:e9cc:d458 with SMTP id d2e1a72fcca58-83e39150f1amr8719883b3a.10.1778490296627;
        Mon, 11 May 2026 02:04:56 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682aba01sm19667198b3a.55.2026.05.11.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:04:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 11 May 2026 17:04:44 +0800
Subject: [PATCH] coresight: fix source not disabled on idr_alloc_u32
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKybAWoC/x2N0QqDMBAEf0XuuQcmoqC/Uvpg7EUPJJZsK0rw3
 z36OLCzUwiSVUBDVSjLrtAtGbhHRdMypllY38bka9/VrXMc9eBpywKdly/jRARLGsNqS+An3Lu
 2aaLvYh8C2c0nizn/xPN1XTcxDOmocgAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778490293; l=1687;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=s5CHPCOeaIw4uL7SeiGJembHNoKvcPqiUkoddyuNeIk=;
 b=a1ONIgl7O1deFEf05FCRd0MCnROVutvKZRhBz2/3uwA2jAOxPFKog96WOhHNr8qQRX/RJffkI
 cn6Tt9B2vPBAu4yA/HbBDC/p6pFfU4eq84dScJget/QKM2DxB0diWFa
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5OSBTYWx0ZWRfXy67bTa7ZZSJn
 L49duxF72gKjSCYhuMB+sufI48RBuoiToSFKUNpiuLEpCNfkDuYCB9QHucLgZws8/3zZN8DvAJm
 gt32Jz36/6Aki3vKdzsRkJnJ2jZBHSbqIfUJSK0zg5dQx9fYRJGvC6T6RxIRFxtsVL2XnTZHxYh
 u8o3s60bfwBy8FfaLXHMfadl0zboaT6B8vCFSVi00sJdK+hrkOp4MnLTTgFmLwDmKBRXTiPqIwz
 MOy5VruSHa7FoL5eYVVI4mxYiGAoqPtHMZSxf/Bf+AHKnda1BavgvjDLOTId2+c7XIecnKLFsCx
 JZR+hBfjFwvYYFbooLB+BvL56qdqZ/3cGaKxLuIFgQhzKiNT1Pgs12ent5JG0f9OymHvfFHFrX8
 N7ta9PUkM0K3/fuW/jjOHjoAnovMUt7Ax11ird7aQVkx3Ti6TZr6o5wsey3K2kaZm9eGPDBMuHL
 m8KLaDuPVB/R+bTgJrw==
X-Proofpoint-GUID: ESxqnUBQ-ky47rLU5XYqK_GTxASxmDan
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a019bba cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OBlOg_wwQlZU_9RpgcIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ESxqnUBQ-ky47rLU5XYqK_GTxASxmDan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_020459_550231_A1F9CEC7 
X-CRM114-Status: GOOD (  16.55  )
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

In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
OTHERS), the source device is enabled via coresight_enable_source_sysfs()
before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
original code jumped directly to err_source, which only calls
coresight_disable_path() and coresight_release_path(). The source device
was left enabled with an incremented refcnt but no path tracked for it,
leaving the device in an inconsistent state.

Disable the source before jumping to err_source so the enable and path
operations are fully unwound.

Fixes: 1f5149c7751c ("coresight: Move all sysfs code to sysfs file")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d2a6ed8bcc74..a5c08fab97a1 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -244,8 +244,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		 */
 		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
 		ret = idr_alloc_u32(&path_idr, path, &hash, hash, GFP_KERNEL);
-		if (ret)
+		if (ret) {
+			coresight_disable_source_sysfs(csdev, NULL);
 			goto err_source;
+		}
 		break;
 	default:
 		/* We can't be here */

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-fix-coresight-sysfs-enable-issue-91533f26f9bb

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


