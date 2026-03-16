Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D5F53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a7rqfQ7dvl8k0gLTQFhSqgYvJdxv5fbv1PEeEsnwuM=; b=hhYmO9kX/AAcx6POpsXVPWM+TA
	lAXCwI+Ke1DedkZyo6eHSxczb4ULN20dtRYoWlzAj/urh8euEn+R0ZNyFFuCH/HIzc0613CfOZ7B0
	X1/QPcW30HltnztbeYtkUJn4cLgouGan8X8kM8aLGCPXmWF3FRc+tqXxckMGT7rJQXvflYZngrBb0
	og10HvfMreMloHipma2sTIxm2zzc+70U98U0KoVbgBtdWNQoB2MdVj2wW/9ViBjliu1xeWWql60jb
	UulNnDElWKjDkc9Bd6orSpNNuhfOUN5zW0vVNun7Ump973GqS/MyB6VBUxD0Snk1J0HBJDJ9H5HKy
	Ur+Tb8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BzQ-00000004bXg-2jak;
	Mon, 16 Mar 2026 17:44:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BzP-00000004bXP-1RhZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5a7rqfQ7dvl8k0gLTQFhSqgYvJdxv5fbv1PEeEsnwuM=; b=XJ1km3+X4aoUJtrag4BwIR8FoE
	Fc2ImQZbuzYQRrJesguHmAcpdvuwIJCoKzw0CeennXFLZjFv20wotarp1QVg4Yw7YiiNLPLmanORM
	JJ6/Cpkps5yWw3EQG/y/1gbo/GYIwPqwD5YPzI8bwBOQ3aRbH0Zde5MZcSMc5UGmSTMvGLc/aeyIP
	QgOgGgVeVrgn6OXfjFUjNAsQUYuh5B8F+Q6rDm+ltmk41tUmJN6uxZzq4LkkgQQNkDOazoRStBRWt
	iFSGTwilLqf2CsxN7ozob2GOZw7LXVRtWoH4KED/hDSGFc8VsFsciQD+iXjHTL7CyzUEtvbK4sbZU
	fz0G5AtA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BzL-00000007N4J-2Hz6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:44:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFE141476;
	Mon, 16 Mar 2026 10:44:14 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D86373F73B;
	Mon, 16 Mar 2026 10:44:17 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:44:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 04/30] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
Message-ID: <abhBb7HbMg3BC09D@arm.com>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-4-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-4-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_174423_769420_61E03AFB 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, Mar 06, 2026 at 05:00:56PM +0000, Mark Brown wrote:
> As with SVE we can only virtualise SME vector lengths that are supported by
> all CPUs in the system, implement similar checks to those for SVE. Since
> unlike SVE there are no specific vector lengths that are architecturally
> required the handling is subtly different, we report a system where this
> happens with a maximum vector length of SME_VQ_INVALID.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

