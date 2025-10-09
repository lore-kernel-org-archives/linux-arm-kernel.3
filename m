Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C04FCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nyerg8bw/pkBgKExI4csMFP+hBYhO0IhRcEHv3iMtPw=; b=JqilLJuoy29hq7xgy/qjHOg80X
	qG+ort+Q1EzG1CQAQqAvDsWn952s66feydUvmwFr25Z8tKXEdu/o7fJ/T73Rc5FrxVfXQj41+kyBp
	PZdRA8D5XQ9gDInxrnebkq491nwj714ZHAuA6lrc7LmBwH64nss5MVfLDhVQO6oLs1vyBOgPngO3Z
	fLea2JKjbc3QuZVEkITcPXAdtskqBX/428lz+PH2Kxry0ZtyrliirKBX3rgo2wYVKmZDf8GWTyCIf
	+JFiFRXUf45KgPYgF451FmDQfciZEpyOG32E4PSsXzUPsYDaBxQeMoWSVm3fS0YsCTe8Wye+BI4Uk
	WCGHflfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pqx-000000066eA-27zs;
	Thu, 09 Oct 2025 12:34:39 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pqu-000000066cr-2emQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 12:34:37 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3ee18913c0so138480166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760013274; x=1760618074; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyerg8bw/pkBgKExI4csMFP+hBYhO0IhRcEHv3iMtPw=;
        b=l4IvsRLznKNZWcZZq+hCp96a5G+WdaQ2+uKA5iOEQGwK1CKlo7aIgS5nK8M8SI6nEX
         wC/SFouppOdEA9HUcg45gJCN2pDQH5QGHly/iPBa2jX1p96Dpxl6CneOCKaHexEGof1x
         brbYcs8+rts03hJ0BTAlofTXMxaXktvjVSFiCU7JJn/utUyLoQhRaCGjsonxYTZ2IWt8
         DaQWVocBrH9/N2x2kX3/fOA27ki2e8+7lHFeomqSVJ8medZQX8CPQ50/TaNb6PeH83/X
         y0aRhTCQo08LjCiJSkaKBgDgh/cJbLdE5iwHYBxFxJ/igdMtJJJPwFrE4mz13Dut2Pei
         le/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013274; x=1760618074;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyerg8bw/pkBgKExI4csMFP+hBYhO0IhRcEHv3iMtPw=;
        b=fCXbMeK5A5HnxFCzLDEVwU411Mus4k+Ou3qWzkt/EZJy3AGEsBgTQkkcXJONK352na
         TKirxKUNE2sehWBRcHq3CRFKAcICFzRvZJfBNBxJTHRyWU5HheDhmlEVjz3LoLPobJ1W
         sr4zVDGLlMZPQMCZwi8lT08d3Inqflc6dfZZpcEn9MIS7J3qVNz9kJhz1YIhzdyRWvhG
         UfT+xLPw00o/1J7wtt/RSH6DHzbjbbcjgJb9Dq3gS3IrpovCX491ujyg4QEukx4/Pd3o
         2Yrs7GoRoJzQHkPTvs8xEMkYMgUsaD+A3j0Klt58WZZMdzf2yKrCKltraaCom7FGW7Vw
         irew==
X-Forwarded-Encrypted: i=1; AJvYcCU22a+hNQXN1b01e2l4/qV/okzL6J0067knKaE6aIda6p6aM+1CPJdSQpWbsR0N13EUwp6UcObf6Y7jVKZg5MJe@lists.infradead.org
X-Gm-Message-State: AOJu0YyNVMam6k0oM3qMafrObJWEipAEtPOYgmI1b8LeKrhpSHLIgMWz
	taYSh+wQc6usHK+ZewpnYCTWb/k8w42ee/ywFZykPS+Rf2gDpCFF/Cg0
X-Gm-Gg: ASbGncs9sDkETR2Ny4QmMQvMANnxdWu/pl1kEQeqIwv0UO1xgMRsG8e7yuxuMWxILvR
	7t8VJO8xs4hFMpsN8AhdSlH7I4vo3HVO4g8U8zrCkWUbEuQc/2Jh/G0ikWkcAvw3jyYQzmAQxbP
	t+AkhoIiH3dVy7OC4k1IOxjK96HC+w7oa6EH4CHNETBqaVUA3yAt9F0d3QDfo8M0jVP0MhghcS2
	ADo2sffO8ZlhIM3NGKGG3aivgynoa42Zv8BvjwGl6H+7+nRFFsdGqrWPL9TN4QDPkRuArCfX9IC
	ad+pcytW7iCQiSmeBtnZJfuYmuF9WyL9ErUuYMHWCM7H+sRAmQpzGQ3pQgy9/gzJHfet2VoHTzo
	giwpASkv8P8daeOeZFN0sdodLa9jBUw66fal5O7oHwOkoO6sN9Mk+iTQRlQwDIzcH
X-Google-Smtp-Source: AGHT+IG5+niC5l+3hZxoFmTdeEk+aq9D5d4xuawADwnDB5QSeo27pDH2M5zv9nhRFISRnH+oe0SscQ==
X-Received: by 2002:a17:906:abc4:b0:b46:1db9:cb76 with SMTP id a640c23a62f3a-b50aba9f7aemr661934966b.39.1760013273388;
        Thu, 09 Oct 2025 05:34:33 -0700 (PDT)
Received: from alchark-surface.localdomain ([185.209.196.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f741f1sm1897957766b.39.2025.10.09.05.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:34:32 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 09 Oct 2025 16:34:01 +0400
Subject: [PATCH] arm64: dts: rockchip: Remove non-functioning CPU OPPs from
 RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-rk3576_opp-v1-1-67f073a7323f@gmail.com>
X-B4-Tracking: v=1; b=H4sIALir52gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNL3aJsY1Nzs/j8ggJd86TEtOTElNQ0CyMDJaCGgqLUtMwKsGHRsbW
 1ADNSMK9cAAAA
X-Change-ID: 20251009-rk3576_opp-7bafcadef820
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=alchark@gmail.com;
 h=from:subject:message-id; bh=a4GlgwvcqPDJxB9eGC77cLnTgj/F4o2Kt+bX3hdWo68=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ8X30+rrirJKPy35cLE6vzVzz96aV/79ybX/OypNb8F
 OO4e5xFsqOUhUGMi0FWTJFl7rcltlON+Gbt8vD4CjOHlQlkCAMXpwBMJOgHwx+Odob8xd+tJv0V
 WjN1YuJaEdNUwe7spqTeh035uhb/HzEx/BX76hJQJrf02J/iedG3gh7xfOm3EHRcvUljvnRcb8E
 6aVYA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_053436_690775_0DCEEE28 
X-CRM114-Status: GOOD (  11.90  )
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

Drop the top-frequency OPPs from both the LITTLE and big CPU clusters on
RK3576, as neither the opensource TF-A [1] nor the recent (after v1.08)
binary BL31 images provided by Rockchip expose those.

This fixes the problem [2] when the cpufreq governor tries to jump
directly to the highest-frequency OPP, which results in a failed SCMI call
leaving the system stuck at the previous OPP before the attempted change.

[1] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/rockchip/rk3576/scmi/rk3576_clk.c#L264-L304
[2] https://lore.kernel.org/linux-rockchip/CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com/

Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index fc4e9e07f1cf35fb57f132c6d82c48c62bd6265d..f0c3ab00a7f3447a1dbf7874c7bf758e82e04f25 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -276,12 +276,6 @@ opp-2016000000 {
 			opp-microvolt = <900000 900000 950000>;
 			clock-latency-ns = <40000>;
 		};
-
-		opp-2208000000 {
-			opp-hz = /bits/ 64 <2208000000>;
-			opp-microvolt = <950000 950000 950000>;
-			clock-latency-ns = <40000>;
-		};
 	};
 
 	cluster1_opp_table: opp-table-cluster1 {
@@ -348,12 +342,6 @@ opp-2208000000 {
 			opp-microvolt = <925000 925000 950000>;
 			clock-latency-ns = <40000>;
 		};
-
-		opp-2304000000 {
-			opp-hz = /bits/ 64 <2304000000>;
-			opp-microvolt = <950000 950000 950000>;
-			clock-latency-ns = <40000>;
-		};
 	};
 
 	gpu_opp_table: opp-table-gpu {

---
base-commit: ec714e371f22f716a04e6ecb2a24988c92b26911
change-id: 20251009-rk3576_opp-7bafcadef820

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


