Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F8DD49C73
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEEqxDFM2yhPiyFjlnl8LZDAP48x695zaYDrn7lQEUY=; b=l2OU9TyAwP/PBGQHhcC2iCae7e
	KDvpuYMY8O9pEFodDt2tm8OPNzZ7CZLyTQoDcZfloSvBq25Yr7K0xAQMz73fG3WXFF/923PezdYz+
	FIgC01hMDvJjm4KPqQ9bxYL/VcKSuaWBwAm5XrFEjOmopvzpwuZ8kYz0w4nsluKdGRuTXgUKCWLMn
	pq41huMpddXj6W/Wh8znsII3qXSV/UtFsoUzCCJ2kwBoTmpFcTA4Q92WTzxF+GmNgk8kIUcNwXz8B
	yvrpo6q/lmYdQjcWWPuZzyCG9WPuesKGwgWi8iLaH0eamZTlvBM8uMRjz0R8l6IvNq45jeN+U1pjP
	mDCSs9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljk2-00000001CUd-0r3V;
	Fri, 30 Jan 2026 08:20:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjt-00000001CPL-0weH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:27 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso1630409b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761224; x=1770366024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEEqxDFM2yhPiyFjlnl8LZDAP48x695zaYDrn7lQEUY=;
        b=h38oaPafxnVa4cy3u5EBmCmuiEV/LkPteyODoOpJ1vaLK+T7Qg9R8ZLvYO846Jxrn5
         nqG9m3goQ9CyrLFhF9P5dxXLV+Y/nPLUuP5FajyEiaSek5IPu4x4dnGN2Say4qtxHtxT
         O7RmSdb+datSCJgXtnsDAe1vlWnekmRtaMbNVi/+vFXApJCvEh04aY/KIRgchOTt3wEn
         97vKNEl0mEhb1Kj7rZyMOF0T+viXgZg4g1JAPR6dL1vJpaJsvh44a8zu1oqNkLuZqro0
         UF7Qo8EDrt6ZJvd6bCwlMP/b2SkiOX9TEEj/VFdSnE8d7WJ+3DZdOHmFh/11yhFatUMI
         TQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761224; x=1770366024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEEqxDFM2yhPiyFjlnl8LZDAP48x695zaYDrn7lQEUY=;
        b=vmTPl77XOzYvvyhBDX7i6rC1X8AhTuhcDe42XO/NeFVieH7EtWHlt6cXKua3NkIfdu
         tX3wvdJLjEYTWvCjmIPjCR9XVF5vavn5jTha0GhTXqSmeUSJlBmQYT3t4BdOFOqvd1RX
         4URuIaKbVL+WZYrkU7+0i0Ulkq3HaZhTaXdHadnYioKi5IQYXWEkUvfvrsY4Jth3yQ98
         i3Zm/jw/pF/uomdNmfSNX2uJGoZ0gIE9Ls38amT7araInvAi/OuX7RtQebrdP49pSBZL
         b/Pg9PkSmHlWWyFWjDyBgtMXxLtBFypB13sULZ/kNayeTKWCGcYPfrwbd7fuZzeIMoC/
         Hl7g==
X-Forwarded-Encrypted: i=1; AJvYcCV6UzN0oM7Pdpt0ZB6x8SgysTVPTTgfJCrNXtOgaiUm5ny4FVV6Kg6Nx/6Sl48Ffil1G2OsSza1GKQdBK3Nqjy/@lists.infradead.org
X-Gm-Message-State: AOJu0YxzSFhc0v/CEfiAy081PpRIES6BXDOkZf3DYOvZwKCf4t5Ce8sF
	WyyWvo/Vk6GmZYNvURXLw9fTdEG3vz6n9T79YXmz6Yo7lJBTRCaK1DDy
X-Gm-Gg: AZuq6aJTrqc5wSR9NWCNgFo+YGNoIj2HKVU3Av/4dNkxuHnixaZQsw3wvb62Y0HAQdL
	0YWFlZoCtKicZS7X7fvNJpdRAA+U7pSl3n0Sb+IQp3X7+YR0EVun4wpLXLbcPVX84B8+nP3+fLb
	iTxjI1BTK82v6DbSRBPettofSupkQe18xfrR0YbYcMk6CWeKOFfJceVtLTcwBDkyTSDATtvzvrW
	If1Vtxl3WlAC3Mq35tyoWaPszCeW/Aj6l5k35lWg/weB84SI6ZMg6k2tBz8ouyRNENPUE3Udmy+
	kIrXVQw8xW8jTPQ8WzIz2HAVEOQAEw12Dz4FORV05oAU5kLPd6hv09Bt1M43paaWwR4zfV720Tn
	BiiciFFBYyxrrqLl+0OqGSnHWcyOnZgICWMT7ZlXmYkD4apf6hc6nToTsYLYzK+zr/rNFLhLQ0f
	ecwxiLy33tAtzDXr2x75XvmLX+gSx/B5EgalBiPbA99IFM8LbE1SIrBCfPVvcNI8ZuwP6HdWEJw
	R8q2Jjad/TynO1nQPPCT2Pkjbyj3T0d6/c3CNUgt4FJtK0Bcnrl1tBTJLcqPq0ib0PYOCy6xlHY
	nhTqxv1GQZBC
X-Received: by 2002:a05:6a00:244e:b0:81e:c91c:70c5 with SMTP id d2e1a72fcca58-823ab6929c5mr2034622b3a.29.1769761224334;
        Fri, 30 Jan 2026 00:20:24 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:24 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:11 +0800
Subject: [PATCH v4 3/7] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-3-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
In-Reply-To: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=1856;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=bf8xEERmNoQu6JKiJbQyzBDcSJlpDrQjBle4TDLj5zE=;
 b=ogvwTjVkAt6GpHVedyu0m+EtSAcZEiuA+8epK66Orc2l/JiI6JrX75f3U4Gk1Bs6PA/DbtY/d
 MFEPSU07bcxAHHFj8lGNTSM/GW0QQbHAk5NRjPJDDv0eSMozkWHMWmc
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002025_287840_3C4AD210 
X-CRM114-Status: GOOD (  11.41  )
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

Add new SGPIO line names for user space monitoring and event logging.

Also rename PADDLE_BD_IOEXP_INT to ALERT_IRQ_PMBUS_PWR2_N to match
hardware naming. The original PADDLE_BD_IOEXP_INT is unused, so this
change does not affect current system functionality.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 31 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 45b8ac2e8c65a4f672e64571631b7f6944f26213..983aebc394d9159c7e3db2e7c39e963f7b64c855 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -978,7 +978,7 @@ &sgpiom0 {
 	"E1S_0_BD_IOEXP","",
 	"E1S_1_BD_IOEXP","",
 	/*bit88-bit95*/
-	"PADDLE_BD_IOEXP_INT","",
+	"ALERT_IRQ_PMBUS_PWR2_N","",
 	"FM_BOARD_REV_ID0","",
 	"FM_BOARD_REV_ID1","",
 	"FM_BOARD_REV_ID2","",
@@ -991,16 +991,37 @@ &sgpiom0 {
 	"PRSNT_BOOT_N_FF","",
 	"PRSNT_MCIO1A_N_FF","",
 	"NIC_PRSNT_N","",
-	"","",
+	"FM_CPU_BMC_RST_N","",
 	"","",
 	"","",
 	"","",
 	/*bit104-bit111*/
-	"","","","","","","","","","","","","","","","",
+	"MASTER_PWR_EN","",
+	"MASTER_PWR2_EN","",
+	"PRSNT_MCIO0A_E1S0_N","",
+	"","",
+	"PRSNT_MCIO0A_E1S1_N","",
+	"","",
+	"","",
+	"Fault","",
 	/*bit112-bit119*/
-	"","","","","","","","","","","","","","","","",
+	"FM_CPLD_RSVD_MCIO0A_SB1","",
+	"FM_CPLD_RSVD_MCIO0A_SB2","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
 	/*bit120-bit127*/
-	"","","","","","","","","","","","","","","","";
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","",
+	"","";
 	status = "okay";
 };
 

-- 
2.52.0


