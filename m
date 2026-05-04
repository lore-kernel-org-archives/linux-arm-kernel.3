Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4CCFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/H0+X+c437l0EYCtxYEpfFo28iZfiYo11e2Ws+OVLY=; b=1mLso2/XoXMgNull4PhnRHKmgT
	Ta7IHLw3HMU2g/q4UtSeIF8rFOsRFkN6tlx6d5R0YxBvO+7QTFFS+rsxGJRUx+ExFKwM309XFQLPg
	w/iLdKpIjh1OYAFWHDdKjjmGHTUytOYM0oUMZnCiZ0eBLNMbU1RpuzZDX8XaAmhL1/sZuGq/XbEGh
	si/N/9fqxjgjPCN7vzFddq/p3vXAIqzEqWCpPZurH06liZG6UWCKLdPnjRYHKi+rc3+jmaT9x08kI
	HgnBaMmch+s5s7CIMMYZzStTrovgX5sux9U/IPnRbVzGq4vDmM6yW+SdCFZ7Xv6+IgxVhb+bpqiiq
	Si8QKdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E6-0000000EXbN-2ENX;
	Mon, 04 May 2026 22:57:22 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E3-0000000EXZ9-23hy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:57:20 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8cV55rLvz9tsm;
	Tue,  5 May 2026 00:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/H0+X+c437l0EYCtxYEpfFo28iZfiYo11e2Ws+OVLY=;
	b=h2hxO2DKaqIaR0ZuNR1+z2X0rShshWYzZMpA3nv2U4j+DcujuNBB/XIQ9ITP3NjLxHeVlW
	oWR3OTr117TZ9tMuIbWR61kt7ufIfFK7xVpEOPH8mAi2SnUv9vXhcv3/ugw6T2mBvS4T39
	uCFhsRTDrlsrg4iMYvXlEzShvLrurbxCiH0vpCJKB7QuTs0IBAIyzLZ1VkPutkaQaJrgGy
	tL87AX0L6kI1Cg0phDSja3X78ZCmfEczw7IGc2VxHhv3EBkzL5QkmszZ/xccwxHHgg3j7p
	5nzRG40ED9wLr9T0DwUhy2OU9pc06q9jBkVP+hVqFF4FV9A1TrSZHyEAgqq2NQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="txQ2/3g/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/H0+X+c437l0EYCtxYEpfFo28iZfiYo11e2Ws+OVLY=;
	b=txQ2/3g/HzqCuVuW+NlgDOmb/3/5LIkc+7ucVcc8z+h7DPLcD8DsBn9uZaVSLW2YGXveEb
	7SmHhzdN+qRHAQgk5WOCQh57QyiByUozfa9nsf51xBpar6iPBAEyvlGyA/QQaf+91M7WsD
	ZJnEuzNkp406bwO+xrU8JGsM9arI3xJb6aouPMzpfZuAFugsThleynLKb8zU5em06eS/3O
	g7i89BPdBdoHQzcltW1QRWz9/2sLSYuz81j7UltX2XrvyyaGU+85lEYtGvrJDfavBM/3w1
	6jhjBz22GQsBf3nBIuUpNmMgRX5zq/88PG2+hCNYadRny0B6wHvGig6AuarbPw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:53 +0200
Message-ID: <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7e4553e5af6d4220dad
X-MBO-RS-META: 8g54wgunnw41hpuj9nngnapgkuu96qzz
X-Rspamd-Queue-Id: 4g8cV55rLvz9tsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155719_682754_2E6AADDC 
X-CRM114-Status: GOOD (  11.15  )
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

Use standard clock-controller node name for the CS2000-CP.
No functional change.

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
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index 8bfc66b8ef865..acce3c0452f4a 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -50,7 +50,7 @@ &i2c2 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


