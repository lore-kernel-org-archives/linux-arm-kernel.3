Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D70C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k72FKtErkVWXYuvUzP0hO6M77clth2kx7kycCbq0WD4=; b=cBNIFF3in0tmxy
	nwIqYV4LTNCVYSAtQzC4TOd9Zve+r9RStCtpMQbt+4/hydd/AmYvMmACJjK2huqO2ZWPdTfe2kzxB
	uirVQvWlPsLQIE3nV3eJRimXV3JooOUopKB4o/ah3aohAqP9nybxxlKWw1PULv+YFVt7pqnf/ehf7
	qPtSJm9DjgbT/WHR5fBL4ackWklRdTekjrrsQGUMMgvQ6FV6ryV2GSU5uk8tQ5WH2Cn2AbW3pewsy
	V2qX0LBfIWDKk1sMcReYiWTCCoWJdZONYvbMsbgyaiP9ayCkcCV/5YIVikOYpBp/Yx2gUtfbRv6jQ
	FcBaq0Wg++LWENcCptbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whahS-00000000XQU-3zRk;
	Wed, 08 Jul 2026 22:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whahR-00000000XQJ-2wo1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:25:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 168BF407B6;
	Wed,  8 Jul 2026 22:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6A71F000E9;
	Wed,  8 Jul 2026 22:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549501;
	bh=k72FKtErkVWXYuvUzP0hO6M77clth2kx7kycCbq0WD4=;
	h=From:Subject:Date:To:Cc;
	b=b8GPc4j6lHcpRrNKWph1ZmKBd4PfZG6VijUiWEVTXPAyeva93kV6pzyoKiff+vhfJ
	 pK9+o9/M177Bg5x0STwXjI2M3/v/G86AX4nfc/uSM4yfEyZe4pjSmFkVfGt+sBmmBY
	 +IiU5tniRfjanBZ5RfriXEDPwrNVE5O4yDMKALT8HlXbRuWHACzhVlh7jy0Ss1+A5y
	 iA3j0CXPZY1oLBa4U7hthbz8dydjmHgn5uMadUMRogEogYad1ElwMC/JkEK7ZSkz67
	 Lc55U7IZviXNqKCuRvuj6/a+IJRuHclQcwxuIrzQwQVsbyV7rIv95NhEGWZDAY67Cd
	 EwqO+r96XvzqQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/3] ARM: Enable IXP4xx to use little endian mode
Date: Thu, 09 Jul 2026 00:24:54 +0200
Message-Id: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqEMAxA4atI1hOI9Q+9yjALtVEjUqXtSEG8u
 1WX3+K9AxxbYQdNcoDlXZysJiL9JNBPrRkZRUeDIlVSRRVK2PIQcBHvF0Y2WlqDdZ1Rp9VAmSo
 gppvlQcKz/f5eu383c+/vF5znBaafYSR4AAAA
X-Change-ID: 20260707-ixp4xx-little-endian-9930bd2f0325
To: Russell King <linux@armlinux.org.uk>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

This modifies the boot path for the IXP4xx, the remaining big
endian ARM system, to enable it to be booted into little
endian mode.

Motivation: big endian is less and less supported by the kernel
and for the ARM architecture, IXP4xx is carrying the entire load
since it is booting into big endian by default. After this there
is no currently supported ARM system that cannot be booted in
little endian mode, and the big endian support may be retired,
if so desired.

How this is done:

- Enable the XScale to switch to little endian mode from a big
  endian boot loader just as it can today switch into big endian
  mode from a little endian boot loader.

- This works fine because when we switch endianness all bus
  accesses are also endianness-switched (swap32) and everything
  will keep running as before from memory.

- The object file will boot in big endian mode. This is done
  by padding the file to an even number of bytes and then
  endianness-swap (swap32) the entire binary before it is loaded
  into memory. This means the file will "look as if it is
  big endian" when it starts executing, and the first few
  instrucions up until the endianness switch snippet are
  executed as big endian.

- Workarounds for addressing the last byte in 32bit address of
  the serial port at 0xc8000000 by pointing at 0xc8000003 were
  uniformly dropped. If the system shall actually boot in
  big endian mode again, we need to fix the serial driver
  instead of using this hack.

I did not add the logic to pad and byteswap the image to get a
bootable "big endian" object to the kernel build: just the bare
minimum. The missing pieces are:

  $(Q)size=$$(stat -c%s $(output_dir)/zImage); \
  pad=$$(( (4 - size % 4) % 4 )); \
  if [ $$pad -ne 0 ]; then \
      dd if=/dev/zero bs=1 count=$$pad >> $(output_dir)/zImage 2>/dev/null; \
  fi
  $(OBJCOPY) --reverse-bytes=4 -I binary -O binary zImage zImage-swap32

The resulting zImage-swap32 will boot on a big endian system
and switch itself into little endian mode.

Tested on the IXP4xx Avila platform with a little endian
OpenWrt root filesystem on flash.

Surprisingly all drivers on the IXP4xx appear to work just fine
in little endian mode, due to care taken when authoring them.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Arnd Bergmann (1):
      ARM: decompressor: always set endianess on xscale

Linus Walleij (2):
      ARM: ixp4xx: Relax endianness
      ARM: dts: ixp4xx: Drop the reg-offset hack

 arch/arm/boot/compressed/Makefile             |  8 --------
 arch/arm/boot/compressed/big-endian.S         | 14 --------------
 arch/arm/boot/compressed/head-xscale.S        | 12 ++++++++++++
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 10 ----------
 arch/arm/mach-ixp4xx/Kconfig                  |  5 ++---
 5 files changed, 14 insertions(+), 35 deletions(-)
---
base-commit: aa4ffae4701cc6edf6303bf35c42e24f335d6899
change-id: 20260707-ixp4xx-little-endian-9930bd2f0325

Best regards,
--  
Linus Walleij <linusw@kernel.org>


