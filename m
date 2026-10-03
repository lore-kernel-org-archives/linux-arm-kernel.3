Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C958CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 06:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JQa/E1lnnOrXkIShXybWfk0cHsmxc1amWRIMUAaLxo=; b=ktr3rCXEZyxTA21Lzr0q2UEMZj
	unCLnhPvJ0AeVfvvn0B1ISn/X0gCR0pp8N+xs45ntus76uzw48EFSYVnUhKcQWiIj81klV3U9fPOe
	4bixmPP9BfMJPGNjCRIrSgA885zTQqq9BXB/44ZS9OW7ClSakpe/7hWDAH6rE3MKWMpnKtnkNCxUI
	WGnAKTOHLueHwao6oy7aPfZzCIfguhhfaG1d/NMsss8beWgWYV232/1sl/6S863jDwf6CsJ4SsEaM
	kXVprjZcf8B0rsH4I4uTb0Avw154rzqNGoRgrivunxx7teaxqmMuXNCayh24Oj16RLEoX3s1T5KF3
	GIElNPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCt5d-0000000D5JR-1Orz;
	Sat, 03 Oct 2026 06:19:21 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCt5b-0000000D5J5-03NR;
	Sat, 03 Oct 2026 06:19:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791005524; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=XMD02msfBzu3lk7YxpQ/2gFieTVQMdqjS+jiAhUHtFQWI34FEXMmQeFq4nybWYye07lRHwVwgtnYFclgrHlqwby0iCLU3H0L+jToYeVSUSJMGa6Y1ypBztblunnoZR28Yy/0St9QF4Fw56wDybt61f1S1C8ILIH0C16HVmFapzk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791005524; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+JQa/E1lnnOrXkIShXybWfk0cHsmxc1amWRIMUAaLxo=; 
	b=lR1EHWTzTeV7IU2Z7pz08bIfHhxExhBBlgyyygX7AM1iGTp2fGQ0efMDMDajg6OUJospmG3jU9LhRZ20WgKFoQkrUfHR++7TMCl2XRWleDYH8a5m9nv9UKa7GR7EqMLMfJmmuE9GYu6tfT5ht23043wty+A0HIWMw89VprFCm8k=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791005524;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=+JQa/E1lnnOrXkIShXybWfk0cHsmxc1amWRIMUAaLxo=;
	b=I598eWbhyEZ8j+5Ye1iPv+yAC8bH2lRnI5iVytv6b+5x7feSiHoilehd+jYWknwG
	BcdNgzqBDgYBDtXbdd09yDfky2cZUCxEu7vvnMqWcs1BkPJzU9W44Yhn7YTLfyzgaxh
	NStvMPLaJCeI8aNv3vHXXMf9uLbAp46kUlMRrVBo=
Received: by smtp.zoho.eu with SMTPS id 1791005521533518.5421443074531;
	Sat, 3 Oct 2026 07:32:01 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>,
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
In-Reply-To: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
Date: Sat, 03 Oct 2026 08:31:21 +0300
Message-ID: <179100548183.3372253.2014593916926884551@iav.lv>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_231919_346770_8962DA70 
X-CRM114-Status: UNSURE (   4.80  )
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

Please drop this patch. With the SPI flash erased, so that the boot ROM
loads U-Boot from the SD card, a warm reboot with this change fails 2/2
(the ROM loops on SD:800); compare dc7f2cb218b5 for ODROID-N2. The
4/4 reboots I tested went through U-Boot in SPI flash, which powers the
card itself.

--
Igor Velkov

