Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D11CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOK8ZF/SieMrVAtGUmxCTagMAfTXmEpQ6NPVuM8kvNw=; b=NH9IX15QMvQWz+ZgYR3Jc6HnV1
	wPECwfySQZeCWyr/g0tuLvh/eSunZ4gFZ2M8rTdm6BDqoolZfc+gQdPBbwCu5QA3OuMKkF0vB3zbq
	Meb4Lg9TTPbuO0AT6jrvGmDWn8ZqixizPk1s3pbWlOQFsKZBgtZDaG+rHKCTv5FeOgjtiZGDFhBRS
	9I7nnvvk+vCNx5Q/jphvxFZxn3xFu1pvM7yHoHMW9EtYm0WGBprh1ns9IXeNjlGx4Un58NZ3Lxp+A
	33waYVW55VXo6JlXIrch/pxh/jOXb8KoGIGcgUIs155HC1rY6gHrcpaUKO01Mqz7BvbIES/lYZhBN
	qYWfbMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVQv-00000004S02-0Y5S;
	Thu, 30 Oct 2025 16:23:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVQo-00000004RyW-0lBc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:23:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A93F61FDE;
	Thu, 30 Oct 2025 16:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40339C4CEF8;
	Thu, 30 Oct 2025 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841401;
	bh=3mVsFGRun4oAv1HOPwIwD87Ig8SOJjYpKQmEns43giI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiBhWSPLCAflTXcjYiLkGgfxYC0FbDSyKDcmjufpBBBTgkzj48TmUwH88BC89j6ac
	 o0E9JagAXeECXemcuookI8berrAYWgUQVoXCpi2DbplEgmuhllFALmby5liZ9gsfm6
	 +C9kdgNU1wnrf6iwWgoVz/0rCZknIDHdUObAnlxTAXxh3c+UeAAkSuP4s2B2bkipqj
	 rRPIZVwmV8avDeeoqs1G+Rn/nVn6aDRMtvn6PCosvufatZgN25l5slp0DhyionzZfB
	 MloNM8tswWnBE2uzph0RfHjpZf+quZdttcxPTMTMwi4ht9hsmaEUdLMSpOhAnVzZZK
	 UKG7x9MJUrH9w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vEVQl-0000000139m-0ABi;
	Thu, 30 Oct 2025 16:23:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: oliver.upton@linux.dev,
	Maximilian Dittgen <mdittgen@amazon.de>
Cc: pbonzini@redhat.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	epetron@amazon.de,
	nh-open-source@amazon.com
Subject: Re: [PATCH v2] KVM: selftests: fix MAPC RDbase target formatting in vgic_lpi_stress
Date: Thu, 30 Oct 2025 16:23:16 +0000
Message-ID: <176184139607.2037623.16277571869059317798.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020145946.48288-1-mdittgen@amazon.de>
References: <20251020145946.48288-1-mdittgen@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, mdittgen@amazon.de, pbonzini@redhat.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, epetron@amazon.de, nh-open-source@amazon.com
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

On Mon, 20 Oct 2025 16:59:46 +0200, Maximilian Dittgen wrote:
> Since GITS_TYPER.PTA == 0, the ITS MAPC command demands a CPU ID,
> rather than a physical redistributor address, for its RDbase
> command argument.
> 
> As such, when MAPC-ing guest ITS collections, vgic_lpi_stress iterates
> over CPU IDs in the range [0, nr_cpus), passing them as the RDbase
> vcpu_id argument to its_send_mapc_cmd().
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: selftests: fix MAPC RDbase target formatting in vgic_lpi_stress
      commit: a24f7afce048e724be072bd063ed864f124daf81

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



