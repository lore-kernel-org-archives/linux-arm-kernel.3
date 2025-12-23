Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4BCE6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=enkE1tTZKHT5McMw/4sLoei+1i1ZWXAWJbotyOg3Oyo=; b=BhjrP99yyS1VR46NLbz6hhQFfc
	NXN/hOfv73ZtvQvfKC9ldfjfbAMuoS5o1Royf1cHqz2pTdZUmVsoeciIwbUzLOyoUupgo9MioPw+A
	eARtSvI4C+0MO1uBMIKCtvVRfEhYV/DGqIOEgDJyUS51RfM/CjO9UManV62U18OqxqhmFHZBGIBAj
	IVUPGaWXPiWpte2EZtfDFAD+EKybSXOzXr6ore181rnw8HUpeoSPkQ0a41M9WyFfSMnjN0TSKMCv7
	7tiV2kphAvpw7i9HU4OLfAlzyeZ6zPYmrXl94pqFcAhexHZRrwZDsbve9kHPPTMjZtEjssLB2wNzX
	KUMFq68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Ff-0000000FfrO-1BcX;
	Tue, 23 Dec 2025 15:24:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Fd-0000000Ffqj-06Bh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:24:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNElpBJ4044542
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=enkE1tTZKHT5McMw/4sLoei+1i1ZWXAWJbo
	tyOg3Oyo=; b=PkJmdE2+bw2xyH3PzDA4ovUenuJLthPLkwFU097F8HyV/nexdq9
	GCu1UJqdU9Mxvxx/nDR9K79bvnIABCMU9ghY0eM4bo4NbkwuR1xBpKOBX+0Auy2n
	j9qZ37A+d2GiaU0Rx+f2KtXnvv86oWyQaSelaR9rIa+CKI5M694palNlgWEjybI1
	9mi7bgahD4De1K4tvLZa+lfQS1phd5wktusvw5nZZrwDnDm0EOzhjJ4NFPlszWva
	BbQcMxj5kep1GOBqa7/A7EBdwLOdvQPQaNu9RmDUUtMrXXlnaNbpGsL3g5+gGtqk
	kHeWW4mxXyvXnzRGYxw7TwsfLdTOyshLWOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhb2qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:24:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so109151941cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503479; x=1767108279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enkE1tTZKHT5McMw/4sLoei+1i1ZWXAWJbotyOg3Oyo=;
        b=Ef6Xik4ixjURcryNLC0cpkbxAogLHNkg6hLM3AstWcHglnIrdREK1VuQ7uTgdXuL0e
         TRNRxVJ7Wnhg7t83cX/nueYgMDTjAC0BXsjUIeyxc3R6bLmsLbPPVyCrIp/3U8ChZTuA
         7QWNtlg6addIk+ZBGRYtx8jfDqeLATFUqCsUvebbHdeBUZmTMSemRPo4D/cQBfx8eGcU
         dxTryRyRW+G6lgqB2zDX5SQsHaof4v/ZKIjoczxhqavyBMfij77og6n80ph6oM43z2lw
         qJLkrpAp/Bn/GCGme9U8hXIzyotpi1ehYMzpM2j5DFAieE/OKmMwp5R2foy/UzB/4RHA
         cg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503479; x=1767108279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enkE1tTZKHT5McMw/4sLoei+1i1ZWXAWJbotyOg3Oyo=;
        b=JRxkNqFXMjzVAuJYTzB0Wgqeup61C5xsT4DJJEUbgu4CxmbJvOXRr3J6doiJDvZ4+/
         9CGaupZVxSLi6R8ez5vvmptbDGThL0Nz3gBhgCiYPzi4Lua6NMd4RsaG+NzHlV6HNeE/
         /0oMYYI3B9tgzcHYQ1s6Z7xosVFRgrVHnkv4getlaohZKbQNcug+HjilIgpWCJ7UD9YK
         BF4vNl0gCjbZ1cFDsGqobCSuS38KARveZqsZlphHI91CxHblDo5jNUCu5Oxp/zR64aov
         ZjosxelfIJutNV/MQKwRPRpeVA5JAq0LszCJReeGFl8Pbtk87qW0KUbc3YyTU0CZyQv7
         jiBg==
X-Forwarded-Encrypted: i=1; AJvYcCV2K7/7b5ftvEJze72MOHYQRir6kwdWAvE2A8FOgMeLfkMhW1Nd3dMUpPl57wAcowqb1Uv/1YLaveVikP51XCHF@lists.infradead.org
X-Gm-Message-State: AOJu0YwdRT8PLnhIqFZ/jMYJJfj3+tDv6mRne9vf1J3g0bt8wb1re0XT
	IymGW+mbThjL+GzWl+Jw3zRn4yuQDQ5qlUtQ0Dna8mUsXjgKyDNTNNYkyF4+GLdINV1xqwTxuzA
	M+fFmcqKYWexqHl6dRK5tpXsNIMW1psSLYTGjawULCgX3i3rAz/Owigp5eXCZTdo9xXfofvVamC
	64jw==
X-Gm-Gg: AY/fxX5500E3CmXbpgt9EtdswvAQrPLonqGwexKUtvJpN89hXQzL+CVwvet7aaroVKd
	3qFDCdYad4DwTalP9MZxoWJQf31uSaSqbNgOCwsQxjeOhwC+Tcv40uZSJ6bLQEVKJBKbdoreHTN
	gYjcJ7HYIpVCKh4WGXYO9ifVs77ueGEi+VOOlIi2RTNImawXF9YMNj3V+f8wiWv9bvUjLJZLkJ7
	8oy9dmgmh5HxfOzN89jJ83HmivcqUFPdkvggks4Lw1zdQJQEgpuzUXYhUeOZIzj1vprn+DOwnbx
	BSxuk4Bev+MNY9WhUzK6Gj05RO3bnK/bZGaFeFfK5klympf1gTwWXguHcqs3MrL7CW1sveqAn4Z
	QMWgnIXpB2Jr2UTfVj3sqaQ5I8Q4fRaa1Lt4o7umoQs4suAXGG2wx6X5HAIMqNfLIuoo=
X-Received: by 2002:ac8:5908:0:b0:4ee:1c81:b1d5 with SMTP id d75a77b69052e-4f4abd79529mr259722601cf.46.1766503479345;
        Tue, 23 Dec 2025 07:24:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFCw4vHCvah2o4Cv9Nn1hBede70hg3oYyiodU1ijSIBMwr8RVRLddE8a/R3rPskB6gW64UdA==
X-Received: by 2002:ac8:5908:0:b0:4ee:1c81:b1d5 with SMTP id d75a77b69052e-4f4abd79529mr259721981cf.46.1766503478728;
        Tue, 23 Dec 2025 07:24:38 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3ffbasm1455311366b.61.2025.12.23.07.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:24:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: axiado: Use lowercase hex
Date: Tue, 23 Dec 2025 16:24:33 +0100
Message-ID: <20251223152432.155299-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vmXsaiTHEm7r8KkNcYV1iQ7TVZuwQ8i+4gOM19/Azt0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrQwtaOKEyi5tBHtwrJN3zIE6Ws9qt+KgU3Y/
 PY/1P7bNEGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0MAAKCRDBN2bmhouD
 123tD/9sq2XZEs25PeHXMn0/3GZeIifNVJayA4pM8k+JW01OUyq7H4hVZtGBmzhkKjtp/H4Gzfn
 pmk6CimFC3xQSB6iYPRe6jp608K3XO3EI4g2Lpc0qxhZwZjwDUihVUY4Mx6+2nHy7I6QUS3BBUU
 cFql07OznDKHSeir7fWm0FqsXLAr/zaloyYxvrzxV7IkLNvAfOaJhVp0kFewsib6c10P2yt4o2M
 c9jqkpv511HtyJu4MBlcZ/aJ0xKorowtuVCCvcIt6nF48Or4C4ikHZKwFACODgxGEyc7j8SVjJk
 zOszTJBqkCKFgTpvdk0ZiD2FCSQ0pJ7xDZYo+NsWDwfAiY0+tbGLVNGENibgI7guaqLokJdM1Xg
 p0G1S1K0J3bWe/o7sQUbamd8ntbiHpmW3DnaZ0dFFEPc6SMV1kP2F1GrZ1dICPS92YtVyxX6A4C
 CnJ1TRq0PQj5nKmFx2n9L+Y+BeIca670Jo3SHNJWKcTekWsSFlwoMXRwBSlD4tV41am1JkhKsBb
 1B1K1kUy2KnUdkopoCsMcevs4HTOqInZ/tGjeVyDzgHuRyhk2mARzjed+5yCObucitf50n/jL0m
 j4HlxLGxaZabXoqsI+hdh0jejS93e51id+lReED/HFMrcSZP3EmW6BQLjq6buUIUFfvV1S0S85i tyO6TzfvKsL2jiQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 17Lw6isU9PQS3U-mICSWA6fASmyeaGpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX9JN1T2p4xnYk
 9V3+bBqMD/dHWXdhP/OKJ3BuWD1X0flqZiPKbGYcGRpC79m/an2Y9odC4Ublt07Lv40MGDruyxZ
 uJq0jT/NtAPnO9Mnfw9yPwzBRu1U7R83kguQ59HdyWFP1C4R+RzUCa0mcWheSEH7+eEyL3uqrX+
 wpBmUArfeDYpqcVHEaEqUEEk2juAgtFgfTUjSzJwXvYSYJ8pfZm5y7crUHcnWMPBCN/wy0p4Az/
 OPB07lihj86jRVNnFDKuCOrM33ft72R+oPBL+TCOOOMuzwN7KKkbNZ6S/g1I2iWx+ZR0kRbVU7Z
 DnQf3t9u8oRfnMXpUBTZiHKmvhZxFpiOO6pA5aU14wpgYAUcHGQGBiT3IRQlLwSq/VMt53f9xU8
 xKpnvrNHtgbM3iyvncuk3FIC9R/uQhEwGg6N0oILdCM3BfoeZGJ9JXYGcgESrBP66NFx94HjTge
 nXGUBS5m6+ZQM1AsGUA==
X-Proofpoint-GUID: 17Lw6isU9PQS3U-mICSWA6fASmyeaGpT
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694ab438 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O68X4J5GT_4SPXitl-cA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072441_072536_7D1F2479 
X-CRM114-Status: GOOD (  13.32  )
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

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd..d515f3141529 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -480,7 +480,7 @@ uart0: serial@80520000 {
 
 		uart1: serial@805a0000 {
 			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
-			reg = <0x00 0x805A0000 0x00 0x100>;
+			reg = <0x00 0x805a0000 0x00 0x100>;
 			interrupt-parent = <&gic500>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "uart_clk", "pclk";
-- 
2.51.0


