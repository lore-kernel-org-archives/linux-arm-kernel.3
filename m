Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4873CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=; b=DRfps3vlx7l9mDdwxrq8qnS6e5
	TDv27ti5ogdcac5LYcWONhi9FPgt0d5Xrin3e24QiP0u1CQECZ9iqysoein703xdAYHhZNTbgy5yy
	Zj7dxVrAgc35vr5zr6gYV/lQiOz3QUCu2HSJ0Cgdi7m3lsdTBQtMPkZiRM/NITbc1EqfySdrNXcUW
	+Odcy3j02AKplD3fICDLz2GLvOW9eIhZWcLB26H13K7dlQd4R1s2dlcBZ15Q9h8u2cjj9B4ynxYTF
	q2+zhP44KJckif5FsR7E0Ph/lgry4fS2j4caNMLS6Dzcx+9kOEPlELsIE+KIJr2r63YRwLAnJ1EzG
	nLqEyR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHICH-0000000HMWF-2Z6F;
	Thu, 15 Oct 2026 09:56:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHICA-0000000HMRf-3uGv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:56:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jG7B4077443
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=; b=ETHsZN1Ob0Wfk/Q5
	1JsHMXbn2Ob49GRZmn+Yg2nCWAzR0J9Vnu77a2Q1m+kSfPNaYUGrT8CSngAUA/3j
	YeIa47ba8qMyW4sRRx9HcaJHAJztba3lgPgHW6zBhCLt+9SsB5SWYtggi5uNwPLt
	3DKNINqjMxBgDaMMsHdEmHzf8/MybxKu4jAKmqoA5UsjJTFSh4X2cs3Q7kLyTHv/
	7t1M1kUe3sZbjT/29cqth8K4CsCMEZNr79tokVnJgdykHmaAI4hNYGnYpped2XmU
	4BFS7hnmD75PXgTXSU5JZvTTOmIeCl5U8eM+m6zxhWJ8XREgMmmpbD1oU5b80xke
	06y4qw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc03fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so2412713eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058178; x=1792662978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=OQUF1biwYJp1obob75rN/QRBd09KI55hZ4eBlHlR38SfH2E6B1p7A1SpyAq8gWCMej
         TZop9khUJbkgMyFvulX4D+5G/EbDCsD8Qo1sevbG8eklGH3pMko33ffenYRHgtELivsr
         9NT0mlF69HzbV9QklEAcf35WWgH/JLGm7/nB6jR2b+Bm+b9vbR7otczb3w1g9WEpeliC
         /jb9lPn0AmP/l0tO9Y4PkqQJiz2PGc8DUYvRokFgCiZPoMoJTRMa9jvFlHE83RCef8oR
         BgY8cAxWXxGc8RFNsh1rqALciKAIZXYxvRe0eQs2LPQdS4qjdFiKBkpCEl3OWzjeR9q0
         gaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058178; x=1792662978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=YG/myRh3D+op04mQTfXyFUacc5sNVnJOxgMRs3DOwblmbrDqYf3Uby0O610ZydGrdQ
         zIJ4Qmiyt4qiEOFGRXisurFnCU0XD319ZhDxUChVOmXcA9mEduTU4flVW4Ab5Xu0b6gW
         CXB6Ojl7NH2HOSQpvucm09pfMvH8IqYJHmpffnV0FawPtvLxpyLExehurTTNdscssK+T
         3M/8XCpDCUuQ1htRtEVE1S2QSW2QJ7rSN8qUi+gW+Z1Us7kT09OTQKByiiThavpZ+Az/
         7eudHglAe9+z5B5gSM0Mp0TKhw+zfrB3EkWiqiYTe+LWTS82DjVR6T3n2/dndMCZpeye
         n/aw==
X-Forwarded-Encrypted: i=1; AKwUvBwxShAEliijFfHgoW1OXRBzh5JyOHhaBDgJN2QQD1dzxGKVsQNA6EsTa0yh/MCbd7h20xp02h+tqHGX82+MDaqj@lists.infradead.org
X-Gm-Message-State: AFq9FYKM3FRL54JSe+Nsqi4EIKEF9TqeYqpnxNxKDu9m2ni1fCVPTCid
	RzW28Aqi9vCrIiFr4Xq1X8QyWvVF2pRKY568A/S8x79FW90mCiwD9EEHZo0OqDbP9pjzkiVoJZt
	SkDKD8SEjaYFmKLff1zdhIP5IcAMpbiITdYPiWfYUeysBRspwiUAianOmoj4PaBvRlfEjL88lGm
	1YBg==
X-Gm-Gg: AYBFou3ylLw+5BCCOX4QNMIGOXfodh6zKnAz+4j/T7oqEP5Gb+ii9/PBJPWfbqdVqoW
	rGbEfoWA48FoXvDwXtyqwaaU2aCJc9k9HhD1NTBrvr9uo/X87ANIgZ9XWrAI2Dfvd6G+moqslMa
	O+cYhi5p5Z5cf3ahB/Ly0nQE/clfIqhz6+lMi17RV+3WshVRRKb/SJ8wS0lDzzg32wfBw6o8Ded
	4SwgfUoej1OISqV+l3z2AKzqpEadGhq+m8v87N8Nauv6NK6W6uw4PMJXXSvvFZp8aAfPBJ6tTpi
	A5DR5xwDdElUotjDMl/Dl38BSkFqHVJts9ueGpZzCc/QgSrqFiwfYis4hI9nN0pH85GLxIAUne9
	rhzlXX9Dikg1pSqi+zhyZcNR+VLFs
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143287c88.20.1792058177690;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143254c88.20.1792058177099;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:16 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:24 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster
 low power mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-8-ac7f1a0d5638@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=846;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=H9uj6sSRgDeKanFxTtA8ygC1BldkSBVH/X3TN8Ylvnk=;
 b=DOguxFdDz8eXRwGTpwXmM914l69U245h6uQPMgNmIWIAFEd+ABsBGuwQIW21R3pvV2Ov9j9xI
 kT3ddKmka8EDL7zEPOGqasjxQb8I6e3QFrxqvgEBADuzNKOnUk8j7Gt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0a342 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SQDDdHR85c743OeLlmwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX/eC4Jr9p7Rtg
 W+bblyl0xFLZ9rQNch8V62xQ0B34aGaEurohU6iUv3haTo7ZWcjSJu9LSFasz3BkuJ405jkEo7s
 yOZ/om55DaU3mLq9oois5+ZKlk4cQoc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX0FMc65V74c4C
 Ogg7+CpOV2TUuW7RKjaLnmvGrd5sq2i7DBLmqraJAZdWT4kSM3FZ0qcyfVgw2ZUP+KZmFppNpVn
 TvyoxRWLPoSjAdIrB2AM8EHClD8afaAkUowVLryiXMSaCeqQN6JAIV736uNgTkrF35MZ0amcncj
 TzxF1f+JVqWwZmqYkRJcx9M6JhNEJktltmvazTOxuZYFsznbv53AECy7Hs6DEsR52fh6hR2njXK
 ebBk2k6SnbuU1qYlrfbMceYsKuB3D49Qc7cg56ffuS0BieWhyliv8Mss6D76eVB3OiqkPoVLVTu
 /6JZyI87BxfKtv6MUHe/v6r0ez9hfC2v1jG2V3ud9jDUtcLetDqz3W9W7B/cqROoEz0Wwihcz7n
 npXsQYbiRyWnXDv6N+OZ/Z9M+vtdW1SC0+i8c5PSNhnoawaPda+aoMrQLuxWeZz/+OmvPmCbg3r
 rsOBWnURQqXfZNWfMXQ==
X-Proofpoint-ORIG-GUID: dNvbQqn7DfGOREge5dvSn5hwYwYSyCCB
X-Proofpoint-GUID: dNvbQqn7DfGOREge5dvSn5hwYwYSyCCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025619_034816_413CFC49 
X-CRM114-Status: GOOD (  13.41  )
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

After the recent refactoring of MPM driver to handle RPM notification
under CPU_PM callback, the CPU cluster low power mode works fine for this
board.

Enable CPU cluster low power mode by not deleting the cluster_pd power
domain node.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index da46e9d6552801631e668f7a43f5ae1c27639fd4..73c53af3eefd31c6b551f83f7675018d502f23e0 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -244,8 +244,6 @@ &cpu_pd3 {
 	/delete-property/ power-domains;
 };
 
-/delete-node/ &cluster_pd;
-
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.34.1


