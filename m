Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B8BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=4krG+7Tdi7jp0x/jHZoH0anANx
	ubSmlALsyfrsT8U/PgDaxEvzIWbubUms0snfgUytsOAOyM2vgxmHtC2L5f/MBci8FqeoNtE6mMYQO
	52ZNXKYQ3qzeJdtMwmF7YAMEag7icGqZM3evFo/AKSHGUnAhUinvi5hOkkAI+FJpEMhUvQOEwXJsW
	Xjpl/NwDBWsSggzk3vHNqLUTsZnjanPz4vrthKkfISxZxNdxzPEoz3FsTjVz/wnBfxQSOzlnO6caH
	UhSxbXfKrP81YJbC4CjZAbvAXgo/uh8X3qkAGG943PDkRV+zB56VoDwrJPN9ixYm1JoElhmqulrcl
	hb4lDcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjz-0000000GPZ8-35WI;
	Tue, 30 Jun 2026 09:26:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUju-0000000GPUT-3VFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47488efcf30so937673f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811605; x=1783416405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=o7YEf6tYsh/ErDAxmWChH9sNa4Nk+Ym+5xgo/2PX0My4zhalXhMjPF/xI89m6i7vUG
         s44JQ2E+aPpi4ylmnUim11gjAWZ6dQNC02LylaBkyVTR2ozw3VSdQUmqorSNWVLY4apJ
         cb181oQoULgwjne0cE6trA0IeavoI4uPivIX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811605; x=1783416405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=n743OQvw+5t+oFn3SASOnRyfYH7XQHcCYmvVBriLaelmLPkabnOJq1rOLZe9ErQoDs
         iEMA3EJO+HWimcNIaTTXqTaq6hn3WV6n52pamNaW5VbaFbkPdA7ZMfQgtXnz35qVS/sG
         fueBOs+C/gE5jT3umMtWze5TifOqMBly3sy9+xr69THQyeQU4QxcJ+y3ZbUnM9W0UYOF
         zu6/6MIIZib9HolrkTiT9GfBVmrqfOfnJb2flJffJaal6CzHQ3clxqbz6WmTSWeq/LOQ
         5/jZmMrkuG2jA/9qkxI5+TE6f706boQVIjVqtMpMFPjvWr+NlCyjikJB8hwEuOZDF+N0
         HypA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1iV0YRyMDR/3+rYkEtcphVHAd3c46dko6cVxoXdWWpPMGwIepldI+4H8krQ0Pnl3pS/ACsPRaaE/UWk6QQZM8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7hKP7uIPPAu1fcRLtwT1Ji0ff7n3/Fi09wBmVKFWOCukOUfCQ
	HZ5/PY+WY/rLxYhnINgG1uKXAmVR63VBYI3TzMIGyFgjmOxmmmm0jLUE+t1OAme5+5c=
X-Gm-Gg: AfdE7cn9dBa/fId9Re0zcX875m7+1BfhdALkiAI/3svQwdVe/s/2wjgKfKeJIKDFRQw
	PK6Gefrc/lLajPO2cuLPedVoPDRh+sT0fgpdZAKTQ2v/3670bKQ5dW1RtDAcw7WuOG4Pa+20n49
	MxPuKk64gNdzbVpUcC8N1w0NPBNlYJks4uImha46MwEKAsJ7uZxY/qh/VWvM1snIuhzXwyoGiPE
	OaUafqXGaA5FlYwNRTkfpFz//iDI5t9SHhKXwVWhMvsPnD0j06bqhT+kqOxGQVhePz09VhAsMyC
	ftLjUQabOPPdqhr+SC2Hbc2+0WDQA01w2EhWebMx5Dq6B4xiL0n/EVDeRphn0NF+/0buyRaUNWM
	dwNgZAzPDe1zJsbsNSce+hpXp2X9UtyKG50af4dMc+bNTtC2uFteNlDzTVRQb3bWLhH+A7Kq8QE
	IYt2U0DTccPv5w0i/uvAO59BP6u5TLKT1u18+L7nDdcprcoYYqqSaxW7z/uo6HmZ5Vnbme7LrlA
	No6eB65wegGqN3TU37eT76DIsh/iQJMpjN0U3Z1jZRjQUn8A0T9t6es5lYtIJ+pEhdqP4jNY7fn
	Y+R0NisXLHFT+A==
X-Received: by 2002:a05:6000:2c0e:b0:476:8a:5 with SMTP id ffacd0b85a97d-476008a03b4mr1277965f8f.34.1782811605026;
        Tue, 30 Jun 2026 02:26:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Tue, 30 Jun 2026 11:24:34 +0200
Message-ID: <20260630092628.1695560-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022647_950893_21F2A424 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0


