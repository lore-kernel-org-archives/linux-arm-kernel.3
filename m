Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DBBCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qx3IUO2E6Fo3l/9N3ni/fAxMLk1Wml7tG2+eTCjaNAo=; b=bQry6BB2/IYCQR7WSPIBveud2B
	eAkOt2rmXbQ7m+BeKbcNeLbgeaZgfwk49Btt1RwRsNr/bLMjSfgrsGl8SV29kRhig1bJ2uTFF/56G
	gLanc6bNHIYDnvwF3kmvaI+8aBuNPX8CeXOeqIcY+7VsYtNAGQAXMkaOaE7V9/IL1OY1SbR/vyjtM
	xDcbrGW9EibSl10+pxSE+z7rO2x74Vk4Foe0STBWrCe4FNvISdcGVPfMnY4dSZ0JTklXBYTf9Gh6E
	Wgjy1F67MtFg2sBWz+zW9YoDewbSAzlnbkyD80NJu13c6Y4ce2rGi6KWVpMs3DTD3mNJC3qR0OkQZ
	hh6PkDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDO4g-0000000E8JW-3ZfU;
	Mon, 27 Oct 2025 14:19:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDO4f-0000000E8JN-42SL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 14:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Qx3IUO2E6Fo3l/9N3ni/fAxMLk1Wml7tG2+eTCjaNAo=; b=F31Mpr9107+ofSUdbaPUF2h0Az
	3mpaCmvpWed30KKl2sxgThuOpZOMpBIZW0goO4Mua/7r3i3h+pl2EpWfSIs4CGiZfu8JaAb74Ez1p
	1hasazdgTFFzW33g3wqN31f2JA4cFyqzZOpXEGrimXZQXsh9pdyEoMM0qqftzjxcte5y+k/4PC0zi
	pnGwHu2gfzVocGOqzYAKtFTctSKnanfK3E0Dc33juFL10uADnGDEFRzcZkaFBEVMuQvqobSpEEcYq
	aRgjG3LW7RMzPrdqmuOecKnxYk0nE+FF/KNqzkG6gfVrmjmLPK/0sDzEsdnwUvFd7nBLCzyk6LeQS
	PdYsodlw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNCs-00000002HiD-29r3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:24:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8MYqH783388
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 14:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qx3IUO2E6Fo3l/9N3ni/fAxMLk1Wml7tG2+
	eTCjaNAo=; b=NOAzgqD4d3Qm0rgFqW2gYYImaUgP5bAXwQAokDWZ8d9tZ0EHpl5
	ac0CwZLOT6HFA7iP1vvjzII4xDZDf8InxfuT6Q1Kb+LbBa4NG0cLMoyiL41w9Ds7
	x+5n4n0+FuM4bUNbEnbgNj5dDXEta8m3/t5yrCWCww/q15zrBUlIN+1megJo4Did
	gI4nBp/cH/zRw13TaHavPBqWCQjk65VLpLiRAZsGNuQodRDGllfwZ6zSQ2SxBbza
	QBDJeqqut2j8WWSiQKrCitgRF34zXOISWMeuPQEVxexYI6csE+p3f641piEorLjK
	ed18vEous8Kiz8Ms/oEcg5p3RDeMsDhvsPg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4u1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 14:19:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269880a7bd9so48306915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574785; x=1762179585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qx3IUO2E6Fo3l/9N3ni/fAxMLk1Wml7tG2+eTCjaNAo=;
        b=v2wVtQYpHFd8xkn2Fm3oYc3TZeLvsXk6J8OyDlo0smUHo9F1kmc8n9SOKFVRGunE1j
         sGf9qoI4rGE1EC574CKkMV+Tl+GZI9z/8jL68mufWnFe4lbMi1P1fsGxAeMI3QcRoSyT
         Yoem4oyCbf5eyHCH9ZFjZG3YmlnUkCpVbfU0cRJg0gX6LQA8OIdsauDhwjX82wChWqjJ
         pMXWHrn+QOvyt69eSUYbYgMUdbm5mCowYti2PrXwUp0V9NkQKq+cOsj174WmPFIrfCwy
         Wro0p9HuhKDUfzq7RF4pBtccWKSlHSUiOdruYtdXOjHylTR5VU5sklG+mzjmaE8ptL1D
         Ju1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7keKdw4xoZ0tdn0RD9g0s18MNfZV9D8d5dx7fboGhLtQ7SaBwLxz4mEiDjoLW6jPtTf0g4nYqQzFYbICu4+qe@lists.infradead.org
X-Gm-Message-State: AOJu0YyLzoigUH7zJS6PL3F8K2EhtDt0kZMcSzbtc1XOzlXqMiFaJbQm
	XLaPJApYaTqtFdBWfjLaXyUOotX9MY+JJY9ZwIXg4/YhH+8MX3Kce4uU1zzxq1cBYhrHpPhZzb0
	J3peYhVVj2glp4Tim6HFO1yHo4hXzpHPQ27tK8GCyqbLowWwg+jfMtX640J7Ob4kCV+kWsmRBYH
	t+rA==
X-Gm-Gg: ASbGnctLcnHoJwVArn+Xx7i4ZHpdLdGtZE8lCY6YaXg+3QDCIO/6NdknwA2sXPni/rK
	u4Tc7X6KJ9hFTCjP7nQSgvVR37Ln8T9P/gTwqPS6NDir49pgdO4uWhjhjUXknUL1Vmze2qHetLd
	xMfpNYgUKdRIMfFIqh9dqwbuM2Y6QRrlVRvT1yTre3VZWN5C2bfPdAHbHQd5IcCfBgS4XTfp8Qz
	8DhUuq1iIaR2RIX/CkKZWDkOw+KrrcwFD9OTCtW+wfbvBOBTH8ROla75QJmlDSomHL5xajONBsM
	iNKubVIPcIJz+zUAhleIbC2aYAryB+vPxnc3ONV94NaqUQ3SB2rVvR+6uQEe7ZfxF7tMuTdti3a
	6GnQZTgHUYu70R8HinPgmNKujz5uo3u8w4YuKsvR+maj8VIlZE2KB
X-Received: by 2002:a17:902:ce12:b0:269:4759:904b with SMTP id d9443c01a7336-294cb6a76b9mr468725ad.58.1761574785274;
        Mon, 27 Oct 2025 07:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExvrfR+k2bxHu4WE1FcWWwIJx/pEgGfmAedtlb2r0MJvVY54fZi5aQUGEv1i6ShpGJ4LdyIQ==
X-Received: by 2002:a17:902:ce12:b0:269:4759:904b with SMTP id d9443c01a7336-294cb6a76b9mr468395ad.58.1761574784655;
        Mon, 27 Oct 2025 07:19:44 -0700 (PDT)
Received: from hu-punita-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d230basm83818175ad.46.2025.10.27.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:19:44 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: guohanjun@huawei.com, chenl311@chinatelecom.cn,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [PATCH] arm64: acpi: Fix incorrect check for default console message
Date: Mon, 27 Oct 2025 14:19:41 +0000
Message-Id: <20251027141941.3089914-1-punit.agrawal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9Y3fsEu3xn56m_oQrK5IDAv8u7e7dDd7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzMyBTYWx0ZWRfX2z5uXFR+Ge9Z
 HQe/TLfPmWo8SpUaJHhRjaOKcT59G7EWvs0Rd6XDXKOCnTP7f8nnuOPOuzfp+OM/7kVV15xWg4j
 rksJIkv0I9/N0jlrz2ksyWiG2dvlQoWq1++cvj8VhGjlG58RtkiG0MC+Ew50JNdtXZK8zEcx173
 pHZbAyLQxVCbRJKi8k05abwj0qNmNnuVraBfYNyg4r4UDDUTEnFIlUgSpseS4tgi9CXWcW6LuxP
 VKx+GIG/OZaoHNUHHVYDQp5dfJU3uyZH3muCJDP23a+lSu1Pwfu4eEKuIkDmILYbAVt2gsyeMo+
 om+8OpG3Yscsx8VeGGpC0WkugcjrWqQoRERnL0m4AnhwADXh1SfKB7TjE8KIz04yn5irAcUcpJL
 qPkm65w+xt9fksByosLCoNJyaR2/NA==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff7f82 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EWBPczn9GtEGnfwowZAA:9 a=324X-CrmTo6CU4MGRt3R:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: 9Y3fsEu3xn56m_oQrK5IDAv8u7e7dDd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_132418_865043_960E0104 
X-CRM114-Status: GOOD (  17.40  )
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

bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when
SPCR table is absent") mistakenly assumes acpi_parse_spcr() returning
0 to indicate a failure to parse SPCR and prints a message to the
kernel logs accordingly. In reality acpi_parse_spcr() returns 0 on
success and -ERRNO on failure.

Fix the faulty check to output the correct logging message.

Fixes: bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when SPCR table is absent")
Signed-off-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
---
Hi,

After sending a patch to fix incorrect parsing of SPCR[0], I was still
seeing inconsistent logging on arm64. The result is this nugget.

Considering the pointless churn - I wondered if it isn't better to
drop the message? If others agree, I can send a patch (and revert
bad3fa2fb920 while at it).

Thanks,
Punit

[0] https://lore.kernel.org/all/20251024123125.1081612-1-punit.agrawal@oss.qualcomm.com/

 arch/arm64/kernel/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 7aca29e1d30b..2fba72d51d71 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -254,7 +254,7 @@ void __init acpi_boot_table_init(void)
 		 */
 		ret = acpi_parse_spcr(earlycon_acpi_spcr_enable,
 			!param_acpi_nospcr);
-		if (!ret || param_acpi_nospcr || !IS_ENABLED(CONFIG_ACPI_SPCR_TABLE))
+		if (ret < 0 || param_acpi_nospcr || !IS_ENABLED(CONFIG_ACPI_SPCR_TABLE))
 			pr_info("Use ACPI SPCR as default console: No\n");
 		else
 			pr_info("Use ACPI SPCR as default console: Yes\n");
-- 
2.34.1


