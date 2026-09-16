Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616BAC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9xroIRUTOjaInSxTGuPUK8qvcFgIYF9ONOReSA9rwM=; b=csDch3PlTYJNTd/mHdzBbKxMWH
	ctpi65tIkZKG1Ca7fH7SIvgUmMYLMRyGTvDavdfrG60HsWkd7o/GyTCNzAzbDyestwHuHv2SKGol+
	QutHHF/JhrFV/GeSEKIizewVDJWhilBAi+qUtsl+HF6NIq2bUtIQgwwKpJZtQ4lbjh9Wd9dgEdF8W
	9DnGiaSp7geD2VDxSV2nydDplW5YL+7NYEsKtUbwEb2eZz1fwe+RMh/9qGvTIPYQY+NT97MiZTawa
	QRA8oV5dRA4Gwsb49uqe0WM8gmX5ztt9LkHKHXMZtv8w5lf8rJMZC0ltJD8emvcyspdM/RrWV13pK
	BvOQ6acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x72-0000000A8sE-3izI;
	Wed, 16 Sep 2026 21:24:16 +0000
Received: from out-239.mta0.migadu.com ([2001:41d0:1004:224b::ef] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x6z-0000000A8qy-1KpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:24:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=W2j8a4jZDPmkymjfN1hItBmWKFDdSwH3LXIvlxtLS7E=;
 c=simple/simple; d=jimenezcarrero.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789593849; v=1; x=1790198649;
 b=LQYOZaaUV1A77d9PHytdeBHsAZaWaCBKA/RABbsa+jghYQCRrUs67t8cYBx/n5SWj8oo+3SV
 +tTyDqkj2gHZIuIW7ccMYVG9IFYwfaXg7nas5spKiTSyDsvhS9jlZHPJVXF2fKO/Nm/kLXFRYT/
 HzKgYRmHF7tx3HPClX3W9CDNzYWKnhtOmuvV3kpYXZofkjI4hlu8Q3d5yG5XcQmU+53BWIQsXwS
 4N0E+SJxnttYWqQGlON2v3GVH+yAP7HjcxSjLvT2nVgHZE7072ocXj5ZWWV3uIGjvZ9CM+5tnzM
 sq4tbd7QCNtE5RPa2IEG0b8XpmApzdcdVUyJdpwqAQIzg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 11e736fe78460d70;
	Wed, 16 Sep 2026 21:24:08 +0000
X-Mizu-Trace-ID: 11e736fe78460d70
X-Migadu-Flow: FLOW_OUT
From: Juan Jimenez Carrero <juan@jimenezcarrero.com>
To: khalilst@gmail.com
Cc: khalil@rentman.nl,
	rf@opensource.cirrus.com,
	broonie@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	patches@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr
Subject: Re: [PATCH v3 0/3] Fix CS35L56 amplifier on Intel LPSS SPI with broken ACPI cs-gpios
Date: Wed, 16 Sep 2026 23:23:55 +0200
Message-ID: <20260916212355.7216-1-juan@jimenezcarrero.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901192625.1497791-1-khalil@rentman.nl>
References: <20260901192625.1497791-1-khalil@rentman.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_142413_704455_FAA49BE5 
X-CRM114-Status: GOOD (  10.12  )
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

On Tue, 1 Sep 2026 21:26:22 +0200, Khalil wrote:
> v3 of the patch series fixing dual CS35L56 amplifiers on HP laptops

Following up on my earlier reply, where I had only run the earlier
gist version: I have now tested v3 on the same machine.

  HP EliteBook 8 G1i 14 inch, DMI board 8D8A, SKU D75TQET#ABE
  BIOS X91 Ver. 01.05.02
  2x Cirrus Logic CS35L54 Rev B0 OTP4 fw:3.4.4, ACPI HID CSC3554
  Kernel: linux-omarchy 7.2.5 (v7.2.5 plus the patch set of Omarchy,
  an Arch-based distribution)

What was tested: 2/3 and 3/3, built out of tree as modules against
that kernel's headers. The distribution kernel carries a sound
backport that also touches serial-multi-instantiate.c; 2/3 applies on
top of it with --fuzz=0.

1/3 was not applied, because CONFIG_SPI=y there. Looking at why the
result still worked: on this path 2/3 installs the descriptor in
ctlr->cs_gpiods and never presets spi->cs_gpiod, spi_alloc_device()
zero-allocates, and __spi_add_device() is the only place the device's
cs_gpiod is assigned. So the new check in 1/3 is always true here and
does not change behaviour on this platform. I may be missing a case
where 2/3 relies on it, but on this machine 2/3 + 3/3 alone were
sufficient.

Log from reloading the modules at runtime:

  Serial bus multi instantiate pseudo device driver CSC3554:00: Applying CS GPIO quirk for HP EliteBook 8 G1i 16 inch
  Serial bus multi instantiate pseudo device driver CSC3554:00: Extending num_chipselect from 1 to 2 for CS1
  Serial bus multi instantiate pseudo device driver CSC3554:00: Acquired CS GPIO for CS1 from ACPI GpioIo[0]
  Serial bus multi instantiate pseudo device driver CSC3554:00: Installed GPIO CS on controller for CS1
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.0: DSP system name: '103C8D8F', amp name: 'AMP1'
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.1: DSP system name: '103C8D8F', amp name: 'AMP2'
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.0: Calibration applied
  cs35l56-hda spi1-CSC3554:00-cs35l54-hda.1: Calibration applied

A cold boot shows the same quirk, GPIO, AMP1/AMP2 and calibration
lines. Both amplifiers bind to the codec and the internal speakers
play in stereo.

One small note on the quirk table: the entry's .ident is "HP EliteBook
8 G1i 16 inch", but this 14 inch model reports the same DMI board name
8D8A (and has CS35L54 rather than CS35L56 amplifiers), so it matches
too. Only the label is narrower than the match.

I'll send Tested-by on 2/3 and 3/3 individually, since 1/3 was not part
of what I ran. The offer to test HP's fixed BIOS still stands.

Juan Jimenez Carrero

