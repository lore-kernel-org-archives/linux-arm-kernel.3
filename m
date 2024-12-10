Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECD0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PKMblpekXA2/hGfCpbjtaPM5MzOmH6j2ryfy7333GJg=; b=2vD/C/PQ0IvQffXHygd6P+xiD5
	j4kwzKW1y/99yhki76kJdb6DgWrIxYiD3HW3/h9m50YLh5O8KjXZBCKceHfntt5jf1kQ2L3VDl9c/
	NrW6Z/8KS9tfo/SrGv6iK6wPN79iOkq6fEgNepjhSDQ5lfwFs8AkDGplYNGV3Johlzx0u4sWPGYrf
	rOL2/wZxVhb+Zt9mze4NX18dyJU7IMc+kHXNXYm3ogFExYbUOcaSCjBaC6YhwT8RPxjeBh7mPgbFZ
	MyxBolsUscaQCPORytHsoTBKUZnwk2fWedeq+VYlja/kU9HUg8AzVV49Z+Jtg4pdcQRF9cKvJD9CS
	9c8QnRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1ex-0000000Bs8A-48Do;
	Tue, 10 Dec 2024 14:56:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1cJ-0000000BrdG-16J6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31A585C5C75;
	Tue, 10 Dec 2024 14:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42100C4CEDE;
	Tue, 10 Dec 2024 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733842417;
	bh=M1OlLv3huZuTXdO1fN0ecGWpyL1LcINSI7uaJNiaGqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SnbDumCF+nY6G1t9JZYJGybikUE9s1a9pH6fu2eV6fK1sh7sNiOlrYSBUJB55H8YW
	 kHls2Vmz87wOk3JNwa7psyNgUQDf48q6PTzPumIIw+ETwgWWKC/BzXkdpygE8v7Mrk
	 PnCeTNWQ+/WRW0dbHb64nAEzO+K24XNYnhpYxd5HCnS+8ZKVLwZnNKIX5FRYGnbHik
	 nk/s7+sighiYHlt0TCtZc1JQBrFuDKypLSTbumLbYRmEYJ4w5rXwqpxR7P0O9YcfWc
	 HXAUOEJcydEMvPJWgOTSQ2aNA8EXshMXMnp0cmvyWSyQyXuvkpNvHBAcYmL6V1fooB
	 svC08zE9wNyjg==
Date: Tue, 10 Dec 2024 08:53:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] perf/dwc_pcie: Qualify RAS DES VSEC Capability by
 Vendor, Revision
Message-ID: <20241210145335.GA3239578@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a1ef0d2-be24-4865-8e23-159d001ac6d6@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_065339_392455_1F6A7C5C 
X-CRM114-Status: GOOD (  12.70  )
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

On Tue, Dec 10, 2024 at 08:04:17PM +0800, Shuai Xue wrote:
> 在 2024/12/10 06:29, Bjorn Helgaas 写道:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > PCI Vendor-Specific (VSEC) Capabilities are defined by each vendor.
> > Devices from different vendors may advertise a VSEC Capability with the DWC
> > RAS DES functionality, but the vendors may assign different VSEC IDs.
> > 
> > Search for the DWC RAS DES Capability using the VSEC ID and VSEC Rev
> > chosen by the vendor.

> > -	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
> > +	for (vid = dwc_pcie_pmu_vsec_ids; vid->vendor_id; vid++) {
> 
> How about checking the pdev->vendor with vid->vendor_id before
> search the vesc cap?
> 
> +		if (pdev->vendor != vid->vendor_id)
> +			continue;

Every user of VSEC needs to specify the (Vendor ID, VSEC ID) and
verify that the Vendor ID matches the device Vendor ID, so
pci_find_vsec_capability() does this check internally, so I don't
think we need to do it here.

> >   		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
> > -						DWC_PCIE_VSEC_RAS_DES_ID);
> > -		if (vsec)
> > -			break;
> > +						vid->vsec_id);


