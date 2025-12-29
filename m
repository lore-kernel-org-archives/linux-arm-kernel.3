Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FE3D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYvkrAfTaF1Jiwc0dg+DZgautcB/4SFAZsgdQU0iGls=; b=KfmWf4vxlfcgrd70m0U671O0YY
	jTldyK6leP5hN9YbxJohz3dAtSibW1phJOhcRVJ69gpcdiIf6y4KUW1Ra/B2rz91dm6dbF14RPa0U
	8SqHnZjRhY2iyYUSqZTeleRoodI9Ln/MAeAeq3i2ia8Pcq6dLTjIM7s9chmyVlmKzsZjYMyUzRp6Z
	SCZ923sc7GByDQMo72Q9WPSy5tnYWYEt8skAEDI8Opv/YveUUFYAFDh4C8AjHFJ+xznkJtFH2W1BC
	8jM9+aNAO4q+JMpAVja1M4M3uTWFatdOh850B+Of2S763sjbLZfLNTex29aGGABIgxjvAKeKo9Bcu
	QoHs/mtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7D2-00000003Op9-3k18;
	Mon, 29 Dec 2025 06:58:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7D0-00000003Oos-2xCR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 06:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 256A06000A;
	Mon, 29 Dec 2025 06:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CE1C4CEF7;
	Mon, 29 Dec 2025 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766991505;
	bh=V2y2PsL6+tNWebVwd0+KwFFsHyM19wzJl+pDNwf+sLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHt4chWYSuLuDbLrlpROYCd7Q5YXDLbWsfAff8CsrYD04k+l/DTp/2dZtSHvQWqno
	 Uv5A0PAEYWXIBVNK12KAE+tDmuz8dJWgD2fSfp8E+h5lbShxW7rzd0p1nBC55JzQr6
	 H1J0nH3v1nzqVtEKjuZo/DRD8Z1dBI7bank52DAHxQsGMaiJjkeirY+zSVUQDHe8f5
	 I5TbcjUhTz054W0VQeJG+KxBrB+7o4bbom0NsfxtyhwDUA6+N4J9T7lR2nuobKBKWt
	 5JZKi+hSeF+id57btnngVjqW5FuY5oi2sSB2Ro1A/cKqN/uxnV1tLUBaDqFrQ/Yod7
	 j0PAqpdFf/nHw==
Date: Mon, 29 Dec 2025 08:58:14 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net,
	david@redhat.com, mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 19/26] mm/numa: Register information into meminspect
Message-ID: <aVImhhgEsHInebeh@kernel.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-20-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-20-eugen.hristev@linaro.org>
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

Hi Eugen,

On Wed, Nov 19, 2025 at 05:44:20PM +0200, Eugen Hristev wrote:
> Register dynamic information into meminspect:
>  - dynamic node data for each node
> 
> This information is being allocated for each node, as physical address,
> so call memblock_mark_inspect that will mark the block accordingly.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  mm/numa.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/numa.c b/mm/numa.c
> index 7d5e06fe5bd4..379065dd633e 100644
> --- a/mm/numa.c
> +++ b/mm/numa.c
> @@ -4,6 +4,7 @@
>  #include <linux/printk.h>
>  #include <linux/numa.h>
>  #include <linux/numa_memblks.h>
> +#include <linux/meminspect.h>
>  
>  struct pglist_data *node_data[MAX_NUMNODES];
>  EXPORT_SYMBOL(node_data);
> @@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
>  	if (!nd_pa)
>  		panic("Cannot allocate %zu bytes for node %d data\n",
>  		      nd_size, nid);
> +	memblock_mark_inspect(nd_pa, nd_size);

Won't plain meminspect_register_pa() work here?

>  	/* report and initialize */
>  	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

