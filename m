Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB7FC5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGVlK1rqoRCdYtqSwH3QAU+C34HZwUZucnX4J/0Qdok=; b=mTTeqp5mPWs7mcwhO2O4Ax07ob
	RZcDAmWnEZcjg39W4uDskyk3/DvpTLtBI61NVdhgmSFvB6mFz0JLecyzd9IFMviOMhSUpVl3NbGDt
	hSwkMu4cPrU7NcPr3XMTtOxP2JQiHyklCHmeHzyx6FtJlkALqmP/GU5R6qAEGYzAW48XPyDAquobT
	Udt4gsWo5oLHKyB++OsD/BTmy3xIZ8Mjl7HBXVLqhGaBpF8yd6jXmk6ZjH0TdVy0pyOZHR5az16yd
	91C6OJL819r0wV1UnSI1kd45heicK6rC9+ja/570tSMZQLeX2Ay9v9JXZBnFgD5pU5mSRmgJFlPhw
	jo2TPDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSg-0000000Gu1v-2YpJ;
	Mon, 24 Aug 2026 15:19:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSX-0000000GtwN-3QQ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:19:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so19371895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787584776; x=1788189576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGVlK1rqoRCdYtqSwH3QAU+C34HZwUZucnX4J/0Qdok=;
        b=Jo6EWcz38gvAkJxLG0jGxJCA4VEOfADB7LpD31KGldwWFWsFvi9ibAp0YaIVgiMV+X
         JP3dnRx0jvyzCufsRxHdVOOFIf8b8qYbWVWFP3AK/JfJjTSF71fvcjfxvqBmKo5Tw7if
         qivAYBo3KkGaLCwpmFtq3rvaqW2uSk1HUy2AU04AywLlas5riwXdcGsOSKOysf9n4W0o
         bzXJ6YNchdkfIiHT3rvX6FTb76wATUtJjcOU/nNBcRmsTDzrA1XZ0nWAw8Ws2ZcWJCLP
         t+7MqqWfbyOG41+/YjI7ufeulJ92hrLu1sXazkN9WhLv7NQbaPrsbZHtHpkqSGxaz2pc
         bkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584776; x=1788189576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGVlK1rqoRCdYtqSwH3QAU+C34HZwUZucnX4J/0Qdok=;
        b=oJ//2q68QPN2o6Jjovduikuhh/BiQCde29B50L7hq09ERLA+53Jb2c8Ye/4sqLn5ri
         YlOmFNgMqiH3FlysCsxCGdl2ZEml2gBZeJLUhh1gflRc1ffvdXWYdnWc6DmyX3uDcNEC
         rGu8LSlOYn9Fjls6v/Ab725uJyIXROjl9HXD0QT+6dC9Erl2BCEM630y/hk0czndkICZ
         INGoqEpVMfyDuuz3elpnHzEXmfU+TvXBRp1hIylSEjxqdALsPxJjP577W9V9RcBpk5p6
         +PDjeGxtJhSbPrmCoTabBVghVcZfD0MLAA7rixbcAAQGHP6T5yyxTnt744Ci3G7cIexh
         n2tQ==
X-Forwarded-Encrypted: i=1; AHgh+RphwepASrQt56nk8R3l19btYa/rBMglwj0AG48LabHFYAZUTcK89OrkuFJS/0CeuwEROxNBPD6JTVYtKINHqD+i@lists.infradead.org
X-Gm-Message-State: AFuF++k6yM2jsQHQiqNfruIqRwTmPf0pnTxrt/fZqkIShbvtnc25O2EY
	gFQOBEexugFc2FIROQA8aLYIvxuiXaQoJLeAGx1rMMUIQKSkHn+XYrDm78bPBEFykQ==
X-Gm-Gg: AR+sD12A/i2Uva6XNyQerDyOplaDH/Bi43L/hpvzZDt/TvAjngix6R0D2aQ2bX3rRrp
	/NFoiCUHtv71vLsDXx4RqCs5JIyN+qAW9BaRlWe4nahNIBk9oFRrvgBqHmsMY85yVK4Y+Br8mm8
	tdAIklyi1xryP758lKKNeb3Xy0kKBRKy3BAj5QuERizWHVx7Whzt8TPz/9Jn1XKEMvtjflJSeLm
	eHDz2SktR72SNLqJSb4+FyHfHStW4j8jU3vrnxieHIH99/EnaB2vCnWIK6lVY9lVg1i5f4iKvtB
	BhtopD+Ratc9xFklzEucp72OEeJLseq08d1LTd5iRm6rL7hvFEwtaFrmTi+9eOJXziGi0M/rUsd
	RArbitdHht2upP6shuH5iqsfciq4FsbJHdF5zUCXSQR67dLsQgCZv1pVlCMf1LpV3DiG4NeJfBN
	ZynMhAGl1Czau2U+v8AMqik0pqhXBPXPQiurhcnbYNJtKeGt47H2t04wIs1l7hEzL03fi5dE03l
	yATcmK5nKiHITbJciaxPJnFM4t4+OQZ
X-Received: by 2002:a05:600c:4687:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-499b82fdac4mr337202065e9.2.1787584775321;
        Mon, 24 Aug 2026 08:19:35 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c7ccac8csm68380715e9.3.2026.08.24.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:19:34 -0700 (PDT)
Date: Mon, 24 Aug 2026 16:19:31 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v4 04/17] KVM: arm64: Add a heap allocator for the pKVM
 hyp
Message-ID: <aoxhA91kHwy7P3re@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-5-vdonnefort@google.com>
 <CA+EHjTw9KcKgGDgD=khN8qGPgJAe9POhu1uLby9abDbogwu5sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw9KcKgGDgD=khN8qGPgJAe9POhu1uLby9abDbogwu5sA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_081937_877795_D7C187EB 
X-CRM114-Status: GOOD (  20.15  )
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

On Tue, Aug 18, 2026 at 03:22:55PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 31 Jul 2026 at 15:36, 'Vincent Donnefort' via kernel-team
> <kernel-team@android.com> wrote:
> ...
> > +static int hyp_allocator_destroy_chunk(struct hyp_allocator *allocator,
> > +                                      struct chunk_hdr *prev,
> > +                                      struct chunk_hdr *chunk)
> > +{
> > +       struct chunk_hdr *next;
> > +
> > +       next = prev ? chunk_get_next(chunk) : NULL;
> > +       if (!hyp_allocator_can_destroy_chunk(allocator, prev, next, chunk))
> > +               return -EINVAL;
> > +
> > +       /* Last chunk in the allocator */
> > +       if (!prev) {
> > +               allocator->first_unmapped = chunk_unmapped(chunk);
> > +               allocator->head = allocator->tail = NULL;
> > +               return 0;
> > +       }
> 
> hyp_allocator_destroy_chunk() has only two callers, both in
> hyp_allocator_free(), and both pass a non-NULL prev. So this !prev
> branch cannot be reached, and nor can the matching "if (!prev) return
> true;" in hyp_allocator_can_destroy_chunk() or the false arm of "next
> = prev ? chunk_get_next(chunk) : NULL".
> 
> The empty-allocator reset it looks like it is handling already happens
> in hyp_allocator_reclaim_chunk(), in the addr == allocator->start
> case. Could these be dropped?

Ha yes, correct, that's leftover of the Android version. I can then remove that
allocator argument in hyp_allocator_can_destroy_chunk().

> 
> With that:
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

