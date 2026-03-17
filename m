Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73BCFF6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 20:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=; b=usy6Omdh33O/7xRBpxqNOXclG5
	uuEsqPllvIR2Ks8iECW/l7+YekpFB7oFF16p7QuMpf0Nckc58nevpJ7yI5uOV/T/UlQ/XiyLB04kq
	UlvrDUKLDwvVPQIuXlgAsFKbfEO0deiCMLLQghkFhTRPx5psgxJ6vC2Z5T/VXtvQZL2ZPY2VJ8kxg
	+qFx6GftUplABK1cDE3k7c7XY8hATnoh/KogDmA5+66ULP6Fti+yFYvvPgeZsJt71I3BnkowB69A5
	NLJLMScFJFN1MtyuDQtrxcOr94SJb7iHOBweT3BIFupxweNQSa2+rvZ4/kZ8hGWpIRCMs3KGJR7Bk
	epotXLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bJV-00000007DBi-1bSx;
	Tue, 17 Mar 2026 20:46:53 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bJQ-00000007DAG-2AKw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 20:46:51 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50906a98ffeso149811cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773780407; cv=none;
        d=google.com; s=arc-20240605;
        b=Nqpj4yMaYKqikaSJS+aOAoovpwO2hyFkf/qS4Zp2xv7ry9dD1DMwWAacPmG9hLwv89
         WWN5OJgm+5Bo7Ka3hjHJKmfV2pm1VB9/gn3P3i4RKDmkCCfIIHNW7CdnY6VLm6UxpNk4
         +PiEwx9F7UQec8a5EbXsxFZP3y0Abja5P+055Et/8UxB6NkJ0wZq9y4ISOg9zonns9Ps
         vIf5XZDRCO3ydpmHSflEhFRuwAU69pZ7z6+pu0xgJPniziQ8wkGPgAUTmme170B+zRAR
         QeDdo8m9YOFsvJFfnpfR8HQgjmat+vQNvDycRdNH+6I1V4qRRkEcGiu4A7OKNGDY5MLS
         KeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        fh=cb+17crW7HDNMH7gCMJQAWxGAr94GUtbl7VdQatK/Bk=;
        b=InO1XRy6C34WmQO9RE2uuLiL9JCpNXPitQfmytUSuSIUkYS8ukCdqrPmo8N9PJGufh
         6CY5UsC1AwZzyPPbvO7YIfTHYsECdHwTSQPcQun4X5p58WazwmSvDAWOuVCOwLJtdLLs
         W7U8rTMkTsYWUQYF04lC/l4Ne/rYgl2xU3nBa07oL7dOWN+0PfB9XX6M+Sz65Mo6jOIc
         5VBdyojgXGKsvrxulZFX8Daf7pK6XvBXYmCVTXkRYwDZoh5yPCgmhXDzKcxzDWkAK2oy
         bX4IuYBqtATII6hJD+1PT8LcjCVzM0iWMU+3AtvLGVbqcyEDQl/7pf2233YQDzNz5cCq
         46LQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773780407; x=1774385207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        b=qV6jB89Af25T95zro2bxjypscuxJok1ydjRmTE6ww/SrsKqclKZpwPEpG909H9w+07
         B/Rt/aVMYx5qBmKiq/gyVLjK/gnUvz7I4I7N6aMEXNkmdn3DMcuc+BjjrnTzKorumKe6
         DNNtfpzzX3cOzjlcwQKgxku0aM7yvPoqZx6SLo8LOeSxE2/UQ1UM6py4MDzHotAGu2lS
         e6qkf4qaHnGaKmdsrJ/PriVLR/M/r/8QC6jKZbWJdRsStl4TxEvo+Bssm9K4KmuvDvTK
         PYa2bMpIbkkwB0Y3SocQ81HHMtzph41+azGoucVT8o5yxFbOt/2fMXtqNidYT946Zscw
         Iouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780407; x=1774385207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
        b=nK6Fbbeq3qyF9De+lWFwInvArEergHIEK6uzTfzNq20hGG7CkvF6sWBKmnY1y50S8f
         rBVAYTSPuIMlz3QBxrr9edXP8Zv/ZupxtwQgpNL8+z5c6lfRnyvUTJhIyQDD13WN/g+r
         LqjVrKx6q3rI/niPqHdnVF/DSeasbCFRsg+SaO06+aV8GwoBKsPezOaai+MfOgOSHfXA
         L+O+MPzg1pwEjG+zm6ujkVfG930DC2ExO/GiXiDRi7Ctj+LG9HZxNiUFJUhk+2vkxmmc
         qDdzYN0HI5N6TrbaoO60DwUy+ad5D9HuQ09sXaCy2j1ig4gNDA07wZ9RvVkPfjhlVauv
         CrIA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZKzkC6/hA/jo3hJ7FVWmZL92kdkBgvC/crEfIBkmQHOqsmcltb4t1USCzV4EP2X8TLK91ZsKq2ANhreIFjrX@lists.infradead.org
X-Gm-Message-State: AOJu0YxHhdxBvU7iZKmSesMXI0zWirJnPbengkPqzwpERnTcPjdFdDz+
	+eRwYKYwEMdS1nPHOSS2urUsSM8/fP8rqt3ZvxbHsOHPCxQmuW9rkJxr/shXesOc39tLqoAI8ea
	Me3+KVPjgQ0SMjBzRjGsrWCG9RRVG7QfB7vV5a3QQ
X-Gm-Gg: ATEYQzzCLlG2NY1yXstHaHwmZGhnypKeOuEMUU/1P1qCHRhTcSbKyG/AMOVpSRKM1rv
	ax/4Gfqx+AMKdH6vXXWI4/DqHzsXVnLPzcvWsgd+76K8oX8Qtx7QnCXtsXHpjZPBgRvYcz0SRyP
	MsNdO1hhrDFbEQiEICfaZA/SS9XQFKHJotNjXF480pmc06SPwcCrbzdabe2xUKqrAAz1Y5SYNwL
	aesciFYiZzQlndCGBFl72dY9A8GJ//v+HATPFB9XNOq06z6fHg68dwPMDWg0sv6bgVvukEXGn4O
	xZmRu7by4aS4QB2pZ+YIV529WqxypyX6zvNI0A==
X-Received: by 2002:a05:622a:130f:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50b14848d70mr3924821cf.16.1773780406374; Tue, 17 Mar 2026
 13:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
In-Reply-To: <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 13:46:34 -0700
X-Gm-Features: AaiRm50ZSv0JOBEsyaTpLpUZLAlSOUqng_UaLNmSO0lPuUbLHyEvRlv0uikpAUM
Message-ID: <CAJuCfpH653zdE=mXArpx8BUszVVC1PoN+rvp+WxdM3aAUbpqRw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] stm: replace deprecated mmap hook with mmap_prepare
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
X-CRM114-CacheID: sfid-20260317_134650_519930_72892228 
X-CRM114-Status: GOOD (  23.61  )
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

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
>
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
>
> Also, in order to correctly maintain reference counting, add a
> vm_ops->mapped callback to increment the reference count when successfull=
y
> mapped.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  drivers/hwtracing/stm/core.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 37584e786bb5..f48c6a8a0654 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -666,6 +666,16 @@ static ssize_t stm_char_write(struct file *file, con=
st char __user *buf,
>         return count;
>  }
>
> +static int stm_mmap_mapped(unsigned long start, unsigned long end, pgoff=
_t pgoff,
> +                          const struct file *file, void **vm_private_dat=
a)
> +{
> +       struct stm_file *stmf =3D file->private_data;
> +       struct stm_device *stm =3D stmf->stm;
> +
> +       pm_runtime_get_sync(&stm->dev);
> +       return 0;
> +}
> +
>  static void stm_mmap_open(struct vm_area_struct *vma)
>  {
>         struct stm_file *stmf =3D vma->vm_file->private_data;
> @@ -684,12 +694,14 @@ static void stm_mmap_close(struct vm_area_struct *v=
ma)
>  }
>
>  static const struct vm_operations_struct stm_mmap_vmops =3D {
> +       .mapped =3D stm_mmap_mapped,
>         .open   =3D stm_mmap_open,
>         .close  =3D stm_mmap_close,
>  };
>
> -static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
> +static int stm_char_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         struct stm_file *stmf =3D file->private_data;
>         struct stm_device *stm =3D stmf->stm;
>         unsigned long size, phys;
> @@ -697,10 +709,10 @@ static int stm_char_mmap(struct file *file, struct =
vm_area_struct *vma)
>         if (!stm->data->mmio_addr)
>                 return -EOPNOTSUPP;
>
> -       if (vma->vm_pgoff)
> +       if (desc->pgoff)
>                 return -EINVAL;
>
> -       size =3D vma->vm_end - vma->vm_start;
> +       size =3D vma_desc_size(desc);
>
>         if (stmf->output.nr_chans * stm->data->sw_mmiosz !=3D size)
>                 return -EINVAL;
> @@ -712,13 +724,12 @@ static int stm_char_mmap(struct file *file, struct =
vm_area_struct *vma)
>         if (!phys)
>                 return -EINVAL;
>
> -       pm_runtime_get_sync(&stm->dev);
> -
> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> -       vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
> -       vma->vm_ops =3D &stm_mmap_vmops;
> -       vm_iomap_memory(vma, phys, size);
> +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> +       vma_desc_set_flags(desc, VMA_IO_BIT, VMA_DONTEXPAND_BIT,
> +                          VMA_DONTDUMP_BIT);
> +       desc->vm_ops =3D &stm_mmap_vmops;
>
> +       mmap_action_simple_ioremap(desc, phys, size);
>         return 0;
>  }
>
> @@ -836,7 +847,7 @@ static const struct file_operations stm_fops =3D {
>         .open           =3D stm_char_open,
>         .release        =3D stm_char_release,
>         .write          =3D stm_char_write,
> -       .mmap           =3D stm_char_mmap,
> +       .mmap_prepare   =3D stm_char_mmap_prepare,
>         .unlocked_ioctl =3D stm_char_ioctl,
>         .compat_ioctl   =3D compat_ptr_ioctl,
>  };
> --
> 2.53.0
>

