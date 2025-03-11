Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC79C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKkAW0UIzqm6r4vB92ZekbOgf936keSki2pNmwT0r9k=; b=kkf2TZzaSLBRR5lZJgwjoLfVeC
	YqP0F/YmiIKxEBlBNl/LrJWbdWBBOoAaFBRs8mJPeUui2q9W21g6RgO6zfGgEkL3hp8RQn8OGoyAV
	9O4zW0TzZgot+0hUmmvBLbzar2i+pdrEuPJT1+BYpNunvS49b/RwyZBzGpblYlovEank+197V+8D8
	qTDI22KTBkw/YwPa0JvNN+Ugm//+ddbnhCfUv6UtEFRLXCtxZAXT24bd424ngiaR8heZ4w1axWKO0
	oeH2iKf7ivlLRaZng+eR0EerUK3BHeGLXAMPAUbh7Jht8U2zvkKfCPu8lQagJqi5ngS2i93Dzxlgx
	4aAljqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1NE-000000066l5-2L1B;
	Tue, 11 Mar 2025 15:18:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1KI-000000066IP-0qT7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47F845C64BB;
	Tue, 11 Mar 2025 15:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE924C4CEE9;
	Tue, 11 Mar 2025 15:15:22 +0000 (UTC)
Date: Tue, 11 Mar 2025 15:15:20 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: shuah@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org,
	yury.khrustalev@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] selftest/powerpc/mm/pkey: fix build-break introduced by
 commit 00894c3fc917
Message-ID: <Z9BTiOh6DkstKZ53@arm.com>
References: <20250311084129.39308-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311084129.39308-1-maddy@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_081526_295267_1713B450 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Madhavan,

On Tue, Mar 11, 2025 at 02:11:29PM +0530, Madhavan Srinivasan wrote:
> Build break was reported in the powerpc mailing list for next-20250218 with below errors
> 
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
>   CC       pkey_exec_prot
> In file included from pkey_exec_prot.c:18:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>       |                                  ^~~~~~~~~~~~~~~~~
> 
> https://lore.kernel.org/all/20250113170619.484698-2-yury.khrustalev@arm.com/ patchset
> has been queued to arm64/for-next/pkey_unrestricted which is causing a build break
> in the selftest/powerpc builds.
> 
> Commit 6d61527d931ba ("mm/pkey: Add PKEY_UNRESTRICTED macro") added a macro
> PKEY_UNRESTRICTED to handle implicit literal value of 0x0 (which is "unrestricted").
> Add the same to selftest/powerpc/pkeys.h to fix the reported build break.
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/lkml/3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com/T/
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Catalin, can you take this fix via arm64/for-next/pkey_unrestricted?
> Patch applies clean on top of arm64/for-next/pkey_unrestricted

I'll take it, sorry for the break. I did not realise powerpc duplicates
those definitions.

-- 
Catalin

