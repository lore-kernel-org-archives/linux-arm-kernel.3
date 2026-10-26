Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ROQa7PuT;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Fq8fBUGG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m9xXitEiI+hi1F9clvRlUMjS8JnuPFDTdYXDE0kyjzc=; b=ROQa7PuTN+T/hc
	jm/748pAb1Jg6mZXyuVpPmA9MjpJflxaMPnGrk6QbfCoodArM7kdvvjeknmrXnbL7tZ2fVXp4mahV
	oWTohAzTKJTqqCenncmbz5KLvw7rC15x+8MqgSYMsZJ0AfFjPRrwbE+66fZXoh5GL9gQnFdVehtEO
	4kabLl5fozEcJ3pSTOXLbNZPdhPg97ygYZszRMzcqdJ37MRo8nH+4kRyxboTaukEXMys5cG0QrDUt
	dJv/PU6maQvQ6NSQUXdALw0A563azWzIjFhfPgEpLqToV7E+NPHSc9vtMHvQAmEU5h6zGDFDm4Enn
	DeNMpD4amS1Z5oV2/c2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMDD-00000002k0L-1bIf;
	Mon, 26 Oct 2026 15:02:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMDA-00000002jz5-3Nyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 15:02:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEA1B1655;
	Mon, 26 Oct 2026 08:02:03 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EA793F7B4;
	Mon, 26 Oct 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793026926; bh=v+zgyK0QwsGg1V453RC6kjK16TjZSW8MMUUh5EUtImA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fq8fBUGGhyKB1XXODIVt6BLwqv4o1xkXZa7X2pGzhE3cWxE1Dx6V2Agz2JruU6v8B
	 e6+kt1FW/KX9OCoA7zQKe+M/qRq4dDfLlyRJhVUpUX6qmLxdWvCOV5AohG8CCGKOyh
	 lOSGCTkE5jrlgqOKG5he5sUj7qM29vi1N67m9FTc=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	pbonzini@redhat.com,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	tangchengchang@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com,
	seanjc@google.com,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 01/15] KVM: arm64: pgtables: Change write bit from S2AP_W to DBM
Date: Mon, 26 Oct 2026 15:02:00 +0000
Message-ID: <at9raEVrsbb7rj6n@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <8ca88576-651a-4b7f-91ff-2cb2359aa79e@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-2-zhengtian10@huawei.com> <arxW4PUY3qqRkogl@kernel.org> <8ca88576-651a-4b7f-91ff-2cb2359aa79e@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_080208_889220_7C1F97B9 
X-CRM114-Status: GOOD (  18.63  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 30, 2026 at 10:44:26AM +0800, Tian Zheng wrote:
> On 9/30/2026 8:25 AM, Oliver Upton wrote:
> > Hmm... I'd actually like to see this structured where the "write" bit
> > could either be S2AP_W or DBM depending on if the system supports
> > FEAT_HAFDBS. Look at how HVHE is handled for selecting the right AP
> > encoding for the hyp stage-1 page tables.
> > 
> 
> Hi Oliver,
> 
> Thanks for the suggestion. I missed the case where FEAT_HAFDBS is not
> supported. Systems without the feature should keep the original
> encoding, with S2AP[1] as the write permission bit. I'll follow the HVHE
> pattern to select between the two encodings in the next version.
> 
> Thanks!
> Tian
> 

Hi Oliver, Tian,

After some digging, I think it would be better if we kept using S2AP[1] as 
a writable bit, while DBM can be treated as "Can promote a non-writable 
page to writable if HAFDBS=on". 

I know it's not that intuitive, as the Arm ARM even introduced the concept 
of Writable-clean an Writable-dirty, but I think it will be the best way of 
referring to what was intended of the bit.

I wrote down what I mean by that:
https://lore.kernel.org/all/20261026144413.441566-1-leo.bras@arm.com/

tl;dr: 
- DBM + S2AP[1] is set on writable entries (KVM_PGTABLE_PROT_W)
- Writable detection is made only on S2AP[1], so no changes
- Wrprotect sets S2AP[1]=0 from the PTE, and also DBM=0 if it's a block

On dirty-tracking:
- If HAFDBS=0 : no functional change, DBM bit there but unused
- If HDBSS=1
  - Pages: writable-clean promoted to writable-dirty on write, HDBSS does 
    the tracking
  - Blocks: faults on write, splits in pages, pages get DBM=1. 
  	(argh, I think we need a PROT_DBM for that) 

Does that make sense?

Thanks!
Leo

