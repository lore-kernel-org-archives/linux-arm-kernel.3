Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B260CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKoiWxyUvyLGJfr4mew6KbJ5CrqW82Ve+pQxyYePV7I=; b=ZlPFeVh5jwxWaGPkroZOznNXhn
	F/KhFD3lEm+ti2/0GSAHpZDQ4/NouILRNg3uDSlapUX8+UKp046YE8Gqa9Sb+VBpz2x25sjypDywA
	TDS2H5ODO/F/cOVK4onZujFZQwf3CC/JE2IhElhE2QzZk5UPN4KRA5Z/EToqEOfUbF/MlyIs0nn/E
	78Tbrz9bE1YrsAF63vjnUT8wZxgxRGH3eWdq3MkK+CnwAlc9xDdJ8tag84DWgTB8c7XXGQu5V9+TI
	yo02efM8ElglOpUKG6BzGCGGjeKmmpfXdkJftAnTlg21irEwzsmpU4F0k95nfB6+Z8FUWNpsX6StE
	/gGtMyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEt0-00000000QFN-3Zs0;
	Mon, 31 Mar 2025 13:09:06 +0000
Received: from out-16.pe-a.jellyfish.systems ([198.54.127.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzErJ-00000000Q2f-0HRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:07:22 +0000
Received: from prod-lbout-phx.jellyfish.systems (new-01-3.privateemail.com [66.29.159.56])
	by pe-a.jellyfish.systems (Postfix) with ESMTPA id 4ZRBHT1fDlz4wJq;
	Mon, 31 Mar 2025 13:07:17 +0000 (UTC)
Received: from MTA-09.privateemail.com (unknown [10.50.14.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 4ZRBHT0j32z2Sd0Q;
	Mon, 31 Mar 2025 09:07:17 -0400 (EDT)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
	by mta-09.privateemail.com (Postfix) with ESMTP id 4ZRBHS6LlKz3hhV8;
	Mon, 31 Mar 2025 09:07:16 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=framepointer.org;
	s=default; t=1743426436;
	bh=XAf34DaNZayKTZMezBU2SOnWNVi58X5xnCWEMzzxUdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKLOJmITEmXEBpX+lbpAlM2Dji1iMpPnX5u0rMJHfTPPpDFn28v0BGAY1er+GG1Ve
	 xT5NvcH+J5ce9CjXHsHmYaVHEEjf4eC9+VirK/idvZB7JE4UpxVPa10Vap/BdkkNNs
	 yg/Swd77PKX+cweoz85KxjuA5N5j2B/qNPAhMZq/XEHxS/QSF9f6gIAl2f8301b3kq
	 rVLOVDuaRy0c0PrSXY4g/b2AdWwCfCIYWKTO1RnoUlBa7qAS47tTR3ekii4BRco8kM
	 2OJlk8OB74RcJt8G8WqZ/U8psvrfNjGzPiuqUaaVwNMoxG/QA98yTGVookS6cu0fYa
	 B3pYk+p061smA==
Received: from 65YTFL3.secure.tethers.com (unknown [152.44.190.141])
	by mta-09.privateemail.com (Postfix) with ESMTPA;
	Mon, 31 Mar 2025 09:07:00 -0400 (EDT)
Date: Mon, 31 Mar 2025 09:07:03 -0400
From: Sam Winchenbach <sam.winchenbach@framepointer.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, mdf@kernel.org, hao.wu@intel.com, 
	yilun.xu@intel.com, trix@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, linux-fpga@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sam Winchenbach <swinchenbach@arka.org>
Subject: Re: [PATCH 1/2] dt-bindings: fpga: zynq: Document ICAP on boot
Message-ID: <2ccsnpv67gsu354uo7xe7syrxs265ncj6hl26v3cwf2dfm7hyu@ihkemyajuiag>
References: <20250328141944.119504-1-sam.winchenbach@framepointer.org>
 <02496a88-3d9c-49ee-93ab-8f1400fc0c6b@kernel.org>
 <p4bujnmgkcvsu4qipmgh2j2loedepmwgp7zlaxrurhaveb6tbc@ibqtbjnbzdzj>
 <14b12882-119d-4c24-9634-e4cc37a39212@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14b12882-119d-4c24-9634-e4cc37a39212@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_060721_127119_500B3A22 
X-CRM114-Status: GOOD (  29.44  )
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

On Mon, Mar 31, 2025 at 02:43:59PM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2025 14:30, Sam Winchenbach wrote:
> >>
> >>> +    type: boolean
> >>> +    description: If present, the ICAP controller will be enabled when
> >>> +      the driver probes. This is useful if the fabric is loaded
> >>> +      during the boot process and contains a core, such as the SEM,
> >>
> >> I don't get how this is suitable for DT. If you decide to load the
> >> fabric from driver, that's driver decision so not DT.
> > 
> > Before writing the fabric to the FPGA the driver disables the ICAP, enabling
> > the PCAP. Once writing is complete it unconditionally disables the PCAP,
> > enabling the ICAP. This patch just makes it so, depending on the use case,
> > the ICAP can be enabled at boot. This will not prevent the system from being
> > able to load a fabric through the driver. I added in this boolean so existing
> > behavior would be maintained.
> > 
> > Do you recommend another approach such as writing to a sysfs attribute to
> > switch from PCAP to ICAP?
> Not sure yet. Can't you check the status of ICAP before programming and
> then enable it only if was enabled before?

I am having a bit of difficulty understanding this so let's talk about cases
where the ICAP is enabled/disabled -

1. When writing the fabric from the driver
   In this situation it might make sense to read the state of the ICAP
   interface when preparing the fabric, before enabling PCAP. When the write
   completes you could re-enable the ICAP if it was previously enabled.

   This might be outside the scope of this change - and I am not comfortable
   enough with this use-case to understand potential side effects from doing
   this. Logically it makes sense, but there may be a very specific reason that
   the ICAP must be enabled after doing a fabric load or partial
   reconfiguration.

2. When the FPGA driver loads and is probed by the DTS
   In this situation, which is covered by this patch, the FPGA is loaded by
   BootROM/FSBL but contains functionality that requires the ICAP. Unless the
   user has made modifications to the FSBL or 3rd stage bootloader there is no
   clear way to enable the ICAP interface. Checking to see if it had been
   enabled prior to loading this driver does not (in my opinion) make a lot of
   sense here.

   Perhaps the name of the DTS is confusing? The suffix '-on-load' was meant to
   indicate when the driver was loaded, not the fabric. Would the suffix
   '-on-probe' be more clear?

Let me know your thoughts,
-Sam

>
> Best regards,
> Krzysztof

