Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D4710BA440
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYEIaaerAbKeFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=; b=a4SITHEcls153//bsMEkMKs3mu
	jW6CyeVzCerJa+TcTyP5AmaE8ybdlOq8l91pPThCgK7sc2zhVcxkogEswUfp2po4AE4fUu0FPEIfo
	F0aOJ6TPKYTva25OgWhSZrfFKbP7e0f5VxjFEyJZ0YzDekkJ6/GWn0EHpEOUoBoj5B8cmyjyLr3eZ
	3vttL1sXNlnVWNxlTexKMEBR3iZdBrfwxtfjJ9K6OYegzN73jXYtoinJtQqNaxFqQtryIUyWV0VDG
	s1s1PtJRJ7ocds3lg92ikbQiYkWuVfB0eyoDvfaNCNu/PnDD9HpkAML1h2ik51Ybvd92LZYO2bRpD
	Nwv8Zoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62bB-00000006yMI-3RRq;
	Fri, 27 Mar 2026 08:31:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62b9-00000006yLm-3Hj1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:31:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vo8u3715938
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rYEIaaerAbK
	eFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=; b=J9jnQ5WCEl9mTRNEOxADy/uwTqj
	66wP5jD/yh2LA97ybP6qP3BIaUOd/CFwE26zJnWXa70U0x3knrqPbDNuqQWR57+f
	thx9jAtDTQGlVlb988DW6JraYN5oFNtrh7CHs2Q4FuBO//RCMLNGUYalPAH58Sez
	iPr2AE5ZgiUfDfnz1UNk/s8wWdndG7ig7p4q0GFxyyyH7tpYo+U6YQTkBlu/Ze5r
	qmNHNPFI6+07CC7g7kC2qDrcGEGrgyVR+Mr8ZTs373sdK3rIErNII7Ra7FPib61g
	Awr3hGkMMAXnGHbTJW3cLKaG/7UksS5lko8bg8VByZYHZ5JnqaKp3jHL/pQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6hw4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:31:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a0998a441so5992283a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600278; x=1775205078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYEIaaerAbKeFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=;
        b=Don2oF1L4iOdqfmilEqUgqfQQkg274epRonZ50fHCJxNUVYEW/bCybSzTTrg8B9+0P
         OpwvnHXQireOeh42yN7Eg1HmMC3Pe6YVYciNJsD2Vz3kMrFNKOtOKGr8CgAgxfRVv/Gi
         fdBFY9CeMvqDfX5YaPRcslnw87pkYQN4kPLhUDqEKoo4yXybw/UeAcTyaUXK9oOTFxIR
         yNlv7UeHTENZgP9PMYy9UpwIPrkzFnAO/++ZRmuKL79IamUFQ/w1uYPLygte+LB1GGSU
         Nz5n5daHFJ/zL+GHai786x535FKK2S52NHypT5mnwchGzpG03XGtOLA2wGRZB32H562W
         J25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600278; x=1775205078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYEIaaerAbKeFjrC5LN6M8Zr8QVwz3ngvp8+YUrbV+c=;
        b=EITqm98S0lbtEdqEAmF00YLYgvvZaKaMV6NgVJk2mtkKcS3gE5tQ3Pr7YAIsDnepNY
         RVaBFzEZLSZF0FIPns9SOHlyWV5EX5UxiDtVkx9UY0fXVnUVuvsHLQgCAKXHy2WiNdsr
         b/zQ6A7Bst5NfZaH+OdjJjTiHYoStaLsPSRdbXKx7XtbcpTAQy2pZ40wj+EdGAIGtV4/
         Le/q6HajKyBQKhcJ62r4ov1P3KdUq4nn7coVbCIYChcfvzovBC3YfucxM9s8F+39MUZZ
         hrXIaJTxbpfDhrAqxlBstVGaMBHnhQXeMvnEO+pYLq5mtP+ga9fDzF7mkh6p9/z1SYd9
         Htgw==
X-Forwarded-Encrypted: i=1; AJvYcCXC37bCp3XVnbLihNpTJJhyka0TbSzGcoGyTQTvPoplHX8wP/J3auYGTSWuLxuE+yRlil8lxILlZL5bFvNTUVc+@lists.infradead.org
X-Gm-Message-State: AOJu0YyrARR97dSMIS1PAwHxTumCagFiDx+cobipOJ80jtxuzf4jAZFY
	6p7TWtsVkgFWfmA+wlBEDZW996Sl8Ijpnt7kZhESrSvJomUzJofeQwhz0nrcZxSD3OLxkaBNn/C
	d1qLfXz20YGrNMTp00htlXxzP24/JKTi4jNMUQYcKIPVGi2AU6IqIUfXyOiqce5wNmNsac7WFxH
	JjDw==
X-Gm-Gg: ATEYQzwkMzG8HuXH7JdbBrCnwMuYE0K5Wy0IMFYRJxaRBDnaAH9Pxu2dRWIkkvVCMr5
	pPNnMmWLEyKFwed+4Mbvs7SS3c1h1J6csnnjqpAF2GH1lVdkobJhlJwFsH8py85w65Yoedotv5h
	sict3EY0WqJ1xWvAf6YTkcIoqxXP7Sm5oOgW+bnaiRaqB6suahwlTYPrRrei4dbrJv+l8OS8b7/
	pTuvVXcTJt+P46h5xK04tqeoc4tkUCGnl8JlWNl40LJG94r/PjrsTlksxCP82Tx+AtZI1hJCRnk
	F/ETum73jvfFMXwLU934XGSwAPuh+f9FANF4ynSBLlkxoghkg4+dnoVAk+G0JmZqLMIiOg0W5I2
	3KZwichqPUGeB3ipmtZ4KyBdS50Dv6SsYobAyPif5wr6ea70EhM/xNbsbDJs=
X-Received: by 2002:a17:90b:3c09:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35c300fae56mr1675035a91.27.1774600277809;
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c09:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35c300fae56mr1675006a91.27.1774600277311;
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:17 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board
Date: Fri, 27 Mar 2026 16:31:01 +0800
Message-Id: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c64056 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6NDkWPVDNjMa_x_Yup0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: AjGqUXmqusYvrGtzR-2JoOWf1KS0T57H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfX8cPF+D9TnH9q
 z0feCitn86B+Cw53fqYnwVLeGrslpLvQMFoC+xwONW9EBI849mNfyJgblSWJ+5aEuidk7ZY44Yq
 eBnlZdWrfIJG0YczQVBPjJ52vVHYHnL0+gNqwY6mqH0kGgSFapZ7uOYXdzMXho1sTO0dJQ6QXKT
 VGt6XF/9DxeyEtsbLeKc0sT38ttPTBbx5HXyfdm1aDBnwnviNWY4K9CrFkHGiTvEU9hiRhtlGb+
 H/06l1XTBo7lCPVRXiRcMdCqjeTsW98wL1IyUTlcq1xEcJsb6BkxA5yqqOoGi9hKGKigCP7IS07
 C2g82mJMWJWfdaRTiGvrPBchQ2GZp0C+E0c02j+nMHFKn/sL31gcML8EWwUbaDH5gEzbGB2bha/
 nnrytxCmF1JBU65nIUwcoNm6QnWxWAI46nLId+V04MifgkXwYRcSPJ6KF6eQ4CsPv0whT6JBee2
 RfV4IBhieargKZ2pgpg==
X-Proofpoint-ORIG-GUID: AjGqUXmqusYvrGtzR-2JoOWf1KS0T57H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_013119_958990_1A8F2499 
X-CRM114-Status: GOOD (  13.05  )
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

The monaco-evk mezzanine connector supports a robot expansion board that
requires UART6, which is currently disabled. This prevents the expansion
board from exchanging data and control commands.

Enable UART6 and assign the serial2 alias to provide stable device
enumeration for the expansion board.

Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 565418b86b2a..0b26861eac02 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial2 = &uart6;
 	};
 
 	chosen {
@@ -572,6 +573,10 @@ qup_i2c15_default: qup-i2c15-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.34.1


