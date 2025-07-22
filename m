Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96C6C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35S7qt1errZJM4TaGjMePcSS+aTIsv2+oQ73mGGRzrM=; b=CjDODoLulT8zzVY/JkEx/D1+0n
	0gHmorFvaeoWbqtWlCHfs1M31839TSXcorACO/rIQKHX/aEf1AdeOGt268pGkuKq85ol2roB4JbHV
	EXzL4cQPq0ke8/XohTA93mma7VQuMk+votBGqoE1D7taQpA/EyWiUa1AzuKBV2C43T/R65IGASnKR
	lnfIhAi0mB2sBdWSbGxMsq6s0LnYTdRlH6snWVP63vbquITTrQ8tAtqaPP2j/h4+ICCcq9jGtNU65
	bjcUmU3m1fanCb77q8JluL+n+dcba+roMgxk0ZIIh1JK0wLUPY0cRaN/II2NmTCHlYj3aU0oDuleL
	NTnX+ytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5xg-00000001N7l-0ClO;
	Tue, 22 Jul 2025 05:54:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5sl-00000001MHq-3OgO;
	Tue, 22 Jul 2025 05:49:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEB04152B;
	Mon, 21 Jul 2025 22:49:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68B153F59E;
	Mon, 21 Jul 2025 22:49:36 -0700 (PDT)
Date: Tue, 22 Jul 2025 06:49:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Pingfan Liu <piliu@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Simon Horman <horms@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Philipp Rudo <prudo@redhat.com>, Viktor Malik <vmalik@redhat.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>, Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCHv4 10/12] arm64/kexec: Add PE image format support
Message-ID: <aH8mbFzwiKM9MMgm@arm.com>
References: <20250722020319.5837-1-piliu@redhat.com>
 <20250722020319.5837-11-piliu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722020319.5837-11-piliu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_224943_893063_A4C2CD0B 
X-CRM114-Status: UNSURE (   7.40  )
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

On Tue, Jul 22, 2025 at 10:03:17AM +0800, Pingfan Liu wrote:
> Now everything is ready for kexec PE image parser. Select it on arm64
> for zboot and UKI image support.
> 
> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> To: linux-arm-kernel@lists.infradead.org

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

