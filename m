Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFE6C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VjOTe6JuNXYN/ri0/mPFUtDvq6uSSkk7P97Kuf8Cs+c=; b=rSfsyTVBXpJzTkbblI0cKr558x
	IBsLbKY6O5t9u/zJMdcuQQsUAmgxixuFt6Vd/pOp1HKMpZwAnXDIeICARNugoQ5bw44BC3gge6UC/
	vO594iTQad95GEdxrOMo1PZYS0k6ahD/26/q51WGakkT77CfC/3Xu0x1iQC2htYPqnBrWNRcPFLmR
	vXWWANtlTdLuj5ZaMvwwdSOtbuIAEjT8MTb4mkOfHUPdr7mJHX6REb/hYSgbkglp80zJTDOIKTmvh
	vkccWn6joMoAijR2l65oCD7IsbqIq7MoJ1OmIbiVpp7bfQqpwx/D6AoCqTOYxk2jTZtuNEOWvu4bm
	acL5pwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ov9-00000007GOQ-3AzK;
	Sat, 29 Aug 2026 19:40:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ov6-00000007GMm-2rY0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:40:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx22a1856548
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VjOTe6JuNXYN/ri0/mPFUtDvq6uSSkk7P97
	Kuf8Cs+c=; b=RqPI5UCXhFjdssavjYnF771wLEgNVwFfE1Y7nU26xEzDhIxuxZ5
	MlcTT1jHK+ahtRsKKIMCj1K/QYvZ8UYt2WIWFzYTSq8GsQOIueEZ4sGZcFzmvrqq
	j0d0YGtMWDzORcZQJQrCICFJ23MpGXgSn173KwznBPlFktjhihATnYNw5ssJaEbP
	U/qWe+5Lf8eR7y/yBNj60kWlxht9kyAiJ2BnDoToa9ZTZkdxoVi4J8nSGw41X+cd
	IJ5Dnfsk3acHyo9OOT/Z5GCNDrutgPY+v1k5PoMQIIriUW2xpF0Ro0/AjNO4Nj7e
	dFbeziD/cyIPVjwfk30gOXMKGECWbQEi0XQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:40:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so25260321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032451; x=1788637251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjOTe6JuNXYN/ri0/mPFUtDvq6uSSkk7P97Kuf8Cs+c=;
        b=bJbMV61KHxe8woceCSj54eSVX+95rj4JNfmz7fjyjirKPJL2S/Qdug+micvlv6tchm
         rhEGgc6KGOG3LtJl0dMmL9Zgtfnw0UnwNDB+GgeR4lskY7ybTxnQJmVgTh87Z/AdhyTY
         oj9MWFG1J2eUKDNdz0DhQkoOr8mLwXT4OVIxQYQMTYuFiQBLQGWyst7UsXIAusi2BWJT
         xYnHH50LoAsTgi9AeXco9gQXr4N82L9ATtxOf0bv5c/sILAHtdIB83O2Y3vpG+rIOK3e
         kOZznyR+GYftDg3tYCyB9EdntRwqfip24dSXyMn4RRnZCXcTmQPfizyvun+edLSDgrUM
         FYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032451; x=1788637251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjOTe6JuNXYN/ri0/mPFUtDvq6uSSkk7P97Kuf8Cs+c=;
        b=jxWImyMAicBYQ+VvBxW3vm3d2b49S3/QWQbk00yoEFRSM21AGtWGiukm5vXnk6ffSF
         lKN+gZ/JkmGmq4zYPCuykajBcAVCfktqri4LiKpUKroXjNDP9eIS7ELvXgOA0cA+O4pp
         N0JHabim9T/4kg2PSfiVEVfVkTPlsaly0TJNwku8gI6+/KaDeMbazPw7wcsx2FuWGAJ7
         F8YWOo28+n1HHP3fmRwBklM+3mgwvhTb2ZTAl1rhchH8dzhiEhvdIa8INpcihOruhNhA
         fp14q95m582li9Z1fhQlXYixxeCWsHMHgq3FsjYs/OXBqTZTmAi1tHXEYQGEVVt/h40/
         05bg==
X-Forwarded-Encrypted: i=1; AHgh+RqBk3d34aIxMqX1ONvH0NWhZSTcMzFDGzziR6+urRNvcB7ad48nmdkxvZ0q8IZBqSgJxSgMSPKcYyAo9z/dvk0m@lists.infradead.org
X-Gm-Message-State: AFuF++l5lgc3QUumxqccn2J+EPFZCQNflc+K+t1O0krpDoutHf5UW37f
	iESFre5aLRiMRYBhv09cwZGnWmtqRmT1q7wZLfHGYuCZD8lpCvqnTEC/ncKRZKLHC3Gk70l6ujk
	XaewfJgBrYlaUdjWgp1EE+eoXGamR6nYiCnvfm2nWblr6wTpgVjKU0JvWHDQLCL4BYig03qqYJ0
	/6sw==
X-Gm-Gg: AR+sD12I4DC0xdS9kH95a4x8OjRjOV6ZQ6Tn0CJnQo6b65z0BQB0tgCn+NBwuHj73hO
	eFyiatLae172WtOeC0x2Exj/qolTlpyVRLxvF5Y3QVTqMcWMVX1n8h7MPh3yuDu/9mHSRGf9VFX
	OATvybfI0J7ZU7wsulmQVsPuLiOzkUXNdaLh6mH0iC7nJu2Cff8UBr/B2tgGvDlqNL7mqf6xCro
	oXEwV+ptTLWZJmSI6x3ldP1r8LiGKsCiNZyVhwn6/tbim2QEFQKFW637P5tFN6XK2t0PU6Ci1Bk
	boDbC8t8DM0PbFK3mw7cL/5CcpOG9s0MnoRzld+EgxioHyO0Cb0ZUOU5CF5B7P38mrMHSAT9TIN
	weGOl8FRHNg6q8Bo=
X-Received: by 2002:ac8:5e0b:0:b0:51c:ba4:d837 with SMTP id d75a77b69052e-52fb9419bd8mr185946701cf.18.1788032450919;
        Sat, 29 Aug 2026 12:40:50 -0700 (PDT)
X-Received: by 2002:ac8:5e0b:0:b0:51c:ba4:d837 with SMTP id d75a77b69052e-52fb9419bd8mr185946301cf.18.1788032450439;
        Sat, 29 Aug 2026 12:40:50 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2e9d9fcsm5882095e9.1.2026.08.29.12.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: marvell: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:44 +0200
Message-ID: <20260829194043.107875-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8684; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fy8LKWasxNVrGnihVPdVJryHw+RHQ5CvkTummbKZNSg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzW74p5DobpZjFQF2z/egxVys5hC+VtxjRaBc
 wNRZDVxt4aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1uwAKCRDBN2bmhouD
 17EmD/49fBVFyYf4yVHgQd79IJsFoFHaxlAvoOMgn+TZ3z6GDGia0TAbyBsqzx4a9lFk+W25iFi
 nugLx4UjiBiJM89lEoHMSghpGVM6ohJ9Z4zoHmVqtmeaqW+XtTYbYODKE1gyvFNQTePDjThfBQK
 UNvmUB5rX6Z70VueHdoGYPzf0q9ja0SpXrVr35cqfOiKlJRrPI/k7bDaxRcxuCfnHiUyqN4vraq
 ob+hK6SLXTbY4ItjiqP2lXsNdo8wmZ27b0YD4wRupaqeoZt/xhownoAfTMSQN0drToLPGxxnda7
 SuqAmaBowmQC37e+oIQymhDMk2QqDqBLMehTYmL4AmSSeI7VQtYRhzGcmhHBD2YTn+osQPeWp/i
 TaSGA7YrNjjoeLcq3nwhUqkdYv1L3m+A0SPasHms/KjTd7OUR1sIWHe2pJwaQn6Ro586Ym4/R/+
 spW8wD6/TnAr5vxDLELIC04pjy5Ba8MdloVC3SuKsbWqi3Dlikc0icQFcTvPRw8TOswEjMK+Pmh
 wwyKxJBF2KTQmuAAuLVMqH7AX1gTUYnuvzVxToknzVOv5uXOkvCbD5mskCsqGjlfMxTVpCxEfk/
 SqzvqO34c5r+ZBlHQ/eyhE5rKBYzXWmFu5wU3sNuD4fvbPqgheXcQN397gTanEw/r0fIRIA+bxP itgquDoC3qs+X9A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX0yDuBED3RAy9
 vIWYjlE4b+x9iT7O1N6VEdIWjxMPLYaODY0cYlvqD+GquSXaz0BC6GRttUdPu9UIzpmrNm09ajH
 HhScLJ+42PUIjYPMN2yQbstXuUzrXb9XvzoYsyFRcgj/VI6PLVEjh+0yZmcOANkgbcFTu0ov12T
 2j1VQOwBOOUlQK6dA1JZXfrt08a1hvNkxCt58yj+49xlQLaVQfFCAROxvHtyubloYeG0zVq/A6A
 2hN38eBk+eJ+vDn4YhuKxRSX6m4gn+tg92Pr56/jFAbUhDYuO8HGUN5HDlbrsU/vp8lb+fT0rS7
 EuzyQhGUr64bxlfwQmXLCLeVLjrnS70VlGa5Ve5bOK0oMwAeY/KJFo26QrTAbHXRGchKQFkaJoQ
 RHKJDU+l1uN5oNtXdpDi/4TjDYp1JD66PZm3RhudZTwNDXBpmJVw9bPsuQVVIdSxLFcPpgKzLg+
 hmwzDAVjFDLUrrVJwaw==
X-Proofpoint-GUID: U_wu81P-WzhwrcuBxtsH7eGLPvpqoEeb
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9335c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-NLHY6uWZgi1nc0qGTcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX8gGRNIdGztOy
 Iq6V3w3y1oUqZ7g7Bar8VKl6Nuhk3jwdMbkmbKLvVceEwHLHifl+eAFSxjhJHLli0J6u0Yp/cQI
 5hF5lgNFzOkST+4dFKjhyNOfCV+Sq2I=
X-Proofpoint-ORIG-GUID: U_wu81P-WzhwrcuBxtsH7eGLPvpqoEeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124052_738941_18483482 
X-CRM114-Status: GOOD (  14.30  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/marvell/dove.dtsi           | 22 +++++++++----------
 arch/arm/boot/dts/marvell/kirkwood-6282.dtsi  | 15 ++++++-------
 .../marvell/kirkwood-guruplug-server-plus.dts |  4 ++--
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi  |  4 ++--
 .../boot/dts/marvell/kirkwood-synology.dtsi   | 12 +++++-----
 .../dts/marvell/orion5x-rd88f5182-nas.dts     |  2 +-
 6 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/dove.dtsi b/arch/arm/boot/dts/marvell/dove.dtsi
index 062c86361640..75e2f9baf661 100644
--- a/arch/arm/boot/dts/marvell/dove.dtsi
+++ b/arch/arm/boot/dts/marvell/dove.dtsi
@@ -100,12 +100,12 @@ pcie: pcie {
 			msi-parent = <&intc>;
 			bus-range = <0x00 0xff>;
 
-			ranges = <0x82000000 0x0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x2000
-			          0x82000000 0x0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x2000
-				  0x82000000 0x1 0x0 MBUS_ID(0x04, 0xe8) 0 1 0   /* Port 0.0 Mem */
-				  0x81000000 0x1 0x0 MBUS_ID(0x04, 0xe0) 0 1 0   /* Port 0.0 I/O */
-				  0x82000000 0x2 0x0 MBUS_ID(0x08, 0xe8) 0 1 0   /* Port 1.0 Mem */
-				  0x81000000 0x2 0x0 MBUS_ID(0x08, 0xe0) 0 1 0>; /* Port 1.0 I/O */
+			ranges = <0x82000000 0x0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x2000>,
+				 <0x82000000 0x0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x2000>,
+				 <0x82000000 0x1 0x0 MBUS_ID(0x04, 0xe8) 0 1 0>,   /* Port 0.0 Mem */
+				 <0x81000000 0x1 0x0 MBUS_ID(0x04, 0xe0) 0 1 0>,   /* Port 0.0 I/O */
+				 <0x82000000 0x2 0x0 MBUS_ID(0x08, 0xe8) 0 1 0>,   /* Port 1.0 Mem */
+				 <0x81000000 0x2 0x0 MBUS_ID(0x08, 0xe0) 0 1 0>; /* Port 1.0 I/O */
 
 			pcie0: pcie@1 {
 				device_type = "pci";
@@ -117,8 +117,8 @@ pcie0: pcie@1 {
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
-				          0x81000000 0 0 0x81000000 0x1 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0>,
+					 <0x81000000 0 0 0x81000000 0x1 0 1 0>;
 				bus-range = <0x00 0xff>;
 
 				#interrupt-cells = <1>;
@@ -146,8 +146,8 @@ pcie1: pcie@2 {
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
-				          0x81000000 0 0 0x81000000 0x2 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0>,
+					 <0x81000000 0 0 0x81000000 0x2 0 1 0>;
 				bus-range = <0x00 0xff>;
 
 				#interrupt-cells = <1>;
@@ -772,7 +772,7 @@ rtc: real-time-clock@8500 {
 
 			gconf: global-config@e802c {
 				compatible = "marvell,dove-global-config",
-				             "syscon";
+					     "syscon";
 				reg = <0xe802c 0x14>;
 			};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi b/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
index e33723160ce7..9f63e3f9eb1c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
@@ -11,14 +11,13 @@ pciec: pcie@82000000 {
 
 			bus-range = <0x00 0xff>;
 
-			ranges =
-			       <0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000
-			        0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000
-				0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000
-				0x82000000 0x1 0     MBUS_ID(0x04, 0xe8) 0       1 0 /* Port 0.0 MEM */
-				0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO  */
-				0x82000000 0x2 0     MBUS_ID(0x04, 0xd8) 0       1 0 /* Port 1.0 MEM */
-				0x81000000 0x2 0     MBUS_ID(0x04, 0xd0) 0       1 0 /* Port 1.0 IO  */>;
+			ranges = <0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000>,
+				 <0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000>,
+				 <0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000>,
+				 <0x82000000 0x1 0     MBUS_ID(0x04, 0xe8) 0       1 0 /* Port 0.0 MEM */>,
+				 <0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO  */>,
+				 <0x82000000 0x2 0     MBUS_ID(0x04, 0xd8) 0       1 0 /* Port 1.0 MEM */>,
+				 <0x81000000 0x2 0     MBUS_ID(0x04, 0xd0) 0       1 0 /* Port 1.0 IO  */>;
 
 			pcie0: pcie@1,0 {
 				device_type = "pci";
diff --git a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
index d5aa8b505cc0..cc88d5324983 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
@@ -104,14 +104,14 @@ &mdio {
 	ethphy0: ethernet-phy@0 {
 		/* Marvell 88E1121R */
 		compatible = "ethernet-phy-id0141.0cb0",
-		             "ethernet-phy-ieee802.3-c22";
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 	};
 
 	ethphy1: ethernet-phy@1 {
 		/* Marvell 88E1121R */
 		compatible = "ethernet-phy-id0141.0cb0",
-		             "ethernet-phy-ieee802.3-c22";
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi b/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
index 5e0b139dd4fb..4206529b4a52 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
@@ -168,8 +168,8 @@ gpio_fan {
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fan_low &pmx_fan_high &pmx_fan_lock>;
 		pinctrl-names = "default";
-		gpios = <&gpio0 19 GPIO_ACTIVE_LOW
-		         &gpio0 18 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio0 19 GPIO_ACTIVE_LOW>,
+			<&gpio0 18 GPIO_ACTIVE_LOW>;
 		gpio-fan,speed-map =
 				<0    3>,
 				<1500 2>,
diff --git a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi b/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
index 6b7c5218b1fb..de34bc2446ed 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
@@ -281,7 +281,7 @@ gpio-fan-150-32-35 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_32 &pmx_fanctrl_33 &pmx_fanctrl_34
-		             &pmx_fanalarm_35>;
+			     &pmx_fanalarm_35>;
 		pinctrl-names = "default";
 		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH
 			 &gpio1 1 GPIO_ACTIVE_HIGH
@@ -301,7 +301,7 @@ gpio-fan-150-15-18 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_18>;
+			     &pmx_fanalarm_18>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
@@ -322,7 +322,7 @@ gpio-fan-100-32-35 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_32 &pmx_fanctrl_33 &pmx_fanctrl_34
-		             &pmx_fanalarm_35>;
+			     &pmx_fanalarm_35>;
 		pinctrl-names = "default";
 		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH
 			 &gpio1 1 GPIO_ACTIVE_HIGH
@@ -343,7 +343,7 @@ gpio-fan-100-15-18 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_18>;
+			     &pmx_fanalarm_18>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
@@ -364,7 +364,7 @@ gpio-fan-100-15-35-1 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_35>;
+			     &pmx_fanalarm_35>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
@@ -385,7 +385,7 @@ gpio-fan-100-15-35-3 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_35 &pmx_fanalarm_44 &pmx_fanalarm_45>;
+			     &pmx_fanalarm_35 &pmx_fanalarm_44 &pmx_fanalarm_45>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
diff --git a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts b/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
index 75ab913b21e5..1d803d1d1112 100644
--- a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
@@ -22,7 +22,7 @@ chosen {
 
 	soc {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000>,
-		         <MBUS_ID(0x09, 0x00) 0 0xf2200000 0x800>,
+			 <MBUS_ID(0x09, 0x00) 0 0xf2200000 0x800>,
 			 <MBUS_ID(0x01, 0x0f) 0 0xf4000000 0x80000>,
 			 <MBUS_ID(0x01, 0x1d) 0 0xfc000000 0x1000000>;
 	};
-- 
2.53.0


