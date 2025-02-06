Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA24C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U74SGZiAIGmMlazRLhrpYiZ/iTjbN0drFn9h+a0WXAw=; b=RCo3r1/oBBgmuwGI1doo4ur1sM
	pfyMJRxNWhiLVsbLKRfH+/nSkGFw+kewYUeUCYhD4/YQgrW4PMunlEG8IoECAAtbtI7jnzLA0c0mX
	imTM6NkSTfJz0yRd+GfaqOtbRUUajU5IXRsRqYGQsCNC+hOSEvNeWMtHqTxIME5EzkJux7MlwOtKg
	0nGDVWvIakEkO1sZkufwysl1BJ2CO7TFPQlBlsDmkAxz88bhGgAec0PpPBw8bGdt1/REez8NOIcxq
	p/pXOqlAi8TaFREC/rsj4x49M2+cfiXIe8bs6qp2bbXiS3XTyP7d+EGqKuEoz94MzvNGQcXiPI8GE
	/jiyLWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3OR-00000006fZI-0Hfe;
	Thu, 06 Feb 2025 15:02:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3N2-00000006fIP-00of
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738854045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U74SGZiAIGmMlazRLhrpYiZ/iTjbN0drFn9h+a0WXAw=;
	b=QpNApFv05AZ8vtoqPLtBvvl9uTwpPo38ZWdAq0FlVr43iIC4V/FFRanKsqbTyUJX1ygEvk
	xwZa5Y6aISSLa7GlLBg+325BUWdkamO1fjC4T7/guV9wWIdHfW+LO5JS1Pnjo0ktZOizx1
	m3zW/yVTNkJYCG99QkxKONl2euY4ReM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-Qvd_UocsOS-Js63-ko2vDw-1; Thu, 06 Feb 2025 09:59:16 -0500
X-MC-Unique: Qvd_UocsOS-Js63-ko2vDw-1
X-Mimecast-MFC-AGG-ID: Qvd_UocsOS-Js63-ko2vDw
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f780a3d6e5so2215269a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853955; x=1739458755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U74SGZiAIGmMlazRLhrpYiZ/iTjbN0drFn9h+a0WXAw=;
        b=w1IlsKAn2SDQBi4ztBNVvv9SVxtegQbMH02lDbxHErh+xW4N3J4KETpwWrBoI6BZ9S
         jSwhC29VZn7YjZZAYa+JMibm+ZKLW77eFqWXN/Y+IevuNPkZtPHBozAONDmrt8dm6yLf
         PN+BbwxMWiIKnFSLf8UlRU6rcBmWmNKs6QArhhQ6I9OJl5F6YtyyADhT94HUSS3brFeX
         irPNBRsuv1uU4O7Xj276CWwBvfdKrzAfL/tSzlJjczFB7F5t9RSJ1UVXIzOC1xgwxEaC
         ibFvkmgIwVIH76iH9G9Nzq94eQXavFYrWFG23aTe4sUTh0+xL4VEwsmzpv72DgQrjDGi
         2SfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWagRcenysIRLwZkvaMPFS5H4fPEp0p4lmb4SXxOM6sdnae0c40lY5xxC/2KAyHB2+QH3qSt/7b1O+bQ1DZB1m7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6V06xeQ+eEBNTOiSsJReZaIfrIC926liseg4eteoxix9J4M+o
	dmel0o2vvL3LFRjnP2D2zYrL6kVZ9tNZg5cIY5ZgYQVrhMxuN+wiX1jgCn2bqMJ15kFB8S8atXv
	hUm3MJpyVbqXg7zUs8LvJo6LG9FyHhPYw5/z2fdX1hWPmPuiuPTZUpm6yX5md4rapL7P+qNyJzt
	w4QGhg4xXgrQpeXkArHelJ1O8Jr0vuMQtKI4CVM93uGmlZQes=
X-Gm-Gg: ASbGncsmp6z+jdIs2sw5WzJOy+No3F+g2b7y60mzU3MAelZtboqC0vd9OWlr5KeV8gh
	WeddIACxwHT9xRtMLl0vaHJl3YWzR/pPImR4ucIriuZPQ9I9b7z226PfhauqEG4X3
X-Received: by 2002:a17:90b:2786:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2f9e082f33emr11110481a91.30.1738853955572;
        Thu, 06 Feb 2025 06:59:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWpQlGfjL4+bcsd9CXoOi/pDbHuiuuwkJUWCLm8Y4KSWCpEnRWVj/utErs2ioiglleYEOHWPatBsG9+Rhw180=
X-Received: by 2002:a17:90b:2786:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-2f9e082f33emr11110445a91.30.1738853955312; Thu, 06 Feb 2025
 06:59:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com> <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com> <20250206143032.GA400591@fedora>
In-Reply-To: <20250206143032.GA400591@fedora>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 6 Feb 2025 15:59:03 +0100
X-Gm-Features: AWEUYZm-M5VdAvcj3hSDqRtWWsY2KSl-UpKtCd6mALNvZQI6X9XPfCW9uUgmKYc
Message-ID: <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dan Williams <dan.j.williams@intel.com>, 
	Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	alison.schofield@intel.com, lina@asahilina.net, zhang.lyra@gmail.com, 
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, dave.jiang@intel.com, 
	logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, 
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, 
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, 
	david@redhat.com, peterx@redhat.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com, 
	hch@lst.de, david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>, 
	German Maglione <gmaglione@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: okItCgu_u07oHkDoevm41mXwbGNdLzEA6_5v847leRY_1738853956
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_070048_105947_28E55E0F 
X-CRM114-Status: GOOD (  17.34  )
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

Hi!

On Thu, Feb 6, 2025 at 3:30=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
>
> On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> > And then there are challenges at QEMU level. virtiofsd needs additional
> > vhost-user commands to implement DAX and these never went upstream in
> > QEMU. I hope these challenges are sorted at some point of time.
>
> Albert Esteve has been working on QEMU support:
> https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@redhat=
.com/
>
> He has a viable solution. I think the remaining issue is how to best
> structure the memory regions. The reason for slow progress is not
> because it can't be done, it's probably just because this is a
> background task.

It is partially that, indeed. But what has me blocked for now on posting th=
e
next version is that I was reworking a bit the MMAP strategy.
Following David comments, I am relying more on RAMBlocks and
subregions for mmaps. But this turned out more difficult than anticipated.

I hope I can make it work this month and then post the next version.
If there are no major blockers/reworks, further iterations on the
patch shall go smoother.

I have a separate patch for the vhost-user spec which could
iterate faster, if that'd help.

BR,
Albert.

>
> Please discuss with Albert if QEMU support is urgent.
>
> Stefan


