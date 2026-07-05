Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DBFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnPYEc03Tz+zse3KRMllPpy0RP6DybVNk6ZiWdg+K6w=; b=QfBRl2YfT4d5nhydsq838Pen+x
	lb07l9aILbFoCLODEND0R6pFr+7ONd962BrOZhR+PscLoLhdwsnMh6fNmXDpDHP5529/rDXdw55YH
	OYjBWItLFIFQERv6QwyMBn3QH1zokmkxeOmGyVVsakI6PuSekeFTHF87dl2nlu+KdM4LcJYwAjIvc
	Ip6lrynd5thAu2GIkKLxT1/SyLVLxhdR8qSz3BpuD7GUo9CBSzLvk1RD+N7nDHuGGNhBhIQfOVgB1
	5IQe7/gqr3zdIHYt4HYKnGfLdYgd3eNxBehRIYxTOvMPshd69GgQWLCcUAd4hXrvRftmhqZ6RbHe1
	6XfkylIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIOt-000000099YJ-0gnV;
	Sun, 05 Jul 2026 08:40:31 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIOo-000000099WP-1tf0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=YnPYEc03Tz+zse3KRMllPpy0RP6DybVNk6ZiWdg+K6w=; 
	b=VyyA/38PN55sJUDfL+uvdXOF+YDTt87iMxQm/rrxmgqtgbrbegvXdOL0WMl01hnwToPE/7d5Sxx
	O2gICet78BJ5AJIokHiN+Hj9rwP7kovlSHPjG6TzIdLT43f3YdYEaobtk5W29SA1V5nqExZuHIiPR
	9thBc/UGQRmsXUNwtm4lE4JDLIwCXzDMeMTJTJrtB2B1/l82IsdxsS4StTm5wY6cX8e2RkjQ6cUk+
	+6IqqKnxLDj9ASJa3XWyIrXjZlN0NhipbXinw7jpyrnxewcFJ0PciuhOBedm8+eK4H5lGmHLKR3NJ
	wi4i57X9Q5hwQ95gPFXe4ozUhd2BstgM1nhg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgIOk-0000000Al7Q-394k;
	Sun, 05 Jul 2026 16:40:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:40:22 +0800
Date: Sun, 5 Jul 2026 16:40:22 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Mounika Botcha <mounika.botcha@amd.com>, Harsh Jain <h.jain@amd.com>,
	Olivia Mackall <olivia@selenic.com>,
	Michal Simek <michal.simek@amd.com>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: xilinx-trng: propagate timeout before any data is
 read
Message-ID: <akoYdmsMsfeZcpR9@gondor.apana.org.au>
References: <20260623060728.18906-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623060728.18906-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_014026_496579_065EF5AE 
X-CRM114-Status: GOOD (  12.44  )
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

On Tue, Jun 23, 2026 at 02:07:27PM +0800, Pengpeng Hou wrote:
> xtrng_readblock32() polls for 16-byte chunks but returns the number of
> bytes read even when the first poll times out. Its caller then treats a
> zero return as a short successful read, and partial reads for full
> 32-byte blocks can make the tail copy use a fixed block offset rather
> than the amount already produced.
> 
> Return the poll error when no data has been read, preserve partial
> positive returns after some data is available, stop the generator on all
> collection exits, and append tail bytes at the current output count.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/char/hw_random/xilinx-trng.c | 32 +++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

