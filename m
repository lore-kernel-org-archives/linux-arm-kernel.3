Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59CEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/IxQElVyrpA=; b=cHEH5KLy5+UeRMbFbDD2FmLXz4
	bOaSNrdOlvfBnk7Z7pFLvQ3EIT+F9Yqgn1v6PF0I/TgPKQqMKOflN5549StvHahA4k18X4+soF1m9
	v9tYpsT3YkfV1y7oFytRyVfGKuPP2VbADunG+MZQd/rbXTavOq3LSBFaO7lKtSYw2BjRoy/YSjkuR
	RiWPv+yjKtCPjb580IuigAudnu/Ylqfw5p8S0uS+w8RoSr6hZ8aZ/AQ+2OXAH1LXqpnBpZO3QGn/4
	7/1fUeaskogyTMd5NnWHZelxG2NmMAYZR5acylTLiaAD475oXR9DZolHOSVPmtCL4d4GttSYTSO5N
	FOun9twQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQVO-00000009Vgt-0Q37;
	Sun, 05 Jul 2026 17:19:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQVL-00000009VgK-1TdA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:19:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664MlhKY034841
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 17:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/Ix
	QElVyrpA=; b=FsF1uNPlNKe2nbAF01Up1oQcS/ab9Whfgoxar0UdSCoNJfdu4lx
	Gc6NtgVReudDo/81xyuNQyo1U7jtjeYT/p9ZoprLEWonlTyQiG8yWIJ0vmrkrG3C
	13TPtW1m9HchRK4f+q8dfXQovhI4ov2+YDNyU2jUIwaL6BjX+KdWPl4q3Ei0wYWq
	aE4u6FIakg/6gmxiNmwmZyv7jTRXm5M2rQYSxFeslnXby8ZooNCPZWqKsvjDDsIT
	0hmRqYQHRJG4SAqfsaa9H/vqr6rrWYDdALqR5YGGI1UwFNmd9+k9xTXti6867Ug/
	OAIF1fyE/Ufe4qYOkGDu5Vcl4UyfSqEXtlQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh35qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 17:19:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so229366185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783271981; x=1783876781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/IxQElVyrpA=;
        b=eojMPWO9bzUhl36IXsqGJYN6NFHaSDysEFtjwS5Jj+2f119FILBHeI8hVBR4kDlF6G
         w1yWhUb7rR0565162wJ0rso9HuSMUz+mWpBhf8iZeiMBIm+WKAKv7W/wp0Zhz3TON3Hj
         FVvyEIOvmytBSDYvwStA/4c8Ceyfuz/HioQ8VNoGdNrGM3WKkadfX/LMKrHDAcBzKg4I
         ehCesfvlGkrpXcBX4Q4UdMnbOvuGa/90BPhOpb+AsXN4itn+ofah4/ejy0YmP/9/bgzY
         imSPMSYVCDmsUGvVVrnZXHSDc+OG2u/P9DF3ULAL2C/OlH2Rlzaf+8hsB/wdAsPtau3q
         XYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783271981; x=1783876781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/IxQElVyrpA=;
        b=Ago0BMnCF2D5XRBnMm1Y/RlOpRVZmq7RICRwOPPaEAm6qHNaqjBDYz77OOAEn7BStH
         3Qaz8i8RAPn3lhdsF6rmKDzKz9i1SI29/q+ToQS1oUg2tTUZMGJfW8nyD6+Z93mKH1gk
         VtJWFkNCEKUgIxUgGkcWF5fKoOEozhx1cmWQ/GBle4piiZZntHh+F0s48SdBqgtbG6Xe
         IR2LElMalxpEh7V4YrCG0xQfr1bPksGa1othgzvu1FA9oki3BXWbM53mu5tNzMD/1Ig5
         xs2JY7KMJRGL7Twr9oJYeqMBlPjMhnQuWEAd0RQTarVqV8nZTirQAb4u7PBzQ7tMgg6q
         CjFQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3TgEJKF6Y9SzAs9/j++Zx4OMMIsQg41rkJ2LYjXtlyoZvcrS9bviB4qgqVUYnGHeVUXg7OgoBj+zjrvpWTxQ0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2h4+VfPMildfvS6Q7vcknYjXdXn+fpi8pzoUcamuAz+pHNREX
	gDR0KOLDyGJirGJX00mmWPAK1WZPmd9SC5vpeoNlKL6QquWa2kC927WKS/KKlBbCxHb+UelIXlk
	/ravVkY3xW0qWb4vatmDHNXCuQNXpqnkujDPRyyPTMMzqrPJHYdSL/y4Rjhc77Wk+LkFSz0SYx6
	vYag==
X-Gm-Gg: AfdE7cmhEe95u0iZvI0HlH3CdrzDALntfJAJwaGazsPC9yDgJrsDqW7++ppOJycz3tF
	4J/8Esb09jr50grIDA+eZyPXUdvmW48UXLoI/WGKT+wXm0mIvAbACRSHc5S1z29GtYOaPkBevhn
	q2Pf+2ZNMOXcAy91jzzQrS71/YjqQkVxYXUEBf/ZN9SdON3vz6c0gossXkdxKyGhTzo69LGx54/
	xh31RaTJTNk88EUpaBuonPDYjoLo/nXqGAT9uuXaXy5aQYG1NieIhQEdypktRSEiT6Y+6IgsHyc
	oqsb7VRV332M51zazD9T7w2BV9MM6cP+S3uLZtkM3oRz8SPQM3djygSZ4XVpeQStyCzUU89uo/S
	na/OF+TtOp87pup/sruLtT5g94WE=
X-Received: by 2002:a05:620a:4114:b0:92e:6dc0:7b13 with SMTP id af79cd13be357-92e9a4e1555mr943949785a.53.1783271980778;
        Sun, 05 Jul 2026 10:19:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:92e:6dc0:7b13 with SMTP id af79cd13be357-92e9a4e1555mr943947285a.53.1783271980258;
        Sun, 05 Jul 2026 10:19:40 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm16248830f8f.19.2026.07.05.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:19:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] coresight: tnoc: Constify amba_id table
Date: Sun,  5 Jul 2026 19:19:35 +0200
Message-ID: <20260705171934.116425-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0+JKaMSb4fFBzzxCsW4PYijyYt7NTbEfDLKTbd5qGQA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpIm379rn8FH27mwXA0fxCKO7Yk2SX76eObpb
 PEBv7UZBXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqSJgAKCRDBN2bmhouD
 153lEACSweR3K6hd9cey36pPxfWY6X3J6aNns3aNIndU9RUBA98z2Q0Bk/9iYlZFz1tYSpVFSpa
 SNzwujvK5gLMjCj3TwG9DKq1YPRVXA2QGWaIuibBH3pr878WcBESEhBqtQl138Pzf1rfUihTC6T
 nWcfyYZzh/m+G/H7vbgtOjTe5h3EA6NpbH0AE0QR81QmmY/LHM3OIDYryOkPeqCvDohuyRZq/J0
 Q1bzPDm3Pzyvw8ac/4+z4FxAEQH1UFGcM2MAvgUhKPEfWpMkjsmlrS3kAvrzbZoRs9au9XO9ZGM
 eJYNJjXrUsM/nKDCUuPQjvnn+ora3DuWJvOYwkLk56i+ATaQAHMKovc6itj5cEWvRyUpQYFIB/m
 j6UeXCWO9sDVEYPVOKyGqS7WqcOvwf+cIx+fQ5RBiDobx1nzXIx9qZwGitYBSH3UH2urRT4QLue
 Cij8rXaGSDMHrhux/LzUbExBjtRT48EL1WBfQmTRMj9+CQh1SWqlClWWn3DHYtV0Y7f/Nltxdc2
 OlOM5tCOEu3iT8dV2/iVkqjC8Hj1FwxJItUbhTOi0hf30n+bezq4wrBxojV84pHZJxncKeJyb4h
 N8D0KV2Jkt+ymTLYn8SyaIPzUyXToBv5AzpWfaSgk3/R0YCzqjQhVi0Lec+QeV1MN7rxHuwJ9NS Ui2iLGGluNvt5pA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4a922d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KWLFBBLysIe8JRsbPxcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfX4Dbf/2D3nHs0
 sXB79Fk2USCyHBhQfknis3MAgNvWDS8BbatZlTFxjvdGTT8+t4VAIvYDzymEbMwRmLKWZ8mz9TJ
 5T8RPElTkfWEZpHx5VZedDrro0Omui0G81d/gGA9l0NYoVwA1YnAyBDKrDjEzFz+ptvrEMExeKr
 BMmAeex79wP8s7jrvoTF4F4OK3Sv9/Hna6CMnBayIgXVXYEgenK0zLx7B+bDaJU/7tNesOUb2o7
 btzlqgFPFRY5dUyft1RnjKjo6wFSf8ankYDqnca8T31Wn7zufIu/mkQqPJUoozF9R9+XMz7T+0S
 7tBrhMlCInithhciGzW09v4ykR48MEGCX4ht1kMq5/tHI/qWJKMhtOuUSBrk0Xx5KVqOi6tq9Ot
 LFU1QCQLK7YaYMt3YY/uvaBUzfQMFnyi6CPLSC7h0zwDKR9AOYJiQ3o9210iF6vVQFFvz5Ii3hy
 NmJP9A39BckJ971BRDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NiBTYWx0ZWRfX8b2ofiznTL2w
 fLToOVVYnqq5JJoiFfpEu0bpqUYOFiUb97DY7ToMQ+k30T3dWkemyihjt8dKKN13GBBQWCymjgD
 yeU3f+zSk19vpKnBWdhSE4H2O1EbXLs=
X-Proofpoint-ORIG-GUID: fNjJpbEQ7EfaZFiR5gn_hAuSM6v3y8D8
X-Proofpoint-GUID: fNjJpbEQ7EfaZFiR5gn_hAuSM6v3y8D8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_101943_503321_A1A5176D 
X-CRM114-Status: GOOD (  14.45  )
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

Static 'struct amba_id' table is not modified so can be changed to const
for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..929d316b4b36 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -255,7 +255,7 @@ static void trace_noc_remove(struct amba_device *adev)
 	coresight_trace_id_put_system_id(drvdata->atid);
 }
 
-static struct amba_id trace_noc_ids[] = {
+static const struct amba_id trace_noc_ids[] = {
 	{
 		.id     = 0x000f0c00,
 		.mask   = 0x00ffff00,
-- 
2.53.0


