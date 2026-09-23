Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF55CC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Glwn5+xNNEsiGY0AkWLewIKSP/1m9/I+d44zcE6ygYY=; b=zOcLRDHGeclMMhqG7w+tK4/Dlv
	e5F/yZKHNkxvWS3vSV7yc+JumFIaf1ayRFAU0QID10j92o8/XdUNG+Lk/Wlpe32VcpWbs3mv1wlJN
	ZP1uZoQfRRNJdu6j2vSZppyJLVDG8O4f2VY05qOUUW+/Bo6yDCc5mUdBE2OArxhv7Nf2pV3zrBoep
	rG5V+F551cb0aB2bxrPHdCFE8yfdzzis9qMDV89n6+311/mSxTkjt8pQ6lHktASV8fyysN8RHbIS3
	OHnd8LLI/m0hdp/ZKeEbULE+xbt1JcmGyQFQyaPSUIhrtQr31IhKR2zMvJQ9P2Y5/55bKchq0kwCh
	eDPZ/Tlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N6V-00000008PKu-1z0U;
	Wed, 23 Sep 2026 13:33:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N6T-00000008PKk-3RYZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:33:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B6D140534;
	Wed, 23 Sep 2026 13:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60A01F000FF;
	Wed, 23 Sep 2026 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170421;
	bh=Glwn5+xNNEsiGY0AkWLewIKSP/1m9/I+d44zcE6ygYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQ6057MT1zcOmAohcwlO4SiOTlts4xVonSVjO/LccVR+FZS4N6VWjlk6MwYOkHFp1
	 s49gevLrJSDqNTCBgen5O7jfl8Bz1qTaK9sgrXiPGsw9OxDq/kB9YC0j40MFb+MH51
	 10D9naFbsjdGXZrKvk/gMsN1Vx1dUX831H237Fqox+V7z5LtpPx/9TlUDWxAZ4z/sd
	 jTH5wsAYQv+bWjmqbTx+0ZpxFwnIoZC86MokSCNIqJDU+2PFyh+zdZyO1qxggPOFSo
	 sgS6oVXe4LpC4QQgocn87cUc3vcBVKb1/M5gx8TxlLEkI8UsMmxMDkM8xFFoo3cOkG
	 NZdaXS39paeww==
Date: Wed, 23 Sep 2026 14:33:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 10/14] KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
Message-ID: <arPVH1z-Z6zzLy44@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-10-787bd3bc7e3f@kernel.org>
 <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
 <arPTt4WuVxcdvThs@gremlin>
 <arPU4O4_oDUzPcod@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPU4O4_oDUzPcod@gremlin>
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

On Wed, Sep 23, 2026 at 02:32:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> (Folded into 5/14)

Sorry 6 even...!

--
Cheers, Lorenzo

