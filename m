Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EA7C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=; b=BnV8dkjwqREsah1fDPRueeiRvB
	KRexbfaZWt57CMkkh+Th6U+N3cRXRo9VtcZcK4gOQXLs8dH6JK/EIztOOKDi6oeIPyAlsx9U0VtdN
	elIXx/07nDQr2dtaR0GIYuso7a76B++GMcvfLRqy01JbYGBIEj6eujSs3x0F82bnq6YXzLdOcN1/E
	J0ZqRslrb8kjWxrfl2mbLC1QsRCp47b9EGiBmtV148paIBR8ipMwDRajG1kQqX6syDiaZr801TqfI
	vYnJ7OQKkNS/k58CsGXXarBPEB1lwzhvido0+oYVjfGBEgTyCzvI52hKicjlRHtU8cMbxcKlWCZiH
	uwOiC16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFmu-000000027qi-3ePe;
	Mon, 27 Jul 2026 07:30:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFmq-000000027oG-3Xzy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:30:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so21844865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785137407; x=1785742207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=T9UyRqbZc1QPSyEU6gVFwS33YCKlsxLOBGUPGIhwdvgxFETxpsE9FLVRdwVXNhTj/s
         w6kNZc9c7t1tuiThy9G/piKERSpkYb8ODIApl8KoHa9wYVP3m08WXzSm+K9AaVKrFdNq
         GPD5fhKOKBPaPdBWyoVSPu4dT1hyzI02kqQ7wf6A6ERoBb5kvPKbAfkVoGAHv0gzsRvr
         zbQygkGucn9vGWRfL/yGa/wSAmrOquh/KNpZH7Bi/EH3t2sr9Q4rP2BK9t/nzYeJadFF
         Wfhj9DghnlpoyitcRsX24pMY0UXIwyV1k9/xYKim0Q7joyMLqwzm0zWEGuD4POvVPHAH
         HxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137407; x=1785742207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=ZMZvBij9fFThuyvssM15J2c+vjw8w3TgsRhmbXj4rsAInf1qzStXYnFeS56HEg+XWq
         X8llZ3t+oAq+pQumCJg9RJTzal6vrm65l5PNAOOMRrMNbJf0f3jcy4eOxU2lN1OjmSgG
         Cw4xGsvqx3gxXjjM+kSGWV6n8rU4U3+Nr6IL39cK6tCqNzo7x/ArCNLOcFo+PJa43U5z
         VY4xrHO6sCyKetXk54gIiFlyQFhxBmlut/7djzMyPFrEBlAbEfOwoOZMn5S3v9idI0EI
         xvTvJtL8pzXe2s/077OUa/yDVc9RuSO0ZSCJvYbkRln31ehZklyE8bFrwu2Ntt3b5m+K
         XyJg==
X-Forwarded-Encrypted: i=1; AHgh+RqdDy3eqn9QtvvQ7ASD5EXajWVFmdlm8khpSU2dYmHgcxBI+0YlgQ1k4DA110ITzWZW5DqsIiNysStoPNiJ2lUP@lists.infradead.org
X-Gm-Message-State: AOJu0YxQrWA9o7joutIelV3jPlKXfRjeDanTefJyNZFFT03nC/SS/6/M
	HkOThqHW3WA5s1ojPL6pdoQasInRDYk61ikLDW3j0+Lsfarhprx19KQn2lXRu+cUKo4=
X-Gm-Gg: AR+sD12xoxSnNNdrAomPkGDz9CFQJwOlQmbR++pwIijHhG6qPGEGTyD6R7IWQZm82vy
	eDspAOeeSj9s2w1zjkEGtKRv09oFjaiCSO4UqIVE6fwE2ybnjPRSLZrcKIoRbof9GpVbdtE+Y7m
	Y0fHcb33FhdtE7hxmCfDgzFdaWrwMXq6NbaIIxf7lYPCmlP+JlaKjacoERAd/jzkHtebjWaZwtn
	ZuloM7MEXWX4608gARvdqfzaCIcOzUlosleowjdBY5YR+GCwzb+UWRbfJan/pTJQBBvsB3cTJEa
	UbD7phRa8v7g/KLCMEQNpJKRrwl4YeVOs/TsHvxfhGPGHJ/s9uQzROgP0JpLwc9XoLYWKvJBnrj
	IrSej0JJoViYdFCeeBHDb6iPtD1hPWBVMhxeNGn++xvcW2KvHmeH73fwxxxLB7iv+smrcVJMYb1
	7bIn6FL0agIfach8NPD41S/ThuqwsPlnrlUcmRW9ZWKxof2tDsR6n1hBblbvoqEu15OJ1s3G1zM
	x/Wc3a7epWPBnICdw==
X-Received: by 2002:a05:600c:35d0:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-496b5708bacmr90013815e9.34.1785137406643;
        Mon, 27 Jul 2026 00:30:06 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm201823685e9.6.2026.07.27.00.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:30:06 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: jammy_huang@aspeedtech.com,
	yc_hsieh@aspeedtech.com,
	openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
Date: Mon, 27 Jul 2026 09:27:41 +0200
Message-ID: <1dac6b9ae1565a2265e87537141e46c988d16de3.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785135437.git.gregoire.layet@9elements.com>
References: <cover.1785135437.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_003008_904057_20DB920C 
X-CRM114-Status: GOOD (  12.95  )
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

Add pcie_kcs4 node to the LPC bus in the ast2600 g6 common dtsi.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

This can be used by the host for IPMI when the PCIe BMC Device is
activated.

While the PCIe to LPC Controller provides KCS channels 1, 2,
3 and 4 over PCI, this patch only adds channel 4.
This needs little adjustment to the driver and provides PCIe BMC Devices,
like the Asus IPMI Expansion Card, the IPMI over PCIe feature.

The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
standard KCS interface.

Node placed according to the ascending address ordering.
'dt-check-style --mode strict' reports no issues on added lines, except
'line-length' issues.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..c9d94c25d1ad 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -656,6 +656,14 @@ ibt: ibt@140 {
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
+
+				pcie_kcs4: kcs@914 {
+					compatible = "aspeed,ast2600-kcs-bmc";
+					reg = <0x914 0x1>, <0x918 0x1>, <0x91c 0x1>;
+					interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+
+					status = "disabled";
+				};
 			};

 			sdc: sdc@1e740000 {
--
2.54.0

