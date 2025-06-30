Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D973C83038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h+ytOTHtPKzmHb2nLvuf2JkgrvLNpGOXEp0ezvHCTIM=; b=UwKSG1i1jVeEJHVj7DG6KWk8Za
	PlKSPsToJIMIZFAgdW8gWgr/SUr9Y5BR5GgwS/dW7Uu9w/4v1C+OSLkAyfoTpQEedQ5YJqvGkTajd
	cisDjaAtCHKeCdGi0NfnOKioMHNbFpVltmH0xZzxcaMTrZrhSbBRp9U1RPCmyNXTORzaLkptNoQjO
	yA6yxv9T8+3iIr152FqFa69a+011c6fPoruzsBbUYIo0h4HUGrTn1Ckxl6bf09oTkVvTShE/3Do1C
	XqdpD+sJ/Kuj4Idd6PGaKSoxu0H6QdJwDjlq2qeOac0ATaZjsnwUFOc3inaDS8cupNUcDIkQDzKgZ
	OwWEsYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJv9-00000003GWK-47kg;
	Mon, 30 Jun 2025 19:12:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlw-00000003FKR-1Qn7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 19:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=h+ytOTHtPKzmHb2nLvuf2JkgrvLNpGOXEp0ezvHCTIM=; b=DgHwA6XkVXpFVJ2cgKN6NaZrSw
	16dNy42Un0wWRQThgNGk++CzpVXbXb+6j8BFUFCpRt/nT98hFKh0tJPwoDuQ7gDDmyQ09+yjSBXUx
	ovzo03bAWrPTbxfky/yc+6XG1Rxt7D3deY1u1YmKu5ygAh7YaShwyfp+IdhzfSLOMdz4OEoEzm4j7
	WsxOn9LgY/AMr61LVc36/OgYgMgoRYn6OqPH6WiOi9SobkbzVvVq9me9RS0JZXMkg4cyO2v9xeATf
	a06eGIRdJ21kEEARc9paef+Wcliodz6m5TN82HbuZU+qkz7VkE4sTdDDH/pmUxCXDlpteqH/ShiaB
	7zC7Wo1Q==;
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlr-00000006s7R-1RJ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:02:30 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3083AC00210E;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3083AC00210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=FJ5ZT1ESgpucVBNUqPiViX0zjhQKsXr4qEmPO8gEdVI=;
	h=From:To:Cc:Subject:Date:From;
	b=kVl8gO/CmPfVDSVhaSqk+oFAsGDsaD2GvFJWxwsV1kl5gPlF1gusaRFs9ZC3eKCcP
	 Ta2Z9B/aDuVBJG6u4QALJM9h31z48McbekibFlKquHUNs+Z7r3iFwfk2p1cll/W+eT
	 Uz4LPN+F1879a2V1H5J+rJqtehpsflrC/9JG58i8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D38FC1800051E;
	Mon, 30 Jun 2025 12:02:21 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
Date: Mon, 30 Jun 2025 12:02:12 -0700
Message-ID: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_200228_772708_66CBCE8D 
X-CRM114-Status: UNSURE (   7.91  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/defconfig-arm64

for you to fetch changes up to 44bba869d25985eb2212beaa4e353f6aa476dbf0:

  arm64: defconfig: Enable OF_OVERLAY option (2025-06-09 10:10:06 -0700)

----------------------------------------------------------------
This pull request contains ARM64 defconfig updates for 6.17, please pull
the following:

- Andrea updates the defconfig to enable the RP1 misc, clock and gpio
  drivers as as well as turn on CONFIG_OF_OVERLAY which is necessary to
  apply the RP1 overlay file

----------------------------------------------------------------
Andrea della Porta (2):
      arm64: defconfig: Enable RP1 misc/clock/gpio drivers
      arm64: defconfig: Enable OF_OVERLAY option

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

