Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC7DCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ay/T29lNqSdhRuo/GjV4Eg5RyU5tQbtLVXOjgzh0PCM=; b=KuOJ5ZXnPL2TKm/ukb/Y5y85ls
	U+uuRwt1xttn9BIRTBYDsDGUcI1ZYgSgSsBbn/SmaGJlLeganzLfi1l0frphmvKzBIHBetdCuvcz9
	aOfBLyYmIbJW8H/TMfc+PjarDiwqrsFKqjgoi72uK+O39VHAbeQSgKoZMV6oRRSmfIdvlOr72cko2
	Oe2POAt2H/yemIs4bQe1dCaALpuUd8YBCgnz7Vp3cboWkMhqjQgc/Y7P4UcdeM3W/Ie83w5RZsqla
	ZsHRr10fCk+mvW+yCn/0Ber1ijTO9dryHE2VcYV4kfPf2b5ummwmGh9RIypqY4Q6cekqlDa20RPGK
	QoGQLdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQPH-0000000DD8V-1Ixh;
	Tue, 02 Jun 2026 14:47:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQPE-0000000DD7z-1xTC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:47:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ef616daf6so4044726f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780411666; x=1781016466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ay/T29lNqSdhRuo/GjV4Eg5RyU5tQbtLVXOjgzh0PCM=;
        b=fH5VyNHZpoZnGPb5Yy1qN6SFfqJTAhgZF9iO0upWlrpjsFyElRCn2c4+reFFblsC+3
         PpW2lJwy0ugLvrjY4ktGlJ4kRENIPkkVy+KllGq5tQNTJxgSuFwLx7Obt9vcC4cdXT31
         GfBiFzI+2j4ioPqzoKr4NWThkBWl1J/IhWUaFuyLdpckPZAagN/PlyeHpld6oILokXGP
         xUp+88B4Og4Vqu7LvFui0OiV9PpdHJioGXZJQOhKV05pYooU8E8IPLYx999BJhk3idxL
         7V9ev7blN+EcZC3MSiyoQNwgYdK+/bAi7cb/AAtWJ9PXqmLOJfZ6u3DkpccCP/nu61Sk
         f8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780411666; x=1781016466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay/T29lNqSdhRuo/GjV4Eg5RyU5tQbtLVXOjgzh0PCM=;
        b=lvN6Qt8lpnH59eOheObdk746DGGlwOgetEdHJjetupjfqNI7s+NJ1+T976vx54R0pb
         D+lvYRe2eSaEL+S36BckNTEQCGdNGHv9p2dV6L1ZajEns8CPJC2CoCmdEk/RwI819flO
         BSplZNKWS7aR4ENQT1idRzJZj+yPa2lcv1nNrQ+xryvNxUI6frT8TVZnNltfdMuB7CCz
         jCI0Un/u97t0M8rxqrTkSWCdsE5S0O1bv/9B1voLPEMudT1h0L8f0As2h1cWBg/EI30i
         R7uEks3FGe4HRKESc3UwyNyxL1MHBFBZgC2d0G+NmgP6lzL+1AnUtax6BXo+AniTXKQT
         SCFA==
X-Forwarded-Encrypted: i=1; AFNElJ9woZhsoD8GIzgvpYTXRNq9/MA/QgHjiKgMTH/sWlZqv6m9IVf1E0td/tUWxSomLAilkUHjjf3R2umWBbGiEhoE@lists.infradead.org
X-Gm-Message-State: AOJu0YzBy+0lgsvTvHLmlU7f9UdkHZFzq3rl6PY7xML/PCYYZ1h78I2M
	DHz/ODxuOsOPeuPmX9y7y7awcBDoQIcVpNqmjKf/PUPd0vTYWgVJb0gVBDC4QKm5d/+gV5hnlKT
	s6zwJd/s=
X-Gm-Gg: Acq92OEK7es/hTV7JAtbtWlwTLMT/2B0OTl5v0okCDm6aY9eaSQa5zS7kfZm26lHC5L
	OuWpyh4TDJWv5NunLxmgc60kgeRWchns3gyJfAcmL21+jtU/4G83HSbaSiO3ZDjyaVGgNedevKm
	8d680iK+aCz9M8OC+JxoiOLtra1fiQz++F40N/5ZWKtNEO1lSkvGXN/bJK6Fnnm6j1PPpQU8NHd
	Fowgsa7sqxpzSma+JyxYDCzRF8S/hX01uFKqHejIl8HdSa4Q1IINdADj1csKU83+nMfPHHb2urS
	KdxQeE+DxiwXfWmKGOVXT8QXqzJBMMrDu3YB2MFTcGdDmRDKJCsSEEfFIZhePzxqg5Udxuu8TOA
	Bn8JaMxUiuDTA96Jt6fOJhydt+CKAq0JrtQcchTSS89wL/m32eZlb8nd6L2jwIhdimtxpkvpqXL
	0q3VgS14GbJbznH1Ly25qI+52jPcTCf8ms39uQBjLs+dAAPWQpfX2dLJpu+uh+
X-Received: by 2002:a05:600c:8b32:b0:48a:563c:c8c5 with SMTP id 5b1f17b1804b1-490b5054fccmr908545e9.8.1780411665445;
        Tue, 02 Jun 2026 07:47:45 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm74881395e9.14.2026.06.02.07.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:47:45 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v1 0/2] soc: aspeed: Add BMC and host driver for PCIe BMC device
Date: Tue,  2 Jun 2026 16:42:42 +0200
Message-ID: <cover.1780409151.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_074748_680823_CF014F30 
X-CRM114-Status: GOOD (  17.04  )
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

This series upstreams the PCIe BMC device driver from the ASPEED kernel SDK (branch master-v6.18)  [1].
There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC communication via PCIe. 
This includes : shared memory, doorbell interrupt communication and two VUARTs.

This driver can be used on AST2600/AST2700 based PCIe extension cards, such as Asus IPMI Kommando Card.
The virtual UART support can be used for Serial over LAN.
The shared memory can be claimed by userspace programs.

Tested on :
BMC :
- Asus IPMI Kommando Card R1.01, AST2600 A3.
- OpenBMC
Host:
- Linux kernel v7.0.0

I tested VUART communication with interrupt.
No driver modifications were required.

Not tested on AST2700.

Provenance:

I did zero modifications to the ASPEED code, this is only an upstream patch.
The driver files match the ASPEED SDK tree at :
  drivers/soc/aspeed/aspeed-bmc-dev.c
    1815546a54f5f89bc9d3bd8f5658f0a573927509 [2]
    "soc: aspeed: remove MMBI implement in host bmc dev"

  drivers/soc/aspeed/aspeed-host-bmc-dev.c
    7217e3c872166d56389a97e1b81996f73a3e76d5 [3]
    "soc: aspeed: remove iounmap"

The driver code build cleanly against Linux 7.0 without any modification.
No fix were required. 
I built both the BMC side and Host side with KCFLAGS=-W and no warning apperead.
Original authors are credited via Signed-off-by in the individual patches.

checkpatch.pl --strict reports 1 warning for BMC side driver
and 2 warnings for host side driver. 
These are unchanged to keep zero diff against the ASPEED SDK tree.
I can clean them in a v2 if needed.

The host side driver had a submission from Ninad Palsule : 
"soc/aspeed: Add host side BMC device driver" in August 2023 [4].
This submission stalled and did not make it into the mainline kernel.
Since then, the host drivers have changed a lot on the ASPEED SDK. 
I decided not to base this patch on Ninad's one 
but rather to simply upstream the new host driver from ASPEED.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://github.com/AspeedTech-BMC/linux/commit/1815546a54f5f89bc9d3bd8f5658f0a573927509
[3]: https://github.com/AspeedTech-BMC/linux/commit/7217e3c872166d56389a97e1b81996f73a3e76d5
[4]: https://lore.kernel.org/linux-aspeed/20230821183525.3427144-1-ninad@linux.ibm.com/

Grégoire Layet (2):
  soc: aspeed: add BMC-side PCIe BMC device driver
  soc: aspeed: add host-side PCIe BMC device driver

 drivers/soc/aspeed/Kconfig               |  22 +
 drivers/soc/aspeed/Makefile              |   2 +
 drivers/soc/aspeed/aspeed-bmc-dev.c      | 701 +++++++++++++++++++++++
 drivers/soc/aspeed/aspeed-host-bmc-dev.c | 664 +++++++++++++++++++++
 4 files changed, 1389 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-bmc-dev.c
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c

-- 
2.51.2


