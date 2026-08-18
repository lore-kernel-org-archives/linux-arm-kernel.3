Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEC8C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iRzYJ7RHlmt5faDVd4SQiUF+QBz3mgu2M1pqY/9IwAk=; b=JiFQHX5cTtb3Q6
	7vId/LJXRsKVgqHVbIimS3ghMcZ3PxMh8Bkv1ixg06j+aJH02RDkjmtmQEUPdejWuEPv6EbfDr5id
	A0gl4yizGahf/28xRHefn6osx/vt/PrxV/oI/y1D5FJSDYEMQS9Ueli814k0TFU+fFiw3HYUnh7AH
	PY2TB41Wa96i5DK+eVEYzSuoo2X32/JuZ2/xjS1n3qmE1lBKj/HMo9C4rPn7YmRTsLgOWu8TI6RGe
	kq1kaj5a8iuy9EzJckdWHWWLD7uwaNQEEZ8Zs/hR+cwSDzNhtTrqveLT9cqHuU4XnXZxPhKsNMiol
	Bh1/vQ3TkrbQjWyEM45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6g-00000007ige-35AB;
	Tue, 18 Aug 2026 10:31:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6d-00000007iev-3tQZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:31:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso1015572f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049101; x=1787653901; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iRzYJ7RHlmt5faDVd4SQiUF+QBz3mgu2M1pqY/9IwAk=;
        b=HLjB4HvyyqdU4S/dBowJQmyCHGF0/Hv/vMkl2MLqIVLfUD7aYlyBHgrJ6pGJIuye0M
         OkMdglKGOL7MPoGPvWwMGCnfSNVIPpKVYH9bmnaibRehxOCv9HWLey67FIE2Crb1NInQ
         q33if0aVD+JHyOoj6p9ZbeE+XN5qtOHeqduUkqWsvOov3NtiaDegX5crIb9QjmtwWv+R
         R6BzBtoPqiOPseeMT7cFf8PGEHHDEGgKxk/vGt2Vd/42pQAbZolNYb3XdRcyxSaepfA3
         /E3YuN/Esf1i0iR6UrM1lQdR1dZ21LeUM4Kxlg7iGRz0vehw+JUEEWS9whQlfW3EGxU1
         ew0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049101; x=1787653901;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iRzYJ7RHlmt5faDVd4SQiUF+QBz3mgu2M1pqY/9IwAk=;
        b=AYG2DLx0CxFRJvv29AdiwlGrBIfYy4HVHO7YzMX0A2TnlkuP3aridXg+wsjc6LWGaN
         y3iNSkUd9T+Rz2fps0YNqLxmvy03lPPAP0UkecFsn8C3CGP3zNpNIOThAa9sV+NwjtzN
         8Bb45iCclWo9tIDg3mmsDQJ5rH+97zm76M1RhyHz3ji/vndlQvke47U3KJg9U8q98mAP
         BH7YraIh2qm+8NLVssiogFMKo56m70igcB++2PPDChT1RliG2TNH5nHXBi6j2SKW9ww0
         iM4AfoSg/4Tms+jp0dpOAvd1H96I/inUXlylB3HFwDVZO4JesHlqgMbtsDVtUVpSrbLP
         r6GA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0eWpQmxAX4UH2Ut4RwyVoKv3vINLTNuT1w6Cf2fmjRit0WI5zHPGsl1903XFLsaQ1pSTBs2v/c/hCMC5mWCfY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy3JOMfFv+wo7nnvGNYPFJKjcBnLHfsvCoS7EHUfR5ZhwKs1pd
	6EnYuWHUABBao0ofqEnife+YGwwDycc/fwvhmIztLgzEJ2UFNPqKT14DOCeD83SUNkMzwLkVstl
	dcsG9
X-Gm-Gg: AR+sD10G0ZPmOMoQvgLJe+rl4NEaePt08wcSCqUcI4yRyEj98h412UOxc6Ke54Hl9EA
	L8UTxvYL8VotWrrJrrcPmTHNzaTLjCblf1lxvcgL6OuLPJ7i/b1QGV4QkPgbnbCHJfhLzn0D8Ag
	uxqMqOz2GC9eRPZ86eCuZ5Z/atad3c165eEHq1dYmfIRCyvIuyw2qRkCNdmtcIzCejh1He2Ncnh
	YvD96CiYlT48W3zoeeTKKkmCiMTJ8hnidcwUeORBUV3LwqRrlZe3XPx5MsP94wf0/LWHW4LOTeZ
	zhqI8m3gA9xvtXucVVeM5FDhxppvMzHXvUIu8UlYpbmUCTv+9HT8ICx45UZpllfekTD/RW/3lKU
	JjFIQSfIeNiBX75ZR82IJKechNsDPIA5nSAcTpBUnL8SUC3AWvfJ/4gKGqXavXV4KF6u8Uu9IaR
	ztKapE3mWGzlTpcbakmMgIfn3GOgyuBYHgV1srNKVC7DfTio4EQ/ZNpL0zMqDNEeDdCf/W3g0AQ
	KEF+D5dodKcbuqwpHSPZeUa7q+KZ4iqxdQVV+IrZRb1Ibh0QWyz91g+ItPGNEQqEGlM32w=
X-Received: by 2002:a05:600c:6089:b0:499:86ce:465e with SMTP id 5b1f17b1804b1-49987941e38mr561900575e9.4.1787049101182;
        Tue, 18 Aug 2026 03:31:41 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:40 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v6 0/6] soc: aspeed: Add BMC and host driver for PCIe BMC
 device
Date: Tue, 18 Aug 2026 10:29:13 +0000
Message-Id: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPkzhGoC/yXMyw6CMBBG4Vchs3YSyqUBX8W4KO2PjgskM9qYE
 N6dqstvcc5GBhUYnauNFFlMnkuBP1UU72G5gSUVU1M3vh7cwMFWIHFSyVDOntM0jn0bQ+c6RyV
 bFbN8fsvL9W97Tw/E1/dD+34AwrvMHHQAAAA=
X-Change-ID: 20260818-aspeed-driver-v6-db9953ca4141
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033144_102820_F446551A 
X-CRM114-Status: GOOD (  18.18  )
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

This is the v6 for upstreaming the VUART over PCIe BMC device drivers.

The initial drivers were taken from the ASPEED kernel SDK
(master-v6.18) [1], and have been adapted greatly.

There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe.

The virtual UART is an 8250-compatible register set. It is called
'virtual' because it is internally a simple FIFO.
On the AST2600, two VUARTs can be exposed over PCI via the PCI BMC device.

The host cannot access the BMC's memory. Only the exposed features are
accessible. These are the KCS4 channel and 2 VUARTs. There is also some
mailbox register functionality for a communication between
the host and the BMC. More information can be found here [2].

Changes since v5 [3]:
- Fix small formatting issue in Patch 4's commit message.
- Use static const for MFD cell and uart_port in the mfd driver.

The host driver will performs multiple functions. The AST2600 also
supports LPC over PCI, with a specific KCS channel (KCS4). This host core
driver should also be used to enable the IPMI automatically via this KCS
channel.

Tested:
As with v5, VUART data flow and MSI interrupts have been verified
as working on the test hardware, in both directions and on both VUARTs.
BMC: Asus IPMI Kommando Card R1.01, AST2600 A3 running OpenBMC
Host: Linux kernel v7.0.0

This series only supports the AST2600; the AST2700 is not supported.

The findings regarding the MSI interrupt numbers are explained in the v4
cover letter [4].

As with v3 and v4, I would like to know whether I should add the
'lpc-io-reg' and 'lpc-interrupt' values to the vuart3 and vuart4 nodes
directly in the 'aspeed-g6.dtsi'. The host driver is not capable of
finding the vuart address on its own, so they are hardcoded to 0x3f8 and
0x2f8. It will not work with other addresses, so perhaps they should be
in the .dtsi to ensure the correct configuration for the two vuart over
PCI.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com/
[3]: https://lore.kernel.org/linux-aspeed/cover.1785932211.git.gregoire.layet@9elements.com/
[4]: https://lore.kernel.org/linux-aspeed/cover.1783524645.git.gregoire.layet@9elements.com/

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
Grégoire Layet (6):
      dt-bindings: serial: 8250: aspeed: add ast2600 and aspeed,vuart-over-pci
      serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
      serial: 8250_aspeed_vuart: add VUART over PCI
      mfd: aspeed-pci-core: add AST2600 PCIe BMC device driver
      ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
      ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

 Documentation/devicetree/bindings/serial/8250.yaml |  42 +++++++-
 MAINTAINERS                                        |   6 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  14 ++-
 drivers/mfd/Kconfig                                |  12 +++
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/aspeed-pci-core.c                      | 115 +++++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |  92 +++++++++++++++++
 7 files changed, 277 insertions(+), 6 deletions(-)
---
base-commit: 6fdec78001b3b94f1b6000bbb2f9ec3498f1c73e
change-id: 20260818-aspeed-driver-v6-db9953ca4141

Best regards,
--  
Grégoire Layet <gregoire.layet@9elements.com>


