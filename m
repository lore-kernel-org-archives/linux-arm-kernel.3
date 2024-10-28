Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D19BD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jglMBUH0rqWlBMLOhgpBoBeEyEUwnWucC7PIWz9hsqQ=; b=NpQvAXYiuLa134cBpiSqeU77cr
	sw4auwh+uq4tk/EqLpZoH8oZKHJXR7123d9aooJWMX0bILnS92/8hG+kIjkXe0GmxSTT8+2oFhT6h
	j2iCnw9TeBdnuol7P9dR0K7uiKJGsDQCR7NBTfcpbfZyl25fjoNsTp9QStUGg1wv3HjAreFFw9h7i
	15Gje8K+AXhF6PqEkGcHKeXotNgCoo12uToNY4jn7CanXT1Ro+RnbbxwbzSok9s9nsEYvnjw7DcFD
	i4iIrrtN8L7MjxdwBAi16MpJCpE5nUxns/AMtBV8EIKpUk+HLCDtNpUj3UaERaAlPzCiYHWhrIlMo
	Ubebd2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XNA-0000000CLi3-0cko;
	Mon, 28 Oct 2024 21:34:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Whx-0000000CFqU-3xab
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66A3E5C5B1D;
	Mon, 28 Oct 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BFBC4CEE7;
	Mon, 28 Oct 2024 20:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730148685;
	bh=YVImwvRfK5SkCR0Ri+wW4EXpx6zRqJl2vuY6cmlakVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzBf1/SJXyeqwRAdwQRA5eLFwrmd+2xOAyN2y+115dwiC7KaEjKok+w6qdFBnnJ9e
	 wEPiii/iF6oS9zRIymChTAi0YQ6owStm5c4K35txnWSoZpBht8uty2CnLxWUlUTmpK
	 wFDDqKDnwzPy7aPCkhYw1Q2ijJQ/UoPJg9BzTAZUAnvf+NOnyNrTPgW3j2VjdjYTg8
	 0J0XBvD5qXF96x7F5u6G+YxotYCj2NGtaNliZnIdAdYyd2+ZEeWYQ0fV9lzR2nYsMZ
	 tZzGxZwFgtcdFoh38kLOrOTqEuSZckUL3Qm5aKc6+CtIXmCrolMHSQwu+6DYRSY/TQ
	 iORK8RDRSd8SA==
Date: Mon, 28 Oct 2024 20:51:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <0618af23-dca7-40b9-a083-47de9fcd7e50@sirena.org.uk>
References: <cover.1729715266.git.lorenzo.stoakes@oracle.com>
 <6e8deda970b982e1e8ffd876e3cef342c292fbb5.1729715266.git.lorenzo.stoakes@oracle.com>
 <61461dcc-e455-450d-9c01-5465003fc31c@sirena.org.uk>
 <c24a174d-c8f3-4267-87ae-cf77fa587e82@lucifer.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HPJWBhFva0ZUDklg"
Content-Disposition: inline
In-Reply-To: <c24a174d-c8f3-4267-87ae-cf77fa587e82@lucifer.local>
X-Cookie: Remember the... the... uhh.....
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_135126_048977_7D25F7ED 
X-CRM114-Status: GOOD (  15.22  )
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


--HPJWBhFva0ZUDklg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 28, 2024 at 06:57:25PM +0000, Lorenzo Stoakes wrote:
> On Mon, Oct 28, 2024 at 06:29:36PM +0000, Mark Brown wrote:

> > any meaingful detail.  There's nothing particularly instructive in the
> > test logs, just plain reports that the tests failed:

> On these memory allocation failures, could you tell me what errno is? Could you
> check dmesg for anything strange?

Looks like this is mostly figured out already but JFTR:

As I said in the report there's nothing in the logs that I noticed,
anything there is that I've missed should be in the linked logs.  The
errnos I'm seeing are all:

# mmap(): Invalid argument (22)

> >   # # FAIL: mmap allocation

> Interesting that it MAP_FAIL's though. This could be arch_validate_flags() being
> moved around.

> Could you do me a further favour then and try a kernel at this commit with:

> 	/* Allow architectures to sanity-check the vm_flags. */
> 	if (!arch_validate_flags(vm_flags))
> 		return -EINVAL;

> In mmap_region() commented out?

Unsurprisingly given the above and the rest of the thread commenting out
that check causes the affected tests to pass, I didn't check for any
additional impacts.

--HPJWBhFva0ZUDklg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcf+UYACgkQJNaLcl1U
h9CZHQf9FUhFRBSQGkNvWmC10WNDKbe/eWlGst9t5uiegBC++Eao7ztSSeFz/jHE
FkqU4UEL8vgXe3qXhgI9JJD1YqU6g3lWuQPqmMR6g7spS8HDDAvcngWQG7fkZfMj
iabxxefEINHDHC0tQhqXOiPfnAdXKu+q7tCOBbLpx82hkVOybKbJI+Y0lbk+QrQZ
cPXneploajNGet5UF84W8ph/zc9jbyCDAh8zrR4tsalEHhAbyKf52n7Q5GCnr5hf
HSCguShWK5nzbi0Q3ejHEJe0h7G0A28EC1m8RFqGS3YN8VI+HxWOwQUuFXpdxh1H
SmC+WOXm/4ZelGFwPz3DNLXqvDoJYA==
=2rTT
-----END PGP SIGNATURE-----

--HPJWBhFva0ZUDklg--

