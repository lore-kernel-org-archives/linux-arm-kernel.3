Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA68ACA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=; b=MKPbm+prwj8rIB9lQQLzIhcONr
	JoXuQ1d9QG0kEi+/Qq4Y4Ni4Ro4hY/YQGVRXlSfoZmSHCGLaP9iUONPnJPh78kqZsmcM1vyKfmlT2
	vZXDbtr4uh1/gRUBmaYqTEg8RcUJYpOhJ5CRo7ntDJFfI0Q7J6bcPxD8NsPw3dBVNP6pDojima6RH
	isjomi8T/SuElYw4No/rLxD88M7nhRcVmghAFm32ypg53zT1J0IoWbOEkXN9mggOOq08pwkavgMVE
	x5x0ldZguAXmbjhClMVRJNOXcE2Nrle1Kd5dk7bx7OpfDwFfl+g5wXi0yruB2ssw7IRlpAWC0M3xi
	eBivN9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWU-000000077nu-3mmr;
	Fri, 09 Oct 2026 19:44:54 +0000
Received: from mail-qk2-x03.google.com ([2607:f8b0:4864:34::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWR-000000077lm-0UAD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 19:44:52 +0000
Received: by mail-qk2-x03.google.com with SMTP id d75a77b69052e-5339079c84bso107061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575090; x=1792179890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=;
        b=B9f5/vldpuqxsCsRfaKbDgTZILToD5gCPbkfnZsVVh9Fw5Eaifm6Za4oyxFUgyOoj+
         cB1/QFnlkvG+KYQHF+Mmofoug3CW4yZrHh5yRgh0N8G4xMyMJRwT7PIM9Rj7vSqVsN9+
         5tok0ftBSYYqfooGHFlP8Xv2XjQh7vXNcMNY94rny9o+96ulOn36IWhjpocQDFxJpNTZ
         PeXhuYfjPJiKzDTaabakra3e+fpUkaR774obzh0XnPlcTLJezcPhFdFNRwhh6YzG7hky
         TEWvSb9ln7oWeK5W6v/iZTwSCIksxo48xhrQii+MTte2qF47tYdIUhn7J+opfhgmFlvT
         cybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575090; x=1792179890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=;
        b=AE6ScBQOPY7h+cr1Qyyzq4SgLAt4eBDrGPm7m29bsDGWEnWhUa8vN7XKefve0HFUUF
         6oqW4/saCH3B0btppREIATBRAP0KmXFWgtw4FSfCEBzrcms7xa1y53zYWfhrxPKwDui3
         1/zZ6ImVFDxIjTxF0OFqwYJCtdxw7jdDh7e269Mqj34uhOnEuk+D2d/kCghWYr+gz8KB
         5FXjrqpoLTEGcYoZy36zZ/f7F2/TrBEIKyfBzRPshL8VqiMpgIL8sgaqJHrvSn70jXDW
         b0j/8gfqOqGIIPg/g4lVJgSTmQ7jZ01OzqwGfsxOptDgMvutCS996gX19Ma6+QCI4C4K
         444A==
X-Forwarded-Encrypted: i=1; AKwUvByZ/YTyhZHCliX69X/SimHEuh0swJMqOckI1/0mkiVBMeSmqpssrZjEUnnx9Y1XjYWqe20ugHu6Ie0da4bvEol1@lists.infradead.org
X-Gm-Message-State: AFuF++m3/7z1lSs4RPrB97YajK9V3zqLbsJxd6gIqeknzXmbJosbhX9B
	dHdRMrWIf5DFqHY7uAn4BSXRNns3WaDeupY8Gdz4m5r2UXFkLoHyIA7DbWlNlxzK83E=
X-Gm-Gg: AYBFou3wS9DL5Nr6k+RTkGftL4Phj8jlVLgF1o7bIAxcbWC+BxYxnZ0QhrFHUDf0R4U
	pZF6q+otTY5fJrhg0tdVNFQcmpxY7YoBi0eqOJvk5zZiwxkApqtD2aqnF9HIOBiHt0oYRmLAYiE
	xiP+2uvijbiW9+YHDjLFLXIajyUtNa960e1bv8AngWbf3AiHU2Z+Y+zs7+QMcQ1uwVfL0+MZhRI
	OkCTUULLNu2Fys8cyEWrTIym+NQhFHAM9l3oAvNZ0Bhb1mn0hQrQL8ZR4RlxQvWaKZYVWUV54Uq
	/1UlnV29Y5NIN5+SazAka8JaVrv8KvIDWCcvOBZQwCNcO4644AsbaNzpp/Cknic1Cuy683jEY3u
	YTl07TkFNwg2Mjwq7x8oideagiLMoh+L1MvjzuY2c8zjtw60FWIOga19Lo6GQqDux0B2L4MP5of
	UcY+0fKmVTLyE/0wBt6w5UsQYCsiv5aGFOjwUkYhqrQ9fUJDFAVOD86Bk0JeM2HcODWYppFvqGP
	fm6hAOjZsMFYA7kgELyczdnoCWVeWNWd2AagjZeWJkDl/zp7SvTJrMQZxYkNm+pkzK2y2sNEUs=
X-Received: by 2002:a05:620a:4114:b0:93e:c173:f692 with SMTP id af79cd13be357-93ec1740673mr344729485a.38.1791575090195;
        Fri, 09 Oct 2026 12:44:50 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:49 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 14:44:44 -0500
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8173: Mark the lowest CPU
 OPPs for suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-2-ba13f826eae1@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=1277;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6mQzJb6HQwk/MiupaE++x+vH8v5ByWD2TN9pKFcfIxw=;
 b=gj/o9tBfq/u6ETFIfGltk7J8BWOdbJWMwl2Y6rCdaGMSFsSW0ix2W8xJy55yWtCQ3zXD6INIY
 13nPrTKxq5nAiEXuBKEl34WBlW0aJ9qkX1kzvEvLJvSkxByDdA/pOB5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_124451_172760_CEFECB11 
X-CRM114-Status: GOOD (  10.42  )
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

Both clusters otherwise enter system sleep at whatever OPP the governor
last chose. On the Amazon Fire HD 10 (2017), entering suspend-to-RAM with
both clusters at their highest OPP measured 63.5 mA, against 52.0 mA
when they suspend at 507 MHz. Mark the 507 MHz OPP of each cluster, the
lowest in both tables, as the one to suspend at. mediatek-cpufreq uses
it for system sleep, and a kernel without that support ignores it.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..7f1af15cb934 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -56,6 +56,7 @@ cluster0_opp: opp-table-0 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <859000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;
@@ -93,6 +94,7 @@ cluster1_opp: opp-table-1 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <828000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;

-- 
2.55.0


