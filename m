Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBCDCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cv879vejZmMUoFEF8EqJXVB2DS4FZf0fq3v1r5btMdY=; b=TE9uuBGHBH4Rh1TMdvyC5+XkpM
	hmVVsP8PIup2BSWQxuSPd9n4dNcoA5xlEG2GLWL1NGfbPCSYS09Q6XvroU/OKMTdC5PC0eHNrzDG8
	+ncIUfsqP8P1Hs+O8LNZD+UNdH8s3O0eUUkTNDzCptVhheaNAK/XkktOnd7yspVZxCljqnvY4cHrL
	qwssSIJGqB9fQfilvC6D8aIxCUZkaMcrvOLiYZODEa0+DXBO3db7FvqoGB2dtj5cgRPHkjUJzpA9k
	MWM2HF7dDiKbzYVfqG0o5Roc/22WE9xRAYyIuG9jpd0tI4MDy9RjQcEANEppwFdaYwfY9Sh8t8MKn
	SPvhHdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBEZ-00000001DMZ-0GUC;
	Thu, 18 Jun 2026 11:48:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBEW-00000001DMF-3Okr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:48:33 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37c5bd8507cso76836a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781783312; x=1782388112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cv879vejZmMUoFEF8EqJXVB2DS4FZf0fq3v1r5btMdY=;
        b=NCJGL7hLS79nn/CdM8xlkywc2hwbybSGm+2VefrZsO2+yfW7Zq8z7N3CSHyYz3PDeD
         DRQhLfItzhXyabLYnhJwLyNtTSHewSNmJmfVSbTqTYO30XHhj5Ka1EkJqGdOzlw3sed3
         Pe7i31Woz0MCcM3agnyQ5YzBjn0YsC1EOqDw2o8noBVtmYJjPijEQaPLeATd2yX+/gBO
         P2FfQ7B2pr8lTxuJHVor9nOCq1YcpUd7kIMaWZ/L+gJ/jLLYnUDKH/DrfFaKfL4fHkeD
         TRKLKvemGtIAlcH9yYEhycONIvM3Yk20fCKb1ubvNq13NaA8fccVEUHlsnf+TBD8tKc7
         nbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783312; x=1782388112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cv879vejZmMUoFEF8EqJXVB2DS4FZf0fq3v1r5btMdY=;
        b=tJ65ZIpg5stKujXyhBtY///DYryFPuTWPEN1G5bi/vYm2qlH6Fi+piQUPn4eXOJLXB
         yoZJfi6eUCYLrmY1yvvdAyzt5twkowkTn4E4QMbWe0fF1y+U2FE4eOJaRU9P5rjsMQe6
         B9z6KyeAiEbDUJxbG/WjvKKar4YJZhL16axeAREhWrVDpV6p3IbLny2BhBTm13wJiWIj
         wFrKQBSlU5JCZA287nue2Y14T4DCZMrASLBqlApVs/ca/n4nTiMfIVEgRsrV8DGbtX6T
         L4+iK4SI5gqpFHtxU3qG+pgSRqILaqiEIO/CkObCErZPrXSd9231FBfnh+mx9W2oIycM
         K8WA==
X-Forwarded-Encrypted: i=1; AFNElJ+U8cC106uwbEetmF1RnsixYxz5iHA4LKm0xlMPmLCmBRTWOvFt6dbi3bCVOq79X4R1gBhsA99YG0vF4mcUbUSS@lists.infradead.org
X-Gm-Message-State: AOJu0YyBSH2GqeD5GxZXUxQ4nOaemU4czJQaXqhbtqQgGnUG0sW2y5d3
	Q7TyVNBujgpKtTzOhvVrN+ZkMbCAWezsBWs9dr4q4veI1IRqBisaN8BW
X-Gm-Gg: AfdE7ck9y/jirq3JyU3OmekSNTC/SUtBrdJGx21YJAuy1nQwhnLNPinA6IfdwF9sYmf
	mKVw4QqeeBKfCawVc7A/Pd1HCjdpz1AZZ0Eu6dmVPDqf6Qp8ulPFTda3mHfGnBLrsYYJ0HPL1aF
	sUfxlZTs2xCRGq7YOWEI9vUqYQNvfzaPJ8TC/+BIjh6y9cjaeO/OYlFt4lKUKp7OKK64WZvVDDZ
	UY47vN4nI1BY2eKVBlUh2PSbxkcrjPUpVUEQqWSlrdRhuokH2GHoAVGSWgeE3/RO1XLRZ7AowC+
	Aavojgn+CyYU0ZPBiPzo7N54pBVmjtnfmPe5GsTkpCg58VQ9RKHX1FKa7mtxPM/oFSqDeROsW4Q
	QLD/BGR39Czrwf2IEjf64uyVWQ1LINSEtHYJGuNYQLWldpmN1TIASbIB1dR2v/9q4IvJqF++Rdu
	IW0z+4B4NGkJ8+wsMCbxOi4EMplTXhh4WzjZFAQBLtjuiI/kCyA2sTVrCZs0mJ5I0uaqGH61cpn
	8j2mBypTPeYDw==
X-Received: by 2002:a17:90b:3850:b0:35f:bf50:b4b6 with SMTP id 98e67ed59e1d1-37c9daa1e81mr4257520a91.1.1781783311747;
        Thu, 18 Jun 2026 04:48:31 -0700 (PDT)
Received: from fedora ([188.253.112.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ccafsm17408329a12.2.2026.06.18.04.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:48:31 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: david@kernel.org
Cc: xueyuan.chen21@gmail.com,
	dave.hansen@intel.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Thu, 18 Jun 2026 19:48:22 +0800
Message-ID: <20260618114822.165413-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <acca377c-a308-480c-9840-4edf1a94a3a0@kernel.org>
References: <acca377c-a308-480c-9840-4edf1a94a3a0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_044832_847687_31AFAC71 
X-CRM114-Status: GOOD (  11.33  )
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


On Thu, Jun 18, 2026 at 11:06:41AM +0200, David Hildenbrand (Arm) wrote:

Hi, David

[...]

>>> We're adjusting the directmap, remapping a r/w page to be r/o. I think we should
>>> be very clear about which transition we expect+support.
>>>
>>> Also, I rather hate the "set_memory" naming scheme ... "set_direct_map" is
>>> clearer. Anyhow ...
>>>
>>> Now we are throwing a "arch_make_pages_*" into the mix.
>>>
>>> Should it really contain the "arch"?
>>> Should it really contain the "make" ?
>>>
>>> Why can't we just reuse set_memory_ro and pass address+nr_pages? (highmem check?
>>> Could that be moved in there?)
>>>
>>> Or do we want a "change_direct_map_ro()" / "remap_direct_map_ro" interface?
>>>
>>>
>> 
>> How about naming it int set_direct_map_ro(struct page *page, unsigned nr)?
>
>To distinguish it from "set_memory*" cruft, maybe best to use "remap" or
>"adjust" instead.
>

OK, how about `remap_direct_map_ro`? If no objections, I will add this 
API to `set_memory.h` in the next version.

Thanks, Xueyuan

