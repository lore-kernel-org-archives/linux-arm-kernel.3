Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4BBCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ffd6U0ud/BZgtTg0q0JYVe7wVelt+yEgyu9d4S2SN0M=; b=uzSTMOHxsQudct
	UscyUEGUK+oQv23VHXkPVucJU6aVUTl8bHn1buvUi5ssC+qQm0BE9vfe5nmAaM3frcYkt3cPVMasY
	FGrhL8zYuncL1az6bshiLdIGsir5wWssSpaSM3mUDU3cZJysH1IB4td1L4AWG1OojyYu+f2puUHxf
	EKxCLkjaeUb46vMMo11laUItAF1Wd8CfFs0cz++AnNQItz4OSlQEmsJP1zBNK7oQlKxj/jPUlYtX4
	KbxKf4ErB7ad8ltPh6I3qxlgBlx9vyVK5UTdfCatz7xhRCL01kaEp6mKFV3/QsWP7Rzq2vi1e5iwp
	z0b3+bhJ2moEmwct5N5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaG-0000000ANjO-49LJ;
	Mon, 12 Oct 2026 11:52:48 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaE-0000000ANhI-3EpX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:52:48 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791805960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ffd6U0ud/BZgtTg0q0JYVe7wVelt+yEgyu9d4S2SN0M=;
	b=dPcqrA74FmgwBDpXRUvCVdmUIB6qOUwNl8EFHoBSAQqkpUPDJhjRI0R2WQEeiUQHJ2uCxm
	LWyJdps+s/wXUv+iE+fIAYpPzcO5nF9VgzAAKsk5D+kq0sp9DjgRdPD9ooZDa0Vg8TfNYC
	s9rg80TW8oy7Xo8fSTPj95T5J66u9h8=
Subject: [PATCH 0/5] I2C and pinctrl support for Apple A18 Pro devices
Date: Mon, 12 Oct 2026 13:52:31 +0200
Message-Id: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORtYAmrxV8RD10aNjC6kVYSxf
 7fq8V3eClVcpcJpWMHlpVWX0kG7AdI9lpug5m7gkQ80EmM0mwUjBTRfMDc0Lan5jMoJ5RhoH6a
 ciQP0wlyu+v7158vf9Tk9JLXvCdv2AbuWsziAAAAA
X-Change-ID: 20261012-apple-a18-pro-dt-pinctrl-i2c-e78158bdd128
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_045247_052258_256908A7 
X-CRM114-Status: UNSURE (   9.76  )
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

Hi,

this series contains two small formatting fixes for the A18 Pro device
trees, and adds the required dt-binding for i2c as well as the dt nodes
for pinctrl and i2c controllers used on the MacBook Neo.
The pinctrl dt-binding was already picked up from the previous series
regarding this topic [1]. The dtbs_check passes when this is applied on
top of linux-next or otherwise combined with said change.

Merge strategy:
The only change in this series outside of the device tree itself is the
apple,t8140-i2c dt-binding. There are no other pending changes to this
file, so it could simply go through the apple-soc tree provided Acked-by
from the respective maintainer.

Link[1]: https://lore.kernel.org/asahi/20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev/

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (5):
      arm64: dts: apple: t8140-j700: Fix property ordering
      arm64: dts: apple: t8140: Group cache-related properties of cpus
      dt-bindings: i2c: apple,i2c: Add t8140-i2c compatible
      arm64: dts: apple: t8140: Add pinctrl nodes
      arm64: dts: apple: t8140: Add i2c nodes

 .../devicetree/bindings/i2c/apple,i2c.yaml         |   1 +
 arch/arm64/boot/dts/apple/t8140-j700.dts           |   2 +-
 arch/arm64/boot/dts/apple/t8140.dtsi               | 172 ++++++++++++++++++++-
 3 files changed, 168 insertions(+), 7 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261012-apple-a18-pro-dt-pinctrl-i2c-e78158bdd128

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


