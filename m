Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dlg+EIthqGXo7XZLbSA1qhX/dBzGVxPFuPapX5hqVE=; b=Xf4mThsPJyU5wodQ3U0EYgCjrt
	2o6msc9Zw9wAY1iQR2NvM9PrvGXOxd8l29uLj3Y9/qvdZu3Bipd3bHtXx9YcyYN7fl9Rl7iOa1o3m
	gHWtwJcHgndekfEbbvtyydfBMSbwSv9GhA9Mr5/twvywnO67t5KWY0QPXJRJfCgIGPze9pNxrnpLm
	OaycSM79Ug5zH39SfsitszItUmEC3eubUhObvmU0R8Hnbit0JPO3rWj7EInG6kQud4YWAOWW23Opy
	pEZinwddKc6duAQVvSFMBDJoHlFqMQsoxOvixRdPmopz+VZbuD2+Tb0NCXxH3RSeQK8ZVGunJqt6Q
	zIhJvG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQaK-00000009EFS-1m7y;
	Wed, 12 Mar 2025 18:13:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQYf-00000009E9n-44FK;
	Wed, 12 Mar 2025 18:11:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C77D8A47115;
	Wed, 12 Mar 2025 18:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4192C4CEEA;
	Wed, 12 Mar 2025 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741803116;
	bh=cV5aSqFJ33K30QuBwrJdyen4GmLJdTHeksSaAnwrNvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0pP4BPua5VsTBkh0FpSVUqjdFqimB1E+VhzMfKj3ctZXHRbRoSqGEi2sXcYjAHkM
	 AghgELe61AVdvO6cTJzCyvvnuYRi9FreuYv0GjGr2oYuKJVm7MWfVPuHHtqn40iGRI
	 IErzgBV9Kmr6i6sTf90ZySBfDMiH/bQYM9r5ZlrkZw5YjXZ7hfUhD+bDu9izHJmgJ5
	 oDzftJeZQckOAzX/RDfLlhNnH5zknbTIl++WmF+AmRWd6FwaC4UKbe8I4XddiJ6vzx
	 Gv72okJGBz5sy9Xen7AHpUVXS84F/DtQxccnT+nnBBIsv2gxNPmEF8Nl/iyJ7JF6uV
	 1vr8/HHt4tnlg==
Date: Wed, 12 Mar 2025 11:11:54 -0700
From: Minchan Kim <minchan@kernel.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chris Li <chrisl@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	"Huang, Ying" <ying.huang@intel.com>,
	Kairui Song <kasong@tencent.com>,
	Dan Schatzberg <schatzberg.dan@gmail.com>,
	Barry Song <baohua@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Casper Li <casper.li@mediatek.com>,
	Chinwen Chang <chinwen.chang@mediatek.com>,
	Andrew Yang <andrew.yang@mediatek.com>,
	James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from
 kswapd
Message-ID: <Z9HOavSkFf01K9xh@google.com>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_111158_077258_66A1639A 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Qun-Wei

On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system. The
> main goal is to separate the tasks of page scanning and page compression
> into distinct processes or threads, thereby reducing the load on the
> kswapd thread and enhancing overall system performance under high memory
> pressure conditions.
> 
> Problem:
>  In the current system, the kswapd thread is responsible for both
>  scanning the LRU pages and compressing pages into the ZRAM. This
>  combined responsibility can lead to significant performance bottlenecks,
>  especially under high memory pressure. The kswapd thread becomes a
>  single point of contention, causing delays in memory reclaiming and
>  overall system performance degradation.

Isn't it general problem if backend for swap is slow(but synchronous)?
I think zram need to support asynchrnous IO(can do introduce multiple
threads to compress batched pages) and doesn't declare it's
synchrnous device for the case.

