Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A7BD26D97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LwStWsskDH1+JJBBNbn5kMHcfJtJYy2wTpjpz3r8SvU=; b=OuCrojX6gM3Onv
	wKpyKNJ6ofZgkWkuTRWwewOCRxk3D7U1rLAA4sLYU+eoGz9MmpxR954wS497ko4lt70caJCRgwvu2
	wxS5sUndy68hJ1dN039crNK94d3PO/eJpQN/ZoW2HC7PuavWBe8FmclQHvsQTFymf3yUBKFWScAV3
	Lk1j2Oy9HzuMHHHj0MagcP7hKOiwyvvKoWFgKVl2hBXfQzqo9HTh1Y8doUnI11uL9CfuBBRQ/ZZ1+
	F8qwAUwsbkrMxxrVaTATLTW8M5H8VM7aVJmyvW0k65zvCLhDc0uybS39bJVMZCkbWp/HVeeV9jMhM
	gFfWVoOjba4eFs2kxoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF2M-000000059z2-2XBo;
	Mon, 12 Jan 2026 10:20:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF2K-000000059yX-0hpN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DB7F40D83;
	Mon, 12 Jan 2026 10:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C003EC16AAE;
	Mon, 12 Jan 2026 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213235;
	bh=sB66Cur7cnTTnuSA0LW+FqIiIPtXnYjfOUw28gPpuXI=;
	h=From:Subject:Date:To:Cc:From;
	b=eYLFfQTQcM8Qj/PwiENE9IA1QZICoXSelI4YAM1GMDKmt0qnjcZA6hcmjR/hCAWUW
	 PPPa9d1WN+ixod/n2CQ+qYX1xwOLFdzb2rUWkphARBs3YDibZ7WY+8hrm9EdWngcQt
	 BLILaEf52ULORbhSnwXFKCDoHrWP3ZoV045p0TcVwUR4EOBiBdYy4UlFH1mzf9Vlde
	 Z4Emd92ErMfRTvu3l34nJLQaM36ivi7bkasD/MBxVHBxikRTA8TKjvY/p5G9+UDr5g
	 0dDtC/p/vVr2HJmqRoMvKt7lmVocIO91cms+1juWxlAqMfitxKDLYXzunGakeEQ9GT
	 +eYh7im8EzUtQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/2] pinctrl: apple: Fixup and RFC GPIO mode patch
Date: Mon, 12 Jan 2026 11:20:30 +0100
Message-Id: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ6CMBBGr0Jm7ZgOCP6svIdhUWCAiaStUyUaw
 t2tHMDle8n3vgUiq3CES7aA8ixRvEuQ7zJoR+sGRukSQ27yyhAR2hAmRuUHDkE89i/XYmHItPZ
 QWqITpGVQ7uW9VW914lHi0+tnO5npZ//3ZkKDVccNNdW5LI50vbM6nvZeB6jXdf0C/JONbLcAA
 AA=
X-Change-ID: 20260111-apple-req-gpio-func-3010ca45a118
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_022036_252959_EBE2936E 
X-CRM114-Status: GOOD (  10.77  )
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

This fixes some uses of the "unsigned" type to "unsigned int"
then propose to implement the .function_is_gpio() callback.

The Apple pin control maintainers can comment on this: I
am not sure that "mode 0" is GPIO on this hardware but I
find it likely.

Toggling a pin between a certain function mode and GPIO
mode happens on any sufficiently advanced system sooner or
later and this callback was implemented because Qualcomm
ran into it, so let's add it to the Apple driver before
the users turn up.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- function_is_gpio() returns bool not int, fixed it up.
- Collected ACKs.
- Moved driver patch out of RFC.
- Link to v1: https://lore.kernel.org/r/20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org

---
Linus Walleij (2):
      pinctrl: apple: Use unsigned int instead of unsigned
      pinctrl: apple: Implement GPIO func check callback

 drivers/pinctrl/pinctrl-apple-gpio.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-apple-req-gpio-func-3010ca45a118

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


