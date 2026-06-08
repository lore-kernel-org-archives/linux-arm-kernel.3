Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21704CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=38SrOSOGK3sCwLNpHejTdRoa1jMmte3Iy/3zoqwAvic=; b=Jbvv1YqUO/P0L9
	5syM4ucmi2FLRH/mQM7+FsfADnZ378Ho3syhnTs4nXKYQ3Q83iminJ2ZED9AhD0020mDPRNig5J8V
	F0q8i3z+4sdgXJW+pntzlG6mnQ359rCl1BxyM6EvqsnqOFzU3ST4dD9yHU4r9tvGn835SEBUUiP6F
	J33lGqafrG7p3LP9K7v1Fo7lPsHxtuDsN2dK0TnwcX8f1ghcjJPMoHNqfIPrZnEi6wMlcA4H60klH
	BjNogtNSIIb5ZpYfMWqIXgMsp2slTiwQzvcwdJhAPHpfNTIBcgaCkmvyma6BdBV+TcYWhQxB8vcA/
	aRMyf3b5jXLFwpaiE16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPup-00000002jfU-3G37;
	Mon, 08 Jun 2026 02:40:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPum-00000002jeg-1g5J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:40:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8424b6792efso1191038b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780886435; x=1781491235; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38SrOSOGK3sCwLNpHejTdRoa1jMmte3Iy/3zoqwAvic=;
        b=WHEUobIaa3kCMlkol09QGZhlCNW6uzNIP2lG9ZFp0e1asi5u/D1H4pEu+oeFVnM6hC
         o8zG8BP1sGCI/J1oJIHTXz2q1VVTNGu3Jb4Qem0ruTfVk4lhNgf17at7n831sw56Xuur
         jfZ6rFiufLjW/Bn5QxyIvLGBh+yd0ds5PTKB3QZClMqHyWEpGTqFnExo9/wK1+qopv2C
         zGufVX4IySl7GMAlAYk1I39kaiUWetoSpgMoZDdkyhX8WWcBJrlp5iErqORZLP54zygN
         n/emkmA75C3ZK7FXn9TxPWf6YBl3EnG3ix9iOlNw/kk2dvoC8ZcKc+MfVmp+iH3yY/kS
         PVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780886435; x=1781491235;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38SrOSOGK3sCwLNpHejTdRoa1jMmte3Iy/3zoqwAvic=;
        b=GQmTyRsesND4nf6G6ECaqOyMAE4idRzhiEiBABLF5F6+GOWJSzAaTKYSq0+byX+lpG
         6TTuX1HuUnWRcCffHHhL9r4U3rPhupGeCHBIOvx5M9RFt2YkiSHiGK0iFrqeYm6rW6w8
         +hme3rpvBBKWFr6B+I2PqnbhI+fKwX6c40ypCUgRrwt+ndNHrq+gN6ShGfHhM7TsfoBs
         bycCvqC0iw/BEpnS2FOhbMl2Q6x06iIVIFSCarql6kivhgJGZCYRsfxDzOOLUgaSOkgn
         wncR+5uJhFU1r+cqhWfrXNm8KQRmUT2Ot4fzqhwfwokGV+ssVHInTi3QXBFniBhzKvjc
         iEDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EyAdCelmuhWMz2sV5ZqU3Z4gymac05n8nmBWa3dsxDuHXEKIJVOe7vYMN8GxduXqRx79pdpbl5jnrDa/eD3Mz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo0Q2jdrGN2Fh2yTIkGqKjX/6Ozc9KdQqR3QYFrSvz36imOFs3
	aGF8hIvj8P/Tt8yY8gYoHgFL2SZY+3781skvz1Ew0tUizaHshI2I4B9NNdg0ig==
X-Gm-Gg: Acq92OGDW8I4+CKJfjTAa17ZFv7RWC8PlgDi3vdsn6alyNKY9t5/t/5B4VQijAo06VS
	iiFRdyKWXaNZdHe5Yqdt0SXrELeMJPhMgHwY+OUcxxgN+PAo5v5DLKbjAUQYvZpi6kNrsjaj4K9
	B2qfHE1XUAQUMMdibe90jo15dR0rJYAub4ivy6pBSabmRaKbiBT8iaWoRhzBmlXV2k9dK6z9egj
	TF2EsWPYUJKK5tFSkFADfqo1fC1eCJQ/AJcdkCcMRUXtaGytFAXIlpr1r1p7F7psZpvHGKV8/HZ
	DTZmkN4rSuUfah3qxb8RWA//zojLg2Hd/Z+0nOOgRuDvE2/MsXEYNd7B/EwHy1y8kMKTG+44sgE
	TiUBPY3se4HTN+oitjjQvHQW7CJO08LPIXMOV3JQJdIkzQRMg6v/54VxMZwoBmzly9TxrsCfhFn
	d5kL9QUYwTl9ox3B8y9wCpJDFl28s2JFY66Sy4QuE9TH6t5Ekb3scpCnJxpTXs5XXaexXmvHgF9
	Q==
X-Received: by 2002:a05:6a00:844:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-842b0ea14f4mr13899922b3a.21.1780886434827;
        Sun, 07 Jun 2026 19:40:34 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm19310520b3a.26.2026.06.07.19.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:40:34 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v5 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Mon, 08 Jun 2026 10:42:07 +0800
Message-Id: <20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8rJmoC/4XO22rDMAyA4Vcpvp6HLJ+aXe09Rily7LSCNhl2a
 jZK3n1uYaxshF3+An3SVZSUORXxsrmKnCoXnsYW9mkj+iONhyQ5thYIaBUiyprG+ZIJ9zzyzHT
 ax7nIDrqg0fvonBVt9T2ngT/u7Nuu9ZHLPOXP+5WqbtN/wKokSDWAU871fkv69XAmPj3301ncw
 IqPiFlBsCGD6nQgGw34P4j+RhwopVcQ3RCMYYjkyAbjfyPmBzGrn5iGbMEFgERGK/OILMvyBYq
 Xx9SHAQAA
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2830;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=Gi78jGqhca4I3YcILxH9j+RePrTUjsAyMzxkhn6QReQ=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqJiwEBeVbdsZIqyr8QR4WZFHc+4DWcWIpgMLHD
 L4ZxmsorE6JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaiYsBAAKCRClg0K3CVbE
 gfajCACvzmERcaUA5uZwA+10S/TWH6Nt3JMJnEm+URle13QSepXcDkTNb0eQmi4RsfL4iVmNsoc
 /HrrnqUGJS4o41K7I2CL0WynKLmUiv4gJQx4v5jymkNb09RR4n3mHvvXI8BdNz4VOZBoS0tusQi
 zAsZD4NI9x+3U+rCzFfRt5VdWzbutkScoAIOT9XF1kk5UdiR4MRy5LqpoS9UDPQRnhNmI0fewMU
 MxixylKyvMS7KPizt0rf59y9QmhNnq9BXaQG9zWX/PCWIJzlVAKJHQMRwrxVThJ69V9z+MdpIXz
 hDeKrlubXoPM2vXYsHHpku5Y4zXSK0vPfeBqgjBVmp56DV8T
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_194036_610701_A1BFB0B6 
X-CRM114-Status: GOOD (  11.06  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v5:
- Addressed review comments:
  * Added comments explaining the necessity of 'legacy_' prefixes (hardware label collision), pre-allocated I2C aliases (future expansions), and the 'ledd1' naming convention (schematic alignment).
  * Removed the empty `&mdio0` node to comply with upstream networking subsystem guidelines.
  * Removed the redundant `&peci0` node.
  * Sorted `&kcs3` and `&lpc_ctrl` nodes in strict alphabetical order.
- Hardware/DT alignment updates:
  * Removed unpopulated sensors (adi,adt7461, infineon,tda38640, ti,ina230, ti,ina238) to accurately reflect the current board population.
  * Added the secondary flash node (flash@1 labeled "e810") under the &spi2 bus.
- Link to v4: https://lore.kernel.org/r/20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com

Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2888 ++++++++++++++++++++
 3 files changed, 2890 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


