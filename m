Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4AEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJjEbiV5g+NYVFXOD1NeopHaTyP4OV+DoFwiBySnRy0=; b=PGQY6mGRBKNzB6DUwhWbAVOvYF
	RPbuH2ha+TVG4R/4xC/6UrhjfY4qIf/nE16a3olG5vaoeVd0Ttl6sGjho8KoghmrFoA/kVTe2EGyp
	jHgexKIbulDzlmcRuHNSrLJerieDoxAQ4yEqt8csjmpfWvADTmlSsLf07ppGKaqhZ8i8niUrK+QoO
	5arzJjk7Q8FZwCw2Sx1O+X0PaumXZKm9LZnW0MLfOqlZyGJzVyUMKheNv1vhszWCIFngNqw+9/7jD
	x3nyGQrSeUMegcJbsmnArxM+R+9Sr3JTS2Mce0AcGp7Ybn/BNfKmBYgABYiRU5sSWtusyJUqbgBvG
	vjSe2YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjrd-0000000GlUT-0tsA;
	Tue, 29 Jul 2025 12:55:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjnB-0000000Gl24-1Z50;
	Tue, 29 Jul 2025 12:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pJjEbiV5g+NYVFXOD1NeopHaTyP4OV+DoFwiBySnRy0=; b=f2tfzwpPeWAKHfEdE1Bxz0OpBo
	VHp1WpTQls9sIIxpPnNlRtqNh78tB54Mv8Fs5MbF94ruMzgkyGMxsNSZOLfO4w/9GaFlngs6QT8aL
	1CrUE4YaHzq3PzXFhLEo1lA7NMC6kcnj/7QZ0lsLMtQBH91taKBm6B2s4c4ktsa9CKycxPNN+Plcs
	3Hv8XBZheIvN5GaPXLJqUyzThZLsNFqQ+UxBgd2HWbK/JI9QrbtIjeHC15/CgEC9/D6K626A7wbyQ
	IZpfXYiQtTJ4bdTIpo1iTEL6u0cMJ1sgsJXIl33unEHxkFEB3zd0k9A8VXycb2KgbjFKEoy9lE2D4
	T41JJTDA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjn7-0000000CRmM-2hyh;
	Tue, 29 Jul 2025 12:50:49 +0000
Date: Tue, 29 Jul 2025 13:50:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "akash.tyagi" <akash.tyagi@mediatek.com>
Cc: ziy@nvidia.com, david@redhat.com, surenb@google.com,
	akpm@linux-foundation.org, vbabka@suse.cz, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	chinwen.chang@mediatek.com
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
Message-ID: <aIjDqeQR7t3ZlD_C@casper.infradead.org>
References: <E70C1648-DDAB-4027-AB07-1C19B10C6AEF@nvidia.com>
 <20250729123028.1224786-1-akash.tyagi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729123028.1224786-1-akash.tyagi@mediatek.com>
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

On Tue, Jul 29, 2025 at 06:00:28PM +0530, akash.tyagi wrote:
> Additionally, android kernels create cma pcp list for pages less than PAGE_ALLOC_COSTLY_ORDER, but not for THP pages.

Why bother?  If it's a CMA allocaation, just free it back to CMA
straight away.

