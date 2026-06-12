Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E178ECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhPHLYbQyUfvef9/xCIIY8vt5USpJP7O50ve0Xr9Fco=; b=qLVHLEzmp+KHKBpTqPwKltZ1lb
	ntUjrtpst2VnMdQmNz5Pt5J0N19la6FP6OrjwLznxtnPYaoEYuNmL61aj29cX4WTVg4nWU7J8Z7fs
	274sNA0ARUN14tTfcrdm35/4MyBL+WeZkkrBpGLEwnQnY8BNRajqnW9pNeft7SS8VLPZpbepa3CLZ
	ImRSL6VQGX0GsGOkFraD4m7Uxb5kdpc1qbmL1/P2cn/Fr7FPQ+ippqfJJ2LV8A6mqitsVUNu/Uf7a
	5V7icCPCxQTr2B3L+zGHRW3lRge0wz68s+AsHOtDa2E0AlRP0alMubo4KR2+Ybbp7UD01WYXibD8Y
	f03IbSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3C5-0000000B6fZ-1spl;
	Fri, 12 Jun 2026 14:49:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3C4-0000000B6fM-1KI0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:49:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CC0260098;
	Fri, 12 Jun 2026 14:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC861F000E9;
	Fri, 12 Jun 2026 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781275751;
	bh=qhPHLYbQyUfvef9/xCIIY8vt5USpJP7O50ve0Xr9Fco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KqQ3m+jibMcuY8vurw+rG7VdytA6Y6cMHo3roJQ8ImJswxu7g5OQsf6U9DmgKL9Ok
	 tMoVfnttQQhbTRLujJvFm4Z3bZ7gZzKPvuegSKFNGFlYLiavZptALOMGNFohVAJBsU
	 S2cf3GfT9s6pAt3G7PxxKl9WEcH0ikXnznL9+1kH7Dm5xiZa7amZAbjMwEevZ45B4a
	 vJr8GleYk5liMgzbxAkB3mPRM5aQevk6Yqrzi9aFtqJTDnvJHo9OtiT8zww01quWWU
	 JZFWZqvYd6+3/nlD+3b8S1gml9lQE6KMYyGi9pVigyovlwi1JcYwRC3L4eQz6SwZW2
	 qxF4lWtteSQaQ==
Date: Fri, 12 Jun 2026 09:49:10 -0500
From: Rob Herring <robh@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>, will@kernel.org,
	xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
	mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org,
	bp@alien8.de, tony.luck@intel.com, guohanjun@huawei.com,
	lenb@kernel.org, skhan@linuxfoundation.org,
	vishal.l.verma@intel.com, rafael@kernel.org, corbet@lwn.net,
	ira.weiny@intel.com, dave.jiang@intel.com, krzk+dt@kernel.org,
	catalin.marinas@arm.com, alison.schofield@intel.com,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	Michael.Zhao2@arm.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	Dmitry.Lamerov@arm.com, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 09/10] dt-bindings: firmware: add arm,ras-cper
Message-ID: <20260612144910.GA989816-robh@kernel.org>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
 <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-9-2e0500d42642@arm.com>
 <20260529174407.7081ad0b@jic23-huawei>
 <ceb19cb6-7083-44ad-a262-a8198f489257@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb19cb6-7083-44ad-a262-a8198f489257@arm.com>
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

On Thu, Jun 11, 2026 at 03:22:21PM +0100, Ahmed Tiba wrote:
> On 29/05/2026 17:44, Jonathan Cameron wrote:
> > On Fri, 29 May 2026 10:50:49 +0100
> > Ahmed Tiba<ahmed.tiba@arm.com> wrote:
> > >   .../devicetree/bindings/firmware/arm,ras-cper.yaml | 54 ++++++++++++++++++++++
> > >   MAINTAINERS                                        |  5 ++
> > >   2 files changed, 59 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> > > new file mode 100644
> > > index 000000000000..3d4de096093f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> > > @@ -0,0 +1,54 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:http://devicetree.org/schemas/firmware/arm,ras-cper.yaml#
> > > +$schema:http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Arm RAS CPER provider
> > > +
> > > +maintainers:
> > > +  - Ahmed Tiba<ahmed.tiba@arm.com>
> > > +
> > > +description:
> > > +  Arm Reliability, Availability and Serviceability (RAS) firmware can expose
> > > +  a firmware-first CPER error source directly via DeviceTree. Firmware
> > > +  provides the CPER Generic Error Status block and notifies the OS through
> > > +  an interrupt.
> > I'd like some spec references in here if possible.
> I can add a reference to the UEFI CPER specification for the Generic
> Error Status record format.
> 
> For the firmware-first DT description itself I do not have a more specific
> public reference to cite.

Is there a platform actually using this with DT (FVP doesn't really 
count)?

Rob

