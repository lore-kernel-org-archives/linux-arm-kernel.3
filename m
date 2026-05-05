Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5312FCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=; b=o2BYg3a0b1SdT4E2dP69Y6Yf5S
	4oiMeSaBQeWXVOU+7eI8o0GSgR94M5pyXslhzsexSiLlKqKDjKlf7uVUT0Q6iopi6AbP05cuBDEsy
	0b8gsxvG+Fd55vql0eDMYqU1mo8Kjk9pieDkwghiZ2pbpO1/zpwj+y9gCY6Ekio0j5eAXbgrNKLnN
	jielvRcB+V89RoWsOhA8EYsRDCOMc0jGwxKShii4Pf3Sz0ONV26tR2viJ2M9nQmue8WRGsJNJeodI
	RIlHwMrHzDnm8Z2pY4Oh8yvjjwcE1VoxYCWOL9zmwYvBMNIZUJQy7Isisfv0IcueNbXClk6Pz6Hwg
	KhPsKpfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpo-0000000GAYU-2kNr;
	Tue, 05 May 2026 12:25:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpm-0000000GAXW-1SkO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:25:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458VFbx1346341
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 12:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=; b=JOddLap0jB/q49ce
	ysA9hU1v8gpGvceX4so5na3MuDovcsC1hapvbgPTLjG4p90D0Lw7HNcngXZ8/o6f
	tS+tfHIjWHQtBoTPOdn8KqC2FBKhiH7v1k89tJR807w/wDuW/t1OsV3tRpzXaiyp
	hWa7nKC5Wp9z/EmyBWE+gvt1HrVrRrEqpn/6Hv1Z83Sk5Rrg+vZqPAVwaeLYFkEi
	VHpzE4WWdDmo6ck89/7+uXZ2KXkHvg4UmYyS6Jvm6b1glK6VTNFgfPYzybMqouAZ
	2MLbCJq0Zp8irK6UA9PL27jDvN5MpXHR2XrdRxkSh+NgPIq5TRwHZOdA2kdSu72p
	aYK6Ug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xc0qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 12:25:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8028392fa7so99207a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983905; x=1778588705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=;
        b=SME1rwOp0OPNgLvwgDoRlESaYCMo99345iQqcWM/lpyeeeQv3dx8GRhoLrbRy6RS8r
         Ea+/5xMdSlBSqqma1Ni4y37U4JfsTKy3cpWXpfm0XuWWSByQ/TSSaMcPKYzgTLemWALr
         T+o9dLvnSkSB7Yg22gvmN40o76O0xf5mkOHjNsRrFRake5ZiG6y0Pq0thINy9cWfm/G/
         S6uVjfZI8VxCNi8/WpXighP/MCsSw1UPFenMQdczer89b1G/JFt7zpur/m1fkzAGOgDk
         DJI+Y8pe5A05c4kAExnC/hhFKW2M+ovGWEq1DknalXB7qFqtXQ3VJw7qfJ7bX4vEhgQb
         OinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983905; x=1778588705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=;
        b=seQmAAP9asE0TU977bFZP7iXX25BH2NEJZCFsRnoViNoDlzs/5dg8CejV9AChF9v07
         DNl7s7XdiXJtyF3AzKakUFGkwBBNepETWBDZLQUxlips9jQnJ6mKoUWCjV5V+U3xlEOe
         MGqy3oiAcbsB2GUxlKbVdSYZyNGbvljiWCty2C0WNpfpFlYRwUbCzBYzegkXHRkxLkNl
         WvhO2uw1IYUyFsNYSrqBBRSmqpHWwLsdZs06Bk/49G8btxPijKaAE4SJ0pP8ajDNsw6A
         ekb2BMQwhZBS2balWLcRFYSUP3Ak4zTuIDiQZ2aV+vvc4EQNcbgkh8h0s2ttpTKS8DHK
         7aiA==
X-Forwarded-Encrypted: i=1; AFNElJ+x5waksunEmpqtdJaLoqj5uiKKBntXii9tiQUvKaOxVvUHlpzRrnLutPo5kegK3IPgNxQ6w+q3URrJANTgaery@lists.infradead.org
X-Gm-Message-State: AOJu0YyRfmd5u85KpzlN9/aMxOwSeScFS7xiVai/BKp2/uQw03iXgdB+
	JAw3GDxkfrkfBAlGktM8sDtuaUZeYe4qCBvvcTeD28YRat1A5izZrtkQNjGNDYeIqmYOblGvC/2
	cHI39i2DrrUwN4a2D4A+kcGdD8vW68Pjm3AfQJhLhvhCwc/WKGoklU+K5TCFxvA677k3FSbX2VN
	LQaA==
X-Gm-Gg: AeBDievgrhV3ydiTb0u6QwAGek9WC5hI4VLr78YDEOGOfHC+IPria0m37eGPzP13XRo
	1VfM4iwHt62Uo4xzx6y97HZMwWXDc/lWgKyXn8Y+8eHFnztqp25cpzSaq88rhwhYNjKSUr7sAgt
	19qcuCME0Ao3SbHD/laptbsqYvKVS82hRPrEpIHlRgFQ879XZ5l+lUK/ZNdYNEOhdmyDAZsdqk4
	NTQULzC2OaHr8nhkcn7N0IUcowk+Oim1SSdcaMSMQ/bxVtL4ND/i7BAnR1a2zAz3bzReeNykzDv
	GfaQO84V2UjXopv4aPWA+0+Yem0Q/qzL7hvfd5/XD0DRlBrX63byoPd8TxqLSakRJmHJS6IENOu
	9bU3noHJ8eYs40mrNj0L6YX0eLSMbMLTj6tMjRfoFJPY7hMcnBSWXeQDMS+HJ/sM=
X-Received: by 2002:a05:6a21:6906:b0:39b:91d1:6c10 with SMTP id adf61e73a8af0-3aa3e94ebb9mr1574706637.4.1777983905066;
        Tue, 05 May 2026 05:25:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6906:b0:39b:91d1:6c10 with SMTP id adf61e73a8af0-3aa3e94ebb9mr1574672637.4.1777983904596;
        Tue, 05 May 2026 05:25:04 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:04 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:46 +0530
Subject: [PATCH 2/8] ras: aest: Fix CE/UE error counts not incrementing in
 debugfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-2-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2690;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=K7/WGQ524x+e2ze3I8r02DnkbU84gUgAARamEEr7Lg4=;
 b=5srgoRDiOLE+04KITceVdE78eHY9ax0xzcodvWQFYmfY3QszjcUqV1fapWymL8cEoMNtESzDE
 hlR4muq4F70BQ11YJzNFbjlpe+vvXZxKIK3RDMz5XqD1b9rqRIt0Cm1
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9e1a1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IvwcuExtd9bf9WbcJAsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: lfyV1daNXELdSW8PtEmmo-MEkm05uSr7
X-Proofpoint-GUID: lfyV1daNXELdSW8PtEmmo-MEkm05uSr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX/NLY7ESgr3B+
 LP9LpZ2b8bL0iHdDLG0/NS+auNeYjRolA/KG5BXPaLdgAYrIWuUqBebRjVJl1IXVH75Q56XaM/T
 TbhSq5s3O37Ow+4C6X9B1yEFfScLuUKk5lq0epRSr+FAA5Q+zns+poAjoKojcW+mT+0dUSusSLj
 freO7VwvPT9Oc68qPKrP8OcUcY0+NjiChatZrxfvNiMliWVuTajis4JJ3SFIo9NFD3eJVnG6zqd
 xch5Nhke8Gx4PGcYaPB45MGG/3JhimPQddjkGvvdRBw46+FR3H+CZT4yUVr6vvICIa6crF038NT
 4/6IKsTU2F8Iafp8iDVisLUolbAH9ogYL9qAShu5yF9sPhJCNKQYiWfBywDC2aq4vFQCVL1B29c
 l2kneu16fxYg6mjN0qQStS6k6HgGikVWJwHVAbwNm0Ipbuwp3mfhGzEg4yVVnS4cerx9Nz+ZF+5
 Zl9dfCtJlGICdN1gUhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052506_401998_7D443DD5 
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

The error counts visible under:
  /sys/kernel/debug/aest/<dev>/processor<cpu>/<node>/err_count

always reported zero, even though corrected errors (CEs) were being
serviced by the interrupt handler. aest_oncore_dev_init_debugfs() sets
up per CPU debugfs entries but wired them up incorrectly in two places:

- this_cpu_ptr(adev->adev_oncore) was used inside for_each_possible_cpu().
  This always selects the slot for the CPU executing the init code, so all
  debugfs files ended up referencing the same per CPU aest_device instance
  instead of the CPU indicated by the loop variable.

- The code referenced adev->nodes[i], i.e. the template nodes allocated
  before __setup_ppi, rather than the per-CPU copies at
  percpu_dev->nodes[i]. The IRQ handler updates CE counters in the per-CPU
  records created by __setup_ppi, the template records are never touched
  at runtime, so err_count always read as zero.

Fix this by:

- Using per_cpu_ptr(adev->adev_oncore, cpu) when iterating over CPUs.
  Wiring debugfs files to percpu_dev->nodes[i] so counters reflect the
  data updated by the IRQ handler.

- Using adev->nodes[i].name for debugfs directory names. The per-CPU node
  receives name via a shallow memcpy and is not the authoritative source.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-sysfs.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index 66e9c1103f99..f710503e4d74 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -189,16 +189,23 @@ aest_oncore_dev_init_debugfs(struct aest_device *adev)
 	char name[16];
 
 	for_each_possible_cpu(cpu) {
-		percpu_dev = this_cpu_ptr(adev->adev_oncore);
+		percpu_dev = per_cpu_ptr(adev->adev_oncore, cpu);
 
-		snprintf(name, sizeof(name), "processor%u%u", cpu);
+		snprintf(name, sizeof(name), "processor%u", cpu);
 		percpu_dev->debugfs = debugfs_create_dir(name, adev->debugfs);
 
 		for (i = 0; i < adev->node_cnt; i++) {
-			node = &adev->nodes[i];
-
-			node->debugfs = debugfs_create_dir(node->name,
-							percpu_dev->debugfs);
+			node = &percpu_dev->nodes[i];
+
+			/*
+			 * Use adev->nodes[i].name (the original) rather than
+			 * node->name from the per-CPU copy. The per-CPU copy
+			 * receives node->name via shallow memcpy in __setup_ppi;
+			 * the original is the authoritative, guaranteed-valid
+			 * string.
+			 */
+			node->debugfs = debugfs_create_dir(adev->nodes[i].name,
+							   percpu_dev->debugfs);
 			aest_node_init_debugfs(node);
 		}
 	}

-- 
2.34.1


