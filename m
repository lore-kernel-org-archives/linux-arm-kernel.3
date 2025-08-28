Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB31C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFlTc2o50xP7q9jUUn86Cat3HkUhlqoaXfvof6seHm8=; b=v87q2+6PHa69k27/s7vyuCJ6/8
	FTEtjpQaTz1IoeA1XXZ43Gxql1bscF3NyATmAysqjTP+EzLCQ1aC3EYCr0syGKeCrO9ulGxE/27Bh
	WRZmEBzKFdlEeA7ejlDCObW9UQGrIg7ZzLt4+vtWvbW7LheplDsf+2zetb3KOFs2mfFpK5h/+z0kh
	dmI8jEZdHNZYhuzahTCDd2Jb7ajOO5zh1fZlif/rT9eJGz37JtgwAOuSclmlr8f11MAEW2HpjLpA0
	D8oy9b0WX7ji9rgUGLBxpE7zgsUY8nkXVCYHieN/5Z3kExeAQFtmMypbhn+tIOSbldDqu2cleHJyi
	bFRVBxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYzL-00000000ygQ-1ttJ;
	Thu, 28 Aug 2025 09:32:11 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXq5-00000000leI-3r7K;
	Thu, 28 Aug 2025 08:18:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb72d51dcso90391166b.0;
        Thu, 28 Aug 2025 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756369112; x=1756973912; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFlTc2o50xP7q9jUUn86Cat3HkUhlqoaXfvof6seHm8=;
        b=EsIkFudhbLBC+F5SEjK0mqrPCNb/1KDVWEfZSCXXG0basvcPt3CS4K6i2sBsJPSrtB
         9+4r4fyxx93e7LLUFAx99aF+oKEimzmCrF4RfkDowL42Z1avWxDundPkj0EBGvgrQkpT
         Q87PKToP/r7CgOfyDdGOPctCRRbdQ5ll4xfgbPfsFYeHV9F/j10cqBu4uwaaP3Yv9yFK
         Kjt8miw946sWZZE9iKs336dzzSCHVdK/73xpDU5anvm9LmncS15PfQT5CUcz6liZYM2s
         v2Oqu4+clnaLxbNL1J/RaiLMKvGfpUCOxVcwx6ycjjHRCNTSew2NKWBK0Z8ViN16oJTP
         lqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756369112; x=1756973912;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFlTc2o50xP7q9jUUn86Cat3HkUhlqoaXfvof6seHm8=;
        b=lm6uAxdFkYmAq44Oc+rzzA1PrDxI2h/K7kWWMREePSD17fDhLElxV0UaYJvvutfVEK
         0a7XQI/WqjIL0FpbSnuGQTLnBfXmNJUC9zty3EoOpg9wMORr/Hg3X1p/QlTTNu7mOU63
         fjnrmdVNMXXZ864YZsHCx52CW2+LNcbdGT9hUvs3xp9/ioZYiY6jfApFbBzj3eDc9P3y
         i7X6fOSHColsvQky8VyEUcvJvHarmQfx8+0CrIVxqBIjQPC0wffnM53kndA5WmwRl16F
         ydf1lltfyt3eyHK+H2S3kr/4IHll38qYeV3aPEJ4mWxszu0QN+OrK/ShZcrKQV4dIqtR
         xjTg==
X-Forwarded-Encrypted: i=1; AJvYcCU7i4vs+bcb+IAPCB412gZrJcbWfIULrUk5k4VYe/TMcilWr6mggjQMDoVqGMswkrgpuxCiJD80rySV8JE=@lists.infradead.org, AJvYcCU9SJoxdg9hRr86lNjDt3vjoaOFvklWNVSawfhR+L4fNZr0DkY7cnBM9QlUl5UfhBev+6DJsxAldH92lPzLyRH4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+OsMhwZGmZMTfBeqaWeNYK8JvLb2+1Nt/ZTXgmXDz+3+m5ZYv
	UzZC2/pW4mUYXhzUSs29nEgQIv26U53uz1wM89ytQ9uUWF28fvcgoV4l
X-Gm-Gg: ASbGncurmpPxGP9sCSCWvVt71FsZkRfzofZuMBpQORNjWU05+FT1Ji/q+EQ2K1gT7z6
	OS41uuoaCnm797jRGyzO0MN6p/jIyXSYYc5GWktS6RKEIVr1pBNbH0Kljzgdm2jqe0B6lgT25fR
	qwcKzphaWsdnnWvXzmMZH3fwMunpMrTw4C+3kqXnuCBNAKcdB+tORz4996Mw8r9NNZMjTT1UlRF
	i7f3waR5W0Fa79SejzsDIY+IWCfeyOqfjpGlwmLkbdZrasdXG5WHWBZNwWFvNhHjqQWiY3cfZNp
	DqoT70qUxwrrpH79HuvR95lyqEyOUlpclXCdqnd0PyLkA5MlF7yqDR54dzkWT/awPnEwCNlD5yk
	2K3N7m9R3gQQmz9DNU+pCRdG8gYg1ydmLabd8
X-Google-Smtp-Source: AGHT+IFrqyfe7g2Zl+sLgEHASy1+ip6WVy4aEpiIRxktJ8PetprRYIIgoW+xQR/WhySTtvxcEvhJTw==
X-Received: by 2002:a17:907:1c27:b0:afe:b878:a164 with SMTP id a640c23a62f3a-afeb878abecmr620398166b.50.1756369112172;
        Thu, 28 Aug 2025 01:18:32 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe80daceb5sm811531866b.68.2025.08.28.01.18.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Aug 2025 01:18:31 -0700 (PDT)
Date: Thu, 28 Aug 2025 08:18:31 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>, Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 12/36] mm: simplify folio_page() and folio_page_idx()
Message-ID: <20250828081831.fv4bs77kihwbffdi@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-13-david@redhat.com>
 <20250828074356.3xiuqugokg36yuxw@master>
 <0e1c0fe1-4dd1-46dc-8ce8-a6bf6e4c3e80@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e1c0fe1-4dd1-46dc-8ce8-a6bf6e4c3e80@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_011833_956283_C309BCC7 
X-CRM114-Status: GOOD (  11.57  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 09:46:25AM +0200, David Hildenbrand wrote:
>> 
>> Curious about why it is in page-flags.h. It seems not related to page-flags.
>
>Likely because we have the page_folio() in there as well.
>

Hmm... sorry for this silly question.

>-- 
>Cheers
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

