Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C35C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ8sGclz9ZW30bcpmgdyWwKiT4qk2MxCGSmtAY4+/ro=; b=K6IbyWlIDDv2p6NERObPsTosRm
	hyG3Qd6WXoAYHmL6J4JLp1X0ApmmgEmNAGkLpeBWsnPt2GOuXHCFsmxkWkNs4NRfVbz/XZa2lYZVT
	ZxVu8eni3MazI2+/Zk55Vp4TNWf6kLx6INqJNfrW78aIxwVG7m7wQN+aDs7zDmT1hx23WgqmPpHaL
	BbqCnNxLGoRVsIs3J8NcrsHpvtFwV5LGzf974oulOfral0lmMQImgLMo0ohTBYkwzbli6DFQw91Ba
	LMoM+E5wiFV+HbqGwQagGnufXRaAxmSmIS/mzHWgR9qM4gjboQfSbQ4/m3csLWV/bdNrp9FwvbXAu
	dGZ1cWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphfH-000000073qP-0Iup;
	Wed, 05 Mar 2025 05:51:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphbV-000000073QN-3Lwu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 05:47:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2234e5347e2so130437015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 21:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741153657; x=1741758457; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQ8sGclz9ZW30bcpmgdyWwKiT4qk2MxCGSmtAY4+/ro=;
        b=ug22YDxRxBFKrGR5/lC8cFEcWuReWwa3nNpBOj8QwGasdur1hPQFPgOpPj8uTyirXc
         yd2vuMuN5JTVEh64FB+mIGK8OIR+ckjKFenKpZfKbDNPy++0jTPp6MHlUh86JPHnJ7kv
         AJ+uVVIYpQVDW/PCjxfRgz52xI0hlfLwO6wK1cu7TC7AZMUpTuV9NuL5vRLaqDaZr5+y
         n65JdNq/avYQlsTkRBkd1Wd4aJJfq1fknTq0enUUSYl4zcgyahTsR8EjR1OK5ZFexicO
         2iyPNAZC6e+79/ZSElhvDS8eNLoPO1nMRMEeAwiwfMHDSDA6CAg7k/YYIfQWYsq1nAx5
         7GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741153657; x=1741758457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQ8sGclz9ZW30bcpmgdyWwKiT4qk2MxCGSmtAY4+/ro=;
        b=JcKln5+gPY9wRy3E4DjxAnQm5yyfFsnuZmPSgQywE5kLuqm4mRw2NVeVKCIxJpFlmJ
         i7A0izRHB1UygP13RPqwCrBnoZjo8f9nJbvm+IwqXY7HLdohFU8DCHYYz8PHkK2+X4bU
         pe5ZS97XZ3QG6zKqogLouj4wPbiJIlPdgv+NpTMFg73L6TZSC8VgCT/2Yno8c8TtCaAX
         2uwsl0Js2S6lqtUMUD2fkApZJZTbg7Mj7kjVs0znFGXuQ910Mjh7RVgBvGJqE9b24ggP
         W20jhlJpv4zLVScc6ZzFpiSTSklz8oORGB1PbHH8eyAUx0hyZkJk2eO8KFwLeMaS1RDR
         VGCg==
X-Forwarded-Encrypted: i=1; AJvYcCXwXFFpAAr/7KHfmxmSUgNv76spKkxmiRQT5UHuA/YMpIxJcBm/7jURgeqBJQaSVHsKMLGc6K1ZzkJRh7iYziOj@lists.infradead.org
X-Gm-Message-State: AOJu0YyFcGhKn3tnUgb7kBE3QtPeMdMhQFnYxdZPBsbYxvLjP/DA0Qpw
	fWpBtcTOrs41Q0lFzKEy0/yQPxIv0yf6ZrOpZLXebWZKBjSfsF0of5a27oPn2PLh5I0cFMrVZjw
	=
X-Gm-Gg: ASbGncsc0Ryr0ULMM2xmXijzS8+Zqc0rkadxS895259OxnCKfQ823qKIU94feagTFnk
	TbVJKAFjm5/ki6M25ltMtn9cN4HJJCHHkso1s1Y6gniazED5GkPDwbN4E85x60YWN4GmWrrbs4m
	FybigdpS1iowFOdAEnvPOD83ALVMH0XUlMBIpcCnX6KaJMiUmCNdgxtr3jrafeKxFkZqKqNOn/h
	fqnRhlB9pvS/EpFwH9nkkGXCDdl3VKlmg/OXgf+iAuz5eGIPpVErAW1PdWAEr4adgZyJl4/Cjbo
	sdF2U/gY8s4IX7KoOKNsY2SxruSWRpaRpWOmylqaeo/78RHV3qRkgTYI
X-Google-Smtp-Source: AGHT+IHcOjK0aDg9zZYU8dTY0bxPLw4b7XQZ/EjSujAaUgk6k2jHDc4GWuzqjv6glvZdXk8q7TEpjA==
X-Received: by 2002:a05:6a00:3016:b0:736:5ee3:64d5 with SMTP id d2e1a72fcca58-73682cda1admr3217540b3a.23.1741153656990;
        Tue, 04 Mar 2025 21:47:36 -0800 (PST)
Received: from thinkpad ([120.60.140.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73637081ba7sm7772462b3a.112.2025.03.04.21.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 21:47:36 -0800 (PST)
Date: Wed, 5 Mar 2025 11:17:29 +0530
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
Message-ID: <20250305054729.5jkxen5vahoxvlrr@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-7-james.quinlan@broadcom.com>
 <20250304150838.23ca5qbhm4yrpa3h@thinkpad>
 <CA+-6iNzOWU1qLfmSiThdYXX0v5RkbUYtf52yk6KXm6yDDNRUnw@mail.gmail.com>
 <20250304165808.t46fh6fwpardheup@thinkpad>
 <CA+-6iNw2i=4KVr+VYOxacWpP7Pw0E5mDwKY1i9_6V_hjxu9neQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNw2i=4KVr+VYOxacWpP7Pw0E5mDwKY1i9_6V_hjxu9neQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_214737_854671_E6C23581 
X-CRM114-Status: GOOD (  32.34  )
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

On Tue, Mar 04, 2025 at 12:37:26PM -0500, Jim Quinlan wrote:
> On Tue, Mar 4, 2025 at 11:58 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Tue, Mar 04, 2025 at 11:37:14AM -0500, Jim Quinlan wrote:
> > > On Tue, Mar 4, 2025 at 10:08 AM Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > >
> > > > On Fri, Feb 14, 2025 at 12:39:34PM -0500, Jim Quinlan wrote:
> > > > > The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of the
> > > > > map_bus methods used these constants, the other used different constants.
> > > > > Fortunately there was no problem because the SoCs that used the latter
> > > > > map_bus method all had the same register constants.
> > > > >
> > > > > Remove the redundant constants and adjust the code to use them.  In
> > > > > addition, update EXT_CFG_DATA to use the 4k-page based config space access
> > > > > system, which is what the second map_bus method was already using.
> > > > >
> > > >
> > > > What is the effect of this change? Why is it required? Sounds like it got
> > > > sneaked in.
> > >
> > > Hello,
> > > There is no functional difference with this commit -- the code will
> > > behave the same.  A previous commit set up the "EXT_CFG_DATA" and
> > > "EXT_CFG_INDEX" constants in the offset table but one of the map_bus()
> > > methods did not use them, instead it relied on old generic #define
> > > constants.  This commit uses them and gets rid of the old #defines.
> > >
> >
> > My comment was about the change that modified the offset of EXT_CFG_DATA. This
> > was not justified properly.
> 
> Okay, got it.  You are referring to (for example)
> -      [EXT_CFG_DATA]          = 0x9004,
> +       [EXT_CFG_DATA]          = 0x8000,
> 
> We have two ways of accessing the config space: (1) by writing a full
> index and reading a  designated register (0x9004) and (2) by writing
> the index and then reading from a 4k register region (0x8000 +
> offset).  We previously used (1).  An update was made to use (2) but
> instead of updating EXT_CFG_DATA from 0x9004 to 0x8000,
> PCIE_EXT_CFG_DATA (0x8000) was used by the code of one of the map_bus
> methods.
> 
> This commit changes the code in the offending map_bus method to use
> the offset table for (2) and updates the offset table EXT_CFG_DATA to
> its proper value.
> 

Ok, this clarifies.

> If you want me to expand the commit message with the above text I can do that.
> 

No need. Krzysztof should be able to ammend the commit message for you.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

