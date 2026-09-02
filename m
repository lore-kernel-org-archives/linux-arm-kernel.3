Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D276DC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQTVimqqf+p1p2NtJSlLzOSP0qFj/dJU9F0ai9FYCBY=; b=WFj9PGJWWbCixqhY4/BHpcIBPY
	OzKSuCvdcKRqR3UYLa3e+HfyOcDwUPDIo33sfPjoUh5QnNWQWrwG8gn4Es/8riobTmmJ02L5ZoalN
	RwnHYyQqodLJcxgub6AtdI2kQB3KFLmALJcRWfhIHhGogTBrPKG8n2jhibp4/qWq8RaHIHbUuQXUe
	8/G+m+VlfLW8bSYvzbc00KB4AWumKuSnr/SmAQYpVyDe0aa5l4Roy7BHq+pprD9a+dRDjF5J0i7fd
	gP6tRM0RK0Xp9QlFKlKMEuEkKKdAjDz0bImMJzZ2CWDcWLMtvui3SPfHfA/NN2jcU3LnqiyneObgs
	Pfg+jFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oSH-0000000FONU-3zgy;
	Wed, 02 Sep 2026 17:08:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oSG-0000000FOMJ-1HBC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:08:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so928150f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788368934; x=1788973734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PQTVimqqf+p1p2NtJSlLzOSP0qFj/dJU9F0ai9FYCBY=;
        b=Cdb97e4wChMe2LpzoZPb4frGBZh+SoHdYvt580YR4SERIi/5Ej65ebW/yIdWFePYqN
         YpAvILErl1j4INFlSO62p/wo1ycwY+INXX1z8fIfSAT2osS8NA4TAvJ+nzX7a30KCmld
         iuaaR0eGd9fxUdpcnEXo7l0BY2bzEiqeZBw0g7FyK1og88YWC03jWDbzh6J/piBBOpN4
         VMsQJ6i8oWDlatIFsbY2bd2QAKuwpUtLGsyhAiCUV6Rm7ayaE7fPh5zQGv7D+h+ZJZDy
         7sflhnKhgF6v8fmJ7S8SeipnGGmKvfVrYLSYARcrJRtJDQRRIvXFxAaxxfiLCvEGi4XV
         nfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368934; x=1788973734;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQTVimqqf+p1p2NtJSlLzOSP0qFj/dJU9F0ai9FYCBY=;
        b=Xf2aMGECOKsv34kYzhQqItRR4IZEGgxKARzSRNXihE05HpnES7U1gXQj3l9ldd65qu
         fyjN1phLjDu0AAhAkCHi4pzUlVgz2Psn0xbtMjWErCjTVVw2coBOnYtHQHX/bw5FjHbt
         TXKKiVn1lmIOA/NFdSmLCuiayTUhrzktGhWxYl5nI0QM/a90OQL57F4z+6xsOyaYLw1V
         q4sT4KhpUHLm4INnOxLbO5ii6GNRzewQEZKmwbCEiL6afkfoqqomwQOsu2WXVVgM3ulE
         pysNQawb5nR0JKBToYM6RZ+YTG1qgHuWtrZqeQC+H71VG/micYjamBNzmFdog6oQLjYU
         A/9Q==
X-Forwarded-Encrypted: i=1; AKwUvByyUITEypMhdTP/nc88p2MdioPyvF5FS5GIiiPoaJNt/oV7/5CQN95LIipo0MbMgHiewG8ZulWI9fbH6pWWxcp0@lists.infradead.org
X-Gm-Message-State: AFuF++lza3rMwUYzCdC99VCT2aRd7OhSb1/Qs7lum8TqBDJ8Y0Hofm+F
	Zh0w2HVJO7KPwXgLEYN4vUTEqBnZtqDL0KQsLdfPHRFWP/Eu8ZMEp5HI
X-Gm-Gg: AYBFou0g2zKaUKtE2Kcx2RXeBrvTG5DfVJvXueIKYSx4VRcrjcqKJXznJebW1RvJfpZ
	NuEmTXUmyo7EsgWD60waJ7knPuaV3yWYGtOV35AUhRJdx4vis1GpFg8wHHhjEj88JBi6oeENgfy
	KL5ifkYb9P9l77q0n+yFcSKAeXxFnhYQYpTYsnNHnsYW4LcfhyW1Puhxu/6tKHBOGew9fYYvKwc
	weqJi7ub9OFLYfggKQ8ndB5D+GkbxASh2+Ok0iJCho4uBAtHJVcXlbSqbsqbwiHPnUOu0NDfvfF
	qV1O3p5piX2RRBN5rDjltA4zw68YWJSrA7G24WdOJJ4dAMXE4fnL+SZsiwSLB9gZy8ODO5nO6wq
	qC12m+JlPf/l2+B0GyfgE0/vNpg0aSs/U6e4CR/eVmUTVqftTTnK6n742b9hEzkBOpV2LcV/HQ5
	IMrHA8fiRe0s4JjQWTag0cMrdJWjgn3GqO/rTO022JS78ySpvQ71bCixT4rDPof+P7jyNyv8oIE
	Wman59M1s1Uf45xYXDCyfxRUiAXgwqJqFEMeTdAV32goPaJrIRQ4nZ3xKFyJwgVU3VJEBX/VAoG
	y3JcnvXWJnMoP6Fins6UyQo9lVFUkHi8jgk=
X-Received: by 2002:a05:6000:460f:b0:482:fd9c:5d25 with SMTP id ffacd0b85a97d-484913ba763mr13387018f8f.16.1788368933900;
        Wed, 02 Sep 2026 10:08:53 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-017-232.77.7.pool.telefonica.de. [77.7.17.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cf550sm7547096f8f.37.2026.09.02.10.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:08:53 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:06:56 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <aphV0wtGqn_EJHjB@gmail.com>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_100856_365184_88D4F91B 
X-CRM114-Status: GOOD (  16.43  )
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

On Wed, Sep 02, 2026 at 08:16:36PM +0100, Dev Jain wrote:
> Upon discussing with Ryan I got to know, he was implementing the
> contpte stuff for non-hugetlb user mappings and that basically
> drove a clarification on the semantics of contiguous bit and
> this rule was added.
> 
> If you see currently for non-hugetlb mprotect() we do not flush
> during contpte teardown.
> 
> So if the above reasoning makes sense, I can infact audit and
> remove the flushes in the hugetlb helpers.
> 

Well, that's quite a turn of events! I wasn't aware of R_JQQTC or the
architectural clarification behind contpte_wrprotect_ptes(). 

My QEMU checker was based on the older assumption in commit
410982303772 and the existing hugetlb comments, so it treated a
clear and remake without an intermediate TLBI as a violation. 

So... Please consider this patch withdrawn.

It's good that this may have uncovered an opportunity to remove
the flushes in the hugetlb helpers.

Thanks,
Karl

