Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823DAEA4FC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pe8kS/HsQYwBP5zgL7z8pBoY1N27zjF7IHjDKICG/rE=; b=A/sb8CDmiwk6br
	58BkWMGPuYTYx0f5ccZl/PG6jOaB5e3m2AwgwFLncHOHzobVVhouVG2iw2qq3v2VoDLitCq0MrRhg
	85UwmooAaR+YKLjY/Z0UZ+BA72JwG18vDRG+Y41aMJ8+tCLref3g+sf6YJ1DwdTG0fgq1CWdOUA+U
	hsLtThP4TH0xpPlMsAGucL9dSLM6hQg0j5ZlJBXW6ySCuMwBlclcj58rHrf7TLqyH3wDbXkCB6g6w
	H+AEvVS/ts2KVskxj8RcaHQlW7RM1XpTouFzhBjAewguFF++1DMmAr9EmAmVFz8ot03okvN9LAWQG
	d8xB9VsDX3a7qm+stnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0R-00000000TU5-40Ob;
	Mon, 23 Feb 2026 14:33:51 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0P-00000000TT3-2WX0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:33:50 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-386714da2a2so34662531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857227; x=1772462027; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pe8kS/HsQYwBP5zgL7z8pBoY1N27zjF7IHjDKICG/rE=;
        b=CqNuTGqDXYkZ/pg5X/q7jsjtPaYE1iv8qpfk+X52wyJM6YMUYWl7tU8ac+tY2SbhFI
         lYfCERhJwBSvXpuimRJ5eE2U49n5WCH3SFqN0l3QHP6NuhqicgPkbF8eWBKvY4BPAHOo
         thbtE1gkFbSYMUJdl9QeRbuzoQ1+vTB/sBAskUB3BJlpqkFIuD7ndYnd1eed384qZdHj
         4Q+FsAOgZkJRPOi1fzBEkb2TzTWYH+5M6d0wJ/+qEl39R4qR/D4YdCv72BWjtcOr6+sn
         M/3FSWFKZQqpLywv1Fvf9fkDO987U8xKNiRvWwF80ok9EE6czmGLHUHVK6WhykCKdR8s
         y7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857227; x=1772462027;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe8kS/HsQYwBP5zgL7z8pBoY1N27zjF7IHjDKICG/rE=;
        b=OP66xyiMpbN8og7aOrr7HAgaTpYFixREXXOPXSfVaevZe9QF4xwGsTjWboVeJEuvIu
         nK8/6Qd0NMtvBN266WSUrYwtBxUCM5JzIxddzzMMoG3n8HCf4iBYXlyIeNnDVkw4GtD5
         skzx3qn1agaF9NJEuBGTgFUU7tE6yFpTaQhBlciv39tebMJUa99JRPPV5qNm17rV0Y1F
         TBOM38kxQJ6AmWHfB+mryjEQ8sgxZWpKa6DgJYSBsLB2kd/kPvYuGSvrj30WhyshPuAk
         IH2k2+f3yfeEsrl3wK2zaxzGugOuqKy+hP/79sC4cCUmK6iU75/hepunnPAVhWQGO20L
         REjA==
X-Forwarded-Encrypted: i=1; AJvYcCXoDQDWq6GCghAt5cayXC5kdmPadaM/NgGaoMygp959Jc7iNHcMT1JxWFNRIccaoSlKLb2Hd6Gu59GVkrNfcmmX@lists.infradead.org
X-Gm-Message-State: AOJu0YxvEMLgZ1X61mW5mzEUyWzSDK/ORunPjRFFTzabnJ8akdfC71Ew
	2CjnhzXsHvTdHE0D4yt+ose/Gqa0h+7PIOJP/lKhCbj21sNpM/iwCzHl
X-Gm-Gg: AZuq6aICACZbX52Shds1b0LNcUWPq4buXjgSl4NcenvbYa5UnoNfJ8Mck9LrXBCTbUb
	xJY39IWGKe1qVa0JXF8JTYI+xzcZZVZlZ6smpVnKPGiUeAUo0vP9cSuZ6NpGwEgfx8sdoLABwER
	kbgWqepk9roZpcm7YtJF7RL/PAzVs+KO6BD7HK/qbMysdabTCvmvjm4STC/Ns4p5RG5s6GFCW9i
	OGS2dYLLvp2SDFzl/wbytUpT4zukUmEOKwdJVgUyaFa/D8ZYNHyfbf43rji8W5Y87uD87yxLy8m
	MvkSaJjDgWAVBz0+gjPtCqxrPQl2VjQ5ZakJ+Nck30RP2ZkalUcH39CCQPi8ZwK8z1fMOsvIwYf
	lh+A+puZ3/Sd28UF7gWi7NRUFj6Lg2RYGwEgW+N82aSUM7VuJA/tHGamQ1ss2FtZeI3BMo7F3C3
	PTODQ4zRGFRV9Tne9FjQHh2NWZ15iCkmPqoa4gQaYMT9G9E9DrNDM4ufBbxwkqx4pRmpzx
X-Received: by 2002:a05:6512:130b:b0:5a0:f5b0:401 with SMTP id 2adb3069b0e04-5a0f5b00a51mr671916e87.27.1771857226970;
        Mon, 23 Feb 2026 06:33:46 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb16344sm1631709e87.37.2026.02.23.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:46 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v7 0/5] I2C Mux per channel bus speed
Date: Mon, 23 Feb 2026 15:33:49 +0100
Message-Id: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQTW7DIBAF4KtErEs1DD+GrnqPqgszjBOkOo7sF
 qWKfPfiqI3dZPkQ3+OJi5h4zDyJl91FjFzylIdjDc3TTtChPe5Z5lSzQEALQWmZkWT/dZYRwOn
 E2LJJot4+jdzl87Xp7b3mQ54+h/H7WlzUcvrbgXjrKEqCRE/BtE5B0PC679v88UxDL5aOgjenA
 DYOq4sueOsMpWDdvdMbh7A6XV0A35Klrg7R9878OQcK/epMdYnZBGJsHD3stKvDzR8VW10XkWI
 XQhPiw3tu69zq3LIzMnqmLjX8z83z/AObzOzptgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4457;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=mCCRKMHtlBgmqWNXcSQwKAWkgQ/vQ+w7dOXdt7vYJB4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpnGVPQ0nZwdk3uxE+uw/9EflWtmk7bBklAPLD3
 2yZUWYqF2uJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZxlTwAKCRCIgE5vWV1S
 MkDxD/9ochrRo0neboyepOM6GpwWUs/3INBmv+86oHhHBoyycSsEOmJHQjpHvkPyKeiJc5P6OZb
 76WLe20FxmuQJ37JoIYfHcnOxoltRG7IyVpx2BRnUtwYP9kXJVzgduQQk5nXyhbMJA7N4/Kpi4F
 wPyhFWmEimO4g4cvrscjnGScievyf3+7lcCXMDOTM/TUHMvSy1y2wjjHi3U5hgkWux4+Ts/uL6F
 koMnjJMVjKzr/AFKQiRwysFFJ9oeUIzsCiBhWjbfgj8oIKlzR5+8/CBAMPLQaNPEni17ARunbXO
 RpRzmq7xT9K7JVWX89bof4ruCS89j/PlzvMjgSZV+6/HdeZjs1r8oD73Mt1Tni7eTjX8tstr6om
 m2uXlu+XU0jRzUbk9SKa4lzvz1TmPmUHuCcMoQG1ZfCejzH6xN+6NXHXSCWYuRCyrIvrM/E7Otr
 KRnuuEjG30uDBwhURdVyeXerpR/sT0tzXeV/GuaYZszAcPAvdEP2msfnYYS8hU3pOI2YrhoLdRY
 CgeM1NWQLB9Bxixkpbh9ZRIZsuqJgD30PBqwaWqgt6hedZ1HgRFN5ZAaP5o6VqaAKxtP6JgTxpj
 9RLUt5o0SFCpCUVIpKyxhHMoVeT66eFcQYi7GDFpXoY4JAaIm/K86t3QtQSqaG+i4aM3Na5u7JC
 P5chRZjJ3Xn1edw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_063349_696988_CAED194F 
X-CRM114-Status: GOOD (  22.50  )
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

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 178 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  42 ++++++---
 drivers/i2c/i2c-mux.c              | 107 +++++++++++++++++++---
 include/linux/i2c.h                |  34 +++++++
 4 files changed, 338 insertions(+), 23 deletions(-)
---
base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


