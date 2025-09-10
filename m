Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD08CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tEnPsq6WeNaBYItOCrP3jZ8pp3FBK2CatmwjghkD9/E=; b=zG/485J+NIeWilFJXASz6qNto5
	rXYCineK2YjykdqU9CSn2+jFvuQfSTv8kcN0gD33TqzX0c60rcPpzxzvN9eqavUM9J5Tcsi5T5jhG
	bQFhawRQ8T+UVq9dqdz50BWhp9t32CNcLUzTIkOISmuhWsU6vm92XOnJB8ZYSe6K9wgnBI78BsJF3
	6WRlua7USGL6EGzyFY3q/erupNTtP8HhSJhgnXdJVZvMPpoSECt+Jt3OiAKtsb4fxjQMk6f6b9chx
	2R+tdIelWhNh1EZU64fwrw765sMBSTOuR1QXjDf53cWj5oCTbPlwTxmcmD9s04q6s6WNHoA4+clhh
	Jzek+7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMNP-0000000ExLo-1o6d;
	Wed, 10 Sep 2025 15:04:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMNM-0000000ExKM-4ADi;
	Wed, 10 Sep 2025 15:04:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45df09c7128so7194585e9.1;
        Wed, 10 Sep 2025 08:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757516687; x=1758121487; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEnPsq6WeNaBYItOCrP3jZ8pp3FBK2CatmwjghkD9/E=;
        b=noc9jfH+3eBXyZ4GzblOSGatquKQjvq3T+Sx7jiRFNhUoHlsKXDz3hxw0iOKWPaEWJ
         VorPsrab/KbHNo7S37l9/G1Fy4Wx2zQ8xBje5gtOT9cRXgf3ZcvZtWQ2JLO0Xfz1wkgt
         RtYkv2Jf9CxLDMGoxA8iYQo4OjobvDbnhXvtEaTeiMZ+9frNcTTV91+9I+AuWEcFr2MZ
         RlNH+jeykh6FRVXbe6LoNBgWSmcyuoT8pkNqSSAH02j83pu4HR65KWEUdfcz9XMgjwDh
         UoLfC107B3vUqtYaUotyLsnDkGQPOzBduKhPqvX/PmJPzyItEY1EGr5DxYIAWsMEDCil
         DqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516687; x=1758121487;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEnPsq6WeNaBYItOCrP3jZ8pp3FBK2CatmwjghkD9/E=;
        b=CLYInbJK+DMImhMDCM7MK06nOkRRWD3nnf7FIhj8DD2PW6LMlQBKiwRyEJpBB9ZuGV
         nHNR/A0RMs9p5QxEuY+wd9qQnNdyfOAoAjeVzMu0RFO5L0+LE5xe5Eddv5bs/Ma9+xof
         i1OyHqY4QvqVyhty5URYGwzINT2HrJAwbEbVIcieqmWJVI1CrVnbb9B5hnnqgCK8hQVf
         5+rpNbALa2AayQvluGiKN9NiJdhrwQrSW2x1Vfue1gdDWRNxXWRZDNvUDiTRGGsRAkbV
         2Bw78yA/17LWPi4L9F3j0/RnLCDVK9cEg+FD3ps/3SHMOI7gT7zkQS2SjXoVC2Od/r/+
         6YEw==
X-Forwarded-Encrypted: i=1; AJvYcCVRWvgf2c4QyKRqJ2bbuMIXtZPSI8DkGGbK6lPDKEoGsc/6tOgSdaAcpJAgUmrz+/Csj0FpUnX0EsxLGZAn6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgN8GrA000/qyRZaih7Py8xEBUKk1GnEr53HXEEtc8RmlRg9ry
	z40/mkGW4hbFCkEMr9MIXFdxyYiBHzZ74rpfY5VcJ3hE9nCBW2xymtJBB5gs0Q==
X-Gm-Gg: ASbGncsMd4Srn+VS15efNYwHGfc5LzBm3+CkPL2tuDM+1nBctNtsRtrjYIRtq6GVZMw
	HtoEgnEIZHuZpJoRVuiAZQVgxDFQjvLac1+yCzBD7sBAW6voXnIexSziSb+WxHo5Dz34b1zLyYQ
	Y6T85jw0HGEYuESqo3TCf+pF74m9APuOUMbZItGYdetVZ4B/BkDdEienj6B3cq3zj8KnrTDgxyf
	4s1LlnxAPVCXiv/0gKmEODSgJCJxu1XbBd/a42MDb48QrVHgtqdfgPZUfIYaqY96Kdnlz8x4uyl
	jdUXblONyTJ98QtCZW3EHbnQj1D2J8NKXl2SyWZ/VFegEeIaeW8ohIPher+dNqi3SwsuZP8hvPy
	CfMDzcT6xeiwc8+6TFF/LpbD71zNONESWPcLSR5YmA1DEyXTv82voACOlJLvoHQUoSwIsmCVpmC
	f25l1MrEM=
X-Google-Smtp-Source: AGHT+IFfRJaTgK+cpWWQ0yHfzQUrcxQc9YgGZ9tJUoJhEOdSGaPaKa9gYD0xqPDRW9QLUVmmDBVPcA==
X-Received: by 2002:a05:600c:4e47:b0:45d:dbf0:4831 with SMTP id 5b1f17b1804b1-45de0dde9c7mr149545905e9.0.1757516685887;
        Wed, 10 Sep 2025 08:04:45 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223885csm7116646f8f.36.2025.09.10.08.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 08:04:44 -0700 (PDT)
Message-ID: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
Date: Wed, 10 Sep 2025 17:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_080449_086044_65BB0FB9 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi Arnd,

can you please have a look on the following patches.

Thanks a lot,
Matthias

---
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.17-next-dts64

for you to fetch changes up to 12a565af705542c4380e95f4e3a505a2c25ad754:

   dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:16 +0200)

----------------------------------------------------------------
mt7988 (bpi r4):
* enable network

mt7986:
* add dedicated sram node
* add interrupts for RSS to ethernet

mt7981:
* add thermal sensor and auxadc nodes

mt8395 (NIO 12L):
* enable UFS
* add gpio keys to the PMIC

mt8195:
* drop reset for PCIe device

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
       arm64: dts: mediatek: add thermal sensor support on mt7981

Frank Wunderlich (7):
       arm64: dts: mediatek: mt7986: add sram node
       arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt names
       arm64: dts: mediatek: mt7988: add basic ethernet-nodes
       arm64: dts: mediatek: mt7988: add switch node
       arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
       arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
       arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds

Guoqing Jiang (1):
       arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0

Julien Massot (2):
       arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
       arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support

Mateusz Koza (2):
       dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
       dt-bindings: arm: mediatek: Add grinn,genio-510-sbc

Rob Herring (Arm) (1):
       arm64: dts: mediatek: mt8183: Fix out of range pull values

  .../devicetree/bindings/arm/mediatek.yaml          |   2 +
  arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  31 ++-
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  20 +-
  .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |  11 +
  .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
  .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 +++++++
  arch/arm64/boot/dts/mediatek/mt7988a.dtsi          | 285 ++++++++++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  14 +-
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  14 +-
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   3 -
  .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  46 ++++
  11 files changed, 508 insertions(+), 23 deletions(-)

