Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4AEC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6g7nbO2M1qqUr0/Bx4CqlMPDTHAgE252nPWP6AfYUQ=; b=Gw8rO8tKTf1POCDD+mBlbS5E5x
	fIshYYcMnJE0diNuzYNF2K5idz36qK10hjYC9G48FzE02EDKK2ABmB+xyI9ACDzNY6IUhQmAcvQQz
	mv/0JdNNmSjxNI1kJ5CGOficbEGJmIRxF3LX3yysoBbNjqTiINv73xXt5jvJgSKDisJgy41RynfNp
	gF2ooZhzl2vABmSzHMIT1bXEL1/+8xCD1jLrDNkulUV8fl+sLHVyaZo7hn0OkClQ/PBuU7O4NZDLq
	UYt0J9yUrIp/iBNImBDf61POCe40gIQrOhGghCRRegOROiU0cPcLyJYBBDO0jj1PW0Bd8KA3xKL94
	RBwvAehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7nC-0000000E4FW-467e;
	Mon, 29 Jun 2026 08:56:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7nB-0000000E4Ez-3YAs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 29 Jun 2026 08:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=c6g7nbO2M1qqUr0/Bx4CqlMPDTHAgE252nPWP6AfYUQ=; b=SapLZhjF9ADC4Zgy3YuS2YXKOX
	KPf/27NCEbBNxkwlQjYAxCIt/bNIvqzw37KVqpaImgXBxvM5FmEIuJJqf2FUY7gvUggN01Fyqw0mv
	CrHmMnqKxvhFUCuI8jcJ+1fDC39q6zHwGe9oEipFH7olktorQA6scKTcLXdlrCbGIKW+ROT9441Ja
	Z0fXjSIr5OOIo/qzmmLUuSs17G/4yvGwcCgE+KGHIsEZlYFEYeHjsliwhDlla/Upkz1ONaGrAyMce
	iCoAgISFxUG7iJsBUWZ2iV6gQBhZHYKvrFkyum7QBdbtUSErQyaGxifdFkZCxhEzMw+/zKPYT1RwV
	2j5t4T+A==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1we7n7-00000000nWc-35tI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=c6g7nbO2M1qqUr0/Bx4CqlMPDTHAgE252nPWP6AfYUQ=; b=flWvWT2RH9I4fVnnWs47isveqD
	GJQaSVchmfdboyk6+Fe78wCuKbF8JXDZfWf6iNtv2QduU1uZqmiZlDIB22n0cizqmbLXkn/asfBZC
	KKHwni3xOxNuilVCZoOlaLU/LXL/BcKzZuxi+ZUC6D7UC1eaxExIRVYTFAtkyZqDtECi8eFUG5op5
	ahpXOIFdT7wxlje+q91575PmxL9pB0Ug+WuVbsDj0sWzlNx/e5RZj7LlPBRrUjND1miuTJJZPggq9
	JWryA2DBjqEa+AKVi/5nPhV9rkYL4yGiuT3swLT3FareS+OlwXRKL8FSX7Tmv+CSxlY7lVaS5SICe
	XhDFTORg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1we7mz-000FcP-2t;
	Mon, 29 Jun 2026 10:56:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1we7mz-000K3w-1E;
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
Subject: [PATCH 1/2] arm64: dts: ti: k3-am642-tqma64xxl: add ospi0 vcc-supply
Date: Mon, 29 Jun 2026 10:55:50 +0200
Message-ID: <eea90f48c139901397d65487a87b64bf1744587b.1782723206.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28046/Mon Jun 29 08:27:20 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_095634_468186_F09DC8D3 
X-CRM114-Status: UNSURE (   8.80  )
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

Add missing vcc-supply to ospi0 flash.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
index dde19d0784e31..fe4cb49934bef 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
@@ -106,6 +106,7 @@ flash@0 {
 		spi-tx-bus-width = <8>;
 		spi-rx-bus-width = <8>;
 		spi-max-frequency = <84000000>;
+		vcc-supply = <&reg_1v8>;
 		bootph-all;
 		cdns,tshsl-ns = <60>;
 		cdns,tsd2d-ns = <60>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


