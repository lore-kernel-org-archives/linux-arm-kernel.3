Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE33C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+LHj0w68UNIs9ksSFFw/ZHUYPHct0wG+azZjQnnxdM=; b=pD9z4NAYm9ZTXvDDjZ6QZ0G4Db
	n9U5NgH3P48i/5yM7FxsW3xlu/MV8EjYeLCn49TNnkcZd0KN9PP/BlRaeD+gDdsit6xv8cMB76fKm
	s/fzRmoQtqlD0esDyR1b6VzqKfz0boTEVyHNg7uljmG8ONz23n1mxGDEs8WTOamTeeTZ8gChlj6f6
	GYhA56lx8lZwvz8UEUrT1oTWhOsZJCr9mKxQIpqoNHs1TZIyzEFUb91T3BW54RyTTQqaUq3gvm502
	OGUk76DC7i6utG8Yqguz9FYTctT9y6dA0OyCymhdnNDraptEje5SqDZN5YjOLB8FLh7K7zv+JNEds
	48tes5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Thm-0000000Dluw-0FIE;
	Fri, 18 Sep 2026 08:12:22 +0000
Received: from mail-wr2-f12.google.com ([74.125.225.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Thk-0000000DluY-0kuA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:12:21 +0000
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so235759f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789719137; x=1790323937; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+LHj0w68UNIs9ksSFFw/ZHUYPHct0wG+azZjQnnxdM=;
        b=IYj30TdZtPRRBYHHsc0oz58hTGtpIoZzvnmHlbkNbwSM4+zG5hoAG3KiDMBFeXVDxd
         x6vS58zDfvLhbCYmXfbYSzoGzPHWMeka2Yj2pBvYqkfMZvrj9zrLBkVawR2pWmc2jtFr
         5nkeg+apYPF/WFaCq0syc5qR2drE+QQCZhg0PGyQNVvNkjc1kFrRODxZmb9AvqSkjS89
         pvpbPs35XTjI4f3G4pvA6ExOD3r3yGh1PK1U8jzpo44Yl2hMK5odMYhB6wX8HCdNvvwx
         KS89v/UKN+hZFSFl6IgzVKTbx3+ioFcY8fZwlmF9e0QW/qrh2jJX4nalkhTbbfQGZM+5
         jLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719137; x=1790323937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g+LHj0w68UNIs9ksSFFw/ZHUYPHct0wG+azZjQnnxdM=;
        b=nxlNHncJ+m8sVHX7+uzF0C0wCoHMV3CM1TzgEeICbeHOEod5dun099jy9kEut5jZ7b
         oPtbSuilYsN53ai7qkn+AVnT2vjY2Mc3Cpx8rNX678zlmJj0vdi540yCvXjo/Z20S8lt
         FHnv8rN5NRpIPNJx/zbOa7AqJxZ7ZugsUnAUWsm3U/FbOmWP2vEzgaHKywVX/bUJYHRb
         5DsQAG1dAc2osP0dp8dhUdcgUYZ+b9Z81Ws5rPrdPiurYxo37Cfl6RL0yYcjjXMoe5CE
         KlHOPc3Hk9KliFMC7BhvA4i6g87GG+4eUNVG4PHQYXPuCk5qYLoH48HopVYzyEeAxqDC
         6Ang==
X-Gm-Message-State: AFuF++nxenNwJvFyYjMwDuwM7FPlLfI6rLg4052c15j8DBNWUzuWYju1
	jP9CekPgh6vhCzAnvOP3Cf25GsDCtf15o48nMXLDvI1zNWdB10aYlLg5OMTyKCy8nQ==
X-Gm-Gg: AYBFou1aEAZoCIXx5ZR92agqfKTakng9tL3jB5R3wGGXtdk9+x9HTnfybAeRlhKHwxZ
	O8575TPWfs0Qyv8FEIAag7519gVBBNhUZmRQgKOBL6AIzH0LYatpN5+HLaVP5dIFkrsTIcsIh1R
	pPglm8ekvUhuDvDjh7etT4EQdmgp6XjNwjm49IicJJDBzPB6BVxkVICivgQZlX7Juode9EzHHgN
	0bvxxabAoRK2r1A85XDV2mgUbciblD8DNI5jfhDJU45PEVtcxx7XI4HImJO6/kNYlq5p1LAavia
	jim89HCng06tqdEiUSMslSWKXTHQVhCM9IjLZon1sjJ3JeofIldS4L9s8MWKJLFYROyuN9zpfWh
	fuwNuDnIaIjMMGhOVfIoT3Sk9rOr6netWSd46PKvGPhoZBQQxpi0rq+UDL3SJ3TLDCrsHZl+e5y
	+E9wRqDh7xLPE2WcUV+m0eBWmW8t96ZsJ5xVHaE01ArNwNrPRbTMX5Mr/9GN+hQJK1E7nZC/zt5
	r7Be+qJllW0ud6mRhqmuw15ACOUIRw6jX0aJ7AB2+Rt
X-Received: by 2002:a05:600c:354e:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49fc57226c9mr17380515e9.12.1789719136409;
        Fri, 18 Sep 2026 01:12:16 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff56021sm2439656f8f.18.2026.09.18.01.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:12:14 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:12:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sashiko AI <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] KVM: arm64: ptdump: Check the page tables aren't
 freed when accessing
Message-ID: <aqzyW6oJtStG_nSn@google.com>
References: <20260916230337.4162485-1-weilin.chang@arm.com>
 <20260916230337.4162485-2-weilin.chang@arm.com>
 <aqugxlnqegPzMpB-@google.com>
 <ezplrvcw7buhd75v5rezvkhbgdfldxklqavdpnxl2fad5thswe@kctrvkjzr6cs>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ezplrvcw7buhd75v5rezvkhbgdfldxklqavdpnxl2fad5thswe@kctrvkjzr6cs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_011220_280585_3701DD32 
X-CRM114-Status: GOOD (  25.48  )
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

On Thu, Sep 17, 2026 at 08:30:49PM +0100, Wei-Lin Chang wrote:
> On Thu, Sep 17, 2026 at 09:11:50AM +0100, Vincent Donnefort wrote:
> > On Thu, Sep 17, 2026 at 12:03:36AM +0100, Wei-Lin Chang wrote:
> > > An open debugfs file keeps the KVM structure alive, but does not prevent
> > > mmu notifier release from freeing the stage-2 page tables when the VMM’s
> > > address space is torn down. Therefore page tables belonging to the mmus
> > > could have been freed when a thread opens or reads the ptdump files.
> > > Take the mmu_lock and check mmu->pgt is still alive before accessing the
> > > page tables.
> > 
> > As Sashiko said, the read_lock is probably enough, including the existing one in
> > kvm_ptdump_guest_show()
> > 
> > With that change:
> > 
> > Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> > Tested-by: Vincent Donnefort <vdonnefort@google.com>
> 
> Thanks for the review and testing!
> 
> I agree taking read_lock is enough for most of these, but changing
> kvm_ptdump_guest_show() to read_lock could result in a dump showing
> weird output e.g. 0-sized ranges. This happens when the dump reads a
> block, and a parallel fault turns that block into a table, and the dump
> descends into the table later.

Now you say it, I remember discussing that with Sebastian when he wrote the
patches.

> 
> This is debugfs afterall so I think it isn't a dealbreaker, but it adds
> another purpose to this patch. Maybe we can change
> kvm_ptdump_guest_show() into taking a read_lock when someone reports a
> scalability problem when dumping the page tables.
> 
> I'll stick to changing the other ones into taking the read_lock now.
> 
> For future reference: KVM_PGTABLE_WALK_SHARED is required if we want to
> change kvm_ptdump_guest_show() into taking a read_lock.
> 
> Thanks,
> Wei-Lin Chang
> 
> > 

-- 
Vincent

