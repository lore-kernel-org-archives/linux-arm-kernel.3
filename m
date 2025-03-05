Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58C1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ+RrKTLY2ma8ml+GBsGBL5RMhPj6MXP8JmKnOjAXXo=; b=ncS2M7agboN5zERYZ5rcLYMNWE
	AeIjLQJyRzgkz+lTGEd/D2dYALe6rNv1CZLEM+ZUmnpkHISoyd25R0mKvJ6d1TdFrmlBqI0Trq/O6
	RZZeRBUP5J5MC5vPOb3ypTyUAfkkO3qT18sUpovuhuJh0wfAO6q4n7CJUFyxmI5zfMjkTlLMTbNNc
	tWQN3gYCAOZMifl8UYGJCj7BnXW3fckJPOyTKmENJP5oQpkEtUJJEOWBxIbGNVJweNbPqwfCT06Rq
	He/NAu/akE6JDUoaHm4bg1vJEgsGgBOEW3BfN1oqHmQbk5jeCDZW+i5mCeWtusQKrDNVfcjp28yzR
	SIzH4b/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuyf-00000009AFC-3KAl;
	Wed, 05 Mar 2025 20:04:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuVl-0000000954u-0s52
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5BC2A45C66;
	Wed,  5 Mar 2025 19:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DDBC4CEE0;
	Wed,  5 Mar 2025 19:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741203272;
	bh=A7HpRq/91+8athZq67F20mXrUR/8ioHId6gQWWlCNvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9UjWC8tn1t3HK+WiblEvfCTov6GC4SesAt22y7vX2bkk5leWZwCOfNz9psXVZ5nD
	 svk54TZTIwOHgt2DJEA3F36wW4xauzEPNt7CEhSoDJam/XTgVWNMM5v3IoBB03Hiio
	 TfVtTclHQm8WUuj6Jj9p1cU3c7tMtN0XG5+DkSS8VoX7xQa9DSrX7UPAc3BOaSJDdi
	 M42PqSqAnjUTUxN+84AfMTyDsx44Evfz+ETEeIvp5ay9jiqL4zr9ByNOPFR4o1VO4O
	 prbdGEwDF8645jAKGMnio/xfi3F3q5+iobEVSMSKIVGWDFIGJW4aNsRXvlt6UhYJJ7
	 e32naCkRvhmlA==
Date: Wed, 5 Mar 2025 19:34:26 +0000
From: Will Deacon <will@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	snehalreddy@google.com, suzuki.poulose@arm.com,
	vdonnefort@google.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <20250305193425.GA32246@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-5-sebastianene@google.com>
 <20250305004522.GC31667@willie-the-truck>
 <20250305094104.vctshdtgdukno2aj@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305094104.vctshdtgdukno2aj@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_113433_310117_6523AF66 
X-CRM114-Status: GOOD (  18.75  )
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

On Wed, Mar 05, 2025 at 09:41:04AM +0000, Sudeep Holla wrote:
> On Wed, Mar 05, 2025 at 12:45:23AM +0000, Will Deacon wrote:
> > Hmm, the FFA spec is characteristically unclear as to whether or not we
> > need to release the rx buffer in the case that the flags indicate use of
> > the rx buffer but the returned partition count is 0.
> > 
> > Sudeep -- do you know what we should be doing in that case?
> > 
> 
> We need to call RX_RELEASE here. I went back to the spec to confirm the
> same again.
> 
> v1.2 EAC0 spec Section 7.2.2.4.2 Transfer of buffer ownership
> (Or just look for the section title in any version of the spec)
> "
> 2. Ownership transfer for the RX buffer takes place as follows.
>     2. For a framework message,
>        1. Completion of the FFA_PARTITION_INFO_GET ABI transfers the ownership
>        of the caller’s RX buffer from the Producer to the Consumer.
> 3. For both types of messages, an invocation of the following FF-A ABIs
>     transfers the ownership from the Consumer to the Producer.
>        1. FFA_MSG_WAIT ...
>        2. FFA_RX_RELEASE.
> "
> 
> Hope that helps, can dig deeper if there are any ambiguities around this.

Thanks Sudeep, but that also makes it sound like we need the RX_RELEASE
even if we're not using the RX buffer per the input flags. :/

Will

