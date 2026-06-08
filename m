Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1549CCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VHXMBaaaX43r38R6RMvQ/20aqiKNP6NgI1zIfoFP+kU=; b=SaH10vJ3j0eyXG
	p7VbrgQwE1MMnjgre5PJxX4ivCVob3hSyizbS5AFiM4ZuVdFoXPg3e7pTuj6anmKlJPYjHf2kfFNN
	X46NAeZ5DJ2GLEQAYUZZgjlrTP9qCVpyKuNISgXBLnjt4mj82J50Q7SRBUCQx7koiay8ydv3/bd2B
	RorOwAkZk5wjd9VtIAnzH+6fQ1p6u1MgEch9EcR7I5ym2svgMceX0w32aZRht3vM+TTa+OeyT03v0
	QPEfD16qn3zg5iHpuE8vea77HFinK6A2LFjfRSsPHuCxtGh1+9vat/fLh7LZfwseQjugj+cWzXRsm
	swiPnr7BVeNiHSRiU/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRQ-00000003fBa-2VQk;
	Mon, 08 Jun 2026 13:55:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRN-00000003f8q-2pqA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:54:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DROE03346978
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VHXMBaaaX43r38R6RMvQ/2
	0aqiKNP6NgI1zIfoFP+kU=; b=g/j42oMMs+Fe0nmeaiPMbyCKM5tZKg7Ag2eOCh
	yTlu7II9SF3Vxql2ESnehbY3S6T83qBpheA+jzS9qdVv1g90eFnmz0H7lKdutCSp
	8YJbTEx/4C5q/H5vNqSy+/mUfucd/IGYNKEjzUq3JBE1FSGUSqgYZmLu5gGrMn4X
	YAajqJLRzbvNgbHAoiDob4FsMBUEBBCeNGN56R/qtSWX0P3KtAJIxMYOBr68Z0Cb
	eH8rWbA+EaQFlUjtMluDqXfauRSFGvSPAt+qtm4/yJr7AK2AH+Zz/5DUShhEfcvY
	AJ+y27sA4bwlxESIWNNvzJRv85g4SLRpetcyiD6au9w74ghw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8sbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:54:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517ac42d958so34970511cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926896; x=1781531696; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHXMBaaaX43r38R6RMvQ/20aqiKNP6NgI1zIfoFP+kU=;
        b=kvbAdQr8j8NYy4bpYWuZQ89XRJQ4nL1tvbcg/G1vEiS1PRYU8vmbGhxwZR8Rh0Ug8N
         +VHedaiVFQCB7xf9CKMnKkrNyr9soOOud7EoHv4XfhRbF5ZbDoNvGB8bIHb3UBPNhVCw
         C9kto0XYCSBxjwMz+0z3y/OFdQ+fWL99r+hzS8IpvIXv1JtfbS+rYn/c0kVb5hDy1x1W
         yCGcZ2lmsidpx2cpKSkav2yAaY/IY/A4AN9zQOZk0HluCKkqZF9uNl54BQdkmgJFX4By
         w7edDQggj0YZzBvFgOoyfFvZr+kl8g+Ov5QNO8GzPRiNupuTYmTVFb1u9T3n0Pw7NyB9
         bHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926896; x=1781531696;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHXMBaaaX43r38R6RMvQ/20aqiKNP6NgI1zIfoFP+kU=;
        b=YIQY5UJ+xpaHheIp9MePI1mraWC/Ro+mFpy14gxUMUV53U1gNqVdAb08OldRR9xp/y
         46IgbVWR5IStZ1mgBaWXI5iuwHc1CTbFedH/rpjQOMG9f7LT+lLn8dSvtW58JFiy4kLp
         a8I+LGKDJRxg864A77WJ4W9pkHSgQM8iF/FKzCOC/euuKtYzQyxi3akdk/rfgnZFCEIL
         enmCoYYM8+CmhTaTa//Q8RkqZKTBU0FYhSVzV11cYOO36T16aguayq8O7Ta9O8B3eoVA
         0VGGKQgl1zbpSTq3Vvy8AYCCgLTqaIykp79ixyp6zUNNJY8HLI7xg6QJIH6pG3RcOnkx
         lAnA==
X-Forwarded-Encrypted: i=1; AFNElJ/s3DJAkkUnMdRFsv7uVR2uho/QrqBoKzGNfKQ/6+GrzGoc52p3rcUTrIqOlrSfD/Vh21Bk0O+hIbFQP9HTtE7/@lists.infradead.org
X-Gm-Message-State: AOJu0YyflO8zBcUEXB5PceprZ43BUCmlUSVB2TCdL1fbRsMhB2fuVNZO
	0EGxymmpuV/rIyH0lMh33JJ7XIP32P5FWo71zB+zzgeov1U4/kJO9GXLEwvwkx9cmclBb9fV/Qt
	rm81N17D4+s7OlZ4RAlZQk3IH/ueVWFS2B4ShMFm01gkEcpZbFj9MuWyV86qxKodzajxxYhPzNs
	GbJg==
X-Gm-Gg: Acq92OGW7bE0UMR6n0eK2kA/qdgLB4/n53SjEsqK9WfOfXXFr/tJUPL6joGKRIUQcno
	lXuaYc6N/oZ53jKFzY9hrjrdrS7QG7wPQBpsz/Mgzk15NuOptdlGTSyhEc8BTGg6ehQevJzQH4/
	7YJaPaJOHzaerhLZ2nIjq85co2O6f+DDV4I8DGIrpClUalU2zqBiq1xeT5/ECBbm+BiA9993wTU
	oto1sHp6wNohr1sN9DZOdrtbMkLTqnDnce6ZDkc4GGMLR7mY77mDCXxdvd+3JJd/iMYLTXV2m2r
	c5Ho+t31jINkouaWw/auM9FzSor3Ydbsivv906+NwA290gJIsSUcbytWJxlLTgxImVawt2Rme5e
	2uuVVZ1REawPEIOH7A3p4wRUqX8B18cYgWv++OjdRMmZ0zY1ljglDY2o=
X-Received: by 2002:a05:622a:2488:b0:517:9544:163c with SMTP id d75a77b69052e-51795a08a3amr237897461cf.9.1780926895918;
        Mon, 08 Jun 2026 06:54:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2488:b0:517:9544:163c with SMTP id d75a77b69052e-51795a08a3amr237896651cf.9.1780926895083;
        Mon, 08 Jun 2026 06:54:55 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:54:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] dt-bindings: mfd: syscon: Tighten checks
Date: Mon, 08 Jun 2026 15:54:13 +0200
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CQAyF4auQrm3SjIagVzEumGnBGi1kCkZDu
 DuD7t63+d8CLlnF4VItkOWtroMVhEMF6d5aL6hcDIFCTTU1aMgTRjVW6x1dX+NTMM5lfj0NhnI
 8c3eipqXAUCpjlk4/v4fr7W+f40PStGdhXTf4lcSjgwAAAA==
X-Change-ID: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5KXu1n1MOka6nMgTyyvyWK2ZkHmYE80bVGSOgJWhOj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmHTZEo9KGMUVk8BxpmjyNm9DOKUnoMB7qfu
 hcw12BUy2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJhwAKCRDBN2bmhouD
 12eCD/wN8FRAuWSrx58xHk1mCkSBOc0xnWZjU/Vmp7NUUySzrsPGgw+rjzllYoSGV37yUUSgLtT
 RFP6kVbQPnTOrhvLQd0LTqtuvmzXB565ufn2zII0aNaFSucaEqt5sqoPo0RMlBf8uY4xu+t0hkv
 43QmxGGRSEgkxuSFysuSoIeLEgNHb6s3uXpS07L5Jk5Hnn/tzcx1+SoxjPP8qesLe9bIWt+bObq
 bHqovEx/QEa85QvwTIwAWRJGizhyX5M3CpRiu/lr8ONY6GpXxGM2RD5H0RHEWsDMo6nwUt7ADGR
 Ks6xeJ9rnqr0DoH8SXuQNOX9m/+76XJQyO8QdosxZMXr81m3Pi1vBZZEiR+twCj+kjE7kTry2D9
 5vlDpDPhYfNfS62TR2g3KFWnYGM9JLem7e4KGxxGJf7jDAIA8FLFdLeQVATMTCs7mGW53sJSxQV
 kKvgk9iiwO1H1eaV/N1YTHISjneedRjAAx875WneAgpaDfXNghB3SMm8KTAuNq4sgaGvRRk3r/i
 9M0RXgorNGxhPkWIP+oLltRl+/NCAT89GBaGJMPRaQEXlG+Ux2sDxuIp+tInst8zBKgp5C2X7+R
 B9Klq4MoEGYYB+KWZPmH8amW0TySPq8/IUHKUbIudGKwjzv2vQdJEOd5F1RjOHhdr6ahgLpvAIo
 GONyyfGp+UgCmgA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: iswYEzDUp6WTBBFVGg2kn-DqAVAKtz3S
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26c9b1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s4keiGDSzyMyFUzW_nEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: iswYEzDUp6WTBBFVGg2kn-DqAVAKtz3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfXw6SKNh40Jjf5
 VPTm6xBpKxdcEGqWki2UwGkbNGwCwJwbnfT2A4l9hPanr1P7v/SNow1FAMZ44cpJe/2LR5bqcqU
 alj8wsJy5M8hSt3YrRynKEU1a3LJG/Z1uBerMv6zqwaIH43jvvEeJQWlePVz0vhnuBlLzJJeIAL
 uuZ1Hk8q6vGKLc6Pcw1aN+5Wyp/WG826pp22ZvNshGa+nvUrViekslKNoY2iNZbrIEXLQ/VVWjV
 NopxAu++8GlTTmZKnEsO2iavzbAIwsR7Qafi3NhIhIOGrLoamriMjAsc7zuwNhARH7qR1WCh65m
 wr/bYGd+RHaOAe1elE8l+fk+kZ2At8+GHdTqN4EqQbYCfhwPXzWGG2o4niN5u+Tl/bmpOTuE7is
 bfYKJpMIAEcmc2x1LetmOiI0hkbeT2ICvcaFtalH1E1Uatd9QRwiGOQPB6I8169pBgH0TDzKhNZ
 MfR3ioDya0BwjYeWW+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065457_717608_37B7B4C3 
X-CRM114-Status: GOOD (  13.15  )
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

Changes in v2:
1. New patches #2 and #3
1. Add missing part of patch #1, thus not adding Rob's Ack.
https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/

I tested dt_binding_check and dtbs_check for arm, arm64 and riscv and I
think I did not introduce new dtbs_check warnings. Old code anyway has
multiple abuses of syscon, thus tricky to judge for arm at least.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
      dt-bindings: mfd: syscon: Drop custom select for older dtschema
      ARM: dts: ti: Add specific compatibles for SCM conf nodes

 .../devicetree/bindings/mfd/syscon-common.yaml     |  31 +++++-
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 116 ---------------------
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |   2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi             |   2 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |   6 +-
 11 files changed, 37 insertions(+), 132 deletions(-)
---
base-commit: 78f5e68a8d0a1123dd1b007688ccf0e6876a5c15
change-id: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


