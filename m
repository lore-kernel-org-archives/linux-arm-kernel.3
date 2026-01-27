Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE965D2FED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1e4oSHFrcFoT6MCe9M2loFr8ezu3DpCgZa4h2G9Bg+c=; b=DhOq2tHjwDBsaLt0wdQFsn/P3/
	ipKHD+/TosTR6r5y29h3wsj+kOx0nUoHFJ4c5vn936YbCtzxw/uwBTc+mcm74YZRowCV0nsM7m/OH
	KCUAAeP1gbHZJEsgMq8K/h7V3LzJ5ySWNX3DP+zGcubUFju5kZpPVynWCePIpLSEUAKE10HygtZDy
	P/201LAr9QLT1z1KSVh+WlzuntPpfRuBM3cQZ+gjUI13d2uL5udjB2d4VpZddFDEh50jQl4Bzzsof
	5096w5SgkDTnL+Q2Cs8dmuTlkYXhHXNbChupBQcYsp40+9WHPg53HOsodn9jy3BbupjEdfO1pn+fh
	Yy3tAVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko5Y-0000000Eq9J-0aGI;
	Tue, 27 Jan 2026 18:46:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko5V-0000000Eq8Y-14gA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:46:54 +0000
Received: from skinsburskii.localdomain (c-98-225-44-182.hsd1.wa.comcast.net [98.225.44.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 87A2D20B7165;
	Tue, 27 Jan 2026 10:46:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 87A2D20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1769539612;
	bh=1e4oSHFrcFoT6MCe9M2loFr8ezu3DpCgZa4h2G9Bg+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfA8t0ycPr0ZXVV61FD2wHGv1yA+vaVu70mo5o6KiWjFcAr+6XBmpjL8fPsaWPagS
	 dTjjYbjChgBB8NMthtRP4QM/ttne2XxdMchgBZKeeF8Cwn1hxRNkEx3JK56tLSu8i/
	 +rmmRqnHQgLPb7G0Q49P0YjegKtxxCjcCd9Laclw=
Date: Tue, 27 Jan 2026 10:46:49 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 12/15] x86/hyperv: Implement hyperv virtual iommu
Message-ID: <aXkIGfos4l0kv_lF@skinsburskii.localdomain>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-13-mrathor@linux.microsoft.com>
 <aXAZ-r1PeUBAHwaK@skinsburskii.localdomain>
 <54fd73b9-ade6-f1bb-08fc-17571aeadb20@linux.microsoft.com>
 <aXeO7wh7bpacJ1Sk@skinsburskii.localdomain>
 <c40e6dc8-8e42-b0f3-f8e5-3c637adb7f13@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c40e6dc8-8e42-b0f3-f8e5-3c637adb7f13@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_104653_325317_F7334508 
X-CRM114-Status: GOOD (  36.65  )
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

On Mon, Jan 26, 2026 at 07:02:29PM -0800, Mukesh R wrote:
> On 1/26/26 07:57, Stanislav Kinsburskii wrote:
> > On Fri, Jan 23, 2026 at 05:26:19PM -0800, Mukesh R wrote:
> > > On 1/20/26 16:12, Stanislav Kinsburskii wrote:
> > > > On Mon, Jan 19, 2026 at 10:42:27PM -0800, Mukesh R wrote:
> > > > > From: Mukesh Rathor <mrathor@linux.microsoft.com>
> > > > > 
> > > > > Add a new file to implement management of device domains, mapping and
> > > > > unmapping of iommu memory, and other iommu_ops to fit within the VFIO
> > > > > framework for PCI passthru on Hyper-V running Linux as root or L1VH
> > > > > parent. This also implements direct attach mechanism for PCI passthru,
> > > > > and it is also made to work within the VFIO framework.
> > > > > 
> > > > > At a high level, during boot the hypervisor creates a default identity
> > > > > domain and attaches all devices to it. This nicely maps to Linux iommu
> > > > > subsystem IOMMU_DOMAIN_IDENTITY domain. As a result, Linux does not
> > > > > need to explicitly ask Hyper-V to attach devices and do maps/unmaps
> > > > > during boot. As mentioned previously, Hyper-V supports two ways to do
> > > > > PCI passthru:
> > > > > 
> > > > >     1. Device Domain: root must create a device domain in the hypervisor,
> > > > >        and do map/unmap hypercalls for mapping and unmapping guest RAM.
> > > > >        All hypervisor communications use device id of type PCI for
> > > > >        identifying and referencing the device.
> > > > > 
> > > > >     2. Direct Attach: the hypervisor will simply use the guest's HW
> > > > >        page table for mappings, thus the host need not do map/unmap
> > > > >        device memory hypercalls. As such, direct attach passthru setup
> > > > >        during guest boot is extremely fast. A direct attached device
> > > > >        must be referenced via logical device id and not via the PCI
> > > > >        device id.
> > > > > 
> > > > > At present, L1VH root/parent only supports direct attaches. Also direct
> > > > > attach is default in non-L1VH cases because there are some significant
> > > > > performance issues with device domain implementation currently for guests
> > > > > with higher RAM (say more than 8GB), and that unfortunately cannot be
> > > > > addressed in the short term.
> > > > > 
> > > > 
> > > > <snip>
> > > > 
> > 
> > <snip>
> > 
> > > > > +static void hv_iommu_detach_dev(struct iommu_domain *immdom, struct device *dev)
> > > > > +{
> > > > > +	struct pci_dev *pdev;
> > > > > +	struct hv_domain *hvdom = to_hv_domain(immdom);
> > > > > +
> > > > > +	/* See the attach function, only PCI devices for now */
> > > > > +	if (!dev_is_pci(dev))
> > > > > +		return;
> > > > > +
> > > > > +	if (hvdom->num_attchd == 0)
> > > > > +		pr_warn("Hyper-V: num_attchd is zero (%s)\n", dev_name(dev));
> > > > > +
> > > > > +	pdev = to_pci_dev(dev);
> > > > > +
> > > > > +	if (hvdom->attached_dom) {
> > > > > +		hv_iommu_det_dev_from_guest(hvdom, pdev);
> > > > > +
> > > > > +		/* Do not reset attached_dom, hv_iommu_unmap_pages happens
> > > > > +		 * next.
> > > > > +		 */
> > > > > +	} else {
> > > > > +		hv_iommu_det_dev_from_dom(hvdom, pdev);
> > > > > +	}
> > > > > +
> > > > > +	hvdom->num_attchd--;
> > > > 
> > > > Shouldn't this be modified iff the detach succeeded?
> > > 
> > > We want to still free the domain and not let it get stuck. The purpose
> > > is more to make sure detach was called before domain free.
> > > 
> > 
> > How can one debug subseqent errors if num_attchd is decremented
> > unconditionally? In reality the device is left attached, but the related
> > kernel metadata is gone.
> 
> Error is printed in case of failed detach. If there is panic, at least
> you can get some info about the device. Metadata in hypervisor is
> around if failed.
> 

With this approach the only thing left is a kernel message.
But if the state is kept intact, one could collect a kernel core and
analyze it.

And note, that there won't be a hypervisor core by default: our main
context with the usptreamed version of the driver is L1VH and a kernel
core is the only thing a third party customer can provide for our
analysis.

Thanks,
Stanislav


