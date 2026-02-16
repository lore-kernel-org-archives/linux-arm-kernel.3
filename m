Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F3E7BDB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Au9YGUWXJMl0Z1GJQIR2WyTwbfIwDLuybPtxyXmyVug=; b=y2PLK5NP3MUV07
	/7Vkzk42UFTc0EuxvEVNMWjELHewqh4GrF6aFAHyCg2j547WYOnasSOqLIZY485B8Uii7kHXXr/K9
	V2OnusYiILKqR/RGS2H2i0vArRPXBQBJWZBNRgxNxCBhOva864F+QMkrAOsUSSUCTkRZTiY14XUxl
	XRJr4AzT4aGSDyQe3rkwDiJHcl4oD3mFi9zAKwkEKACgnIXZJckV8PCkAjdKHJVwT2vaQ4VuRjlmD
	5/bqr32hER/KXF58CiSr7L+yREa8TjivKhFl67fzQbSjhL/SvzInX8+jElzedH8KfKwVGu2TrHLTh
	wG2XtvV1qAS8BlpRVA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs3-00000006WZY-00au;
	Mon, 16 Feb 2026 12:38:35 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs1-00000006WZB-0jaR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:38:34 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3870df2331aso43555201fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 04:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771245511; x=1771850311; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Au9YGUWXJMl0Z1GJQIR2WyTwbfIwDLuybPtxyXmyVug=;
        b=Sok67nhr5Y9vrBlmeJuJveu94Y1l/kWnkNdn3J76BHAv3GaXzWJiux6yWVw28UqARo
         iVcIJ44eDwwoomqbQ/u5c9YDpX400rUJ6HGhd+IO3NkrR0lokkHCROr6fesObpYdwKtI
         nsUp9CY/YRvhaoi8tmd3uGnGfyyOE+TLyODsQIr/PBqMCyc9y5vVuk1duCZigCR2BqZ6
         hvX8RKr7TDCvpU9F7lodyBXe2Fz8JwRYkeUoV5msS6ZTQsJX3bkDCddBAo/pxtVWyEjH
         HFaISWaw/AFq+0IyYRqTBSOcJqEDIJlNLfTPye0TnzB7qgFP9MV9TKOojXZKN7Mb2/ot
         7Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245511; x=1771850311;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au9YGUWXJMl0Z1GJQIR2WyTwbfIwDLuybPtxyXmyVug=;
        b=jQLILRt5nnelWFHWyfd72WhVkqnDc+9lNm6a5m28CuU3MS17k/aWtZkBq7Zbe4i412
         iTh1jcbJ2SFQ8s6YK0+IQysgaCTriK3YQsh8mfFAxWuenWP0hBKOzHvAC7eggW35uqJ8
         CbZMcxCwQIZrz0cv1LPppUAZ0OobWoeaJEXw9BqBoseP4M9baenRB1p4M0cWnmj8DK90
         FWETQ1+Tx0tw0t8IV94UD9QQhEilrCjn499KObJ9G2VmU5yrD6/3TfPFe9NRrFTW75HI
         AmPsuwMp87bi/CXoFT2mkx2+iTRAxRdYVTnSf8/o94wUpufaOmU+IrgueRNVAqYZGPB7
         FJ0A==
X-Forwarded-Encrypted: i=1; AJvYcCX1G5QIZhL5JN8AhrxK0+FwOFFCSDs8MSLHIGaPN5g+zMY1bIeGyyMuSzayMisYNLXtcs5lUqxpp4LGJxCkU33V@lists.infradead.org
X-Gm-Message-State: AOJu0YyvFtiOviUKTvOd7CSaqUV+Q77jrLcSjLr/II57tPGXR1RgwF0E
	GO7adRju7i7nzeHCqTNa5ywMjeZy11HvIFG4r5O4BXqD45zB0na+OIVZLSWVPA==
X-Gm-Gg: AZuq6aKDDxr+s0gR8WeggRiZW7c6BaFO1h/yH6Vge/wLDsiFCovlYUoMn4v6DxgRYJj
	MLxZNG38JhStXluGOw75eGdkDaGSDiqzyxOER8+JM8ZN9cY7wlMCSzY6uUoDR3zhVwIVlkfoQDb
	LF5MfSuO1FOyiKcUsWkNrGlv+WUiaUMb1Ozfm7c4kMJLsKPwPejHJ4IAN6dIarsV11oz6nE/3Lu
	79patgsvJtA1D7dhO1xvag8d5anecgZfLbfD8qKESZl17tsn0l/xE7Uigr717xh3VTT2eyKDd55
	hKGB04aOzcACD4nysDmBXsyBg+33XV6S7i8Osw4nv1WKROlQYFJhNnNirUtrkw7fxsIhkM7BTcQ
	BYLIfpdpYpkgNKHuhR6fVnOo5OWGTS6/8YuOEUL22N0UyAke6b6qREOCKFSJilzzkDF2WmLPN7b
	xwJML71Cdp60kkPqqeMdlngenm74ObijFVMfWwXiYoBhPLVg+Ns2QjeHRKRhpJGYdzUBGq
X-Received: by 2002:a05:6512:4019:b0:59e:13e8:fdbf with SMTP id 2adb3069b0e04-59f6d009bcdmr2231639e87.23.1771245510612;
        Mon, 16 Feb 2026 04:38:30 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b0577sm3175920e87.71.2026.02.16.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:38:28 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v6 0/5] I2C Mux per channel bus speed
Date: Mon, 16 Feb 2026 13:38:12 +0100
Message-Id: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQ3U7DMAwF4FeZck2Q4/ys5or3mLhIHXeLRFfUs
 mho6ruTTbCWcXkif8dWLmqSMcukXjYXNUrJUx6ONYSnjeJDPO5F51SzQkAPZKzOyLo/nXULEGw
 SjOKSqtMfo3T5fGvavdV8yNPnMH7diou5vv50IN47itGgsWFyMRggC6/7Pub3Zx56de0oeHcGY
 OWwujZQ44PjRD48OrtyCIuz1RE0kT139RD76NyvC2CwWZyrLok4YsFt4H93+sXh6o+Kr65rkdu
 OaEvtn33zPH8D17xOKn4BAAA=
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4059;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zoK8Y4JjjpVli0tYldWuwlOtwBvcNGDImLpHHn+2UNs=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpkw+3UKjjGG+HArNi7qEWkJojo+VcEAN8Y3wlQ
 Q1POYGf2MCJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZMPtwAKCRCIgE5vWV1S
 Mk0CEACatGJ4NqlrpfxA+XkfhhVARSh35cMDQN6ViZwxsLi+JJRZ4J3aRHwrDirMr3xpV880EpA
 kioBXdZ5wXemW/i5NIYXEmV/0AlPtFlqHC0CAPBds0SoPI32vRfDG9T3JYMR6+qF47+x50qg7ZU
 P5p+3tVnFF6+D5gHodrpZkNrENg8qr5YLZB+KKVXVnEmC423iPOlV9IZc0DsSqK1hixy71Eka+X
 u1NI5RE4NoAqoWSGVee/7AEQzNEabgsNVMd7moFXT4pSBObkkv9Y2IGhoBxqXuVuo7KfcV6hm7k
 wFzX2FJ3s4QeaIJ0EVgvQgUHpb9tQr5/7MW9G2XyiCVhRKLSmlGTE5SxS5UndeTL0g5dq+nD6hS
 8PYVZm4Chs9FLU4PUhkIb5TFagxfSNqCjBje5Mw4N+erOuAllfdm2dxAJReOtocz/SaOramP4Kz
 6tYOYF8x2OUk9PmLFr0Tuk/+vAsuP2bmHFVQxl9oRpcK12jjrm5F5icsbTjppkJK0Aztlgv1o8j
 tqOeocyvcnUzK0rPnys/GbTSiftBAXvs0Z+sYqfylTshqTHN4WyRmh1kZ5zHLxX9amDfGOXTu5+
 zv6ZAfkzHhrFmls57wPSZtpyRLZgVQGuq+J30l5W9VXmNq0cveVJ5Sfc67Z3iCYwX566yBY4pEo
 ShGxwREsHqbflWw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_043833_293967_7CC6AFA2 
X-CRM114-Status: GOOD (  22.31  )
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

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

This patchset has been used and tested heavily the last months
on a custom board based on a da850 (DaVinci) platform.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v6:
- Change logic to find which ancestor to lock with I2C_LOCK_ROOT_ADAPTER
  It now find the first mux-locked ancestor and then lock its parent.

- Remove bus_freq_hz in i2c-davinci and only use clock_hz instead
- Mention in commit message that clock_hz can be used to store frequency in an uniform way

- Swap order for change freq/deselect to keep symmetry
- Only allow bus frequency to be lowered in select()
  This to not allow an intermediate frequency to be set when it is not
  supposed to

- check if(ret) instead of ret(<0) where appropriate
- Fix typos in documentation
- Change i2c_adapter.clock_hz from int to u32
- Simplify i2c_adapter_set_clk_freq() by removing 'ret'
- Link to v5: https://lore.kernel.org/r/20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com

Changes in v5:
- Take the lock of the top-most mutex locked mux to make sure that the
  root is locked
- Link to v4: https://lore.kernel.org/r/20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com

Changes in v4:
- Rebase on master
- Swap order for printing warning about "channel %u is slower than
  parent on a non parent-locked mux\n"
- Fix typo in comment, adaper->adapter
- Link to v3: https://lore.kernel.org/r/20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com

Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 178 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  42 ++++++---
 drivers/i2c/i2c-mux.c              | 145 +++++++++++++++++++++++++++---
 include/linux/i2c.h                |  11 +++
 4 files changed, 353 insertions(+), 23 deletions(-)
---
base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


