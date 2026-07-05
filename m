Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA30C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/IxQElVyrpA=; b=0G6LwMKZQLq6BuU/A0Po5S1Tl8
	1hG6cbiCo4L7mKr0xJwd2qYnkPbzAhym7G1d0wBIpzd1v9y8oFsQglC9rapbvLYGqs69rlVN1NVrr
	epavczwDDjoYRWhShADsFGOOLenBwFlfWa7TeXBsmaV7mk8YDn5b5ptgw+Hj+0TjqxwxhoffISXc/
	h1EBGIAiwRWTneJ9FdTF8w2/dXmMtkFm+L2j9ZGn+sQNiQ2b5bRGZpR1iRQyY5EvnyN9rb06uCfx6
	6O9i7lOE1WEefZ1scUBcTrjxKnQI4iwRbWrZbphIFgSPO8GOtDgB3E9kIsJaYh9UgseWdeOzapXT0
	/yE0QF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQZz-00000009Vvo-3J7X;
	Sun, 05 Jul 2026 17:24:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQZw-00000009VuP-3dhQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:24:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655pmaE731359
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 17:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/Ix
	QElVyrpA=; b=aDtJ94na86ZG9Q7MIxNvZAedyCABBIatiTo3XNnhU3X2F8As546
	zw7iaLB8q0W1hwlpSg2knxwIDjh0SLC63C7E1XIO5bOFELEvksP+fcNJjKxkK0Q6
	rc5GwI/AHkDdFtGjRpIpUAjxkHcXM9EenxB3CEgi2XT7shHCFPF/bieyBPeIkBhd
	2tGD+IncFEimRrcbpZ/i2Y/+1vk1mejgf4jds6lkQa3OKFMyuOJ/QyWAdkvT/Y/t
	89jFlkfLQVtGQhl0C393/Gkn3oOgaefNyNEODWL/zEKLWLAH4OQ+yoX0yy4y/aCs
	AxPP97Mlue5aVPpk4aHQzBP5S+ZwINlL+sQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k1np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 17:24:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so323156085a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272267; x=1783877067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/IxQElVyrpA=;
        b=F1oDi4Em+qOcj7dmmbJZZWxa875ozz5LHatFwyAcooRVCSzZKAQWtEryFlR2cc3SMq
         vbPpgnDx7tDRhGvV3djfmceiHXys9dT9EgovhUz4c0CcECRXXmL3Lal2VabNA+i2VLZV
         iZkLI0/D+XE/soFXyLpXSFAF6KrGr0rC0heppYLHmxzSOduTCWuPKULdnr+vAm2OOFYF
         DwvT/SS7sbSJ22M7d2C0XHbPg/1a/3VH0CfJRFsffcXajQ+2INqTQmgBiUD6OK3EYoos
         P3xTVYwElMCV/jvYfXNQOuKOsOst8nQ0d74V/3obS3zRzi4kA+EmX8rptX7KL/iYUYEm
         iKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272267; x=1783877067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZIT6NOGZQsS4DMRj4z/plgNR58PJha+/IxQElVyrpA=;
        b=BW4TYMcRCqOVUfJ19o1Q2sEQ734V1XqJ1SxZ48QKTrrhPw3djHq5Z3n4EsyxqHD4oD
         1ppxSPveCXdIP+mEBIdydElChGblfeMo1yqy1rmKzk07+CEGSeMUgwTEVzHSrMr3FLk+
         IsVi569NUvubwBql6O35a6kucTEh/RZN9/5RlU5GntM/0DUK012rMV967hV0X2p3fWoJ
         9vavodQ0oWqlezJpPtNl3cj0wbe1RdO/sPgLon7GwQtI9eMftM7d6xbkKzfVDToBZxtL
         OkZEXRLNp4e/r3ZAsLTvDenqMspxLdpKOUviekJxbc4dwLGnSgwTA3feSKFgy0orxdgJ
         w1sg==
X-Forwarded-Encrypted: i=1; AHgh+RqTXE+S/QNFNS5WISAYMI5eQ2BYIsXI4HliJKP7qApUXx31IeG7Wh2KTO8tIg4mvVYD5gfbNGpu29rrc2+HtB/G@lists.infradead.org
X-Gm-Message-State: AOJu0YxQlUkd6lMX6FoFLw1DM9YU+P/Ae9qi5bfCqZNRlRWHVMnlxV5V
	bxwbpe6A8C8nzxKWOPGC2WF0Vwd0VL4LaN9HfnUbIM7/c/xIqYI9hF7dIR4DvsBvPi7TrSz4PSy
	HKecdTYMAy6Dh0nIXZEOGhOl6jkkPebvFAAzlHf1I5RoF81ZFDw7HJ2khPnTkhRUBXRRt0E4QKq
	ff8w==
X-Gm-Gg: AfdE7cleGzVKYrZOkXMgc8HEbZWyOt7LhItlJ61OBEhrF4vtyjFCEn+I/TbQCIfRrmk
	KzTo/9112zI3q8iZninFrQmjs9FeHrIeM5ZTAcob2nan9rG3mxhk8+jrbqGv619TkobOKgj0P6e
	qUWvfbfplbwKHStiXQDAsuul0jMUUUxEqod0Rrma6PHh9JkyakGSWDHKQXfYM+F1aImjMV7dz1T
	HujpyJGkcfF16DwDqQZzo2Y8mRV7TQBaprF2aNdOFAjh+2w/Fa8IXeo1s/JDeO6FX12zdiTPdBl
	C3bhDMDdHVYUKwmE4udHHRZoikll3ktz+HmxGcTMYzqPYEhtOao+Wql9ubVCil0K2Mhkv/D5Bp5
	axDyMqUgRPxgKUpg8jA3sqngqM4E=
X-Received: by 2002:a05:620a:800a:b0:921:ff36:3fae with SMTP id af79cd13be357-92e8b25f3a4mr1526556985a.6.1783272267397;
        Sun, 05 Jul 2026 10:24:27 -0700 (PDT)
X-Received: by 2002:a05:620a:800a:b0:921:ff36:3fae with SMTP id af79cd13be357-92e8b25f3a4mr1526540385a.6.1783272264348;
        Sun, 05 Jul 2026 10:24:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef248b7sm248347235e9.2.2026.07.05.10.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:24:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] coresight: tnoc: Constify amba_id table
Date: Sun,  5 Jul 2026 19:24:19 +0200
Message-ID: <20260705172418.119142-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0+JKaMSb4fFBzzxCsW4PYijyYt7NTbEfDLKTbd5qGQA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpNC379rn8FH27mwXA0fxCKO7Yk2SX76eObpb
 PEBv7UZBXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqTQgAKCRDBN2bmhouD
 1zIsD/9h2DzIvUd9QKwAFVQKtcB74bwGBIZbieQ2Bq1qxACsCBrKZYQzZklC3jU76HsMVhIuy8x
 qfRl4mjBzJOczLM0uLcEtRxsXD2UmDfJm105jG6efi0z2uub0LUdWY6yF//mTAETEkOeHSnfZku
 rLJG/8f6MAYTksXeBIvL0g1SBvStUNl8KTcUuOhvPwk36PA2Mk312sZWEOW5z3qI6cvCNSuvPBp
 JhmDpYGMpCqL1wrvmG4t5ev5dkZbmQbscy7y1UsnZKHWe7NEzOQzaWpW+qDoVPC/sSl2s8WdY8z
 CVZ+QuIvsewzEQZGs7lOilrZ/hhttPSTSgUKuGRdWPmB/gBbXt8IEujxWS7VEMetXvDSEG8mpbr
 WeHEcfvhJLiXAlZbbWr4kwz/0QyXD3DUpmT2Ck1AL3A2/TZ8k/qj6ZwNDb8G8cJSMidWH7/6/MO
 8CWG431O/ttzBYwvCFcjJ1VJ4yI6wzgMqPodfAOMtu5AiJMHo9WrZ13Ao1hrULqMRzSleDp5JCg
 rYfUE477Mv68NCEdZXoGzGg/SX5/BBJXsylZE06ySBPYcN3IyyA6KyplMw6WTknCpgN7PWFJPVr
 2tUDs2bVLMNBOU7D2DCv+bvIlKIL7OULCe5Qh4LViW0Jsy3Z+c1YaPmSe7EX7C9X8hYWOvmhBnL n4qlVzRiXoqqelg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX30I2BKKu76Qi
 Mu1hizeTkDrwRPs67nDcDZHs4Lk7p+r3LuSBakdDZiH5cDK+TcUzVmGqV/ng1kSleNKhjmnJZ7U
 V8eu5YT152fC3lE8k6JaVTQLDvg1f1ATmB5U5zgzGpMtSCpO1OhiBxskC0PdztqDxg76LQdmfk1
 RKXi4443sg4M78VYGjhjNwCw8hBHqv8NchoZZAmKRB8cYYdqVdKFNI0MWxduOo5k7HLPX7OIBJC
 WeuvMfarBfynr4qXZ3UN+6XTj7kYpou1Rw4y+yNqWY5jGDhHLJgQQ6tCwaFYEP3ZI7/qW0XJyjm
 bWrLTWDoYDN8ZdDLkqIEOBlJkJUB9SmST6ajA3qvATw3FhhmM9dA6hdET55nMtQ2zTFirrqojVY
 1nT2v4uVO3X1w1UVzfRUVYlVyHzgNendbVoHRvTLvJdKSP6gnjSpe1pOpbSUbh7flGGMvM1Wvlw
 ZKz0nLp2jl9FgfQi75A==
X-Proofpoint-ORIG-GUID: p8OLgyVb45l6TAxKSF_CrWGdGqwR_axP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfXz30YVv0o4J+9
 zCs6Ie6l7U+9881epgiYBAWYp6mhcsYwBKXeZyDVmGmc6ZkIPMAggrFO37xT6Ow4VGRuEg29LFg
 CG6T4gciYqeDLr+LhFN+n0cvyXPEvm4=
X-Proofpoint-GUID: p8OLgyVb45l6TAxKSF_CrWGdGqwR_axP
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4a934b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KWLFBBLysIe8JRsbPxcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102429_014091_A67A06CA 
X-CRM114-Status: GOOD (  13.97  )
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


