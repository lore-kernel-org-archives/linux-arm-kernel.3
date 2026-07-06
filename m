Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31407C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=; b=zPgWl02kyahjb1UZRwSL1CUpml
	4L1bN2Ibd99HJ6/jbTGhQDTh8zZZUrG9x8rZxWtThx9wbPfUs4qK7JbbaJwQ6nX41vHMIpTEMnSx+
	wVL1bEpRNkR7ppTTJMx3K0VCUmmccqtwEYAVgsrtDAEI5hAVJgtE0lo2NZI0J4Rr7ZfO8Jhm5Qgtx
	1Ya1EAd2d8oXzbMpR8Vt5wd9ezVgQv3Y1TY2CAIMyWf0ckGp2pRjAecAWqJMOGG8+amGK3gTlspiA
	XRECYlbxG8waVBU0SYrB8jyGCqPr11VJa9SjqZAm7BhnS7+eTt0NqQ4uqyorqR5ElQpIfyggopC2c
	rcLDvbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnfm-0000000DI3I-3Mp6;
	Mon, 06 Jul 2026 18:04:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnfd-0000000DHzK-1zJ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:03:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFHfX958770
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H7tRVQ6U4JB
	i6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=; b=NHBHBrD8xW+GXO78pXAJlGDRkuJ
	9t4cu5dkSeGZa279lpxmYbKkVJ7V3a1eadVO+G8WZYZctYhtBLuOlpDPJkdIGYEq
	36KXWBfYDAWZBl4xdSpqmfYdYfmQGwcBYBRFg1bcVLZvqVqIUxcXUNk2OW8Zk6vP
	GJ4S8Xw+n2e0LJgjhgQbueVTAJ71gkBMErGoYhpyJCHCVu8fdqwYZNmQTMaupUyj
	SCs9bAbu/8rx0FoDO8pyMBPnXe5u8mCVtp1UpR/2aFweGWAg8SWPBbXjZgUbQM8a
	gFzsUKD1kmSZdGa49sahOSw21uHEY5pqPaxjHLIQxme7N5Lzw3+tREeY+qA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9aqy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:03:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1186222e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361032; x=1783965832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=S7nDrFKxlb7g4cuHa/QKXvAE7Wwvqk+3280CBfuVXWB5aV5zaXiiepNbzQ7nsUrZwR
         z2I5xirgoo7Q+drj7CbN1iUiJKJOHM6LgQFPVMR/Rtgqrs8jRqLuvN1FBCPJIfBuvp4x
         FA7bqoMKV6gsyxFoAzXEGQv/TT4pd4kRRZVSla1wmIAyCKtbqzKXKdu9/5GiuNaFpu6r
         tc7+fAR1VaXYiRm5ebBcXQTbBZCXje5AzH8oruWvyNIT0BuHBS4nyRZHfFc3qm4czr/+
         r5oDqNJF0caQoT4fOhdJS/dzxP8ZEBiUi6sDT52ny6PYKBrXJYWshxTXb6NyKrBTqNwE
         XIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361032; x=1783965832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7tRVQ6U4JBi6TMIM0U9LRmhFwSAavP1fZJV4lX06Zc=;
        b=SE+2Gm9Q1UfrFIK7t/+9rOrXndnJIA1FsPmxoITrHvmMt7FJJKuPf5ZYI0/2oSqR+c
         oFhNAl1gjbA7KWrpoVBOU4iRoC3N83ALSq3WpzQWySNgFKoqe65rspZH0HBC8U0kd/ib
         5P007Lr+67pPhnhW44n3LarnCl145IEuIlPalYJs41MRCCZTIBW7NwtEZ9VjEWRcFD8X
         ydvQK4To7GzO9m+T3AxS3Dyh/rx3Q3ob2vldGaikfMEWSrSnGM+vla186dT6bwBReoFd
         JcVOoxfVca/zSu9AHXxX7NuNKhHlFFUcyc4T6bZ9ILc+3B5WVdulMqWGuHc+EBOle9Q+
         J1YQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLbvlS20eoDQD+P1LQUsrbzPqOl4poA5+7tmh+qdNuflD5Kb7o0v8NvXE7yHm9xASpSWslWyk50WQj7FLfb0XX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn6Q81PrUZoqN1odqQiOrNRA7/sr7X2zVEVkksd82SMTaKMwIS
	TCEGtjEMWLJG4k99kmsFSDpjerGk4MIt4kbIr7eDHvkMQ9MpLljI2bD/lpcwUAJDjIbvNC8cKYp
	8eObZcox1Tc3PMjlGm/K3f7kyorq+FuBRs1+W/iJlJo18T9mLtjIvtBTDaTKYQnOqFqnhhsSMCm
	yang==
X-Gm-Gg: AfdE7cmP7YdB2/zhkpifux2dyON1RWKkLYwsm7daFZFq4GEgB5sISObL/kc3CybFyXr
	tdG44t1nUB+e+q1UhvagQ9ihD2KHaPsTcpVZypnRosbgToW+i0vqpzVjFjkkp0nxPFUeT4hoz1y
	ESArYX0PXgKPb4HHZwmNbOfffF55TDv2VFxWkq6UH8Ec+iB2+oCpOUglaUboQmpc7LQiHHiYNbZ
	vlPyxkzlnwKEp0LMe5CYpXGBTD6yQItEL+vrItpPMZmMOwLreAxqS+UuijiCpaz7TUlmWdrcD/h
	FRAmhXzR+AkePk0MZ2t6X9mu1Vh5L0CxBqoyjtEFqZikK00DQSKGKmXS/t4XdJ7HlTEDbDNsAU0
	0mQ7DE75K2QxFk5i3QUPICpZNkEc=
X-Received: by 2002:a05:6122:511:b0:5bd:89bd:3543 with SMTP id 71dfb90a1353d-5be908b8787mr858310e0c.12.1783361031808;
        Mon, 06 Jul 2026 11:03:51 -0700 (PDT)
X-Received: by 2002:a05:6122:511:b0:5bd:89bd:3543 with SMTP id 71dfb90a1353d-5be908b8787mr858294e0c.12.1783361031447;
        Mon, 06 Jul 2026 11:03:51 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e00b769asm1108555e9.14.2026.07.06.11.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/3] ARM: dts: marvell: orion5x: Correct indentation
Date: Mon,  6 Jul 2026 20:03:36 +0200
Message-ID: <20260706180333.648401-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WwRVC0oPS1PRdnnUiiR/+KmfMwCzKdfktBxDYpwwZ98=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+33Eko+YabAY8cF5x1SHykX45oWZnWLZieeL
 Tu6BxyJ18WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvt9wAKCRDBN2bmhouD
 11oKEACDTScl/k0BJaeGF9h/I5ghVzZ1yOr6TTlIxdPmJa+CB9a1uNqKHHnsGYRvorKBnD7yWSh
 pCZ3OkQRJYaqJq7ow+eYwvLyzeUGxFHd0yO5uvsIEcL3ZNLS5Kx1aRSgY6MrSfSPQZyPrY1Z7OX
 sll1N4qVKrxhd/J2PElTaMQVNztK4EOYV3ay9d7/izGa9PKRkHcmfJQamhZqw7/MZc8BN/7up4B
 Jizsv+LktDSzRYRmyrExwX2DetpTBa8zCR9h5+VVpQTmQ11TEdrzmH2Q+ep+fTmh4GKizpMOESD
 z7K915Pftrda/r1a76WSvQ3qDDYMp657v7jCoom6lH95mWG9nRYdkywi7GjOVdaTURrmXeiCRlS
 ao/z2QL+BUCZ4ky/hlIAIkg8qqM6aeSRPXC4qe3fkeScJ3TrPl0hzyuQzKo2IOjqJUSkGm46jOV
 QEgCSyv1sNuVUJbnXmZnTC/1LQVnxbVhebnzkdW1V0+XuWsVNUGok7PgyZN4jif6PUbLj0qQNsY
 RYUv/KMe+ufo5xZR9Kd/NHH01dnwQi6JpxOFfNip7OhFDbbqIa+Yn/QLh6qPeniJB1DT6ihsmcf
 7qXNolmb2ueQW5f6oc+qD+1bUmhDPLqUGa5rUuWiqEnmC2O4M+VxXypVr5AUjlXmFXztYpocblo ZS+ugMCoHIczzbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5foA4VH5_zO3ZEKKnGH7dmziaUFYsKXs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfXzAjc+FQJMQSV
 8typoeDRUhpu1i7nCluTzkpj03yLObbJaGQbMe3/5G4jMI5UflogZGJuVlaGVH9AJxFpUvt6ROf
 75MzzP271Kyefu8WeirD9XdL0+qL084=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfXwreGaQxtBM13
 nfa4ybrzzP8flCqODpu+iDoVybwqWlOmnigy5vNv1rerkLKCGQupquKwllVSsqtAH3FySpDJZlN
 YKid3sUWQPG7Xaks7yxu/h2RDG5Oms4GWPi0GNSFJYlwmK/L+Lzx1tNWX/eOcZ0FKJZYKwt3ZAy
 /A1lWwDe0np6YGUGwfGYdxtrLQLpMr/5lyaIWnFpgSFLCQXFrZr74CK1TDOWtOJf+x7MIsL4vNs
 DENr9OFFX/yvwrLz1Q8fY0kM6GMjSbSMD/JEHmbzwkHKwNCokqkH7gEHCJYrOc9h9yx2urZyMxm
 Nu57/xklDC9XIKDHmW2r8x5uCzX3N89gFZl1HaWdzQKN06dfksn0pwSMNi35LIJC6D65nGdRXUo
 ZnN13uxNYzJlRgCCfvntyc48kP7mIk40poCheVdX49DqnAqmeSgLDIqyR9Kin/j2TbT9QXn1vpk
 lxYDoTTu7tDlj9qdprg==
X-Proofpoint-GUID: 5foA4VH5_zO3ZEKKnGH7dmziaUFYsKXs
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bee08 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110354_308825_0BAADCE4 
X-CRM114-Status: GOOD (  15.59  )
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

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts        | 2 +-
 arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
index 12a4aac2633e..9757c3b57de6 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
@@ -109,7 +109,7 @@ flash@0 {
 		compatible = "cfi-flash";
 		reg = <0 0x80000>;
 		bank-width = <1>;
-                #address-cells = <1>;
+		#address-cells = <1>;
 		#size-cells = <1>;
 
 		partition@0 {
diff --git a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
index cb1bd24b7ae3..b2b3309ed1df 100644
--- a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
@@ -69,7 +69,7 @@ flash@0 {
 		compatible = "cfi-flash";
 		reg = <0 0x40000>;
 		bank-width = <1>;
-                #address-cells = <1>;
+		#address-cells = <1>;
 		#size-cells = <1>;
 	};
 };
-- 
2.53.0


