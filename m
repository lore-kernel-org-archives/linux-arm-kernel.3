Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B65FB5EBA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 04:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=; b=stpmCBcI52y1gJcqj1LIXzdOJP
	+ZAI80dn0mA2zFLRnVMAEs5acxxwCOEmrWFSCJbdBYN2eTrFhUkAavBx71khfVYhkpi8JxfD6ayO8
	FwIU7T0uoTlrK4E9k+of3PIdpHTpDOQKN/+XCtl8kDGtWOMiuz6NsDI0Wm2+c+uF8c1sAjLgxKFkM
	1mU3/v5+tm0zAlcqmVj4vWQvLRkKR2zqXPQGQzIA6SuJY5KqWJ1BvrNc+UNp6F24/uDxZBVdhnTot
	LKtBw6RkvO4P5lI030Y8Y+Qdtb27VhLviX72mmH17pd4Z7vKCoIzEOjVkQcd7EXCvrd/AO3GBgiTT
	stsuer1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M4y-00000005OYe-0MzP;
	Tue, 17 Mar 2026 04:30:52 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2M4v-00000005OXd-2Iga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 04:30:50 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50906a98ffeso374381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 21:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773721848; cv=none;
        d=google.com; s=arc-20240605;
        b=QKfXNqoN+oC6dzPCHcTcFp9Ytnhg3mpFRLc/GYDK4whSzTfEJokpOq4u45pGokkphe
         XmYsg25JvZmSxy6DqTFbq89apuGa424lRpH4pkBgFkaIuVvxyjwzVX764tlVA/KArgR+
         rhrpRdzB5GAsgcgllMNFyIFR4Fyayc51W6GVx4K9HAKtjDMGW5Z80eUDX9l1WcGJK7KB
         ErE12V0S+sXXujeJL8rEt1xRzEJHRsbLpb0o2J8C9HdP66T3bUa+CWRFDxFtQOkgYS+r
         oh2u8yyOt1XAFKnnT1XbnXHhs8TJd9QUKgcsi56Fw8VzSIZLeGgcdU2/ZSLBGYLd4I+u
         xBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        fh=LYQe5UlBTcxIhr/0Ck2+oIl8XyESvTS/27lLfh6XRsw=;
        b=DGGjXD2iuU0Pp8/M8vGoio6Va9zivNFbvSmSqK26vHbQCG9n9KdlQIu2WzrxVBceBp
         GiccwknKk2IPCAAnMRpyi5bCrI2hXSXC8JP14cNuFANXyoeeaE0j9rw6Elb3BjIOJY/E
         EjbtV+4bnmSIIE2cWlMu5kXYOjSgMBwG6bUSgXohB9MA5puG2cSXbU50CBUJi2kNpMov
         DrkbEmrRqgwlziJYxOQ3fnoCWGcOuiP7R6i65paD0wn2nxRD+To4MKhlf6MxWFcnKzSe
         HUqXDE0MftDXabUpfbYSkJEQKcRkRD24D1YS/kt4ZKXTLvpThc3Qeuo5MOOpt6/huWZL
         c+aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773721848; x=1774326648; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=aJjzFqjszdWvuQqoiH/QKc4bxJOfrMh9llQv7+fFN9fcdQyKCm7SN5eYhKybSvW6fa
         fDt2j4A1k5sQblrFbPirwGrof6RcGsD/qH5irZfyXe2hno/k8l8Qe1HvsXQ7bTkO+MgN
         9Jes2mMqpnB5alymUOh/JrqJn9IwjMcJwHT2fcHc7cTNOF7w7xgtpL0rqLL4NnShsKyY
         itjTTsP99TBHiiwkWJPLjGsZSq5oVVmqTij+RrNP8UIEnNzDGMHGAdBhNV3Z9ioQ8GAq
         Dys85XLSBLs+wTAp6CYg7bIg1W1/w+/Gm/VFh4Pa7Z2ps424gfBDRWDRBuojvrWhgcdg
         Q2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773721848; x=1774326648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=KGYda/DVOt8vYyhfvfP6+9jfXKRUd/wL0G/l/8s/c8FXsKaxMDbs6Hskmfwlq/DZ/3
         qjFRolTtYoNYQLtdGrWtES6UZfQBUWBbxJAW3jHyvsGnjhFeEFOlGKwZOSp22p85aiul
         +iUCtayi/lGsBCelPyF8Umx8UAXswIU9QtPKRk2+k3tXJ6Uor0PQBTRgfsvSs2P9yJex
         X7YXnDZjdDizQ1lh6kAyKcM3IGeeGoGrLi10RgB8pGkn6uZpDA02s7D9NfDDEZUt8sQy
         KIr+/2HQsD83kRGlxXlpWxbF6Ga0h3EOv4yNtgBzpAkk60h1uyLoGrm9Dxh/lYsc3M4d
         JUvA==
X-Forwarded-Encrypted: i=1; AJvYcCWahHIfr0QxCXHmSJxt9GyCKLiMwDj3NvMhd8+Ye/9SVyJ4vd+RoqXLGakLPB+Twz0xGqPV6LN9GuXb24eOd3xF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/PCKKb1OQM0ucn67iDKyzyRUOPCi0KpbqMi2EYCxyZFfwjiax
	iG6SzDk1hBRy5Or9rx5vkFeGbOf50G2htrTLNsezKQovS1dzWQPov2MW8Q1hDI4Pd2+FdteQ0VC
	84zuQVi4Ei30Es1aAMMUiL93vvumxVDPbtd7cU3+g
X-Gm-Gg: ATEYQzyq23JJ9+zLiKCILLFl+mSKUwdUmSMzRdFrpvLyhWp9s7/k6J81bWGp5tYuGax
	Gq/Gzlu64S1pwCEa+f9rhUJ7LegeeLnJjvWTk4Mj/74maK7FvMgcsHneeXUxMCjpL4YSxe8Hw3x
	hUp1MmO344dyuJh7TRAOKsZIqbmqqfuGj9CJ7keq6axLylPixeUQGRrlv/poNRefYc4mm+/ZEgH
	0SXMiuuTx1LDvqYJQ89hxQuic+mZCot842neuIT1DLadK5ES6n31+CCp4BOuoJQ2gXlIFH8gYQ9
	HlxctA==
X-Received: by 2002:a05:622a:1b92:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50998c190femr8741161cf.2.1773721847648; Mon, 16 Mar 2026
 21:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
In-Reply-To: <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:30:36 -0700
X-Gm-Features: AaiRm50ZCLTl3QDNivnPnY48qRQMsgXcmE9SOEgt_D7vDyjlZ8af9f8bQZf6tcw
Message-ID: <CAJuCfpFdKjix2fEdZ7iSrd_nk4-5e7EUNAoCEgUc5snKzq-3Cg@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] misc: open-dice: replace deprecated mmap hook
 with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_213049_633272_DFC7C77E 
X-CRM114-Status: GOOD (  23.69  )
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

On Mon, Mar 16, 2026 at 2:13=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
>
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  drivers/misc/open-dice.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
> index 24c29e0f00ef..45060fb4ea27 100644
> --- a/drivers/misc/open-dice.c
> +++ b/drivers/misc/open-dice.c
> @@ -86,29 +86,32 @@ static ssize_t open_dice_write(struct file *filp, con=
st char __user *ptr,
>  /*
>   * Creates a mapping of the reserved memory region in user address space=
.
>   */
> -static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
> +static int open_dice_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *filp =3D desc->file;
>         struct open_dice_drvdata *drvdata =3D to_open_dice_drvdata(filp);
>
> -       if (vma->vm_flags & VM_MAYSHARE) {
> +       if (vma_desc_test(desc, VMA_MAYSHARE_BIT)) {
>                 /* Do not allow userspace to modify the underlying data. =
*/
> -               if (vma->vm_flags & VM_WRITE)
> +               if (vma_desc_test(desc, VMA_WRITE_BIT))
>                         return -EPERM;
>                 /* Ensure userspace cannot acquire VM_WRITE later. */
> -               vm_flags_clear(vma, VM_MAYWRITE);
> +               vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);
>         }
>
>         /* Create write-combine mapping so all clients observe a wipe. */
> -       vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
> -       vm_flags_set(vma, VM_DONTCOPY | VM_DONTDUMP);
> -       return vm_iomap_memory(vma, drvdata->rmem->base, drvdata->rmem->s=
ize);
> +       desc->page_prot =3D pgprot_writecombine(desc->page_prot);
> +       vma_desc_set_flags(desc, VMA_DONTCOPY_BIT, VMA_DONTDUMP_BIT);
> +       mmap_action_simple_ioremap(desc, drvdata->rmem->base,
> +                                  drvdata->rmem->size);
> +       return 0;
>  }
>
>  static const struct file_operations open_dice_fops =3D {
>         .owner =3D THIS_MODULE,
>         .read =3D open_dice_read,
>         .write =3D open_dice_write,
> -       .mmap =3D open_dice_mmap,
> +       .mmap_prepare =3D open_dice_mmap_prepare,
>  };
>
>  static int __init open_dice_probe(struct platform_device *pdev)
> --
> 2.53.0
>

