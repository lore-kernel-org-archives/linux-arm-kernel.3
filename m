Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FE8D59F6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgGvRXAJpj726ODsHfIG2S7bKnZ+OBr0kVdo6l+s/Hc=; b=23tXJKDXiKgOLESS13AYZ1GvOr
	vMLsvCJG7AJovkcoR2Npm6IfO6ESN84egk3lx8G0XsPhidV4EpTvdRHgWlV1Kv2/aK0p1vR/Rjok+
	aqv6yRQTvSdufSesTEJE0Mtwy+HS65u04vSyoUAYqqCUAB+VUWeY9Rxk3WRl3rlXSNVC7b3NcDHrk
	5JTaPGmGfxW1avc2Cz0hxqD5WIFPX2Y51FHADI/n7b38yBMxgWfWAuiH9DkjrD7afGgpafgrrpzeh
	/UTCOUNS0e64wpPa597mDv8IGzcbSezllOnIJey8DOWbeB8GX1m1cwLkrqpJZy5a3ozl2PUtdIcf8
	9iE8Vnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lVU-00000004T2W-3pcr;
	Wed, 06 Nov 2024 19:15:56 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lLw-00000004Rub-0OIw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:06:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99ebb390a5so230639666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 11:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730919962; x=1731524762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgGvRXAJpj726ODsHfIG2S7bKnZ+OBr0kVdo6l+s/Hc=;
        b=ic0xHbOgrNBMuQkTQXYxFjEjiZhaJk/9yJyaz/9m6D9j8gmyrv0RgkrgNf1ze+1paV
         AwjpsxoMnUeGh7GlM66c2I/j9Cto79BCWrB0J4Cse5Hij/6h2JkI8iaeESEdWIbj2bvI
         acKWw5f5Cx0oPEvYpuuRrDTcfdipa/mHKo4RXwn5yaqk59I1JiGKrcdG8w1ODAZEa163
         pJNdjeg2KuDjzPcD22cpbfTWSt7qulNimW4msWC/wPPc2RQbfAjO2BUGL2gsRjM22uJ9
         No2thCAJzF5EIbeQa1oOMiHJsg9aVqMwZ1Qy1FIahGqqa7rx8F0xJEXYQdaxKshdmknj
         cmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919962; x=1731524762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgGvRXAJpj726ODsHfIG2S7bKnZ+OBr0kVdo6l+s/Hc=;
        b=NVcUazG9cxKKha88D0ag+ih1jLTQZZW7nzBg+48xf1Rfb/GNIF54i41F09PCh4tpzc
         q4MYzx28O1BQU5GRQydUMo19gEvwL9ZjZ8jwufM3VucJwMEFMuQLyQgzVQajAMMnvItn
         CUGhOa5H+NxY9o+72uAZJ6uyNU9QCH6xiPRrlIMm5w3tmK7Uj10k1g65VMGFJnzyAuOr
         mZmf54Lbx8DdlnWxXfY645+CHh+oeB2IKGE5v8aXk7x8kJtA1+Ql5fpEfSuxE8+afnvO
         jHRuQyV9J0pvl5MM1U1mOaixm5ijMXBhiQhCu6sK3BccxrPfxtpP34OPUjbeoNH+6U9S
         ijPw==
X-Forwarded-Encrypted: i=1; AJvYcCWnA/QEpjnH/uQ/xdsAqqLgv6EDvIVYxzyo0SOldIqsPEU1h+hMpKBEgcdrIvgYVhDkAFJHhEAXVpnKFBh74Y7z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyd1IrJu5RGgrNwM4n8CcHBHgDrdjqufrImzqMJSAe8boJ3cmd
	AoVnyXQHy9F8I9i0m+DsS4jwAfGQh+tSiewC4rWCeJC7GoNBvjV/mzIuKw==
X-Google-Smtp-Source: AGHT+IHJzr9hbdLpV0PDZSH3MlBedQIIjCpH5cN/ogIiMjoiS6oKXKwoy7Qju43dBWT7plFuZ3cNUw==
X-Received: by 2002:a17:906:d542:b0:a9e:b08f:867e with SMTP id a640c23a62f3a-a9ed4cb4df9mr40078066b.16.1730919961922;
        Wed, 06 Nov 2024 11:06:01 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d9774sm324040166b.65.2024.11.06.11.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:06:01 -0800 (PST)
Date: Wed, 6 Nov 2024 20:05:59 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: sprd: sc9863a: reorder clocks,
 clock-names per bindings
Message-ID: <d235438fbbd53c28b63cada2cf7e1234c120355e.1730918663.git.stano.jakubek@gmail.com>
References: <cover.1730918663.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730918663.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_110604_160800_CA1E74E6 
X-CRM114-Status: GOOD (  12.31  )
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

DT bindings expect the SC9863A clock-controller clocks/clock-names to be
in a specific order, reorder them.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V2:
- new patch

 arch/arm64/boot/dts/sprd/sc9863a.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
index 31172ac44adc..e97000e560e7 100644
--- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
@@ -163,18 +163,18 @@ gic: interrupt-controller@14000000 {
 		ap_clk: clock-controller@21500000 {
 			compatible = "sprd,sc9863a-ap-clk";
 			reg = <0 0x21500000 0 0x1000>;
-			clocks = <&ext_32k>, <&ext_26m>;
-			clock-names = "ext-32k", "ext-26m";
+			clocks = <&ext_26m>, <&ext_32k>;
+			clock-names = "ext-26m", "ext-32k";
 			#clock-cells = <1>;
 		};
 
 		aon_clk: clock-controller@402d0000 {
 			compatible = "sprd,sc9863a-aon-clk";
 			reg = <0 0x402d0000 0 0x1000>;
-			clocks = <&ext_26m>, <&rco_100m>,
-				 <&ext_32k>, <&ext_4m>;
-			clock-names = "ext-26m", "rco-100m",
-				      "ext-32k", "ext-4m";
+			clocks = <&ext_26m>, <&ext_32k>,
+				 <&ext_4m>, <&rco_100m>;
+			clock-names = "ext-26m", "ext-32k",
+				      "ext-4m", "rco-100m";
 			#clock-cells = <1>;
 		};
 
-- 
2.43.0


