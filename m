Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF3CC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UMqE8EVxBYiDVAgwLjMfmxM93uXTjiR58AH6MC3+O4U=; b=TGG3AalKrse8+j+vGdo2TzhKdL
	ZCDDrMh3HKGJBAGVr7tgYWogqckLKxKLL8S6TqudWHUX62LUJ6JkYwSIOWOmCr3BsZmQHVV5gh2i/
	HKGwmw+KadPiXVeAsNqingXcw/0NvJM0qsVSKVM048Gu6FNKw2axVwYJKUa89UVGMvd/ZZ7Ar9aXw
	9WZTOkitLL8OfZ3rRBu0+pt26xepyVeEtU+bNNydCiUn4eAcfnBm6yyJz44SGqfr2y/BGoEAopMQ0
	vefyGOrUjKEVua9mZbBTVA4gbxlUjOu3vL8VBdCacoenCqYtrupX34oFVXygrDd1gckOZtOpfQv4H
	DqVQfb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOi-00000006n89-3t8z;
	Mon, 07 Sep 2026 12:24:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOh-00000006n67-0xq9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 12:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UMqE8EVxBYiDVAgwLjMfmxM93uXTjiR58AH6MC3+O4U=; b=csRl68EalTzlcwy46UGpuFbx1O
	z819yD+wKfIKT6SdESlvrOiJpn6IMiLS19k3M9nVWcxJNF0hdaAMrbxpOV37ikkyL6fyzZeJUWuUD
	pd1dmQdpbMA7+57pUjuTCTSbuV74Xi3l4eOHmTBTRgfh47WGiBSGlutuahTwGovtXnoA3CWWKeHbN
	2dzlvm5Zpz+coh+lJguz/6/XnvGZ9kU4c091EcOsvWUZfmNLNBLTAM4FQyZEtZyly3ZNWQcQ5DUYf
	4+P4UTZ0hviAmZNctAOGeiZdeXGok8VyTDNyLHZy7kTiSmkQNPqEvoNYgi8G1Pk/DbhkDxdHq7oAF
	1SRpRZVg==;
Received: from out-156.mta0.migadu.com ([2001:41d0:1004:224b::9c] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3YOd-0000000GDB7-2P79
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:24:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=90W3Vbe+A7EuTwCgPA1AIqMGxOjdh2ciRdVhxid1Mc0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783861; v=1; x=1789388661;
 b=AAZ6fEkoimQZ49kwgCPgGsy/DKH1kyQ7ppAqmysUpWTiFdLQfOAGm5EpjBkrBfnsCaMqhcRA
 5567/83zScWinTC2HbOHmU2nGKPPMXlVoXEGZPIJXDy8E9XzSiBlhOZ0AJlBy3evz605Bs4NpeT
 q02igNHIBZfDIDCIB6o5tnt4KSa6VJhSSkrwbV7asgopLpkVhzCGe1avrOmeftsusJ6WsKS1uMa
 LQ66uiweNWDha2m2V6H5J0zq1An9dEOqPGVDyi46daHpt2yXUuYoVn351S+gzqquZE4090ziMnd
 fJH3mbyjv3/+6mCD8RMTpvwuYRA1EMQkoaIAH1PORXflg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 253942340c5df991;
	Mon, 07 Sep 2026 12:24:11 +0000
X-Mizu-Trace-ID: 253942340c5df991
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/3] Add support for FriendlyElec NanoPC-T6 Plus
Date: Mon,  7 Sep 2026 14:22:42 +0200
Message-ID: <20260907122406.1862398-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132424_263994_7BBF3DB4 
X-CRM114-Status: GOOD (  10.61  )
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

This serie adds support for the newest member in the NanoPC-T6 series,
the NanoPC-T6 Plus:
https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6_Plus

The main differences between the NanoPC-T6 Plus and the NanoPC-T6 LTS are:
- use of LPDDR5 RAM
- addition of an M.2 B-key connector for a 4G LTE module and a companion
  NanoSIM card slot.
- different audio codec (Everest ES8389)

Support for it is added as follows:
1. Add the NanoPC-T6 Plus variant to the DT binding
2. Move sound card definitions to board DTS files as the Plus has a
   different audio codec
3. Add basic support for the NanoPC-T6 Plus

Diederik de Haas (3):
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
  arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
  arm64: dts: rockchip: Add support for FriendlyElec NanoPC-T6 Plus

 .../devicetree/bindings/arm/rockchip.yaml     |  1 +
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 39 ++++++++
 .../dts/rockchip/rk3588-nanopc-t6-plus.dts    | 91 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dts    | 39 ++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +-------
 6 files changed, 172 insertions(+), 35 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-plus.dts

-- 
2.55.0


