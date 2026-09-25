Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C2EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iihkM/7KvK/mt1x0eZrWDrnWJRfMoQnZsgo9hNqe2G8=; b=ZnpebA765SPAYgwlF57a/uPNE/
	cvdxmbdOboA2G0q+1cZMr9wDHNkob0fx14BQMO4dbtHSmEx4X0I/qlV701J3Emmha9jkM3BNM/1qZ
	ePpWc+aBfU2+Xxt1Pth8qG4W1uioiXooC02kEMbdlZjohF7SgucJnuEq0n8eDEx8249dwcEqd/zJX
	hhZAjoNu9q2e7VwV3/fGh9RyY2DE3UPd3HmxQwabu3fgBdaQBg18/xZyf69ZC4R7jWXL7GF7HfBvA
	o0EJNZ0algdcIfvXwaag19o4s+dSZ0Lk61TMD9l9oZ08eBy9yYzSNd+6+kzAsFxcGeRTiyqqGAzHx
	F152MdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABuB-0000000EIcx-3vcr;
	Fri, 25 Sep 2026 19:48:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABuA-0000000EIcl-0ztX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:48:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72FFF403DA;
	Fri, 25 Sep 2026 19:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDF91F000FF;
	Fri, 25 Sep 2026 19:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790365701;
	bh=iihkM/7KvK/mt1x0eZrWDrnWJRfMoQnZsgo9hNqe2G8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aiVZjVmEy1ThNnYtiCN1cN+s5ZqCNT+FP/swQUZVuNiJ7kWC5BDeOeCFutI34nVGg
	 0LmSxyMmeP4LR6IkdRtS1PgHj7BOOsVIFqSAcmDRbbVl3OR6nELyLXXoQXeZMtZnya
	 LRxoZRnnfLul7IArKgbVPoCGVm2OUfn3az67oNC3dNhjHhBkPBF+DWAVDY7lDtXs1M
	 j8rUW8SnEeQydrHCrUGimqDN1e/LZAMlUrBS2RTTE8/V1uMt30mpk3s2yLtwonRJof
	 qTMGhtCJ9ZH8Pjg2pML5wI+IpiO9QdcvOHn2S/qup/K655+EVWVOB4ee8O6G80lb/v
	 gFFDHLdg3Ec9A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xABu6-0000000Daim-3CXI;
	Fri, 25 Sep 2026 19:48:18 +0000
Date: Fri, 25 Sep 2026 20:48:18 +0100
Message-ID: <86eceh3yf1.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
In-Reply-To: <arY1uKfUBXRpauaN@gremlin>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
	<86ik3u4asq.wl-maz@kernel.org>
	<arY1uKfUBXRpauaN@gremlin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ljs@kernel.org, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com, corbet@lwn.net, mark.rutland@arm.com, fuad.tabba@linux.dev, rdunlap@infradead.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, david@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, skhan@linuxfoundation.org, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, jackabt@amazon.com, jackabt.amazon@gmail.com, alexandru.elisei@arm.com, vdonnefort@google.com, aneesh.kumar@kernel.org, seanjc@google.com, imbrenda@linux.ibm.com, Leo.Bras@arm.com, weilin.chang@arm.com, linux-s390@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Fri, 25 Sep 2026 09:51:41 +0100,
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> 
> On Thu, Sep 24, 2026 at 10:08:37PM +0100, Marc Zyngier wrote:
> > On Wed, 23 Sep 2026 16:15:43 +0100,
> > "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> > >
> > > This series implements the KVM stage 2 page table pre-faulting feature for
> > > arm64.
> >
> > [...]
> >
> > > base-commit: 23ddf997ab16b5f4aa9f948f5a68f5b35e4e398f
> >
> > In the future, please don't do this. I've just nuked this commit from
> > kvmarm/next as I rebuilt it, and using such a random commit is
> > counter-productive. Just stick to an -rc tag from Linus' tree, and
> > that's it. I'm perfectly happy to deal with the outcome (conflicts and
> > other funny things).
> 
> Ack! No problem, will do.
> 
> Do you prefer that people stick to the same -rc base from the start or OK to
> roll it over to latest Linus's tree?

We generally pick -rc3 as the merge base for all topic branches, so
something -rc{1,2,3} are ideal. If you depend on something that is in
a further -rc, we can manage. But keep in mind that around -rc6, the
tree is closed to new features and becomes fixes only. So if you find
yourself basing something on -rc5, you're already playing with fire.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

