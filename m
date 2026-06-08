Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29715CD8CAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=; b=0eyH0pjlXQl6Wr
	JJ9ppO2DIvqnz86iIEj8ZyNoKXqB4zlLFBZ8wqogFa5rZ9qWgEVCTRmICN9D5vKr4aLTwhARHTL6b
	0Ayyypro8W8LueN3R0Y3h+FJldsCe12uJgA9wkrYBRG9C2CPjgpVQXgi7XsV/tXkCAv3n6f48bS9P
	L5vTuEJXmq1HtBUqImFoVOj/zIuZYZmIHqRF2J+mvwiLMKXQ6VMgdTKhAWNZzRVuXj53/s8PbVEHw
	g6pFXViNk1Scq5ct3lD03Nn5a9mmwzA/bKLA151eMKj3vdt/K7q8TtqOF6H24n6mpaATaKyt2euuw
	rXdfXo4FIyHrponvlUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgpu-00000004NHe-3iUK;
	Mon, 08 Jun 2026 20:44:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgpq-00000004NEu-1hc5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:44:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IxSOH349169
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 20:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JZcc6TPeUx/2ww8Z8bbTx4
	r6S+aoLRf/jpoC61OzVbc=; b=MGT7HmAOHcVdj0yATV7HMAwbU5uk4J313+T5nm
	84kICFmcHfToU9Lqm9Zj1W8my/y4+rF2I1dGopuun62rFv8Fw2trVIkKDB3yKySW
	qydpBOtZnfMRszANz62Pt50+mwOEp0Ujx4Zp18DgPJCVsRwORM4Er5MujfDwelpy
	ptJDMUpbk/tCmC6s1na0lS+aQUhoepuuYyFJBT0tP7qg8AZABd46rd0j/jD4sGWe
	Pih62qqCqyu29l++9QOUW7MKDU7kcjJF5AxMJXi8jD4J37DBGonSUMg6w0aopY6s
	ItlzeTEe2ujWvVOt4J54RBTMEjcYrpwJuSquw8sPHnljJNCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvabq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 20:44:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51772325a64so65798081cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780951477; x=1781556277; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=;
        b=DHpabBgWq1vgimyfWBJm5tXUsueHfHjMvTWRA5eICygaBK4KtIGrU0X8xxFWF9ew3r
         Zuln2eUxPHW3/dcQks6nsaZuvS5Qhc7c9vP/eLK2+dR4fJNG6B4PyruhLQtLMrk1sEO4
         NJst35ym74K45uT5r5zQywUtEdX+noZwoOcB3kzXP5GPt2WnGRN2irNmufMpOlYhWqbe
         twq83t6o44iWbmsXehv0k9mHVHmntuDmZQHkhz0JaYtbGw+N6fCfipzmK9fOhbZHpeFx
         sf2DOgqcYL1vj8Atph+h6Tx3DNG0ivEkv7fbgbYeU8n4b875AYpbpe/CSe1GJDh6ptdK
         kMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951477; x=1781556277;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZcc6TPeUx/2ww8Z8bbTx4r6S+aoLRf/jpoC61OzVbc=;
        b=OwSVAqLgT2B9QHaxpV6E1dJ1jSZHz65Vq6Li83FYzlg6yHoHtEaBmItpgiMJve9UGg
         /SiAWyaCzhScrY+JUZy9prp6ChwmMie0tDO6AaR82cmcRQ4bZMlf4BJ8OveJDgmRmxn5
         FvFQ0c5Upyk+4M471hrKvrOwWIF+8DuSQ3T0fC8ML2DlBBdF0hIsFTPOoxO01Zdm1hWV
         scjgvd13VUXx2OQsI10h8kowp5vg79NYIjvdfWezr0OJmR3OsPeP2BJ0BrCwK1M2am4l
         N/Sj5ZDA4XBFRlPI9kiMJPkb48TWjbifQ7O1kJ4agyTaqHmDoiZ6rdKjPtvT/UYqnCJD
         bOzA==
X-Forwarded-Encrypted: i=1; AFNElJ8HAglOWtYVkSdvfUhFKEEWqtOMv9Tbu6gr++KXRu+RUjNB42ZVsIonGCSfP3xoJfaoBp5cQT11f+4/jHThD5kq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+PcwVlOM0huo6tFTIAAfa/sI8FiAOk9aleCp8lS9tOXakakw0
	gtLMW+1yLK8m7IfCQZIlq0GEInF1f3Ok3Oy8D38LlHZ3rdTPO2o65y6p4XwnBajxbzCSs5sN1Fx
	qI3pRbNfRoueVFfs+nezFHJPg7rm+S8P4/cUXmGDmEchCDMRNJTeiH2lyNLeHGuoFx3r8v9sVYG
	OrFw==
X-Gm-Gg: Acq92OGspKHAkW+s8l9xMsuXTH04RK5GMu14QjY5lXSJhczr22Y2/oikxdxBhophbHn
	g689rMdYCLyrkxlLZsj+1lrPBY3rP3cUh/pqIOejjWOYzCaAnlUzWlMfacssnZcXY+ol/su/GVS
	Dth6VV/UjfP52Xd5WEYrD5CUgqEfz8VoFvUFqk9P/uz3X6TedRZOzL1+nP8ouMfLFwyi+xTnt55
	Ba0t8eUsNwZK0pjz/J1KJ+bf7jTfjlE7RCGL86IdfIHj48vSPBd/ETAfNkenqabLaqp1WwRTDWf
	OKg0bXlcXn2Vx33o3XFDPp/m8EMS4jaIsd9hPFXV3Db6NBknyhO8YjH0Mke0eGVrLR9ZXNlL51y
	rI6wzks9bqWvHJKZLA2PQV9GpPUToUNjI2+FhnQuZpKLmKfUNZbDt//o=
X-Received: by 2002:a05:622a:1f90:b0:517:75d8:b95d with SMTP id d75a77b69052e-51795c0cf7bmr247057251cf.40.1780951476573;
        Mon, 08 Jun 2026 13:44:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1f90:b0:517:75d8:b95d with SMTP id d75a77b69052e-51795c0cf7bmr247056621cf.40.1780951475888;
        Mon, 08 Jun 2026 13:44:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm44018439f8f.32.2026.06.08.13.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:44:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten checks
Date: Mon, 08 Jun 2026 22:44:23 +0200
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQqDMBBEf0Vy7soSRbSn/kfxoMmqWzSxrkpF/
 PdG+wO9DPNgmJldCU1Mou7RriZaWdi7AMktUqarXEvANrDSqDPMMAcHdoaanWXXCggPY09QL8F
 uYrwDSgrbpJhXqK0KLeNEDX+uhWf5Y1nqF5n5rD0THcvsp+26sOoz9//aqgEBNSaUGZ0W1jy8S
 Pxeqt74YYiDqPI4ji9iGIV15wAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Xa72kw9Ltgd7CByB7B5latAUb0JYhrgHD01OqlPHas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJymqXzctnjCZTlgfqtTkKkReZfSxm69dcth3s
 +3KPVCaK/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaicpqgAKCRDBN2bmhouD
 12o+D/9dEqmiBDrunvPNTigrYZ65joY0Y404B5kMuUHwxnjcIcSDy0bYTIMZus92hnmDEYvpC9U
 i2tw9EoYNrO1EeZYBOWcj+FJKTG5wLwU8EqAG5w3fIa2zQ5rVTe+zDoNtqRzLgckMUTIEZVoWSl
 xx/h49ZbzgXV9CJzte6U0Fp3ycwf0J/HUsNBQqNpdja+HyIoWu5Qd4HWIFShKkueEUH8KcNSwnJ
 1TC2Rn4T9MbSDCBS/0klhPlGPyYvR1WG42P3wjHdLDH8pUHPHYBBPrRNq85x/OK1BKmigWgYkam
 7ZIy5F0wlV+4bECVkaIfnFpsg2p78TeS9WWPQgGmIdmfb0GPbMkK9PkDozcrjmLEJk/QRny2IS2
 79lvO18dQiOU738h5JoKCuWKzvLCoBtiw627Gbqo21BHDrLWo8oF3ZWR3kXm5RUPVnRTQ8EVr7x
 F07R0Zx2p4W1tYV4zFk1IV+3EbHBSbfAJQle3zzH24lTJr8rOPXXbnu+2F2CbirwcO++zy7xoTb
 dXOxD+QhaGr6V/LYklyLnTx9IdHl0LJsEnzLdfpfUal5h6SuMSxFInElOpARadLe8wgkHeegyap
 mybKDxrB8IWZUlFjKaqVHhruAjaUBKUEjuTpgmBT44Z5ACshQzaraQj4ifeRN4qFcde73irdf/H
 QC7QfMmQpvt0MRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: XaDWh_5NHTIkKfXjMT9yICtsxWyFQ_hJ
X-Proofpoint-ORIG-GUID: XaDWh_5NHTIkKfXjMT9yICtsxWyFQ_hJ
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a2729b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=s4keiGDSzyMyFUzW_nEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE4OCBTYWx0ZWRfX7VD4MyupLQWK
 dRt7Qw+5vt42iNJ9LmpCvndbDVwhszUH6kO6Df+E3Beb/TqtQyNGVsXtvJKEkzg8VglJbFNJHd0
 PgvjZj5Lbu8pcbLP80lgQi1C7ScfTsjxWiSP82NWqgx6YTH7cFJ+A1/7/qW3o6GY8spvZdEdnZL
 9j0Y8okt2Mp7P27tHJ0uVeilhQHy9YFyWHi/aESy5Ue6lRClTdQPJRZbbkP9JcQqcSo2KwS1F0Z
 aoMlYKYRm3fzwrDuFzfZ0Qy2x45zvWE+2a5apQQyprAsrjEmyNEjzf335ew4651i/YcA2dAS+kF
 h89FqW/SDZG5zi9Qgerzi85LUT0O2A2yxK2ACPmmPwwgtr5kWPqPQ6mDkTeSbFhFXvep1qyAtlP
 yoZ5kBbq7anYMSeIMHvSxcbw+WSJcSMkhezdoKPcD4xRyNGfbPJREulxzqYMCZcgJzuTiD5bXMz
 4C448eqcesNzoP3CdWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_134438_590961_76ED36C5 
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

Changes in v3:
- Drop patch #2:
  dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
- Bump dtschema requirement
- Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com

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
Krzysztof Kozlowski (3):
      dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      dt-bindings: mfd: syscon: Drop custom select for older dtschema
      ARM: dts: ti: Add specific compatibles for SCM conf nodes

 Documentation/devicetree/bindings/Makefile         |   2 +-
 .../devicetree/bindings/mfd/syscon-common.yaml     |  34 ++++++
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
 12 files changed, 46 insertions(+), 128 deletions(-)
---
base-commit: 78f5e68a8d0a1123dd1b007688ccf0e6876a5c15
change-id: 20260608-n-dt-bindings-simple-bus-syscon-e39df408a02d

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


