Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF71C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXg5U5wZ6c9DBUWysY7PVK4iR39OiCF8aCH5KysqFoU=; b=gDdkll4bG8MCNsXGZJ7pRgdNdp
	uC3mMO9FR0hgCle/L3O3QK3c29QWMLTiwwCV+V8X5NR2VH1FsD4dhKsaMjWUSHhd4rKcgHy3IpQg3
	pRNe4eYldm76xW3HFxTMJABv3KJ6Wqp68Wl7GBYOsjI6pcKRhr92nNKxgw4v8GN1EgzeNcC0M9E+1
	BwPc3yxIuKb3cMSYo/y7QetHJHgWP3tLFwHFH2zRXYgoLn1avb76sk1SewO2dcOPS0t8oNinNaKvl
	s3EE3e0BS0lOMEKpYX2ENDn3HxHiSdMJAPZa9nZehPyHKKN/GHu0SpGExAxUptzAnV0htKzq+LfKe
	qru5SnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7nD-0000000E4Fe-0XAQ;
	Mon, 29 Jun 2026 08:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7nB-0000000E4Eu-3O1a
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 29 Jun 2026 08:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jXg5U5wZ6c9DBUWysY7PVK4iR39OiCF8aCH5KysqFoU=; b=m42ikNWYIlC8vu+PGn8H4Q2mOx
	/dgNGuKUJK0M+FFn9+zrojQUw7H1PlLjuqBiJpLNQ7vUWIEASNRO1u+YV5E94/FDrk24METMNxUhv
	aT9K/6s9JtOgTFJbXvqS1+s+LeoZscrKfNTeaZUMLIirL08VujOkdxPXAEcwFSGgn5rCassk1tg7b
	q5B/CFoC+iruowJu52v7/gTX5hhLWU+svFjIAeX/IxRE0B5gbvBXXy738V//LxgjqGXrlXI0DTTrx
	9kTjuZCW7rkW/VZ57UqD2RqmDLbZ6TLfSRCw0dSI0F+9Hm+EZ/I8hhqTAOPeu0o6ndJyZI9+x2jP5
	jiaXk8NQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1we7n8-00000000nWb-0cFD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jXg5U5wZ6c9DBUWysY7PVK4iR39OiCF8aCH5KysqFoU=; b=U6wXFod7rWOzBwx32mXWt6Ko5e
	BDSIrZc+oXhypPVcPukhkjXKGbIa4WH1dMlk6iPFZLOdr/zws3Rba8O8afmVlxjJp/bjeDC9BVqTy
	PY6d8UxB/ewiWxGwqQCI10px7pnSP7M2Tyx7EL1mVEmyVQzVNgKvVcDdgnoP+uvgrb4EYtwYYNF4W
	G4ORScnQO9H8do0FdwBI2nokhsXWzJTGc63zmGgWLWBLv5jGILHIoNv2QeKsWMErx0XRiVXrBbi5w
	vqDAUZxOl9UTAby4ODZaCBpfGiJdECZa61Nxv8SWXYsyBbB5QlfC8Ql55fa4SCk9LgqzBSh6B0d8D
	vq/KKgwQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1we7n0-000FcX-1E;
	Mon, 29 Jun 2026 10:56:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1we7mz-000K3w-2V;
	Mon, 29 Jun 2026 10:56:25 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add icssg1 ti,pa-stats
Date: Mon, 29 Jun 2026 10:55:51 +0200
Message-ID: <5b0f5d24de0ccb0884b33d358eb034a88fe4f8f9.1782723206.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <eea90f48c139901397d65487a87b64bf1744587b.1782723206.git.nora.schiffer@ew.tq-group.com>
References: <eea90f48c139901397d65487a87b64bf1744587b.1782723206.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28046/Mon Jun 29 08:27:20 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_095634_484417_B6774C78 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

Add missing ti,pa-stats syscon phandle, which the icssg-prueth driver
warns about very noisily since commit 550ee90ac61c
("net: ti: icssg-prueth: Add support for PA Stats").

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
[Nora Schiffer: edited commit description]
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
index 46be6824dd163..b9e52d8bc8524 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
@@ -110,6 +110,7 @@ icssg1_eth: icssg1-eth {
 		ti,mii-g-rt = <&icssg1_mii_g_rt>;
 		ti,mii-rt = <&icssg1_mii_rt>;
 		ti,iep = <&icssg1_iep0>,  <&icssg1_iep1>;
+		ti,pa-stats = <&icssg1_pa_stats>;
 
 		ethernet-ports {
 			#address-cells = <1>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


