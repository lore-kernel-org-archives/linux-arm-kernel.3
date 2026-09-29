Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5E8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dj92lTF8akr3d6vO83htUPeUraoOhuGYgiyg/qVoz2E=; b=FvxqZjnVlHuoehzv9B4vxrUFrY
	+rN7e8rwKXga5+wGyCg+/YPrFssLwjN3T+/Xt+DPKZ2/RoTcZFAqiaTRrH+wFE0xtmIHTAZvu9tT4
	bpqO054rv5NmUmtTJ8AZO89efMRt0L6gDz8B2qg9KK4kdQzswBMPERnIIk/GJjTgyn7+NsJp6epNy
	Ax7YtkXmV2hcKNwCV6irtMeAV6mTVGb5y37HotRrmHIhOqb6dmuvwkL6yfdqbo21rPR47aJoaFMGy
	ViGed5WLYM7QhZ3//J+3h0cXq6bwbna84UFtBVp4ngwgbRfG/fIiDR/6hvNnMtgT+7R1sFFl0xKuy
	/WIF2Kew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV59-00000003AQY-40vN;
	Tue, 29 Sep 2026 10:29:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4x-00000003AD6-2oKl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dj92lTF8akr3d6vO83htUPeUraoOhuGYgiyg/qVoz2E=; b=nTet+dVPrTXveeBnpt9XiORP2F
	CsH1bz9dewgM4Cl1eyC5g4ITEh1hRFyqoymnrc0cnD5B2WqggOgvfTSpCAvM9A0oPPUKwoiTTdy3c
	SAHKHj29U5pImBsbfR1+6JJrI1J95EyLgkdgjEr7j3jTpCy5mACPwmI6SYUUk2lhad9dpycF9J12E
	5X+8dI4NvMLJsUHjlS5Zfiw0l5bXE2ncwXHKQLKBU1JWlI1j0pvd7kVYsgDZeHf7qs3IG6HEwRqzn
	8bRP1STnirGnAAghexEJy49/sXGCkcaYaA4BPik17C+VXj6B89D1ivxmIJOp/cVQ3exO4eSIIX8sv
	Jk9rg+GQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBV4r-00000002TqK-0doS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:28:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3920so29943875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677726; x=1791282526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dj92lTF8akr3d6vO83htUPeUraoOhuGYgiyg/qVoz2E=;
        b=RZYzjrXRwHcHRuQCQ1gUl8I71+wbgYbtOFzywBdXs0z1KJnmhd3E9/dDDDLm9Zk0qo
         3Gc8ERgoNHGfmQnWYdef+M483SPhKfkbdCG161PTMJdj63AdGZbcfv/Zgx750CwfckN7
         eOoONXgUYzp2jE8Tp3JCAj61nJsx8PbkVGzfEHBKCvja4spz6wmVmi/du1qoJ5Yp/qdp
         4PF0HU/47rdlb0uLvPOt/yyKNS02CmYqNeCX4KJCW06zzE7Z3LDY+dvy5oWVwffYSVzf
         86I/CgdGZPn60hTyAuexB/i+9JemXA0JbEmlx8RH86RWNPt22IMv7KXblZzIdRuCNYDR
         Uv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677726; x=1791282526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dj92lTF8akr3d6vO83htUPeUraoOhuGYgiyg/qVoz2E=;
        b=DfHw+rrHc+VGauc4YS3C+6AydLR7E8WT0sW6kEWvzEhk0UuJ1FGozbxVCsdmHJOuXo
         0nvAOdVzaRCcXT7/EdHXjxNz6+XHAcYdC7p6ys6K0yj1rlzDF1bwvILq7NgIoUgXi0aA
         XhjTJe6ZUJ7uNI/TEltoHZgfeFv5DJxfgBx7FSFb0aBViv1EL2BPDvoJe6Xi4UDUMVcK
         DpKcrMHE3vcJsENBW1BlZ++gN0whB16EPoI/Zt4EjHE+JIiTpQ5tPB57MguiJwjagggW
         +p9/r9ZVXrEXeWIHne9/nXAHxpvieSBxFsceizIlENUm4eUAqf0xttCNz22UtlGwccRn
         EZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBwYZvPMytHpn00WYOSpKxEiWXZZXIw3+roSSpRmgy0aZSoG6T4yfIYYv9464rLhfoD4Ez/ccz6eRLR/xg8nhfOg@lists.infradead.org
X-Gm-Message-State: AFuF++nl7h0ihtO0J2pPm0uI7563it1bSiTld5GmWScQ+4TZUhPrkPk3
	DPn+P4CfbqDsFXVW2vmfMo1TOcUgtUdlQ+LHi3eKWaUD0E2ff74vlftka2ZIB5qIKto=
X-Gm-Gg: AYBFou3/w2J/ccteeo1z5yd2h7bDdTfy070bHwJdZ7MoDLGr/gFk+1cnWoRL/OFHpPV
	JOS4UkZC7oJzZ2s5Kry3efBryEw19ldlI71eWCFTvDK/5LT/Sg8SfWeYWwx70O94NUvopjuPKeS
	Sjtz2Mjl/RUwOIqWCSiopA9jMEu4QWvbadpDgDucITzp664WjAOZvxSEb5MiqeWUARc21qdovOI
	2O/ybvLSAh9LKKRicd9Ps+JW/vakePoxT6oHRYXBdo3jrI4tXDKRFJP/TlpusqX1jdsgWjBTAKj
	tAbF0C+2wDDiZGl7jpEM78Ec5koSPM/P1NUYTylLmSi5si/4A9u0XbfP11zp8xMDFQlnV5B5D6R
	wnY+6yKL5zHwsYGWYGWLyLmvP2bVoCwZCRwzOrE+YAa9+RoKPKap1BoBWX4WwS8LIRP7c3oVmzU
	f81g3Fep6DwDXhEUJ6nBWhWRNzLQ0mMhOTqQEvAc9O3enueELZ+cnUrfZAKiDJoiy+EOJtF9pgJ
	RbhHI8xnlutFxNQoZU=
X-Received: by 2002:a05:600c:154c:b0:4a0:4c7:e0c4 with SMTP id 5b1f17b1804b1-4a004c7e4e7mr94742415e9.1.1790677726105;
        Tue, 29 Sep 2026 03:28:46 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:45 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:22 +0400
Subject: [PATCH v2 5/5] arm64: dts: rockchip: name the reboot mode supplies
 on RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-5-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=alchark@flipper.net;
 h=from:subject:message-id; bh=mMiA4dH7y9LdOOVFFONMqDGxfntbpR+c/GSXExdAUbM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnTpUMvFF8mX5jK+uFhmtP1CbqJ19qeLF2Wa8621T
 GK3WhkadkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVIRcZ/le3n0m/lHc7etP22Ijt/POniCazTSn5nx50xnHpou9ltw4y/Gb18fr
 gf9L+nY2A8IUohoMWDzb6vgvYa8fxieNl3MmiFmYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_112850_844522_6026CABF 
X-CRM114-Status: GOOD (  15.92  )
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

A reset that carries a boot mode request has to leave the mode register
intact, so it also leaves the regulators as the running system left
them. The DDR firmware that runs next configures bus QoS in the
interconnect, in CCI_GRF, DDR_GRF and NPU_GRF, and faults if a supply
behind any of those is down. The NPU rail is the one most easily left
unpowered, as nothing else on the board needs it.

Name every supply those blocks sit behind, so that requesting a boot
mode powers them regardless of what the running system happened to keep
enabled.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 4c82980a9f63..55951f290906 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -957,6 +957,22 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&reboot_mode {
+	/*
+	 * A reset that carries a boot mode request leaves the regulators as
+	 * the running system left them, while the DDR firmware that runs next
+	 * configures bus QoS in the interconnect, CCI_GRF, DDR_GRF and
+	 * NPU_GRF, and it runs into a synchronous abort if any of the blocks
+	 * is unpowered when it accesses them.
+	 */
+	ddr-supply = <&vdd_ddr_s0>;
+	ddr2-supply = <&vdd2_ddr_s3>;
+	ddr-pll-supply = <&vdda_ddr_pll_s0>;
+	ddrq-supply = <&vddq_ddr_s0>;
+	logic-supply = <&vdd_logic_s0>;
+	npu-supply = <&vdd_npu_s0>;
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sai1m0_lrck

-- 
2.55.0


