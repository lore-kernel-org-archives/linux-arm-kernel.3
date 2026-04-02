Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA285D39422
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmkvCpP2a3UNCt3T71mo35xLnOMtFmcLyGF6ZcbgPnQ=; b=nt5zndSYka/FWlKqXVnV3HvV7G
	L/9QB8qHIg8dxs0au0LHODZ4vhy9EyQ7SfI9yEFdZwVlmaDDVEO9nBXIPLwYHTzskxOi+riKK8PP9
	I6zqvZgPAH/5MDRgUa2vvYZTKewkOJYZDnUCbwwvmhdFO1u4W63LyeyKLTQpGH+7IjhxWS+koR4/e
	mDCV1P5B6wLaRDFWMOQIa+hu8IjVDmadQza88+KMgsBUPER9oxAbjiyDJUPs4Nk6X3ZHECLPi29bp
	dnOR7tTKB0gZkRVMU/RgXYlBKSz7UgXWHXKTfk4lxzUWH41tehUrYVBTz2FRpqi/qfuGhm4GEBSR4
	oS/NUdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IEm-00000000C8N-40d2;
	Thu, 02 Apr 2026 13:37:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IEl-00000000C7z-1oYb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 13:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dmkvCpP2a3UNCt3T71mo35xLnOMtFmcLyGF6ZcbgPnQ=; b=d8XA7RYnobtTxJgtUpy1rpfCoq
	kxQr4lcC6mzFOK9tQWcqVuTT+s5jvtjwBtAUf8mxKYG+sWFEouL4YnnaN2zG3C73eoav+uJcG+JPa
	iJUSf2FupvVDk4V0X+vPtPgcgMH+0KYuqjyxaCnSgetCoLP6KotGenqUNajOAMII9GV9qv0j+ec8M
	mi/RFXpGRS5p3mS2czyRN7iS1CHqT50lTFvo3urIAYg3gtwupQIA8gJNuyMGIIqREeUeCPuHYzzY2
	kLh5VH6XhQjBC1kV14Tlf+fO5KWuhA2xHZ+sFuPghR41vvXg+/2j/ujMQEHVPoM/LxyQACAg4RBGf
	R7zlSCfQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IEi-00000002Z55-2l8N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F04064366B;
	Thu,  2 Apr 2026 13:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC369C116C6;
	Thu,  2 Apr 2026 13:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775137044;
	bh=zOLl2zJty3v/3SL++/5OhGWVR+MQwoy8O/9OeF3iLhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JWiykH+KnngwBxMMvwHVo54ng/SX4xFjoSNIDL1dbVb2mBcaFR3BK5KB2irAnW/4r
	 ivqHaM6wmllhW6UxJUZJEtD/C0hYKIbeHtDzXw8NVXnxVC2noc2gyiCdCROUADqo2b
	 ApmhdLms6RfiZw/iLWL3UmdoH5orkqczBz1ub8tu/a6ksVmWoQHG0lfH0YPdnoB/7z
	 eEI/puXtacydPFcjzmI0C/s8ZLq6vw70Gzoilww8s+0kBR8kcTdOesJUyQ6f/u7r7m
	 a101EgFqks3HOHXgIK/bdBaIRuYZ9ob2469ZCkapI6Pe/06u/gVvBckNgrGzpZigN9
	 Z+Mk4TReMe6vg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w8IEc-00000008H22-2YVF;
	Thu, 02 Apr 2026 13:37:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com,
	broonie@kernel.org,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH] KVM: arm64: vgic-v5: Fold PPI state for all exposed PPIs
Date: Thu,  2 Apr 2026 14:37:19 +0100
Message-ID: <177513703760.453570.13515415348349688517.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401162152.932243-1-sascha.bischoff@arm.com>
References: <20260401162152.932243-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, Sascha.Bischoff@arm.com, nd@arm.com, Joey.Gouly@arm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com, broonie@kernel.org, oupton@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_143728_895629_4A59938C 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, 01 Apr 2026 16:21:57 +0000, Sascha Bischoff wrote:
> GICv5 supports up to 128 PPIs, which would introduce a large amount of
> overhead if all of them were actively tracked. Rather than keeping
> track of all 128 potential PPIs, we instead only consider the set of
> architected PPIs (the first 64). Moreover, we further reduce that set
> by only exposing a subset of the PPIs to a guest. In practice, this
> means that only 4 PPIs are typically exposed to a guest - the SW_PPI,
> PMUIRQ, and the timers.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic-v5: Fold PPI state for all exposed PPIs
      commit: 9c1ac77ddfc90b6292ef63a4fa5ab6f9e4b29981

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



