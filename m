Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77984C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZHDV8WxmCGUTfH5hEGVKJUl7F0KHPQsvO/J3MOwfWo=; b=M2GhxXBtYmHYCTnjhxvLslsgPd
	hc/ufaCHAv6GjefFmRGQr/RGcnLoqyoiuoLUeDzlpkxc1GhMS9z6Gvwo3fXEPsrheyR5JR6HKIlki
	75zzcRS6KZ+lg32y2N2CM9tbr5kQhwQPczTxSge98Ms8Z/eD4gMAtIbwLau3CEP9CBb227nX1ATZr
	XURnUImfOVNWf7aRD6IUT8NmmcaIyEus0Dc7eYQK7rXL+urVCqwl9neakejvg3Qzr57iM7ilzXQlv
	41s6A5maiZ7USD/afiBO/9XaAlc1ZA/nuFbvMlO37A486tMs4NhX2irw6Jtj0poDnPADMwfvC/n4l
	ia5qPRpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesgf-000000078MZ-0jfA;
	Thu, 24 Jul 2025 09:56:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerZF-00000006uv1-0wIo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4120F5C611E;
	Thu, 24 Jul 2025 08:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A85C4CEED;
	Thu, 24 Jul 2025 08:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753346683;
	bh=W5JUrYlWpVqplvlRAQ32P5mkUBWD/SoUy8uvFQx3VPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9wTxRyA/shMXX/Hdia/1xI1mOy/8k8PUWnxUn/UH4jXnjjnrw3kkoRmKy8ekulDA
	 1YlZCz992kQNrY4Lj7mlw+mWJAS2FAnsKYdcq/bQ6E5Shq0p/mMDuhjebYmC1H1Ird
	 G8j+kbom/uO4IJgApS/mvDZFQSWSYtSzZsfoUfzJd1ibOFjA1LdREiDe20+femGcYf
	 FII8DCa8sNH9Nyo1JOS1bxgj3at+w89oszHew+ZD+iuIWgyNyyoXaEa3OO17DWTqlR
	 CZ4xt/+s9taRnEPOT69VQti+lx1CW9tuAlZiSKSLkLEU0if8FEaJEwNdkhb48HEBGO
	 8Q+YAEXESKH6w==
Date: Thu, 24 Jul 2025 09:44:38 +0100
From: Will Deacon <will@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	Breno Leitao <leitao@debian.org>, jasowang@redhat.com,
	eperezma@redhat.com, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
Message-ID: <aIHydjBEnmkTt-P-@willie-the-truck>
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
 <20250724034659-mutt-send-email-mst@kernel.org>
 <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
 <20250724042100-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724042100-mutt-send-email-mst@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014445_306335_398D421C 
X-CRM114-Status: GOOD (  22.54  )
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

On Thu, Jul 24, 2025 at 04:22:15AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 24, 2025 at 10:14:36AM +0200, Stefano Garzarella wrote:
> > CCing Will

Thanks.

> > On Thu, 24 Jul 2025 at 09:48, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Jul 23, 2025 at 08:04:42AM -0700, Breno Leitao wrote:
> > > > Hello,
> > > >
> > > > I've seen a crash in linux-next for a while on my arm64 server, and
> > > > I decided to report.
> > > >
> > > > While running stress-ng on linux-next, I see the crash below.
> > > >
> > > > This is happening in a kernel configure with some debug options (KASAN,
> > > > LOCKDEP and KMEMLEAK).
> > > >
> > > > Basically running stress-ng in a loop would crash the host in 15-20
> > > > minutes:
> > > >       # while (true); do stress-ng -r 10 -t 10; done
> > > >
> > > > >From the early warning "virt_to_phys used for non-linear address",
> > 
> > mmm, we recently added nonlinear SKBs support in vhost-vsock [1],
> > @Will can this issue be related?
> 
> Good point.
> 
> Breno, if bisecting is too much trouble, would you mind testing the commits
> c76f3c4364fe523cd2782269eab92529c86217aa
> and
> c7991b44d7b44f9270dec63acd0b2965d29aab43
> and telling us if this reproduces?

That's definitely worth doing, but we should be careful not to confuse
the "non-linear address" from the warning (which refers to virtual
addresses that lie outside of the linear mapping of memory, e.g. in the
vmalloc space) and "non-linear SKBs" which refer to SKBs with fragment
pages.

Breno -- when you say you've been seeing this "for a while", what's the
earliest kernel you know you saw it on?

> > > > I suppose corrupted data is at vq->nheads.
> > > >
> > > > Here is the decoded stack against 9798752 ("Add linux-next specific
> > > > files for 20250721")
> > > >
> > > >
> > > >       [  620.685144] [ T250731] VFIO - User Level meta-driver version: 0.3
> > > >       [  622.394448] [ T250254] ------------[ cut here ]------------
> > > >       [  622.413492] [ T250254] virt_to_phys used for non-linear address: 000000006e69fe64 (0xcfcecdcccbcac9c8)

So here's the bad (non-linear) pointer. Do you know if 0xcfcecdcccbcac9c8
correlates with the packet data that stress-ng is generating? I wonder if
we're somehow overflowing vq->iov[].

Will

