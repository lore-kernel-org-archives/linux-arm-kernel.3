Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337D0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z+2hoZtpw/juCIwoax/ETRjvK9I1r7BSvf+QwuO3A8=; b=kTKKQwjowYYeX3e8XzpaZ4Yd8C
	VelzRdBsfHBlyC5XKe5jE961JsfId72Jlu/4Q09feURCfjBvMT3rIFQePEKh/u1eTnaZQm/g9Cra2
	eABpRO2txhTC+JXfspSdrwL4uC0hJB8h9Uc5JKDbTQBOh5ojMi2Oy0HQYyMM0yuT7b0h7zStsPV5W
	8jWzHkoEyVmsr36bWcuSK4ijD0FoI6E0NTijEzAcdNTVnGRdRggocg+SnHWdkAl+AjtgJmLN+4g+E
	2UDnUxWdgOrXX5eKpkdGZv1I/rsxzqMCV4niMf5m6w8XTaf6MztUaurOyW0SVENzxmpYPp+/WqMJP
	EAALF6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgij8-0000000CVHv-2X1E;
	Mon, 06 Jul 2026 12:47:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgij6-0000000CVHa-0uRu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 12:47:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso3163667f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783342026; x=1783946826; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Z+2hoZtpw/juCIwoax/ETRjvK9I1r7BSvf+QwuO3A8=;
        b=fAbU+9nzP4vZYqo0nlKd/Mz9b0E097f3y6z0lyYJDpmJILa9I3IVo+qsi8CJ350T/+
         7DqLU2gzDbxgNy0o42Fe9KCVwxeHhgS6x8C3r2jZSW9EMB0ZltkXVfAPCt+WjRhAEh3k
         IsRI8vvcSwxnBBDG0kypxHeGl138CiMMBeMLZjcCNTbj5byWYu66hUVVfBYNgO5re3MM
         ZpByKrCFCn4oFWiIapOwNr9GHCI/34DgAbrYVY8KcOuu7WnEwnvIhSgMHU4BhslXKT5N
         WWOSdDNOnEEWPORxQzk1AFzz2+VXHa5T5mr/dF3KJ/BHQpe+DoqlRz+HWn4CDlUGDaZs
         sorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342026; x=1783946826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Z+2hoZtpw/juCIwoax/ETRjvK9I1r7BSvf+QwuO3A8=;
        b=FWuMr11ZSbgUZX5WcER8pXY2GnJEVkpVqSyFpyeBtOq1kUlNXQfWp9HE2L8CH/nM2C
         S3RU+RfU0hFyBrCbF4q9LLDXORdJXN0Mo+yrxRAR2XGFvx1MtvWmv1BnG3PtiAo5IEhq
         Hwu2XwRVtYTzCiOSkRdJwPI8nmuy+s8rZlHBZSWKi75SMqG/ePbkBOX4hCMUDLSHreKb
         QBiLVcnYxd9GItZ34ilmgxgoEJNOKLAKv+MdPOYWO3YhHJvQ7kAyn+8YP8A8DFzdpP0j
         8g13LdUNrt9E215DJ2j07ie/0vaPsseh51mpq2hvdGicrTEzs76LRux115LgMMlxZTvT
         885A==
X-Forwarded-Encrypted: i=1; AHgh+Rqt7lzGTXPIROgj3eMd2lUdN1b7bKyYuX/O8lXjyQkKfq+21S08Ll+YB+YvQbfOFN8SbFVw6FxKl/BNQ3vcP6IS@lists.infradead.org
X-Gm-Message-State: AOJu0YyP9fgYThvfbxR164FRshqLTVFk2CFaciba8z2QeYpJYOeM3FW3
	8Wp6JcF2IVlIRMgU/PMrY3XngEbxoHUtbA4cRgduStw/iaTQw7kfgB/vQ3+qupQcnA==
X-Gm-Gg: AfdE7cmZKYdGCHcCdyQfah9W/RgKuC7og9E3fcvUaVlPbxZZ4OTivE8h38B9U8fIakB
	APnnFxTg2EXE7wzVBWZFCEr82ipMNAxyI5tOGKz+nzsb4j8OrYfIu/2WsH4vN36jP1H5+xn3cmC
	45ePfYUJrBk/lUeCeLKd6DH9dsUzhXY3AG7FTxD24HPwDqtLiSNAZha2Vcd+VkUhqzfqUSRJFGP
	p1WX4l+ht+JZMg9GSeJ63LilvoVPuzNA2O5HXfB8JtKbPU+kzrdZed4/YnjxaEmR2fDWtiDscnh
	hbnxl8AhY6pVw+AiFGvlNPnM6HwV2UKfhRg5KfNK1aDEHD/j3EHGzjK/7cShTJTdDCxBPLBVA7q
	+wozlC5XMsr1vcOKx/KRW6UwT/9d8qhiHiIWX84ChylnEe5prBcds3o80EVWs8fFoeT47tknNWR
	cSYdHr7CIDOVTgJG1QFpnz+jf+7ytbJGL0IBKChFdN8Z92X9Q=
X-Received: by 2002:a05:6000:2905:b0:477:2e75:522c with SMTP id ffacd0b85a97d-47aabe30701mr12311138f8f.28.1783342025703;
        Mon, 06 Jul 2026 05:47:05 -0700 (PDT)
Received: from google.com (97.113.76.34.bc.googleusercontent.com. [34.76.113.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm22530706f8f.30.2026.07.06.05.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:47:05 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:47:02 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>, owner-linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Message-ID: <akujxlkkeS_TJ4ri@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
 <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
 <aiuyoy8Kmr9yU4GM@kernel.org>
 <ajK6w3YTFpVaUl3v@google.com>
 <akuS8uhjPBhI5mzZ@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akuS8uhjPBhI5mzZ@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_054708_273293_928BC434 
X-CRM114-Status: GOOD (  14.53  )
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

On Mon, Jul 06, 2026 at 02:35:14PM +0300, Mike Rapoport wrote:
>Hi Adrian,
>
>On Wed, Jun 17, 2026 at 03:18:27PM +0000, Adrian Barnaś wrote:
>>
>> Following your suggestion, I can put together a preparatory patch series to
>> refactor the set_direct_map_* APIs to accept a nr_pages parameter. This
>> refactoring would also allow us to drop the redundant set_area_direct_map
>> helper. I could then rebase the rox_cache series on top of that.
>
>I've been looking at something related and I was already half way through
>adding numpages to set_direct_map when I remembered this conversation :)
>
>Here's what I have for now:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=direct-map/v0
>
                                                                            
I did roughly the same on my local tree.                                   
                                                                            
>This is only lightly build tested for arm64 and x86.                      
>                                                                          
>As this is WIP, things may change there, but I hope it can save you some  
>time with your arm64 ROX cache work.                                   

I will fetch your commits and I will keep an eye on your tree if anything  
changes.                                                                   

Thanks,
Adrian                                                                                           

