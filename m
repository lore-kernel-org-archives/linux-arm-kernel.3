Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79048C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 03:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w2NNoyeUMTe+WJP3vOV4lxBW7OxevPqpMtYOQZ7KSQ=; b=W1nIignVeI/oE8bYCCSKCNRtmm
	xmrfjBnUkRZlwzaoSM8OPJLqim3JMpWW27bZgBMdSBGWIii4KhIc1lGeDSwnxJfcMTeuI2jqeTgc2
	QokHUfJj6Fys+enbagTdjOg3fOV7AmVrJOunIt3m4oCaK8WYYptgq5jp03RoWSCwrgpDEPoXdc+zj
	krA43uSUysVX1xlRTsJeNFPIHkAnYnCiH2m35OzumYDSlsl/GNqMcVmtI8yr9oZPPM1kNG/4aGfnh
	9WaOes0yrKkYmc/QRskW/+eIxFWvj1LKgJv6+zZsK0cYHAXHrEc6OQ8ayH+JNPCY43ZbJdihkl/Yg
	wxlZ4KPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYyU-00000009zHR-19qO;
	Thu, 13 Mar 2025 03:11:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYwp-00000009zBU-1yVf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 03:09:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so908469a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 20:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741835367; x=1742440167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2w2NNoyeUMTe+WJP3vOV4lxBW7OxevPqpMtYOQZ7KSQ=;
        b=d6hx2HQPTJwe2pIByrt4zZw7sMYHp54JIkuVHd5J58l6v2BmmewzGcLv292Cg2sc6j
         ilrDJW0QwIsiO2PH9NMuROHXsvF+FpoU873xLBqOcts4bFPChvO3GOHRab/UYi0sXYcW
         HlnJGAoAolzNLg+SIZTmllH8LDpQk4or0eCv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741835367; x=1742440167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2w2NNoyeUMTe+WJP3vOV4lxBW7OxevPqpMtYOQZ7KSQ=;
        b=Uch8eQZ6BRKapMzPT+z/SYvDKoan3vlIVYi/WFbfV+ztU1ap2jrRUVGY7HBwyxP9k1
         04nc/dg2BAaGXU9iqNw22Fyz7tG2YeC3SrthW11BEuW40nc/3FkUIkSl4EmvCWb+8XbB
         LdF/zXJhdoAmDJ8sP03nIH6/xG1fNweWQ+mMr1XawFRVxOJ+imZPWMOk/bCGc2IIUhEx
         jM7E5j2DKrZinxvRaO5KI8N3Kvc03NYzmC6zL/ztQuKWtjj6nCnARJirYQVz1zb0HZ14
         W3P2PZJV9H/LLdXBM0kF1G6RVFWhPgCliyBcwNZwxMNWbSOguhjcwKa7FbACpFXsGdDf
         TfZw==
X-Forwarded-Encrypted: i=1; AJvYcCXvqieEAhf896SnR4iSYKXTWi0+BZLpHYyxd7syTZPo8bbiA9Rnc51xi56nqJmY1KLgnTfpKbOOYcUioG4mSgFI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl5dji7LjZQMlAbnbqzwME2eg8gCzg/F2NbOMAPqfU168pWn0g
	OklJVLmM3VgtuphYfyD/iosvxwxeScoP/Wpe7wbl662XXR0ZnYD4ILqedLrXVw==
X-Gm-Gg: ASbGnctKCH5v6UNeWyx1DS2cAIQNAJmr08WI9NTyfJkd0sh1rn6zf+5Vy5M6KMOsLOl
	JNNxEayyvf8423fXyOYvkJUfbhV56exhlQ2fENnuZej06amMR110DI2jPRaAu70FRiipQehtRTl
	wCd7bnizXeDLPPTs/u3ZNAD+JZZiqB9Wf0bwBA82PQ4m2J1uxGiHSZ8jof8nnRW4+mkx7l05Jb5
	CE2Z4igZO+gBdxzloHG6x61zLQDr6DWUhBGQ2tg052lVtPRjlHAPQPLIVQxAZp2uX59qqd3V/X+
	DE4YEWWzLX9k9hn7p2m5gTOjijxY9rTcKxfJujbDfJoRUNE=
X-Google-Smtp-Source: AGHT+IGFWO2nTLQPYrZdNHWAUjr4TV9jgOKxZGHY6bU9yRm/owksjVUBeXx/Vr3GQFVpil54DqonnA==
X-Received: by 2002:a17:90b:2f4c:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-300ff10d6d1mr11929540a91.21.1741835366628;
        Wed, 12 Mar 2025 20:09:26 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:ef7a:848f:3b9:98dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301302a8995sm848639a91.1.2025.03.12.20.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 20:09:26 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:09:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Minchan Kim <minchan@kernel.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Jens Axboe <axboe@kernel.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Barry Song <baohua@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Casper Li <casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, 
	Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from
 kswapd
Message-ID: <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <Z9HOavSkFf01K9xh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9HOavSkFf01K9xh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_200927_541217_20ADAEC7 
X-CRM114-Status: GOOD (  19.91  )
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

On (25/03/12 11:11), Minchan Kim wrote:
> On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > This patch series introduces a new mechanism called kcompressd to
> > improve the efficiency of memory reclaiming in the operating system. The
> > main goal is to separate the tasks of page scanning and page compression
> > into distinct processes or threads, thereby reducing the load on the
> > kswapd thread and enhancing overall system performance under high memory
> > pressure conditions.
> > 
> > Problem:
> >  In the current system, the kswapd thread is responsible for both
> >  scanning the LRU pages and compressing pages into the ZRAM. This
> >  combined responsibility can lead to significant performance bottlenecks,
> >  especially under high memory pressure. The kswapd thread becomes a
> >  single point of contention, causing delays in memory reclaiming and
> >  overall system performance degradation.
> 
> Isn't it general problem if backend for swap is slow(but synchronous)?
> I think zram need to support asynchrnous IO(can do introduce multiple
> threads to compress batched pages) and doesn't declare it's
> synchrnous device for the case.

The current conclusion is that kcompressd will sit above zram,
because zram is not the only compressing swap backend we have.

