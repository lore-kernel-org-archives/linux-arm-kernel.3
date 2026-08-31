Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E216C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDQLGo2eBys2v5fSX9hMlquDuFbTQ/zAGUSHKc6b0N4=; b=0tRocYFBY6054BfVBwCXlnxfNn
	TSJTDLrRUuxFURQLdYk2QVaNBDaC8dtoai3XwQedPNJ9N/F2pKzT9DLZoTd87bHqF83W3BXboyqzN
	yTllT9L+pObGw6kSp3/Bc4MjRex4O2QnIrOcWG5UZ/vu7ZZ0tRhSISe9LR8JnzaOh3eaXMAmINBnx
	Dt2An9eXISV8F/Ay393QKCQKyYF6Q0CzrHZIy86sPkSgvXLQvMH9uiXVdWb/s2nOpIkG3MQMtx5OX
	2r4oaEAIpUdRg6/ZwU5hiA7hyRZm2meT58xTingvK3VUqHDF10fJqFtwki91aPl39clyvLUnNLFBq
	LUArKqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zkq-0000000998b-1bIi;
	Mon, 31 Aug 2026 11:00:44 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zkn-00000009985-2FX9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:00:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5b4aff8e8c4so2761150e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788174039; x=1788778839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SDQLGo2eBys2v5fSX9hMlquDuFbTQ/zAGUSHKc6b0N4=;
        b=o4gXJ0vv4zDH3QnLRBruK7s3OObziFdSYNzr7e2wsRDHpbTF/Zaz2wfp74+y9BmAb5
         P0Rg/xvd9KWTYXicIjszC6zmT+uD/W9HBWbtRIBc+kCOCWQp19NVkbwWxVAUxmbrY9db
         eFIsGt6JHDJ8rnlY/KuEoHpAnlcg191VxMEkEmu0dVi6jle+BnSNP3D84ovU4pRpYNDH
         UzIXD5j+F+UpAZe+4jjwxCg9795h08h3LawDXY6gFWOsyL3ToMB1peQvnQxy1vszDynp
         1dhzrHkutasYVeh6EDk0556NUAxkX2wmTF41tR1xY8JQ27h/Tkbx59HCwGbhoPAwuVxq
         Sh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174039; x=1788778839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDQLGo2eBys2v5fSX9hMlquDuFbTQ/zAGUSHKc6b0N4=;
        b=fL4W1U9hGCdENDT8KE9hEJwiHFWafeCth0fp063IdPiOaS7Wih99pv38q9m9B2cy41
         nkhIsK807JehlW20NNiAeUk5bZAHz+Qla6oAYafMMTDDk1qucHySCuI8Z/NWZn4UQCEV
         EM3Y3u3nv6RotQuxOyLciU2kIt0ZW8eWzhdwaeV6lQZ2qy2MLtRSBHI//eqsNDL+KZZn
         3U1Jj9C1m+NKhLT6yhrxj2GX1Ko4pfVidz6kz2MaiaJHv/Y0IX3OTcporwANBV7EQqRA
         ZbU4l5bD6G7bQz9ZqIQs2B8g177jncN39IlH4Gd29BxsS+fIEaX52vs1/SvVVfXnGb8V
         gblQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPhZOjppFNPdJfoI4nV0b1sQ4C24XH0ru3KKqRx7ftCFqfFs/tIJtEHGMPuEX92D8FoydgnBmsZEZnQAVh80lS@lists.infradead.org
X-Gm-Message-State: AFuF++mP8xoPbz76p069+zk5h73FianBfmQXg7OxVM4K8C8drpYYshb9
	jCtb2kP4Xjed99NUboAzZOxyxFiMUJCpMw7awTcKp7L0FoFdhuiPiqvR
X-Gm-Gg: AYBFou3AxLxMj8j6NBP2hJG0LQVf0H6N0OjoEs7o5wWKRwtwmwavI8VF9JwQmKZ7ejx
	/an2EX17Wj1xh2h55Kg0+n+BnOQY8a63c4GjcFGebFZwyIVvbM3rUmpr7zogxS4Rbnd6ItCEqqv
	SWpIKZN8Qw1Je6VhrASFCxB1XmIUtvWWY9WARi0DAIRBxLSMEjujQsvkAMKtbSbeT8fGyt+eaXg
	HJyXDDRWDI4Aw2O1tGYkA5ye2rJi3F+9uMI4mgm4a/CObnN+SDcUeD0H9xYiAmU3Nsr25bSJ92z
	n50zkN6hK6ZybyYo+LUzmYseBv6LA4w6wpFlcoqcNaRzU5/4hbY4l5sUrn47d4/QDw3qKZ/mh9z
	KcOqqA9QnHM25fVg3twzPF7zGEe3LXPWhkiCsyYduwhcGb31zsIiBF0dulF3YH5OamuJ4DNjYRr
	E1YFr5p5Us19EHWEGxc+IL+GOIZ8bT2uH5vOau6hm7DzFKpsLYUubJWRGFfMohX46HxQ3racSs0
	PhNs6+rTJmgzOmMrL4gOMFFMyip0YuiWbwVrGAybtMqY8i85bMWrR3Z1OCIlpOpxYP/q8NcmVt8
	htpHSDDojgiSOm8douwfiiWbg3Xtg91MLlgy+9oyAs20Za0SJxv7CypZJYrkzs910W2BzN/1scA
	=
X-Received: by 2002:a05:6512:2355:b0:5b5:f946:513c with SMTP id 2adb3069b0e04-5b5f94653e5mr1425845e87.17.1788174038781;
        Mon, 31 Aug 2026 04:00:38 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b65sm2175666e87.16.2026.08.31.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:00:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:00:34 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6.y] arm64: mm: clear extra idmap level before use
Message-ID: <apVbNN_gtowKWVhR@gmail.com>
References: <20260831054247.33352-1-kmehltretter@gmail.com>
 <2026083125-upbeat-series-9565@gregkh>
 <7f744f2a-409b-454f-bdb9-fccb5031640d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f744f2a-409b-454f-bdb9-fccb5031640d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_040041_600501_C9DD8B04 
X-CRM114-Status: GOOD (  23.29  )
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

On Mon, Aug 31, 2026 at 08:15:52AM +0100, Ard Biesheuvel wrote:
> 
> 
> On Mon, 31 Aug 2026, at 07:54, Greg Kroah-Hartman wrote:
> > On Mon, Aug 31, 2026 at 07:42:47AM +0200, Karl Mehltretter wrote:
> >> The 6.6.y adaptation of commit 0e9df1c905d8 ("arm64: mm: Don't remap
> >> pgtables for allocate vs populate") removes the clearing performed by
> >> early_pgtable_alloc().  Its replacement clears allocations made by the
> >> generic page-table walkers, but 6.6's create_idmap() still allocates an
> >> extra root level directly when a sub-48-bit VA kernel is loaded
> >> sufficiently high in physical memory.
> >> 
> >> memblock_phys_alloc_range() does not zero the returned memory.  The direct
> >> caller therefore publishes an uncleared root page and passes it to
> >> __create_pgd_mapping().  A stale nonzero entry can trip the bad-descriptor
> >> BUG_ON or be followed as a page-table descriptor, preventing the kernel
> >> from booting.
> >> 
> >> Clear the direct allocation through its linear alias before publishing it.
> >> init_clear_pgtable() also supplies the barrier required before the table
> >> descriptor becomes visible.
> >> 
> >> Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
> >> 48-bit virtual addressing for the permanent ID map") removed the dynamic
> >> extra level before page-table initialization moved out of the allocator.
> >
> > Why can't we take that change instead?
> >
> 
> Nope. That relies on a massive refactoring of the arm64 startup code.
> 
> Can we just revert 0e9df1c905d8 (aka 54322d95309d) instead?
> 

Yes, that fixes the issue too.

The commit was patch 3/3 of the following speedup series:

https://lore.kernel.org/r/20240412131908.433043-1-ryan.roberts@arm.com

Patches 1 and 2 accounted for most of the speedup.

I'll wait a bit to give the others a chance to comment.

I can send the revert as v2, or my original patch as v2 with the
missing "Assisted-by: LLM" and "Signed-off-by:" trailers.

Thanks,
Karl

