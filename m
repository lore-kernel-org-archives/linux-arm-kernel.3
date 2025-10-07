Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3045CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v7gi3ANU7eGwAeHBm/VtX/N+PelGRzkkDBFdO15qWFo=; b=ScJaSdXsouMS5E0oDiR1bq/TJi
	ziEQ3klbIznnKpoSghULte5PjqouRrmbHi5uVyPdJaugHm0BajReJoMatBlFhqZk67rgckCOQOuZm
	VFmWwfHjQaGjUI+hUjZjqw4kZWCyewWHtl2w7gwLEN7d2P8Ojn39L5uboauddyQkLKbmNUGp7N+C6
	W80uYvHTtXCiLE9k/D6hsByJxDvtvRBXqeRjSVuA1QliXiZ1/dIvpu3YRCJgPYup8RwXTbIeHrkyj
	BoDMytSdM1a/7haPKtG9LDtt6zFOsoH16do/PcZ1qCGQ7kqcPSWmSrLH5zRFm0uJW7FdJhRYLmrug
	tixJ6bEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CMA-00000002a7a-2fNe;
	Tue, 07 Oct 2025 18:24:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CM7-00000002a5d-1WDD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:24:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETC3T031792
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Oct 2025 18:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v7gi3ANU7eGwAeHBm/VtX/N+PelGRzkkDBF
	dO15qWFo=; b=ppVZ6P77exkgaA75jAnjZYSEF5MqFITHrr/PWEI9ACIezmyMyj2
	zzjWpb+VMMlCzE61/Ivf19Se0guYAjqfSXdHQUqHExV4ARrYGTTycIOUb/mTXOn5
	Le9STcQ4pBVMOswJHRWT+/lsXFFFaUawGwvVtMjK9V53Ts3auymk/8uhPTJJgceJ
	dLY1cGAxxFi3tPeY4T42WLt5Sxb8aTVwSjzmzum1QbvBDc/LDGLRoqOzKifA39gq
	1UBpT7jTzM7qnqf85J3yhXKpslYElC0KMqWKykH75AFE8PT556xP77pyCCWXdQ3Y
	QMEhu3mZ27ahxtEA0OACVb6GDZc9N12eAgQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk708xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 18:24:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27c62320f16so68599475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861448; x=1760466248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7gi3ANU7eGwAeHBm/VtX/N+PelGRzkkDBFdO15qWFo=;
        b=QGw68rlrm8OXVCxKq7XRSy/Wpb3hrBkNBZNwu46IB9V+/kAlOHP+QT/kj107dEJesU
         wD+x5PznRZppyAe6KJNs3/dWfiBJoBfMwXw22OJARyLBl9PwDqBNC6xh29iz41iudMCu
         kXAL1eOhQD01+J/9OP1EzKcrm6Ne8cFtncc7dUVJcUmcGrLZrlv4ZrzeahFsmENoPnMU
         VIGcWRSbZ0f0vP6hUfp5zVGmrxDidbtYhFXi0snqHuLBG1UJ8VD1AeHuw10Pd4E8hkCd
         0/fS0vep44cWagEVwyCLDIflDAzEJrDBcOhfwp4xkYkMkjDAADgooGgdyc7Cg3ZNfzpl
         DGAA==
X-Forwarded-Encrypted: i=1; AJvYcCW0pJeeAs5suyXVbhR6hQPAyE2xPbNd7bd6IRI+cLsbKNoFhsxnFyIwz+NbEcLImQpmNcdiyXYF4Y97kzeOs/Hf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Ue2yrcyrTPAwNfcr4P2AuVVekfLPhEPenofneVAKZBcIZC0d
	G4Q7wq78SgzwRrrQX2obLeYjYuiufFsFKhqak3pqeRx15ddUMo1fiIboAlw9oZH7XskX4+PsvI1
	jgCwf/p1jfQQBe0JrNLSr8KcuaXXWRHbXaqmNY2qQKXnQ9tE4q0hsTwRTbhpV6sKW+Tb/rlX1Ql
	/cfA==
X-Gm-Gg: ASbGnctkXLFal7nPA25M+21HSvgko6kH98rdoKH8AgrYF3/rYW0ekNmMnU4/Z/TwX0Z
	Z+z3rFZxGuaQbeaexYZlxuWCn0Hz9snGbaf7VEJgVkUXie/bZFwCc6Zxgz0GGhMUCXDKWWv1qqq
	VMlLOUr4sBHEbhiosbRwyrut9jIuMRn4k7/cQ6IdAOeTULKOk2PGqk7mvUh7tIF010HdpowFwuM
	baY29F0yhkV3r/dsG09T//RGfJJjk0k7qBcJ/nDO8UIS64ZknTOvhk8AcyrTr/rpP7sW5PQGIor
	wg4bX3TrwDsOBwphYaxQxjHVR08RDiTSEL2aM25Eidpit7YC5PlhdtevDHalS5PYtB7gkGPk
X-Received: by 2002:a17:903:90d:b0:27e:d7a4:cd32 with SMTP id d9443c01a7336-290272ff5a5mr8819045ad.57.1759861448177;
        Tue, 07 Oct 2025 11:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk+kGnyBGf3KfhdZk/5b6XJ+HDJE6ygty3ucqB0kfKr1z7QKyevL86q3VUXkPE7iIuJxra0Q==
X-Received: by 2002:a17:903:90d:b0:27e:d7a4:cd32 with SMTP id d9443c01a7336-290272ff5a5mr8818625ad.57.1759861447505;
        Tue, 07 Oct 2025 11:24:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1ba25asm172984505ad.87.2025.10.07.11.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:24:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
        suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
        will@kernel.org
Cc: alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing PMSCR_EL1 in VHE
Date: Tue,  7 Oct 2025 23:53:56 +0530
Message-ID: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfXyIyhlM0FHLpk
 dtjgGEFDbO+q6cpIiKTDaebjU9nikTYTur17kKeAno/8AJk4Dus5ZpxttDQbTbJAHWv9p9AfUNa
 6meM+4GnofN4YTkVkWP6Gip4Dub4Wv6LztB4gq1liqoLm9aOzLvocYmmdvBH10LqHZ4HO/eMWaa
 Mfoiqiy0XCGNgej9pNcEZRx7eJT67hMk3vDDlGBSpBnVqY1lPv/jY9MZUPTvWvT+POSOEAUx95w
 I3/vX3dNc18BBugBhQmFmqUvLD2U02k2O2hLMkK7KrR8/WswwmbSi4EbK+bhzg58YUi8u4jmJ3o
 Ie3hrCcR0/kE+FtalmnHGLFMMfpz5ugEurIBen5M5wbdEoWJziADxN8moxnIuf410SrCF+DvrTk
 zyBgbn6UYp7LU7l+jbQH38N/0oKzjw==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e55ac9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=YElTaCpYnbo2m2hzBnMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: pbYAclBh8WpezqFeGpxwINYqw7Zq-feJ
X-Proofpoint-ORIG-GUID: pbYAclBh8WpezqFeGpxwINYqw7Zq-feJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_112411_517267_201C4CBA 
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

commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
initializes PMSCR_EL1 to 0 which is making the boot up stuck when KVM
runs in VHE mode and reverting the change is fixing the issue.

[    2.967447] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    2.974061] PCI: CLS 0 bytes, default 64
[    2.978171] Unpacking initramfs...
[    2.982889] kvm [1]: nv: 568 coarse grained trap handlers
[    2.988573] kvm [1]: IPA Size Limit: 40 bits

Lets guard the change with cpu_has_spe() check so that it only affects
the cpu which has SPE feature supported.

Fixes: efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/kvm/debug.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 3515a273eaa2..d9fd45f0db9a 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -15,6 +15,14 @@
 #include <asm/kvm_arm.h>
 #include <asm/kvm_emulate.h>
 
+static int cpu_has_spe(void)
+{
+	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
+
+	return cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
+	       !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P);
+}
+
 /**
  * kvm_arm_setup_mdcr_el2 - configure vcpu mdcr_el2 value
  *
@@ -80,8 +88,7 @@ void kvm_init_host_debug_data(void)
 	if (has_vhe())
 		return;
 
-	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
-	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P))
+	if (cpu_has_spe())
 		host_data_set_flag(HAS_SPE);
 
 	/* Check if we have BRBE implemented and available at the host */
@@ -101,8 +108,8 @@ void kvm_init_host_debug_data(void)
 
 void kvm_debug_init_vhe(void)
 {
-	/* Clear PMSCR_EL1.E{0,1}SPE which reset to UNKNOWN values. */
-	if (SYS_FIELD_GET(ID_AA64DFR0_EL1, PMSVer, read_sysreg(id_aa64dfr0_el1)))
+	if (cpu_has_spe())
+		/* Clear PMSCR_EL1.E{0,1}SPE which reset to UNKNOWN values. */
 		write_sysreg_el1(0, SYS_PMSCR);
 }
 
-- 
2.50.1


