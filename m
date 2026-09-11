Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54715C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXNvpnAsrawHX22O6Lzfa5FtB4T8iRuyrH9BxwkerBY=; b=S8zSAG6XnrEo8g2Kos+Q87CdAw
	3dJ1e3lcQ0vJf29aICyIrAQ2kUb3LLcJYy9447Nq1hBJHP1MiYPc+YUaq8GxrwSj6rw+DQstyMZrw
	xLy1U8mcV1Kc2N0EwmjTxzd0nXmwaHSnn9Z3oqp/Hz0oAiEzYtAx9vbbh6+BGUGQI1GFEhRaYRBEU
	pnuABTvgl/8CTe48xjVg4fNPqiPQ/KZC6upEdJ1CxuQ+GcyOpagPR5oKhgmsw9IiKuCKcQa4T/uBz
	bhLqlZrrFNac3ASfhQfdi74ZirF4mA2v+iveLKaXw0ng8b1BoKaZkCYknx/8DqZs7fMshSWWGRwu7
	5chtYnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xHG-0000000GEEg-1jOF;
	Fri, 11 Sep 2026 09:10:34 +0000
Received: from out-19.mta0.migadu.com ([2001:41d0:1004:224b::13] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xHC-0000000GECx-0hbO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:10:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1UiFqdha0Je3xR9CoEQZhVfy8k5gYLDEkjsNuoazTlU=;
 c=simple/simple; d=jimenezcarrero.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789117826; v=1; x=1789722626;
 b=NfcQZ8DX7jkgP757F3iNU2vI/J0SIjry/c1fsQ2Yl0z9QYKMzHnf/P33Z1xZ/vyENtoqBqJm
 uyJHqFjk60RB2KyjlULGwkAblkXn3rjePW251YiqQekWcLI6+SDA8nHnECADEw2Tb38GSbBFYA1
 pRfiTgWE2LgVyfU8pxVY4iuEYi0OXscScEeQkhdLCsrbUmp9RDOHJIlcwZYY+wU8ryuVpAtmtG8
 d3sB48oLN+VJQ3jCd9MhT9O4Az1MmNAiMQ/8lMr0XgqXRu5TeQhGvwntvSUO8R+e2KrS3aly+vk
 grU0laXQjP485SWT0pbWsbmDcIVndwmXxGzPcqNd9Cmzg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a8b86de78718f879;
	Fri, 11 Sep 2026 09:10:23 +0000
X-Mizu-Trace-ID: a8b86de78718f879
X-Migadu-Flow: FLOW_OUT
From: Juan Jimenez Carrero <juan@jimenezcarrero.com>
To: rf@opensource.cirrus.com
Cc: khalil@rentman.nl,
	broonie@kernel.org,
	hansg@kernel.org,
	linux-spi@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	patches@opensource.cirrus.com,
	khalilst@gmail.com,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Fix CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Fri, 11 Sep 2026 11:10:11 +0200
Message-ID: <20260911091011.76333-1-juan@jimenezcarrero.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <dad5e839-4932-4ae3-86d8-a3c2f4ce07d7@opensource.cirrus.com>
References: <dad5e839-4932-4ae3-86d8-a3c2f4ce07d7@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_021030_916307_2F21806D 
X-CRM114-Status: GOOD (  13.06  )
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

On 03/09/2026 10:21 am, Richard Fitzgerald wrote:
> HP told us they have a BIOS with the cs-gpios fixed, and they can make
> that available early if you post a support request for it.
>
> Can you test that new BIOS? It would avoid the messy SPI workarounds.

I have affected hardware. I could raise a support request and
test that BIOS, if a second machine doing so is useful:

  HP EliteBook 8 G1i 14 inch, SKU D75TQET#ABE
  BIOS X91 Ver. 01.05.02, 05/03/2026
  Intel Core Ultra 5 238V (Lunar Lake-M)
  SPI controller 8086:a827 (LPSS_CNL_SSP via tgl_spi_info)
  Realtek ALC245, SSID 103c:8d8f
  2x Cirrus Logic CS35L54 Rev B0 OTP4 fw:3.4.4, ACPI HID CSC3554

This is the CS35L54 variant rather than CS35L56, so it may be a useful
extra data point either way. The DSDT defect is identical:

  Scope (_SB.PC00.SPI0)
  {
      Name (_DSD, Package (0x02)
      {
          ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
          Package (0x01)
          {
              Package (0x02) { "cs-gpios", Package (0x01) { Zero } }
          }
      })
  }

while GSPK._CRS declares SpiSerialBusV2 with DeviceSelection 0x0000 and
0x0001, plus a GpioIo for the CS1 line.

One difference from the cover letter's description: on this machine
neither amplifier is instantiated on a stock kernel, not only the
second. spi_add_device() rejects CS1 and serial-multi-instantiate then
unwinds the whole set:

  pxa2xx-spi pxa2xx-spi.3: cs1 >= max 1
  spi_master spi1: error -EINVAL: failed to add SPI device CSC3554:00 from ACPI
  Serial bus multi instantiate pseudo device driver CSC3554:00: probe with
    driver Serial bus multi instantiate pseudo device driver failed with error -22

For reference, the LPSS capability register on this board reads
caps[0xfc] = 0x220, so CS_EN (bits 12:9) is 0x1 and ffz() yields
num_chipselect = 1, while ACPI describes two chip selects. The TYPE
field of the same register reads 2 (LPSS_DEV_SPI), so the read itself
is valid. (Obtained with a dev_info() added to spi-pxa2xx.c; the
register is not reachable from userspace with CONFIG_IO_STRICT_DEVMEM)

I have run the earlier two-patch version from your gist
(serial-multi-instantiate + spi-pxa2xx), built out-of-tree as a DKMS
module against 7.1.9. With those applied both amplifiers probe, load
firmware and calibration, and bind to the codec. Internal speakers work
across a cold boot:

  serial-multi-instantiate CSC3554:00: Increasing num_chipselect from 1 to 2 for CS1
  serial-multi-instantiate CSC3554:00: Got CS GPIO for amp CS1
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.0: DSP system name: '103C8D8F', amp name: 'AMP1'
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.1: DSP system name: '103C8D8F', amp name: 'AMP2'
  snd_hda_codec_alc269 ehdaudio0D0: bound spi1-CSC3554:00-cs35l54-hda.0
  snd_hda_codec_alc269 ehdaudio0D0: bound spi1-CSC3554:00-cs35l54-hda.1
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.0: Calibration applied
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.1: Calibration applied

I have not tested v3, so I am deliberately not offering a Tested-by for
it. I can test v3, the new BIOS or both on this machine (whichever is
more useful).

Juan Jimenez Carrero

