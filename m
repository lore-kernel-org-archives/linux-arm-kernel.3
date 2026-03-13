Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE97107BCCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiKj1Ae1Nq30oWJYukoJ9UQDHdKLGJRPFU6TG2WIN9k=; b=VA+tUgI5BjH24F0zXgG72DMSva
	NKGi2fiG0jZDHvSITv7OwtgXUbJZUTUn9N31lfWtbPrYxNf078WbeWt3+OM+Z4rN4ymR/ewXDN+rZ
	1KinzAaeX88RPNrDLiL/P4Yjid6YdRQccsTlykL/fhWrHBNVCiTNaY1BHpYKZ5NCq5AL7wpPfdkeP
	I7LClyVKRDoXlYr7ueSDy8RqYeDZ6jofaoq9mXOk40yZokEodewZZCuxtK8N5/xZO7UfbOr5ajtyk
	VmoKVGc9D7sYLJUUk/n0RdPIkj2hBM0rNbCLKZGloueJw68+RbwyNgV1HTUSM7kUD4Boxxzgnds4t
	v+rRY8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Z9-00000000fPl-1hfE;
	Fri, 13 Mar 2026 16:40:47 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Z6-00000000fML-0ov4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:40:45 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fXVbL59npz9twv;
	Fri, 13 Mar 2026 17:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiKj1Ae1Nq30oWJYukoJ9UQDHdKLGJRPFU6TG2WIN9k=;
	b=BauD8D3RH7U+Zvn5Bg3Kgot0+k9/2eZ7Y1YX0DLKx5Os5AZx0DTsM5WAj1ogzRwrvNfZEe
	NAJft0r6+drWeRGM6lFarE3KZI1mMcMI8ODskPVIliZ8KwW84fkAxZvFf+Ng4pPU0wahiN
	AyhD8/r3JCdJixI05572ZShuwa9+zP3rO+v0SbTBWDadByIK0cCYaZ4u2hiVmsVMIYb4QM
	LlJZUwOKrCRWOhf7SxzhLX434zirBxmcixsWQaKuNawPISN0FfgYet3Nz/++1SupnTgss+
	UEDZBipuRK2ijXmCge28ieySo2b7FjoqXQWHGarv6qSyJzqO82IgRqYHkDHZAQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=r57eZVFS;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiKj1Ae1Nq30oWJYukoJ9UQDHdKLGJRPFU6TG2WIN9k=;
	b=r57eZVFSA8SyI9M2/6ocb0l12cqrywsHrjT4gKvRVUuPwhJsfflFCN6pdUH30wK7t0ZSPs
	5aOK0oP5fsR2HHLvYzoPGvBGB7f6ww9xVrJfP67WacNAc83HKfHNZLuYbXHn4+p/T2wxJ2
	e56v9CGAKfMLMjyN7cQCG9fI6tG+34slHrDPKrkCuz+yMENKfRNCB1ck2FKMcu3kbzidpi
	Jc/F2FJ7uFGbAW0Uu3jnMqzAjmlYTDJ7p/LLQ3W53DeQZoGCfwX+6CavwiQdH0vXozW9Z0
	VVE4AN9kx8bVflreD8gz/ag/3B9itLBz/EiHZZ/s4AI7kVRoSHRCoSwYTp94Aw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
Date: Fri, 13 Mar 2026 17:39:04 +0100
Message-ID: <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 20084bdbc68b0394571
X-MBO-RS-META: bwrdb1zj9q7o9fojgjnb8p4buuew8dq6
X-Rspamd-Queue-Id: 4fXVbL59npz9twv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094044_395459_88829ACA 
X-CRM114-Status: GOOD (  10.88  )
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

Realtek RTL8211F PHY schema indicates that compatible string
"ethernet-phy-id001c.c916" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 39fe3f94991e3..07147743de93f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -100,8 +100,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0>;
 	};
 };
-- 
2.51.0


