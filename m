Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3B6CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrOxzpNFY+8Bahmik8cveKuPMp0/ZzykNQj80Bp6bMo=; b=jD4odwhZHJHNWYswFYIL441eh4
	yfMa/8BaXFWZa34sp+O6YF/YY6BwcqJtrP+NKau5CGhxDDk/zEy8M3jmCT78XxIXdtbxPZe4UjSPk
	KD/z579xs9z8DU+tpAVlKEpPuc6bw2+ZHpKmY0k58Zhd8ucXYfTX3Hrq6Tr+qybi8nYkcvFaBq43Y
	9A/Ui7mM8phpmkIpmzcOYV2QWGuhrGrEs6RtkFLXBX1bOehLhhskmkiNksJgha5Ni7zq93mBC/bNb
	Vs+fCHu4Bi6NtKnCsLPgt3XS01yVLvfKAAkRf6C8Q/XPzHec2PaNdxYqgoWRlSvr09yx3VOK0dVIj
	SRJiYK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt7k-00000002DzL-1yIg;
	Tue, 26 May 2026 14:51:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt7i-00000002Dyq-3Rwa;
	Tue, 26 May 2026 14:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hrOxzpNFY+8Bahmik8cveKuPMp0/ZzykNQj80Bp6bMo=; b=kQH/+YgubG/zRfJvHyit9rUy7m
	JmfgOEsibu0KRTIo7qqmTCLTmpw1eCMpfkHy/eyyfUf7Ykppu8JUsx10FPjtebGA7sZxfaGO+nrQd
	rV4rJz1R/XclDYjuPDaUrNq8omCXPzwiwaHuquSCsfttEwnbORC7ebJflQh3ZPo2EUKv5/6Rsgpvb
	jclrk5MDyjSR1C48K0gfJeoP8CXfRotCETpEOIFNEGRUSaJeq21nCEq87S8XWzHSC1Fall6zRo3UC
	t1Y7tZAA322mSxDwIkHrlyGzy/xl8mdj4QsjDn4HHmQbCuxymA11PGTDOKFhfFYjTFf1QHwwK6x5H
	i7ywWzgA==;
Received: from elvis.franken.de ([193.175.24.41])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt7f-0000000BZKw-0q41;
	Tue, 26 May 2026 14:51:13 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wRt7c-00015B-00; Tue, 26 May 2026 16:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 703AEC0ADD; Tue, 26 May 2026 16:50:03 +0200 (CEST)
Date: Tue, 26 May 2026 16:50:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mips: ralink: mt7621: add missing __iomem
Message-ID: <ahWzG3s5PKezh_t4@alpha.franken.de>
References: <20260508042724.1719688-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508042724.1719688-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_155111_895566_4A635F8A 
X-CRM114-Status: GOOD (  16.89  )
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

On Thu, May 07, 2026 at 09:27:24PM -0700, Rosen Penev wrote:
> raw_readl and writel calls expect pointers annotated with __iomem.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel.com/
> Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index a4bdda8541c0..ae7b8cfedd5f 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -63,7 +63,7 @@ phys_addr_t mips_cpc_default_phys_base(void)
>  
>  static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
>  {
> -	void *dm = (void *)KSEG1ADDR(&detect_magic);
> +	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
>  
>  	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
>  		return true;
> -- 
> 2.54.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

