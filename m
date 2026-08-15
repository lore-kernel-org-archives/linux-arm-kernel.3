Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3036BC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 08:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uTXfL04+7M6PFf6QMhYjfaRkbYuuslMVuPfvHfO9194=; b=hhhb/kdjscqhoByt+Ccpm9ZdPF
	keOeWXjcbJmvGX8RwOxVFyjkclgNHnd3U/ayJ0/KzSzHdZJctaiuAJ+ablWVqaBenB/aaHfczns4f
	RgoMhQd7iUfvT40mePKtKx4qZlT3gdTmaawmoa04pckNEj7uMLxJwAOgQkh/GAjskX+sqSw77tvME
	XUksYAO5UPE3CZK33Nu2btBzcU/pi0QCXsztn4preHse9y0L7wU2IrFv5qjgnT2NzgdsK5ZvTQikQ
	xzTvpMKOiukzYXAnEJGLuWhTLNdgepumlqnkBAtBswtjxnTo2ah4LJZ/8ej/xJKBX9Q7p+d0HQu45
	W73TGMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9Yh-00000003ecw-356X;
	Sat, 15 Aug 2026 08:16:03 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv9Ye-00000003ecT-3LFH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 08:16:02 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AED0E7A01A8;
	Sat, 15 Aug 2026 04:15:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 15 Aug 2026 04:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1786781754; x=1786868154; bh=uT
	XfL04+7M6PFf6QMhYjfaRkbYuuslMVuPfvHfO9194=; b=NOyELDQ7sV4fP2vUzc
	bWu78TVLDS/1DX2bPr5CAwxzJgAHjy3O192dbBxhqr/tX6jrSirZt2cZ3jhHPo55
	tSK8Deu8fJTZg0umd2UJ5gelrp/9uJFm/LzHAT3r+NyTWmjCfsHRDcMxasrY/xie
	Vr3S6Eyupj0t532dMSctzAoXMuze+RsKkQYMDQeafqSsiGZ/rMUr+dJ2uPge4od7
	/1e+KOFVS2RZGU+4O4MKpj28REVx6+0liZ/MKClIYmE1om/MOqLZ3IpTHQC4Vx78
	/fUMlx4XDTaVFI4u1FefZSgCyrq9M72drOkaMO0/7JDC9SMaB0I0uGjtwIbRVue+
	sh9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1786781754; x=1786868154; bh=uTXfL04+7M6PFf6QMhYjfaRkbYuu
	slMVuPfvHfO9194=; b=mA8zKdcwi6KE7MPz1ezb/wyKgl91c3AB9HbfVExl76pD
	F5+a+RHqjnpMZSM1ZVwXvSyhKGPLfKqD2GkTGxP4PNQy0VhiNtSQdULCW8QOCbZZ
	5DQxrm2+JKcEuK9LDeOGkGB6XjvqsFio1bLnAg4gtCmh/e4KyatxllmxUesnD3De
	OvKPF3DibaZ2LEqZGaNKiAx7K/XVtZ3ICCytqFz8kAPGHkBYItbhbQiGZotKcv5l
	FocKpI7aeUjYtKDOBVPIYgS7O2akijDtK/jU9wJdM3h9Vhoe9JUh9acROEuyjlSa
	we8un8KCxRyL89H2Z1kYEXp3Cl26Jd38cuPvDwtqQg==
X-ME-Sender: <xms:NSCAag85bDLDwXahzSMwCpI9Oy3v-vmxDJqD_kbI9TC_iiJLgmPcpQ>
    <xme:NSCAajiZuirQN-OzFh4MC2_-IOiu1CQ_PrNLA6Cxv-TXMvIhW8k4NXI2h4sgBVpKZ
    PNzhciKGmbxel0YlxvwlTslixEhaNZW4VrEEfACdGMOfrukbklLa6I>
X-ME-Proxy-Cause: dmFkZTGUT+E/IH3S8Sa45nnjiVsqDd16e+pbPfxGZnjdGaokIbfIpSQJW0WNC5YwDiTrd1
    uEBsptyMk9ouzswyZPBagl0pd8MzKTpRVMfLQDYNY7qQHbdYW7r9Vp6q3WLifz2tOZLxZX
    m9+tspUe0zXc9H3ENZVZy2GGNjERoqCQdFwfUqk5gJ4vT66O7KeXZxnSeUk20+V0XJa44i
    hQSnWgNAdihi2DFhAUjjt7oi2ptEU6Gmmo//+ALWiYQ6mWsfEwkynpzv1YdvOUDH7fRvyY
    jxADPlU2Jsvoze4VyYEUsepuWSxJwhGTO5+casTMDJ5gIi1sIkM4rHsVG59h4jGz4WKnAv
    qbRD0Uz7KifKHfKj96kZpD8oGG5oLlIpO666xgznJyZW7VpEWw5HDX9PFe68wK5b6/BFwp
    nDrzTSZwzGJrxodiZIG4G3g3TD921wJ6CqTrColZSkxBMjFUJm0e9Wqxe45Mio5iawM2Fk
    m0IR1aGdyTxqq1U9jcd1rnVG2aoEFe1WRI1TkhODjIrSsugQohZe9ASuX1NZfSLNdKR4vr
    IS9VXHjUJbZ6HaGvXNzoBcWvjMfljiKw8evACQ+7aZkSYJaxEHDslF5P4po9P4GGmwJDlw
    nmBagjVoHwMljC6iq4J1OxshHzwHTfp89xXddxByTUmQLoC2YPiPRZ1+bvwQ
X-ME-Proxy: <xmx:NyCAaioHKYVf-h4EryngrxJj4_LUzoLbEpewTCLzvHTRUxu8YTJJ1A>
    <xmx:NyCAanivzLBmE3aqCr77njkxDfrdFgJ5Y3k51J3h2vkx3cu8S48ZYw>
    <xmx:NyCAavgYf6LlHD1rJfOldt9gNWY_oLS3puSxXOOHkMjFrXGotNnMRQ>
    <xmx:NyCAatibzfrPIonDaj88miIzC5EKyAl-vjBFMppMvnXcFFPXOTivLw>
    <xmx:OiCAanwdiPZE4sVJVvDBeiQh2k4bRlnlXZBZvu641DTXG0sk5-Upnm8g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C21CC32A006F; Sat, 15 Aug 2026 04:15:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 10:15:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
Subject: [GIT PULL] SoC fixes for 7.2, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_011601_161064_359A28DD 
X-CRM114-Status: UNSURE (   6.52  )
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

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-3

for you to fetch changes up to e36c0670d5ebebd7dba493f14966051f354fbb34:

  Merge tag 'tegra-for-7.2-arm64-dt-fixes-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes (2026-08-10 09:38:36 +0200)

----------------------------------------------------------------
SoC fixes for 7.2, part 3

These are three last-minute fixes for the 7.2 release,
though nothing alarming:

 - one error handling fix for optee firmware
 - incorrect i2c data for the apple M3 that was added in 7.2
 - a boot time warning fix for nvidia tegra

----------------------------------------------------------------
Arnd Bergmann (3):
      Merge tag 'optee-fix-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'apple-soc-fixes-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into arm/fixes
      Merge tag 'tegra-for-7.2-arm64-dt-fixes-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes

Jon Hunter (1):
      arm64: tegra: Add EL2 virtual timer interrupt for Tegra194

Michael Reeves (1):
      arm64: dts: apple: t8122: Fix I2C resources

Mostafa Saleh (1):
      optee: ffa: Add NULL check in optee_ffa_lend_protmem

 arch/arm64/boot/dts/apple/t8122.dtsi     | 30 +++++++++++++++---------------
 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  2 ++
 drivers/tee/optee/ffa_abi.c              |  3 +++
 3 files changed, 20 insertions(+), 15 deletions(-)

