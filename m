Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844ABCCA472
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 22:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZN0zNeQuSy0FOH1JSb8z4d333Fi57TmivfiAw/H2uco=; b=DtWSgs1qEdd5n3w9QDI+qSOCgR
	qztwrzXI5Ei1StxkieBXVVW8VG+xWlYjMAK14Qw3V5HwkifCofTfl22bPN3B0mGvIjzdPZSBQ323C
	ZqSLjSG+6mEOr4NXGnrk732ph9+U40GarW88LBWpr/5IBMutJtwHOHhSyZDP9+S1jNdTvlkxqjuU+
	MiMEiv86QNriDqmORTx39nyH/dRIrXsLlNvE9iDz+Sa5PtGNKLHlm700TIeXKXHKYi0a7usg8TyLa
	J3tRSV1UbkmaXCigS9XvPYcnTS8FWaT82NFzIaAIThTI/ar7rGlGhGy2STjqqIV0HNN4z5oLzGxkM
	Zw+h4ROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5X6S-0000000GhSb-1Tgo;
	Sun, 05 Oct 2025 22:21:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5X6P-0000000GhSG-0CVa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 22:21:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LHDFf020509
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Oct 2025 22:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZN0zNeQuSy0FOH1JSb8z4d
	333Fi57TmivfiAw/H2uco=; b=pcFHgVIZwPHzv/d3b/H8liNyulZlti0xUcS8Ot
	lSkY8E9DDpsErhKVDWbB4DCnA2WHe/VkjhCHtQQBp7Pqy9Be7KoRPX/1cyY2T4xv
	vkzsuwECmNxGSebCEorQCtnxOtJrDgEt5HkuV8FLQPQWpi7Ub740q1VvG0L+LQNW
	oLsRlex2VZ+gFeBeNnkZpMYaAgMq3Ad3hI4tfK49MREidyYoY+2kBOL/Jl0pH19+
	cgu8W1YWinbuZ5eaPA/nUUiekRM/CG4TBA2oaHKmXayUP5Wms+yvYUfBLPG1xezl
	apVjIvfrLzfsf9BH4XOVzO0tZgs/rzAJMxqF21cJKHpuYmaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dtr8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 22:21:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-82968fe9e8cso925388485a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 15:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759702869; x=1760307669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN0zNeQuSy0FOH1JSb8z4d333Fi57TmivfiAw/H2uco=;
        b=Noq65eKMDdyJBS8g+OlmdDFSoXcS8AocjgsfPEhw+Zrm3q7pcNeB+u2xp1qwu2WZve
         sxQtBhcv6P4C8AnRacilBYuAvWRx6MszjKWUwFDtjF8eX8TEcqH2b4TkxlBAjcFDNKEM
         LL+EysdtcFzjFrxxPlt4cPD1J3wrj4C+j0tGgojMpJaAnhEwGFG1apUvfA70BfEiIWSV
         5rvSZW1bDzXUylC+b0eUkgygYPl8Fe7jX/LU+UtCBWh46/TskUHvCgS+eKsfQKbbi3A/
         5SPfB+pJZ0tKZZfxvejYnPkX1B0LLVpJtlM74BiwybNlyUxefFfodXXBkoYFSeiehV3i
         Nxjg==
X-Gm-Message-State: AOJu0YwmU+WRk/XzASojVLmpEJI1OI9J72At2f7fgcitt/c36gSdxsrQ
	d0nNN1t2I0llnVBrjvoyIC2slSVerAh72uyxaqZCDsBNnKpt7pcWrtUEBELA1i5Ggntim6/GCcE
	adYEJHbKEN5TxU02P8ZAHZnoe7hO9Jd4x1KkSgmFBzXsg4A/b/8wQqeQCgzqzLSB4qYecTNhU7v
	49fg==
X-Gm-Gg: ASbGnctz2JSTiOVtUikdy7BQCoVav7gV5ZI/T9Qouex4N7X7gV/0X+eaQjARsbcKevS
	aWoWA6Q5dUjXoUKwpw5vkka7LGfqTAhh9SVu+UdyBGSugrOpTw75QayfaaBCLQtQknbiBSWoZUi
	LffyVTUIHmamu4xpKznyEVFkQTw7mi+AxbLZFmkFjIsKj2OhxxJyr7xRqHoaJIBoDvb5SPtNr7d
	xHUBYGN6bItlk7HNvGExI8f509eFteKBta3bkT766A8h0dz1Xs1u2xS0ct3PXtsepeAU7g9frI9
	FDwomckgTM5PlE5LGhNABZCz+Dr4C76DUt7rlfYgEKjlayAvrLjGfZCVmAj/b5yfOCqbhHizuor
	6jkR/PafGDeV1yJTqUUUraDA+jA4NmarNJjhMAYzWCuti54BkWjJGoRxnqg==
X-Received: by 2002:a05:620a:190c:b0:85c:d089:41d8 with SMTP id af79cd13be357-87a352531cemr1458016185a.23.1759702868538;
        Sun, 05 Oct 2025 15:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ6WzjWlWnBxeQF7fn8gKpoizrFTVCmfeFkh/HrNxy52ErmbLxJ0Xw+wdHq57nckXXojGBLQ==
X-Received: by 2002:a05:620a:190c:b0:85c:d089:41d8 with SMTP id af79cd13be357-87a352531cemr1458013685a.23.1759702867950;
        Sun, 05 Oct 2025 15:21:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4f99aesm37795881fa.62.2025.10.05.15.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:21:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 06 Oct 2025 01:21:04 +0300
Subject: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE/v4mgC/x3MQQqAIBBG4avErBvQ0BZdJVpI/tYs0lCJILp70
 vJbvPdQQRYUmrqHMi4pkmKD7jtadxc3sPhmGtRgtVIju3yMhivuyimEgsrO2ABYZVfjqXVnRpD
 7f87L+36xCEDVYwAAAA==
X-Change-ID: 20251006-arm64-text-offset-a45fee505c4d
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4joJ20LHDFSg5RdA2ItH2zZvSquG2d2D43NZi5mcvLU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo4u9SHgUvukSUl7J1uzkT6POW7ukDWqBWl7Foq
 qn3VpCpH3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOLvUgAKCRCLPIo+Aiko
 1XszB/9lTye5852/UUlqhaeEbMMJxq5qLxytLQ++7EEDhagjU0Lwq+Tn3IKVenaztnYHBVg3PU7
 cIph5LO2GqfcS4733VWXzcij0/0zBihdi1ndkuSA8GvtbTI2xEoy8OARQ7tn1Ws6M8QkDG7f8u1
 dislgzeh35upEY2Sa/BVDEKzqxJL8KBuIGL++G/W61IuJHGkBqClZVie9ZTB31neLO8nRUCdxQo
 MOGaaf5D0Jn6BkJd4ZgHPwosuNAUmj0h3STSqeVuSeQBVSMUGvMWCT3zGxanOiLQRX55zpBRjwK
 F1uvhAGP3n5WtBTdB98HPXTT7a6rOXH+3TJNjxS3tlrqx7Bg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e2ef56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nn9dliE4zSBnsTKvRegA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: To0yOM3FdFNx_yuQ7Ho9vc6mmSZiuEHF
X-Proofpoint-ORIG-GUID: To0yOM3FdFNx_yuQ7Ho9vc6mmSZiuEHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX8pPpE/Ya/LOo
 11jYOtqxKOWuq5tbw7y96aScL7JSM87KqL/6E73SH6Cc489GXgsJFC5HurT857YeiANEZ3b5q3a
 xa2+bvdCR7t7Q9sLHlWE51mQjjOdr7P2/RZitQWO55AaTLacFuHsbLiL/J3dDFcsbHy+xfrKos5
 A8HB7S62+qf7dTbD7lpo/p7zyEnZX7qEDaWyKSs/Ak8Bn0V/OT3xJaJGLoxk5JBhgO1pll/0PnV
 AIg01R1KMiIMfPzzn5TMtza5Axengroz96wgwY+p5nY29zANFau3DkQe2YUBcgxDCqwBvfLL2Pc
 JLqYmAYiuGK+bomHlF+xpvyCvuST3NJHSgerazAWzh/UvS/rpsEnd8da8jPEsxeQtX556Mthlqk
 OYY3X8xTUElpgX4YrUt5eFhYC3h05Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_152113_102184_D9D8EA07 
X-CRM114-Status: GOOD (  17.77  )
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Historically arm64 kernel contained (almost fixed) value of 0x8000 at
the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
in preparation for removing it entirely") and then commit 120dc60d0bdb
("arm64: get rid of TEXT_OFFSET") replaced this field with 0.

This caused no problems so far, because nobody seemed to be playing with
the extremely picky Qualcomm bootloader as used on some of Google Pixel
phones. Current attempting to boot the Linux kernel on those devices
will fail to load on those phones with the following message:

KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
Error calling BootPrepareAsync Invalid Parameter

Since the kernel ignores the field, set it to the expected value of
0x8000, unbreaking boot of upstream kernels on Qualcomm devices.

Note: I purposedly didn't add Fixes tags, since those commits didn't
break any of devices that were supported at that time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ca04b338cb0d173f6d9f5bcee52f6d3d06552599..05e874977de376835625f52bfdda78305dca28b5 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -60,7 +60,7 @@
 	 */
 	efi_signature_nop			// special NOP to identity as PE/COFF executable
 	b	primary_entry			// branch to kernel start, magic
-	.quad	0				// Image load offset from start of RAM, little-endian
+	.quad	0x80000				// Image load offset from start of RAM, little-endian
 	le64sym	_kernel_size_le			// Effective size of kernel image, little-endian
 	le64sym	_kernel_flags_le		// Informative flags, little-endian
 	.quad	0				// reserved

---
base-commit: bd773c01d149aec064ea0fc890a54be277acfa3b
change-id: 20251006-arm64-text-offset-a45fee505c4d

Best regards,
-- 
With best wishes
Dmitry


