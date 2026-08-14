Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3421C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 22:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=43EJgsZqDVbV2DjeQ/GksSldFhIpCXxnr2u8QDpaJTE=; b=JUl5CTrxpoModb
	fJmyaSao7rd3wWphF3Q9nsOBCx1lzNo4SY5XdSEn5iB7c3bDOYMrAyaZ2bCNesBmqharHU+Rop2BA
	Mi1MPZ1jnzxgGtgBfb97SL3PrMtg59U5eMfHtw2hAaz2GQv0ZTkWc54eWVqsZqGof+Q1m6qkaGnod
	nxWnlImiwmQXWUiAtGeRWeb3AZPBH0yzRVKM3bN2Rp403d9lpuaPn6zF1QPjGdNijij5DruA/2iVb
	vEtHBuWYLLkza0hcrOrUGK2lHt/pR5f1TplJA1GZlJjROKTcspYyhGcdCb0wjq6slkOXL2AfIE8Xh
	aCuwxHNXsGNW6F6E1MOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv03D-00000003FG8-3NMH;
	Fri, 14 Aug 2026 22:06:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv03C-00000003FFy-3cxh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 22:06:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07C3D60008;
	Fri, 14 Aug 2026 22:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C631F000E9;
	Fri, 14 Aug 2026 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786745213;
	bh=43EJgsZqDVbV2DjeQ/GksSldFhIpCXxnr2u8QDpaJTE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=ksZSNSI4qVp+ZNRnuKGiTDmtvihG+f7HWyfWu2U1CiOA3t/q5PKYI7YJ9NbEq6uRV
	 D1jYBvEV7wqvdR04OkcmBhnYokh+Wu5TslKBH23vlbNwABCAvnmcEfzo0uklmfykB+
	 PSs7TYmstpmM9IplQYRPBEPgX6hwdygvzrMd6QJd99Rgdk96OrMPyzNMEsjcsHp5j4
	 sQZ+o6W51tNRUvvePQpHrg68dzF/4BE0AczHorskc3vcR7bobDUz9yVyUAyA7WjVPb
	 vF8xyU5ge7/TjD7iu9+JC30YEs+cG++044TwKr54O1NJUZ88ghk7jY/fR1y44NNbMB
	 ugxObgm8V7PJA==
Date: Fri, 14 Aug 2026 17:06:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: dmatlack@google.com, Nicholas Piggin <npiggin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sourabhjain@linux.ibm.com,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Russell King <linux@armlinux.org.uk>, radheys@amd.com,
	skhawaja@google.com, djeffery@redhat.com,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-arm-kernel@lists.infradead.org, souravsgl@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3 2/3] firmware/edd: use kobject_put() on
 edd_device_register() failure
Message-ID: <20260814220652.GA101268@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814210057.4102768-3-tarunsahu@google.com>
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

On Fri, Aug 14, 2026 at 09:00:56PM +0000, Tarun Sahu wrote:
> As per koject_init_and_add() function kernel document, even if this
> function returns error kobject_put must be used instead of kfree.

Thanks for adding this specific pointer.  I wouldn't repost just for
these nits, and wait at least a few days before reposting for any
reason.  But if you do repost:

s/koject_init_and_add/kobject_init_and_add/

Might also add "()" after function names consistently (kobject_put and
kfree above, edd_release below).  Also applies to the other patches.

The current subject lines basically restate the C code; you might
consider more of a focus on the problem.  I ran this through gemini
and I think it did a decent job:

  firmware: edd: Fix kobject reference leak on registration failure

  Per kobject_init_and_add() kernel-doc, calling kfree() directly on
  error bypasses reference counting and skips the kobject's release
  callback, leaking the reference.

  Use kobject_put() instead of kfree() on registration failure to fix
  this.

> When edd_device_register() fails after initializing the kobject with
> kobject_init_and_add(), calling kfree(edev) directly bypasses the
> kobject release callback (edd_release) and leaks the allocated kobject
> resources.
> 
> Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
> registration failure.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  drivers/firmware/edd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
> index f980c5b56858..763e7b16d517 100644
> --- a/drivers/firmware/edd.c
> +++ b/drivers/firmware/edd.c
> @@ -748,7 +748,7 @@ edd_init(void)
>  
>  		rc = edd_device_register(edev, i);
>  		if (rc) {
> -			kfree(edev);
> +			kobject_put(&edev->kobj);
>  			goto out;
>  		}
>  		edd_devices[i] = edev;
> -- 
> 2.55.0.691.gc56d675ccc-goog
> 

