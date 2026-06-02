Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC389CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTMa3wbs9wKjuE3FChumE80na/HZhnWiymDIapbAGF0=; b=PT3S+m6emQiR1gBg88Tt8m+Ypd
	NF4wqJsv7WiDviV7Bfpf7M7Th6VpJyhua7cBRcrQUP93pQ2zAtHLU+Lce6XesBCx9yDABqrNBnNj2
	66Ne56aZ6Q+JOjSywCG/USP7xfF9de0wahvrW226wpQsHpgS5jjbh/zwi0Wb/fVGaBtb5VXqp7wSZ
	+/2QZBy5yfSy480s2eeVexhRUH64u5mEnbkYbK3KNA7usvAOiuEWVZQd1XrIm3dIViWl6pxwyT/yS
	I6qN8IYNh5wlA9JeHu5kIDCaFP/8duf2pz2ZIA3Ilg8u1AjZGryCdV9JeHDK7+T9CBffhi6WEMEOO
	pbA6vfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURzq-0000000DRsX-3vCD;
	Tue, 02 Jun 2026 16:29:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURzp-0000000DRrx-1pRb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:29:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF3376001A;
	Tue,  2 Jun 2026 16:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A9D1F00893;
	Tue,  2 Jun 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417780;
	bh=kTMa3wbs9wKjuE3FChumE80na/HZhnWiymDIapbAGF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jRXtIWCsdQ2C1OSNmb19XSv2BbMfG2UhOfsubkLC3p5rj3CkJvHvaltqe8fpAh7sk
	 dZAyCgUt5ta+LM3NhX0q8jAMLC2pCdZa2bfvKntglBDL4iS7ZTsC3eACVZbySdRBlx
	 Fx0/So56x3akOO06gDqcJejqGETDUF5FZOGmTM/TJuxjxSh4IBm+dGJoEsVxU15qdK
	 C64jNEveQuLsKj12AX5r1WRhIN9jzj/+8Y50z5CpOO0k3s/btGEevUPbvrgiGF0j7X
	 8nXyiFm2Cbdte3CqKKWzSDjigKIKTbLeKsZh6dWKNnKx4pK1y1qSo/03Y3qRnpotvQ
	 /lyDW9ryKwf8g==
Date: Tue, 2 Jun 2026 17:29:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Seth Forshee <sforshee@nvidia.com>
Cc: Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_ffa: Fall back to minimum buffer size
 if RXTX_MAP fails
Message-ID: <20260602-original-ocelot-of-witchcraft-dcdb96@sudeepholla>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-2-c071b12ae05c@nvidia.com>
 <20260602-defiant-perfect-bustard-cbf22e@sudeepholla>
 <ah8DDVyxO0vNH-nb@omni-lfn-logwh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8DDVyxO0vNH-nb@omni-lfn-logwh>
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

On Tue, Jun 02, 2026 at 11:21:33AM -0500, Seth Forshee wrote:
> On Tue, Jun 02, 2026 at 04:48:11PM +0100, Sudeep Holla wrote:
> > On Mon, Jun 01, 2026 at 03:45:12PM -0500, Seth Forshee wrote:
> > > FFA_FEATURES only supports a maximum size value for RXTX_MAP in v1.2+.
> > > Older implementations may still reject larger sizes, which can happen
> > > when the minimum size is rounded up to the page size when PAGE_SIZE >
> > > 4K.
> > > 
> > > Fall back to the minimum size when RXTX_MAP fails with
> > > INVALID_PARAMETERS to fix the regression on these platforms. This also
> > > has the side effect of falling back for v1.2+ with a maximum of 0 (i.e.
> > > no maximum), where the rounded-up value isn't expected to be rejected,
> > > but there's no harm in retrying with a smaller size and it might even be
> > > of benefit for a non-compliant SPMC.
> > > 
> > 
> > Is this needed on any of your platforms ? I don't want to push a solution
> > or fallback/workaround if there are no users for it.
> 
> Yes, we have platforms for which commit 83210251fd70 causes RXTX_MAP
> failures with page sizes larger than 4K.
>

And they are FF-A v1.1 or doesn't set max_buf size ? Sorry for being
pedantic, just want to be sure it is useful on real platforms before
pushing it as fix/workaround.

-- 
Regards,
Sudeep

