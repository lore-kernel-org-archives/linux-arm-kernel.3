Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04734CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xegl3WmadzfgUhZnoZR3vmKK8nFv7OTWYUS/2OaTcpc=; b=lwYJCeb+byxeli58JEpa5hizu0
	lhwDkYKj/Eq5tiHUprvS40qMN1k6RPvbxTKpUYSsd2UUgpvyvTe1VaafWT+rgwfn6os5ymbX8giNA
	/oZmyyxtwL8EUBFsfIri3DsETfZHv1kYcRLDGNRezYhuc2rtDk+EXIHUMMHr/sdzhaNxhZCU6/KIs
	MLCrTZQuYPtH4epc10ab1Cwly5m0ScRZTg1uRnxZ3NZmn92+qR/cZUkIwvIy269qONH5ZDhJVBy0S
	0gGOKVVCB7RuG2F6H/tPCuPINuW7p+j/HMH8g0HC++sYUS1mr8pKjk7lDMpTkKkKTo4sSJx+hdZL0
	U9l1fcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfEg-00000001Wwo-0Tuv;
	Wed, 06 May 2026 16:36:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfEf-00000001WwH-1kSx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B075439FB;
	Wed,  6 May 2026 16:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E75DC2BCB0;
	Wed,  6 May 2026 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778085392;
	bh=Ue44NioV5E914YTc64YG9A64MJOnrp/V9kJitJ+ZR1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwMSCULqoAB0A/5JTewt2Py2FDxKt/KpeUbUtdB9Od7aGMOK91jD6hDPSEV3HREVk
	 fOQoJkOXU/83y82fDcNHwgBpEnhmrbtNfijMBzsyqKYVoPxGz8a4dHOl8YEd2ShK87
	 FIYY7wABv9F0NuAnwrBri2d2VIXR1XWuus+PFQKP7f5hrtG7Fan0QbvkoY0lEtjNwl
	 ANP6Ke+w/MqqsS6gvxjHUovkCsZqYFAL76pLPSgc/hg2THpqIIK1kQ65M0zrZ9jrL5
	 5IvBcsQskwSr/2HHMZvScskz178NB/uJzkO9voMaK5sDXpeMTzW9BH9lUSiKBc/jRO
	 3U9Eyr9cVcg8w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKfEc-00000000Mhn-1co5;
	Wed, 06 May 2026 16:36:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Steffen Eiden <seiden@linux.ibm.com>
Cc: Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: (subset) [RFC PATCH v2 15/28] MAINTAINERS: Add Steffen as reviewer for KVM/arm64
Date: Wed,  6 May 2026 17:36:25 +0100
Message-ID: <177808536524.2712923.10633817226066107271.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428160527.1378085-16-seiden@linux.ibm.com>
References: <20260428160527.1378085-1-seiden@linux.ibm.com> <20260428160527.1378085-16-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, seiden@linux.ibm.com, gra@linux.ibm.com, arnd@arndb.de, catalin.marinas@arm.com, borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, david@kernel.org, ggala@linux.ibm.com, brueckner@linux.ibm.com, frankja@linux.ibm.com, joey.gouly@arm.com, oss@nina.schoetterlglausch.eu, oupton@kernel.org, pbonzini@redhat.com, suzuki.poulose@arm.com, Ulrich.Weigand@de.ibm.com, will@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_093633_474299_6744DCBF 
X-CRM114-Status: UNSURE (   8.18  )
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

On Tue, 28 Apr 2026 18:05:12 +0200, Steffen Eiden wrote:
> KVM/arm64 and KVM/s390 now share some code.Add me as a cross-reviewer
> from the s390 team to arm64 to help to keep both architectures in sync.
> 
> 

Applied to fixes, thanks!

[15/28] MAINTAINERS: Add Steffen as reviewer for KVM/arm64
        commit: 54ea22273eef67196f238263bc79f27da04d2114

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



