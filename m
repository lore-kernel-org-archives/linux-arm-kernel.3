Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8DDC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiWm+JkA0WFLQavBGxgJxiDDHRCBaxXFyxmdg7dNgng=; b=0x6KHOUNfbjMSN0mZf3QRE8aS6
	uvJgdrBOMnDdO9C6AUxuEOmHSwrQ66yein29P32KUn6rMgQ4XAZQLByBQrXWliYVfnWT6DvjFgJ0e
	2EKozoTI7EaOcMHM6e5gMISSIVMrCG74gocvon7te6uJpa8kW1SuwTmgX/CdK09YFMipks4djyZHR
	1p7EkSXsNkdCbjBSIRrllE5YmBy6HwQHbJvjUkS2hXgrHqra71Z7rjoF+G4de/AvPb1zRuFhR5KaE
	c7+uNyPIOp1aRLLFU31Oy5KEtfw3TgXXa3oPhDN5Qzg0sGHaSR0SoRuobLEkkhJfVaQb+AtQko2jb
	ZHD7LQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6Ih-00000006LrH-05QZ;
	Tue, 25 Mar 2025 15:34:47 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6Gy-00000006LbE-16VH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:33:01 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so813060966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 08:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742916777; x=1743521577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiWm+JkA0WFLQavBGxgJxiDDHRCBaxXFyxmdg7dNgng=;
        b=trgr+BXJ+2W0NHfkHVZrJbCEEWinj6CHqqOy0QBn7qSCMHiWMgMFa5jexozJdhzSME
         8UfSnk3/bjP0hNXCSKjfKy78HaPC58SBtxyR1gxLVFl+5CC2E06UOFKhHGlI/2R7WiEb
         b5iDjGDElFWLHPc8I+yU49auSZj20B+aJXzkCIXRf7UqhM2Ek5rZ9OGKEYdB+j92BDwn
         0zFkPtse+W5kbBxE09t3ehOjXN70beAM/GP7nhILfk2uUStNA7y2pkM5SBUwM2JYDEw/
         6J2FvAEldTrfSWrJgsGz6ohBdGkfehpm+keVxvyyHrKuwKFfOCTH44bp98IBAOtd0egs
         +rdA==
X-Forwarded-Encrypted: i=1; AJvYcCU1lVQsuQzFHZcv13l3CxxW+QmsFt9bZe2PgBaKQtkAhmPZZ9PI2nelu+eCa4CQVOnxChwpiutEet6mUwriVp/0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vllZfBeZTLn9xBwFhOxQSAnVe6JFyzcEUJwPS+MiDTFW9VQO
	Ny11P4H3YEYthu+KVnjfT9IW3452HYM6CfUX4YYw3IkF456ebnnZ8yNuNfbtVGA=
X-Gm-Gg: ASbGnct2K/XRzv+H46IOJsgSw0Jcn04LrdLokDjq/jcyN5ZByn+2bUIQFtS/T+dIiIF
	H9Lj5YDFstJjP6i9kXkksKoLJN4fLz547E7XLMGUZInvQN0IpdsghxtcxtqVsubFH1yUY4MjRpV
	2+bTqeH/ap6JWeyDkWfxq00rkU8HGqL4HtnfwdDB/RFEBd0PfxVIU1G4hhvrRYjNPbiE6bSwPdH
	wGGqNhJqCtLPoCz0A0Rw7Z2IEHCTCVkG49utTAYxZ8Nvu4LVhW6YwMIhN1AppRV04lCL5Ydyitx
	M4aH6mDdZxFQ297t0IuH0i5hkrCgle7oKE2csejOA31vEam+Z+IqQurI+CCwAR9roUCdGMhest/
	DhjWYEas=
X-Google-Smtp-Source: AGHT+IFVQn/WEl6eOLNFUTmT24ax1fONJIOro5n4YVZvAm9jwZ2nZTD5uxLcWRCT6MX5f64fhyGooA==
X-Received: by 2002:a17:907:a08a:b0:ac3:8aa5:53f6 with SMTP id a640c23a62f3a-ac3f24d825bmr1589314566b.24.1742916776743;
        Tue, 25 Mar 2025 08:32:56 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3ee9sm887536666b.67.2025.03.25.08.32.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 08:32:56 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso7581791a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 08:32:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSq5WFJYoYbsEp2pQ13Cb6Vb8bfKRnumSsCMQKTMlzXjw4cgk4CPYISA2C5e7aLu9VE1yINWyJKRsldJnKiWkF@lists.infradead.org
X-Received: by 2002:a17:907:9494:b0:ac1:de84:dec0 with SMTP id
 a640c23a62f3a-ac3f24ed6c4mr1547143566b.26.1742916775525; Tue, 25 Mar 2025
 08:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1740753261.git.robin.murphy@arm.com> <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com> <25bd5477-a388-405f-a976-6b1a59860ef8@arm.com>
In-Reply-To: <25bd5477-a388-405f-a976-6b1a59860ef8@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Mar 2025 16:32:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXt9gQxBSVrWw1VSji+faxga4Vo_NRie27K=EtdUMMa_Q@mail.gmail.com>
X-Gm-Features: AQ5f1JoGJs3g1Wq6ZLZNBkuvqix5EpionY5Jl_k8v4NSQBsoSN9WndnQ0FJE0b0
Message-ID: <CAMuHMdXt9gQxBSVrWw1VSji+faxga4Vo_NRie27K=EtdUMMa_Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe path
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	Charan Teja Kalla <quic_charante@quicinc.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_083300_303710_E40F4D0C 
X-CRM114-Status: GOOD (  30.69  )
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

Hi Robin,

On Tue, 18 Mar 2025 at 18:24, Robin Murphy <robin.murphy@arm.com> wrote:
> On 18/03/2025 4:37 pm, Geert Uytterhoeven wrote:
> [...]
> > Thanks for your patch, which is now commit bcb81ac6ae3c2ef9 ("iommu:
> > Get DT/ACPI parsing into the proper probe path") in iommu/next.
> >
> > This patch triggers two issues on R-Car Gen3 platforms:
> >
> > 1. I am seeing a warning on Renesas Salvator-XS with R-Car M3N
> > (but not on the similar board with R-Car H3), and only for SATA[1].
> > Unfortunately commit 73d2f10957f517e5 ("iommu: Don't warn prematurely
> > about dodgy probes") does not help:
> [...]
> >      Call trace:
> >       __iommu_probe_device+0x208/0x38c (P)
> >       iommu_probe_device+0x34/0x74
> >       of_iommu_configure+0x128/0x200
> >       of_dma_configure_id+0xdc/0x1d4
> >       platform_dma_configure+0x48/0x6c
> >       really_probe+0xf0/0x260
> >       __driver_probe_device+0xec/0x104
> >       driver_probe_device+0x3c/0xc0
>
> Hurrah, this is the warning doing the correct job - something *is* off
> if we're now getting here without the IOMMU configuration being done
> already (for a normal device with no other funny business going on).
>
> > 2. The IOMMU driver's iommu_ops.of_xlate() callback is called about
> > three times as much as before:
>
> That would suggest that the fwspec gets set up OK, then something later
> in the __iommu_probe_device() path fails and tears it down again, so the
> next attempt starts from scratch. Do you see the "Cannot attach to
> IPMMU" message firing?

I do not see such messages.

> And similarly to the Rockchip case, does the
> below help?

The below is basically the same as your "[PATCH] iommu/ipmmu-vmsa:
Register in a sensible order"[1].  While that fixes my first issue,
it does not fix the second (harmless?) issue.

Note that I only noticed the second issue because I have local debug
code in soc_device_match().  Perhaps it happens, unnoticed, on other
systems too?

Thanks!

[1] https://lore.kernel.org/53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

