Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E89CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IVYMqtKHxu96uoD6/LMPh8YyKZYkylDuLrOfkixS8w=; b=4/f79njcpMEjbMx23lsSxasDHk
	xe+QRAkNopwucPpZJjgHxLFAmE+MldJI5bv/DRiDJuaLvKrMdq13j8dk+/r9kgxCtdW5FUOGVgbvz
	Sl7YuLJrmHIF44XacCP9n7afSS0B4H3b3qXLvnAJpFkMzIWoCrx6gpaf532L6niYHD+eL6FvxS9He
	mttqsA1lFNG7kapvZpoDa5DVXTKhiYxvkyW+7CFJNaOCGQtK/2ol+ajH+/JBc4VwYUv1bEMpgsMyz
	8+t00SC8wBiZMxo7JE8uE8SVWvW2MbTNuy8lvZhfkNHvTVOYHbzzc0HeIFGriOmfEphM8CxlsvQg4
	wzSwQXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYqV-00000003Agk-2fAC;
	Wed, 07 Oct 2026 21:06:39 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYqS-00000003Afp-46D0;
	Wed, 07 Oct 2026 21:06:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791407187; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=YX7Vu4/jgW15llxosNuC6hNEUR5ce4IaDj3sXJPihNyzrxd3E4OWgVCQYOCgNJt3ywLue+rW7Uqpp/9ALnJ4jgLE2kNWNw05aD+c1RMoZZiX7VJ1Ug7ACvAn9JdkI5L7Sg4NMbRfo1xMKe5moG36f2vEvEOnP/2uE36fNHWSIlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791407187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4IVYMqtKHxu96uoD6/LMPh8YyKZYkylDuLrOfkixS8w=; 
	b=FmIY7qZQXxnzh/JY5D5XzcggDmBUxokqseenxNoXKkERDGKoeKoSjfYVcm8EUW8zTQhmXhYMd3sBOspTYDKM+OGPW9BTjyidDJC15cc5rk6qIwXO+sfCuyIIxq21ECZ9z7z9Sf+65IdhzTvoSiOZR68Zk6ZKczdvQA+4Mq4T1OI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791407187;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4IVYMqtKHxu96uoD6/LMPh8YyKZYkylDuLrOfkixS8w=;
	b=B76ge9EWdGLH2Ptmuz/xdysPq9CJEHrkOfEIv5YQBh3GDMaBNqxgz/ZxGuuFcdCP
	bMudmmXQtwMMmgTp3tE1wawTeSXjSQsdGywAPhc7GZSBQ4xAZhDFvtGNlSx190egYo0
	GB1osx1W/XG1qINXvRUMncKowIGkLgWNuJn5kLiM=
Received: by smtp.zoho.eu with SMTPS id 1791407184521227.33749622375103;
	Wed, 7 Oct 2026 23:06:24 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>,
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
In-Reply-To: <179100548183.3372253.2014593916926884551@iav.lv>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
 <179100548183.3372253.2014593916926884551@iav.lv>
Date: Thu, 08 Oct 2026 00:05:50 +0300
Message-ID: <179140715034.293470.4459182430175564610@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_140637_299051_0C3AE4C7 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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

Follow-up to the dropped patch.

An out-of-tree restart handler [1] power-cycles the card: it drives
TFLASH_VDD and both tf_io lines low for 100 ms, then releases them and
the card is powered again. With the SPI flash erased, ODROID-HC4 boots
from SD after a warm reboot 5/5 on 6.18, 7.2 and 7.3-rc5. Without the
handler the boot stalls in the ROM or in U-Boot.

Where should this live upstream: the mmc core on restart, meson-gx-mmc,
or a board driver like this one?

[1] https://github.com/armbian/build/blob/main/patch/kernel/archive/meson64-7.3/meson64-reboot-02-port-to-gpiod.patch

--
Igor Velkov

