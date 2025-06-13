Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E61C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psi7vSnV49fu6rFcSZDC3KIcvwiVqLbYE5DgAHZ1Dxo=; b=lkUuqrHz0LgNkj+k6fy9li64B7
	hi9kXfb1ls6CWYnoK4YhsTf6UTtVesQdlh6yukjpkQcTMyByNP65U4LVYM1hxEJA7mzoD01G7gmyM
	AKKKK7DeoKWOYOHeZW1msY0lwuqSzg+DVDiL/+ZH6NzcGYZMLlSuQPqMA4V/AfNBnSAFwMfxfkUuo
	TMjEoYemELjX/o2XBcYmeF7oddrjKEkCR7vyZ0eJqosGM4fBFW7jjH1aQCM3yipJo/kiBqQmOvRg+
	PMtpEx7a33JfPcSu/fr/1GygRJVj/80FpmJtowgR3/6yuilRk3THJMLuOLrp59X8b+FqFsxwJHWyd
	e0iBKBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxCA-0000000FPBG-0nHD;
	Fri, 13 Jun 2025 05:43:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx5x-0000000FOS2-26CS;
	Fri, 13 Jun 2025 05:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8B0EA4FF10;
	Fri, 13 Jun 2025 05:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD44C4CEE3;
	Fri, 13 Jun 2025 05:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749793011;
	bh=JJcCqKW7LXqyOZrK1HJFUxRa9D1FKrSjC3MG6GISIC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVFtVRcpRQIFO4mHnvudrWjYj+HKuvEE1lRRW865Rh/YuC4AuPraomY3jpJ1Mgioe
	 27LxYK0VXLKuqkY3VxF95GJkwlpNeUobZJpI0eA9EfyssFCuVb/rsH2drEMNSlJZAV
	 EeMOAIQpyL6cciRHEYIEug2c2dzBlEEWw8fC2fRuGu4YTWfCzKV/ffw0iDvBHL/0HW
	 rT2WjUvss4//18xLvlPwHrKosYGf/KAGpbTRQYlOlNTiU7phKS/1Db9DbdAx3v4hlO
	 rH9i8gaA8VSTgrMIS3G96zjIEsaMnAsYIBvQMOvq6M3hNsU0v1/GNZD/YOosrCmVRJ
	 2p5S7tN5Pfd7w==
Date: Thu, 12 Jun 2025 22:36:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250613053624.GA163131@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611035842.GB1484147@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_223653_598519_B9D0CC60 
X-CRM114-Status: GOOD (  20.55  )
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

On Tue, Jun 10, 2025 at 08:58:42PM -0700, Eric Biggers wrote:
> On Wed, Jun 11, 2025 at 11:46:47AM +0800, Herbert Xu wrote:
> > On Tue, Jun 10, 2025 at 08:39:57PM -0700, Eric Biggers wrote:
> > >
> > > Do you have a concrete example (meaning, a specific driver) where this actually
> > > matters?  Historically, export and import have always had to be paired for the
> > > same transformation object, i.e. import was called only with the output of
> > > export.  There is, and has never been, any test that tests otherwise.  This
> > > seems like a brand new "requirement" that you've made up unnecessarily.
> > 
> > It's not just drivers that may be using fallbacks, the ahash API
> > code itself now relies on this to provide fallbacks for cases that
> > drivers can't handle, such as linear addresses.
> > 
> > I did add the testing for it, which revealed a few problems with
> > s390 so it was reverted for 6.16.  But I will be adding it back
> > after the s390 issues have been resolved.
> 
> Okay, so it sounds like in practice this is specific to ahash_do_req_chain()
> which you recently added.  I'm not sure what it's meant to be doing.

You do know that most of the sha512 asynchronous hash drivers use custom state
formats and not your new one, right?  So your code in ahash_do_req_chain() is
broken for most asynchronous hash drivers anyway.

- Eric

