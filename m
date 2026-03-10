Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD544EB107D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=; b=IWdjMXtCUDXsh7KPdQMYyBO9IP
	M0gIu1xofG25Q9dIcDDhTT3WTXfNg3/5Ota5cNR/GbDfJ5i85Sz8ZAAgCsI431FDIH54318n06JtI
	bEm3HHUZY4ao+Ia6AzpOD96unPjV42Q2+I0qZM+SvmOmjBKSqpKa+nNqdXld0REowteCnI3AUclBy
	LtD0XwNVE3YSnb7EE5SAquuRMYPSc6aG2QdMBsWiNLr7rk10/yq4i0UOrKYA1PuPicvXAdkmVHt3C
	UWvE909Ec6R+NEJpKNU7eicjBiDM6F37Ida3Hx64Ft+KWtLGiSbo/hDu2pj52aN+cKit+edAxdFSM
	ELdzCFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzSD-00000009ru5-2Zlr;
	Tue, 10 Mar 2026 15:57:05 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzS9-00000009rsz-3lOK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:57:04 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-40947c81b31so670373fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773158220; cv=none;
        d=google.com; s=arc-20240605;
        b=HtaYUbAXEffX9mWE93ubM0BhPzQ7GmA772q2iSy4BmzfX5b15CYW+4WKIn9AZtPkkp
         iloiN3YNG4PQgsD1K5CO+sNkvXbcZZf/ldOLHMAPFHWBTvHQWF6aknfbO1Dv6QOEgLKN
         rSAd9Ni1PjpSNAxRZ/m4WmGEPutqn7LJ2g/Y0dWhOaf2LGjRrGd+j85J0XhfwR55XJW9
         B6kJHM6/tv86kIIHu52obPTPB8zpoxHsGLmUncSP5HFyDxnjTk+/zJh6hUVtPfbLXvbQ
         T585Q94/y9gfFVNS5NmYfZWxon+Ze8WhytbfrkO15G2XoL6iC0YfWIjCQeVk+XFIpLfZ
         OXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        fh=BIduIlC3DMRivzuMX2Yk5S8fHSzs2C6ZyNqkC9AWGy4=;
        b=WIEWtRbFCuRTKyZ4FP1reT0ucltE64oHUdErskgkC6RwithAwkHODgblUi1JC+kXgV
         8JeOhLlXhKeRhERcHep4fcYYoCtDvQmAenh9Qi+s1VfkJjavGvhO8jDFuJmIYVyDXnDq
         GQdx2St41XkrXpzCcBfe9L7Jsvmrs2gYBy4mTsTPs52TNrDTQGTmxKwh3S6R9TE6BExD
         s5keO/a8c5MkYRpnDUmHjGtcgJHZq7rGpUsMMzlfXsAHQ5s/WWDREGeucTZoMJ1Nsqcp
         A6lR/He7foPUiI7a7h1Pqb+LB5AjMMvN1toQuQqPaG38hfdCHJGuL6Ey4RupUSD5XWEa
         IRUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773158220; x=1773763020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=Hle9sW6Fu2aRonCKUeTgczqon4CQBEtOK36ksYLjuy4nJPbMYbGyL53lWN5Fw3/5Wl
         HP7qvFnQ9cl8UmyYEAjPi6VdZ08k0hEFzkWCzqtmn1vm4Pk+S99EHVdsUXDrwFpybBJm
         vyzjp9tP22xczj07xbIfPWHAFNOx2YDXEaO4SsyB8LQxdX4TwrtruJ/Q2hWjqOtHoBFX
         CgDwzVdp8mrzgOQcHET1lDoK8PHpOUi0NHKSRQ3eyUh0G5NL88YmrnHCGhK4xKMSCrNA
         KBWaA2gx6sTOK1myE1p0798wNjuJPh2Q/mZfjk09RU5lXr4mIoT4rvZvre+pMlmdy7Qh
         OPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158220; x=1773763020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=mx5EJLYY7NRjLCU8e64Z22OsNP+77Lj8oxDdfGsv1LjY3RrcsAOqwZ4yiJy7WHKXzS
         ebt2lBhQL4e6ckldQ9nPwbOOaCk9VfnGJH+kduxzfb7sba/vQE+wlY6NQ7uXIP8h11ia
         bVd7g+WSNPiPIdGlXQbn7+krh6zkQm2HXlEHdWYGU/xP/CJy8G9xAkVJR3UScIt5mm0E
         ugYSbiQokuLQcw+weRtBWj031eIzmC8+z+S4mODqdkeqMQP29uepeWCZ9hT9sRmAOIHK
         5BxZOKs+hmwPjiIidw8r6Opciwvz+DRM+RD+uVlJTkpGTHIsHzP1COgtZBO+zzNMuWS4
         7nHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoLMnVK5yWnG63lTbRY7epVaqo+o4Hd/U+ydZQUd1T/MfWUy3loeTN/hSMrtA2Ge2BJlfUTv7EqAX4oNv/6C7S@lists.infradead.org
X-Gm-Message-State: AOJu0YxUU0uuLxbcZiCeWgyhNIhXJ4dDfj9NW8vWijxRHTC5b2oeN32z
	1J2NQxJtfENwlT1IYB9iJnYimQLp+fUAQaFnHGoIt/l4IOX1l8KHhEiFX4OmYG1/dsqivd19O6U
	FAGivkaY7Aa6HsGaz8jMp43AGUPes/nveklZ7OF/kCQ==
X-Gm-Gg: ATEYQzzN3TPbRsJZoK2a++TnukDmUEukwhUHYGK39EcbD534Thor/D/DiVOZ0O3e5Eq
	s0xDkQ/zutdhafcHKJ3uc5eVC9WDkP+ljiUs+cP67YfjGquE2MCT1EkyzxsxtnalEcnP8W4rfZj
	KSeFAgN/H8EsHOSYb+Esa3OSEGpD5XN37XGuHIJf+93oZN37yQimhgDUhNB7nrpj9pPL/Eq5WVO
	uKjVj224DTvSKuSlIuGcwsyM/to1wPdK4fJG062aTf4wOsB8bePW5XuXMMGDqm57ctExdIAfv5D
	JOgxaHKP
X-Received: by 2002:a05:6870:854b:b0:416:3f50:ea2 with SMTP id
 586e51a60fabf-416e45c1dc6mr7199342fac.8.1773158220092; Tue, 10 Mar 2026
 08:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
 <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
In-Reply-To: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 10 Mar 2026 08:56:48 -0700
X-Gm-Features: AaiRm52sHfM1lLReXhJ6K_-eQeuNMsoWbyv4AHit6rY5_ursGYcV9eDpU-ihUic
Message-ID: <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chao Shi <cshi008@fiu.edu>, 
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_085701_947784_F2B3A706 
X-CRM114-Status: GOOD (  25.42  )
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

On Mon, Mar 9, 2026 at 4:55=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wrote=
:
>
> On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> =
wrote:
> > >
> > > The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> > > struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a result=
,
> > > numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx().
> >
> > The node argument to blk_mq_alloc_hctx() comes from
> > blk_mq_alloc_and_init_hctx(), which is called by
> > blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(set=
,
> > i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node()
> > doesn't find any CPU affinitized to the queue. Is that even possible?
>
> Thanks for your review, Celeb.

While I'm flattered you consider me a celebrity, my name is Caleb :)

>
> blk_mq_hw_queue_to_node() can return NUMA_NO_NODE if the device queues
> exceed the
> number of CPUs. Afterward, it is adjusted on the caller side to
> numa_node =3D set->numa_node.

I thought the NVMe driver capped the number of queues so every queue
is affinitized to some CPU (see nvme_max_io_queues()). What am I
missing?

Best,
Caleb

>
> set->numa_node can still be NUMA_NO_NODE if CONFIG_NUMA=3Dn (trivial) or
> pcibus_to_node() returns NUMA_NO_NODE if ACPI doesn't provide
> proximity information.
> But I'm not sure if this is usual in the real machines. We found the
> crash in QEMU.
>
> > >  static struct nvme_descriptor_pools *
> > > -nvme_setup_descriptor_pools(struct nvme_dev *dev, unsigned numa_node=
)
> > > +nvme_setup_descriptor_pools(struct nvme_dev *dev, int numa_node)
> > >  {
> > > -       struct nvme_descriptor_pools *pools =3D &dev->descriptor_pool=
s[numa_node];
> > > +       struct nvme_descriptor_pools *pools;
> > >         size_t small_align =3D NVME_SMALL_POOL_SIZE;
> > >
> > > +       if (numa_node =3D=3D NUMA_NO_NODE)
> > > +               pools =3D &dev->descriptor_pools[numa_node_id()];
> > > +       else
> > > +               pools =3D &dev->descriptor_pools[numa_node];
> >
> > Simpler: if (numa_node =3D=3D NUMA_NO_NODE) numa_node =3D numa_node_id(=
);
> >
>
> Thanks, I will modify it in V2.
>
> Sungwoo.

