Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C8AC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PdGEe+6pPMq+qgrcR9dync2NXuXMBNuDLnrEUrR6ds=; b=4Dd8mVurivC94StOOmCDupWHOJ
	OO7MwS2e/zb+wxbcCopaW5cL8WBs/Vzp8s0sCE75ujbSCp+l1JB0sBiSiS9FjnTm1KkFYZrHMpd4S
	gNxP5OHDk+wFqJiPoBv94a95FEVTGdS+EhNaDD13wCi6XVQwJrgdFLOFzYEGXlM0/nUAaj9wwxw7i
	Nda1JKK8lQqJMy5UdpunqsZAoCEltPnSz9XdnZDx0SLBfJZWcxpGZlcBiQ/dRtsuGDiLVhHqVX1qt
	48i+Q4jnHEKAq8CGnxAoD0ZiNzmIed5iJWNf6kbYE/lsr0t3Bqe+Mhu3rgk2q0BFl4Sl9Gih7MKRm
	mZWhQzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFotL-00000002c0w-0mbx;
	Fri, 16 May 2025 06:49:59 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uForD-00000002boU-3atK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 06:47:49 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B313E4B65F;
	Fri, 16 May 2025 08:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1747378061;
	bh=+8BDgBey691VNSBZjd0HdnlUxaTWfqka20xfk0knP2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zxt4LPLtGk6no+szvy+NXvA+Ht3Jtx7Aar2bjG3i1RiJH9XNy/PYQyYaOxNJQyEpD
	 InxkiYozGyqipO4XuCZtmEJ9kce2ntz8qAf1N9pPbNjydsVkchuqxuGyHP8/jCoKY3
	 l2uD0APUgVPbF3hlnv+NkZGoBrEiwfHAatECWlPvxGsTfuOASNomR4iXalz/Xka/7m
	 kNq55SJGGK3wjQyLZ9NBzxMTYc8etZhQkfszRdDIzN51wzszWH3zTpQ1HxvFfxhuYZ
	 ZyosvMdYr6lVmYvQ6wHpUmwP/9DlilvcFOTyge/fPGoyPgAyHXHouzMTnl/KFlGH3I
	 AGpV++QVB6OKA==
Date: Fri, 16 May 2025 08:47:40 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rolf Eike Beer <eb@emlix.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Sebastien Boeuf <seb@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCHv3 0/6] make vendor specific subdirectory inclusion
 conditional
Message-ID: <aCbfjD5kybvl_hqG@8bytes.org>
References: <1926170.CQOukoFCf9@devpool92.emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1926170.CQOukoFCf9@devpool92.emlix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_234748_048509_7DF6F995 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

On Mon, May 12, 2025 at 03:07:27PM +0200, Rolf Eike Beer wrote:
> I found it strange that the vendor specific subdirectories were unconditionally 
> added. Everything in these directories obviously depends on the specific Kconfig 
> option. This series cleans this up by making the directory itself depend on 
> the respective option which looks more natural to me.
> 
> I must confess that I am too lazy to find a good solution for the "arm/" 
> directory, so I left it as is.

Applied, thanks.

