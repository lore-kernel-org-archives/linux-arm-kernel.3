Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07C1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXuDlePk3z76NmB3njzb/zW9m0v0y70IIgcfh0HFsS0=; b=HXxIfE7I6r3HD2OAB89s1NxWAs
	fqQOwjZJEtzl1wdSk1cU6A2XLbr2I5WlkWYdBIPYoddSb01GBInPzdXp3plL8ny/Bha8GMX7Gu9H3
	7Gsyh1FWZWqUbI+eojT5z0CK7Rkx/iue8PrZUE4CHLyjprKeB7/QFWti1NqkeM9m6H/moawOy6pBX
	hzk3fUCJ59XDzV3OTTTMguRrl6EZ+1LsBpZeBGQNkFrhFdCIBeBFdYppbjdi/yQOe6KvMSqe8HaWV
	nm2tpI/FNoJh6IpHvCmFEOki4PSe12rwEXETSkSXBNMAgbURSzUDNW2iVSQg19WtMTxHBYoKKKbjG
	J78Uc36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWxR-00000005pvR-3tBN;
	Tue, 04 Mar 2025 18:25:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVay-00000005WL1-0mPv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:58:17 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223959039f4so61737685ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107495; x=1741712295; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXuDlePk3z76NmB3njzb/zW9m0v0y70IIgcfh0HFsS0=;
        b=arbNJfT7zq8WB6mmKby3VEwzoFgnybZczQFq5qSzdiPR4eOcc2ay0X9sMYTNrlcIBV
         1aaSfKY4zcMyJj4aOzKVpXc6sdDOs0bu4pjQ2bBqx628/lVhePmuFF4q34Ah/fTwAKoT
         En/1mIqiEjtAdxW7qWVmsbRS/tA4B4Tj+ocwDrnTDjvMjrOF5sN6RX2dFJhLlLhCqMxV
         MsI3L1FPNX8NuQ2r410ysuhpFL46MFr2LVW/4Tl6dxyYkNmE08j+7nll6i91NXY5UzWp
         F37xRsK+ozBnu3EVqrbYxuax8bBpR2A/g4+gVdoayvcbu+yOfi56Wg5KSB36b9QLLUjt
         j6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107495; x=1741712295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXuDlePk3z76NmB3njzb/zW9m0v0y70IIgcfh0HFsS0=;
        b=CTNOyPukgqJukG0cw2HOLsjaDoMz8BC5eGIPdSLc5a7+KgfVO+fMruPBTcne/m+QU1
         Jo3YiuZdTaNTNPDLAi1SoGupbbc3itGORDWrVQJu7zDLqwjCu0HNOXpjpIzJMJYQmFnY
         tiU0PtAoHNio3iBSESM8f6EMHgmSzyEiedyozj0emI33jgloBfQLXMVlWFfrj03dla3u
         YXT5CfKVHgh2O+vsboxs65PB90S1Y/7EhXhpkvkisIq2hEtpEmcorXE5TROaePO33cF0
         ZM6Ok+XtzBzQpralRLWpyyRyCYNQYkqzFfktRDULznsjx7DOqaOnMX1kUP05lJ1pvGl2
         j1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgF5IgTMzGh9801Jb1KBAtuKO2NlAQ3nT+s1vwW+MiV6gEpApxjY5qccj6EInv1Bm8YcHrfeFvlTlD9SQmYvK6@lists.infradead.org
X-Gm-Message-State: AOJu0YysSblubo0KUIKGRBpAxmHbKgB8EDi6oMR+eVcpT0HV3+Sr6M2a
	zhMoaZnVJCXiSPAW9obh15TGvD7TWCOS9/wovMjjh2tdUODw3/zyLa2Lf0wisg==
X-Gm-Gg: ASbGncvjCpPIdCc2R+WlwgHjx/CQUWY/mx4nEtn3jhGeVBQTuwZPBHj9nvGpY4vKksU
	SA7jovzQyo8TSP2VU+K0ffRRtjMOnC4i0yX1gW/W+TNj72hzDSH6gBA+WjQIZ8TRKMz+JhDTr0s
	n7aVWe/NxhcCdHnlTDjy5OD8apLHz7AYDwAiPPAzSvFQWxzvOMTvOyzfZRfydntp9wkaCUUgo8l
	DC9+0RXv1WJuXES/nkj8C6mYJCbmU+SFJ6EOI68Javw6vw9DEvKBAkVkKXMG/dqjDQBEqwUBEGG
	lL9Bj+RMM+OtkYe+1gIbFdxG3//vSt81P1C3PXfxxaU1yg9z7dmql4U=
X-Google-Smtp-Source: AGHT+IGwnc/vs2CObgIuDM6UnQPGGyTdY/HL1MplDIozj/pFYdjiWAd6nq0u34IHMKPLJhyLx/VbEA==
X-Received: by 2002:a05:6a00:66ce:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-735d89c4ee0mr21649526b3a.0.1741107495305;
        Tue, 04 Mar 2025 08:58:15 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe2a5b1sm11112782b3a.23.2025.03.04.08.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:58:14 -0800 (PST)
Date: Tue, 4 Mar 2025 22:28:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/8] PCI: brcmstb: Use same constant table for config
 space access
Message-ID: <20250304165808.t46fh6fwpardheup@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-7-james.quinlan@broadcom.com>
 <20250304150838.23ca5qbhm4yrpa3h@thinkpad>
 <CA+-6iNzOWU1qLfmSiThdYXX0v5RkbUYtf52yk6KXm6yDDNRUnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNzOWU1qLfmSiThdYXX0v5RkbUYtf52yk6KXm6yDDNRUnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_085816_219952_21805A08 
X-CRM114-Status: GOOD (  21.41  )
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

On Tue, Mar 04, 2025 at 11:37:14AM -0500, Jim Quinlan wrote:
> On Tue, Mar 4, 2025 at 10:08 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Fri, Feb 14, 2025 at 12:39:34PM -0500, Jim Quinlan wrote:
> > > The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of the
> > > map_bus methods used these constants, the other used different constants.
> > > Fortunately there was no problem because the SoCs that used the latter
> > > map_bus method all had the same register constants.
> > >
> > > Remove the redundant constants and adjust the code to use them.  In
> > > addition, update EXT_CFG_DATA to use the 4k-page based config space access
> > > system, which is what the second map_bus method was already using.
> > >
> >
> > What is the effect of this change? Why is it required? Sounds like it got
> > sneaked in.
> 
> Hello,
> There is no functional difference with this commit -- the code will
> behave the same.  A previous commit set up the "EXT_CFG_DATA" and
> "EXT_CFG_INDEX" constants in the offset table but one of the map_bus()
> methods did not use them, instead it relied on old generic #define
> constants.  This commit uses them and gets rid of the old #defines.
> 

My comment was about the change that modified the offset of EXT_CFG_DATA. This
was not justified properly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

