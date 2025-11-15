Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52530CEB2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wE07oQibqqeqSQy9mXIzB1NU0J0tg0hcvxGPotz1NFE=; b=2hDzLePNUYi/aYZYUB637oFolD
	Zs4Xo1HMp5Qo9xta15BFZinLEYvD9bJNteG5IKTM6EAygHIgLMi8521Pw3NWVOsCsmP6144P0Chu0
	XktoqZPGq//sKSLghSzeBpej7/HecOigTq0iUSPMLy49xMjOXzzaEgKKgWBrgVjltK3xYewmnOSBg
	63MBAiaws0TepWxgGvbz8EEN/WiJSN3BbVWwpfa5lLFkWxSG6GEWdJUhncsX0qOCr+oQRo00JEcrF
	c+zTyviBcOUsMM0do1GV9mwXn/KDQimu7osu5NHgxByFwiY0fs9LQvcg/nSuU4DKQWl91HZnH9Z6T
	RGTB0nsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCuf-0000000DfJT-1bIp;
	Sat, 15 Nov 2025 09:49:45 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCuc-0000000DfIk-0uVK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:49:44 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so2463339b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763200181; x=1763804981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wE07oQibqqeqSQy9mXIzB1NU0J0tg0hcvxGPotz1NFE=;
        b=OG5NqslJexqkXHosBHQPsYWOpBrWhVzFJ6Eh+B99sn2gQByBg/IlYO3zXcYA75Uu8u
         wqBCE2DKccizY2sTj+TZAzmIOpidYvO10vg4i83R0dagJbgYST5evPGpEMPl98QCmo0Q
         aajEkRtpyr2nf5Ux+l4yreVZL9vfGuZXCKiPBRvJqpprunnNWrhqywdigTSkBSZeMTc6
         iWG8b7mZ6qOwdfuele4yfNHY1Uf8eDW4MVuZ0XOPEckvVTHbK7Dw8sgct77CTfrytubE
         Zri+KBglqpdxILQmM/w14kQzqHHHTtyr3tTUsks9om+mTeYCaHeE43NM9JZ8HEYluUS4
         BBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763200181; x=1763804981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE07oQibqqeqSQy9mXIzB1NU0J0tg0hcvxGPotz1NFE=;
        b=Fgk8pS7gsNqjEIsAkOvHVQjn/9m+90Ti+3LK3VqKHHzCSEFkwVX5xre2WOsHqNgP3h
         CUCap1qJT87i4DDLMyJAjV2odvQJ1wj2pjt5Ymg5u8dqTxlri3mKFXQfv6y4aApSxPcA
         ey44DYI+3pXQqjn2CNAy9m6L5Zpctc5+VfxbjZGP8ZkASNkQpLOXg2aiIEJ1TBT1k7Xf
         Cw0A00uANfnsxx9axpEHMP3X+nl9iZJpuYQ2sKpizcpG62oqt6brIYeyvPLuxNhwr1xs
         uph0UuburfvkeabiU5FkTBvhbBUzIFhrqYc6ZNwRz6CKapyR+UCmso61dDhUQsyKmKXW
         ij0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWILWSU6zupOXYAzwQXgLkLzc4fhfq/GSp+jgTb0c85bmIbnxoJFoDGRV0RpUAPWHXpSH2+1cKQ0vT489hE8NF2@lists.infradead.org
X-Gm-Message-State: AOJu0YxBmmn6qI5PcqKGWAFyZAD3wKAO0LXxgbvlCtpWTS/6ZiVCf6Tb
	Xmvz3TFZUFQK5WWEX8cNHiPcs0h3mkkLsn4y3uUBfqxWeBq58JWXT8iR
X-Gm-Gg: ASbGncuvrZJAA+s86x0TwG4sAYEjjnkzZi9ZhN2bi9NowOsSrIHIkf4qIVg0sPSM/k5
	YuHN44E06gtqxlnBRiaLT8TphFa0L6A1oBzp+XRtRbc5Z0xL8UWGjMuMIFvCuBZZehxkdoqJY9m
	MI19Q43Ru/NZoBQvf2L1YNr7n7WlNESTX18FElnZ9FU6ksG/NKy2lvuZUDioW25T5Gs5Fsi1uqc
	9oq+d5jamhXQAJftl3aMiJiyihPPOJRoYCYzHlBIq0DptxNmq4jWgohcmTiKlneypXGgtFLwDmt
	P/jl61kRm9qUIYqwd+I+e/kjwRvBZAnIaed7gCONvP2dgQ4Pq/NQ1z61yh5vF7zN/WA8p4zlt7T
	0Nn8YphkzNZHdq4QiXJjHWFdIgGXLeX1yK4gjpArlwe/nCab99UVA60ZCfXcgVsxjlGcSYzzt0w
	==
X-Google-Smtp-Source: AGHT+IH17OP8J1VVJXCEJ0MIe3g5xMSq/3p+n5rpNXju3JOpEjrQNJV81hmioCrP4BodIIfRH/nioQ==
X-Received: by 2002:a05:7022:43a6:b0:119:e56b:957b with SMTP id a92af1059eb24-11b40b29d05mr3386170c88.0.1763200181160;
        Sat, 15 Nov 2025 01:49:41 -0800 (PST)
Received: from geday ([2804:7f2:800b:a121::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885c0sm23755473c88.3.2025.11.15.01.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:49:40 -0800 (PST)
Date: Sat, 15 Nov 2025 06:49:33 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH 1/3] PCI: rockchip: warn of danger of 5.0 GT/s speeds
Message-ID: <aRhMrXz_RlL0WErZ@geday>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <d6593ae4f59468f294fdddfef83791e0db100e13.1763197368.git.geraldogabriel@gmail.com>
 <a214ac9a-36d9-6505-64a8-92af2da42cf1@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a214ac9a-36d9-6505-64a8-92af2da42cf1@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_014942_257411_916D9A41 
X-CRM114-Status: GOOD (  27.06  )
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

On Sat, Nov 15, 2025 at 10:24:49AM +0100, Dragan Simic wrote:
> Hello Geraldo,
> 
> On Saturday, November 15, 2025 10:10 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > Shawn Lin from Rockchip has reiterated that there may be danger in using
> > their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT change
> > from the default and at the same time, drive at 2.5 GT/s only, in case
> > the DT max-link-speed property is invalid or inexistent.
> > 
> > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> > index 0f88da378805..ed67886a6d43 100644
> > --- a/drivers/pci/controller/pcie-rockchip.c
> > +++ b/drivers/pci/controller/pcie-rockchip.c
> > @@ -66,8 +66,12 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
> >  	}
> >  
> >  	rockchip->link_gen = of_pci_get_max_link_speed(node);
> > -	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> > -		rockchip->link_gen = 2;
> > +	if (rockchip->link_gen < 0 || rockchip->link_gen > 2) {
> > +		rockchip->link_gen = 1;
> > +		dev_warn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
> > +	}
> > +	else if (rockchip->link_gen == 2)
> > +		dev_warn(dev, "5.0 GT/s may lead to catastrophic failure\n");
> >  
> >  	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
> >  		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
> 
> Looking good to me, thanks for this patch!  People often declare
> PCIe Gen2 on RK3399-based boards as "works for me", which actually
> happens very often, but such simple evaluations cannot be taken
> as a proof of Gen2 correctness.
> 
> Furthermore, RK3399's internal interconnects limit the effective
> I/O speed of PCIe transfers already, so switching to PCIe Gen1
> actually doesn't result in some large I/O performance penalties.
> 
> With all that in mind, please feel free to include
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Hi Dragan,

I think I'll include a Reported-By: you too, since you were the first to
warn me of unknown errata regarding Rockchip PCIe.

I told you it was a test of mine but I didn't realize the grave danger
implied by Shawn Lin declarations.

Once I realized this could end badly the only way I could retribute was
to send a few corrections :)

Thank you,
Geraldo Nascimento

