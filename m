Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8833C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGuz4SfYOsk=; b=vRiPOY5TUK3WfRKmQeg0eznuo3
	+khxw5UqODkVuzHUNyF1vkqg2vUV5ky2qqr9LX0CVM+dDxvNEAzlfTj6on86OT855qE4PeuXjgbt1
	sP+YO9c9psWjd14olFOF1N5rlJ+L4QHYQw21Pgr2RQVWKH0Fs34isMwJOPXdziF75MDAh8oeEqc2H
	1oe/ULwq5mM/gmNaCaPg3TxEck6Mp1Xn2YGqF7EyxlQb5jo2ePw0/3iIDlc5nj1NTRFUL8ndAY7BA
	bkD+FlPDl0SLqny7wWcP63dKdTb69BjTH5vld56aiXdwFg/DhrGMPEzT1paMA+1oXfp01dYdsK40a
	XORl3Now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQi-0000000CC24-0mff;
	Mon, 06 Jul 2026 10:20:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQf-0000000CBzr-24IV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693r3K107424
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGu
	z4SfYOsk=; b=F/DYNYTs74zTC3R95rs1dc5KOkM1oJOTwurk4FEcz6WmI+EMoU+
	cm5zeDxyn8ImI4vY0nM9vFQ46ASIpEv6cu/qr6fRmTjKuzk/5gjckAUUCOL3nt6D
	3McHALQBfgr17RTTcSxX73TCL9DpNlkBVkRiLRPI1f8ezV0+s1g/722D6Qdb3nWQ
	qEdnRY2L19jc2FmfZMjGHMKyvpzp4TP0Y3qdMxRTxZukEF1HpBjjKH1LxjhxAGIk
	DCtjDRcPfZYLUvhJPjynlzPNn5D58BfmPTWNYvk+bAJjTUtkEE/D9My9U5brAjMF
	1LmEekxE8i10tN7GpwiHruJEMJUt4NfValg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urcsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:19:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so271147585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333196; x=1783937996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGuz4SfYOsk=;
        b=fGGPDpizUG8FAck1M4/ENc14Vg8vB5Cef7BkTT14M3ggQ7dkDn5z/WZ/oPOA3veVDq
         jUZ4GUQ4AZ6jxG8z9KtC4ZZkXSNdm71Bb1Dm/VJ9W2QmMHfMGChiWLh46L2LdgJ8JwDd
         s1flGhXMdfS7MSNZcT+fD48WPzeAJ3eZwQ7H4r/Bx6KdcJdE9QKOsIehbD4Wuk4WHs9h
         EC+sZcuJB8aIdG+3nsBUutEDOM+IGbpWCnJI30bkmegbVO0B/CCIOddPwa2RzAXUujLe
         VwH20ynASHhkeWKtj0RV2/JPEjjX3sQH+UZC6L4+6BnfRp4Q17QMyNdeGpF2XBZ+oYX1
         xeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333196; x=1783937996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGuz4SfYOsk=;
        b=Fc1ndR7tvmE0+QntTs4wVyxJdMtAepLwKYypKX3Q4YpD9DxYakrNXhPIvy7awhxypw
         AZa1Zu9P7dNjyo7o1k49nuGUnCGxqyO7S/f06s4qFL+YL1xFAk/NPT7RSXIMCFn+FwHc
         o11awIwXeWixoYhsWqLle+7AvXZOpyzyWmgmUKUoSUgfz3vPIA2fbW0iZYq79W+WhY4B
         MqPqsIaGK9zwZT/wgmKKfqiwAxEIpTOQdWKwO89tVjHIszjUxElwecG8u9RRdHkkiqOU
         Yfbs+0EGYINaNEhFDTp85Eyb0gJcnIDlUhUk1xbCRni9DIO/PYrq4uM/qesaQ+enPM/h
         9aTw==
X-Forwarded-Encrypted: i=1; AHgh+RqHG+Z0D8/HTT3WlYZdNhxG2JCGEp5yvnZ5UE9Azx93lYu3I4x+gGGWjQTiA2a6BN4PPAUba1fuVKV+S4ILl2yd@lists.infradead.org
X-Gm-Message-State: AOJu0YxIHCW59C2KzbQ6fSRUqNaP/sTtogj+YFq0LxRaYm3zakHuhPpw
	NUum6l83zoaEYuq8WtuMAg+j91HgoNhhzZVDAkTTlwfSLkjh4R87/bHCGZDG91gmYifzQtLDoVc
	okqEzHZvNy2TwwyvTAHgsPOsuJVJiW2wFrT+0TnzMeVOuSmarh2a8qDpEKovcePcXiaf37P3xRQ
	+FHg==
X-Gm-Gg: AfdE7cn0vz7i8Z920Rd9R2meeRfQdxtKzdYTFOMOWFCjp9ZHgMlh4RaIRAHArJL5moS
	BX8iDnX+p3kABfsWxH3NZZd9kPLz8wRAcD9duykxbGDZWAZ135dhw4PlSJPmmX+6xd/w5XF2bd3
	enLAfPqHZ12nWrW64yy50cHIUjy2l+RSPu1s76FK3FhalE/WLIklpcChdbRz2m7zJ3UZ763vjM7
	OHDCUk6eUMYmpqQ1LeAPF6jq40ccs9/QdPG5SOTR1zFS25tmev5LK1HOylG6q8MrYDdREMuVGwZ
	aUzPLVGEKgIo7rUivP8otEI6NEFFZ1vDcLYKhdPlExzS74WxS8No5ltfWyoRsI5GgGlDi7gQvUd
	z81jHo1Y2lroeEIPs1DdtwrHuaC4=
X-Received: by 2002:a05:620a:8811:b0:92e:6533:26ce with SMTP id af79cd13be357-92e9a53a993mr1386022285a.71.1783333195961;
        Mon, 06 Jul 2026 03:19:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:92e:6533:26ce with SMTP id af79cd13be357-92e9a53a993mr1386019285a.71.1783333195486;
        Mon, 06 Jul 2026 03:19:55 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24514134f8f.37.2026.07.06.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: allwinner: sun8i-h3: Correct indentation
Date: Mon,  6 Jul 2026 12:19:52 +0200
Message-ID: <20260706101951.341727-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=axU3ClN7PPFa4DxjQxbfhMg1dVxjMj5qElsJKDqgZLw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4FHiWJVYH/5XmTaaQuajA00KokkoFeKc3om/
 +8vVJI4F1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBRwAKCRDBN2bmhouD
 18n1EACRdxv9uvSocdbI1X13995UM8uwb+F5Mh5dFtuFlnFCv/RGo8u6QzYnxAwmnYOGsWRBzkM
 OrtCtZSrAb4WqUiOHl+0N5tQJdqPivLh4FUufU3vM93YKhMCIqrww+cGlgglF1D3TdDHYCCXFZP
 ploHT6KUOeaoYTNusoRQhJS2cmo5TJWZ4X7qRNLEzVclQe5xF5He3uDiWlw1WGUhy2wGhRj32MN
 Mr95NOH7mdPIT9jGOHaRd1IZQI8qEsWVGLh0gfua/OURBn8TkW/R3egK+4FF8TzX/mC1Yc58Or7
 iu7u8DIyRhL7phbD963L1+hs4aszpAljeqowojD999a8KogtVJ168MuM2wZXhq/fLKpqZlxsoMr
 nX6EMxbsrs4elOjH3vgsbxoLLHAMwu7hwZ40evoRREeXcNP/d0TTu/qu+kPx+WR1V41msSr4LYt
 Zwk/519wBzrAQFvrwo8Ew9xL+uk5TIHVkV5A4uj7I1NlXS6ovREyQ6cDec0UW2GqIshXT83zZc3
 IMPvI1ZOGuK/jBHpICb1JWz675G0xOyi+q3Nyu5VjCJL9PTT1Iokvko3E4AE19+Lf4Qw4w1sgES
 mBbh4q4vRf2D1T6DU0QrvCYce7FWczy/Lpec9bRZy7K82TokHrlLUQH2+IhWJ0QnGOUluEauod7 Sk48bjHXi249e/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Qko7VWP7udBJQhEmT20gfISDM9O-Rrr6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX3KBN4cY9ORln
 1HxtopxEiUBP9mgVVzVWnkt76qlqfFoweKCX5iuszQtZZKPd8JkGFeA2YbhVh0BwQRq+xt7HH7Y
 fuLw5EW38JKOlH5P6OHqZ/Li+RBmTVY=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b814d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=c6vaRMsCSfZZW2L0M5gA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX+/uamFZF/9od
 DRweL8T0GkXVRUGEzmG4QANKEMmPCsqotJTbJ3EnifQipCnZ1IEcb5X821qotHwlJHhS3HwNZa2
 uMeDKmcvHOOfGXVL77XKmf/YEOVRY2zLuf0UiKISLYatVweYtJiLIdtikGfQMAxjh3RPZv/ON+q
 qI4m5eBwueY2eEwy+nZwZ3jBo8/wJ9W/O3ZKc6SFUa8yTyocTkPUqZQSCMCLX9DyCg+um7aV68g
 4g4MoONjlnShAY69/nyAnxKQ6QUJ1KS0ERiq9dub2o9pXeBG79jlYiPAUuG/dwkwkyTNQGScFNw
 zrUMcII+aCXE3fIXAMkdL4xqIzal1t24eqohwom4Cd8RTerY8sm2ZMbmbbwAH5DW26XA55ImgMH
 ht4UMq7d8vqyOwnzPy1fUpudZNDDbZdk6MJ+zYloPG2IA06iSI7OaC19az/zn6NyQFjZwZa1FZn
 QoR43sxmELFa4Gx3lYA==
X-Proofpoint-ORIG-GUID: Qko7VWP7udBJQhEmT20gfISDM9O-Rrr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031957_543782_366C0B65 
X-CRM114-Status: GOOD (  14.51  )
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
 arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
index 2b0566d4b386..88550da5af62 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
@@ -73,7 +73,7 @@ reg_vcc_dram: vcc-dram {
 		enable-active-high;
 		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
 		vin-supply = <&reg_vcc5v0>;
-        };
+	};
 
 	reg_vdd_sys: vdd-sys {
 		compatible = "regulator-fixed";
@@ -85,7 +85,7 @@ reg_vdd_sys: vdd-sys {
 		enable-active-high;
 		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		vin-supply = <&reg_vcc5v0>;
-        };
+	};
 
 	wifi_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
-- 
2.53.0


