Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953B6CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9NWfNLMXfGmHPrhiqbEiqJKeYZj3TN2WzPDL/gZWhI=; b=hn+YvP3YZixZE+2iXr+dxtySMw
	7SJHCBRRX/ozy24qc0RVDg0U/UG/6dpIUNS9RdfNvKd8JL1L1i/NFX5QSFzbupU0tWKQ1yZDToKWT
	iNeDnIL3uyR+nAAGP0lPhk5D7sgpINXwtcOHYHhaS+jx0NgUhVMEajaKubXTlAqHpTKW5erxSzJ1J
	3hdjXWD1kPcFBqjImL44Q6CIfUrT+0lpfhpPOSssTpswWhL7WR6AfYI22FaiU6cg6TqXMannDB7P2
	bPhJfshuelfDW6Prvi4PPcaskceR/8YrEo52saz1DmSCXbu4ftEB+KfYch7+E+pXVvBDix4OTId0h
	KXAhMtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSov-000000006mv-1Zbw;
	Sun, 18 Jan 2026 13:27:57 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSor-000000006k9-380Q;
	Sun, 18 Jan 2026 13:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=j9NWfNLMXfGmHPrhiqbEiqJKeYZj3TN2WzPDL/gZWhI=;
	b=YrYP8roGqofgIqAVcaNc940Qub9UHHLMiANIrDKfmbiUMqFshjCXo3/Medm7Td
	y7kWOIYVzjIUkgfbE4gXUTVDFDaKEgFuitq+lyWf8YQkeWrznysDRaInK2paKuIH
	D9XNUmIqDsXRkjNgOa2ZFFZsdmT5D4AL8e5dZmqCrwyl4=
Received: from [IPV6:240e:b8f:927e:1000:e94b:3b22:e2ce:7986] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnuOCV32xpJgqjLw--.141S2;
	Sun, 18 Jan 2026 21:26:48 +0800 (CST)
Message-ID: <1ff0d069-14f0-439a-afca-4ecc1b569834@163.com>
Date: Sun, 18 Jan 2026 21:26:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
To: Ricardo Pardini <ricardo@pardini.net>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, bhelgaas@google.com, helgaas@kernel.org,
 heiko@sntech.de, mani@kernel.org, yue.wang@Amlogic.com
Cc: pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, cassel@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20251127170908.14850-1-18255117159@163.com>
 <f5322597-c6dd-494a-863b-2caf24363f2d@pardini.net>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <f5322597-c6dd-494a-863b-2caf24363f2d@pardini.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDnuOCV32xpJgqjLw--.141S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1UAr48WFyktF4rtr13Jwb_yoW5Xr18pF
	WYganIyFs3GFyfC34qqw4kCFW5Za4kKF43GryvqwnxJan8uF1DWFy8tws5twnFgrn3A3WS
	vF1qg3WxZwn0vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxPEhUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:e94b:3b22:e2ce:7986]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxiTN2ls35hqSAAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_052754_440160_A75C0691 
X-CRM114-Status: GOOD (  14.02  )
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



On 2025/12/31 10:58, Ricardo Pardini wrote:
> On 27/11/2025 18:09, Hans Zhang wrote:
>> Current PCIe initialization exhibits a key optimization gap: Root Ports
>> may operate with non-optimal Maximum Payload Size (MPS) settings. While
>> downstream device configuration is handled during bus enumeration, Root
>> Port MPS values inherited from firmware or hardware defaults often fail
>> to utilize the full capabilities supported by controller hardware. This
>> results in suboptimal data transfer efficiency throughout the PCIe
>> hierarchy.
>>
>> This patch series addresses this by:
>>
>> 1. Core PCI enhancement (Patch 1):
>> - Proactively configures Root Port MPS during host controller probing
>> - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
>> - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
>>    and not in PCIE_BUS_PEER2PEER mode (which requires default 128 bytes)
>> - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
>> - Preserves standard MPS negotiation during downstream enumeration
>>
>> 2. Driver cleanup (Patch 2):
>> - Removes redundant MPS configuration from Meson PCIe controller driver
>> - Functionality is now centralized in PCI core
>> - Simplifies driver maintenance long-term
>>
>> ---
>> Changes in v7:
>> - Exclude PCIE_BUS_PEER2PEER mode from Root Port MPS configuration
>> - Remove redundant check for upstream bridge (Root Ports don't have one)
>> - Improve commit message and code comments as per Bjorn.
> Hi Hans,
> 
> I've tested on an Odroid-HC4 with a SATA SSD (via an ASM1061) by 
> applying your v7 on v6.19-rc3 + Bjorn's 20251103221930.1831376-1- 
> helgaas@kernel.org ("PCI: meson: Remove meson_pcie_link_up() timeout, 
> message, speed check" which is required to get the meson PCIe to work at 
> all since 6.18). With that setup I get:
> 
> # hdparm --direct -t /dev/sda
>   Timing O_DIRECT disk reads: 832 MB in  3.00 seconds = 277.33 MB/sec
> 
> I've an identical machine, with a similar disk (even slightly faster, on 
> paper), running plain 6.12.y and there I get:
> 
> # hdparm --direct -t /dev/sda
>   Timing O_DIRECT disk reads: 764 MB in  3.00 seconds = 254.26 MB/sec
> 
> I repeated those a few times, not very scientific, I know; but anyway:
> 
> Tested-by: Ricardo Pardini <ricardo@pardini.net> # on Odroid-HC4
> 
> I've also feedback from another user running with this series with 
> success on a different meson PCIe machine, will ask them to TB as well; 
> they had reported a significant drop in performance since v6.18 without 
> this.
Hi,

Thank you very much for your test. Let's wait for Bjorn's reply.

Best regards,
Hans

> 
> Thanks,
> Ricardo


