Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7154CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEpP20QLYbUafDoJ1/D4YHhW2s2jVmPtJASihmV02YE=; b=CjvwseEHsAbworiVTIC5uwrmDg
	w4L4OQbmiwNpp7O3ZjR4ob94mtdL7K7UOSGGFIhwLe4JoNoWHdHPvA46tNPIe1WkoxWOW7lW01Nie
	gbINGO2Dp0Fav2soXO5jJi5ND38q2s+zpFWC3eqzbNWS+glgwut2MtzsCwG2njuC0+wyhQo7AbAfd
	r1DfRS6kYaJRwc3VMk1Jc/7K5WysPtRDoY+vJ2phHUGAOc2wX5kKMPbPf1d0IvnqJ9j2tgr+SNJbR
	d9VBIGpcs85OiQCjN6hyzK7WWa/ULBl3oGWv0EDNEBi9zK7NmKSo+cxgUS+PgM+Q9Np5FHcS70nJQ
	0Rk8Y24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsBG-00000006vPu-3RRp;
	Fri, 29 May 2026 08:02:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsBE-00000006vP9-0mjV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:02:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so96672555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780041773; x=1780646573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EEpP20QLYbUafDoJ1/D4YHhW2s2jVmPtJASihmV02YE=;
        b=YbSx9nNNTyPh5/o7z204T5PM0j7hYOQ0tk+YQJGClhVn/9hTRHebaXUM48ZtVrEO2/
         LFbjEXYjMoDX/A+IbkU3OVFSijLrF98qYfF3HYz2djrlUSuq9bvI5ocuAvceVtQ22ivy
         CBuOPWwWSKhAfXIrRSPGaQn5I0/msaKermbZE0EjXrmRQVNBmpTeoe2AW1S8ksvhs8b2
         DraSgcvUUO59zXzoSolmymK9r5ty17tdrLZCf7Jo8uZSdrZ6BE9zzFAViESB1AztCF7w
         U7Ie7ek7ULYylTyjsH0Xx9uPsLIBlRQXKEUU3sPkR8cCuqvOk9f5wHBLS8thGi+OtC/u
         0mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041773; x=1780646573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEpP20QLYbUafDoJ1/D4YHhW2s2jVmPtJASihmV02YE=;
        b=aEU8zHEiDB2QWjlz8yw3BVB6EKOK9gl1gKyaU4nj+v9yjkPzRMQfetJsDhCsw7Drni
         CvY/6CcSQzgMBmVvKqa3BlWuSZFYt4CEnf4vecfBnFGwOuprS165xwJK6Vz4Y833kVWT
         32EXsUrim5iEqdIGk9qlxqVAMrOIrsTULf+J8I1fFg78Cke2cCwSSEvafL++u02KfiyW
         MOdeoftldWC8Pk79WmRaVjcKEiG2KCok+Wfrioz6YKCVMkrlUqNiOn+r2GoSkBBbFssn
         plXSKSf/lCSExWd+j4vT/dq19im8VBWFjY6ubmZU5D1T27NydF/Y2X4nEqkh28+k3Yyb
         a8Jg==
X-Forwarded-Encrypted: i=1; AFNElJ83WNU8kZq8DKoCgBjvZWiOwNELVYMYAmOEC7k3ziRvn77nqdtqTbqDa+9l8XnXoZN0YBCtr82vXGem0JW0sWRd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Vh5bdkEY7AFag3Qp9cR4t+9Ajzyc4DKCkdtPHLeJ3nFDtI3W
	+fX62O8ZiMnJz5YirBb/Ch3DgDVMTZ/re7SOX20QUqS7wM41ZtHfbJ5kYamf5uT4XA==
X-Gm-Gg: Acq92OELv7lT0bL2nTZ4ybc2thzLlx6uFDLSUoFE03AxmGkwEcRCqIr07k7LwaIUUdv
	LWzlvxszfcEaul0qa8osBAQ+aL71933GWMTV+HRI/YSdaOyL/EpWMelM1UfbOqK4zb4BitriczX
	ItgSrHV+l+JMNROkiEHVwh7m+BzcXiEQGuQyuLw3CwjhFKCMS00Gfn6RogZ/1CEUFih378d/EoU
	sGgWJuB8BjGuHzu1GLqHnmNit4s/LY+8yVlC/8Ji0hotJzpq4x7CRMNT3tZXMsoBflctVl3RKaq
	BwY0d4R6jGtzP2dxQOlZGh67I6huPTBWSIwOJmKaDTZC9Fdm1lEqzKZ+Du4XV6RSm+sk492zM0M
	E/68O4aBcrvdXd5CNXQRg0yRbwn8cDUogt7unElkpIsrZvks+F9JNU+3soQwxRfbwBoxldklpdM
	uwkxpKYsSsO2UooYATnzvYQAirfe56R0H4HzLWBAwEY32XsJtYBzyGiaB+/d2PapZ3cAi2K61Wu
	WfUCg==
X-Received: by 2002:a05:600c:c16b:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-4909d2e8ff7mr29149015e9.7.1780041772883;
        Fri, 29 May 2026 01:02:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c12b6ddsm8900445e9.33.2026.05.29.01.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:02:51 -0700 (PDT)
Date: Fri, 29 May 2026 09:02:45 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: tabba@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
Message-ID: <ahlIJQU-1b0mayPP@google.com>
References: <20260529074341.2271950-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529074341.2271950-1-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_010256_241472_A7865404 
X-CRM114-Status: GOOD (  18.96  )
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

On Fri, May 29, 2026 at 08:43:39AM +0100, tabba@google.com wrote:
> Hi folks,
> 
> Yet another bug I found while testing Sashiko locally with fixes to
> review-prompts.
> 
> share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
> maintain a host-side RB-tree mirroring the set of pages shared with
> EL2. Both invoke a hypercall that can fail (page-state mismatch,
> EL2 refcount still held), but neither cleans up on failure:
> 
> - share_pfn_hyp() inserts the tracking node before the hypercall
>   and leaves it in the tree on failure, leaking the allocation and
>   presenting a phantom share to a later unshare.
> 
> - unshare_pfn_hyp() erases the tracking node before the hypercall;
>   on failure the host loses its record while EL2 still owns the
>   share, breaking later operations on the same pfn.
> 
> Severity is low (no isolation impact) and the failure paths are rare
> in practice, but the desync is real. Both patches are independent and
> apply cleanly to current mainline. In other words, this can wait for
> 7.2.


I believe I fixed that here lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com but
as Quentin pointed-out, there's absolutely no reason for the hypercall to fail.
So I haven't sent a v2.

> 
> Cheers,
> /fuad
> 
> Fuad Tabba (2):
>   KVM: arm64: Free hyp-share tracking node when share hypercall fails
>   KVM: arm64: Avoid host/hyp share desync on unshare hypercall failure
> 
>  arch/arm64/kvm/mmu.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> -- 
> 2.54.0.929.g9b7fa37559-goog
> 

