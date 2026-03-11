Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9632FD88D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 01:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oF/doq6oyWwDTCyW1l4hS1E5POtzgyvQYrb/7hmVZg=; b=PBnM4Cer8/ctq2Bq2bGHlUwdZJ
	q6ECCUb183FDeWmdkzLlMGbgL4GuuH3Xe8cfJIradx/G6Gp/bjKOH66b3UXypXPzMpGJ+blnyA9JF
	7bo0j9IBN6qKfhmSzLHIgRwycTOG/PLwH/rc+Uu3AiJq3y3uU/kHsJ/RjSMdZ5EZhg3p/df/ayDLd
	AKLuDvIp2uCUb0Wgk6PHPqUBGBK3bor0f6CHQu+zhw75N+2EmnSuEcEfyHvBmmBKlu2yGdHJgRtp4
	Z4ACcI6DzvQpukcBtcZh//98aJR89lyy1JH5UzmS7KDbr9omLDf4Py4Vsb1p4A5gSWgxvqW6uIRI8
	FJQA96Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08IH-0000000AUZk-1Wcf;
	Wed, 11 Mar 2026 01:23:25 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08IF-0000000AUZ3-2C12
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 01:23:24 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b96dc65b886so78091866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 18:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192201; x=1773797001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/oF/doq6oyWwDTCyW1l4hS1E5POtzgyvQYrb/7hmVZg=;
        b=GSBA0OEQrVcpIK5MFy98jEMVx9iL62ZwCdh1RstQI3tMNn7RuG0D/+OAa8uLZECaTW
         SmfB9fN2bLIYiCqkKm15I4tYprqT2C7KBnj98ctxXEerXW0ssUdX4VZO0CNnIbXTL004
         OS52XNj356Xs08yzZi6DY/NCcPd34UF3C3s+44JBk1uuqQRk5ZHzkuRoj/3xaHD7u1fl
         CbI2y1MENsAWuC5jvdDAr3B33vlvKnRWeM2/xFdVihvkKS23q06PMKS5/lZWg3cJGaUe
         68NPj8dYsfIle5l79iHIBOR7Jrg0sCUACPsErT0kwFiNTdtRFdTjK3d22qM8+kKR6ILl
         /mLw==
X-Forwarded-Encrypted: i=1; AJvYcCX+o+ejfw1MbEwcwUNrLjO8LbxKEx4e4sDdsD9007mBeBPjNrVlD33PjCDNlUTf+LQdqSuAv6qjG2retV6K1hoF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7blH3HNpTyB2nfkgFeEZErrE1McbDCL2Ob62zf7rSxSv6Ar+q
	A3DX5hzElpSIhMY8fQ2MS2C+zA4EMXgwlDTjpuA5nfDOWMK2TkwagCknVPnxg+sfsDfnEQ==
X-Gm-Gg: ATEYQzxg4hvkMX1l3GoLVB0IKLATNFwtkS0o65B2pm7BmjoJpsUkRNJGqml5f9QYPic
	b08o40M9DhD8V6G2Z8YrWJP2oWC5YfE9uAOoJ4SmMmJnxoVrji011nRTKf/soyAzlGbQ+DJfE8Q
	6W4DN/Kp92myJ+eNuFqP8D/NOekXXxwXbmaBqILodN3Q1mbYnDO4bZjwNFCyRI+qANEhwxh/BRf
	mJo9bpLw8P/6MsnPiXshFeJ/kyNsBP652w+OXptJxkXEyKSKgiak+B8yfoxc8wa1/z+z5+iYYia
	aHP1J/RYN62R0KfImAtDYShC0t6vuYOadAuWi7Tz20l8OJB/JaaKeXBo8jbkmTrIKgy4cjfczKD
	jT67XTKGVvPJ/flrQoTREMyUfejkPSOstrxmdR5BvvsaWq3VQOdPpk/ONx8EbsWxEzPzyLYAIQR
	hjoTqAzw4VceY/F05w//OvBvA1c+7YKUM85JOOVwx5l8CrgYWxlTH+skc=
X-Received: by 2002:a17:907:d649:b0:b94:827:c580 with SMTP id a640c23a62f3a-b9711850fc4mr335005266b.6.1773192201024;
        Tue, 10 Mar 2026 18:23:21 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de0bd42sm19140266b.9.2026.03.10.18.23.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 18:23:20 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b942b36de08so86581766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 18:23:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiGnoBU8xM5+epeoP5lAOo9dO9oRboPLbF7OjyOca+htTHSaOrV4RA7czLb+nB+Lb7b//olHCH6JQluEFBTR4K@lists.infradead.org
X-Received: by 2002:a5d:5d05:0:b0:439:bb46:7457 with SMTP id
 ffacd0b85a97d-439eff518c7mr10359487f8f.16.1773191708627; Tue, 10 Mar 2026
 18:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
 <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com> <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
In-Reply-To: <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Tue, 10 Mar 2026 21:14:52 -0400
X-Gmail-Original-Message-ID: <CAJNyHpLU7sTJRtDqTbczTz0iayj-Nm8bPHrPaOcsKVb6nQyw1A@mail.gmail.com>
X-Gm-Features: AaiRm51cz7xo1V1erpi09gKFdY9TTILawmEFCzQE55oadwxdss7qBUImRUPZq3I
Message-ID: <CAJNyHpLU7sTJRtDqTbczTz0iayj-Nm8bPHrPaOcsKVb6nQyw1A@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Caleb Sander Mateos <csander@purestorage.com>
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
X-CRM114-CacheID: sfid-20260310_182323_576183_59571365 
X-CRM114-Status: GOOD (  23.14  )
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

On Tue, Mar 10, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Mon, Mar 9, 2026 at 4:55=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wro=
te:
> >
> > On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
> > <csander@purestorage.com> wrote:
> > >
> > > On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim=
> wrote:
> > > >
> > > > The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> > > > struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a resu=
lt,
> > > > numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx(=
).
> > >
> > > The node argument to blk_mq_alloc_hctx() comes from
> > > blk_mq_alloc_and_init_hctx(), which is called by
> > > blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(s=
et,
> > > i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node(=
)
> > > doesn't find any CPU affinitized to the queue. Is that even possible?
> >
> > Thanks for your review, Celeb.
>
> While I'm flattered you consider me a celebrity, my name is Caleb :)

My apologies, Caleb. I'll be more careful.

>
> >
> > blk_mq_hw_queue_to_node() can return NUMA_NO_NODE if the device queues
> > exceed the
> > number of CPUs. Afterward, it is adjusted on the caller side to
> > numa_node =3D set->numa_node.
>
> I thought the NVMe driver capped the number of queues so every queue
> is affinitized to some CPU (see nvme_max_io_queues()). What am I
> missing?
>
> Best,
> Caleb

You are right, every hw queue should be affinitized. It seems I'm
missing a lot. I'll look into the reasons and get back with V2.

I appreciate your review again.

Sungwoo.

