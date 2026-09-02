Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97361C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GqdLb9S+dkzyo/uMEE+zALrMBgJbCVE5U0lvdKhWKM=; b=rCncbojm602ujsTctWtobfr/DO
	YOtCWQLOR9vtc6jV4dV3KC9sSj8tZl5lUze7JPgBY5Zdhwk6FZlu7oNAoNBG+Jq8ryQ64ZivL3u8C
	seR3csGM24XwjcfD8mvaafBseRCziOV0xpi+6/1YQhDsUeumAdpw2CziwzpKg86n5vo1cibVO05Y8
	pQhfGtJ+lNRGMvnd7YvIyEAQqbV68lGUFAzzvbpQxtTxflwvfQn5syTBE1nYVyNu1H3Lw9A2atPoS
	1Dtkk+Sx+6runQ+5waHa8tWTKe2gFRQqpSGot9k4sWvAs68VCtliAJxiHCC7G2oq9xCMpLIZbOJDT
	C2Halt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khV-0000000ElHW-1lE6;
	Wed, 02 Sep 2026 13:08:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khS-0000000ElCz-0txU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:08:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4843e397f74so1203258f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354500; x=1788959300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GqdLb9S+dkzyo/uMEE+zALrMBgJbCVE5U0lvdKhWKM=;
        b=MELTE8ISbB2kETzqmLyb1P7azUEwgZXAslVSVG+oxnRQcamLBjTO9/P2rzzlH27Eqd
         hGMdikA2mjAK72R3EUoAHCeHchyqAb29KWuohCVwbwFwSl8BaPcbTy1FplVFiPg1iZZy
         48w22EioFCJEWFseh8hlNsKuk1RhdoZU/5ekQir13Nj+8MrEpRQxfrOkKJYWudDcxEh7
         ZvJdQDg9eOWA5d4e4P/qK7T9gAn7tMrwIVE8Hn0ceLhfYlYOVq5VR8TpXCpIe0SJ6E6n
         CkhNoZtI02KAifjYFWiFSrZXwpA74fUHf8htaa6ZLGpfbdM1DPXeBcJvUeoqXHQXw+7+
         O4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354500; x=1788959300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GqdLb9S+dkzyo/uMEE+zALrMBgJbCVE5U0lvdKhWKM=;
        b=AHzeBLxC1d4hQf2u3I80KUeSz8DCylD4IfF505/EZ2dNaUPFJWSfgUTLVaVdmb0KTr
         MQ2co65BxWOQ4H/Gd8GjGfUCrD76dtLlzc46lqbzdkSWUODX/fUZyiFdfxh6ER0HEopq
         BnaLYH1AX1aZNkXLpepW6CS4HyS/31okOFzyC1ZRz6+hVWTzySnbKIQ3ivXqKiFgy8sX
         Wjs1IG/F6cv8YUt62t3r2MGnXVLSCEctMsVUuh8AM1/Skb9O2MH3ZmvGpLumN8zV4sYu
         Uj9BG+BoJ39NTvnVKYWUomjIQSbV3amMIuW+rQyGhYxszAbNXR8BTGnaDCK6kSAA8fQ0
         8PKQ==
X-Forwarded-Encrypted: i=1; AKwUvByHSUnduj+B4qjbFHTqzy7RjRptX3Pqovdb3v3EPpaz7bLdTzhhZDz7OX7+g5Ey0pcppIAktBxnP9vsDWwe9eLT@lists.infradead.org
X-Gm-Message-State: AFuF++kWFT77Q5C0t3JuI5tpbX9jwfmsLHR2wTObz/sWdeKOf033q/A5
	i/QpebCP9hcl/bob/R4mKWwnmsjk6Iw3vHzd3hUVIuFzDyMqFnB4Yq8WsCvGsVsAyKs=
X-Gm-Gg: AYBFou2OYdUmXlv+BBlHSkm5anIk4ftoan5T3eJmcd1IyVkm0C8E5ewBqQFiZAw6ygA
	WZaO3mNNWCJ9kBvXmctgYRIAu3TFFHh3OY2+MPqHMEZuulSC25T0CIWqnD1eiUbuyM3brPBFr08
	b+Jq22C8PqPdu8MvQSSVoMI/wk0mobwIxa1Ztse4Tak8tThd9paSqUDAR6iD5NTA1SzllUmXIuP
	lfzvkoqOeJqfTLZ+jS6kqhccDlB6RySCBiRfCjLJm9arsXigipFrtkBTtNuNfC7AEBDZuOjyVZy
	qyg4etkh3Rro4+n3LF8QvuZsNngmQaWiMfiQFwKslcqIMAsry0C/NM8SDk/D+nO4hB4uhcJYTI1
	WM2H0wt6yaJcXdFcCiBnijN5XtBhKwYZJDfe4+teG9udrWgYa49GpzGQPRiP89Og57GKABz1lV0
	5nY0/1g1y4PgUr1q9xOVCxodXrBLIM/Aau9NJnB+oezMKxtgVrIcGbWj/5SPCtw122Uo3VQDKRP
	Kv9bNkHoQF4L9MSb7Re0hC2s8h4lWVaOL+3OW0jpQ==
X-Received: by 2002:a05:6000:387:b0:482:ea3e:882a with SMTP id ffacd0b85a97d-485781de9c7mr5755351f8f.6.1788354500289;
        Wed, 02 Sep 2026 06:08:20 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:19 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 02 Sep 2026 17:07:55 +0400
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Derive GMAC MAC addresses
 from OTP on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-4-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=alchark@flipper.net;
 h=from:subject:message-id; bh=92HKX+rJXSdlXE5EQ1Vyyu1clzsl9p8JunUiEHK0e+k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN+stdDlfUizrGpdwOQDO7Wsb6x5/WrOvdW/mBVvR
 Uo9dBd26pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqP59mZHjJZMe74LTovK18N9U/6Wg8Dag9/iaBV+x//f7tD2Qtl7Iy/M9OYIj
 4m7OmNjlfYPKW1exzZr8VEjH38ol2EzqvYtedxA4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060822_274671_9F43FD81 
X-CRM114-Status: GOOD (  13.22  )
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

Rockchip SoCs derive stable MAC addresses from the CPU ID in OTP memory,
which a bootloader would normally process and patch the live device tree
based on it. This depends on the particular bootloader implementation
though, and the derivation itself is not described in the device tree.

Add explicit nvmem layout for the CPU ID derived MAC addresses on RK3576,
so that any OS can implement the same derivation without depending on the
bootloader used.

Boards which store a MAC address of their own can override the reference
with a cell of their choosing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index d418bfc04097..aa6d867b5a30 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1845,6 +1845,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_mac_address 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -1893,6 +1895,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_mac_address 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2131,6 +2135,14 @@ soc_tsadc_trim: soc-tsadc-trim@64 {
 				reg = <0x64 0x2>;
 				bits = <0 10>;
 			};
+
+			nvmem-layout {
+				compatible = "rockchip,rk3576-otp-cpuid";
+
+				otp_mac_address: mac-address {
+					#nvmem-cell-cells = <1>;
+				};
+			};
 		};
 
 		sai0: sai@2a600000 {

-- 
2.54.0


