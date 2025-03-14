Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E17BC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBRPT1Ef7gcoS5ULW/EAZWPL6EFT3wjf8hjoOpJAfx0=; b=fymug8xfCqG4JPZvqK58wZKraF
	gtu9gmmDWmOjSXvWDH0BBv1drNVDB6ny9X2nDwSl8ncR+vikKhLGsZg9806B8vWKechibAn3rHJ8x
	5bq+LZZsHRaP0wKJduX+iwj5M8XffUxTlXMkyI4Q7MUsjHoJkyIEsDH4idRbAlzleef4yJMSeF54s
	0tEegRMdPTecTYxhrJhKzipjsObp8/vCzeYxqGX3IJX5TlmhYZ+YZJBw1POFQv+z6HbKpPPA2EdCm
	DmbyIPGZSyKRFFjAbys6qIzt8DFla3p6IlENi7ILHO2lQSVaH9jDvIrg0SVl4b57lCUhk6Pe9PXtj
	v/cT7VYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFH4-0000000FZuz-1WrS;
	Sat, 15 Mar 2025 00:21:10 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEC4-0000000FUoj-05Ly
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 23:11:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741993913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBRPT1Ef7gcoS5ULW/EAZWPL6EFT3wjf8hjoOpJAfx0=;
	b=QosJYY8SCLXfnl/YptkVZ4xtrXEta31SV0o+im/axw8i46oDXdocV30CtI5WF60Z6PY0sE
	XplUAJNbpebNTlTAoILH6BZVkLN4WT5zLCOHHpNAFWHCbJMT90oghUSau+yYGrYW1HHk7Q
	h15qKNj1pYFwoCg+4ZI+j0vPfS1DkUo=
From: Oliver Upton <oliver.upton@linux.dev>
To: maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	qperret@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v4 0/3] Count pKVM stage-2 usage in secondary pagetable stat
Date: Fri, 14 Mar 2025 16:11:41 -0700
Message-Id: <174199388869.1347355.3257172566547296474.b4-ty@linux.dev>
In-Reply-To: <20250313114038.1502357-1-vdonnefort@google.com>
References: <20250313114038.1502357-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_161156_208638_66E3EA83 
X-CRM114-Status: UNSURE (   6.42  )
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

On Thu, 13 Mar 2025 11:40:35 +0000, Vincent Donnefort wrote:
> This series allows to count stage-2 related memory when using pKVM. The
> value can be found in the /proc/meminfo field SecPageTables.
> 
> Changes since v3: https://lore.kernel.org/all/20250307113411.469018-1-vdonnefort@google.com/
>   - Remove unnecessary void * cast (Marc)
>   - Rename reclaim_guest_pages() -> reclaim_pgtable_pages() (Marc)
>   - Remove unnecessary PAGE_ALIGN(pgd_sz)
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Add flags to kvm_hyp_memcache
      https://git.kernel.org/kvmarm/kvmarm/c/cf2d228da9a8
[2/3] KVM: arm64: Distinct pKVM teardown memcache for stage-2
      https://git.kernel.org/kvmarm/kvmarm/c/8c0d7d14c5cd
[3/3] KVM: arm64: Count pKVM stage-2 usage in secondary pagetable stats
      https://git.kernel.org/kvmarm/kvmarm/c/79ea66231599

--
Best,
Oliver

