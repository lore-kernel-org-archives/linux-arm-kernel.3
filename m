Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7351BC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=alzKa1fHBXJDMeEN+D5I/NY22/iphGwMNqGxpCcq0iI=; b=1puQTjkZvObY/H
	Du2NyiloMixUp8raFbgjk+eegoeFTV4vlr49lkP1udkmq1uk/5haIkj5Ho+EF6rn3yQqHDJqwohHY
	bkGZgbQEDJWMacaSz/OZ2nI9XgKtLKJEFi8jQiusPcDms5LbM7MkypVTBqDDyiM8Fe9blHpNVrTuI
	Ircdbl2Bw93kSkPpC7vptV04S/Qa9Omqyh1LHwTfvjs69gUQ+jTdU1iZre8JX/UrJmO91LVlfMrIr
	VVsh7dYzBfbpL3DSyLPipjWia4FOGtTza6KznLYk6N/FQx4Id40sXo57RvRLc2tDJ4qJbms7G7v/p
	3jfRW5074CcZDDcFu/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkR6-00000002bNn-1WZt;
	Fri, 17 Jul 2026 15:25:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkR3-00000002bMv-1fmZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:25:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47362928f65so7187601f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784301907; x=1784906707; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=alzKa1fHBXJDMeEN+D5I/NY22/iphGwMNqGxpCcq0iI=;
        b=LsFYh7t9onypmYC8Va4iNVkHEZu6ckYK872buZz9zA3VqQXLEjKBWiy7AOrjXrucc7
         l7qvWYIAn/qquAjxdBjmG4oRXDON2RBXkze4uJ5ShHdw8f/WxZywaImtClWeSn5wWJ3x
         SCa88ypHHb/+snmKLU+Ogr5NpQcg7jJw3g90mURBMDjTAO8zYXxGnsgQs7l0q/v1pJjC
         GlEybkUk9/5U3UsW/cusu4mzZN7V+6SR8GO+GjbmfvjVK1Hiz2MkHRVfpnMPK/Kv16U8
         tZoEHExZRuOjNOZutkXgqxp18/z8LctnLOPNf8EfOdHJiSrmRYUvnRqAuCEZ+T7K1fpZ
         LRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301907; x=1784906707;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=alzKa1fHBXJDMeEN+D5I/NY22/iphGwMNqGxpCcq0iI=;
        b=Jxk1vDWa1sNTLceZn+f9vrNc7jtKhDP4/8XWDhTwKq5xGvnsA/WWv/FnTEoTCKXjr/
         RSeIgwAFFdu0iuWrjhdUN0vRhoo6/eqL4HN3J5HG8Qm39nC+vqGAT3TzAleGQEB7wLjU
         fAz0gOJGDFWUwO+Wh5eSxEpQBUkfXBJkv3BusBPa73vaneqpUDi+dI/TLomu+loZf+yf
         C1IjLrlYbfLYyYh+A/NMgBUVJRAPAh5uXSi+6iHszbV/ldjeaER5fdixHgc7Wtm69upe
         VzR1wtPgxPayL7zh9N1J79cW4u656Vuszj4yFyVBexChuYKVjr1iQ6ozPxpl+PW/IvsT
         IOiw==
X-Forwarded-Encrypted: i=1; AHgh+RpyD8eaVB2pXfflKaw6QhwKvNLMFkn+dPf7nun+xHHxR1y1bPebkX36cs3peK32pJnwlwIMrxLo7mnmpNiNOjRX@lists.infradead.org
X-Gm-Message-State: AOJu0YwBUW5L1QA4rE00ujJ/Gbou9hS+vPym6VixeK0Ou36yr65D1rgh
	F213t6I8uK55TNZeAa7wGNPoVEfNMmfKY2+pp/iG4l5PIXCfMXU860bRLiv3KVNECoXPYmFlPDa
	dLoWR
X-Gm-Gg: AfdE7cmjugKWlh6ZY2WbIfQNtY9f3MBNQXw4hynVGWDf31NoiwPpIdiWTJ566fvTwLd
	J8Ixdr7UFgnzztC39FYLOb8jOyWuwFJNq+gs8bI8nO7TPuaUK6erjpnmRHNqyMrxmOm51oyBOI3
	LQo2Sp+pgHVqvWlU49pVD2m5Ycb33gPBCpcnAnmtx1fRUx9o8bqBXdhO4da4K9UflhBNgvk3BM7
	C+WlgFM+79uCP4nHKSw+Z5rk7TeR6iJ7k2RNFsk7lraMC6kch+VqsKle+zITqmszxrCLTl1hnIG
	Wu8QeP7vVuShQCi4uIvmY9GnW0YF9IiJOAPXCMsp3SRC44QSr3aBYDXZ2WxjN1NOaDw/KWa6O2q
	RXrj/azXgY6vzLmTS0KHM5UU1s61lhmidUF88mBc4z2fAa8Xl7Lo+i4b7//Cb/8VFMcNIPeCkjV
	k0msrtw338wEg=
X-Received: by 2002:a05:600c:6d82:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-4954a405ea3mr27250835e9.19.1784301906790;
        Fri, 17 Jul 2026 08:25:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495499a5847sm40546205e9.2.2026.07.17.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:25:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v5 0/4] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Fri, 17 Jul 2026 17:24:50 +0200
Message-Id: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJJWmoC/23O0Q6CIBTG8VdpXEeDcxCsq96jdSFyTLbSBo7ln
 O8eeqNrXX5n/P5jYpGCp8guh4kFSj76vsujOB5Y3Vbdg7h3eTMQUEgAzSuDyMNQ87qQ2rhGKtL
 E8vN3oMZ/1tTtnnfr49CHcS0nWK5LRAsN5y2SgAturAEpwZSqKa+2Gp/eBjrV/YstnYSbNQJ2F
 rMlC0Up0ChH+o9Ve7v7fFLZNojCQOksOvyx8zx/AdHYTdkbAQAA
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=77KlE3q83JWLmFeSQ4+fhX01mwhYxjPLqk/uMP3kvC8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWklL2FEOkdoyGqNmeA3invLT2BibU6BrGaDsj
 IJbFrhMdIqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalpJSwAKCRDm/A8cN/La
 hd1TEACiHeYWv/HEYx9MfigJ7YxKzSgXcjza05w9VF5WDm5yJWZBzoekG9qfib/WNPfCkF9m41I
 S8ZqqDE+wIwhlCjO4rXzx8EAhublnjsUtoL6Sg0YlaQfVdevS88y+5/3X3pwyzihGKhIR0pPeVL
 dcwaYPBAfoiCf3DU/JQqFkvRHVeyKJoYDktNMX80zTHuSHidRjfHyR4RWDLVuJIq+u3UHH6vbKJ
 Qur0yvWaBgn9+UA//joL6JlGA0fahfTy8e6BjyRN+QPKcw9j3/cv7wzIqu5u35li6F19UMVrw5h
 ar1eVDzYP+KFepeuO7HrltoGL6/eN8zOC6rpmzI7w3QNe6IjLR8kCJOTeypvRYSLnzViiGvzjHu
 bkubJ8iwbVR9YeKj2WDC+kVNscRPt5mzXBUip55JjackPQJWakxWHQxgssHiVRSBylNcafSHAj4
 WkHYM/UVxZdKVsL6Oyfy06i48D6f07slbRRjm6oS5dvXSRxY3HAYqhcFxrEi2a+q4PcsHEal3r9
 8uq9bWnSabXZPf+kKINrDvZRveEzK4Hlk0X9mXsV5sCyU0X9nRvaJfpkPFaYb8U7SjPUGo0Myyn
 EZzCq0k0xb92LhYe+1sujFf4r1bbK77X8vVGNK1X+VTVTLftrHD+Y+Ux+M/XUJ25XNZWvaZZQ25
 CvP50Dn3wQCho5Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_082509_477269_7249AC9F 
X-CRM114-Status: GOOD (  12.93  )
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

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v5:
- Droped already applied changes
- Fix determine rate mux helper calculation
- Changed clock split commit description
- Added a macro for the clock number without gates
- Link to v4: https://patch.msgid.link/20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com

Changes in v4:
- Remove unneeded export of mux prediv helpers
- Link to v3: https://patch.msgid.link/20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com

Changes in v3:
- Disallow clock-output-names DT property for h616/r329 chips
- Fix ccu probe helper to properly unregister clocks on error
- Implement .determine_rate for ccu divider RO ops
- Drop unused DCXO_CTRL_REG_EN define
- Link to v2: https://patch.msgid.link/20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (4):
      clk: sunxi-ng: mux: fix determine helper rate propagation
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 89 ++++++++++++++++++++++++++++++++----
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 +-
 drivers/clk/sunxi-ng/ccu_div.c       | 30 +++++++++++-
 drivers/clk/sunxi-ng/ccu_div.h       |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c       | 58 ++++++++++++-----------
 drivers/clk/sunxi-ng/ccu_mux.h       |  4 ++
 6 files changed, 144 insertions(+), 41 deletions(-)
---
base-commit: c52b5090bf1e3b88745f8a81f264f34100ecde42
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


