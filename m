Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E42D10DCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGMPvoh3nnYvZxMNds9qARKtX9Uv0fcU6Rjh9g+g7NA=; b=vphX+fJQRXPpimR/mXLFXzr/IY
	PyGoQHs5EiWZddeWyaeZa88DFakimzZ5hnPTWij6yKITRRi4Qrc518wEdYGbQldopAeWETVPoWbRG
	yvqna22lGyfUpgQppUKkEtPGqHXSZMjFgAR2iQX2ToeoaM8/TxkK601Haozu87iOSez3D6Lg2CTE7
	Ol52bkGyLssYHUzNpDAKHA9zdNNVLklxuGFcTOQvYcwnmhETrldGOrc3Qgc1Z6YtkEbvqzjFnffPj
	lLsMt4usuOig3svIu8lr33x+EzbItd1WKTTwR3Bns0dlhrLBKxT6yvRLZuENvLwc4c4kS8kbryNzh
	A+MLUTrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2lx-00000005Ztm-2MHm;
	Mon, 02 Dec 2024 09:31:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2jv-00000005ZYg-1aLn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:29:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2155157c31fso16811035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 01:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733131750; x=1733736550; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EGMPvoh3nnYvZxMNds9qARKtX9Uv0fcU6Rjh9g+g7NA=;
        b=zsfxAdgKwYkUpcXGrVIZBNPt8JRVSFwZSUJoTn+vc/sd5el/sGKkuswdT96adFrG/P
         ZaGZOgxEmuYj+9UeFWQZ78HrsTZwo/GgMGKxnzBsfHk0LDfw4HiZdUToVF69Ze9kOqSz
         unGVrW0jeoBzC6U40XfMb8NcarrP5boOLa04OSG4+aZhTxQDxDPJAXoajko/wj0EsbTr
         zgdC5lnp1QI54TREUN2YQDGetURuxJYaOsN5QPZoTmhHkE7539XaruP9kHe6k2fURXUD
         S2HxK6YKRuAeamkQCgKZRfWE2YauJa1IZmG+vNxbxp8zNCS8JtJSMoowKO8smtCtERW7
         VN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131750; x=1733736550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGMPvoh3nnYvZxMNds9qARKtX9Uv0fcU6Rjh9g+g7NA=;
        b=p3WQk7/w1HTBLy1sgauBDIBl6ZHV96UdLmmCnJEJ/vlJKpMQKG5pTBPiXubJwX/Pry
         w+FWtUq2ikIAiQZ+1nGqkUtYCF2PWcp4OcMMxdUfatHQ69zFRmT5mvkCApaWVw0Ri0Bq
         HXXYBuz4q4hHN7dFP9PuBZujgJfDnR8LfWtU8K+ZsV7dKSKqa2DGl5Pq9LKpPjooF2v0
         8M7LCcrWjOlUYkfMOjyNzreL3JpJzIEKPb52NSR/sLHtn1h7myG92+Uu5UMQMRK0K0sE
         9FGVs2FO4QP4GSt7kE+gjjEmniQo2NbA3rY07KSXrwyADMYYkJvqH4T8+TreUxc9fVxf
         cpjw==
X-Forwarded-Encrypted: i=1; AJvYcCWzbAl9ET6bS/meuWT77+HfQtHNnMUkUkywWb9tZuz12BFj79cQ0wmZ/2r+3WWpOZ69fhm6QfrEha6EyEGJknVH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3BQ574++rL8CPxd8kPjh5Op2rQJyoG6FqgTD/6OufCwFWA25y
	nzjOjhcOS1koPUhHHJWRHEGupx+v/067gFfNZC20lYq1KMz/CudLL1d9bCjmYQ==
X-Gm-Gg: ASbGncssQ4uEEOlsl7x1ndiSFBmBYNZnWE16niqrWpyhqkgh3A5rBWsTmDYCquRdgR8
	E0NSgKQQH6gY3K9rZfwSt4gQirCt8mSjFv+3VycunCMyGvO3gHbJW1fo8DRcMicCum3ZU91X8sT
	OfVp9hTsymhJn3du/DbWNIqdzehvRdmoEl/otbQri7/yz+Ae5fC9FyLG+Q9d7YuXYKkuupqPF07
	9kiQ9UtIaDjA0Tob+o448t1numjrEQwGlNIKX0UJXDY2Csi5fnfW6e24V49EA==
X-Google-Smtp-Source: AGHT+IGBDoG25e3pEf75i9cCZn/hE8xGiTP5kP5qKiZ7M9GVusUnW+yFGAk3ficksX3QF5GI5UN3Qg==
X-Received: by 2002:a17:902:ec8e:b0:215:6c5f:d142 with SMTP id d9443c01a7336-2156c5fd28bmr100497085ad.20.1733131750007;
        Mon, 02 Dec 2024 01:29:10 -0800 (PST)
Received: from thinkpad ([120.60.140.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219c31a0sm72507725ad.249.2024.12.02.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:29:09 -0800 (PST)
Date: Mon, 2 Dec 2024 14:59:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"open list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: check bridge->bus in pci_host_common_remove
Message-ID: <20241202092902.rp6xb3f64llpabbi@thinkpad>
References: <20241028084644.3778081-1-peng.fan@oss.nxp.com>
 <20241115062005.6ifvr6ens2qnrrrf@thinkpad>
 <PAXPR04MB8459D1507CA69498D8C38E0488242@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20241115144720.ovsyq2ani47norby@thinkpad>
 <20241127195650.GA4132105-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241127195650.GA4132105-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_012911_429078_86B6E200 
X-CRM114-Status: GOOD (  51.75  )
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

On Wed, Nov 27, 2024 at 01:56:50PM -0600, Rob Herring wrote:
> On Fri, Nov 15, 2024 at 08:17:20PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Nov 15, 2024 at 10:14:10AM +0000, Peng Fan wrote:
> > > Hi Manivannan,
> > > 
> > > > Subject: Re: [PATCH] PCI: check bridge->bus in
> > > > pci_host_common_remove
> > > > 
> > > > On Mon, Oct 28, 2024 at 04:46:43PM +0800, Peng Fan (OSS) wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > When PCI node was created using an overlay and the overlay is
> > > > > reverted/destroyed, the "linux,pci-domain" property no longer exists,
> > > > > so of_get_pci_domain_nr will return failure. Then
> > > > > of_pci_bus_release_domain_nr will actually use the dynamic IDA,
> > > > even
> > > > > if the IDA was allocated in static IDA. So the flow is as below:
> > > > > A: of_changeset_revert
> > > > >     pci_host_common_remove
> > > > >      pci_bus_release_domain_nr
> > > > >        of_pci_bus_release_domain_nr
> > > > >          of_get_pci_domain_nr      # fails because overlay is gone
> > > > >          ida_free(&pci_domain_nr_dynamic_ida)
> > > > >
> > > > > With driver calls pci_host_common_remove explicity, the flow
> > > > becomes:
> > > > > B pci_host_common_remove
> > > > >    pci_bus_release_domain_nr
> > > > >     of_pci_bus_release_domain_nr
> > > > >      of_get_pci_domain_nr      # succeeds in this order
> > > > >       ida_free(&pci_domain_nr_static_ida)
> > > > > A of_changeset_revert
> > > > >    pci_host_common_remove
> > > > >
> > > > > With updated flow, the pci_host_common_remove will be called
> > > > twice, so
> > > > > need to check 'bridge->bus' to avoid accessing invalid pointer.
> > > > >
> > > > > Fixes: c14f7ccc9f5d ("PCI: Assign PCI domain IDs by ida_alloc()")
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > 
> > > > I went through the previous discussion [1] and I couldn't see an
> > > > agreement on the point raised by Bjorn on 'removing the host bridge
> > > > before the overlay'.
> > > 
> > > This patch is an agreement to Bjorn's idea. 
> > > 
> > > I have added pci_host_common_remove to remove host bridge
> > > before removing overlay as I wrote in commit log.
> > > 
> > > But of_changeset_revert will still runs into pci_host_
> > > common_remove to remove the host bridge again. Per
> > > my view, the design of of_changeset_revert to remove
> > > the device tree node will trigger device remove, so even
> > > pci_host_common_remove was explicitly used before
> > > of_changeset_revert. The following call to of_changeset_revert
> > > will still call pci_host_common_remove.
> > > 
> > > So I did this patch to add a check of 'bus' to avoid remove again.
> > > 
> > 
> > Ok. I think there was a misunderstanding. Bjorn's example driver,
> > 'i2c-demux-pinctrl' applies the changeset, then adds the i2c adapter for its
> > own. And in remove(), it does the reverse.
> > 
> > But in your case, the issue is with the host bridge driver that gets probed
> > because of the changeset. While with 'i2c-demux-pinctrl' driver, it only
> > applies the changeset. So we cannot compare both drivers. I believe in your
> > case, 'i2c-demux-pinctrl' becomes 'jailhouse', isn't it?
> > 
> > So in your case, changeset is applied by jailhouse and that causes the
> > platform device to be created for the host bridge and then the host bridge
> > driver gets probed. So during destroy(), you call of_changeset_revert() that
> > removes the platform device and during that process it removes the host bridge
> > driver. The issue happens because during host bridge remove, it calls
> > pci_remove_root_bus() and that tries to remove the domain_nr using
> > pci_bus_release_domain_nr().
> >
> > But pci_bus_release_domain_nr() uses DT node to check whether to free the
> > domain_nr from static IDA or dynamic IDA. And because there is no DT node exist
> > at this time (it was already removed by of_changeset_revert()), it forces
> > pci_bus_release_domain_nr() to use dynamic IDA even though the IDA was initially
> > allocated from static IDA.
> 
> Putting linux,pci-domain in an overlay is the same problem as aliases in 
> overlays[1]. It's not going to work well.
> 
> IMO, you can have overlays, or you can have static domains. You can't 
> have both.
> 

Okay. 

> > I think a neat way to solve this issue would be by removing the OF node only
> > after removing all platform devices/drivers associated with that node. But I
> > honestly do not know whether that is possible or not. Otherwise, any other
> > driver that relies on the OF node in its remove() callback, could suffer from
> > the same issue. And whatever fix we may come up with in PCI core, it will be a
> > band-aid only.
> > 
> > I'd like to check with Rob first about his opinion.
> 
> If the struct device has an of_node set, there should be a reference 
> count on that node. But I think that only prevents the node from being 
> freed. It does not prevent the overlay from being detached. This is one 
> of many of the issues with overlays Frank painstakingly documented[2].
> 

Ah, I do remember this page as Frank ended up creating it based on my
continuous nudge to add CONFIG_FS interface for applying overlays.

So why are we applying overlays in kernel now?

> Perhaps it is just a matter of iterating thru all the nodes in an 
> overlay, getting their driver/device, and forcing them to unbind. 
> Though that has to be done per bus type.
> 

Sounds like the correct approach.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

