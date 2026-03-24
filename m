Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F37F54AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mqk3zd0vAxbDi/5mlXVc3BFXCT+o69PX3fU4fgQH7Sw=; b=M7tCVGlM0wXlESgSK+bk5ZILWJ
	SLUqgaYVaNG2Xxt+zKvtUmXUMs0MQkzCiPQ8STADh+tjpSUM9aJj/h10rLBHxsP/KcTM0gukTBai2
	G+PEBB6VHyZJtK2BkaDzdC5NS1vsbtXHTRJ8M9ezXpIZi9Ff4o1u+Cz3lkxWCp/tnDUT7vAiYfF/I
	YN85cYzXmfaw+qPnVqnxsi+nnwdF3tuWVB+DC9fRRm3qVS0sCRn49U/7IomdCfovc9QloyAz59nDa
	NcbRp1QaXh4Hc0KmIpWo7ZwaGIzBqJrwxqkURuOgwxgyG4ANUcCQ02d7Tvc58sKHrxQ9nObwdrjJ+
	bHm5aeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52pd-00000001ekA-2xEL;
	Tue, 24 Mar 2026 14:34:09 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52pb-00000001ejN-0vnl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:34:08 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fgCGC2h1Sz9vHX;
	Tue, 24 Mar 2026 15:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774362835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mqk3zd0vAxbDi/5mlXVc3BFXCT+o69PX3fU4fgQH7Sw=;
	b=mbecJxAuIMIH3Ch9AtQeri0jWVvMkP8I8dllYEyBXUhy0Mv8eARsRLOMPudWNPBoXr6IsS
	Zpsvm8e9+oWUvWFcGsGnVwyecOZVfqPuR0zjB3Z3Fw8HeUf66kUcykwp3LBVmnm8+vYs8Q
	qV3McdI7wGKb/ira5JZoF2K9AXSxg0JCpR9YqeId+9JIxxR8cHiadeUfGfKN8mcAUxjnL2
	5ZiOdeH4NTiZyvTHkB6zTg52AV61PpAiiQs8g6Nug7ojg1EP8YDtoVHJOGXorrNQ6uQjbF
	nRfbel4nvYYH0GatdWuFxpeuIo/Q/xHLdxtDWrEivgoB2q+n5cYANOVnCc9WhA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774362833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mqk3zd0vAxbDi/5mlXVc3BFXCT+o69PX3fU4fgQH7Sw=;
	b=owug9S5k4ghRHnxaYSYBgR7qRRdEqLHEse0Ha6chP+8nf37arN4MSAxcEDF+UOiL+FxYy8
	DUpS/FlIFPCsUVyZpe3VTNlY8fLX/b1lTDfJawa6gI/GykOyh0LglxGUYCHxxVdY9rrB4c
	dEmIeNOXyc0QSaXn9HHAnuoN5S2LfHSgtcBpnP3GWxY6PpSEkfnFKLChfqom1UTyHn5jPF
	9COwCjWo9piE30x2tk1AowM0NYjSxSdHlciibwOqvuPw6od0ATm/cYaA5DZdrGP12hSFOw
	f326nTKaXTv9MYsRR6Luh73gtLqifQb++S15t3vj5+WH3gORulwYPEhpM6dCPA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM
Date: Tue, 24 Mar 2026 15:33:28 +0100
Message-ID: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ff339114a086be2d558
X-MBO-RS-META: bdah8foftyj3w1iz9kz7webosjn7f446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_073407_408904_C36451CC 
X-CRM114-Status: GOOD (  17.70  )
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

Mark the first 128 MiB of DRAM as reserved. The first 128 MiB of DRAM
may optionally be used by TFA and other firmware for its own purposes,
and in such case, Linux must not use this memory.

On this platform, U-Boot runs in EL3 and starts TFA BL31 and Linux from
a single combined fitImage. U-Boot has full access to all memory in the
0x40000000..0xbfffffff range, as well memory in the memory banks in the
64-bit address ranges, and therefore U-Boot patches this full complete
view of platform memory layout into the DT that is passed to the next
stage.

The next stage is TFA BL31 and then the Linux kernel. The TFA BL31 does
not modify the DT passed from U-Boot to TFA BL31 and then to Linux with
any new reserved-memory {} node to reserve memory areas used by the TFA
BL31 to prevent the next stage from using those areas, which lets Linux
to use all of the available DRAM as described in the DT that was passed
in by U-Boot, including the areas that are newly utilized by TFA BL31.

In case of high DRAM utilization, for example in case of four instances
of "memtester 3900M" running in parallel, unless the memory used by TFA
BL31 is properly reserved, Linux may use and corrupt the memory used by
TFA BL31, which would often lead to system becoming unresponsive.

Until TFA BL31 can properly fill its own reserved-memory node into the
DT, and to assure older versions of TFA BL31 do not cause problems, add
explicitly reserved-memory {} node which prevents Linux from using the
first 128 MiB of DRAM.

Note that TFA BL31 can be adjusted to use different memory areas, this
newly added reserved-memory {} node follows longer-term practice on the
R-Car SoCs where the first 128 MiB of DRAM is reserved for firmware use.
In case user does modify TFA BL31 to use different memory ranges, they
must either use a future version of TFA BL31 which properly patches a
reserved-memory {} node into the DT, or they must adjust the address
ranges of this reserved-memory {} node accordingly.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
Cc: stable@vger.kernel.org
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index bcf8270a3ed9a..714fcaf8a846e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -118,6 +118,17 @@ memory@600000000 {
 		reg = <0x6 0x00000000 0x1 0x00000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tfa@40000000 {
+			reg = <0x0 0x40000000 0x0 0x8000000>;
+			no-map;
+		};
+	};
+
 	/* Page 27 / DSI to Display */
 	dp-con {
 		compatible = "dp-connector";
-- 
2.53.0


