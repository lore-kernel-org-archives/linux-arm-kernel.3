Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B309FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LBnzd3v/hpHhCUNhojeHVoFejEzEwc/Hd5UG60oSVY=; b=XVivSPtv+kMOhOREk33kNYEjG5
	oaaRmGndZBIw1U3gBkTJqtmRKkI4YTCHESRzTXt8iEyZ0JO/OvXyWFeYEg6EcPtuV5FvZj7WGAVO2
	Qa74Tcd1QWhmORG6pe27pjmJzXcF0iPDv+Ip2r4yzEOWJ3Le9g4XtpO77ZMxNbqZxTTNlo6x1Ba8L
	E8+WlZnaaNrb98rar/PFIJx4VoyK0Au95YU67zp4p0KBfat4xRKCgJkq+EZ8IiudcEeVEipxWrixB
	pVmtxA5SjSSRBv7seCv6pJ2rkjPLG23XIlH6sgXNjitMWsoWUzL4VCqRe/Q2hCz4m3p0gThYFKrqb
	52f7qrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddkY-0000000Fqll-2sNT;
	Sun, 20 Jul 2025 23:47:22 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddi8-0000000FqdB-0j0e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 23:44:53 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-884f2b3bc2eso2032978241.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753055091; x=1753659891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LBnzd3v/hpHhCUNhojeHVoFejEzEwc/Hd5UG60oSVY=;
        b=SUY1vDesNdIUZVvCBbxn50a198jOyElx6dKqMMFzhdf5FLi/UlqlMBrU9lUuYIrTI2
         6Xx+1aK9nke1IfFrPwqbhEuKWBZjfXv3TbpKSn4njHNAWkF5fAr0bI/UVLPatjbjnbWV
         f7FpGe46JFTDmSzKomiBDdG3rpk2/jZQwo1EAF4/IJehR5cTPV1DxhYjWSMogRH7VgcU
         ckg0uU7j6TB/INPiUPvAChLoufEGIa262P60Ep7dUJ6l95xlPnCe1kD8TB/g9qzolbZ+
         dK14qFWMn6/JJWE7uT1YQ5dLWnqmmHsbvH4tZLY0QItIE7flURLPQiSJsL1IqJAec016
         NtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753055091; x=1753659891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LBnzd3v/hpHhCUNhojeHVoFejEzEwc/Hd5UG60oSVY=;
        b=mewaE73uZw8OEL4067MrHauqsvQWcbLGOiSlXqoChAJsI814IKJpPu3vN7/6iDV90u
         yFuIY97VZi3EH7KA8+s6Dsv6dbxqGnl8I3s6JMO7Loupg+QX9Oagmk0QNcLcKLk+PP2H
         aWe3f6A9L949hfZjmlkY0oTHuD+F08KEqY+LYvXkZEDvUIUb3+2VitG5aw4gRAdoPoLu
         51e2F97yIv6TUS8L1gTkrPsnfU4tDBrqwei1Tdnk+MVOPxYMdriwdrA0ZBPKdhhD5xf8
         DhlJ9Weut9Ebn20e+aaRUmPnlkR0ut7f2CBgXrjrAoZWiT4w3aK8T++OxnznZseB+78l
         30HA==
X-Forwarded-Encrypted: i=1; AJvYcCU68EbVhrFUNw866jUygsaAbYZCQwLZJztCx9QDF9HPQ014rAVz0x+5RBswJo4ty/cLZeii1bKM5jnjNCsFWcfD@lists.infradead.org
X-Gm-Message-State: AOJu0YxENcM1A6yx3bPcnvkUtAIC8pG2RIAqRbLGTTjWSHuP2wDjcUW1
	0wSiE42nMfKSJEm8NoiIV1hazg5Enzk8047LXG7Ys59nt/7GJqAferWA9q5biiCPKe/B8/dosrA
	EqpAaTdYbVd/13Q3jVZP8TdizL/oM/eA=
X-Gm-Gg: ASbGnctXiZqyd3+z6cwT8xapABVMuNJ0eqdSAP0LUe8m/j8Cedue+yz9+VgIUP50ofQ
	iGKWxZtDmi+UFwBcq+WpvNcAbcDvbEotMQSjVRbQYstYJPivoHLAh6kGQ1lHWq2LmI+0rqQssKz
	RzS6G+/Tp9wjaCRx0EeBi7lIZek0pR7oIQsv6HphFvf2cWwQlMQIW/1B356RSEsk6FRGrOSv20D
	axUp7U=
X-Google-Smtp-Source: AGHT+IE5Iww1i00Pt12bS4PeAauPkTugTt4uJE2TsnwTnY38yNwpFQjV6A6pNGslKMdLzsjoyJUdyCljvCrlxmmznjI=
X-Received: by 2002:a05:6102:3f0c:b0:4cb:5d6c:9946 with SMTP id
 ada2fe7eead31-4f95f30463emr10103615137.10.1753055090526; Sun, 20 Jul 2025
 16:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250718090244.21092-1-dev.jain@arm.com> <20250718090244.21092-2-dev.jain@arm.com>
In-Reply-To: <20250718090244.21092-2-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 21 Jul 2025 07:44:39 +0800
X-Gm-Features: Ac12FXzBjmVqmon0-2uZp6WT1U6OMbiYJHYosmIwhhkMAqnhdJDT2LExr2m1S2w
Message-ID: <CAGsJ_4y1rJ7Omv-8ADk-cZdkAA37bxOxaeM3-vpz1MMaT_G04A@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] mm: Refactor MM_CP_PROT_NUMA skipping case into
 new function
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, 
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com, 
	ioworker0@gmail.com, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, 
	christophe.leroy@csgroup.eu, yangyicong@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, hughd@google.com, 
	yang@os.amperecomputing.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_164452_210183_4C2072C1 
X-CRM114-Status: GOOD (  15.81  )
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

On Fri, Jul 18, 2025 at 5:03=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Reduce indentation by refactoring the prot_numa case into a new function.
> No functional change intended.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  mm/mprotect.c | 101 +++++++++++++++++++++++++++-----------------------
>  1 file changed, 55 insertions(+), 46 deletions(-)
>
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88709c01177b..2a9c73bd0778 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,59 @@ bool can_change_pte_writable(struct vm_area_struct *vm=
a, unsigned long addr,
>         return pte_dirty(pte);
>  }
>
> +static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long add=
r,
> +                          pte_t oldpte, pte_t *pte, int target_node)
> +{

[...]

> +       /*
> +        * Skip scanning top tier node if normal numa
> +        * balancing is disabled
> +        */
> +       if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && topt=
ier)
> +               return true;
> +
> +       if (folio_use_access_time(folio))
> +               folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));

Nit: I wonder if this should be moved elsewhere, since this isn't
actually about 'skipping', even though the function is named
`prot_numa_skip()`.

> +       return false;
> +}
> +

Thanks
Barry

