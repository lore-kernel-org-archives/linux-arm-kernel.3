Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7929DE6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h45S22LCg=; b=s9Ie4CVFxpa8GUDqGICnZn9LRV
	5zllZNfj1GdqQRl2hYJpSwcaW0/l9Iyk2R5UULeNacEl/vIAls9VijycCBxMMQTCmyq4AG48vlF0n
	R9I0+QofDamRMthc1Zr+vjrudVH71Om8gN5ADzD4PCILDKzAv29JpmcMkFIxhzu/4C1T0KVRs6ujN
	AlBP70iLeVFa3+ABJAuHJgEFzVWP6QsPLq/0wgbHrFPb9nTyNhqyhk5Ie/5fJFcOrfzyXEmgUfpQ7
	TJ6hdaQLqPq32zDDPMShPw7CpnIivHeY+J8mioLnHpIX8VikPN1Jdn5vqRTpXqipNZ0UhUU9Pthkj
	HqQRFf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GV-0000000FgG9-29ut;
	Tue, 23 Dec 2025 15:25:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4GS-0000000FgDl-0Cw6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCUecU1903861
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h
	45S22LCg=; b=kbKzobqv6m80zOhSKn8lVvS1nRaqX31bQPhnsn3VI6Jhc5E3DAa
	IgpIg4li8mTtbQgiewz/q6CkSoDwyH5Q9hcUp8gvSz9pBQVHFK07iAhoRsZHrR/T
	yyP0JiRL+iJvC7WNmxUOlvgA62wCljmMncxm59Eph7Ew4zp6Gj0+BE+uYtoSh0w/
	/Rr1IfAAMJXkN6bXgo+HfuPkQhoIOftxErSza67VawK6XNHmUdhF6dsCEyPAW1Tb
	wSFRjRXAgN7MR6YVX9pZr6r0JGSU844ppd2fjryHsPsbR2N9hyTrtLPPzulYr7/O
	tOJgAUJ19C3YsriUUvIttVL1wQy8nNBONnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8kfug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso133793471cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503530; x=1767108330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h45S22LCg=;
        b=IlX0gBN/SgAOU37JjliGs6Crgzpq5JoQak34aohi7aIIEFLX53hqrE6U5XRSTWa5Ve
         pRceSd42Em/4Q/ziUvf2eV7ruwfEgKHi76hM4XK3GqHkuvOb+5a805BP8HbUaFuaJlcI
         17ERRLcjtIjMQdSF9hy93dAqj+sGulL+1ZBrz8Eoau8LPQoI6Gcb7RIWE2Mqmlj40mh0
         bhzda2x1OI7yKbKVg2UyqolOehLFWRw28MAEJqUDE09DOfwounXdFYL8soZ4zEDB8Pz8
         L3LSK2PHqC5BV1pHI8e1VIFCtUWXhvrqYtNtD2ksik1KMRVmLEiqId2pCfU/GpY009qK
         KbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503530; x=1767108330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OJbf7anBDIRc8m/HN/xjUDx01xgE4rVa2h45S22LCg=;
        b=tBz8U092ZftflyCWW1mtJuMMxB0FT1ajIG1z2yXlJNOaqwft5Wv41xnzBRLwnrLC1O
         UFedh8OgcbKYtD+8R6iX7CcWF1a3KCJidcajLpdFjz/4AUH0Pb5RoKbS8uO7bkMAduaz
         rIzunMGYivakQur2IXAp/ewWrM5Yt2Bkzxf2CpsvKJDZnwhigKV5iaoRE6cJanDaFXiR
         iuV6sk/K7kxyUupBmp2V53gpBmBEnipLRIDIwrMs+1edANOHjfswEdbVfQzOi4NWXgcn
         xYEappVkyefnPpP42ChYvsM5tXF9KiGTcpxy3jSjLKRjF+x5NCySqV+ZoSaRfUhATg4y
         VW7w==
X-Forwarded-Encrypted: i=1; AJvYcCXeL1s+8JC1tscyCUiAVK/VOQr51QIqq3JVha+bXmJjmgDJoGocLaKWzeLTs1dQo1q6EQAh50ozvpP8FA1vKx7b@lists.infradead.org
X-Gm-Message-State: AOJu0YxWxYreLHVqDIrRRZm0q9OVoDY2XxfwY6OyMauYji2ZgrDBrCKO
	TF4Tb231sOZc77zfEDspbOHpDAgzvoDbF6ULkV2sFDBm+nADTiVJjqR6QH4WU9gVXhkCjraMWsI
	Bl5HIq3+P89emmWSzJAho70WiXZOasMx1tcDMVxB+BXrqnw1FpcscfE2L6M48jWKtDFp8xKMt01
	7WmxIWJ9L5Vw==
X-Gm-Gg: AY/fxX76syfvCUdOcG3aTX06+Lv8vdTO2FMWRAxKzYNmTb43fNgEnk/CPNxkoog4kUN
	BPb+CMN45G0EBJp1ziiholGyuPwh6XV1B57rimZQD1K6+wZCVFqnAOhWsJRuk3g9BvByLOeO5ZD
	yfdpNT+N3k0CsaMNGFCEt6vFxpcTZiGgFjIbTWW5G4BSIh8yC0BaLynP0A54+21dvLiUXqwQFzt
	U7vtg5zmjxQZE6e8MuLSwZUt55WFGU02rsWjwIuusF6yKMETGKy9TZvzSwm9XR/r6Oyd0WyS7EO
	YbYJBUaJvkiN4g/hDM1YNnPLlrYR4XnAxO3+Rm9p5v9mjYgzWP2+6JUlizrAt1UZRG2FN3Zt1Ce
	ZZPYxpwPi6eTQ3NAt1vr1jEewH3ELZ3pJofBhdUHjK4HTYEpFEfa98+s2jmVY4r7k230=
X-Received: by 2002:ac8:5ccf:0:b0:4ee:28b8:f110 with SMTP id d75a77b69052e-4f4abceb823mr236615321cf.29.1766503529821;
        Tue, 23 Dec 2025 07:25:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrnbsE+HWAwXiurBOJEEg2dgpe8DH83RknRyujky9Aogq1yQjJIOb1156ORxCZVJMxYuqyKA==
X-Received: by 2002:ac8:5ccf:0:b0:4ee:28b8:f110 with SMTP id d75a77b69052e-4f4abceb823mr236614771cf.29.1766503529284;
        Tue, 23 Dec 2025 07:25:29 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b914949bbsm14003705a12.19.2025.12.23.07.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: airoha: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:25:24 +0100
Message-ID: <20251223152523.155523-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xIfSJeo589SRPKtJSO6CrC0N3gnqFdUQkQTQqQAKRdo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrRj68U/p+elB+9N3aoYvdhSDC7YOFbGLSNfp
 KbMubyRsamJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0YwAKCRDBN2bmhouD
 177ND/sFOW/pfKDGyrzEKDFDw4TNKaSol0k/GvNREWzwA9tDVlKKyA7l2iLMNUKQ4Jq2Rdf9EBs
 lCtUbyx0EUBQ5xSWj/njjEJm9B5tmRpu6NTPjLIOp0cWcsJwOGMMvSt2ElIqfntgLYI+wqqSH1x
 /qk1IQu8064YWBlT7cfCEi/jidblqiSnL0pr71x6M8Bn51ixnZnyldlK+52SzcsOW3m82KKDWo1
 rqmLmbRIZYySdloozUSjth4gCs8IddBCFVstDKrm9Ea3kEomLg8bX3T4FJ78PN1dlVrufKncWnf
 ylTrxooWg98IQNljiOrSvwV4Pb8cbC85dTManad+AwqjVMf70fq/y8pluJjAjPq9MqT5nlbakR6
 OwnqMiD5xnOuUs6F2dQdyhl9wga/aTM5Eqx1c1j9GLK+csvhoAQQcbBlkcZBjy2/A0jAYqTVjs7
 hbu6xmEG5kbPNkXSUMidn3Q05QatrWTW3iDz8z0K1JzSd/+OVDNxCIr0LcM51FrgbM2a8PU+Voz
 aPWuCNeeHJb6tAcUqwrEKwb8wIEpXH0+KW2K2hRQjWQkHKkHkncC6EgnJSIrAMypMzA1x+Yol/7
 sSi/12RRuR4dUtUjie3q9hK7aGQ/Z4tH61E9mbH5cp5IYGLgQR88+Ht88Kb5yQkyxNxsQMjja2j RpC7F93WJ5KG2ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfXzo9nyMK++Mf3
 ImOX6pkyHAutdSUVnTdUVs3pD7GX+38tVNjjUUFktr5phv5XUBLtcJLvKCKtE0q2BR/8eT06lGp
 /FP9dXbNkR60ny+4Lfu6XhYmvadc+ReHW2PA1NM8mRs77Ue9BVahDhsGbPOUSus/piKLR1eMeS9
 QD4VSaxiKZ1uVyDUh0UHBRg2kI3maPNSzcIZtgT2nV9sUI+xjCFnmftPlM4H9DvnSGfDZNGCOmK
 LaPZiVOh4SxGQS/cGIsMtFvWgzGNxcI64MvmW/QZ0vXf48/RK963QGzFs2euu4FegC1GDNSVQaH
 RO+wHXumURy7FXB0nAov0IPAi4T3JCuWuA6jBfBdNt0oJetWD3UHAUrMH6WCJKICLwYbHnWnrCQ
 hXFOCPTJFXHz+M8s9Nyhhssq/nNgUkqnI7Q1ptbvhtv36Jn9I/G2c5REO2/IUZZ+lWuIxX9UGbx
 T7NPZ+fSMG5Ay0FdKPQ==
X-Proofpoint-GUID: A3lfEd4dIhKV7qpn11KEj6CZPBDl-n2H
X-Proofpoint-ORIG-GUID: A3lfEd4dIhKV7qpn11KEj6CZPBDl-n2H
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694ab46b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZcZdOxe6BgGqELRYw9UA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072533_404009_B7204164 
X-CRM114-Status: GOOD (  14.09  )
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

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed, verified with comparing unflattened DTB and
dtx_diff.
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index dae9968a4ff6..886e2e4b5f64 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -47,17 +47,17 @@ tclinux@600000 {
 			reg = <0x00600000 0x03200000>;
 		};
 
-		tclinux_slave@3800000 {
+		tclinux-slave@3800000 {
 			label = "tclinux_alt";
 			reg = <0x03800000 0x03200000>;
 		};
 
-		rootfs_data@6a00000 {
+		rootfs-data@6a00000 {
 			label = "rootfs_data";
 			reg = <0x06a00000 0x01400000>;
 		};
 
-		reserved_bmt@7e00000 {
+		reserved-bmt@7e00000 {
 			label = "reserved_bmt";
 			reg = <0x07e00000 0x00200000>;
 			read-only;
-- 
2.51.0


