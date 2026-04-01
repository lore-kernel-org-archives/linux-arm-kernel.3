Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0730D3517E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hA1ON1KrKFmuynktbmS/7CrrbUp1WQrtm6ccdkoVF2w=; b=clg4uWF5nbvx14NEA4eLyJBS8G
	2XlCAZvTyPMlVvnI8DYam301vIKUbxbPRSOM7BMHUMSazeVcCCr5vKgAR9CI3J0POExOPJv5zjXex
	NBdp/p6x1Is5ULx6aiDP042QcxrXyElsaKXN5oIiaq7FJaShzHvvWfhkhIjvsGDLWKThhoArHv3r3
	XPTjuMjV3b12AC8noiMhohzG8vDNtTe8Hkuf5y9ugmhheFDQRI/WmvNThQ2Ad5aGSFPmtf2VaCYnD
	aVDVWh/onh1di6Mq3c7bpgWE5FWSDy+VwprVnl+hfWFqtketFevyvNB5gM3vb1YBVexOIEoOApPMB
	rQNv3eQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vR0-0000000FHqz-2Iew;
	Wed, 01 Apr 2026 13:16:38 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vQu-0000000FHoi-1CiS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 13:16:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1775049383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hA1ON1KrKFmuynktbmS/7CrrbUp1WQrtm6ccdkoVF2w=;
	b=Q9CwM/oXd6o2d1UrsrE7d/ftoEoJyQ4aMNUcnz7xLhhBfmtcDo2DN/htknOV8YYkKqhPpf
	Q3o4cAzlep6DIyDGiAq/ccNM8wcr75OpxVzsOYNOC4Z3q33eB1nqngcl2rROIJlEkXn1gs
	ZCXBNL5ByXU5FvhbQ8/8iXmiJhSDJxvTFCxTXOgCtSg06Z6t6OGMbPdP8Ovzov4sJLc73b
	82luSB3MmQK5mJQJD0ObpGfWASDAYM3/aHFBg0I09K3tsNMJ0K33Ez8v5Os2RypNDBMj0G
	x0KScUtfaBYy6Liio8bs14Ie5Z9prC7aFxXn7iLXA1NNM5O5Qm51Dbh2i1fQQg==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Improve gmac0 DT config for NanoPi R5S
Date: Wed,  1 Apr 2026 15:11:37 +0200
Message-ID: <20260401131551.734456-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_061636_612560_EFF04B6D 
X-CRM114-Status: UNSURE (   6.39  )
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

These 2 patches contain a fix for an incorrect pinctlr definition and
replaces several deprecated snps,reset* properties with their
non-deprecated replacements.

Diederik de Haas (2):
  arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S
  arm64: dts: rockchip: Replace deprecated snps,* props for NanoPi R5S

 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.53.0


