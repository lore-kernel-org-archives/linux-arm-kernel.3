Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1430CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9goarKXrejcnptWKL1a4RoJCaVf4LyjRaPXNsQdL7g=; b=Wb2ChwC6FbSXscLZKmbaFvabQU
	IhsPw4081mOHGqDws/M5qtem7Rm2/KO35DHX1aXDWeBCPMctgjGztXzycEryWbQ9g1LMvPoarGGQ4
	vNiylRI5EGBa4j8PPalXktmC3DzHqkVxhmLv7h6wyl77HH409eWy/WUG5APG9XzhlfPMPgfTnDVrh
	JTKSLrgUOMXA2KNADZrrdeolyHbyTOGNI0equMEn8C8/gpvCCnwqE2GJObLb5oMoxgg5NKbRrNBW2
	/+6931r0cKScKFF+dexArgB0MTTau3QDsK0AcqV283FisvvQjS+6Na4lT44oWE4j3NG8QdQJHPoPn
	lSFPJjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn2y-00000005zO7-1Ydu;
	Fri, 31 Oct 2025 11:11:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn2t-00000005zMD-01Tz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:11:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8FtuG832760
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g9goarKXrej
	cnptWKL1a4RoJCaVf4LyjRaPXNsQdL7g=; b=ITBqfrD9KSC1P21llYfAt32W55O
	4SLDJRJ/OtP/QbpirDdxwVOgbbKgAJ+9roauPKElJ/PrmiZyApVfa2fPqIiceJEt
	e2Lt6cd6IH9fwotdxfFyWNuq4vU3gOUuByBYVcXOZy0/s9TULR9ZLsog6Ab8cZUN
	AvxkjxUnlfOpwzogxGbcC2ND8Z4JO8z/QRMEQYqNNd6rXYLr0mswwKZmOAsk8v5E
	bG4SgtRqmmhyKJcc1x1+h24PsAkkD0Eb/q95lpsZEgDzBTsQIgCEZohMUy8GIDxO
	q9bMPZIKH9ThULkQkGtq9+v8la5HKziODr1EpOth0pBWvv6T4c96DXzr2kg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb20c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:11:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34029b3dbfeso2417108a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761909110; x=1762513910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9goarKXrejcnptWKL1a4RoJCaVf4LyjRaPXNsQdL7g=;
        b=X+xvAnn9s+A/5Wp07U+kx/auJNtg6YLmKE0lno7sQD05HPXtD5WbexC64PgfDVwkMC
         nkWhIsHckmVqbLypsP9HrahYFHwEZ3hQvsgUDhqB+BNEIoP4C25yIsV1PPgu5RNdxxpy
         JgKjgl4obONU4W2ey3KL2zisUjJJ/x76FqOFKVHdtR4Lb5JaTWmgvvTY+H+vkRAhviLN
         tc6rN9oK0ddY59okMVR9qS1KDdyFxOArm53XcQSOILDXJc6RJinXfv7JHhTQZG2MeVrp
         YAsAQdWbRSdmN9jAA6yT8QbsygQMVgXdeOWDmiia/h+ckH/9LyuOn1QwcfSp6igVBYSx
         psVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909110; x=1762513910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9goarKXrejcnptWKL1a4RoJCaVf4LyjRaPXNsQdL7g=;
        b=iNKcbBc6ZLLutQtFbHYdl/fO2hCSTX+MCNaBn/yH/rDVdEZIW883aEBm0nqPtWk192
         dCJ56aNs6Z7XEw9EqwdMcA1aJ5hzGek2ErD3nyzHTpp3uy5uxKXYQRG4sDHMiG/aYODW
         fPVNh/UOBtNGWN+vAGBPZ8GwD0uY+++/0DJsFaOVjblhbEBomwJ41m538NI1DqN3GdHu
         zzqkUqBKcTDPcGIWVeDgE+F/oafOcRdAuzc7ju3UJMW6AYGhfZVW/SwtyjO/AVwqFM81
         IvsJTYUVLj6bDvq0g0YYjXPA/og3c1FUMBB+IzPRtmVHVbYaDb88oZiP81d7atxxoQN6
         hCLA==
X-Forwarded-Encrypted: i=1; AJvYcCVwrjgTH+yyRMFUAjMiNOtcsxXmvilcZO8ZWhGsQUo3IDwCtfe/s3n1/sxG4JLbMJUkwPMUo5fjjQqZVNriPu3D@lists.infradead.org
X-Gm-Message-State: AOJu0YxbfCBQ4rCVymVXkMXt4okSQqqwv4nE/pwsczLVqI+9IcyVqdpT
	mrzeyfrsMz+kj0oFUKCKw74GfgAgR4WogO2n1MQrC005/YU9i2S0mB2z27uy7iPYordvYbqbva6
	blUH4FU+NpE2+IQEdStxzUX45ZSrqCtbkkZBqlel/1pRkIGFvAWSZhAa38NB+4z6Mefl9BE/d5A
	OX5A==
X-Gm-Gg: ASbGncsflh3bBkA6CiJqNw5wBeVbS0OKyNU9TAZ60wa3Cg/XwrjnUS3GFzlQUZg7nvv
	bJKMXZM9CbeON8ng5Iy/uKrOQLxW4UvVOSMi180ymFycKy3uSRKLgYSRX08ev5HqdXdpYNlrfoJ
	Xm2R/fkqDa/49MJvjAbIizf4YgnZX3uDoYDGUHMfIrQK+mKMpGXiP5Is0CFy4ulKLk1wPVefGBY
	EHz/PKj7txK74a5WnzsZB9Th52O8E+eVH9PjpMF5VzXJn9snJrg4OcXuGUOuteHEBiDnlvOk3II
	PF8gwTRoKhTOIKa0EV40J5JXDGumDRL9thGx4uj8QmjU1K+WN6ihNP2I7PCT95G+hj7NxI0YA1Y
	B8JAEb/QBjQ6EO3tehVfiVbqDEOGr2LfXcoTeEv2PvPBpv/iJtKkt
X-Received: by 2002:a17:90b:4b10:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-34082fab1e6mr4180240a91.4.1761909109568;
        Fri, 31 Oct 2025 04:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmS685dYTX2Y+vRXMEBcBVp+sEwzT1rSO7RCaXFn4wDl/YpqjIRecwruJfsazVGo4M/YO/YA==
X-Received: by 2002:a17:90b:4b10:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-34082fab1e6mr4180207a91.4.1761909109094;
        Fri, 31 Oct 2025 04:11:49 -0700 (PDT)
Received: from hu-punita-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b7e197cdsm1804407a12.4.2025.10.31.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:11:48 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>, chenl311@chinatelecom.cn,
        liuwei09@cestc.cn, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] Revert "ACPI: Suppress misleading SPCR console message when SPCR table is absent"
Date: Fri, 31 Oct 2025 11:11:37 +0000
Message-Id: <20251031111138.1262202-2-punit.agrawal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com>
References: <20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 135ZO7wXjPHTHKi44ZsG3X_WeqEjyPLK
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=69049976 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j6aNjNhqBAspAJ6NNroA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 135ZO7wXjPHTHKi44ZsG3X_WeqEjyPLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwMCBTYWx0ZWRfX8vqw8mLQUQ/o
 0do+WGd57ZJMsZiYgj5USSuXKtx3DyBqyPxi+kk2Fl7Al+FQpqV3ElnlpQfK9YfUQ9xrNNCwLYX
 XpTAl2vnfMHiCrkdE/NFl2YJA2/t9Eg2CNimb1A1bR7lt588uP6f89om2q0CoeeOOmKYeKJfcJj
 vV9W75HBfKwTROMnVyNuWAKwm/alhlEFw/QwSZV3FZFiElPKieFbccMDmZH8ndD+lTfGLXTX5Ae
 9d/PzyKpCPs/gQYx3I4cPprsuiD+Khv9RUzwja/uKXcAnaTEu6OwpwYuJtQl9N2teMa7Tt3y4Q1
 t2WnLesTTxEyk1qHC2/1Zpm5AwiSKAhVt78RWlOMBaJ1jqGiiiRoLjedbnG+9+zidYnrCFF8EtI
 eBwB2VE7LOFNMHDPVO5sHh28Po2xVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_041151_046697_7FAE4729 
X-CRM114-Status: GOOD (  16.59  )
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

This reverts commit bad3fa2fb9206f4dcec6ddef094ec2fbf6e8dcb2.

Commit bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message
when SPCR table is absent") mistakenly assumes acpi_parse_spcr()
returning 0 to indicate a failure to parse SPCR. While addressing the
resultant incorrect logging it was deemed that dropping the message is
a better approach as it is not particularly useful.

Roll back the commit introducing the bug as a step towards dropping
the log message.

Link: https://lore.kernel.org/all/aQN0YWUYaPYWpgJM@willie-the-truck/
Signed-off-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
---
 arch/arm64/kernel/acpi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 7aca29e1d30b..fd164e8a35b2 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -197,8 +197,6 @@ static int __init acpi_fadt_sanity_check(void)
  */
 void __init acpi_boot_table_init(void)
 {
-	int ret;
-
 	/*
 	 * Enable ACPI instead of device tree unless
 	 * - ACPI has been disabled explicitly (acpi=off), or
@@ -252,12 +250,10 @@ void __init acpi_boot_table_init(void)
 		 * behaviour, use acpi=nospcr to disable console in ACPI SPCR
 		 * table as default serial console.
 		 */
-		ret = acpi_parse_spcr(earlycon_acpi_spcr_enable,
+		acpi_parse_spcr(earlycon_acpi_spcr_enable,
 			!param_acpi_nospcr);
-		if (!ret || param_acpi_nospcr || !IS_ENABLED(CONFIG_ACPI_SPCR_TABLE))
-			pr_info("Use ACPI SPCR as default console: No\n");
-		else
-			pr_info("Use ACPI SPCR as default console: Yes\n");
+		pr_info("Use ACPI SPCR as default console: %s\n",
+				param_acpi_nospcr ? "No" : "Yes");
 
 		if (IS_ENABLED(CONFIG_ACPI_BGRT))
 			acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
-- 
2.34.1


