Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB361093170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pDqs44dkcjEkb8OYJpU6L+/Zb+sncdVx4zheks3ZXc=; b=NXPwWX70//LcHWCEvxK9uIovp3
	J+i6qVhAwcXf2PgGrd7BMZ+U0u393HSbZRCxC/ov3lSrsMEtG6u9fsm1AhhhgG/VyliEPtmymRE0s
	SpditDA4crhk15z6QW8bW84G6/QlBScW/t2DUQqfN8nBPR7uoIkmO5gkMas5MCMB3rzWAEUAjzqtp
	p8FohjM5gSnPd7JamveQWFaeVYKzoZh0Q2BvF5O5e6w+zeXlMMXZOvgw67hALIP7tJBm6Exu0953x
	2iEcchsQGlOo0l1I1Op8ti/wJlcfNBsaXveE1gl8fqr4LeaVeP63HBn5g5sqeWUqsA8IpbSjkmMTF
	0xtroMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QD5-0000000BxjO-0uIR;
	Fri, 20 Mar 2026 03:07:39 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QD2-0000000Bxiu-3Ry4;
	Fri, 20 Mar 2026 03:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773976054; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+pDqs44dkcjEkb8OYJpU6L+/Zb+sncdVx4zheks3ZXc=;
	b=dYdHcERtYFyNDTA3+ZaSb0zhkINX++RF9JvBq39XHaTNKskbmntrB+vn38Plh0CJQ8M4rRNKMZ8wdWyajdB5G+jU77GwrnxHIAMTd7kNfr8ufDsZvm+VguuMIqoNLfEFry+kJX3yvWIW2gm66Tb8R7NKdA0PXdrRnjwoEZqzxl0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.K9XTI_1773976052;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.K9XTI_1773976052 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 11:07:33 +0800
Message-ID: <2ff1b860-ff76-48e6-98c5-28e517afd3f8@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:07:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] mm: change to return bool for
 pmdp_test_and_clear_young()
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
 <4cf8eac4-f601-4f39-8094-d904edbf454d@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <4cf8eac4-f601-4f39-8094-d904edbf454d@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_200737_025627_1F0F965E 
X-CRM114-Status: UNSURE (   5.63  )
X-CRM114-Notice: Please train this message.
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



On 3/19/26 7:31 PM, Lorenzo Stoakes (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:24:02AM +0800, Baolin Wang wrote:
>> Callers use pmdp_test_and_clear_young() to clear the young flag and check
>> whether it was set for this PMD entry. Change the return type to bool to
>> make the intention clearer.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Some nits similar to before, otherwise LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Thanks. And all comments acked.

