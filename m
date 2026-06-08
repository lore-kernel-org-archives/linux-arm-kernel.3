Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6FBCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=; b=v5sOY4pIhSAK11ozxgqeuuwZLf
	N8NHJl39jAfsVdTo2tdmrKKGzY92ek02X0sNICMohF6Gq31lRTkajgYywm/hfX22AI6mxjDW6W4dE
	ZiL6PdXn5cxax8EtzNqPwlnnXJ2GRu0MjULdn3RS1PZ9r6WDaceyMJizNRRywazciWMDIK3p1f2en
	Xme15+k6vFnvcWTFp0odd0armMatfcHqJbFxN59fHj654jrQi3GU3PJzWHZbcMRbmKap0uTYMPDml
	cbZc+mf5ckOy/wQk4+k7MlJ+ajfFvCoP17oOx/1zTayezffvGUMFP8Vkv2N/5/o1AS7vxmYk1JaBg
	eehDntsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRW-00000003fIZ-2Ktg;
	Mon, 08 Jun 2026 13:55:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRT-00000003fDk-1al4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRHOS3682741
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=; b=HE8V9I898hiEnvjd
	WXThoSGLHy1Uov/QdRACXp+qCvo/yPAfD3XNHA+UdSB+0b3D1D5J4dICKdJSxQob
	Uhe2nvdy9YzePsEHGJifH7aXA2hBFy/zAM8t+gihx81pgZVNAs76vMYnAvpg1CZ+
	vfCj9EcM5L2utHz4ohjBgDZyZNzXqSEIl8Rfj0lgc2QZ2Wn+K+rHxgGqn2/e9C0I
	gFGoMdRenILm5f7ighMjrxkkcUXMZVqeDH897zSEIrySUdEKUD8RlPIGJMBpPElI
	RCWoZh4Ev40/FIIGP9H5cOwqC58kttiPFY8o/HfoT8FeKj4uqkr1aprpX62j2Y9h
	DBi60Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rrb3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:55:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517ac42d958so34972621cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926902; x=1781531702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=;
        b=aceUxrnU+ROBX2UdeIvHcrB5XoAC5Erpsr947Knjv6KiC69Lu1cE31tF+ZYeK+BzeL
         YtfcVaJp+aMWjZXi7IElsaDo/uD0ht0ASu9vKjUaa9iOE+U9FAc0+74QNUqYetDHaTVr
         G/ztJZl/drHDlJc0XP2g2ipnsz2LE3YPG8ux+3PWrs50EZbZK2SrcYKpvCeNdnRLDRJ4
         tcYVE1LcqFVdhsJhZOM0STeGe9mRUZGgWlj24JeezPFecA2Fd/wAMnjh91L6Ip/QhXgO
         D50sskF6adQYjepiYvbvf0sQU+2kjvjS+2EGSksL5NF+K5r8NdPgoUja2zMaxK3ZArY8
         pKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926902; x=1781531702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CE0ywq38rbkHvJyR+YXsYczNfViYtChFgXOkvyQ3mBM=;
        b=mq1UIGM5BqU/TF3sSfn4y/rGnHHzSazexxSqJDamC0DNk7tkvMJzrFmGJOout8XhA+
         GnoxcfY8Usgvpk1AiiHT4Zc2R6geBcEq/B7Jf42SyQc6y9gkglPVO6i5+RzYUVXqdfc9
         2ZUDj16s2lJyZJHUp87P6X13D7RzZNXC21gyuYuyT1+iE1srDjf+sqlvrqkxylolMC+3
         GZlc7aby7jbEMEdT01Mx/UDLJcvo5IYTI9v4KHH+1EnwO7fRNcSixo9eTQdPBzR1iLvy
         Eh5xK22f6c8KnP7WTsQjlkx2dAxMyKmo7+UVW7V/r/TrkXztSswb3aUbaz1gndETSM29
         PWww==
X-Forwarded-Encrypted: i=1; AFNElJ9S1yMeyNrVz+uhh9+ZDGzwmDnQku9tyrQ/mMMpY/a6LyYb3R8HXydCge6uIm53k/ZP3H1pxcsW5TAjRxXhPiPo@lists.infradead.org
X-Gm-Message-State: AOJu0YwygjRjpr9ZES8n5euNrKcmfpKmvkgOKlC3ovdzmeGqoUc/J1yV
	BNrXd7Q8vxbJiHi6uNsf3Il4qcCm+bjTDieUfi4OjMEPj2WTYDfCnoq28T6ZvmnTFLf7Kzhvgrm
	NocWNthchhYpkInFTDd34Z/0hjKYZAsKtDgzxRt74P8TszwnAVXyht7+Q/zwmcmVy0/68MW1CH+
	TOuA==
X-Gm-Gg: Acq92OEJ8/ZLlo2N9K6fPAmD6QVJ8A0gkpJpS4R55bXrM4KhZAMWBBeKEbcexxVWbUx
	3bqtJBTNxprNeQgb2s08D6FbvYranHMuXypJFEWN1DNbtic54jFW7HCkKIqE7j4b8LLOcJOLnBL
	VlY5YYgqgEgxT9dgLA+JcaXW8zOMmqxp2co//iYogGwPdgY7lTo/lnoR+MqhkI5NYZAFOQqkS6j
	BuzyRFGiBaEdOnzZpO/eko6++ho7Lj98jtct+kEEKIK9RKcCsaJ+Qrkb9SaQCLFPo235+CV/AHF
	39VqifDe2bsWT8J0xuuSJl+lsML+THQlAM21sKIYCF8u55BBO8wjw229ygWrTuQLshVi54mMWPM
	15QfciEn7kudpMCynBInuz1LOpPXYT2gljbiUVYWo9oz+v8iEiXySkn0=
X-Received: by 2002:a05:622a:2509:b0:516:daca:ea8a with SMTP id d75a77b69052e-51795a4149amr202288721cf.20.1780926901637;
        Mon, 08 Jun 2026 06:55:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:516:daca:ea8a with SMTP id d75a77b69052e-51795a4149amr202288261cf.20.1780926901148;
        Mon, 08 Jun 2026 06:55:01 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:54:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:15 +0200
Subject: [PATCH v2 2/4] dt-bindings: mfd: syscon: Drop unneeded case for
 syscon + simple-mfd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-2-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lpvEF+gT5fcjZ09COuS+KduhTUqK+dyTIeYaqErwUx8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmprD6HuAcUIRBVQOXNOcJdz8AQBm1/59E2R
 DiKe8Ecmk6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqQAKCRDBN2bmhouD
 1ybOD/9TTTiTOIm72paZbnNZ62/N87L70A5R6anWHdWGFq4pwhlun9eNRC5N+e3kQ0suiL3JbGl
 6LsQsTwGFhxDADb1KHyJb3IMOWq8anPjedxgEs/SK1W4hSSF7Gy3KRmm0enmIgK5DsvdZvzoX7/
 W0JSVyitDrsCGOQw9OaIXT57J4B9nIfXxFl0BmRBpfSRORSELC406pvTbWQLwF5M2GhYSGs2CO7
 a/zp+KDtNYT7m85FzFo/D+fHOPcLUXneuYROZPlLM64EEx0/itbHL+NwsUCamJ3l/yyT/r/T8rx
 4vpizNrNsHUesYVok8afqlxEjdefNeOKx4P9VCSbVRpkvDJJwMryWSmLPVlweEvRt2R1t/Pj11L
 Xpp2H4ncIKOoJVEG85aUPy9YVh6sonSbQylYfLb0LLlm5b+BxjemGExL7XA/qZ0yOCN5dH+lhCN
 CxpRc5u8LA4fWdrg/GO0KGMeHCTbKeQ5g813ZLYVkbpuBjkBSLAuJPsi+puemCnalsC3qTx5Mj9
 gaXEiAnHsHcbJQNprPAjpqGfTE+ZkILnU3RWvc50jxaWvkJOUWi9K9kwpXS+3/dYS5KdDrOQUte
 rPPlc8hburw82yv+bG5e4D+h+3QYOYB6sQWAHgTNHZlJtAAuqF4ig2gb4tlT2tyFdYOafeP47uJ
 oaeZTP9STt9FJ+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: t3MyFEpSyfInHsz99EzuARzGZziGPHxL
X-Proofpoint-ORIG-GUID: t3MyFEpSyfInHsz99EzuARzGZziGPHxL
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26c9b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iBsvbdzN5SDSf47EeGIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfXxAk4aBQYd60J
 u5Pjr3/ZlOcmd1F6WorYFh/Gt30efMR0GxWLyYdil70mE/VIAOkDZ62xPxVw5nDjk8Lb4PQt3yI
 pZlBj5VKJHcZh6z88YuKhQoYRQKU6kE/3iwIGcxa3HO64koe6bNXfBK4T0r6OP9TUlY2r6gR/uF
 l+7hdamS7NVjwR6cBTvlh+gBSG9a8kMjJga00bpEUc0hdEfcuWAhY76xFJbI0JjNXnTp7DC1nG/
 0DPXPE/r0Mj/BuTUOm9Hy9nAPE+ab0rO9EkE8OkfXYNRNo6gSickGDfd3Hm0leuOqljdHZtMT2C
 a5aDbUseUpZ8dzRral4mPHxVLlSexhfsPlcbivry59RO3f562xbm4bu6ZJiRX35rRn2zloRK8ml
 BXBbX/Oe6mK500aHkIXmQbGjJa/cHfFJHLQ+uBeiT2VCI72Ug6zJ7NJOhRr6O6O/tulq01NSlpL
 oLNbc07vMbZbI4dBFCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065503_534094_9C60D22E 
X-CRM114-Status: GOOD (  14.78  )
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

Commit f97b0435c857 ("dt-bindings: mfd: syscon: Split and enforce
documenting MFD children") split the syscon.yaml bindings with intention
that combinations of "syscon" and "simple-mfd" will own bindings file
referencing the common syscon-common.yaml file and define its children.
That is why it left the quite generic/wide compatible list of up to five
entries with simple-mfd.

This permissive list of up to five entries with simple-mfd can be
removed because:
1. Such case - referencing syscon-common.yaml - did not materialize.

2. All documented bindings combining "syscon" and "simple-mfd" have
   their own schemas.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/mfd/syscon-common.yaml | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 315357da146e..b3462e876622 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -46,17 +46,6 @@ required:
   - reg
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: simple-mfd
-    then:
-      properties:
-        compatible:
-          minItems: 3
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.53.0


