Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAD2CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttW88lm4M8gd/eKGnbYp6jsAU2Zg1ROE93ta8NSaUqk=; b=UyyEz23ucXwVXSWMzkZZM0zhlt
	QW07jqNcXGKBXhOJPK+nrUeYWtZhFtTtsl7G8wKOSi3ZV5hiKJ+r7xCQRshlsNrk7Rz+zgafonHC6
	VWEo4/vHk7Nh0BQBZBY4vjiiRI/6cuiaQnTAE2nE2QErp3wLt/AROr/TVG4nK8FQPlKYOxuZ4kA7M
	Vs7FMjkubTxDILBxv4XmcQ8qqv9LKlbCzBvnPqqDa5lysGeGVpJlFdfjesSGOjx50MWRUJeL7mtv9
	IZUh9h4tjTGUOcha3/YviYkgYwJmlHRwemUQG9t+R571whPzjXB9bijefqjo0QCORMiZ4LpKaysOz
	FRUR9Eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInR8-00000007ALm-2V66;
	Tue, 11 Nov 2025 12:25:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInR7-00000007ALc-1A08
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56D7161903;
	Tue, 11 Nov 2025 12:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A0BC4CEF5;
	Tue, 11 Nov 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762863924;
	bh=hdRYlFv1BM0TA2up7sgM34/8y2YohOBd/gO3L8ew3jA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tmkV+Cja1QetbgbcXSwPGo+AXobFQ2hnRYB7oMUWSFieS/C9bGof5wXdAvn5C76Nq
	 LmES90H2AqbidNC7tQzwJhTVkQZchlipjTxCUX7rL81I77FdTZvdhdmu/WQvLMIRq1
	 L1fNSmMjDIl/uYsLxz9uTrSJfXn4i+CBYzi0bvTp/Aee5SjbTBIFs9pl1MqFPWI6fC
	 beAy5HAcotUo7q1w+0Lcmk9ft9xgalvQehrjE+7sqcGz/qjih3fkP3ttgT+p+P0/zQ
	 EBgqxLpSN9eOIQD5+TwNMlsYdaLnvTKVQpBlAAfnIkT5qIHG/uD3OtAEiJPvWs69TU
	 23mgcMOjTk6pg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vInR3-00000004ED3-3brA;
	Tue, 11 Nov 2025 12:25:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Finalize ID registers only once per VM
Date: Tue, 11 Nov 2025 12:25:16 +0000
Message-ID: <176286391603.1927379.11875919783471032489.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251110173010.1918424-1-maz@kernel.org>
References: <20251110173010.1918424-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, broonie@kernel.org
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

On Mon, 10 Nov 2025 17:30:10 +0000, Marc Zyngier wrote:
> Owing to the ID registers being global to the VM, there is no point
> in computing them more than once.  However, recent changes making
> use of kvm_set_vm_id_reg() outlined that we repeatedly hammer
> the ID registers when we shouldn't.
> 
> Gate the ID reg update on the VM having never run.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Finalize ID registers only once per VM
      commit: 0f559cd91e37b7978e4198ca2fbf7eb95df11361

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



