Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6F3FCC9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUJ62UzriDRExITrg9iBzNvEWYzDINBTrPfASD/nLws=; b=TEZdbVI0RqyuyzEWu0yYDC/FNM
	Bw1TfcrQLR/TOKIOkV2jvk3K6yF+bQoO6qOPRsbws5MxBm9lnK6P2fW5n3IVu536jT76cAjFuvYe+
	gCVWOCg2u3K43IOswzcj0TC2ho6oZzKX52DalC+sm2sGRLYUXPzMWDkJaaTc1Wtp8ekCXYe9A8xSL
	6mTehyaiA+EtYuF3786xik3zvCM14b0Bn4Eguh4q9rIRiIHae27L6JPZYMNg41ioblShXvPubA0MK
	j3r3aPyH1Q27KkYLrucw7LgF7/Ogw/gau+A8opbCnvu95Tc5Gc/JDfbGTHC4xaeQxZsrp58HYGbWw
	49/65iMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkY8-00000008M5A-38BE;
	Tue, 10 Mar 2026 00:02:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkY6-00000008M2X-2Z4m
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wUJ62UzriDRExITrg9iBzNvEWYzDINBTrPfASD/nLws=; b=TzE/+aRKVh3tIL4Omb6aO4lBKR
	XhCqqmL7aQXQiV9z2VnTGuU8NLKPALsBdrZ8nVhnsV+YonUOGclb4/KWfmgjASiGPoeSD5J6ILp9W
	8LjYpibKDihgNlajBZsgyouzMdTrlj/2w6BOSrUdDSHvuqI9IOkx5DqyDCda5oR4yM4U9goQq1rQ1
	YiClrwc+UDjf0wU1XlAGCZV3OG7x4A8X3QJRCup9guECfTFdW7GVnT/FZnGGID+UX85KWtReIi8T+
	k4ltutfSEkOXL5nu/eTi7dH0WGmOFxiuvKI8TdHahpr6l+1C2tbOn0SpScw9alUJRsu5hsLtzR7/B
	OoHOD1xQ==;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkY3-0000000DN5W-1OuK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 00:02:09 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-661be3380adso5881686a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 17:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100925; x=1773705725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUJ62UzriDRExITrg9iBzNvEWYzDINBTrPfASD/nLws=;
        b=Nj0RQ+aYiV8U00WTG6eh+nt8EEa4sJO+NcGBGkYHPWyvwL8NAgS4YotxpAhEWpa3qD
         9aUxIi+K7RUmXBlItwhjKEXKlGZDu9Bd2BW/he2v7KfwVn3QLYBl2S8RsxF9eLqc7kML
         iEhgka/zoRuNyS6Zuux7AJNp6KsJ12XdUNg0jFQvVsOZlVzHvCSK4Am7aSPYxvqD+5ck
         k2SrVisOXq0NYvhc9uWWKhQXJZj2cC/6AvokuOf0cKWgjVQyosWtMfrhxZlPVqgmL7Qj
         97jCAEYTjIZ0iYWy2zg7/E7UeXOLmKHenwAN8Yg1QKE2ZmSw1l24kwjx7YNfrc4j28H6
         RDkA==
X-Forwarded-Encrypted: i=1; AJvYcCUvX3QwPBhqGlk9brIRjS5h7NnCdy7gxEBNPXwdqXeTESiY5XB6l9IWczwO7qDQH2SgC2vE3BZKAhTyXGvfDWgc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6z3lvA7G9Q8DulwAwrcxMaLdQDVskvzaDeV7hKhdYBtmFzHm6
	1fhQSQ1Xpv11rBwy9jR0RuPHCjGIYexQSxPBhhhJDKcO0Nsd49IOPGmtNDRPJ9WyfHoXg9MK
X-Gm-Gg: ATEYQzwzBK5m90sSuQ1xyk/+bo3cH8AnbrXSEiS8dafDGa42tYwQWn0MqVKQkRUs7ig
	R/rjJ9Pqxvyz3RJlpHQb6c8pBruS2+kMDalwOcVSRCazCCr6n0A+xCvFVHfwhIAfAUsewZqnsZK
	G0zI02xj9Qw3ydWKzzDL7qbqoSPqoeeVaVhbU1/BoKhgf+Wvs5JFotXg1amR6elyMH9+lbp+wFy
	rqXNoy8Zb8OQVUia9ZX66OZDmvojLWsZseexxgxT/4U+29WblVDUIuqTR8W9teMhtGe+nj/prqI
	D7SqhxGEuxLujbX0Zqja+7qwIn5FYXtzCwIPZ3UAyrD2Co3gHH2IN3W7rZ5nNpyCh5oupAMcZGM
	7A4xLJmaqQbj1e2KiRajBuNADVRka3NqF0tgfE/6Cvd/fPHgUbq2AvI3uA+mCZDexkCrVY5UDpg
	57hvm2doBCMMBpfLE6dH1nr2gVhjo+pgJu3hlY4RnlquV9qlL1H0UUSkpo/cVHpFVvnQ==
X-Received: by 2002:a17:907:3f17:b0:b96:edcd:cced with SMTP id a640c23a62f3a-b96edcde05bmr367660766b.43.1773100925199;
        Mon, 09 Mar 2026 17:02:05 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15d51fsm427059166b.53.2026.03.09.17.02.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:02:04 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so5468391a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 17:02:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeiiL/Lsux4i8bE3hWPp8xeOmQ/Fp1EzhGSI2qJYrdO6wQN0aTjM9luUME2eafKSmQGHJwNBLPLJdYCKv8Yt0x@lists.infradead.org
X-Received: by 2002:a05:6000:144b:b0:439:ac33:5082 with SMTP id
 ffacd0b85a97d-439da66b72cmr23928350f8f.26.1773100503051; Mon, 09 Mar 2026
 16:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
In-Reply-To: <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Mon, 9 Mar 2026 19:54:47 -0400
X-Gmail-Original-Message-ID: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
X-Gm-Features: AaiRm53vE5uEinTHUYE1aa6bIvdkwyOpz0dn9fOlsjLR4PN8Z_3w05vllGJ47mw
Message-ID: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260310_000207_664397_D65EA3D4 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Sun, Mar 8, 2026 at 11:30=E2=80=AFPM Sungwoo Kim <iam@sung-woo.kim> wr=
ote:
> >
> > The numa_node can be < 0 since NUMA_NO_NODE =3D -1. However,
> > struct blk_mq_hw_ctx{} defines numa_node as unsigned int. As a result,
> > numa_node is set to UINT_MAX for NUMA_NO_NODE in blk_mq_alloc_hctx().
>
> The node argument to blk_mq_alloc_hctx() comes from
> blk_mq_alloc_and_init_hctx(), which is called by
> blk_mq_alloc_and_init_hctx() with int node =3D blk_mq_get_hctx_node(set,
> i). node =3D NUMA_NO_NODE would suggest that blk_mq_hw_queue_to_node()
> doesn't find any CPU affinitized to the queue. Is that even possible?

Thanks for your review, Celeb.

blk_mq_hw_queue_to_node() can return NUMA_NO_NODE if the device queues
exceed the
number of CPUs. Afterward, it is adjusted on the caller side to
numa_node =3D set->numa_node.

set->numa_node can still be NUMA_NO_NODE if CONFIG_NUMA=3Dn (trivial) or
pcibus_to_node() returns NUMA_NO_NODE if ACPI doesn't provide
proximity information.
But I'm not sure if this is usual in the real machines. We found the
crash in QEMU.

> >  static struct nvme_descriptor_pools *
> > -nvme_setup_descriptor_pools(struct nvme_dev *dev, unsigned numa_node)
> > +nvme_setup_descriptor_pools(struct nvme_dev *dev, int numa_node)
> >  {
> > -       struct nvme_descriptor_pools *pools =3D &dev->descriptor_pools[=
numa_node];
> > +       struct nvme_descriptor_pools *pools;
> >         size_t small_align =3D NVME_SMALL_POOL_SIZE;
> >
> > +       if (numa_node =3D=3D NUMA_NO_NODE)
> > +               pools =3D &dev->descriptor_pools[numa_node_id()];
> > +       else
> > +               pools =3D &dev->descriptor_pools[numa_node];
>
> Simpler: if (numa_node =3D=3D NUMA_NO_NODE) numa_node =3D numa_node_id();
>

Thanks, I will modify it in V2.

Sungwoo.

