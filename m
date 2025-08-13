Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A900C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtiKR8sUawyJvGwo7f+r/Upe2YtI1Ov7EEtRbuZk4hg=; b=Lutkx5R6+VKbyZXsmCn3tVXxHm
	mFWQAm0RIUCbKW3WY2+NNewYu/KqRhY5z6WCjxEht5sNK1zqhdAVxkONxqtbl+l1Sf4vC/FTQoV1L
	LExlnvHUIAUMcya9iFD/oo4BCL9qzCwhTW6ZZxcc/WGtSETfWn272Aos/pTVhum1MKisEFp/17vlY
	hnyzjId9XY5gYm2C/+GKXAK/N5NEWEk49ewkvwv3THTz1MqyDCjd/tMXgVIGTz97XfBd+0m0RcIlI
	SuAVAQpeIOVCYYY+W4fxEZSPgwmPm+8HIimlS089g6rgXJFbpOpSofFeAzs09f0tgioLIKHZsX6B3
	5KgSZw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDEI-0000000E9lZ-34dr;
	Wed, 13 Aug 2025 15:17:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtP-0000000E4qa-3Nkx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 14:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LtiKR8sUawyJvGwo7f+r/Upe2YtI1Ov7EEtRbuZk4hg=; b=RqvTM04AuYYhgmb+xmQfhr3mCs
	Szq6JMqigRcZO9z+E44Oc1a3P5tqZhxueF67rx9QvgeWU8kiysFavqocUy/D4oh3AwoBeGF3Yq7EG
	FSFCdU4E95JKY+vHJfflNqRcs05yzJAq4zBFa1EEU4mEtao4TbgXiu1uho08mun2fWkpNpI7FaCa9
	/VYF6IWg8kU+ejtFb/jYyYooF+8mdvunGRK/qwcdjn6EwY6dvHiYLpYD5eAciJA4DnZojEhI0nUr7
	PSZzZDMmJoC4nae4W74LT3gm+Q2BkgSjJXiLC4sO6f2wJz9iEzS0x/8VYX1j83+WQSrhMamE1cexA
	7dHVc+oQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtM-0000000G72y-0Ayy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4141EA57B23;
	Wed, 13 Aug 2025 14:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BC3C4CEF1;
	Wed, 13 Aug 2025 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096950;
	bh=/usWm/vrAulCsp4Fo0dvH/GWf7HQ6Sc8o/o3f/vf8hE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F78sv2/7X2r8RCxweQ91Vm2r+O/C8tEOxDFBrupkW8VJNsfb9n9TDBF7i0rmY/fvb
	 tH3pvYlakWjVDCdjH/1LMnpZcreHnm0smJuVA2tFwp8sycBBDKg91IPV8gM4TuSlmJ
	 1nmafLuTvPmvzDlfs71e2XeRHbe91fDeb9L9HXtNjcd7oyEuHctzCeZ4DyFlTBfPKs
	 MOLJry39YvbVDDxNKoYt4VGNZu4n4+MBDAlbes5cXHmMEAoq1sXHOimGhjkhKLDTXg
	 5EzukLsGzN8tfgBXrMmJfPaqk2m5UVEyz+0PCOlFZTaouEn7oKHZ7KzVW0J9yoxC9d
	 O0tFX1ePl/ixw==
Received: by wens.tw (Postfix, from userid 1000)
	id 42B565FF03; Wed, 13 Aug 2025 22:55:45 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v2 08/10] arm64: dts: allwinner: t527: avaota-a1: Add ethernet PHY reset setting
Date: Wed, 13 Aug 2025 22:55:38 +0800
Message-Id: <20250813145540.2577789-9-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813145540.2577789-1-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_155552_281368_A1DFBD45 
X-CRM114-Status: GOOD (  11.50  )
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

From: Chen-Yu Tsai <wens@csie.org>

The external Ethernet PHY has a reset pin that is connected to the SoC.
It is missing from the original submission.

Add it to complete the description.

Fixes: c6800f15998b ("arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index b9eeb6753e9e..e7713678208d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -85,6 +85,9 @@ &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
 	};
 };
 
-- 
2.39.5


