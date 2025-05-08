Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB48DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ5nnUYR5u4H4FMiNdhnizipvd3q4umfiz/JcIFJB84=; b=cIZVcrTlM599Rg9VKA4uub+t8w
	xC5d7TJNOTcMeyCXtbUUueSru/zugMJz6Ncqmef5Mj07DexdH0ZJhEZRjYmstLo4+rxePD+dLxoQa
	OyniTUQGP+yHVA7XYui7PA+sVZ/+YmoRHgoo8GH4PG5T0dYr8iwmOlvIoi6tZyDkijemKSfaXO7Ag
	AM+mF2cqLlmc5eFR7FryNCEn2jKT12Q010uMvAiWBmMxe6Wh/xo7peNLp3ci+nSn5TqDabkJe9yCu
	Y+UTdH5DWzDja+Rb0GEEydPgVMbyn786MY3qZUqWnNihODrb/5wEJqjkRRlmlTNxuIaZOzwH/0oPI
	vJwPJOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2iM-000000011P0-12dE;
	Thu, 08 May 2025 14:59:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1yM-00000000rxo-2Hjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:11:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5fbf007ea38so1702370a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713497; x=1747318297; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ5nnUYR5u4H4FMiNdhnizipvd3q4umfiz/JcIFJB84=;
        b=TWfLa3ac2MnrknT6KN2Eoa3dRRYOJDPRoBMXEOQBAw0vDM3uAKofQtawC7D9vr2kyA
         llg2EwGJL/0X55l+zvgXRPf9bDYJhT8ILTnnSdOTm94Q3IvPtCUW9p33v9o5L9fNwSj4
         tjUuUS5s5cUUQOUBemkYYNgVXuBn19bTOyeAWi8r/7K6dW2qTno1spyxWt+Fu3uz6MxQ
         8ebIdJ+Zimn/wDKyoCNX9x3ejJ5EPvj/z86O4HnOXgh6IitYiUb3Bo7adU9u6yjOM2Hz
         oyze1Q9MbPjTiZ6meJN3MbYRnHHe/Q1JKfArnZqbMennwiz+WP1pDVe793i5aj0uIwUG
         3UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713497; x=1747318297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ5nnUYR5u4H4FMiNdhnizipvd3q4umfiz/JcIFJB84=;
        b=MQWIGr4GEDnFR86OmaRO3hG3JQz+G9a5RX12Jp86PccUIcB1s/qsxFl9ZDWVOBob5m
         Zbb+3lcNebpK6Wum4ACRYqTl9B0s0GLjwBoI76tpkX5E56wagVHx04UpHGvxeFg22s+H
         eev1cWpFw1DE25iGiAWFKMWQ0IeVtKz95yH0ZX24HTEB/4kxwxDgNINLsYa9V7YVSom/
         VUFd9PfzyqK2Iyse+7VCpmvrUvEJptzvhL1M+qhnf5onUrWBS8gx+l4EXCfX0Lb4VNka
         Nnu78O5DD9vfrZH+ziLzxQg7Hk7CBZSCTtsPwxMCjG8DTN/8eEsQ/5iyTc3Bm1R7STlQ
         cEWA==
X-Forwarded-Encrypted: i=1; AJvYcCXi7vhdFqEYS7Qwfu0hQ5P1UxGlAib3UazKlvnMP/OnC03Xr80wlY0Q+/QmACa2qHfHgymldezkaM0QVXTLQjuc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn1JqIMdjdM1laHBWhOT2r+GhZXMJov71/GsGWvxSD/8qk7Mxb
	f0luZEzAsYnhVM6CVl8q87ad8gT+IRUPznWMjX2l/j72K7Yxd13SqW9ElQ==
X-Gm-Gg: ASbGncvHAJPNCnyVvTp8W2FAxFcNbTlcmk9cTEPBvS5DKgVl30TbA94oZ1wHElJ19kv
	mm5Bu3ffCYFlxYVrH4u64bGOW/Kld/GXZ/1sU13INeVwRYWlnvfhzDRP7/Li6OFvrFopRzuts/X
	jcSvMGEK6o2XGx6ilYd8GkHnr+cPL7j+GtKItpxO9ChQKkPB0radmyBWiXcyJp4JBlOv1zwL+3S
	ruKpWAyYWI4MVHgitIgxhFgrvtYwvppuNakI8kQLxMH9kyqllPq55Xg6XKbbhZXjozlyupsaY4t
	mfrFLfNjUOPNTRG5HTaovdX84ZPC7CSBWLTvLCwxzqtZWECe3LZkrDTQT5Eweb11ps/zr3pLgTk
	V4Ynx
X-Google-Smtp-Source: AGHT+IHd64zJE+LTw6DAvxkBFNYRvbilzQkeJXaAqFji8eENn7G5grbiEz4USHisRKUg1+1wTJQ+bw==
X-Received: by 2002:a17:907:cbc3:b0:ad1:91cb:3976 with SMTP id a640c23a62f3a-ad1e8d2ced6mr712315166b.58.1746713496490;
        Thu, 08 May 2025 07:11:36 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781bf6asm11338216a12.44.2025.05.08.07.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:36 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:34 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: qcom: msm8226-motorola-falcon: specify
 vddio_disp output voltage
Message-ID: <6143603464a65aebbed281fe6c6164316dd07269.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_071138_586653_DB26C4F9 
X-CRM114-Status: GOOD (  12.63  )
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

After some digging in downstream sources, it was found that the vddio_disp
regulator's output voltage is 1.8V. This is further confirmed by the
troubleshooting guide. Specify its output voltage as such.
While at it, add a comment specifying the IC, which according to the
schematic is the TI TPS22902.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index d6d5a86491aac..e6392f7d14c75 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -62,9 +62,12 @@ key-volume-up {
 		};
 	};
 
+	/* TI TPS22902 */
 	vddio_disp_vreg: regulator-vddio-disp {
 		compatible = "regulator-fixed";
 		regulator-name = "vddio_disp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
 		gpio = <&tlmm 34 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&pm8226_l8>;
 		startup-delay-us = <300>;
-- 
2.43.0


