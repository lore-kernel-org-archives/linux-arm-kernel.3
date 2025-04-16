Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9rF9Mh0w+Kj+uaO05jBBZXC+GX1PbjeGPNbhu05MfQ=; b=tx8gnH7pYiDvDMprLJAjVcbHoE
	154yQkHEa5F9iJQ0TmjJ3e9PU4mD7Vk7D0SBoCtG3RRpJvBPrhLSGyhCMy6v6jhGG1IKQjgFPpUXO
	8JLF5H2+sYNUX+uao8kMYpv0QvlgCuwEkyZdKlQRquELaXDf/fOqOcuBymcIlN5aEI2J60C1GmVVD
	VWg/mOHfFnV9UlIPSNpy8opZiSfo4mFsHMwYg6D/VIOq4RmpOQUiF4kh0krAGG0MKVCxPJCtv0aMv
	LGebYQV60Ke4A3g/vHG/GZOLaSLELdJXB2me5sX+tDDDT/vPKvS2Q7CP4GsDsFXvpNyxWvQsZjNkv
	BO8V30eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rIl-00000007ljJ-0gTx;
	Wed, 16 Apr 2025 01:10:55 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rA3-00000007jp2-0lxN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:01:56 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-477282401b3so61894231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765313; x=1745370113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9rF9Mh0w+Kj+uaO05jBBZXC+GX1PbjeGPNbhu05MfQ=;
        b=N68D2+HRalQW6LOwRZFLIjpXzWoSjBNNhEudB2oh4vjN/wVH9gUXd9wjfJXa486d11
         9aMYfdnkF4B0jTL4b0jm9/YQk9PaAaRiW9FL/VBiHUWId5yuzWhCNErk1dyNPc9XBsQ0
         LfcrPrH4Pxet/iO/zoNGDm5HouX+g1PiRjEUMs/ZQtDgFH6BCbG0271+6ogQ2styQLNN
         +xzw/dvhPbu0eDGRjB08t0QV82O0FzdPa66Hyom9WIJCNJPNrmfKNRIZMmFTI/AVXXtq
         Z1By06tK/S0sguFH7UaYjSZTGvCXGO0V7dSdjNxQ+SdpFedIhU6P0A7TXM7Pjqp/SlGX
         kVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765313; x=1745370113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9rF9Mh0w+Kj+uaO05jBBZXC+GX1PbjeGPNbhu05MfQ=;
        b=WQ4iEoltGnmaa2tIgczoT58zstZFm+hhIhCsVcQBS76gep7MdlJaaCeABiKWAd9gIL
         4V7CViegquWcUDaz1lh2tjjaiOrsj3vgzLzinAnWckTMyjLVRXoKAuQxyZpHVTmKCsLx
         q3N613CSZQZTW4RVTihr3DbBO+fpcuN9KPGb1JdBQAM+I6r75fsivkiZfBPnOP/9lI+w
         mZ8HHxMAKiVznddCmLNeXjacm0g4607EbkE1uXrBFAgNcg1ujtWW2n/K2w6VpKe44xWV
         3/54HRkeBjRCRTtBpS6pKdZCmDu1nHAW4Oc/ZShMclBFzej1wqrVUM+d5CRlnWshfJLQ
         cyng==
X-Gm-Message-State: AOJu0YzcUJewto1XcFpZczYIpwBU9eDgrhYkhZtrQ7VPOHhbJygN0Vn5
	wK2UNnti02Q4zhbZqOBJYuSOwVM//u/0mzUthg3kEVKkfj8TsCRwLNUDAQ==
X-Gm-Gg: ASbGncvk52w0X2qIOmy+LvOtjFg3NMRnV+hBhGcIad/gVZBFk4mcsP26nMiHHpgo8dB
	da51P083oVZhtD3UZDa20pmjfy+Vb8CRl3iBS8lDsE9a/TApwbqqcJzLH6l7wHmz0ODdNUErQdd
	sVwCKzCXOC8OqXx+3E2OWutf7ko1q9mSy+3chue6dEmB31OwsMMVr+6J+TgqnumQmPKu2ccu/oh
	gQzQjPoDHXrbW/1kUPiJaplSzHjRfThP66dVHlUc8F5Zuegvw7nbCV2rb5SuPTeWTReEhpRlrfa
	vsQNCvLkTrlbU5AU0AD0CR+Znb8+YEeTtrzrR4r2jOcfQ0zcpxRbz1ZEAlaxpbTJ3mBFz1zC6fY
	AyM3db/dj6lh5jwA=
X-Google-Smtp-Source: AGHT+IHo8LW4/kQU8vbnG4ZIc93Rt6FiRzzyd/pS66bVb4v5nXdfGqbOemh/k9HlpLvqVxNmTUc+Lw==
X-Received: by 2002:a05:622a:110a:b0:476:afd2:5b60 with SMTP id d75a77b69052e-47ad3a28ed0mr21853591cf.15.1744765313439;
        Tue, 15 Apr 2025 18:01:53 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:52 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 04/10] arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for HDMI audio
Date: Tue, 15 Apr 2025 20:01:30 -0500
Message-ID: <20250416010141.1785841-4-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180155_233987_0FADC192 
X-CRM114-Status: GOOD (  11.59  )
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

The HDMI bridge chip fails to generate an audio source due to the SAI5
master clock (MCLK) direction not being set to output. This prevents proper
clocking of the HDMI audio interface.

Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
the MCLK is driven by the SoC, resolving the HDMI sound issue.

Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
index 97ff1ddd6318..734a75198f06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1


