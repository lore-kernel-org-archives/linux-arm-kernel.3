Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A1B1099B25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahNTPAefQMpYMnBF9fjbq40PKYiHzlPr//dFmraZ1KU=; b=UJq8LWTbYSh7qJ3Y87nizzD0yK
	CGLN9HF+wizQEXMf5yvRbP2SKr1zAFLLuw/jVvAQ0ip2HmIYtzD9VOryYRghvoM6pAxz9qtGZUZdo
	NNM3xtiqZqFLozQdhQcvls6uil8ygDI/tHMUoXk8VZEWE3x9svKs2LXFwNjALzTUUi79TjVZxZWZm
	nL3Cw5QiiybR0Cmk2cdycw/PejAcCePz0PKz54N26x6akjcG1j3UxFQ7h6RU3eOg4eaL/i+JSsp8I
	Y+LvsURJPDm9FRb4KA2nF8Ye7VcAgfXxP+ETSjxFa926L7D9a3flmLD0rGvLtLEgLfeIqrSOw8AYE
	laokYT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dO7-0000000DDan-2gDr;
	Fri, 20 Mar 2026 17:11:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dO5-0000000DDa0-0QQm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:11:54 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so1168815a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1774026712; x=1774631512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahNTPAefQMpYMnBF9fjbq40PKYiHzlPr//dFmraZ1KU=;
        b=tDgzKCnloqVApD1Wq9SGg3g9H6crEW7iCJUDwlBdsuCanY6VTDdlGMgq4/YiWw1axA
         pYyZIwonLVOTtWyPBHbDLmRN6zn4QxJk7mlE6eeNaCluGoeahrdLgpXHrKgQFVD+/mHA
         RaBl24X5JLg3exABtqIxGaHFjfq6beh8If18Jzy8qMyl32iOFOooGcsbO//xjTjczDym
         As17mcYmEvCe2pyUZwVu0UnXrL2KQxwiebtoLbI4X/8rZ4zugnUFSRuHINFXDhInzXQL
         WBEqCH84TlHS2Ig4cKAxVy1d3R/oWwlzkH/8crXb2yCiQumevrcrQsz99avKPivRYser
         L1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026712; x=1774631512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahNTPAefQMpYMnBF9fjbq40PKYiHzlPr//dFmraZ1KU=;
        b=AaDo/9jfAZ95JyQvNaymkM1yqDg2hPCVtoFFZOQaoZ3XNe+xx7fv3psJ4OaB2tiZfY
         HdKlKOj6Vt/8ASFhJzSgcS8OHlgV+/A0BQEfrGa3t2bV6vb3iy+OwJiEMJByVaLHXSe9
         +aqfnIwa+hoWMSfNqcowzZamKCeTVLfUj2DTIxkMhapfkapwypyHko/pi/zqYSeAqaMk
         bQz1AgD8gfjDffNx0HTrYIprL3nuxBVyaPZRbd8Z6iJkDy3vX9tIwULVxN6Z+gR2z6YX
         H3QbJn7bTmQf+13Vyf8ZnlBA+q/ILta3fXu8uw8ZrbIJg+qvV9oGYDV5Cz70u4Eyt4q/
         lOMA==
X-Forwarded-Encrypted: i=1; AJvYcCUKfniTGlQHgEvGkivZVJR558zzTq/TNpoQGNYHRr3CvUlOuQN/TPdKVt2kkYA7d3d+8UKMwi3qSL92jEOOkImx@lists.infradead.org
X-Gm-Message-State: AOJu0YyvKTMMjj3sJHj7vNJvwQsTr92Ugu2nSTAp3WS3KwitOW29jMr7
	76yCdLdNjK7DJ1c20uhTaBOJl/dmDyShpJmKNeYb+d174GbZkiotrSBwvxkxEiYtDos=
X-Gm-Gg: ATEYQzz0/HUuJ6K2E2k7jl86hyxSLCsOESuEABlq49iFTSAsmjuHBsrhPX0szE1k6+6
	Tpf6N5K5BQtP859xN8ri2b+ioaicVAadBiMgpmVpTpg+jO6nn6kev0P1mdyM3bVe2SnhOxTH3ME
	eavc6k8O+bfN+VEMoAX6HzFKTSzDnQsMyXipFQ/tdWTHjVYUsaqx6IVLtOmT1hOjp4qQm/QIMti
	p1ZtN5EtfutcvdYWStMmewew2R0ccOyaM5gvaHFTDVUV48p9M2+U/3/KCGikYIYcVSWgQY+MkTy
	Rilllr5E5B1Q/rpSrMIpNO8uBOC4L/tOErQabPxPCEyQncmHJBaMrSgiiHHTA1OM+iiepKFfKHu
	sK+UAtzbUrSxr/X/9z5/9MSS4dDOTP3A5xqTHuFmpQM5/LCho2RP4rohkoBr79qibIKEY4vejkG
	0A
X-Received: by 2002:a17:90b:5108:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35bd2ce4493mr3220503a91.29.1774026712038;
        Fri, 20 Mar 2026 10:11:52 -0700 (PDT)
Received: from gpc ([2400:8902:e002:ded5:78c1:8178:95c1:6ca3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff7056sm6018617a91.4.2026.03.20.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:11:51 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: david@kernel.org,
	usama.arif@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	jack@suse.cz,
	kees@kernel.org,
	lance.yang@linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	r@hev.cc,
	ryan.roberts@arm.com,
	viro@zeniv.linux.org.uk,
	willy@infradead.org,
	Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	baohua@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	npache@redhat.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH v5] binfmt_elf: Align eligible read-only PT_LOAD segments to PMD_SIZE for THP
Date: Sat, 21 Mar 2026 01:11:14 +0800
Message-ID: <20260320171115.93235-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <024d2480-df23-4c2c-9f2a-1c4a130f71b1@kernel.org>
References: <024d2480-df23-4c2c-9f2a-1c4a130f71b1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_101153_397671_A7B8EE25 
X-CRM114-Status: GOOD (  11.95  )
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

>> Thanks! Also adding Ryan who did the exec_folio_order() work for ARM,
>> and also raised good concerns in [1]
>>
>> The problem is not just alignment for elf, we need to fix more things like
>> mmap heuristics [2] and how unmapped areas are gotten [3].
>
> I agree, ideally, that would all be tackled in one go.

From Usama’s v2 [1], it looks like we may be operating under slightly
different assumptions. His approach seems to key off page cache
characteristics when deciding segment alignment, while my patch is more
about proactively making things THP-friendly so that more code can end
up backed by large mappings. That helps in cases where a segment size is
just over a large mapping boundary.

Maybe what we really need here is to make sure the virtual address is
properly aligned, while avoiding overly aggressive alignment (e.g. capping
it at something like 32M, which is fairly common across architectures).
Beyond that, we can just leave it to THP in “always” mode. THP already has
its own heuristics to decide whether collapsing into large pages makes sense.

It also looks like this approach would work fine with Usama’s cont-pte
mappings. If so, would it make sense to implement [1] along these lines
instead?

[1] https://lore.kernel.org/linux-fsdevel/20260320140315.979307-4-usama.arif@linux.dev

Thanks,
Rui

