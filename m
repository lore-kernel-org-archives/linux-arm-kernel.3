Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B8ACCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 20:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1FZmM9cdt+xj6V1Hd+gvwGWqSc0g8vu7TF1E04sPkw=; b=lzXtpUr6F6SALdaj28GFezh93R
	uoS7WYGuol4zxjA5Pfpq4EPq28LEUkQO6XhZMfxi22eRzzBsG37iwd39li0Fcd03oTCf8h5KYx1BD
	k8M1GWpRqP06rt2EB5p9fCB7fNtfiHTKw2E6j5PutCEYohkyR2Id8yQuc9U9BJIaZbrUuZ0I3pGIF
	/FeEFWFzRG0a4WG7iM7MKTaSb4nlw/ZHjXJe0uVeSRiwzFYC2i0FGEBPATaFSyMOU0Ik1fG9+tZRD
	NhHUbryrBYjmlmBMBOxNAg6pO2TC0ZgtRiE6DPteqS5XT2NbnRkHXXZ6tUcvm8GAa5bHKO1fu0faU
	d2ea4vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1aj-0000000AcfK-3E7K;
	Mon, 03 Nov 2025 20:55:53 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1ag-0000000AceU-3T3d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 20:55:51 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-781206cce18so5218485b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 12:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762203350; x=1762808150; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1FZmM9cdt+xj6V1Hd+gvwGWqSc0g8vu7TF1E04sPkw=;
        b=miRf5ow0zlWl0RpyYWvV0OtjaBsNFFArjysOhc7NSpRBofqQ+pwPzrADrxsovmsyhn
         nwBDVLldWTxiatJHydzMeTf2drFH9YHdXloHM/jMNI1/NwQDJ5zFFwpzjRFWCodbZn3C
         //EKMLwipFDiY7zs3XtzNtOW6+kvO6lBXBHUpk5qyKLO5G40CvzIjvUo7P+snDmlzIcL
         SqrHKQcHLanrpIa3wreZvwJLTECv2sOp64yRZ4lq4KQ7RKmQokCVn9h9m8Cu7XRCP9S4
         q0CT8XGtNMEk+PmUwp3BvuL1CMdSJDS9VwUUx6BpHIkw0FBS/q9I5i04K4OigWtLrtil
         6sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203350; x=1762808150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1FZmM9cdt+xj6V1Hd+gvwGWqSc0g8vu7TF1E04sPkw=;
        b=vcBntrtYzM7GHTUAns7lmUt1CzwcEcg6kecI2QKT79BQF6m9SX1HW888nq5/VbCgAE
         uTuo/FKr8fY55N9YLmBVHL6gR6lUEuPfzHPXRfB5YGOn1yWnSh7Goqnw8r1kqADxFrUz
         Ih2PNVyF8bbkWMt8U+c0AQvH2oW1Rwn44wiXcgg1LuyN8HCLGR/iWIIjfevrmRopFKiu
         XOuFUKJcZxQYOQTAJV3doAXiL0NyH071JIhgB3j8kS9jWlVDAF0oLbydqKCssWZhUaoh
         aQ2TGftb9NNDfvi8HfsHUuFZvEaKi1HSmCshlDTKXRcu1DL8MCWg6U9zgDIkhH5qsL9H
         QZmg==
X-Forwarded-Encrypted: i=1; AJvYcCWZZxI4Y0opDucMOtcZHhXhjWrzhmBgGzbkuwK2ZB4znaYvxoD0a1qb9VfknQlwlEyhIaohkKhDg1kNyEtPmCnF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrrb87qMwMX5MXYHQUsCk4Ag8hmaIrskMf0Ur6w3jRlXQjbWJZ
	6ZWQOsXFMMbJs7AgGClr6UEBmq4PNeCsNYiQxG8NQh21PH3vJhU0TZR+
X-Gm-Gg: ASbGncvTMZJDfJh6xNCQFqUtJAlU3WJ5Sf5KBKkfXG8+Fzo6skiv7qOLVhOrJViK0e9
	22DJjFyXAk9ZrAPSRqfw8kbAnWPABbNtZEjAkq8MueYJ/cIZ5Oxbih2W5DZSCeMKnD5kXaZql7/
	rUjrLV+LhosBG6/4drN7tvrCPTOxrHLd4zQsGj1PNur6z2D6XLErpEMEUScUVfv50xl8XZD6DoI
	QOo1EKVeMsFQlSBaGcHdEoSkr0NB/t11WRtIqQxAhdb6CU4v2jiJZmIxSI4Zkij9sc7qHxpu0In
	XpzlOhWRoDUFP3GfNe47PGbAFM/je2omf1tS9jPvBTU4HhBLMPB81wTsxqLjahT++F+Fd8wpKje
	Pr1cnJL6lwdNwt57h26VJM7zHhC9NG1axQOQ48NysbxdmkGei0hH4EB79DpRHrA==
X-Google-Smtp-Source: AGHT+IGYDVdNgNWocqi7ihWCrOOfROJ4jnfVXq0iLB5L8b6BF6bhkooF51PIKfTJUsi9RRg9FKFduA==
X-Received: by 2002:a05:6a00:468a:b0:7aa:19a9:566a with SMTP id d2e1a72fcca58-7acbbb5a284mr818412b3a.0.1762203349654;
        Mon, 03 Nov 2025 12:55:49 -0800 (PST)
Received: from geday ([2804:7f2:800b:e79::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd623e091sm315775b3a.54.2025.11.03.12.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:55:49 -0800 (PST)
Date: Mon, 3 Nov 2025 17:55:38 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Subject: Re: [RFC PATCH 2/2] PCI: rockchip-host: drop wait on PERST# toggle
Message-ID: <aQkWysK2XA01lkB8@geday>
References: <d3d0c3a387ff461e62bbd66a0bde654a9a17761e.1762150971.git.geraldogabriel@gmail.com>
 <20251103181038.GA1814635@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103181038.GA1814635@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_125550_883585_6E889ED9 
X-CRM114-Status: GOOD (  22.06  )
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

On Mon, Nov 03, 2025 at 12:10:38PM -0600, Bjorn Helgaas wrote:
> On Mon, Nov 03, 2025 at 03:27:25AM -0300, Geraldo Nascimento wrote:
> > With this change PCIe will complete link-training with a known quirky
> > device - Samsung OEM PM981a SSD. This is completely against the PCIe
> > spec and yet it works as long as the power regulator for 3v3 PCIe
> > power is not defined as always-on or boot-on.
> 
> What is against the spec?  In what way is this SSD "known quirky"?  Is
> there a published erratum for it?

Hi Bjorn!

My proposed change itself is against the spec.

This SSD is known to simply not complete initial link-training with
Rockchip-IP PCIe. This is not officialy documented but based on
reports across boards (like the Armbian one).

I think it's the other way around though, it's the Rockchip-IP PCIe
controller that is quirky somehow and doesn't play nice with
many, many devices.

> 
> Removing this delay might make this SSD work, but if this delay is
> required per PCIe spec, how can we be confident that other devices
> will still work?

We really can't be sure there will be no side-effects to other devices.

> 
> Reports of devices that still work is not really enough to move this
> from the "hack that makes one device work" column to the "safe and
> effective for all devices" column.

I agree, and I knew from the start I would not get encouragements from
the community relative to this change. Still, it seemed selfish not to
share the workaround.

> 
> It's easy to see how *lack* of a delay can break something, but much
> harder to imagine how *removing* a delay can make something work.
> Devices must be able to tolerate pretty much arbitrary delays.

That said, the problem of quirky Rockchip-IP PCIe remains. The fact
that removing the delay makes it work with devices that previously
did not complete initial link training must at least point to a
resolution somehow, even if the present change is unacceptable.

I'll continue to hack around this, see if I can pinpoint exactly why
that delay screws up my initial link training.

Thanks,
Geraldo Nascimento

