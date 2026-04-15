Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70053F428CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QN+m/SC6FSjWpX9y+8goQIhqVtjzyGE3j5DK0NVFuSU=; b=eTdxpUmKMw7F0KnQYRDH9895cf
	7cmXml0HHtQhg1Z/YAYAkAIFerDIhcY2UDyXhV0r9a5PiGXlifIyrp3iCtXtw4BW2r/y1ntZ4mqL/
	kBFbEVcaOdoZ28P2IvXM5MgjuE1UFN22cN0eDbVrlx/Ks/v/xjLGKspMH50XriOXHyn/t7mWdbVHm
	8PPJwY4s2HWCPBrQf/XjS0ZI/V9QLZGM+RHS6cZMKaZo3sot21X5AmaJZQyu2FLHiq7STKK0XDAhr
	SyNiUAm59PHwo1knsstg5bEv+jT817PMs+oHzbTRQxxsdP21GRtPbhtB1/RXj8qn+FreXfGwxoMi/
	+QUKgG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD6Pr-00000001ZXX-1UEU;
	Wed, 15 Apr 2026 20:01:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD6Po-00000001ZWj-15nZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 20:00:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFQJlD1702619
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 20:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QN+m/SC6FSjWpX9y+8goQIhqVtjzyGE3j5D
	K0NVFuSU=; b=Cs5uBIMppMbLGAeNqVngfVIF/NUPVNA3ZPQt3NM8fOixplzVRYM
	spbj52zJ/nbB+zAuDAhdRH2aEHyxwYTPfwU8l1Plv/q4CSiLCyRHWjG7Hrs5U7In
	K7WyToOHTAGlHOYdjtnT+4X6mWYjMNlGxfGqRaijShl+Tq8oY5JOrMPZGQ8Tn8te
	4GI6XBCSljnBu1xmniNC/ZLgVzRVQxEEWvP4tEs5/si3WVOyZiYBfG9f3g/PwuCg
	qA3D19PLUavnASCaXbVZ2thRRtzrUGyNGScQMJpI5vUtmbLW7XZQpjeYGnviwFch
	kjLOU27DHpCGHv+hyrizctPgbGs2oq07o2w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamgwkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 20:00:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so58247635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 13:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776283243; x=1776888043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QN+m/SC6FSjWpX9y+8goQIhqVtjzyGE3j5DK0NVFuSU=;
        b=iDirbbJRB3hmNtAvYp1+V+AxfPSod8ZrBrmrhO5Tf2bViLHuddTkGUIio0DdbuIcov
         NcrFtLE6Rk0BEKWRfcvqRMTmek/+P1Vqy+ZhnjgkXVV7XADWc7fMF10mi9KRHKlJOWTU
         CBQf9EkEXW0s9tJDQGx8NjEECn78PuzP7Gz/hAbzMeSSt37WPRyfb00PeK3sYprT9Ahp
         THarp+xqj6/VwlBW4FYZ6kyeNojszCWomOM1LJtFca6iJXCGSpXL9u7SvwJN2n5Ez5jt
         Wj9QPtIPx/0bI3lyvVY7AO+RQwwjtLoBmu3zp8ZLhmUbLqitwThSawRaeS10eVDcpkcO
         k+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776283243; x=1776888043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN+m/SC6FSjWpX9y+8goQIhqVtjzyGE3j5DK0NVFuSU=;
        b=SymvKzl0RDHaM48NRnN/F4M1MByUjnZJY0ZuqvtvLlpWwbWzKEh3uobJGUqql6jnu2
         OpSw1y1wxO+7swvISiccPWUroMgO6aRZq494H3xUdnKLlvNTrGqik+ntD2g+ieg/tope
         XOyXYB6XFUozxnVJ8XEYdeyjtWLBIWb576qf2carLlpDJ0db7/JKjsXqzlRMYrM+HeKd
         JGdznTb3Y42wQToO9UBPL4NsLovsbzNvWifTPU/xRh73fCqrSculdDIIsx5daRTBQTnF
         vl5kPPo2Gw8A8cnXN2PlvTHSQnAqS3JyOD3DWGbmdJKYShA4DA3cjCpSrQhfRJM38H5R
         JgDw==
X-Gm-Message-State: AOJu0YyHmHdmJ9hXQ2UnZiyxiRqoYfQeL59aQ42N6lgker6yeoXCt6Yb
	Prw9n5G6UTHW0foGCRMLegVC4Apy+rGi0k/wtyx/+vif5Zbpq5kis8zViPEVEJizNT7DwTnlKFa
	3n7WsyVNg76foTSyTo0EBxJtqbadKJUh5JejgZ+b8gBPNPPqglGJk6cksqLsDfSU0wW7tb6HLPE
	4kZA==
X-Gm-Gg: AeBDies6+OtmSKkwHH7Yi5djS/J6up86UvGoa+dhz7IjfS1IyaoR9WIIyalPfsvaFhH
	e6iEfp3z4iyr+2ndYl4e72EOtSsqTnkmAguV/D2GwA7kYDxAWIxuziGg5tY/+c1fvruWd3Yq18+
	HT7tvLtewbiIpqsJMLseVOMI8sgdjA1SjpkLnECsY5rWtb3d1fiHPDeNBjn5FMuVxBPSTwGYOBL
	1AMxgkmZ5xqXzqsPPl5/xbCw3INT7b072EQa59JzKsuJEzAVsV1IP7VlA/hqkUrxGjNbUINJMiG
	y9hGfdfis+g63KkRz66n5gWXBC7NYArtC0+FAmWG1JLo7w0BAoInlIJTxNbkjtWjqOHcFcb59S9
	/Cd03cd5Gv91sXZKqqNdwEbxMG2gj+MAilc5jn0z5nNfC0B63
X-Received: by 2002:a17:902:be02:b0:2b2:5070:8b with SMTP id d9443c01a7336-2b5eaa1ef15mr5414645ad.1.1776283243231;
        Wed, 15 Apr 2026 13:00:43 -0700 (PDT)
X-Received: by 2002:a17:902:be02:b0:2b2:5070:8b with SMTP id d9443c01a7336-2b5eaa1ef15mr5414295ad.1.1776283242544;
        Wed, 15 Apr 2026 13:00:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e232sm27423905ad.48.2026.04.15.13.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:00:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] arm64: cpufeature: Fix GCIE field ordering in ftr_id_aa64pfr2
Date: Thu, 16 Apr 2026 01:30:31 +0530
Message-ID: <20260415200031.1885440-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ImFkpY5ZwmzGqTkS7YFRnV_HPFAWbMVD
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69dfee6c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=J9pcbZUIVKvfiMDc_lMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ImFkpY5ZwmzGqTkS7YFRnV_HPFAWbMVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDE4NyBTYWx0ZWRfX36Ilvizth/BK
 3TMguSnLkXBVjrm0+9uHvJ6WZ5+uwCTcRWfAsKLizqpsAcq0qYNNwmJN5sTK4e63DVe+nCyHDoa
 IducH/op5Rh9qEYS/LZPzyvK2C1yZgnFLqQ4d3k/sLJs+59JeJ+rwQcUS8IR5i401czZwvues7u
 UAl0rrVYMXNIZE9R77v8Q61A6lS5+xuAdkxalvnZEh9Ir57j8jQYNYK+UgafBK2zY5CBjprm3MV
 pWi77a1GhMlbntro0nO3Tj7758el0rpumDTHKOCFpulJcXqMFa+O5QRGedIfGNh0lX6qgB01S6i
 nm/aYRWDaZC+nnOl6hJtQkRolLRX6Q+WdTOHSCnSRoQ8AAaDu7RPcDG/5G7ZpH9J2PZguZkka41
 h1S9MZ/z3P6wKM0PkQ4nAyOIRLvSPHi5/NIPBDi+l3r2X6VcAYml+d2hgxX3K21R6MG/m1e1Vud
 LaW3Nt2WZN+/XenEEEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_130048_430607_62969960 
X-CRM114-Status: GOOD (  15.17  )
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

The ftr_id_aa64pfr2[] array must be sorted in descending order of
shift value so that the overlap validation in init_cpu_features()
works correctly. The GCIE field (bits 15:12, shift=12) was placed
last in the array, after MTEFAR (bits 11:8, shift=8) and
MTESTOREONLY (bits 7:4, shift=4), causing a spurious warning at
boot:

[    0.000000] SYS_ID_AA64PFR2_EL1 has feature overlap at shift 12
[    0.000000] WARNING: arch/arm64/kernel/cpufeature.c:989 at init_cpu_features+0x144/0x3d0, CPU#0:
swapper/0
..

[    0.000000] pc : init_cpu_features+0x144/0x3d0
[    0.000000] lr : init_cpu_features+0x144/0x3d0
[    0.000000] sp : ffffc08678f03dc0

...
    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffc08678f14000
[    0.000000] Call trace:
[    0.000000]  init_cpu_features+0x144/0x3d0 (P)
[    0.000000]  cpuinfo_store_boot_cpu+0x4c/0x5c
[    0.000000]  smp_prepare_boot_cpu+0x28/0x38
[    0.000000]  start_kernel+0x1d4/0x848
[    0.000000]  __primary_switched+0x88/0x90

This is because the overlap check computes (shift + width) > prev_shift,
i.e. (12 + 4) > 8, which triggers since GCIE occupies bits above MTEFAR
but was listed after it.

Fix the ordering to match the register layout: FPMR(35:32), GCIE(15:12),
MTEFAR(11:8), MTESTOREONLY(7:4).

Fixes: 899ff451fcee ("KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 48f2d894101d..6d53bb15cf7b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -328,9 +328,9 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 
 static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_GCIE_SHIFT, 4, ID_AA64PFR2_EL1_GCIE_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEFAR_SHIFT, 4, ID_AA64PFR2_EL1_MTEFAR_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTESTOREONLY_SHIFT, 4, ID_AA64PFR2_EL1_MTESTOREONLY_NI),
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_GCIE_SHIFT, 4, ID_AA64PFR2_EL1_GCIE_NI),
 	ARM64_FTR_END,
 };
 
-- 
2.53.0


