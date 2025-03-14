Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2681FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrFrm/2hwbruE66k6R4LMQeag7x0+Egku8oU2dL9R2s=; b=0Af5gv606+eemt0hYfdQmjH2qs
	o+UQN2JCjhOxp8c+FNUgouPBCM3q/SHNVk9W9s/SDqfSD7gQpKc7YIiCR3DtZrUwEzA1GK/QJ+3EY
	Gd74q/Tg9/HNSMcFYP1+zhMADpeZQ5drh4Di+nBwVqSnIey96+9NaoIcDNqlmJONHY0vSBFY5TNsK
	vfw5kWM2wMYZWIu/dSoHrf29qHuhogAzjU1paw81cEJUwe3jThLB+gPvxTOiSRJmVSgwkI1YAT5kP
	n4DRipjzSqDRS3QiKBuhtxRQQ1zZEPrpFop5fbyW6mHyDHfsjAyyJJ56z1heTiHoIb4/qYKJbgOsc
	mHd/1y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt321-0000000DyIp-01wD;
	Fri, 14 Mar 2025 11:16:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt30L-0000000DyDY-0ygo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 11:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C5F3A4518D;
	Fri, 14 Mar 2025 11:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1ABC4CEE9;
	Fri, 14 Mar 2025 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741950904;
	bh=VVaB597JRQGCm3zlkTNd3pHposxN/EcIibtdcYxFwCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jyg+GrkYkCQK0wf5/evfw05HX1ibkvofK77t8BjiKaPMEsgn0/OY1Slx45CMn9AS5
	 sa6TYTjbm6z60I9iANwvpshas8WpnlilxkF3rUf++RJrEy/q5qQdnRDwTs2p+aaSTs
	 6ML2dyzvLZqD4N19jDbk62dpfb/8ARBWqXUw95hk/FV5rt+QWQDviHkyLNHElSPLih
	 jsmrJ803mbznBOpJT49bOXk8UVmeNrJ0wrBS6LRgF1bdUjnOY+lIFKtaULoXXi+nGV
	 7Ep+VPJOk/B2dxIa2jcwdT4JdP7/2Cj7brqQPtVDQhu6GHr9wlnb1KdcPR0VK6DrN7
	 g22xYEBJje3cQ==
Date: Fri, 14 Mar 2025 11:14:58 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, mark.rutland@arm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
Message-ID: <20250314111457.GA8834@willie-the-truck>
References: <20250226215520.1759218-1-tabba@google.com>
 <20250226215520.1759218-4-tabba@google.com>
 <Z8ISLxQRcsx2uuHw@google.com>
 <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
 <20250303191811.GA30361@willie-the-truck>
 <CA+EHjTySqDHDpOy=Vix5ZaNKWg61coySvV3Yk=+i0p8vg3mXTQ@mail.gmail.com>
 <20250303214947.GA30619@willie-the-truck>
 <CA+EHjTzZQ6UnOdaqpZ86JNiY=Gr_UoBAjZxk4CS3Q6nMJYdV2w@mail.gmail.com>
 <20250312152903.GA6488@willie-the-truck>
 <CA+EHjTwHb9mDj20WxeqKky6oAfRDV2R7iiQpwmuBmdZ4aWuS4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwHb9mDj20WxeqKky6oAfRDV2R7iiQpwmuBmdZ4aWuS4A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041505_333040_10847F9E 
X-CRM114-Status: GOOD (  14.05  )
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

On Wed, Mar 12, 2025 at 03:31:17PM +0000, Fuad Tabba wrote:
> On Wed, 12 Mar 2025 at 15:29, Will Deacon <will@kernel.org> wrote:
> > On Tue, Mar 04, 2025 at 12:33:27PM +0000, Fuad Tabba wrote:
> > > If you agree, I could whip up something and send it soon.
> >
> > Yeah, I think we should fix this as a separate series and drop the
> > WRITE_ONCE() from this patch.
> 
> I'll send a fix soon.
> 
> Oliver, would you like me to respin this series, or can you drop the
> WRITE_ONCE()?

With the WRITE_ONCE() dropped:

Acked-by: Will Deacon <will@kernel.org>

Cheers,

Will

