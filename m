Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAF8F30297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 02:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=; b=KkD7gEmtzyjxxcuXgSH6/NVxom
	jofPFJSHsjk43Z9IgL30Pawk1O/wiFzMo8KjY8k1tabbL1SQ9nKpumN179cjODCrvFB+zshlps3x5
	aaeyVqfGCZNkoQSepXHcXxyttqeAh6Z62Xlbe10BkHAbrjmNHLR8qlok5YAttj4F2NuqxszmWLBWR
	5XV9XfvRcb9002132urMXiC1dlLoLvmxAR2gUYBtAupoTWp604UsS6l8m7vhrBI2I8cK6wd4uU72m
	iyNdD1xzE3l/njZ9KEuko62svz35UFIBZSJmQ2dvwrhloLDm4Ht6P94uPLdPSX1QoqHaWoY8BELSX
	tN8GGQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xlW-00000003Doo-1H0I;
	Mon, 16 Mar 2026 02:33:13 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xlS-00000003DnQ-3wcn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 02:33:08 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-509062d829dso709121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 19:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773628386; cv=none;
        d=google.com; s=arc-20240605;
        b=lisftzMLNyYfZz7BdDGoccflNkkYi7BoHpNbIDXw9Nk7I1skZPZ1m8k8CU09l4befE
         JvGreOeGfSRsZzRNRZbAmQZkY4LHY+/xZGP7cwfGnaSIFc0KpI33Eo96G32aEG+lHi93
         cfkC137mk2xfVVDBTwo37yGZ8sj2aS8cjgy0s521TRvK7GJefjXRZM6vwzQFw7CW+dRC
         1GbUbfe7ftPxcMsGISuSAHOdqWhU6vpujqUhujXEO1Am3+LqPNhPqbSxHCy2ufmQk5+W
         SyxhwfOngczq90sbILfgjj4RrDe2KT24ytka/iecFjCqhJQWG89dVw8pndgchpy/QbJT
         N07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        fh=iKCTSSzU4vw4Xrc6jxjJnPJTh5zsa/a6nITFoWwxtoc=;
        b=WeBjSt6j5iUBMFhcugKWJzheiHz90fKkRIt6NwsEON5Vvj8OgqXRYMBXrMwrxJ9Z1m
         QxttfqiSpjlcpDJ4JNiy0StPP/AbhkFnkIH7MhYlcJ6bGPPxpxrETvUj+hkkzrrwlmHV
         UDe0WCPZpcmkilUSRT2wrzjoBRIugDsQWCuLeOZwbNWZU7PFwmusr/QZPISJ3oFBdf1w
         JXB2lHMZRE1FMrWSPqhrURo9ctyC6lFZbsh/zc8nrC02s5fn2IxelEtmFhJ8+FQkbv2d
         Y7LnXEDJe4wb8hkzdhL9RGQbSdSYiJxcpMGtHHkBR6tKVranOs4NI3AdOgJgZGoBohMq
         Oi4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773628386; x=1774233186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=KpDJvb8zxdfFZL0aSnmo+edFWcpY7UHQhiK2GF+Ow1AafBqPvg+9088MTKD3jK2h+4
         6mwnL+9K4wkaGUEshDH0+rbqXiHy4s5WkyaJLVruuOU+N9fvpN1AA8f0VkDfHshjcn+p
         j3wPoKLI538GKygUWK6ssPvKdVAjSeD1J5rW76fiEd6ktGMXXti2OUt0odhZ0SQFNtOZ
         SxpWYXAfClUbowGZIoBHfpsq0bExryLJwRZMAK2tUmz1p3Nx8tdx+FmULzvhH9tBlKO1
         RHHlCLogVmEw4nsAFC/QeLPxXU2Go7aZqRtiQtBH2/fI9a2O5LAGkhTUUS169bMzOrmy
         DAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628386; x=1774233186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=UXVnIQF7rmigaKVaUjIRvimogAX5CFGEcLiaD87w03qWSDx3xhUGEofh3YHL9L/Fl1
         ozuGnoYQje6x8cpWlcHEw+o6cF/Po9E1u/UCTww00yWG3rczoIcqzdc0CkTY5VA0BhSD
         u1AlTDP7FlJK2Ehb415luyp4WQ2ImDwynXrrCKB1w4OwBRpf6lIvowjZ6Mzj8qDDzl35
         hikcoHGwZNrcZxQ3zXHmmf75luPF9nEcCHxly23L+SgtheeOheMohsdkVxtuGGVWMaRy
         idK7NHWE8o4l4Rkxrt1fn0DzbPdAjThKLo8AQ7fwY7Xx5LC1S9kiVbUzJcXXMYh13zhU
         /fbA==
X-Forwarded-Encrypted: i=1; AJvYcCW878iQKGRsvTqWKns4qmHlZS6C+2Ihdpgzor1pmle38YhJlxa0dkF01u9G/RwcwVa8PYgq4tuqzqv/iHZ6a89t@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2zZKpWPNbzdeFNAv0VcB0slgLUxA9wqckl0XuVi3/RDbQk59S
	6eANpDXkqojHPjSMo0gkxSv5SQKEq/dY3wbOuFgtxfRvLyoG2eSkih3/NLJiDtHhEBs3rhrC3fV
	vh0lWoXZGHAw8HKCUDtzdKEHyrrPRz/gsgfwi+LXU
X-Gm-Gg: ATEYQzxUJBkrT2Q2pWtAvCcuXtIHb8N8WsuRMrgvx2M4I3cPA/veKP8c8aJjn0YjNoC
	yUV1PSZ6Fc1xGOioYJOeAt259UattypbOopyQL+FtfVGu/7S4BKwiNIyHJo73xB/NWhILRoZeLg
	y4V1BEEjN2fxEjVGeCk/Z4QWUi2mEsWgDovCunbgKyh9UF9Z6iS4h3lu1Rh4lNb7531UuYEkoes
	BoWpSURu0Nyh0xTILleoAKAKajmVziZNBwL9UWws0EGOzN9FO+aLlplGVPdI6ibpB1wFz5vBuWB
	4w9Lrw==
X-Received: by 2002:a05:622a:60c:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5096a92ebdbmr823271cf.1.1773628384887; Sun, 15 Mar 2026
 19:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev> <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
In-Reply-To: <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 19:32:54 -0700
X-Gm-Features: AaiRm52_478_pqzpMaMH6nJQtQvcaF-xKuK5uDWZ-u00xGMYRYKMJPl6M-Q1q5E
Message-ID: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] fs: afs: correctly drop reference count on mapping failure
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
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
X-CRM114-CacheID: sfid-20260315_193307_472315_C7F1813F 
X-CRM114-Status: GOOD (  37.26  )
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

On Fri, Mar 13, 2026 at 5:00=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> > On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kern=
el.org> wrote:
> >
> > > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() use=
rs to
> > > .mmap_prepare()") updated AFS to use the mmap_prepare callback in fav=
our of
> > > the deprecated mmap callback.
> > >
> > > However, it did not account for the fact that mmap_prepare can fail t=
o map
> > > due to an out of memory error, and thus should not be incrementing a
> > > reference count on mmap_prepare.

This is a bit confusing. I see the current implementation does
afs_add_open_mmap() and then if generic_file_mmap_prepare() fails it
does afs_drop_open_mmap(), therefore refcounting seems to be balanced.
Is there really a problem?

> > >
> > > With the newly added vm_ops->mapped callback available, we can simply=
 defer
> > > this operation to that callback which is only invoked once the mappin=
g is
> > > successfully in place (but not yet visible to userspace as the mmap a=
nd VMA
> > > write locks are held).
> > >
> > > Therefore add afs_mapped() to implement this callback for AFS.
> > >
> > > In practice the mapping allocations are 'too small to fail' so this i=
s
> > > something that realistically should never happen in practice (or woul=
d do
> > > so in a case where the process is about to die anyway), but we should=
 still
> > > handle this.

nit: I would drop the above paragraph. If it's impossible why are you
handling it? If it's unlikely, then handling it is even more
important.

> > >
> > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > ---
> > >  fs/afs/file.c | 20 ++++++++++++++++----
> > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > > index f609366fd2ac..69ef86f5e274 100644
> > > --- a/fs/afs/file.c
> > > +++ b/fs/afs/file.c
> > > @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file *in=
, loff_t *ppos,
> > >  static void afs_vm_open(struct vm_area_struct *area);
> > >  static void afs_vm_close(struct vm_area_struct *area);
> > >  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t sta=
rt_pgoff, pgoff_t end_pgoff);
> > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_=
t pgoff,
> > > +                 const struct file *file, void **vm_private_data);
> > >
> > >  const struct file_operations afs_file_operations =3D {
> > >     .open           =3D afs_open,
> > > @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_aops=
 =3D {
> > >  };
> > >
> > >  static const struct vm_operations_struct afs_vm_ops =3D {
> > > +   .mapped         =3D afs_mapped,
> > >     .open           =3D afs_vm_open,
> > >     .close          =3D afs_vm_close,
> > >     .fault          =3D filemap_fault,
> > > @@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_area=
_desc *desc)
> > >     afs_add_open_mmap(vnode);
> >
> > Is the above afs_add_open_mmap an additional one, which could cause a r=
eference
> > leak? Does the above one need to be removed and only the one in afs_map=
ped()
> > needs to be kept?
>
> Ah yeah good spot, will fix thanks!
>
> >
> > >
> > >     ret =3D generic_file_mmap_prepare(desc);
> > > -   if (ret =3D=3D 0)
> > > -           desc->vm_ops =3D &afs_vm_ops;
> > > -   else
> > > -           afs_drop_open_mmap(vnode);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   desc->vm_ops =3D &afs_vm_ops;
> > >     return ret;
> > >  }
> > >
> > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_=
t pgoff,
> > > +                 const struct file *file, void **vm_private_data)
> > > +{
> > > +   struct afs_vnode *vnode =3D AFS_FS_I(file_inode(file));
> > > +
> > > +   afs_add_open_mmap(vnode);
> > > +   return 0;
> > > +}
> > > +
> > >  static void afs_vm_open(struct vm_area_struct *vma)
> > >  {
> > >     afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> > > --
> > > 2.53.0
> > >
> > >
>
> Cheers, Lorenzo

