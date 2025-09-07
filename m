Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3234DCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1uFYBfk49jDUAm/by0hYFCKYa+C76V3J04xouJr9lM8=; b=H/W6WRq/CeAQqpa+S/p2Db8TER
	x0S+kMfXUDQuiwGpJFgfWR3f3Ib2to13aF8lhxU+KZGPyugX94wHgOPMduLnGND6D1mH0Sdnx1sms
	a8pezIZtwTXA3qFbHVR7jrLhyBf6EjACpF0mWE4VL/Z/UrrWwnFbtAMGAoySdjSbLBS6vA3aOk91r
	OU3yLKOUUXv2mBrZw4dHx84WPSrDpk6MIRGnQ3mkEC4+V+mvaOh8JL3gEpQFm4ZEI+tCdS3z4ZeUa
	JHxU/Fo7bRatWDTJ+jK8ecibnfEcdetlCoLWCLEXoiqwzyEMy285k5sNTK3SyTI58OSVZBQK8HF9t
	+pgU0wow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDrd-0000000AuaP-31Ih;
	Sun, 07 Sep 2025 11:47:21 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDoo-0000000AthQ-2uza
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 11:44:28 +0000
Received: (wp-smtpd smtp.wp.pl 23296 invoked from network); 7 Sep 2025 13:17:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1757243864; bh=1uFYBfk49jDUAm/by0hYFCKYa+C76V3J04xouJr9lM8=;
          h=From:To:Cc:Subject;
          b=FGGf95dW8h8wVbogJVZzP85XsvhO4eDgnG6YgHqfJgNREZWDVfB7XdgyBnBpnAbbV
           ErHwt0/A/94VP2oAytkz4H1XdHeeCypOHfm83XMkcj6m9anl0nrJ5PcNUsE67o2Xv0
           M84j3mDdBHHKBrjr950HeroM/Oibaxyc7zI2Wm0iD6oB7RLU5dWfEPgB4eRwWdtGhl
           joF98jAYxlyLYq+hmrOeZuUfhRlbLOCl/vC/mrdAUIDuR5GGgz3KKzxg9EuyFh3/zn
           Ckyi4xDvIU/CUf2qx+zr5L38PP4f6iyKSVvaYsTWxug/375OJKLpgXe0otXiZa3SPx
           h8WLJjQlNT/BA==
Received: from 83.24.123.254.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.123.254])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 7 Sep 2025 13:17:44 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v5 0/1] Add thermal sensors support for MT7981
Date: Sun,  7 Sep 2025 13:15:08 +0200
Message-ID: <20250907111742.23195-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 463d3484e28a789ae0e3ac03bd89cba5
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [gTPk]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_044426_889770_C36EEB23 
X-CRM114-Status: UNSURE (   7.79  )
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

This patch adds support for the temperature sensor in the MT7981 SoC.
This sensor is exactly the same as the one in the MT7986.

Changes in v5:
 - dropped another accepted patch

Changes in v4:
 - sorted bindings by fallback names
 - dropped accepted patch

Changes in v3:
 - added fallback in bindings

Changes in v2:
 - added fallback to an existing compatible string
 - removed second patch as obsolete

Aleksander Jan Bajkowski (1):
  arm64: dts: mediatek: add thermal sensor support on mt7981

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 31 ++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

-- 
2.47.3


