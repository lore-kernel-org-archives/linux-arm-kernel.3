Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFD0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 05:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em/Cl1Un5rZGf3VhkwdnO0AI73Gmssn5wRijQz+hyu4=; b=gFajtcaRhthABMSysC6B0E4oN1
	arIy+LPFeknHCTW+2PX0WHcEeX7G859iRGUOz9a73yPQQ7GIlMHd1bAeLMaHl5OlxRs37wo0g60ya
	m8ejZWLHHfZlrp3aqCrokK0SzPF4j+ejxmtFxLah/gfkF4DqR2N1N1/4jhITVIRldEX6ym7J04Oze
	BAxpCRnUp1BDiDpQ+1K5YWSf/UqshhWG+TrFgktpfvokZRpDtIM/7HTXktvtAljQCOtstNsywLd60
	upwLz01qgTgTXPu4q+eCXDPDIMuY7S3OST6cIPqqaQdqKWyPgNVqre5ex4kAWO4V3eTytMRUCXHpO
	QFPEUtPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN3MX-000000094cv-2JXg;
	Mon, 16 Dec 2024 05:09:45 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN3LQ-000000094Wv-1Xmb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 05:08:38 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f1459b6f84so2405209a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 21:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734325715; x=1734930515; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Em/Cl1Un5rZGf3VhkwdnO0AI73Gmssn5wRijQz+hyu4=;
        b=qTQndtVYx7duEeffJSL3OdnsJ+d/60tmbSfRZpJgjQsKUPdtoHtgXbm1HWk796pUfR
         taja6091Guf+sAPHl4AjBWDZG21JsksHQOUgzRuI24105WGUuedzXBpQNvAQyCPyR2Oh
         cKAxu4DoDSsIklA0jFyY3v2+Yz+TxN8dsVbzDFnDf1VWGagffZT0i4mppAkD+t6ffznx
         xSVljGrhO0LieoQ17f/5hfeOZIqk8976yKWjeYjkuLUNxS/kAuginYllKhqiNtX+8KoR
         nVcP+4kvZiKTx1dNrZgIRGpN8umfuusqfNBuSZa2q7k6Ownp+3wUM7oTrJcpIUoSvQFS
         1Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734325715; x=1734930515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Em/Cl1Un5rZGf3VhkwdnO0AI73Gmssn5wRijQz+hyu4=;
        b=rR8Zdc2CA+qbAlyqBp8YM1RPKO6ONPJvKAhusyoyxPcCBeNaqGlDvUd4roexxujw3J
         m5UfTbrN4G4m9CQPAepgJs5b5cPwDr6g21KzqUMFmwwGMCPKnZvjrBKp2G7MInXJDaPi
         t1hk2zu0OjEWSBRLJiLjK0fn24BpSR8AmgyaQPLoOGiTHr4rFxOvTV0dkjmBH/y0NW3W
         QywmG2VGJHfAZIPURaYBIair6v8JjyKYTtOrOcKgehmeJ81Z4wW2eKTo5HF6JWw6Cl0a
         a6Dg/TGMLzPg97x1CU0GGIQl/ufI/Z7GyCf7+1piMnOz7WwgRSVfljMlhBGC7WzctIZN
         Srjg==
X-Forwarded-Encrypted: i=1; AJvYcCUkiw7PesKDLDTyc3gp7gegV8mxdD08U8kyFVW2qwVwi+KRq56KvHRhFw6gr5PLq3KfoHLJBngxYK3dqb6zV+7a@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu44Pj6Wk4jdsigTdw+tKZLgk3guATZkjzmdqm/gkIveW70V5L
	6G438LEavIZqMiNWJgjZD1aXTGWMpq4EzB/MkDqFAjTo5C7A3PaarI13MyY10A==
X-Gm-Gg: ASbGnctXRdFMmgMebYLmvxzw9agWK3EtTjLNRERE9RiINu6lA82cPoC/7LlMalqED2M
	1P3Bx3cV+Yn5vgqCG6DDop9L3iyckaeMOKSH38WJkWdNqwUyQDirgnNgK1Q2ansqlZO0sx3iioh
	wHTSNqnLyAYn/xbeeOQJSvrBjdQHLGU94y6LGti5vR5p3rTVayhuG4fV3epA0lBuxXfpwEdJESk
	CJgDT5CT4g324KR0SgQJYWAFxqziKYiIjdNQuDd1jNnj+KALSV1XaJ1V8ArD6iAMiM=
X-Google-Smtp-Source: AGHT+IGFLuaa872OiTpbwIJ12EZGTfvEXRUxI9S+oBeqTkwTJAML2INav9Us601kCggSsKLcDvu6cg==
X-Received: by 2002:a17:90b:4a09:b0:2ee:5bc9:75c7 with SMTP id 98e67ed59e1d1-2f28fa55c38mr16565074a91.5.1734325715065;
        Sun, 15 Dec 2024 21:08:35 -0800 (PST)
Received: from thinkpad ([120.60.56.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fa1cd5sm7111817a91.34.2024.12.15.21.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 21:08:34 -0800 (PST)
Date: Mon, 16 Dec 2024 10:38:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"open list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: check bridge->bus in pci_host_common_remove
Message-ID: <20241216050829.m4f5wqnzstsqqfcj@thinkpad>
References: <20241028084644.3778081-1-peng.fan@oss.nxp.com>
 <20241115062005.6ifvr6ens2qnrrrf@thinkpad>
 <PAXPR04MB8459D1507CA69498D8C38E0488242@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20241115144720.ovsyq2ani47norby@thinkpad>
 <20241127195650.GA4132105-robh@kernel.org>
 <20241202092902.rp6xb3f64llpabbi@thinkpad>
 <CAL_Jsq+R39jtCeDecpEHbKq+4N-uirMQmsuNG1NaVe1Vnnnv3Q@mail.gmail.com>
 <20241215132640.GA2476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241215132640.GA2476@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_210836_522418_7AFF832F 
X-CRM114-Status: GOOD (  62.75  )
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

On Sun, Dec 15, 2024 at 09:26:40PM +0800, Peng Fan wrote:
> Hi Rob,
> 
> On Mon, Dec 02, 2024 at 07:55:27AM -0600, Rob Herring wrote:
> >On Mon, Dec 2, 2024 at 3:29 AM Manivannan Sadhasivam
> ><manivannan.sadhasivam@linaro.org> wrote:
> >>
> >> On Wed, Nov 27, 2024 at 01:56:50PM -0600, Rob Herring wrote:
> >> > On Fri, Nov 15, 2024 at 08:17:20PM +0530, Manivannan Sadhasivam wrote:
> >> > > On Fri, Nov 15, 2024 at 10:14:10AM +0000, Peng Fan wrote:
> >> > > > Hi Manivannan,
> >> > > >
> >> > > > > Subject: Re: [PATCH] PCI: check bridge->bus in
> >> > > > > pci_host_common_remove
> >> > > > >
> >> > > > > On Mon, Oct 28, 2024 at 04:46:43PM +0800, Peng Fan (OSS) wrote:
> >> > > > > > From: Peng Fan <peng.fan@nxp.com>
> >> > > > > >
> >> > > > > > When PCI node was created using an overlay and the overlay is
> >> > > > > > reverted/destroyed, the "linux,pci-domain" property no longer exists,
> >> > > > > > so of_get_pci_domain_nr will return failure. Then
> >> > > > > > of_pci_bus_release_domain_nr will actually use the dynamic IDA,
> >> > > > > even
> >> > > > > > if the IDA was allocated in static IDA. So the flow is as below:
> >> > > > > > A: of_changeset_revert
> >> > > > > >     pci_host_common_remove
> >> > > > > >      pci_bus_release_domain_nr
> >> > > > > >        of_pci_bus_release_domain_nr
> >> > > > > >          of_get_pci_domain_nr      # fails because overlay is gone
> >> > > > > >          ida_free(&pci_domain_nr_dynamic_ida)
> >> > > > > >
> >> > > > > > With driver calls pci_host_common_remove explicity, the flow
> >> > > > > becomes:
> >> > > > > > B pci_host_common_remove
> >> > > > > >    pci_bus_release_domain_nr
> >> > > > > >     of_pci_bus_release_domain_nr
> >> > > > > >      of_get_pci_domain_nr      # succeeds in this order
> >> > > > > >       ida_free(&pci_domain_nr_static_ida)
> >> > > > > > A of_changeset_revert
> >> > > > > >    pci_host_common_remove
> >> > > > > >
> >> > > > > > With updated flow, the pci_host_common_remove will be called
> >> > > > > twice, so
> >> > > > > > need to check 'bridge->bus' to avoid accessing invalid pointer.
> >> > > > > >
> >> > > > > > Fixes: c14f7ccc9f5d ("PCI: Assign PCI domain IDs by ida_alloc()")
> >> > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> > > > >
> >> > > > > I went through the previous discussion [1] and I couldn't see an
> >> > > > > agreement on the point raised by Bjorn on 'removing the host bridge
> >> > > > > before the overlay'.
> >> > > >
> >> > > > This patch is an agreement to Bjorn's idea.
> >> > > >
> >> > > > I have added pci_host_common_remove to remove host bridge
> >> > > > before removing overlay as I wrote in commit log.
> >> > > >
> >> > > > But of_changeset_revert will still runs into pci_host_
> >> > > > common_remove to remove the host bridge again. Per
> >> > > > my view, the design of of_changeset_revert to remove
> >> > > > the device tree node will trigger device remove, so even
> >> > > > pci_host_common_remove was explicitly used before
> >> > > > of_changeset_revert. The following call to of_changeset_revert
> >> > > > will still call pci_host_common_remove.
> >> > > >
> >> > > > So I did this patch to add a check of 'bus' to avoid remove again.
> >> > > >
> >> > >
> >> > > Ok. I think there was a misunderstanding. Bjorn's example driver,
> >> > > 'i2c-demux-pinctrl' applies the changeset, then adds the i2c adapter for its
> >> > > own. And in remove(), it does the reverse.
> >> > >
> >> > > But in your case, the issue is with the host bridge driver that gets probed
> >> > > because of the changeset. While with 'i2c-demux-pinctrl' driver, it only
> >> > > applies the changeset. So we cannot compare both drivers. I believe in your
> >> > > case, 'i2c-demux-pinctrl' becomes 'jailhouse', isn't it?
> >> > >
> >> > > So in your case, changeset is applied by jailhouse and that causes the
> >> > > platform device to be created for the host bridge and then the host bridge
> >> > > driver gets probed. So during destroy(), you call of_changeset_revert() that
> >> > > removes the platform device and during that process it removes the host bridge
> >> > > driver. The issue happens because during host bridge remove, it calls
> >> > > pci_remove_root_bus() and that tries to remove the domain_nr using
> >> > > pci_bus_release_domain_nr().
> >> > >
> >> > > But pci_bus_release_domain_nr() uses DT node to check whether to free the
> >> > > domain_nr from static IDA or dynamic IDA. And because there is no DT node exist
> >> > > at this time (it was already removed by of_changeset_revert()), it forces
> >> > > pci_bus_release_domain_nr() to use dynamic IDA even though the IDA was initially
> >> > > allocated from static IDA.
> >> >
> >> > Putting linux,pci-domain in an overlay is the same problem as aliases in
> >> > overlays[1]. It's not going to work well.
> >> >
> >> > IMO, you can have overlays, or you can have static domains. You can't
> >> > have both.
> >> >
> >>
> >> Okay.
> >>
> >> > > I think a neat way to solve this issue would be by removing the OF node only
> >> > > after removing all platform devices/drivers associated with that node. But I
> >> > > honestly do not know whether that is possible or not. Otherwise, any other
> >> > > driver that relies on the OF node in its remove() callback, could suffer from
> >> > > the same issue. And whatever fix we may come up with in PCI core, it will be a
> >> > > band-aid only.
> >> > >
> >> > > I'd like to check with Rob first about his opinion.
> >> >
> >> > If the struct device has an of_node set, there should be a reference
> >> > count on that node. But I think that only prevents the node from being
> >> > freed. It does not prevent the overlay from being detached. This is one
> >> > of many of the issues with overlays Frank painstakingly documented[2].
> >> >
> >>
> >> Ah, I do remember this page as Frank ended up creating it based on my
> >> continuous nudge to add CONFIG_FS interface for applying overlays.
> >>
> >> So why are we applying overlays in kernel now?
> >
> >That's been the case for some time. Mostly it's been for fixups of old
> >to new bindings, but those all got dropped at some point. The in
> >kernel users are very specific use cases where we know something about
> >what's in the overlay. In contrast, configfs interface allows for any
> >change to any node or property with no control over it by the kernel.
> >Never say never, but I just don't see that ever happening upstream.
> 
> So should I switch to use configfs for jailhouse case? Currently
> we use overlay to add a virtual pci node to kernel device tree.
> 

Not at all. I think you have 2 options:

1. Get rid of 'linux,pci-domain' from overlay and rely on static id allocation.
2. Make sure the driver is unbind for each device before removing the overlays.

Options 1 is to avoid your issue and option 2 is to fix your issue. You can
decide which one to opt for :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

