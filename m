Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A6EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9XTlkPv0IBw1LQNFKJofErU6zJZ+bp+//Zwh3h0I84U=; b=Ta0zGPK09L9N/Z
	ktNYdbBrXcHSs2kiuUrRWAG4NO1oakHAEUr7EDeJeIcGj8d51m/p5KO/rjsqnRxmtKD+wyLIeM4LZ
	L70TvXI0xzRjgY2S9/MdjdUw0V42F8E92V8Y+EymrORV6crVoSSL1jC/bt+VyKn0DYs3CM8aqzllY
	0u9+xK2GWUG86IzMja8xu5JlEk09bu1iCXYoitoTkfF8tB880Vt70TyOfvUy/swFaZA5z021qIJqL
	kjH2rwyPG65cA1nYIxOnzJZ2MjhvkcTAujbe6Ct5E5gXyleeU6OVw1dSFm3/6nSI6RC8nkwWq/1EO
	wb9BWXbe48dadwmJLUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlHN-00000005GgO-3I7I;
	Fri, 01 Aug 2025 08:38:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhl2o-00000005Eqy-0VG3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:23:15 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b1fd59851baso899815a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754036593; x=1754641393; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XTlkPv0IBw1LQNFKJofErU6zJZ+bp+//Zwh3h0I84U=;
        b=gVjgE44B3MknLsXQ7EALbQxeUT8/n+z6XTjOzljMFO1o5L0ttztuisPpceU15msZ6t
         /rZRzitjzwVJL9pvd1+FS+Q0zsqhaMrTpRR6UYd61VoNOIwjpj3WwWo3rVT0xCtl3scZ
         UnmqSL6T2r3c06fgA7YLhKfFIDdXJ4RIKCnzxnPCL1UFnOXQbaZWWWt/0LLs6aVjnHVB
         0nz8ulO7Ntx6EZq2cDzwnxJV2Ijf8mOUBPpdofTdY79R1KLxPa6sJBZfy+8+Ij9FcqpQ
         Iku7g2/QTJEh62M8BzGZDWLhgMU9FEKa9s1BjcmaGTRRIdcfMkJAXdlmI478p5y9xuar
         Ld9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036593; x=1754641393;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XTlkPv0IBw1LQNFKJofErU6zJZ+bp+//Zwh3h0I84U=;
        b=ahHDAUmVdxMvF8ecAx6tpjxpL0uWm0GkBi7RfJFMk/kcBqYZEjq6S2EHR3RqJXTAu4
         IN9UMbPQlsczbDjWZ5qpiBtxQVgJVRT8tvLTYJgQ0HHKRKD+ZUdPUV3VD5/NLgSL7Twv
         U9Q3YvmpiP0Cyf2xy5CPXmSQDx8/eMc7+BmRuxN5+Fqotmoaz+M/gDy7Confynfzp0Mk
         LQfc6Fn5QMBaxRR6Wp3o5XucbbE6QVAuE4A0yKc91+AEA+nop0PoGfwQywQKBepcpm6a
         6MV4gwO+5K0L80/baP1mABAKW4bp2WyVV9HqXY7jUFWM6fLnnuf4UxbvnvGe5XX0ZHAy
         lLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8LqKARTwBNq/R4hTzhIdxV5AaH0Qzx9w3TNRB8nEzredoMXf3sqsMdE4n2KPD+HEa9vn1IGnwDJkfKH+7dWZK@lists.infradead.org
X-Gm-Message-State: AOJu0YzncnDYBUdT14WMdk7WW7rhGp+gRm2Z+me2YMsGlIc6AHZaGz9P
	KXwlk7ANuH0irLyEGIaC9nM4FZHmlSDSL5YbKzxhpn+KmhJ8cFTFv5qh
X-Gm-Gg: ASbGncukIk4jzUvxMxWVCqrm76afhK5Z90BBM5uRz+Cs9asp1V+XCkCNZPpjHgqoMx2
	aq7XwL8WXIZsGgJtNtnWLuLpbH3TLkt6hqJDfvvjD01GBs5INatGGG2n+Lm16XbTpuzBXvt8ayY
	mgzdG5oNR1+kwETsQNxzjGIU6kxlZqMMWaU8fUNHH5z1NVeuvBz4bR0zHxiZqwbMoOMzI6wvlsd
	3yifVizvR/uk+eYfQVJ8BCV69VF2q+FxxZL6SRYPYs2NI9jvJ/Kfwu9PTqS+blX6q7jy6pmMjRv
	bj9DO+WXQPEDvYAUi71C27EM8L2a0/wk2AQewxeVRWHcwpnvn1hfBymDnx/hEYrpZIugiPe7AYj
	VCqZ06o2EXHd2dsLx4P4OjzisPFvC/aWRt+cLI8cBqExHFeu1M27I5I3tm8gUXf35QXbPkXr8Wn
	exMw==
X-Google-Smtp-Source: AGHT+IGvj0g2SL000bEpFWCRgDs2CE3+7rERXhrbik2vKVQje+4iGkCwmUe9S42Dfhh7fy3ca7XvNQ==
X-Received: by 2002:a17:90b:1c06:b0:31e:3f7f:d4b1 with SMTP id 98e67ed59e1d1-320fbd13993mr2917452a91.24.1754036592766;
        Fri, 01 Aug 2025 01:23:12 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a850417sm3992725a91.35.2025.08.01.01.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:23:12 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v10 0/3] ARM: dts: Add support for Meta Clemente BMC
Date: Fri, 01 Aug 2025 16:22:47 +0800
Message-Id: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFd5jGgC/5XSzWrDMAwH8FcpOc/Dn3K8095j7GDL0mpYkpJko
 aP03ef2ssAySI8S5vcXli7NRGOhqXk5XJqRljKVoa+Fkk+HBo+x/yBRcm00WmonQbUi5iymr9N
 pGGfBwyg6mqPAT+qon0mkDkWwKloICZ02TXVOI3E530Pe3mt9LNM8jN/3zEXduo/oixJSkMMIE
 IisT69cSn17xqHvn3HomlvGoleuVntcXV1ARyxdUDbgtmvWrtnjmuqi1oYZ2QLytmvXrt/j2pt
 LnlkbCxLttusedl11pWkpAytM4Z954df1ctfeoLqeDTmfsjQGtl2/chXscX11s0vJWxfQxbjtt
 mt31z+01dXMEDkZSJK23bBy991DqG7yQD6TzYDtX/d6vf4AdUIfe5kDAAA=
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754036588; l=3087;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=oFW8Pcf+/M0flUeJ4t5z0g/SaacnwFP05q4Nt+4Z9wg=;
 b=aEkmJbS4z4oVHMRyPJVF+2OC67JWDL1S9Gy1HYPiBX98lLoJ4Tit/AnCyZMx10XwXEcHdsqdy
 kAurb9DK/J1BoDXviwLgykl1ayq8RLQQzkQVo2kyyjk5eYPsBgFQC1W
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_012314_167535_498DCEB3 
X-CRM114-Status: GOOD (  14.53  )
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

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v10:
- Reordered NCSI pinctrl patch before board DTS.
- Dropped MAX1363 ADC nodes from the devicetree.
- Link to v9: https://lore.kernel.org/r/20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com

Changes in v9:
- Fix comment alignment for // PDB TEMP SENSOR.
- Drop non-standard aspeed,enable-byte property from i2c11 node.
- Move NCSI3 and NCSI4 pinctrl nodes into a separate patch as requested.
- Link to v8: https://lore.kernel.org/r/20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com

Changes in v8:
- Relocate IOBx_NICx_TEMP TMP421 sensors
- Enable byte mode for i2c11
- Link to v7: https://lore.kernel.org/r/20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com

Changes in v7:
- Relocate CBC FRU EEPROMs from i2c13 to i2c12.
- Link to v6: https://lore.kernel.org/r/20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com

Changes in v6:
- Correct Author email to match Signed-off-by email address.
- Link to v5: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com

Changes in v5:
- Remove accidentally pasted texts.
- Link to v4: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com

Changes in v4:
- Move properties of nodes defined in the same file from label ref back to where they belong.
- Move pinctrl default configs for ncsi3 and ncsi4 to aspeed-g6-pinctrl.dtsi.
- Add properties to i2c10 and i2c15 to enable MCTP.
- Link to v3: https://lore.kernel.org/r/20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com

Changes in v3:
- Modify leakage sensor to reflect current design.
- Link to v2: https://lore.kernel.org/r/20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com

Changes in v2:
- Fix patch 1/2 subject line to match dt-bindings convention.
- Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
- Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com

---
Leo Wang (3):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add NCSI3 and NCSI4 pinctrl nodes
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1250 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   10 +
 4 files changed, 1262 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


