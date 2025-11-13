Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14195CD5BC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA87zm0A/KIfjpNTRJ5k0qVgqxu9BDqy6lSa7HJz5B8=; b=jLyl0cMy9FvxG0JJB4zvaWDHrD
	zET9TmdJd9oKdAk1SHdyzrG4BKSTy14cUdZm0HssBX4asQy8NeuM7hbkpPZ7s9aBC7T31bWtH8vMy
	WwYP8Olon0Y8QZFTbVhej1zKl2Ri+AcvBWrMJrTT8rqeNH+ZJhe6IX7gBv9eDxB2ZpB0iYaJsrHLp
	9WXwNP9iFYVxTTWyHeun/PsRADN8kvmcMrcG8y4PmJ3sC1S3F9hUHkftZ36kGe4DH8XAMpb63JdYs
	4gZCebalpiGRGG5YS5qT3Uj3OAB3JCJQNKEPdrvYIGAf3Jqw11dKlotWiUq1I1g5T6LH8f8I9VMnE
	vzKqDa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV6n-0000000AMB3-0ifx;
	Thu, 13 Nov 2025 11:03:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV6k-0000000AMA3-2OFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:03:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E54CA402D3;
	Thu, 13 Nov 2025 11:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68F0C4CEFB;
	Thu, 13 Nov 2025 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763031797;
	bh=ngxDsHs+gyZoiXhhi+7OCraVp2aZOKOSsKjoR4FXO3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hC/xrEOea+HYoU6bwutfDObRumwzqS/afClX68ePFZoYQ6sBrmB6zy3yzKz4n5bm+
	 8eMM7OsxfjYYkAxuMkOhOa8PH+0BrY4z+9dpXIYWvIUzYJvu/JPLU6qLbUp7PhlkNj
	 woy7fAJrpIVHpkY6zfpXprqPSiasfc9d6X/iJA831Hn9+pDpek184wHVVuzfrbT6Zz
	 7jq2wx8Uh9JX+Ach9hDzQ7H/DTiWHnhja5hGf7iMneoX35+yp914YI0f4VnapzobLT
	 rZNbXhlAO6DIRJLw6H8JS6nJvrfCmYer3sWHy64+tf7YTu/R6/MBN9umQWmS2xzKxK
	 7qVqMOLa70VaQ==
Date: Thu, 13 Nov 2025 11:03:12 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	mark.rutland@arm.com, paulmck@kernel.org, mhiramat@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: arm64: pseudo NMI bootconfig question
Message-ID: <aRW68JGA4xBGxjbs@willie-the-truck>
References: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
 <86v7jftjq5.wl-maz@kernel.org>
 <sf4iq6uyq64lbrrggwssq2hxslk2qyetm3owplw5rwzqgnemrn@o4beszh5aewh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sf4iq6uyq64lbrrggwssq2hxslk2qyetm3owplw5rwzqgnemrn@o4beszh5aewh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_030318_633459_6B33DE22 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Nov 13, 2025 at 01:36:48AM -0800, Breno Leitao wrote:
> Helo Marc,
> 
> On Wed, Nov 12, 2025 at 02:21:22PM +0000, Marc Zyngier wrote:
> > On Wed, 12 Nov 2025 14:05:43 +0000,
> > Breno Leitao <leitao@debian.org> wrote:
> ...
> > > Question:
> > > 
> > > Would it make sense to provide an option to enable pseudo NMI in certain
> > > kernel configuration without requiring an extra command-line parameter?
> > 
> > [I wasn't asked, but I'll give my answer anyway]
> > 
> > The short answer is no. The long answer is that there is so much
> > broken HW out there that dies a painful death when enabling pseudo-NMI
> > that is isn't practical to do so.
> 
> That’s helpful to know. I hadn’t realized there were potential issues
> with hardware implementation, which explains why it isn’t
> straightforward to enable. Thanks for the additional context.

FWIW, I've also run into platforms where the _hardware_ is fine but the
TZ integration can't handle Linux using priority masking properly.

Will

