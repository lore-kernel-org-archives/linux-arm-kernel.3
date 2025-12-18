Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC06D68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwNNQe9HkNqr/4QRueNpcLXFJw3AqhnKE+rnhsvWb0o=; b=wvUx789WC3J2+M58zUGXvGSp2z
	/jAJfLcy8RMefyLdtq8CMyS0/xtPoZvJsFRvh50wJUo7iv0VBZgIp8PGnrIGwDIgVPZmLVvsTj9HH
	Mr2rc7a5q8ITML1Tl7Y8YSDtsvVuvg2HZ6oTJVRC+XM/GhXiNMGj7cvPGAaBuiNb7x2selmPhfe55
	n5erA090rCSQ69d2aXQ+Q/sPM3C/JaSZ0Jy4I0sSs/zYicsE7m1Otl61ivCzvmJqQd/x7XZiny+6X
	kGaRp9DpNHFQitA6Ssyv1lmOwqMb0Flyfm+ojpzMvyekJzPQqqhDMwdTRba2LV78p5sBYmBxALnx1
	c8cKFWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8oB-00000007zJL-2gRC;
	Thu, 18 Dec 2025 07:52:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8oA-00000007zJ7-0Unu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 07:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 847AB600B0;
	Thu, 18 Dec 2025 07:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1335C4CEFB;
	Thu, 18 Dec 2025 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766044340;
	bh=z7L/COQjj+dxj156zLOK5p2xjWggF5cjflPxJeDDgmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gt8bWe3XjkS5yiewXH+wkKJpwHQZ7eU0DgDYmQJsraZPH48T4U8/IvENlrMLeaNB9
	 BydYKjugZeEMqFOU02jXXydkdM/Bt5a1zw+1ydmJQH/qgwfQkC5ROkUTDfuthjygh0
	 Dc8Y3wB/XmMGiQN8kt0Juxzz5Y1VVNDa8KCsT84hzx3ddKt0COqGOc79Ai19bJO0js
	 quoBd/AgFwgSHnCvWq7oQBLHugjgdD2y9+4H7ZVkquN5N1XCzacYAd3Fm23Yv/ZR21
	 uauRJxOG7K8+wFuwcTSmKaIbm3/Dqchzi2yHkiCcGOIfMnrb3Q9yTOqCWhYd10tXpl
	 8O1zFP3JAppkg==
Message-ID: <1e4c889c-f594-4d1c-92cb-e94af04acc91@kernel.org>
Date: Thu, 18 Dec 2025 08:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] introduce pagetable_alloc_nolock()
To: Vlastimil Babka <vbabka@suse.cz>, Brendan Jackman <jackmanb@google.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, hannes@cmpxchg.org,
 ziy@nvidia.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, catalin.marinas@arm.com, will@kernel.org,
 kevin.brodsky@arm.com, dev.jain@arm.com, yang@os.amperecomputing.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
 <916c17ba-22b1-456e-a184-cb3f60249af7@arm.com>
 <aUGOPd7gNRf1xHEc@e129823.arm.com>
 <100cc8da-b826-4fc2-a624-746bf6fb049d@arm.com>
 <aUKKZR0u22KOPfd7@e129823.arm.com>
 <d96ac977-222e-4e8d-9487-da1306198419@arm.com>
 <aUKnfU/3FREY13g1@e129823.arm.com>
 <d912480a-5229-4efe-9336-b31acded30f5@suse.cz>
 <DF0J58HOVLL4.2E16Q87D2UXRW@google.com>
 <d5354d96-6f28-41d7-9f66-64c254d9477b@suse.cz>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <d5354d96-6f28-41d7-9f66-64c254d9477b@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


>>
>> Link: https://lore.kernel.org/all/d912480a-5229-4efe-9336-b31acded30f5@suse.cz/
>> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> 
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Clarifies things for me

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

