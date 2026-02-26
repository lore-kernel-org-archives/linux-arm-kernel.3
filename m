Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE910FC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0aCnSwYvtBeHJ1OOM9Vc+I/4tW0hnZ2TREQUA4zAXs=; b=VD/4RqbgjNwaK1/2LRjaMaOiL9
	PWFvghmf8HH+6B6gETEN8J3stU95LNneTNy44SWT+7Xo5KTlR/RrKBn7uQcOzzPloyIQXWOERcZRx
	4k+owDZOH67tCOap7Vm/BqsPnh98rNXKIhlrSXlPIgKvOMWDPoX8oLc+iObFwv/02XTXN2SRV78RX
	UmgVVEyr6rxx2QmwtISXsPFfmoZ0D/hvJ46mH4dEs7BGo0c+TfVl+5h8sSNIzJw38nkeyNTO/gTDu
	NnWyw5cuRf9KG+E4i1wkEuP6mSClVJW2XrlHxYFjmlFVUhshDconzcu6LxMEKyINed1xMM4f2+Hs5
	7bs3rYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAJ-00000005iwO-2OjO;
	Thu, 26 Feb 2026 08:56:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAI-00000005ivl-2GrF;
	Thu, 26 Feb 2026 08:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J0aCnSwYvtBeHJ1OOM9Vc+I/4tW0hnZ2TREQUA4zAXs=; b=Co3yoE7sQxKNDAet3QfU+NN/aD
	gUYxmh9W6XuwKxxFY+CStqDaGTPF/WvyRS1vn9xUsqYgICTOg7cmzDgBGuK6q6WCcCLBNKBnq4etK
	i0eYgE7hKxYA5qmHtyiZbWgZzeEGpjZ1k06qcuUPYzn0fNDF63b+x/8wFusI8xrzd67jD9lrWhcWt
	P6wvWisZpiY29jzYnT/uUFnJyB+pLpakdmp6O0HwzB03u3xojYd6EZcRmiLafQdzBfpi+epCpPO18
	9mUJb8Rsg93028iIqM08X+Blxix+e75AO+aZLhrBAnoiTv7v5Rr87/R0IzyMdF7F66/iRMbvLdClE
	sX4j9A6Q==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAF-0000000AYYE-2Shp;
	Thu, 26 Feb 2026 08:56:09 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772096165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0aCnSwYvtBeHJ1OOM9Vc+I/4tW0hnZ2TREQUA4zAXs=;
	b=pQ7UxviVlypqRjlqEeDNj3m7BlZYSasMdOs43dosLALx5sF6UIqYjywFswE58fKdwxzW2p
	dUw9zYs5o99nFSxCuSWVl3YadnPR1j6qxOjTnF2+BNWNaaNlOtpj0nDe7g4i4lEAdS6wA4
	H7dXAlVShcbxoBLMduQPFPJwHGw/NjS7Mvq5VefhOe46x/vLXMbRLtiu8YPO90Lf/M5nKo
	NYTeNmUe8TLxitKRssqdWl+T0PaKbL19m+ZmSwmhQ4j07HLmzmQe4D53mfdFWzIOdUkO+1
	AAnsuB/JDwIg6+uyhChpZSTRXmn+cuq7iR/rQYiN1ojZP8ABJEjYWbPPLTrCRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772096165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0aCnSwYvtBeHJ1OOM9Vc+I/4tW0hnZ2TREQUA4zAXs=;
	b=K3VU5XlM25UnEpiH4P1pkFaDQ5kw4cl9TJEHZOrQoP0eGGNDASuIMPfTo6cLsH/HoBau+K
	O9wGdm/rk7xrjoAw==
Date: Thu, 26 Feb 2026 09:55:57 +0100
Subject: [PATCH 4/6] arm64: dts: broadcom: bcm2712-rpi-5-b: add pinctrl
 properties for csi i2cs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-raspi-dts-updates-v1-4-60832d20ff04@linutronix.de>
References: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de>
In-Reply-To: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096163; l=1219;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=NuciaL2iHKWVF1yvY35a53EcJyafL6FaQLYCV743U74=;
 b=IcWic5/moOTnm8vW7dUP0spg4SX6UDqtJX5NqrGxx6gBy1i3zUzBzkmanQoLNqmXsl/24eox5
 3XaZe+lDIK8DYmsHqLf2ylDNva70W9UA6ha2oR2MaRbqlvRfMtxlEFp
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085607_870002_5A6E7E79 
X-CRM114-Status: UNSURE (   7.15  )
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

Configure the i2c pins for the csi interfaces as i2c.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 28560828144622622e610db12fbacbf1a6b7267a..0fc57e72632edca4686a859520a0dce7ff112f06 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -68,6 +68,30 @@ usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
 	};
+
+	rp1_i2c4_default_state: rp1-i2c4-default-state {
+		function = "i2c4";
+		groups = "i2c4_2";
+		drive-strength = <12>;
+		bias-pull-up;
+	};
+
+	rp1_i2c6_default_state: rp1-i2c6-default-state {
+		function = "i2c6";
+		groups = "i2c6_0";
+		drive-strength = <12>;
+		bias-pull-up;
+	};
+};
+
+&rp1_i2c4 {
+	pinctrl-0 = <&rp1_i2c4_default_state>;
+	pinctrl-names = "default";
+};
+
+&rp1_i2c6 {
+	pinctrl-0 = <&rp1_i2c6_default_state>;
+	pinctrl-names = "default";
 };
 
 &rp1_usb0 {

-- 
2.47.3


