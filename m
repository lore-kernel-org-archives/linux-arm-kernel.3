Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856D0CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6IuUeomUJ+xElwCKHJ7glDo97O3tRK8w2k/RM64XTA=; b=T0YhgJwnuX1J2hwxCQv8ru8ih0
	LZjLgGwTd64yzZtK2RVL+NfE55n2RH0PzVNOV/ak4gEdslYrGmavJZ6nfw/OlQ72TZuqyRt1x/9WO
	sqxFKT5ZouN+GBHZjjZD1RalMdiyh4u4WAvvMyW6QZJyqFNqtMTAeGlUKq9CXwZk3XkrL8Aaia+3f
	EYvgUpR5B4lzhTJl5uQdtH7DQNqUq4AB0RBpo9/5gfhO9dDrMdtaB4m+sJOC4VQBdDyqG9Nd3sNHa
	cGmvwFSguSebWQLD+PaYPwvg/iwIRfqVCaBMEQh1I7WLgjRgXVdnN3QkUJUgQ/wWzTLYv/P2OqK9r
	4ZdsDQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVRD-00000004S7K-30Qm;
	Thu, 30 Oct 2025 16:23:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVQz-00000004S1z-1JGw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9019620E0;
	Thu, 30 Oct 2025 16:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657FBC4CEF8;
	Thu, 30 Oct 2025 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841412;
	bh=lNYaB9TRi0xA6KdXoCxuUICxtxUxEpnWksgszaMGxN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkobSByQ/iNWh6Ap6EUP6UAu6lWYrlg57zvsDNoIlkT/q19oeG0Heu1irYWzv8TGU
	 CU+SyNzyvr+9rvIcFV4jw1vCqY6CPDJyI7qqIJCc2ZOETLdNG7+VBz6oAIatntra6w
	 VmdBZygS+J7TpbeK90Z5s7w0mHkM3VVIo94rnlWfY9UQC8CuhvEIQH/ifLDK3UwbM5
	 +hZP6mJnvmvDDpwZLwf93Y9AS3tYp3z8Pq76CukOB1lPZzsMoUirm4+Z776BQ/zV70
	 c4n2QYPTbrL3dSBCqf5TrSuoIcrORTNhEQOGr/R6UGBwP0oZxd+j4Lrxd+m3XQj6iy
	 pE8cynMQPQRrg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vEVQw-000000013AP-1hRB;
	Thu, 30 Oct 2025 16:23:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: selftests: Filter ZCR_EL2 in get-reg-list
Date: Thu, 30 Oct 2025 16:23:26 +0000
Message-ID: <176184140653.2037728.16270464384501479116.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251024-kvm-arm64-get-reg-list-zcr-el2-v1-1-0cd0ff75e22f@kernel.org>
References: <20251024-kvm-arm64-get-reg-list-zcr-el2-v1-1-0cd0ff75e22f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, pbonzini@redhat.com, shuah@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 24 Oct 2025 00:43:39 +0100, Mark Brown wrote:
> get-reg-list includes ZCR_EL2 in the list of EL2 registers that it looks
> for when NV is enabled but does not have any feature gate for this register,
> meaning that testing any combination of features that includes EL2 but does
> not include SVE will result in a test failure due to a missing register
> being reported:
> 
> | The following lines are missing registers:
> |
> |	ARM64_SYS_REG(3, 4, 1, 2, 0),
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: selftests: Filter ZCR_EL2 in get-reg-list
      commit: a186fbcfd845699d51809f7c7e54cf997fe32820

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



