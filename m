Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE2FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=; b=wQ8JwwhbA0FeLeNhDJIV5AflMz
	NjsWcJUwM2Wu7M9S1oeqQMM8V+ZV4sy39OnCutK81LN+txTxJutJhG35N+ono49n0xEBgNxC+vzdL
	uqh+lYX7ePISpPUeSsWeO+NXW5wVG5UbQZYo8nz/ZtaUtTBeasTjGxrEf52IYXxRrYU1YlVCcLwoR
	N0a8+GiSpTsZhgEyv5u0fquUMDzXPvEC9J11sJy2X76offwjyhW8WFtwIOgAZ8N9OwfnjBBylgY/b
	iCdDQIBKeNt40pLGWaopqDY4ATJ8ADrbiI+XeJivfdjlC25YEj1JZhgWrZIRmGIbIHRWfE3fl5Alj
	BreAvWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpu-0000000GAcF-494w;
	Tue, 05 May 2026 12:25:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEps-0000000GAar-3Jwk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:25:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CDsqg2187320
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 12:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=; b=TdJ65q7ZsmmM7A9s
	PBnNuQ/i0v4A8QPjn4V2POdg9kz/RCuU25m6xcXQN3WWok6aroZpw+rrldHYTAbZ
	5vmi1ETWcg43mtJQa3IAqFY5hg7tK9RcBniEEWKTdSS06luxc8Eczlt+X7+WJeNx
	L58cHgLKPuHNpiOZOtZ2EhMfaLHEcqX+Nn7QWtzGq9jAfltQVyF4h7cdzjSQXk5u
	OFLqy9roijDBrGdoGMOMzIv74cr3H1oXxHkL4yzhB2yeSmL/LwLoi31AWcK5Ut64
	7XRuZOKq3E5iUPMH3MtU9B3zbZv0T3EkwdhNm6yuqhBVPcjKMtSqvRbhH9q+Svkm
	uJTYKw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce00w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 12:25:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c822bc6ff86so202547a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983912; x=1778588712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=;
        b=Tw/+naMTkIwqAPFMGviPKywcI5LSlkBr8kqYATGDGLN2Q6Q1FzGamr1jDMnMF/SW2c
         o1uUVZQV4/XeQ7lLUf2XFN/NvD2G1Di+8Gxm2m56tRW/qU2f/dqstOWMg5hBkXzC3Mek
         i+3o40zf3yhKsJJskTFUFmwdW0kYl7ijCU7pV/cvZyP05TBqhMmOZA0+zRLQPbiMQXJY
         c+Pl0Xexnrs1sSNwjFbq3naiikGu2FnS0TBen31p5TAVWd6/XDrkkJTkCWllekAXKeDr
         qoUu5EAdh+qKMpM4twpC3xEPLHu2ZWaPLpfZKJ7BHwEu4orJyYhDIJ8CtYTepOgACY1W
         yngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983912; x=1778588712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=;
        b=CjCYI8Yq9Iz03o8SoI9jIv1JRZwgnO0fscBU2+DSWBbpzs8F+/p9Rmin/BxypmHUGN
         3aLdBiH4MGOz+en7JdhNjvAto7KvQtJKS6OpxaR6An7CjgCgIwTBB6OO0OqusG2yLYEh
         GVeDiPD0Hadg0AtsSTcltpeg8psAmcp8YoRcxTK0M3Bj/o17ilgoWss41XERU1lvMOrV
         Eu5pylYO5hlFUbyOfnDls5Mp23OIKdAEI9vbn9kwiFspQ5QT3FSFd7jJHFODI1ggAeyo
         Ug0tvJyDeSYRv85IdzYwAcJv4cxKdusyVVwAi+wdYrOWNsY9Ot71N19qLOBsSNbByBaa
         BEGw==
X-Forwarded-Encrypted: i=1; AFNElJ+sYMcH/TGhbwIfI/6RzWONA4LDco6HMpZQ1KIKC8OaqAKJJwkcs776eisMhq/UW9xUjY/DgTO/hTvGLvoyb7/1@lists.infradead.org
X-Gm-Message-State: AOJu0YzYnw7Tm1vvXTLo956k0ollizE7pQksOV1xAbJmY5/zq4yhKnHN
	pvr1AvKuugtIz8PBTB85CoLt8xGDHfzznvQXYjzw4MXBlKEF45geK1qeWWg3TYYDgYZFjzyJl7W
	KqEZBD1xATEJjRZTTk4e+eV9NSW/5Dji+hZngfb/VJccdMNLAbvFcgKUTZkcvrSp6A/G44Q+K1D
	IrEA==
X-Gm-Gg: AeBDieu7dm3BKwRIfARJ6zqgkUKh5KLwN/N/O/ebamh+4dYyvw7VidYj6FIDwOKT92T
	72vy1AjjD5sY7T9SDypR6biXU7vOAbtiAESVV0I8r4bLtlvbJTBDuWL1oAUvFzce25JbrOmNmWH
	DQhu5MUauf58WA6CjNU3MyZ//UkTanwiljXpH/BQJplKkl7YoaVBtPkN3J/ASPUvhOtrKWQr1rD
	52Ra5ndo8PRCSAvzPS44fV4Il3T2dFaO3fm4F0rLUd2FIUriTUvjAS9e39u9/IDCSJwU4CM+fzb
	m7J7YGLXrUDhqYn3Lpxywr1LM3w+mE71T9FtsUbafg4RYv8UghkfMxrnraPtNChpAI1YXzojLpI
	TDK9S+G0mEAUpuvez0QuyBQBPhkR/EZG4lLUJG/BZldGR6MZvoCtG2qm5rQw8qa0=
X-Received: by 2002:a17:90b:4e85:b0:35f:ba08:35bf with SMTP id 98e67ed59e1d1-3650ce40d34mr7090696a91.5.1777983911504;
        Tue, 05 May 2026 05:25:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4e85:b0:35f:ba08:35bf with SMTP id 98e67ed59e1d1-3650ce40d34mr7090668a91.5.1777983911014;
        Tue, 05 May 2026 05:25:11 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:10 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:47 +0530
Subject: [PATCH 3/8] ras: aest: Skip unimplemented records in debugfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-3-d5d6ffacf0a5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=1700;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=2IM4lMSreVHLqyyOxDBhvYJWupnQlqLCRMuo/4Cjc8I=;
 b=fu5pDeP5xi3HER6UMYy15HGHWu0Q0X9dpDdi3I2AdC7VPoEVXMmPbTCAZ4BK67PM/lvDZoL4u
 HVgHnE+TPdgB2ZI4YYsNx0SlBhhGoi8hF8+KMHvtMao8NtxlePtZQ+7
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX51gk7AcWX0TU
 sDst0H3NcyTfLLKAV9Yo1qNF6FwPWJ9wFLNmXV56wRHv53SjtAPkFxpM0Srwc5vX8CeGNSsYDwz
 PWozvlltKTDWPlbcE2SAsNvTbfn6TZbMGabGrcoJOPzFMQOwtgGF6L85ELw+dqycLvsbX4WQi00
 0Zykmp2OOhBTEfsikEngEVjzdRUeINOZwWfPR3E4t84/ndXPtu5jo8gwr3aKWH7zAs1eEPpC/zO
 Tx4Ug6bpOqKMLiwLqGGAn3jCqQmoUDih8+WJgur12KyVc31QMucCj/eh2x5sXE3Bnxg5vkDmmRO
 S3MFEabMIFGFKcrsJjVL3XDfFCHzuf86NRQ+egytOeQ58AYWXVG8Sw35Qpmd/+MDaaqlpG/PgRd
 aB6aIbBvk5pcbHfO1E9j1Emvc7RYoQs2Xe/eRq+aITWATvO93yiFTNO39Uh3KDEHsrwZllf3PHs
 C9CUkqauJhNTCjMVAHg==
X-Proofpoint-GUID: shW2AjzHz4ZVUJkn7B8u5K8hOqZnm_2O
X-Proofpoint-ORIG-GUID: shW2AjzHz4ZVUJkn7B8u5K8hOqZnm_2O
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69f9e1a8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q5xIpPglxa2DKV_CsKsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052512_850334_A1717F03 
X-CRM114-Status: GOOD (  16.31  )
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

The record_implemented bitmap uses the same semantics as the rest of
the driver: a SET bit means the record is NOT implemented (skip it),
a CLEAR bit means the record IS implemented (process it).

aest_node_init_debugfs() and aest_node_err_count_show() were iterating
all record_count records unconditionally, creating debugfs entries and
accumulating error counts for unimplemented records too.

Fix both functions to skip records where the corresponding bit is set
in node->record_implemented, consistent with how aest_node_foreach_record()
handles the same bitmap.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index f710503e4d74..b36190bb3b3e 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -52,7 +52,8 @@ static int aest_node_err_count_show(struct seq_file *m, void *data)
 	int i;
 
 	for (i = 0; i < node->record_count; i++)
-		aest_error_count(&node->records[i], &count);
+		if (!test_bit(i, node->record_implemented))
+			aest_error_count(&node->records[i], &count);
 
 	seq_printf(m, "CE: %llu\n"
 				"DE: %llu\n"
@@ -174,8 +175,11 @@ aest_node_init_debugfs(struct aest_node *node)
 		record = &node->records[i];
 		if (!record->name)
 			continue;
+		/* Skip records not implemented on this node. */
+		if (test_bit(i, node->record_implemented))
+			continue;
 		record->debugfs = debugfs_create_dir(record->name,
-								node->debugfs);
+							node->debugfs);
 		aest_record_init_debugfs(record);
 	}
 }

-- 
2.34.1


