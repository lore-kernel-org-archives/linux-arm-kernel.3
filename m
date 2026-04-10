Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1F4F36B97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 01:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cq9xARfeF9XGkAqalvHhZXwwjflN1rJMKAnIVo/q3L8=; b=PG/TrnMO0M2D08idqa3Bwi+xiZ
	x4s1DY6aVRtKEOvK3Z4Z7kfLnbzYmgU6iOIAb3des6zVvpepjwx0TrzVBdfr7jIHjCjJyLQtBq6cF
	Szpmfq3QHV5VSEh5RQ/YEg3/VkGbovE/iLnN6RgmRHRRaEYGnAsMGFIvJmx1W4koRA1AOAA7H8/ff
	Zx9weWg7DmpO7RWAE7BCcDfdJQeFOlrCfH71ubD4JLVNecQW3zG6Er9xdafd4Mm1FuA4xK2Xt4zbU
	9R23KobXAIftpcNnPzb+ZQi0z2Vb0dBbbLF9TeZUXTdbTqetPpQHjFfc/2NcuMZi9rAcdjqC4u7z5
	qH/mf4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB0HB-0000000BOQG-2GxJ;
	Fri, 10 Apr 2026 01:03:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB0H9-0000000BOPs-46m3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 01:03:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DB6360125
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 01:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B03C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775782990;
	bh=cq9xARfeF9XGkAqalvHhZXwwjflN1rJMKAnIVo/q3L8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=umZKVLJeHAWomPhY/u+0rzmeH0iD0P4hizcBUf4V8bXHcPdSpmwTvJCwHxOFomJ2S
	 RoKIPHb6Vo7Yq7M/rLaeyHZI6QbbdzQIOy9LzoehbNaQAOh3UdKb5qyNqH8t8J3Sif
	 aieMmw+UDVLko88RHxIpTX4FWHRrKWGXhZTYEEUP/KtOoshkau9c/RQVnigXolUm11
	 47J1u4Y3Ov9qToOgZkKM1YDSt6HQ7q3l9W7uAOekLtRf9lokB/W9cDRVl5l4fegyPq
	 usyDjQ6vPiib1pwW/hsOr3ldfas7egZOnkRjayQyQJ5lz/qEWLMKSYLLduzugf1Q31
	 ckCnho9CDmccA==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d736211595so111059885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:03:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXa57XGZYAoWhYFpFL01ph1LfTuDwxp4w7YBsBid6hYQk3hiT3x4t5kKR4jjsmxrc5F4HwOB1Lpydf1CPb5WXOJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxFaq5BEagRXIp9m42yWU3mUSI3cCZjU7z2KHCIOGp3wQ1Xwoci
	/9p6z+wcC+py+7RmGbfznjPo6cbC0I1t3Gl8UAPJs4Tbb71OGAaDFHRkT0i+bHhl2ZRJZBYcLwz
	omJJRZzeyi/0LNmPcFmuAFMRUpWsnPzE=
X-Received: by 2002:a05:6214:448b:b0:89f:2fa:a9b6 with SMTP id
 6a1803df08f44-8ac8620d89fmr18755566d6.37.1775782989537; Thu, 09 Apr 2026
 18:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-6-baohua@kernel.org>
 <c54e12b0-1a35-48e1-b243-991de246a8ca@arm.com> <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
 <add9XGTYL9sYilqO@milan>
In-Reply-To: <add9XGTYL9sYilqO@milan>
From: Barry Song <baohua@kernel.org>
Date: Fri, 10 Apr 2026 09:02:57 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xcCjDdFXrbhh1bJW2xT0_mx8T43yNHWCahZ3fBBqU5CQ@mail.gmail.com>
X-Gm-Features: AQROBzAl6bUdOwvzhgIdvmf429K8nFo46OcgggBCXMjaLU8ZacYb_QdEKvUDvYc
Message-ID: <CAGsJ_4xcCjDdFXrbhh1bJW2xT0_mx8T43yNHWCahZ3fBBqU5CQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	anshuman.khandual@arm.com, ryan.roberts@arm.com, ajd@linux.ibm.com, 
	rppt@kernel.org, david@kernel.org, Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 9, 2026 at 6:20=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com> =
wrote:
[...]
> >
> It would be good if you could combine the work together with Jain.
>

Sure, thanks! After discussing with Dev Jain, we=E2=80=99ll also
support non-compound pages in the next version.

> --
> Uladzislau Rezki

