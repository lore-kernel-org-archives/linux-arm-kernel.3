Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B052C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H6h1ekmaSTtjJSpPBZJdBYqSUeMJt6eOzQLcvOzljDs=; b=VgNnA09F+7VIk8
	361ERJ7VFpKqmHdMLp1y4sfUBFYvylllv77PMZJe6yAWwR3tO4I255Bv9MGTpbOaHuGcl2UigXAJ5
	Pw5BHavMqi4rMXVM8Al6WNYck8qIncjz2Kv/oxPEzX5rJ6fTFuxNVqYEO2Vp8QT5hw78K623nx8/U
	lTY6V3qDlAbSn1tktn1Om5dGYylm3nho+rLjLjQuwHJ/YISYi3xBoD7mdTu0dGZijKkaNQvIx2rXO
	nATDjEqKWd53VKG7tDrvzMuyxVS+n3Rp+sC6xAJnTaDXXBNUlDj3MqVkvxunNiOjdNOVaf/Wc4B3z
	oin8U4+DcQI3Wtyb6usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCq-0000000H5Gt-3IhZ;
	Wed, 08 Jul 2026 12:16:48 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCn-0000000H5FG-421L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:16:47 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aebf9a509eso623178e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513003; x=1784117803; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H6h1ekmaSTtjJSpPBZJdBYqSUeMJt6eOzQLcvOzljDs=;
        b=FjCvF6eAEee24zOdhmAReokIZDLQHSWa4NGJmC0/nKrbeqErLRFboIx/4vG7vh6C5M
         wBOQBvJI0EiWqrADY8o4W4xgFqXbENUFX8Ps184lsREYvuzIhHvJyO7Yn5YCUCnAp2q9
         qXsABZYUhBPobVmfT1RNovgck6WtYZSrkyGK1v8wzDQbXcQtnVPDQdLehUtHkPoev9k7
         Mc2GIcJYsAgr31janildodTJ1WBGm99rEAXepGaUeU5xxZ+/Slw1B9x9N1xXVr+TrrRR
         LisbrPX/gZ2iJOKnWv2oCd81+C1uMZaOdzoDnUWjhb+g/zU+yYRswPO5zpGxz+IyX6/Y
         Uh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513003; x=1784117803;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H6h1ekmaSTtjJSpPBZJdBYqSUeMJt6eOzQLcvOzljDs=;
        b=gX08iwRVtssYN4DzymJYSJH5jEtm7ObIm2DbhtuTtcLptPsUTESMudbGdFwHBEfjIl
         c0uvoP4hO1BGL6pe15ij4jKmg5lCOvvmFRkNm77mHXPf6sIbnyhcmguBiMtSwcK6rUkP
         bZNDBzSVXf9mlR2YM8CWunruAKEnGgWtvSB86OU0/aVFXwW8gYCnnb8LaYgAJBNJcLWC
         Es9rDgDf8b+5tAIw1rY++4HUkWR/xjc1srMEPP4keh7a9/q3754teaSSSewHuWEq1bA0
         0qOjhTw7vEoHYOWApc0vi9eCzfRPjZDFV16Woik2XxEynmu1hx1EHLwQjgg5ucTTQwIh
         my9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoeFIBGpSUQx0CQgfNHTqBuojbvMHOJ6jazas645Wq42yUdivF5ZTAukdsDDQ6bzZ09LlW9HLyE9ujIGCqtbEC5@lists.infradead.org
X-Gm-Message-State: AOJu0YxrHPyAMWhzoa1DWpmTB/n/e3U0CFySyivtXb2AixM8u9YXgX4G
	RKm16qGTZ56dGX0xYMuTJXd9UDyYO2G8KSFXy2k2FxiCc72raZvBlnwEr5ONe3Nk6Zo=
X-Gm-Gg: AfdE7cldQ7xLWEDhgyPiHIUJingzuZDi8mM3wsRKSU9oqZdQ5PpGCn8YTxLUdiLTdN/
	zVXTQa/usAKf9hbd8ewPiU4ryrh9x8Rz2f5PUcIDTXNnoUCFxjL+UJDQRCojpf8TXAKcSMUsObZ
	Aq6zIpu9kpaF0Xv5tjC2BuCS4Rz+V/gMNTTF1WBWCzKzItF9v+QecHeSlfESy0JTqYYlFqGTYEP
	o8dzhNwqa6Bx5CWiKJKxfVhi29qJfHZLRGeCHlO4YOisSxX0zUv7Jo2pRb3eTQ870f1Ao+E6r7Y
	Egpi+Jmozcuo4YNseQOgg0EAyiny5LJEGCaa+71greBGEvSZD7UmM3TIzeDfQLETdY4LWuWQlUs
	hbKffP5FOmD0eWQvUsDBViXGW+ulC5xpknkpd4M0okekoV7kxM+EUA+TeChp6HBwkxWnbJSPmS3
	bsboBmcNtMAZNqTjrpJLkInfUV4BSyrVqHywootiw1MxZWMkyHUkWdtDssFQ==
X-Received: by 2002:a05:6512:6683:20b0:5ae:b2a0:24af with SMTP id 2adb3069b0e04-5b011499e49mr429897e87.31.1783513003038;
        Wed, 08 Jul 2026 05:16:43 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm4471459e87.41.2026.07.08.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:16:41 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v10 0/7] I2C Mux per channel bus speed
Date: Wed, 08 Jul 2026 14:16:12 +0200
Message-Id: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQy07DMBAF0F+pvCZoPH4OK/4DsfBj0lqiTZVAV
 FT133EraEyznJHPnSufxcRj4Um8bM5i5LlMZTjUQcLTRqRdOGy5K7kuBAIaIKm6gqnbf526CGB
 VZgyss6ivjyP35XSLenuv865Mn8P4fUue5XX7m4F4z5hlBx36RDpYCaTgdbsP5eM5DXtxzZjx7
 iRA47C6aMkbq1MmYx+dahzC4lR1BD4kk/paRD06/ecsSPSL09VlZk2J0dm06mkWh80fzaa6PmK
 KPZGjuLpnW2cXZ689I6Pn1GfHK+cah809Vx0nZyJK7aQPj84vTkm9OH/rKZ3yQeceVo4ah42j6
 gwSRrDgUf/reblcfgCHqbtUXwIAAA==
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5591;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=UH6WXd1A7TOA+jomnMou8AxdHi42KaWaeRP10BptZIg=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqTj+OvwDeZk9ceUpr4PMRs8vPmEkP/ByqakEf4
 hHbWo6TkKaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCak4/jgAKCRCIgE5vWV1S
 MmCNEACB6ewGlvwtPSU/0Cx+sIMzVNZgzQJocDBlLz+Q5fAP9nd2SZMSYYt37OFlvP4lH2DH/YV
 Z5lTzmHbl6p6JHx/fSR3dfRCPt/aDPUJNwRJddkQrm2AtNviSi4PfCOvRnV+ODOLkRF9RkcS2O9
 u5k3ZAcYKdtmuQ8wEtNc3GZeAxCqkndGk7rC4uNzRIa9DOYYQMjqkNnwcDc/u/31Hu3q1wFYBxo
 ImHGZmo1D17utpZ7Z9lRuDMUbW2tTW/mHqwIKUi8O5dX4I5M3TU4gonVFuxcKUJt7pB2BJlNXij
 +DOEjHVD531x7o7M55yCHXtN17w42DkE55wEyAsDtwOir62b9yk3K+AUquUEyqkNtkynVCWJDhh
 w5QYIJYmXxBsA8Yfes4mUsPW54vdfc1uZizDqpNDullUBdLnutN8MaTgIji12GedY/WHbxyQazr
 BCzMoXylyDrwi59bDZEOMTHXHLHs095z1yVzhUpjcsZAwVRiQX29/Jop+3UL4HezK+H+pBVGW7h
 VmNA99Y+PTYK8i+ghm2K5Pzc62j2DI/bkSfMYMXrfrTk4E3hYfKacmqLcPBT6P1XkoovcAf7FxD
 4KP/KS5bcS91sgm3EJ+wS5R0ser14gyJzb1EYoAgM6PEvyC7wtRpi4pZDFLTq01PkF0OF8sOe47
 4r1gmzkgoleZjVw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051646_050083_AC89F355 
X-CRM114-Status: GOOD (  24.63  )
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
Changes in v10:

- Fix gramatics in documentation
- Move {__,}i2c_adapter_set_clk_freq() to i2c-mux.c
- Make set_clk_freq() return actual frequency
- Reimplement idle_state (from earlier version)
- Implement example on idle_state for ltc4306
- Link to v9: https://lore.kernel.org/r/20260324-i2c-mux-v9-0-5292b0608243@gmail.com

Changes in v9:
- Fix stray blank line
- Link to v8: https://lore.kernel.org/r/20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com

Changes in v8:
- Fix gramatics and change %d to %u were appropriate
- Link to v7: https://lore.kernel.org/r/20260223-i2c-mux-v7-0-ec75b214718a@gmail.com

Changes in v7:
- Remove code for finding first mux-locked ancestor
- Introduce a unlocked (i2c_adapter_set_clk_freq) and unlocked
  (__i2c_adapter_set_clk_freq) variant
- Let the locking be handled in __i2c_adapter_set_clk_freq
- Use I2C_MAX_STANDARD_MODE_FREQ instead of magic numbers where
  appropriate 
- Link to v6: https://lore.kernel.org/r/20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com

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

To: Andi Shyti <andi.shyti@kernel.org>
To: Peter Rosin <peda@lysator.liu.se>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Marcus Folkesson (7):
      i2c: core: add callback to change bus frequency
      i2c: mux: add idle_state property to i2c_mux_core
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      i2c: mux: ltc4306: set correct idle_state in i2c_mux_core
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst  | 178 ++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c    |  39 +++++---
 drivers/i2c/i2c-mux.c               | 162 +++++++++++++++++++++++++++++---
 drivers/i2c/muxes/i2c-mux-ltc4306.c |   3 +
 include/linux/i2c-mux.h             |  26 ++++++
 include/linux/i2c.h                 |   5 +
 6 files changed, 389 insertions(+), 24 deletions(-)
---
base-commit: 50938ff6aa9a0e5d5a3e647f976286f4c5bd1b06
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
--  
Marcus Folkesson <marcus.folkesson@gmail.com>


