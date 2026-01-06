Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E207CDC19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q+EbBMdORcMNNAGzctaUYJJ1+TjSsaPa24Zlu9XsnoM=; b=uh9SQFKGeEIINAtmXBBrsWOcGu
	xHQl/zTWLMh+rylB6g1jAY6yDJFnHNDuaDHltsKY5ZXIjz1kQ3wI3jrCWbBCBd1HZpqweQds11lVE
	1zrw39fU1HkLptEmoekebeGzKkneJ7whH4XDd6X0/KMGLKekZciStIQ/K7nnC+oaLaPZNHH7+85R1
	TBl81fXZgj2IdUuBghQpOKcc+vBPwodyAGXikGnm7qu4R7kRok0vi1GlWTYYRqEkVoVI15L2cYnf1
	mrC1Mrum0w/LReqOfT7jk7nLUsjMXW8pRU3O1QZ43zkHSSNfqylHA6AtB4n2xIZ2onJZInuFF57/f
	rh43ZN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7Jr-0000000D7IX-2RB4;
	Tue, 06 Jan 2026 13:41:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7Jo-0000000D7I9-0bp4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:41:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069WZDW4091260
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 13:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q+EbBMdORcMNNAGzctaUYJJ1+TjSsaPa24Z
	lu9XsnoM=; b=CNdGM1BHzOodLvt5wPAM3mf1dwGGoU4Hc3RsoPe6N2cusGhrrxS
	xKVtJJFkhA3D+a/Lq8bw2jSvufSSK5titcntH1hRl+b0JVkVrVKGzgVnn6geQjg2
	uNmc6UdD6+1gQFyVIOldHPbYk2p0R3Nl+L9a9nccAQ0RoWz2sFG0XJXnY0ouYldS
	E+No7HzQZ0GEKYc8inDLlpIumzJQxLzVX47OjbDRUPWR+12R4ZJ5YvcMA1zaWVDZ
	YC/3OWdd4MEwvEBOY9XuzBe8pefz8JLoFbhQiVj9R9RLb7RPfiPNTLNtfaG2yA9H
	1QfeNjdlisad2JGAl7fvW3GUf6frBXgL08Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun8msj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 13:41:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee416413a8so11842581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 05:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706910; x=1768311710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+EbBMdORcMNNAGzctaUYJJ1+TjSsaPa24Zlu9XsnoM=;
        b=REc+pyTU1J2Cy2xbrA5BG54GIAKHGsh0KuGECLYDB3BpollYFuLQuF7/aSONYb6nGX
         uQIM7B3OktnXr/p9t93Vr8H/EcCICHu84l3XVITpPDOO4QqfbVVkSBDFEQxFMAgAX+iS
         PgbY927yRTDr3UxXJM4ALzp0fbfoo4LkxHw1pgzOLIgP7YwsXOav5f78sK43/l5dXpek
         mfsdaA24uXahm0w6dfz41opQ6UYTqTkW+JnLzwj8wTF9ZxKk5UFo0oBt7ZPdaZIJZYpC
         eIP0r9Ygk60lhMa67monhWRoe9FCixG1O95B1n3pDdoiCrCj9f9MQMohjx+9zgiS8/7D
         QpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706910; x=1768311710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+EbBMdORcMNNAGzctaUYJJ1+TjSsaPa24Zlu9XsnoM=;
        b=KTnNKDCMuxWPj7h3PFmDr2vqbf+2MJT3WiAEl6ANtmvQIr2+mBuaYuL4pW+Wdyx6Tr
         WTPRvA4sd3zT+XlLn0FP3sqvc5ntfHDnfa57g31jDhf5pXJgebX5Q2Yo4otfE8R/4/om
         IFBrffG32WFpVN1/saSMfkaEuj9nSoTFdTkaQbdpsEQ0HSLPfGRzD+QN6MZEE2sSZgC1
         wMEqxxdwesW7Jn4dxSBgaDD0sL3MOYiGAlnj557yIHX3nG12y+B3Um11B4rrXrSVTetp
         CgT884YI6LHqi1rOf52Kmv4jWY4iiwy6KJs/HwS0+GVs3e8L2Xidxs68SySpKuT8eyiW
         bxOA==
X-Gm-Message-State: AOJu0YwgzKKBo4epY1KOJdAESoVPlXbGRhJoP5Zc2gIBRNpnCBoV27W0
	ExO9OmfrRJX5zyHSRWL0wJP13D9Pnzll00aJiikImoW4aIBdCZVdwL2cKXrED3xFV51RJ0inmST
	LSOfU/WmPYeRoD71MeB2W+xgNswJR/kO2CJFD5OVzHxMmJsXahfHNNTp7r4hBON5K55h96ffXXT
	mlqw==
X-Gm-Gg: AY/fxX7VMyvBITYwfetpTXPsQy30jjtO47ZdDnUb2emWWkH8yNiZAwJaY2KObV7ncvy
	RfgPNkGW/cKcuaVZZswT+mi/VK1yPa7drkRu96U40jBaa2Z5GPEwPB2npACItVH2wctTicY3dhq
	KusXCLPcsq1ji3h+hf4XB31whmQdaTrAA76vz93ya+LcthCuQKrawb3fU6ra6uvYKKIle9V68pR
	ldZEn+NQuw5yfzLHYWn8z8mCiVvfCj2QGDV/r5wYieBe+2lsEq71fTXxZALsVs4UA22YKbFjw8v
	OOUrRctLN34aFvoDyUz+2nrNT2s1MIkr8F+6oW450dM+ag/lx2gGbsPc3N/itA6DWl1NS7sF86U
	rvb3p0tFD9uuPAM08bL95zMoZNQCxauXaVQIAVJg=
X-Received: by 2002:a05:622a:2298:b0:4f1:bbaf:c5d3 with SMTP id d75a77b69052e-4ffa77de986mr30341891cf.59.1767706910203;
        Tue, 06 Jan 2026 05:41:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9O/Y6IUM42PPHVAKBn/I+rMLQPR3/OerWV8MU9bPamAukuZ4DFoHXldy6yo3R10P4l1fSwQ==
X-Received: by 2002:a05:622a:2298:b0:4f1:bbaf:c5d3 with SMTP id d75a77b69052e-4ffa77de986mr30341611cf.59.1767706909774;
        Tue, 06 Jan 2026 05:41:49 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3980:9f91:8651:f23b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dabcbsm4248368f8f.7.2026.01.06.05.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:41:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arm64: Kconfig: drop unneeded dependency on OF_GPIO
Date: Tue,  6 Jan 2026 14:41:48 +0100
Message-ID: <20260106134148.48257-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExOSBTYWx0ZWRfX2DPwtZ5CtaYo
 bZD0SN05+4o1XXdzTr0NWuMC0V3RMl+6Y9DLaNvvunMNdlrCfJlXMY1Qbu9UsfgvJuVR15fxlM6
 PAoqrras6Vgo5GTqaWv5IUorALNl87tBszd+MiOnvXBnOkKeeq9THiUuByTIUi4x8Kjo1VeNARS
 q2jTl6t6Xua6JAWy0MzYhOY1Q9nmtkpzF9mH7OGq7QAVJgN7rrKiLqS5/b2Z/Ip7SHBA3LepoTF
 Wvx+Yh4ADudtZ+YTocuR1thFQK6lRS6um7p5lBQw8CDWYexqETg24QT4SgAmq0IGZqLVxkxUqcO
 912K001936AFJeUVZAxzRVN81v55vfWoi/LuC5vrGN6I4aUbKXGAEYGybHcRGIOcHfQl+q+/cNB
 brDYQdmyEs9U5DvGTBBlGiyrVW7iT8aizJjTNitxnhlF2AUsJX++ORhZZdPwDoS2M0Gidq9Sw3e
 oeGP49B8nlaRq8hJI4A==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d111e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=W5IJ7m-aJTlBmcj5y3YA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: az2SAbOq3DarIzlYtZZww39T_mP_Tz-2
X-Proofpoint-ORIG-GUID: az2SAbOq3DarIzlYtZZww39T_mP_Tz-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_054152_301111_B0A8BCFF 
X-CRM114-Status: GOOD (  13.69  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index fff14807c965..933281bb6139 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -244,7 +244,6 @@ config ARCH_MVEBU
 	select MVEBU_ODMI
 	select MVEBU_PIC
 	select MVEBU_SEI
-	select OF_GPIO
 	select PINCTRL
 	select PINCTRL_ARMADA_37XX
 	select PINCTRL_ARMADA_AP806
-- 
2.47.3


