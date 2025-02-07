Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E40C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hD+eCZVAmu9HYlJ66O10gtRu+u/xshw0dNIF0ppHeG4=; b=o9WAe59oKTwVOiFwosr57b6yef
	8uU+0vDb4Tt/2+O2lAlzIjQz0jLOGdUgD9k0T/Q394EAwG8FRJVBt4leb5Jyl/Aj8+5GYvw3iTKCx
	hJvtEXcX/6hJf6b97MammFP1o2YR8CLBaMzFm0BFwoKl2Cb7OLs5NXGR+e8Nimw7w0mJ/pT04B5aG
	suc0bTPOORARwONkf0URFpqhmllaqzGpG6KtlLv0syb6HHHqrVEk38wg9QW66AZWQwCw5zvCYIMJb
	jsu2rpPQB9nx8JE+55z44dTkI29z0bfRGLQzbHs29QnNLfIs196WXXsDs3Pty7OzrPzuL3l1+PW6I
	75Oi2QOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR3C-0000000AEoA-10QX;
	Fri, 07 Feb 2025 16:17:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR1o-0000000AEbo-0S8p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738944986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hD+eCZVAmu9HYlJ66O10gtRu+u/xshw0dNIF0ppHeG4=;
	b=Iy+C5GtDbg/9azw5oPqlrn3HdOpy+W2ByHcxeinX/c6klmLMjMQx+1tJe2kNOjT0bmde9C
	1N+62MNO2eSw72d/Z0c+3cpVEs0Npk+YCGmADIXqNWjKyXBOwS4gtwEvePuOFQDPUOofnh
	h5HjFVIRZq1aZXbzqIBgAXGFz4TF32c=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-1PTXf02ZPUehHZQhbZW_HA-1; Fri, 07 Feb 2025 11:16:23 -0500
X-MC-Unique: 1PTXf02ZPUehHZQhbZW_HA-1
X-Mimecast-MFC-AGG-ID: 1PTXf02ZPUehHZQhbZW_HA
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa32e4044bso1003055a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 08:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944982; x=1739549782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hD+eCZVAmu9HYlJ66O10gtRu+u/xshw0dNIF0ppHeG4=;
        b=Vy0fAj9vzdiWJrwf+pK2S0pX+SixCpDuYLbLG3UXcZctBb/OmqsDiKEx5gPbREI2Fx
         Q5dncCeUewQURuALT4d+3qyhYVG3H7MerpDlp+9zDN39UIN5WDtNpH7w1SDpvBy6AB32
         EPmok7HISYkSvYUBD1sfKqChec+lkad82+f2YoQgNdm6R6pwOaOEd4EzZJ7ZqjcuCqhV
         oc5nPNxrIuMkXS41htFpOl61ZxM2ATJBXsYQSevCpD5LsCzfV195h46eh/IFihd6/7yO
         MjJVOVwVTS+s+7jS5DSSJlWquxJO+IWvcya16oD/VKUSia6e98rzxgX/ElkxIIhLiPwL
         ATQw==
X-Forwarded-Encrypted: i=1; AJvYcCXyWFiBxR9M1p0WfwCmXyKL7jhP0i7BJ7UiHiHgProun1bNrirB5JtmIg5Il7eR29Sd/rSV+CVB1dnK+Kcfwagq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8roc5hRzB7Z9oJmiQtTl8WY2mWIs3odKgmLWoMjtMupmw4u8+
	cT4jfkx55ZGdhO7xUWk5VLVy52pBu4TL11MM0s8COVBVSdQedJvz9aTWDPtwYIiUI8TtWYTTsf2
	gb7tN9pt/1DJEqm69TESqZmuGqq9C41a3gfzymXKQ0KhWywXiDhycCezUZqrScNzIoxZpdsqxxv
	OLN+k55IDbgP8R9tTMgIkx8X4xNAOoFEzjYveZrwDN9nmm6vo=
X-Gm-Gg: ASbGncsjCYqDMo9eScZy/5NS9nrEt2s3ixMoOcJ68K6j08k/oAjs4VmX87YbPnJlK+B
	qWEmSbUAPPyeL/TvCNXz4tU4FDFse//42gnqtYKwayrFUNqpLDblHOQDlOY7BDcHR
X-Received: by 2002:a17:90b:1b44:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2fa242e7602mr5367390a91.27.1738944981893;
        Fri, 07 Feb 2025 08:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9qQ6Ac9CdjS0hM2Fp5CTCftFgkMjfVYiNIpp2aFlk5UPLOL/FOPn2I3gKNt5IDhZaRA3QY4m6BBB8aMlIkFs=
X-Received: by 2002:a17:90b:1b44:b0:2f4:f7f8:fc8b with SMTP id
 98e67ed59e1d1-2fa242e7602mr5367287a91.27.1738944981087; Fri, 07 Feb 2025
 08:16:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com> <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com> <20250206143032.GA400591@fedora>
 <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com> <e1630046-8889-4452-9f8f-07695ba07772@redhat.com>
In-Reply-To: <e1630046-8889-4452-9f8f-07695ba07772@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 7 Feb 2025 17:16:09 +0100
X-Gm-Features: AWEUYZnF6uEewR9F7JdT3B1cLzxz-kUGRVOwAxRfyR8MegKqDpoCLJWu8Fphkbs
Message-ID: <CADSE00KUeTp_C_kZPS1U2JcLiWuN1s6Se72gtFiN71kXCZx4UA@mail.gmail.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
To: David Hildenbrand <david@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Dan Williams <dan.j.williams@intel.com>, Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net, 
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, 
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, 
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, 
	peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, 
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>, 
	German Maglione <gmaglione@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gA0F7ciGkOs-xEJarfiad543uqBlzdCAn_GJmbrfJ3U_1738944982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_081628_209816_05F2B233 
X-CRM114-Status: GOOD (  23.11  )
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

On Thu, Feb 6, 2025 at 7:22=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 06.02.25 15:59, Albert Esteve wrote:
> > Hi!
> >
> > On Thu, Feb 6, 2025 at 3:30=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat=
.com> wrote:
> >>
> >> On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> >>> And then there are challenges at QEMU level. virtiofsd needs addition=
al
> >>> vhost-user commands to implement DAX and these never went upstream in
> >>> QEMU. I hope these challenges are sorted at some point of time.
> >>
> >> Albert Esteve has been working on QEMU support:
> >> https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@red=
hat.com/
> >>
> >> He has a viable solution. I think the remaining issue is how to best
> >> structure the memory regions. The reason for slow progress is not
> >> because it can't be done, it's probably just because this is a
> >> background task.
> >
> > It is partially that, indeed. But what has me blocked for now on postin=
g the
> > next version is that I was reworking a bit the MMAP strategy.
> > Following David comments, I am relying more on RAMBlocks and
> > subregions for mmaps. But this turned out more difficult than anticipat=
ed.
>
> Yeah, if that turns out to be too painful, we could start with the
> previous approach and work on that later. I also did not expect that to
> become that complicated.

Thanks. I'd like to do it properly, so I think will try a bit more to get i=
t
to work. Maybe another week. If I do not manage, I may do
what you suggested (I'll align with you first) to move the patch forward.

That said, if I end up doing that, I will definitively revisit it later.

BR,
Albert.

>
> --
> Cheers,
>
> David / dhildenb
>


