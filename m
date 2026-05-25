Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35404CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1E+3H3I4fVbx+3wS9d4vnxO3+j6uREjtuQtKyu61mXA=; b=NL9bCkzU8rb8+fcXNhuxoMO/N5
	xPHD/yduPE3S5PKCCLjeOCvps08XhhSYJJdKQ4Om1V2d/J/pBZTuludDUmW07FqtqmBpqEld3cnv0
	ami3Jm3evvYtbncGmdSt5M057S1LYT5lwuU68G3qOU2MMikRVmjlF8JJKaIb3vcn52hRmcAUIEnoV
	YMFNC1DO3HmXGO+mdwFHEtDuzj1ytWC5Jfu737F1ZPh5M4ss9tWcnGdX0NFs6RiFmM6R4vNrSGBBV
	TBI01WPZVVcAO5ZjN8R66KkHnu0I5DHfFjnTqGNEuyXo7CS4x/VtW4CVX6es3d0P5IPVqyoJ/LBiN
	br2apSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRY1-0000000GnQJ-2fI4;
	Mon, 25 May 2026 09:24:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRXz-0000000GnPf-1Yxj;
	Mon, 25 May 2026 09:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1E+3H3I4fVbx+3wS9d4vnxO3+j6uREjtuQtKyu61mXA=; b=AYSA717xFVOwi1sBDNvrM4l0jd
	BBcwlzU4BqK/a2qAJQ50zDvDK2A2Dxc4bk0NE+RmMMem4iN52Li7sr3GWp/ZuqjFTKQOTLqX6i8Rk
	nXwf6n7Ui5IZUP3iTkxYkKUwhPZrL8IOgqnCfpUwph4gUZst37goFL5ltHipdeokGCqC/JjBM7A9V
	suTXdNkMv8+gKzuNWwQQvatS2/xLFBwAxBHa2rqSeDuly5xf3ah4ibAptMPuwQGPQva6eGgIKaKKs
	vyxMDGE13CxsSJXNsWCUkQ4CRlRriAow8KYMQUh5jidKmKy2QkwVZWDwSUO+TOvxBVUIhjYe3s90A
	D1lL/2xQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRXv-00000008tA4-2r0c;
	Mon, 25 May 2026 09:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701068; x=1811237068;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7CxDZVVmjINNZ+C53/a94GTagFviQSU25grn7lkf6Eo=;
  b=pgWLcbM7ix2M4ExSjFnxLf6bXDjZEx4yJYQlYbF8Yrm9BUwAAo1ZecUs
   v5/eDzO10NtYpx/dsAIp/daba8e4iDjLIXBMwOn7liby+S+zxsCvyogbE
   OzQreTpGl6j6Y/GnjrYB+rP7aCM/Js4nOvGTGsFzdGrDsDIqHCe2Ox/HB
   kH9cs/tBTfS9XamuvWnmznceo8hFXHOfECAlo/1pvIGuTW3Bgb5sDye8P
   Mt6C2VwIsuCUUxgN83nQwJ8fRIY3yTSHul0ZkSHFAzbC6JouApgL2F8Id
   ZJxvcptQ0wH7+vG5OXvY0f/VOLQF/QA5xOZAtZdl3PhGAHaYiJ1yX8f/r
   w==;
X-CSE-ConnectionGUID: wvjAqM3FQdeLmQ7dIPVoPw==
X-CSE-MsgGUID: YkXV8BsvQQ+4KBfx+XgkPA==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="289388351"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 May 2026 02:24:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 May 2026 02:24:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:12 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 0/5] Add microchip sama7d65 SoC I3C support
Date: Mon, 25 May 2026 14:54:00 +0530
Message-ID: <20260525092405.1514213-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_102428_430186_59F4DA0E 
X-CRM114-Status: GOOD (  10.26  )
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

Add support for microchip sama7d65 SoC I3C master only IP which is
based on mipi-i3c-hci from synopsys implementing version 1.0
specification. The platform specific changes are integrated in the
mipi-i3c-hci driver using existing quirks.

I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
mixed bus mode (I2C and I3C target devices on same i3c bus).

Please refer to the individual patches for changelogs.

Durai Manickam KR (2):
  clk: at91: sama7d65: add peripheral clock for I3C
  ARM: dts: microchip: add I3C controller

Manikandan Muralidharan (3):
  dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
  i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the
    required quirk
  ARM: configs: at91: sama7: add sama7d65 i3c-hci

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  8 ++++++
 arch/arm/configs/sama7_defconfig              |  2 ++
 drivers/clk/at91/sama7d65.c                   |  1 +
 drivers/i3c/master/mipi-i3c-hci/core.c        | 10 +++++++
 5 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.25.1


