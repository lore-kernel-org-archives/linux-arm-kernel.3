Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA73D2B92B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYeCLSsUZRIrmEOMwxGqSfD7V2RsNkns3qvfU6C43UA=; b=aw3Hzv8+sg4OaFAxZ79DNZ9gNf
	XDT0ZvWtWr5cmOMt/ZQvhr519LA1AfDmJV2UqxL1lNWG5EUCEgN5Bi8FzkRxHrNIt+1veY9RF3bVk
	ZtKCXJUy2MgVPaTeKiTtmZXNP7gpSdjOHelScq6eOkw5R5+eE1aTb02an0jBM9du/PVjfznS14QhH
	ORkwe1y04t14sReP0O1bsHX/fFlAmhXdTluxH9MHC1+NslmL4t9YujMEix1pBvQH6Yxn2QbMa1oqM
	YePP5tGw720H5Q5aPNZJBdahkiIDudwPaXEySzckbnB6zKQgWVP/i4NEvL1UiPwei3z4r3ndelqmk
	sZYdTHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jna-0000000H9q6-1G3f;
	Tue, 05 Nov 2024 13:40:46 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jli-0000000H9R4-3mxz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:38:53 +0000
Received: from macsyma.thunk.org (guestnat-104-133-0-100.corp.google.com [104.133.0.100] (may be forged))
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4A5Dccb4012098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 08:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1730813921; bh=KYeCLSsUZRIrmEOMwxGqSfD7V2RsNkns3qvfU6C43UA=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=n0sXTzpicMGl6JI0ADkVc/HiKPojEgkGYyO1pQx2dzcrnqvXsM2RZzo+Sb5svGPgc
	 qW0SX7zl5zqRkKltYfBmUgFXDCqUkRisSud/xR5J6Tbouah7IfPO5+X+s+0mFZ/id0
	 KJJ0kAX4lfNE8lrvU3EBvRFI9YhbvsP4WOsZDJiCLfWkjotYwy29Ajn/HIKkTf9yE5
	 NEeFKTWS8cZ06m1TRDAbI0VH51oFtGnGm3lMEoaaiG94ccor1fss0Fcwy+3maWrH6L
	 KfqzubfM08EeL0DYjOq/Yn2j7aagvnHNL3UgvZEC8cQqhZOWSOz17Mgc3iRw2QINym
	 fJUtJFR76A04Q==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 7ED14340E22; Sat, 02 Nov 2024 15:26:35 -0700 (PDT)
Date: Sat, 2 Nov 2024 15:26:35 -0700
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 15/18] ext4: switch to using the crc32c library
Message-ID: <20241102222635.GB455688@mit.edu>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025191454.72616-16-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_053851_337544_40A48293 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, Oct 25, 2024 at 12:14:51PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Theodore Ts'o <tytso@mit.edu>

