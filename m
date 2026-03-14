Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D42106FD81
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PYxaEEn7u3csmiCG92Q3G3wjBNBi59o3OR0VoKtdW3k=; b=LEsi2hvBrQlYB8
	eXAkqhu8G0Rd7k4G5YvONBBdIHE8JiRRzV3E1oDkzC08oI+hx3bB5bSp+BE9SnTHvORsbjDAeHx6S
	LGShkwKn4c5Pah6yFnGzOOg+gbPLNepmGVYx2JPb0XGc90EhhOuklZArzXHWFZKzBgiyzcQyU7vbc
	qtndX0raOxyTCKDMDeqUQe7aGpJuCMPhv9MOmNIsjzQw5ds2HsPfTF8zwye0uE9CWgHeS5OyYvfRu
	C3aLG9Vk6j5ASm0FjXtCU9TvGXsuNHuW+uQ+0OxE9jMG6vaZuZNYMB0wpwfk32x99yEd9qsrIdV0t
	ujA81lmkMtoQOC7krDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCY-00000001fjk-0Mti;
	Sat, 14 Mar 2026 09:22:30 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCW-00000001fiz-0KkH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:22:29 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-38a43f1f978so27240101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480145; x=1774084945; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYxaEEn7u3csmiCG92Q3G3wjBNBi59o3OR0VoKtdW3k=;
        b=WkcCeXlbmOonUywHYjMAawBZ89XXNdoE/hcH5eHm5kIrlzJ9FD1ApZGb4+T6fNzEWB
         ynxuj/o7T5ZqfCybB2EFGiXAye+yCFg0Rk8mCS707kI33SDqpckQY72bBDcW6hQIJBdx
         1Vh/O78rNmo3qPBsBKDJWti+bDQ+0JZoCfo4EH+UZOr44ytRpGggPX3kq7UqHcPyXefF
         bSXiDXGJLQrHqE+2D9mc+0lKOG9IEVrgCLGb0z56aqCwNMWX7hIBVPOcwXXCjvK7gO+M
         QYONjqepcXfpjl10YAiC3RMXUQmkL2xzP9RPMAMQsX5iqWg1n4vsC5w6TqCeU6Qbv5ov
         f8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480145; x=1774084945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYxaEEn7u3csmiCG92Q3G3wjBNBi59o3OR0VoKtdW3k=;
        b=n8Enyt5EhAV6QT19Kwl+zuS2YFTtqMxNDs9zmYPbsfGGuto4zw8cx6MApJSoHU8OQw
         t1LwnTNH/07cGPqbc9IvHK+ZhQOCuILMKbmHaWT+WLN6q7DLYlHO8kvB82bZ30hBFuuD
         XGgQRulXBgKzmYQCiuLX7GWew+Rs79Ze91roKORbuniJWN6RIuF9iqbWUVki3DgRpHQQ
         WEAzJTFiHB5OjheQNlREfTXU/QvGiG21tKqjepKADtdhnF61K7gFXyf5gHZymKaV+1n7
         O6VhCyXcxDUMSWfT88FEMOz4xY9ZNE2CNK7Z2ZktR7o3QR7ONUYqyAOwDYBRch5dIaXt
         maQA==
X-Forwarded-Encrypted: i=1; AJvYcCV3uic1psKFBRGGn+sTDuYDciQsAExjYuBeTOAMkWVZ4AvI+zYbC7OJPrFogOO3XGzc+LOdJ+pjxonUXusF8c7F@lists.infradead.org
X-Gm-Message-State: AOJu0YyXACOB/hLNzxqkrq0iL3Twi/nGAGywOqneV/8Ph4AX//Keb51K
	m8WkovLtc857+UA7jIwJpxfXNujYFP95ePv9TOt7fitxYgzK89DCbLeL
X-Gm-Gg: ATEYQzxJPzHwH4VBxdmIsKs7RwuQAJwb5uAWyzWm4yLPTH/7tYsBB2cE27USGv248q2
	0az7KCeuGJUPXf0SjGKDFyAXDAGqFWEyF9YVYAs79Yn49RApi4yK5ZaMkfuYXB4LDLS3e+mRRHB
	6o+TVvcyRGbVA+IO4bN1LLTQH7twPc/9ujY1dbQNcjvA7A8iVDKLLaxN1O6c+g133sZmotAy/E2
	8O3yUmeO1QInnCb5Eq49p3ZpG1NM3r0h/PAnkR61Yu6dN8mvmPl8aDw9DL6o/ynjDtLLAwXNwCn
	Tleg7pj9B9TjayaY5epbiArLJzhwGeFdpwmJlyt4kL9iZF9Ml70aO1+2l7oclQJDK+qGuQVHZ+Z
	MvAVQoV02N666UlA4ibOT1sjfW6NfZvfAzvdoTzMpKwJBX3vKVUwYwJYiXrGrXKHeHQC9xHt2lr
	wWk6crGikdqnzM38qqghJHU4fVudzGGo6vPJz1Ywz+RYs2w+w6U4ZFg49J49ww8ND30PQ7
X-Received: by 2002:a2e:bc20:0:b0:38a:75aa:8961 with SMTP id 38308e7fff4ca-38a897bd81bmr21045201fa.36.1773480144972;
        Sat, 14 Mar 2026 02:22:24 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm18454261fa.22.2026.03.14.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:22:24 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v8 0/5] I2C Mux per channel bus speed
Date: Sat, 14 Mar 2026 10:22:39 +0100
Message-Id: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQy07DMBAF0F+pvMZoPH6z4j8QCz8mrSXSoASio
 ir/jlNBYzXLsXzuXM2VTTQWmtjL4cpGmstUhnMd3NOBpVM4H4mXXGeGgBq8kLxg4v33hUcAIzN
 hIJVZ/f05Ulcut6S39zqfyvQ1jD+34Fmsr38ZiPeMWXDg6JJXwQjwEl6PfSgfz2no2Zox490Jg
 MZhddF4p41K2Wvz6GTjEDYnq/PgQtKpq0Xko1P/zoBAtzlVXSZSPhFak3Y99eawudGsq+sipth
 5b33c7TOtM5sza89I6Ch12dLO2cZhs89WR8nqiEJZ4ULrlmX5BXk3Cv7uAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4616;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=VPBWgcC4wpA2GlhOA6ITAbA8Il+EFF0hmoMjPfKTzjk=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBptSjkdlAQKVunlBPJPIUUneGpkmW32RJ4mD/Vh
 REJo0zbcZiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCabUo5AAKCRCIgE5vWV1S
 MoL2D/kBqQZOMmhKGZXBi9lk0qCzu9bqkl2tOAjdtxwxRfYMiZtvRefw7nBFYwsOZv6EcbieFZ1
 M+L25DhMGgxPFctF+W9MCPKahikbh3sGiI65RHA8xPEhe7PfK6pfLhQhB4pPjXYwwvXjyZud18V
 guxWZ4iEtREk3hEQcdDnMDbqGCUCNkFPiqMl3yiZ3POTkSAY+M2lcJ55S5MRxjD76OB93HyMuKv
 zzH41/H+x1H1ZmNc59RtM5XRcZAYiP1KmUhLMX7tJf7y4P+CuQ9elFcqqDfPhWMRyJUpTNi3n/B
 A+HquZUvmaaNYLIvSD0fCyXnRDTcKxj7/cTtSSNzJGlEeSWReLvgBD9TDJbvHdXTT8EbrehaRhF
 T2roMUTcddIR6TSkfCqchrTkJOk1dsIbgjJkRtR4fwcqRjmgWMuBpX5CCzFsH+oUtzWw5T5DAxb
 vOgJMzb4WDIMzAZFDYfg8gB5OqtZCxVHMFhqhcIy57S2onmCYg7bdV/Tz3iY8MeHZavCQk9WtBD
 zkfmUuRFWDCsEhz7E+wMKw6oUMkIppwlvW3LVsoq7Lr8Kp0F6MAO835j3Jh7gOyVDXZDrtgZc8J
 j+0wHpWcKClbEROM5OjFLh0egLZ5k/JSWfNclpcKtscc4q5/Tmt8lUF0cq5x4bdp9efd1GC8FYy
 K0LvYB2GXPSLVfQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_022228_189955_0A638E3B 
X-CRM114-Status: GOOD (  22.72  )
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

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 178 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  44 ++++++---
 drivers/i2c/i2c-mux.c              | 107 +++++++++++++++++++---
 include/linux/i2c.h                |  35 ++++++++
 4 files changed, 340 insertions(+), 24 deletions(-)
---
base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


