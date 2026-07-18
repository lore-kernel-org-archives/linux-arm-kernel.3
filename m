Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE7AC44527
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVdUc4K/IhqrOMLTX+JPmZv/Y1bCw+s3TFSm96hNeQA=; b=Sc0rWIi2K7UFP1rfzMujx89AJV
	L5Zm8ucEVYw2hlGxjw0StIAZNFGF4GhU01QyiIV7dfM/3cj5vUPF4qFALyuFNwXXkN+CD2WqkwwNA
	ap+RT0TzfGCSWRLWYGlwYcyR/mOuGSOjsQhvzGsaykRdtfRKcvh/v+u+YyfEgIi97nxpYUfbyBbV8
	OYm0BHYTo/dI1w8SBcM5zJvaolNOg4S5wmFS2OQigX7PUI4SCT01ZzchjpIsI918eX0EFPvprfOtP
	jFuQjRj/DxAXZNe6sHrLqyy7eyyMqID5Cg8/2skq1EozpJYbQShHwVfechYDJ0T+qi/YQwROrOp1N
	G5kiIqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0s2-00000003v5N-0Dse;
	Sat, 18 Jul 2026 08:58:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0rl-00000003uwF-0tpY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 08:57:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49253e951cdso3708065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365068; x=1784969868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVdUc4K/IhqrOMLTX+JPmZv/Y1bCw+s3TFSm96hNeQA=;
        b=gF80wBLt0igXrihf16mif49ACME4DSaHtE9PQdzumTfSENJu/gc5lQwmLARPShs23j
         chFNlkcJTAKWGPbMEVmMca+8hq/jhCiHmJu0pNN0HyqdjfPkcbvkY1TjIkylixpTxTu9
         /Fk6DYGQ/TWCXXfx51Q7X4naqEMCdGair2RivdG5nEixs2VN7RRwXovq6983EkVukUPK
         rsRsxjgsQXTU1d8m5poKK8GDu4Z/h8vn9z2h18Y3cJ7W5QYqe4xsaIXXwRo76Punttgr
         tB7p7HYFuzlBzn0Ig3J7mkLziScF6Nohy8L8Ri66/91tJ9RWHRyWWMz16sqlyLoxlwcC
         EhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365068; x=1784969868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVdUc4K/IhqrOMLTX+JPmZv/Y1bCw+s3TFSm96hNeQA=;
        b=WEn4PZZ8lHfHlgsKaoKzY2oTZ4F7UDIwbyIQOG1Wo+5A6Wyw+gJ/BgcP0uxN8Cxktw
         VggiRekgrJsc81eUHLLIAWhU4Siq+VCUFM8LtM5j7UozbExrPPfxxH2j5Jz1k27DJoeR
         +yQGpcDQ1urHn+t4bE4tcUPIZgwTNfEWcoFvJro122akHSOt7BWTsDo9wLNKIFTUk4Pr
         dO0JBI1DuDAu0S9O13jU0RhoC7sGilFZ/fCu2ccaykfz0dZgbJ6pXo6rNXHi+I6PuYy1
         +1/6ldig5hiDkqEdJQIaT6f+3DC5MBD3n+grD8Km7fX786BiNLL/txlXMzik1jeKfLOa
         MpAA==
X-Forwarded-Encrypted: i=1; AHgh+Rryl/exV6XH7ZpMXE6VNlusg9VRo4SnWeFrm9gmZOmnG63pZVChux7VaQ84uHPSqSGLsjKKLc1cBnyX31oB/2jr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3rGD8C3sBgwsLCHbzu4MX4Gx43gizGp09xRO7lTyedPf7m59j
	Um/Ruyh/eYUW9bs9Nbu9G9mfWkbErsrK0XOl0j7Uv0vNPu4T9Sep/J0W
X-Gm-Gg: AfdE7cmpbcluNiKgdMXocJOaTjpiDXWLC8TlBuMhFzctTs9i1nglF62wv0n0rWdfSJz
	tkCHlvKYthZoaClsSbUL//d/UFyyK41kXJ5L3ZsEPdrIhRVzdPkDw3eUElaV9WMyj3tiyy1IZbB
	VlvH3p1M/TwLGXJoHuEqTXmPJw4YrM0Pw1vZwd8aStI0pNr93IUhYq/3GCbPnypSffReoqi/22Z
	9HhuGIMCbI6CxqTqgPujveD2orIv5SVCgSvCPFsciFaPjpERIka2DrZ9ggY3C2HOi8sRhFXTj/J
	O+S3oO1HmiAP86XXQcV0+bvbJeD3ImKJPJueAqmEIKDf1EB4fmQmfxBD78/zqFosrnrKPAWT74+
	rukDcsEz23zXwBLu0ExiIJIoQGYnxRXsn97Jb8CFF//tsTk/N/o1vpaoMO9EAQVKFOaGv8I3S5G
	CK7JrlHl8OLLVx7MQ7NOv8kz1RW7XVKN2bam8zFUDFVtpG+hTHTC7eGlqqPPdS3I8SYbckDYAlT
	IdoCEa3S6n51LxfJYw2
X-Received: by 2002:a05:600c:350a:b0:493:f13a:3f74 with SMTP id 5b1f17b1804b1-4954a51df12mr39497985e9.5.1784365067516;
        Sat, 18 Jul 2026 01:57:47 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:47 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 3/4] arm64: dts: rockchip: add #sound-dai-cells to the RK3588 HDMI receiver
Date: Sat, 18 Jul 2026 10:57:27 +0200
Message-ID: <20260718085728.6797-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_015751_328129_4D75DB92 
X-CRM114-Status: GOOD (  10.29  )
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

The Synopsys HDMI RX controller exposes two digital audio interfaces,
one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
property so audio cards can reference them as a codec, as documented
by the snps,dw-hdmi-rx binding.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
New in v3.

 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index a264001..fa100e3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -338,6 +338,7 @@
 		reset-names = "axi", "apb", "ref", "biu";
 		rockchip,grf = <&sys_grf>;
 		rockchip,vo1-grf = <&vo1_grf>;
+		#sound-dai-cells = <1>;
 		status = "disabled";
 	};
 
-- 
2.53.0


