Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E41BD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3WjMx6HuwU1Wy+8RcNWFYu7YuaIy2oBjUVHx01Ru4Xc=; b=pEqMkqYEmopcYlSeBrUCh9F3TH
	MeMudT6ppvD5s4nRQR4sPjSzRj22urXR4oqmiCHkweBxIcSPWmIczcQCDzGJ3INQTXE86FM89s6Ja
	WHLTxSN22zcxzsfgM2D2cA6l1YYdTbnnBZA8OOjyw5KVHLqv7EJ3/YAdDiliDM468T9Rj/MUqrw68
	rJRqsJiT/PRYa8JYzfFHxAfBe+O8KkddAYB7mSbXuf3MgJJTpGt+5I7SRJdMMOa7kEjojmpFyZhHD
	hbqo3Vzc6JrMFO3NZkwY22EBqCSEyyah3rkN2OaSSk7rwFdwPsSLFZNdBNBddiBdUO8yeRQQox4XW
	0auN4ceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1mI-00000004TO4-3QvD;
	Sun, 11 Jan 2026 20:11:10 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1mF-00000004TNa-34Jr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 20:11:08 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-790948758c1so58527347b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 12:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768162265; x=1768767065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WjMx6HuwU1Wy+8RcNWFYu7YuaIy2oBjUVHx01Ru4Xc=;
        b=ShoAcXrsIlIE0YmRFT+F04SCJIKgL4O5YJz0A3JmAEu4Zd4Fm90RCGnq3YV+MUhxx5
         0t/TWBExH+wh8n5vypMVVCjv8dG4/NgrkIeSLXQknfpx1fBg/UxVDK5grmqW2XL7eGGD
         mlj+ENgYafgRrL9lmKaSj3Lm35j/6EwVU7UdJsFAUlYmEvMQZTuHrc+fQpwS5YvRNA2Z
         QBT0Mmd4ZbB1GVqxivOC8XRIvpgDX7yrxCKnvf2e/czt1YcyPKC1P+IMBaP3IL4B3Omk
         LFBIpBOoE8UZYToW4RJz3wTZqyFBf/ZgRaEcCnyKE6EfwppDe9zb90PPCdis6fBov0Tu
         3sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768162265; x=1768767065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WjMx6HuwU1Wy+8RcNWFYu7YuaIy2oBjUVHx01Ru4Xc=;
        b=X826MEKlhOfY7UaR47B7Uy8zPxKxt/62VKVY4Eh6A3Oe62lxEIkfG3Vkj9TMtHQMPy
         9VvNLsN28rhVe1vo9QsSSoXrWFztNBsRz08HWrK8roHuq0EZe5P0VUdJe+k83FfHhZqO
         CsRdt0TuNvXnqDnThw/P89HCalwedOaFI9MW1KosUcvdSRwrAib6AkZTDHkwCH+2d4lu
         dIzivYwXPPH6UwMDu8i/Z1b2OXKYCyGAFS55f3IfP0joJgTBRft1XT+A6HsQYKw4uyw8
         APSlSiQlEoXyu1cf6+aSau4zom/I87nHg+6q0E9i9ztd8ZB7UuKhlkkJ37xx+q4hqBMO
         FtEg==
X-Forwarded-Encrypted: i=1; AJvYcCVwayNfyucRd4SrHQ2lkxEQkmW8G0Due6An+Nq/DInuy+Vwq7twdU8Ls6Ga0IUxelvIKNMid9usv6aybiuqbRaL@lists.infradead.org
X-Gm-Message-State: AOJu0YxMO2Yj+JLjKriJgxuzkas1bL79zQ7Z7EenM0gm1pId0kX4hk0w
	OCLrVC8Nc4r5++i5c8O936u4tgfMq2N0wGhqSMNrqFAVpRCs9HXSKRUu
X-Gm-Gg: AY/fxX4xpWT/HoN1e8G07R2KpuHwrBFyh38RK14TOFSJkSgS5Z32TQ7LxXsvityN+vS
	/Hr32/1SCTlrLvz/RqbuT71bnVHTX0yC4OxS9lN4ciP1MG0/MAXgGForzkLJSkB8uhwrRb/rm+e
	R5Lg2B5XIXxwvdYEEW8+hLlAbP/V/P8VSiyzkNaq5naTZcsQHX1NcO+DE8Ci7lSqsP4I1Euw+Kt
	5KSVg4OJdM6Hf5aXk59Rlx9FDKnohVzNk2wwNfku4NF0fnzd5XZaMpIRDRBNvEuHZdZxrdkwhnr
	xN3lpWeRgWDR7h/17jFKUhAqA9rb+2OfyWWKzTSb237cNpuENtWfDuNATw0i7qEmI7ijNCS97fq
	wrv+caCvLikaHKvkDpK+28cLb3YWJgINhg5aSZZfzzo1MNUctzmicbfFY9sKyC9kjQnXR
X-Google-Smtp-Source: AGHT+IGtpefdIwaz1zrj3LX0ANB3EkQVjPbjQhL8KzEpUBfzS7Z79abIt8/S9RwcfiKfM++zWNHWgQ==
X-Received: by 2002:a05:690e:12ca:b0:63f:b410:e93 with SMTP id 956f58d0204a3-64716bd1ba8mr12791408d50.42.1768162265218;
        Sun, 11 Jan 2026 12:11:05 -0800 (PST)
Received: from toolbx ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-790aa5762f6sm62175717b3.15.2026.01.11.12.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 12:11:04 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: anirudhsriniv@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add device tree for Asus IPMI Card
Date: Sun, 11 Jan 2026 14:10:30 -0600
Message-ID: <20260111201040.162880-1-anirudhsriniv@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_121107_779396_4C949343 
X-CRM114-Status: GOOD (  12.23  )
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

Adds support for Asus IPMI Card [1], which is a PCIe card with an
AST2600 on it that provides BMC functionality to any host without an
onboard BMC as long as it has a PCIe slot.

Currently supported functionality includes UART, NIC, booting from SPI,
KVM functionality(usb gadget for host, reading VGA framebuffer from
host) and LED/Power Control via GPIOs. This functionality has been
tested on an OpenBMC build available here [2]. This requires a modified
u-boot device tree [3], which I can also submit if needed.

The card supports some additional functionality in it's stock firmware
like fan headers with fan speed control, host bios flashing via SPI, PSU
monitoring via an SMBUS connector, a custom ASUS SMBUS connector to talk
to select ASUS motherboards that support it and exposing a IPMI device
via PCIe to the host. These are unsupported at the moment.


[1] https://www.asus.com/supportonly/ipmi%20expansion%20card/helpdesk_manual/
[2] https://github.com/openbmc/openbmc/compare/master...Genius1237:openbmc:asus-ipmi-card
[3] https://github.com/Genius1237/u-boot/commit/1b1b7daa85f6c998e5f404296b3da43077a2758e


Anirudh Srinivasan (2):
  dt-bindings: arm: aspeed: Add Asus IPMI card
  ARM: dts: aspeed: Add Asus IPMI card BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asus-ipmi-card.dts  | 137 ++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts

-- 
2.52.0


