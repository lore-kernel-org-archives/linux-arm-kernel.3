Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A5FCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 19:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ExLOTvMpNdwpLI0kZtOgkFwCcZ4IqWfr3EbUwrSECg=; b=0gzihVrhWVIPnO5ZIjBhfkwVHR
	1r0YAIMpyrois9r1noJTJtRI9xP+TBnHA+iZ/ykmjoq8SaxQoh9wKCRsrgbFl0XTSYnBiXis1FZHJ
	I1SoLl8URtsWlrwvwB2TiTR/gH/D4pRw1owW7XdsNASE3AzdBgSxM4/eqe4F0b7rqhpE4FSg273cE
	6bYV4z6hhu4aQ5aJkA98r8sEzr4zLJHcCnzoV56uWiJo6AA2ELgZ/s08nWFwGHadJ4BauFrwwl+9q
	vh5DvREWGDIW5rba9UzUqakJyw2oxpwuDnT5M6tGRmcOnQaqh6O3HW8cttg2HVWAqYOzTr2D5y9tK
	rqn+r4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRFr-00000001G4L-2HQx;
	Thu, 15 Oct 2026 19:36:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRFp-00000001G3o-49YX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 19:36:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AD6840596;
	Thu, 15 Oct 2026 19:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4411F000C4;
	Thu, 15 Oct 2026 19:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792093001;
	bh=0ExLOTvMpNdwpLI0kZtOgkFwCcZ4IqWfr3EbUwrSECg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kLw0KzYYomReQQbQQ+K2sJiVxDSsJH3OUDHmvawLUtBzvBzvcoW02JSoYsrIVSOS9
	 o3t+C+DkAJOuGf8MwzrhLtFqBHaKpuB89H0Eqh8m3+VrAI/Qaxxgrty/FBnR9QmXbc
	 mV+TBLIA4H6rnBhyWJRcwojbpXOxNKsODmequC9xvI5dGd5vBUad4/F0uLMJzOldK0
	 T8t3g8LrSrBoo9dTrKfxNetSr+mDHHmzhX6hSeT3ZK99f/QhtkTUQnp1NUyPJra700
	 T+eGYsGTzKY8rFD1jN0Q+jSpSCCSCYLlI+KA4Qie5tMdCcCdVE826GzWfz5sj6+yP5
	 /nKwaas4pTTog==
Date: Thu, 15 Oct 2026 14:36:39 -0500
From: Rob Herring <robh@kernel.org>
To: Yin Li <yin.li@oss.qualcomm.com>
Cc: James Morse <james.morse@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	ganapatrao.kulkarni@oss.qualcomm.com,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
Message-ID: <20261015193639.GE5059-robh@kernel.org>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
 <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
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

On Mon, Oct 12, 2026 at 06:24:06PM +0800, Yin Li wrote:
> 
> 
> On 10/12/2026 3:05 PM, Yin Li wrote:
> > 
> > 
> > On 10/9/2026 5:27 AM, Rob Herring wrote:
> > > On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
> > > > From: Rob Herring <robh@kernel.org>
> > > > 
> > > > The binding is designed around the assumption that an MSC will be a
> > > > sub-block of something else such as a memory controller, cache
> > > > controller,
> > > > or IOMMU. However, it's certainly possible a design does not have that
> > > > association or has a mixture of both, so the binding illustrates
> > > > how we can
> > > > support that with RIS child nodes.
> > > > 
> > > > A key part of MPAM is we need to know about all of the MSCs in
> > > > the system
> > > > before it can be enabled. This drives the need for the genericish
> > > > 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
> > > > until a h/w specific driver potentially enables the h/w.
> > > > 
> > > > Cc: James Morse <james.morse@arm.com>
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: James Morse <james.morse@arm.com>
> > > > [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
> > > >    standalone arm,mpam-msc and the two-item combination; fix
> > > > schema field
> > > >    order, type constraints and yamllint spacing; fix example reg
> > > > addresses,
> > > >    add arm,mpam-device phandle and remove TODO comment ]
> > > > Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> > > > Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> > > > Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> > > > ---
> > > >   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202
> > > > ++++++++++ +++++++++++
> > > >   1 file changed, 202 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> > > > b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> > > > new file mode 100644
> > > > index 000000000000..3c7b13a23ff2
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> > > > @@ -0,0 +1,202 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
> > > > +
> > > > +maintainers:
> > > > +  - Rob Herring <robh@kernel.org>
> > > > +
> > > > +description: |
> > > > +  The Arm MPAM specification can be found here:
> > > > +
> > > > +  https://developer.arm.com/documentation/ddi0598/latest
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: arm,mpam-msc                   # Further details
> > > > are discoverable
> > > > +      - items:
> > > > +          - const: arm,mpam-memory-controller-msc
> > > 
> > > Why do we need this?
> > > 
> > 
> > Hi Rob,
> > 
> > Thanks for the review.
> > 
> > The 'arm,mpam-memory-controller-msc' compatible is needed because,
> > unlike cache MSCs, memory controller MSCs cannot rely on the parent node
> > to identify the resource type.
> > 
> > Cache controllers universally carry a 'cache' compatible, so the driver
> > can recognise any cache parent and derive the cache ID from standard
> > properties. No equivalent convention exists for memory controllers, and
> > the component ID comes from the MSC's own 'numa-node-id' rather than the
> > parent, so there is no parent attribute to rely on.
> > 
> 
> Hi Rob,
> 
> As a follow-up to my previous reply:
> Whatever the outcome of the discussion on "arm_mpam: Add support for
> memory controller MSC on DT platforms", we will keep the binding and
> driver support consistent. If it's dropped, the
> 'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, and
> the memory controller example will be removed together.

Which parts are you actually using/needing and not using? If you don't 
need RIS support, for example, we should drop it.

Rob

