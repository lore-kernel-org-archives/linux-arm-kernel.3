Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9027DEE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUfeQsuPis8+vWGa7ve6iy4exkmxdmo6Yqgm4mr4Xz0=; b=T0CvGf6IudRxL8UiegMroDccGQ
	Z9LBZ0/US8B1WVo4CyzJtpat1jPigxqsn5qGdO6HCfwSIM/iKdGnon/NMJ//LFBTc3kdwcU4zNfa6
	e3uxSkW+w8grr3hP1uIr1jH0v/o0MeI3aBuOvtiGMdNjqqOxq7ba6j2YrGiPRniMc4bmOvEvP72Fs
	Uy4KGr705gu7nbpO5gKupo3mtS4tJ9vnpq0rcCVrQZD5jUswRb2OM/9yBpPAAnMAmMBmiK0JgYke7
	goGQQZobAuaB7ZOftk2EgLG8hX6bP3cy0AZj2L1tEtNvQVhdcCnHp6X1b5FFYICth9zil7CWoVERh
	72EV8JEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamQ3-00000005c0L-2q6v;
	Wed, 31 Dec 2025 02:58:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamQ1-00000005bzD-1let
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:58:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so2314911066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1767149915; x=1767754715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUfeQsuPis8+vWGa7ve6iy4exkmxdmo6Yqgm4mr4Xz0=;
        b=LlT6CWKClfTbZVMbCUtMWgC7EhoQ/Mq4/hgNC1SjIo1CcONWDeHlv38HBe2iUimiie
         q0iVDIge7dzINg3UflSwzmBigXjjjaLqnZgdIP0VHGmxzFE7WaXjyF7gHDjoaNgc4r1T
         ZFsaPQFHV8Lh6cjQERoQuyLRXVzui5Lxixl2xnggANp8hBOHk12neJg0eiOouwLxWXhn
         mC9Z218iV4ibWd6+cVLa2ckV2OJ+Z55yzugNQlGJSYwIQo8GcZDawUNUhdt/OkxuueTV
         CYVYLX/gIVPYz+oO8OtEiMV9a8NwbKvGtBgy/DSNK5+hoop244ZlbnGtkrgtkywkAzdL
         BUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149915; x=1767754715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUfeQsuPis8+vWGa7ve6iy4exkmxdmo6Yqgm4mr4Xz0=;
        b=D5XJDkNiyU31b3VHRsa/hbTfQCb/DwXPyOEPpKU3Mum/REPLphwM9YoaOKNdab7z0M
         9Axx2rKU7oVNDFVgBfK2cbZ40MRuVF/6ZrApq78qZjgvQ5lbMZ2f9PrR4MwXeB92wEdG
         ELX+GF9glMvdpp402eZyn0uKUJGncceu+CK6TmwNI3Zsi3DjIEW3YBVIIZNH/KwuWE69
         0SjcDFGKnHTsSBbH7uUVhctzkoQJiBjkB8//IITYfWD29u4xCSktTyQmz34dApiN9SW2
         F4mR+J4NRXRfwvuq/dt8Zec8IHVUscwfKJCOa7yQVBcmz/ljEWrZ8p7iW+vJpQr2iEtr
         KpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4973xqxlpgJ0dIXMkt2ibYYPggZUi/OooaSGqBwhBcd8NzG1sK8JE2hy/9EZSE8SwUl6WvpyNQaHJVHZtXl65@lists.infradead.org
X-Gm-Message-State: AOJu0YzHvIv53yq2s4cbX2Isl0KeuhqZZud9NsOPIoAXNPwYeZ3lUwOI
	RVAyhPousP+RSt8n78qTCyh4j/hm0sRD3zGUYmLVbAnTCxZm7j+1SLZ+N+URDyO+kA==
X-Gm-Gg: AY/fxX6IKxafqlqiPT69IPdTh7B3kW4FlugZUZ4s8I0V7FE/39MVD4lbU4SceQBvnIf
	oXAf/C3uS0oL6igzDiIYgSD49Fr+lVs+4UPqGBOLyaEL9/45gCkikx3HwLDe73X3BoJYUYcq4Ir
	cQfgKhe5t6/h97qPOOptxiO3WltZEunc7B7glyERDKi+S25yIyJrol1vM1986gYkjCwirJYy91/
	vZu4esdSQrq9fgYxV2ILd5stFW4md5MAF01BNN7L1Y3EtxcTLNgXZ1ARY3J5PG+mQemZFkj0SQq
	IqotNatn3+eIVJPhVznEorGnNWwVFFH4+XmQ88NUY2bQF6rsv/9cd5orwa7U+liFbhd4/O0y1u4
	lsUDt+n7L8nC6WPQNzNDa4zyJXbgvonf/z7QeL5oI6hei/SNZfjIJ7xhtFOo5nyJ0v16s1Ea7vc
	Jfuxr1PFIWbhWqkwBIDP8FPtzr6OH7x0TJnH11QjGxNOdnFTCdlohJYXb3V16T2F3DaYKiYZley
	UVxjuhlr085XAQ9cAJB3hu6UOt7FMhKPJ2hnGfRttMlAlt5j2Br4GwOow==
X-Google-Smtp-Source: AGHT+IGGCF0sHMt1+YYCpeAxQN9Ovdj+s2AiArjZinsNakQ8z+N2JPpr7xnF8T/yZnTmh07agmcy1w==
X-Received: by 2002:a17:907:1b15:b0:b73:9792:918b with SMTP id a640c23a62f3a-b8036f5fcf3mr4070078066b.27.1767149915064;
        Tue, 30 Dec 2025 18:58:35 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:49c0:3675:3f69:8ee2? (2a02-a466-4d7a-0-49c0-3675-3f69-8ee2.fixed6.kpn.net. [2a02:a466:4d7a:0:49c0:3675:3f69:8ee2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b83926533b7sm450609966b.20.2025.12.30.18.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 18:58:34 -0800 (PST)
Message-ID: <f5322597-c6dd-494a-863b-2caf24363f2d@pardini.net>
Date: Wed, 31 Dec 2025 03:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, bhelgaas@google.com, helgaas@kernel.org,
 heiko@sntech.de, mani@kernel.org, yue.wang@Amlogic.com
Cc: pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, cassel@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20251127170908.14850-1-18255117159@163.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20251127170908.14850-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185837_500875_4B1C0B12 
X-CRM114-Status: GOOD (  12.61  )
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

On 27/11/2025 18:09, Hans Zhang wrote:
> Current PCIe initialization exhibits a key optimization gap: Root Ports
> may operate with non-optimal Maximum Payload Size (MPS) settings. While
> downstream device configuration is handled during bus enumeration, Root
> Port MPS values inherited from firmware or hardware defaults often fail
> to utilize the full capabilities supported by controller hardware. This
> results in suboptimal data transfer efficiency throughout the PCIe
> hierarchy.
> 
> This patch series addresses this by:
> 
> 1. Core PCI enhancement (Patch 1):
> - Proactively configures Root Port MPS during host controller probing
> - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
> - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF unset)
>    and not in PCIE_BUS_PEER2PEER mode (which requires default 128 bytes)
> - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
> - Preserves standard MPS negotiation during downstream enumeration
> 
> 2. Driver cleanup (Patch 2):
> - Removes redundant MPS configuration from Meson PCIe controller driver
> - Functionality is now centralized in PCI core
> - Simplifies driver maintenance long-term
> 
> ---
> Changes in v7:
> - Exclude PCIE_BUS_PEER2PEER mode from Root Port MPS configuration
> - Remove redundant check for upstream bridge (Root Ports don't have one)
> - Improve commit message and code comments as per Bjorn.
Hi Hans,

I've tested on an Odroid-HC4 with a SATA SSD (via an ASM1061) by 
applying your v7 on v6.19-rc3 + Bjorn's 
20251103221930.1831376-1-helgaas@kernel.org ("PCI: meson: Remove 
meson_pcie_link_up() timeout, message, speed check" which is required to 
get the meson PCIe to work at all since 6.18). With that setup I get:

# hdparm --direct -t /dev/sda
  Timing O_DIRECT disk reads: 832 MB in  3.00 seconds = 277.33 MB/sec

I've an identical machine, with a similar disk (even slightly faster, on 
paper), running plain 6.12.y and there I get:

# hdparm --direct -t /dev/sda
  Timing O_DIRECT disk reads: 764 MB in  3.00 seconds = 254.26 MB/sec

I repeated those a few times, not very scientific, I know; but anyway:

Tested-by: Ricardo Pardini <ricardo@pardini.net> # on Odroid-HC4

I've also feedback from another user running with this series with 
success on a different meson PCIe machine, will ask them to TB as well; 
they had reported a significant drop in performance since v6.18 without 
this.

Thanks,
Ricardo

