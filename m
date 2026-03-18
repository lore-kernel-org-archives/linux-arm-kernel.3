Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD0110775FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D43/zhvUOgAoLpNpme/Kxu13Jzv63qK/Oyu1yLjp/A0=; b=ACDafqlPZm8roIm7omUYHreK8e
	Ystn05+ooiv/45SvHUk5+9P4LKEvGHXB/3nayVJe2GgwJCsNlh7G1x7JifLAEI+zY4kNtUxcAb4u0
	B5W3XGLkFyiOO8VsQyIW1jTtlQqXtQ5uAeXaCUYGY8i7qgDqKIUcxYK9fbjFD6vKGFInuUA/tFByt
	CjvsM35N8KLQDriKDXtPLIzevmnWost61m/FI3lzP284yYcd2vY7d1nXoCG3dtFmKkMFbY5o8oz+Z
	xKiU0KFfkxgo5fWtTgDj6qLwXnnO5EfRZ+2eZSVIakkEU3MtDseUaQMCWs/WRjEe3dE3nWCf1KD2d
	kELBkWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v6H-0000000981b-0XeM;
	Wed, 18 Mar 2026 17:54:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v6E-00000009811-3lU4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:54:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6300E442F5;
	Wed, 18 Mar 2026 17:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8CCC19421;
	Wed, 18 Mar 2026 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856470;
	bh=+m5vnfAODYCyWjrqQrLd5vT4BlnOmJEpTCTU2aZfT9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/BoreZdVnqsrVWBwMBkI9I4X6O9EBpAiG4YvaVjSHEwR9RpjQ3lXv1VfNRHR1TnJ
	 n4WnTMiYAE7IIwIqONzVShWf/LfjZwxtlUNb71eV38iDZXkrWVkEmG1PgENrcSRAiI
	 7i3KFNKBTkY/1Ar/P6MM1OEG1Uk5vVJinP/w8LzbAu+quj/JFPmG4ca62TaUG3uL+m
	 V61FOabdtsrO62978MAEL0RK8bgF6Z3L7gy9fjz7otdzxmBBXhFLO6ZlV5s1ZdZGLL
	 p3VsACkBOZqhKyxlBLxAR1+7OX4Y49J+UB9BnsC/PTrvW+hDnsdiL2XR/008HZkZQl
	 MiDk/Kv8QoEkg==
Date: Wed, 18 Mar 2026 17:54:42 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH v10 15/30] KVM: arm64: Support SME control registers
Message-ID: <20260318175442.GM2390801@myrica>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-15-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-15-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_105430_972347_DEE292F1 
X-CRM114-Status: UNSURE (   9.62  )
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

On Fri, Mar 06, 2026 at 05:01:07PM +0000, Mark Brown wrote:
> SME is configured by the system registers SMCR_EL1 and SMCR_EL2, add
> definitions and userspace access for them.  These control the SME vector
> length in a manner similar to that for SVE and also have feature enable
> bits for SME2 and FA64.  A subsequent patch will add management of them
> for guests as part of the general floating point context switch, as is
> done for the equivalent SVE registers.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Looks correct, but I think we also need locate_direct_register(),
read_sr_from_cpu() and write_sr_to_cpu() now?

Thanks,
Jean


