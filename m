Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0316EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wXn24FbqI0eHL+/K95XGoPvoBc60EqsV/lchLMiq93Q=; b=EHwXA8nAd8NQLN48ZMHd4Cqm9e
	tnHTZRqRkjOie+MCRzq4WHLRE7H36VGSjHp9w32IP2KZfJkalqE5pVgozSykj0b6ZWt1GLltpF8qz
	VfG8N0dbvEhR9iAOpczDh6kPRyYB/JUqORwZAOmeDd3ITzS08MIxHdM2rKXXdvoBEH1AlFd2DdL1m
	aMzMoGWlb7GsmZkznSwnt1PSXy209kJMgt4AeXywt4C7hQKIGQXOxCaW5lrLcmkIBl69uXb0vI64L
	AmjWH6eSm2kyYda9JfHhakMioUTaEg86OOwtfbH6Hhpo2//Zs375DvD2tsj9zOcNhhxGTfYBDJ01d
	vF2z/33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjm-0000000C3vG-3360;
	Mon, 06 Jul 2026 09:35:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjK-0000000C3OS-2pSg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669Gw39160082
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wXn24FbqI0eHL+/K95XGoPvoBc60EqsV/lc
	hLMiq93Q=; b=EjZAAMjeEnz+BDdOZ2AbT23Eo4YTijLxuAouLb/a29mc2B3JAX4
	MpPKUKLOdva1pyWgPe4xOAY1bApLhcS4HFIzAV72qALMvyS1a60e0LgToUVfyJTv
	T5AOwdJ32UxijU+Mok1qZLZDSr3aotogTaXyzF+JnMpu6CwojpA9/RePwE8p7Elf
	OZvpJ5bLsV8OaCNYhaSASzDWA00T1rqpr8Hi6KysGhUKdOxMN088yq0v5FM//6Mz
	Ltu8weWIt9d/IHlMtYLpCk3lWpjQ1vbL1W1+1iFSUAfgqX3J0N2/pVniiP4sAxFS
	6UyX6OpaViBSZx464FWIS0QUI0h3TIp+6QQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr258-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:35:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e56b2b350so580168385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330509; x=1783935309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXn24FbqI0eHL+/K95XGoPvoBc60EqsV/lchLMiq93Q=;
        b=MRa+/BSA7AOhd69/ig/aHwHks+/IdQxk/aaKg3dRgOdGrtn9oE4wqqKQ2YCF8P0CQA
         3HKTuddcniHTmH9dSgBubg+ThkNEXRZEn7UtailutfLvnIG3gtXgHQMuKvA7Q/qLLf37
         eAkAWBVo6MoJhDT4h4SICwQcUTca0tRfPWKP0/T7MtjeHcsmGRMYNnFqvi+MyHtt/DWZ
         zyYLW8BMrnMM+ZzNX+/YAhwdr9mG5cl0Vj41Th+k26VTEjNYsVkTxu/vjL04z356qaZu
         gfGPBy9wmAacOtfYbAo6/0pX3M8vRsqrkxt+eqjSNdbZIsUUl7RKTgBrszE56PneBW+d
         sLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330509; x=1783935309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXn24FbqI0eHL+/K95XGoPvoBc60EqsV/lchLMiq93Q=;
        b=Wvjl1UCfP11+1J0LBpDOH7Al4PEBzVQjV4F9qQ4vyc/Kq8RshSDTgIwKc4f+l9vc4d
         N8vEBEKqaU06lKqKm7/m2vXvtmIltBWsXOUMo5t9PreS1oFUYqoBvIbP1UP0N3HAGCSg
         2ro1y2Q2RkZJ7N23g2pEMOH+HH+8wvgZmBEqe2mfH6zvEKJFie+O0ZdQm8gIZ5YX9ac0
         IjXCE+EKcJHyuPbFC4tNH12Of1ZsZxfS4yqjzRZhDeFfFPNgzCqW3Qq/2ta0OY5qR7mJ
         ziM8iiNG12lepFeoISR3DdVLhylw2VT26FGl3mKzxsi0W4euAkGMzOV5KdbmRxU9xgFE
         f/xQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF8DvrLk0h1ZnjYFc/5tTW2OGBB0kb5fPAjA3SfcQuwxjlqxNhhrg49vPwARz2lxDnaTPDZ8mb6MnvuruJR5bq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz80wpoGbKU6SQ7GjVTa2X0gdzlfhAbpAlKMM/5FIJ+hQ2jjgZU
	VQyJbUKdDIQOTnSJADu3Uv127QmBJJ6HZ/Rll8eoVjTBaRZdRM38gmUqrlPNQTtMZ7NJnHV0HPN
	DaHgf5ACFJq3m47kVKiiZXX0+dyYV0FZ8WBLhuUA2jNL2NRl3LkQ5jVz3ZD8fb47CwMSa1Cryd/
	Y0iA==
X-Gm-Gg: AfdE7cmFgeSJndp9i6BkLSEjF/msc5xG0RPpGzKqxG3j8a7RKp5F7Se6I08djud+WGI
	ZFBVhX8FgJEurXMKYxqdtqGZQ4pxi0tNbNLiumYFT2eJhRPaKHAw3y/ud8fJJVWqYu/1Exvv4qq
	9BT8FqlrVy/WOf2uII+wru56i8RznCSl0npJXGMU+cQ2NvDxLerU9tXuv181Ju/eMKW9Tbd/u85
	kIWt6o2y6nTnb/DGwq8RpKkOX1sFi+J/orhrhDhMIINIB2wnOuWbBcFVVu/5V6lhB4qPP4LpqiZ
	zzxdtXgbcmT0tKE0+FV7aqc9dpCch5XumMyczCPt1sMMHJTsFffc7M9Y1qRuLYS5Fd7qvs/PUOD
	vwL5LHmyew35dTb6gBU/vM6pmL5A=
X-Received: by 2002:a05:620a:6888:b0:925:eb05:d194 with SMTP id af79cd13be357-92e9a47d0cemr1280547085a.57.1783330509071;
        Mon, 06 Jul 2026 02:35:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:925:eb05:d194 with SMTP id af79cd13be357-92e9a47d0cemr1280523085a.57.1783330504861;
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm23579984f8f.32.2026.07.06.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: hisilicon: Correct indentation
Date: Mon,  6 Jul 2026 11:35:01 +0200
Message-ID: <20260706093500.273922-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iABAFPjBDMTBZVy1KhWW4R6p1ni/SRjQJrMoNv9Fw74=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bEK7RyRA4If/TsWEBH+UP2ctwIQdzBcCyfI
 ZImY/kyd8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2xAAKCRDBN2bmhouD
 14a/EACNPZuLK1B+5wpUXdrSrvz28BwP40GujitLy2ltHRGoW8HkGUp8s1IXQZFoqXx/fTNLc0f
 VrnO9obpHxaLQXPZtafkfX0zt/sISb04x2dxnK9i+VOjDW+cUnymqb6gQxoOiDvkndLa023UPBl
 Weq369IHESH+SbkPIm49M+KGdpptIUTWGvaP7IBrmSNnJ390C7IbfYn+AVBbutuP1bt1ezoie3Y
 XI3WQ9m3POlAJgWJob0o4Xgr+JBQw0KscGNbaYK2VqO95vW3O/UUVpWYtrwFYvDanguA1YGc1Wj
 PgB/ol9FsHS+6Mnbsbv0znqvznKxro7iP7OUblKRfJIJxZKLEXxXxUESn5Niola6SgFY+gB/5lq
 OzIBQcKmJ9mrwBCQ0zIPtm01xf55X0p42zTnoeB2KreMIl2taX9rxFggqjiUlbBGPXEkWCuNZnx
 TTimwm10QBqeBylIfXDUa+hTGZcUNVRfk6560kY1vqAOI40ph6yshSpfWybIbJOXUPyXGP8WYEq
 9jcFag10KU5mdZGQe5Rh6VsCI4GXS4ZBMBm0upiFnDH80gCSkfICXI8RBrYgMHDuO4Yabc8DP4U
 1QcHZ82VRZCnQg4kwe6MZ1+8NBP943YV151Umx3L0EdsYsYUAsC2Vthy5yWO+frZ9v7qIqwzj4e raKeKzStOKxWavw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kx0pPA8K9Yk0kaBytgOIzO18Wx2PxDVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX0A/42PU/JSqv
 ATX4k0IBrPGBXvT5eEu0UUKUl80DC2icU/FHQrdXCX1mrniBtnnEe8ArtWPJsMeAx0kcqy35Wuh
 OpHtl9NT5SxGNYGH3aiaFAwiltXyTHalIyNGHT9yY2n0G4/OcL8GmaOipo++EFT+n8PEe3wWHPw
 xVb5QuvilyoWnZSm07MdmNbFds669C1VOeehRD3wNG5m0GEvcznwmOTVChMlYj8VBS0XbpVor8a
 evpAf1Tf8+EdAYLRkmGivriXcf3BvYeTFNS/N4JQuRFg227vxDPQygMMrgK6dH2JFJvkYvCQ58t
 TFmUtarFirhC+qIOh5iV40ApkISxyGILxq3arjPLRoP4SUASW1ezozE9uVlDQJDOrrmEWzlFIQ+
 AYdLy7VfN0iCLN1U+XXQrHu5eLeJ+3X3bKaFKOozeUu/o8s1tPzSJr0wBawcAhiXjaVUg+CBAJ0
 tvtMTzqM2p/85hAxjoQ==
X-Proofpoint-ORIG-GUID: kx0pPA8K9Yk0kaBytgOIzO18Wx2PxDVY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX+UrK2RHHBFVC
 2+dS6XaCKiHoFiY6s4JugdggI1KvK79N/KqyBI4ys25VaAj6KcjkV1zkLnidtVjAwWQ/LFieXVZ
 t5NAJpy/L+5I+0brfc6tcYnS19He4uo=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b76ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023510_733887_53F059E3 
X-CRM114-Status: GOOD (  11.87  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/hisilicon/hip05.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
index d0912ca5f237..2d376b3d30dd 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
@@ -236,13 +236,13 @@ cluster3_l2: l2-cache3 {
 
 	gic: interrupt-controller@8d000000 {
 		compatible = "arm,gic-v3";
-                #interrupt-cells = <3>;
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-                interrupt-controller;
-                #redistributor-regions = <1>;
-                redistributor-stride = <0x0 0x30000>;
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		redistributor-stride = <0x0 0x30000>;
 		reg = <0x0 0x8d000000 0 0x10000>,	/* GICD */
 		      <0x0 0x8d100000 0 0x300000>,	/* GICR */
 		      <0x0 0xfe000000 0 0x10000>,	/* GICC */
-- 
2.53.0


