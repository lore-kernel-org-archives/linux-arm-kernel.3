Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E33CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0PtOjlnqWAv12BSE7gzCp+k2OZBkuTcqbhb6mVsDhc=; b=n+MY1SKhm3zrbkrxbPTsN7Bcji
	/qrblfyoIL7JFobTtpo1qRJr8d4+uQZPFRmqQ2L8epy0CNoPbws2hVqSLO+VO3I9XacrekokbBtpv
	lVjc5JXfS6A9i90BoA2PA0HI6f7pB1pcFWrZEME0AZlGQBNnlx3gBmIRP4AKAhgD1j7Piobb4VsZq
	9yd03b8IBGGjH73ZpjsFeoXNrFsTSMdAWHSRZqjG1SDzF7sqATsuqPx4FgS8EQY5UrhdGZCGxsN/H
	yP5GvTAM5hii4FFENhuZ1lvVwHdaYKTQqfCwqTsJvqvexu3B5yaT2W2hPsBAwYr7YZav4Nv8qt15v
	JkdTTa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIC4-0000000HMNy-3xme;
	Thu, 15 Oct 2026 09:56:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIC0-0000000HMKx-1PmC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:56:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSoN2662626
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0PtOjlnqWAv12BSE7gzCp+k2OZBkuTcqbhb6mVsDhc=; b=jZiqt8k3xLXpmDxI
	r6JarZeD9ZHDvjlXwnT6v8N1MGiTTsZ5erEQOq8czo6zLosqbXhna50Ax7UZi1Qb
	sQC/YpUBsxBj3PrZj+zuQtUGJyrcKqSdGo2qwGRp2xSHamGfqbAMd6tvmYKQ5E+/
	PgCMIXf/0e4gWIDDqJj+gi0ODDD2H56Ihq+0LVjGzlNZ5kA9QFN5nSY/MUpbrYnf
	8QW+jrET2SRzfWw1/aXDUZh4la273HgOzwAZ2CBjE5LlAZPRtrL8yUmvBRr1acxG
	iyyYUFM4TCt4sTLF1EGsyJKoRkEn/9+hwnaOXIUyMOv3xt6y147BYM2NR6vNyJqA
	1M1wow==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1dvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-155a75f91e1so1404848c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058166; x=1792662966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0PtOjlnqWAv12BSE7gzCp+k2OZBkuTcqbhb6mVsDhc=;
        b=Y9uqLHjuD6WaimIH8wGoh+3Px/DklCxtA58aDUP3W9T2T+z/qMkGpu6Q2Oi5p91pFt
         Ihu+aZ5Q1GdJQCH9VnvkuJL0lUjhLZGl7xOSd78OTnLk5Iqsw3s+3Cu68b/pWCJPiy3C
         AAmi/RxfmS/iWQ0qPjpWjzsKH8NE5b4wcPqbKlahGYXi9rnqGBFP4RT0rooG3Y1ePRZD
         aKpLoCjVcVwIITmYF0Ev7rCJOvJfwQrwj5SJwGO3LOYN48Y3AQnEZ36Ojub3ubJojPXS
         2QoEOEzO7hy2dAtDPGU0BLoLfS1f16lU73o9E7gfTJQBQIPZeaK8Ow0DNtiZ47QEDHns
         2T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058166; x=1792662966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0PtOjlnqWAv12BSE7gzCp+k2OZBkuTcqbhb6mVsDhc=;
        b=RGkmqWaYDlmeVeDo3fIO5P6goXztIjAnVZdt7RZvjdlfezoSi7rypBmkmDDhADiupr
         AZVwYX4U8UrQ5u5ILTv7s2cCWWPA77oAgeMiIc2Xq3MeOqctEzUHQ4cCl6QQ0nffV1BA
         lwhaaIVUOY6Smxt2ibqnuPSMvBjlquHx7Wyrdv0/LKrF6eLkbUJ1QdERb5QY3/apLlx/
         ISCwVBE3m15Ziun1PmxwcZta2uebu6I/bHYQd+ve7BC074zaFLy2w0DesOprzQFfJ1O4
         jsmHr/UwvoyqEnQmQnek2L/kryFiIk7+fTtoXl/Byzwzcp22M9CeDQiL/4bEJhAwSwiR
         Xiyw==
X-Forwarded-Encrypted: i=1; AKwUvBw+a0GyIIwucK0wu4IByWq6Q9wpEDogdBMymOmNnAIAlyWtMtpbFHM5cKgc0Bqt2EqtaEfd53zg7nnvXRl4lr3h@lists.infradead.org
X-Gm-Message-State: AFq9FYIPp3ohi0SFtwItNBdi1orVBNaHjTt5oCGI9A4tuquyHiuzOs56
	N/IqOMeQq4GPkUqLSQyhbWvF8/pPhdpZ863M2O826QoI3ftJARzysGU+469nCwBRWVRVuI5dUYk
	FpaIsJ9TRjR8iMWa3Fb4ArNuUcx/i0VRN4sCDkXuznI+ar68FQ/MwREubCcxEwkVXsaRJ7X+BXc
	O0LQ==
X-Gm-Gg: AYBFou2/Tv9Bp5v9vOYu73hFVC+y1tj8jS8lDeux7CpuP3PgHMnGJs6LwBUJZ2vHWFV
	56A8wPc6CQo0Fcd4ws5N+Q8MdzETuUK9iSLzed4xgHaYHzIRfAJsJ2sgRdlEK0dGM3jNcoCDOc3
	CfKM9Ob2twyBsT89ytEQeXoLVna3UHZ6SMxZmD+pguk/CmfqNiuy/Li2zAg/s5kTk817tZRJmIy
	kObyVBT4fM/cwR9lXM4Au0SVV/+z5YNiit4n4s6xI3FgFi3ImExWELCEPrmmGkpnCyjk18edh9Z
	KjNv4ox7Cfx7VDjQ4+hmr5j8/Qblh7+UrP6Ut8Rd0D68IarcJZIvvKkQEC9BzJAv+2yftx9h8pr
	gGwh73bX7sMOoz8yQmAGFq7aDb/ND
X-Received: by 2002:a05:7023:a56:10b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-16a5dfd5d7emr23585592c88.19.1792058166139;
        Thu, 15 Oct 2026 02:56:06 -0700 (PDT)
X-Received: by 2002:a05:7023:a56:10b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-16a5dfd5d7emr23585545c88.19.1792058165526;
        Thu, 15 Oct 2026 02:56:05 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:05 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:22 +0530
Subject: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1168;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=M43+I1qLzwSuGMruCHHPPbA8y+igFXWBm9aSDkVCJa0=;
 b=lcqGQ5xOxECngaExoPxbytnqYLcAPF7CZa1/DKLyIQ7/lxzbx4iiXzXOvjlDe36CxW1d+kQuG
 pXYsMSSpiE2AFS/Rfeu/7jfw/23V8SDuRzR2xu0xR565vyl0nx0t1rD
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX6nv0QV9lvXTJ
 aNQNf9ZyOVrF2uuNJrIhlXw0x15/AgXEcIFKrwQIEgsiB9SDGgjpHPfSi1MxZLgBcls6Gc0dG8X
 4fKCB9Ns0uFcypDstMRPi1ijMeGDXAU=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a337 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OikB9Wl6BtP9lw8g0jQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: P9ni1_Lcrvp0i6t4hPRTA0xMPSXcc8rM
X-Proofpoint-ORIG-GUID: P9ni1_Lcrvp0i6t4hPRTA0xMPSXcc8rM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX9VVTXAOEAKcn
 fFiykA5B3QDpYtxlESxiOy29epeLSIW9iE7bhmPH35M+HOwcFCodNsUh8LCZ3++YnYxjBFGOPUA
 o7UmGxHtbrpEhqH38IdVsIUqO/Admnvl1IKBha/aXXETD2hwBne0XJ8mef3FKwMU0vbEpAsYAfg
 TlAeTvc4+MPKMAXb32hSzCZjMBEW5yO2sersiunfViHdZXKMv/A5vCdYfkTCpzYMNQkIISziZGZ
 1/exqDKEp+5h6Ql6wYN8Mn6lFD6uFlRsKA2+bltvfxwBknx7cR8O8IJj8061l79AqJQMKxK5lej
 WwqyHwr0EH2nKLNOc0I3Vw/H663bZo0tJ0W1VE1nRlkdQdKaWlMc0d9ldqN4/WbxYz6a6kljwTa
 As986/iT5mgw9oBeC+Wm2J6A9jX3YiMdqRwCjGpymHd3J0Q/4cEPdMCo3SPq0Ns8jtyqD34bzdE
 yaxR38gJinIUU9Q6GdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025608_497837_14A222D6 
X-CRM114-Status: GOOD (  13.29  )
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

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549bf6b86b5232be216c9dfd51bb22d..76683c32aa583cdcb04f23f7de874ead83a5b4ef 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -318,7 +318,6 @@ mpm: interrupt-controller {
 		mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_SMP2P>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		#power-domain-cells = <0>;
 		interrupt-parent = <&intc>;
 		qcom,mpm-pin-count = <96>;
 		qcom,mpm-pin-map = <5 296>,  /* Soundwire wake_irq */
@@ -505,7 +504,6 @@ cpu_pd7: power-domain-cpu7 {
 
 		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};

-- 
2.34.1


