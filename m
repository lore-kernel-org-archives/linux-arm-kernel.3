Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FD6bznsu01iYGcm6ewJe4RuYE462CwiH5xGheRZGZw0=; b=1bQApw59+WQfUpY96iUV6IoT4K
	/LJaDILBXzaQLSSmBY6oEQnMhxjg7cKpYdpVgEinaRIPKEXzMXfhdV0x3+2vIFX2z7bReZDhG/Jg7
	6FgdTfIjarrNH+yWGPUCCPvC7GeanGjrfrYtmV6PwRWmk7WcgO8gXMWac/WCtG/yKNx/cA3FN1EVY
	mGtR9bPl4G6mtjHI8HwN7hWP3oiaX12tIFx/ukD0l6P70PWwSzSXpxHOUyJ5nxgdMULL+gOMP34G8
	XdkWvnNHw/nvHNHI+j3gua5MMWGNhr1BAfVFcA7Mjc5wgZMIcZNEVv4BNBBuqKvaszrYJuh5sufRF
	s4Z+GQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1h3-0000000DjaV-36qw;
	Fri, 14 Mar 2025 09:51:05 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1eR-0000000Divp-0zHU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:48:24 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30bee278c2aso31177911fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 02:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741945701; x=1742550501; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FD6bznsu01iYGcm6ewJe4RuYE462CwiH5xGheRZGZw0=;
        b=SCKVifL9SxPutjLrZoiBaYop3OzjCDzX+kPyhv0SwbMP2+Lx83Swf/SYMml3F4QKkG
         CythjQ0H8uK2TS28mlW9+dBzqELB6tCXWXNcC3Np77nHkPEogqR37n05h0X6kst9TC4M
         VfKAQE8Q/CqsQXJNOTv87qHbaNuQyieGCFzrX1BRM8RAqgG6Iw3nuYASB92doRIHPxQA
         Ab3QFH3qgEYVq59m95O0IMW7C5esYLA1+Hl1oW9Ja6/aDjRmqDOr7vBKv9JWG00eDoeG
         NzdMaCo+PoV0fTAxK79JFujQBzaiQ9foHMaAXXkOCj4swSCefc+MJBEMJJI1VXaPjTu5
         0/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945701; x=1742550501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FD6bznsu01iYGcm6ewJe4RuYE462CwiH5xGheRZGZw0=;
        b=q0LjuwFHMlP3DoUKc0sWh2op/Kh6b35gx82/sSfBVTjRP196/8JztRTpQ+sd5DTgDQ
         oez1PDryAqb245mytWkRybvAf6mKnQ5wBXuPaz3W6oFNl/WnEyQMNcvyKLkyDD/hncnT
         tklug52kG4wFSz8kyX3Ea8a0qWxyXtV5NezfakkcINKtx10xNNNklDwqkf9vvEKc6nBH
         h/6mZMV8+hLeWNiJ8g92AxxG6B/CfJVVCzihkoEj7ejAMiBld58sxJ6bdyB0CCyCpsbP
         b6rgCZzOts7Mi+GvPb/RNL1isHlm2AXtKEQW5Ls/qTh/ICI03oTPjXrPjh7aoGT8jgfb
         RHzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUX3sY2neDB9fkM8NsXIqeV0Xpomvj10RsZllU6sruWhm2ZfvBfz4/nqXZmXB312hVtMS6ERGCEfmAm8e093R7@lists.infradead.org
X-Gm-Message-State: AOJu0YyfgkRQZDCsjmrrsQTfq7dr9adox9oIZPmWRORvNdB5knhhRahS
	ZbDVLaLQVLFkjITgoIlCCyojCESiz6RdnsxtmP5wbfrTvnicgoqYgB41aSHImdFknoQUVBdsPm9
	dwpODE0k4Md4d0LR29Qz2l0vvsvQnm1c02+qwducYyjoKh5j9OPPWwe93jEs=
X-Gm-Gg: ASbGncsUgxwYH/vY+xPm1PaBRXBKs7yl0LMfZemtt9/+kc56vzS3B5bL5WlhlGWSt+Y
	aDKaymzJJzYX43ZWhiTUgLUTPDT6MtNcQvlagfZNslsGYzC8Aj1b2IXs37ZNIBKoa5iwRCNQHga
	U8QZGculACz+BT61PrEKsW4/OOTqZcZys=
X-Google-Smtp-Source: AGHT+IF+BXUJPCiL1c7sbvSs4gfqol1v20qox8jtJslAuMcy8M2YGJF8kQcGGVoAZtCirbS3VlFVKlXtncaYF36CYig=
X-Received: by 2002:a05:6512:ba8:b0:549:7145:5d2d with SMTP id
 2adb3069b0e04-549c3f97f37mr544029e87.16.1741945700612; Fri, 14 Mar 2025
 02:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <SJ1PR11MB61295DE21A1184AEE0786E25B9D22@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61295DE21A1184AEE0786E25B9D22@SJ1PR11MB6129.namprd11.prod.outlook.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Fri, 14 Mar 2025 17:48:09 +0800
X-Gm-Features: AQ5f1Jp8h2KQrj8cXSVVa65hkY1o46EVlIPZXIQrn2pTPHmKX_laXhYL3waLDDA
Message-ID: <CABQgh9HBqbJYnUqJzG+nOY=B8nQ-8Scy8i0ctszBm8rzpocNFw@mail.gmail.com>
Subject: Re: Regression on linux-next (next-20250312)
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
	"Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_024823_279333_44316372 
X-CRM114-Status: GOOD (  15.71  )
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

Hi, Borah

On Fri, 14 Mar 2025 at 17:18, Borah, Chaitanya Kumar
<chaitanya.kumar.borah@intel.com> wrote:
>
> Hello Robin,
>
> Hope you are doing well. I am Chaitanya from the linux graphics team in Intel.
>
> This mail is regarding a regression we are seeing in our CI runs[1] on linux-next repository.
>
> Since the version next-20250312 [2], we are seeing the following regression
>
> `````````````````````````````````````````````````````````````````````````````````
> <4>[    6.246790] reg-dummy reg-dummy: late IOMMU probe at driver bind, something fishy here!
> <4>[    6.246812] WARNING: CPU: 0 PID: 1 at drivers/iommu/iommu.c:449 __iommu_probe_device+0x140/0x570
> <4>[    6.246822] Modules linked in:
> <4>[    6.246830] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc6-next-20250312-next-20250312-g9fbcd7b32bf7+ #1
> <4>[    6.246838] Hardware name: Intel Corporation Arrow Lake Client Platform/MTL-S UDIMM 2DPC EVCRB, BIOS MTLSFWI1.R00.4400.D85.2410100007 10/10/2024
> <4>[    6.246847] RIP: 0010:__iommu_probe_device+0x140/0x570
> `````````````````````````````````````````````````````````````````````````````````
> Details log can be found in [3].
>
> After bisecting the tree, the following patch [4] seems to be the first "bad" commit
>
> `````````````````````````````````````````````````````````````````````````````````````````````````````````
> commit bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c
> Author: Robin Murphy mailto:robin.murphy@arm.com
> Date:   Fri Feb 28 15:46:33 2025 +0000
>
>     iommu: Get DT/ACPI parsing into the proper probe path
>
> `````````````````````````````````````````````````````````````````````````````````````````````````````````
>
> We also verified that if we revert the patch the issue is not seen.
>
> Could you please check why the patch causes this regression and provide a fix if necessary?

I just send one fix caused by this patch
Just FYI

[PATCH] PCI: declare quirk_huawei_pcie_sva as FIXUP_HEADER

"bcb81ac6ae3c iommu: Get DT/ACPI parsing into the proper probe path"
changes arm_smmu_probe_device sequence.

From
pci_bus_add_device(virtfn)
-> pci_fixup_device(pci_fixup_final, dev)
-> arm_smmu_probe_device

To
pci_device_add(virtfn, virtfn->bus)
-> pci_fixup_device(pci_fixup_header, dev)
-> arm_smmu_probe_device

So declare the fixup as pci_fixup_header to take effect
before arm_smmu_probe_device.

If your system has fixup, it may need a change '
from
DECLARE_PCI_FIXUP_FINAL
to
DECLARE_PCI_FIXUP_HEADER

Thanks


>
> Thank you.
>
> Regards
>
> Chaitanya
>
> [1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
> [2] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250312
> [3] https://intel-gfx-ci.01.org/tree/linux-next/next-20250312/bat-arls-6/boot0.txt
> [4] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250312&id=bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c
>
>

