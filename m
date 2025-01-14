Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36DFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddeQCvQpSMAJhfvi2BOutn/rnBBVrWvKOGilaDU0tfw=; b=V/4O7S148DFWurZZEid10Wze32
	CTkMyjbEzmtskMbQ3IXQbIVitJ8CVdlGwz+RaiaQtWM/bu3acMpiCMLaIsCbRWb1Uluod60CTp+ju
	1mM/f3x2A2NTaeXG+ri/FzKp8ohp3PWg3tmVYxU1kT24WGyBdrPsBR2EXNUfsBN1cKd52DCdJISGK
	WWh42QhXUYhRd4F+h4OVsYu7DdoQ3/fhUlbfMAq0LbbI/vyaT56vCx8obB9gxO+EIQS47p0FAAczQ
	c1THCMvl0yE2Y+ee1T0xx4wz7+dTmOKeQC1HCEOU8aMpr9qAlaLztAMcBGOSKH79vir620QQHJKQ+
	hFna/yLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfGD-00000008HO6-2gLE;
	Tue, 14 Jan 2025 11:39:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfEy-00000008HGN-3B66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 228385C4B7B;
	Tue, 14 Jan 2025 11:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D86CC4CEDD;
	Tue, 14 Jan 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736854667;
	bh=LCU2BqrkYnMixzNGqgtubf2sA3LVBqm5Sym2l2hLSbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=piXy+fmxJ9AqbQmmPbVJUBW7zZCQU9MOu0QYpes6k3T7aynJbQxQ/qLF8GL2goH9i
	 oAeTg0zROrvMjRJYFg6y0cor7koLv634jCRK4bX+S9YcOQH0eWwAnpO9HjjVa3tO+P
	 jPuFArGtrRH9JNW7BuaUvlAYlVzHuPjCy2b4J6eZAOEvIXeIboo8FqwH5iFUccBqJ7
	 QgCsKqitUqOa39Kc2MddO/U+nVayinfyajuN+kddnklCH7ueNcUS+gUdOyQJ6Pp4Ly
	 kZ+U4An3H46QJoFZfwOaAcLFgQs7PwB0MocrxQgS98X2AJPr1hrLEm0eStfZM4LFD/
	 +t4cbH3MP8pDA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tXfEv-00C6r6-9b;
	Tue, 14 Jan 2025 11:37:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/2] KVM: arm64: nv: Fix sysreg RESx-ication
Date: Tue, 14 Jan 2025 11:37:41 +0000
Message-Id: <173685465356.1386682.11809569175289871162.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112165029.1181056-1-maz@kernel.org>
References: <20250112165029.1181056-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_033748_832745_4C199375 
X-CRM114-Status: GOOD (  10.44  )
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

On Sun, 12 Jan 2025 16:50:27 +0000, Marc Zyngier wrote:
> Joey recently reported that some rather basic tests were failing on
> NV, and managed to track it down to critical register fields (such as
> HCR_EL2.E2H) not having their expect value.
> 
> Further investigation has outlined a couple of critical issues:
> 
> - Evaluating HCR_EL2.E2H must always be done with a sanitising
>   accessor, no ifs, no buts. Given that KVM assumes a fixed value for
>   this bit, we cannot leave it to the guest to mess with.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: nv: Always evaluate HCR_EL2 using sanitising accessors
      commit: c139b6d1b4d27724987af5071177fb5f3d60c1e4
[2/2] KVM: arm64: nv: Apply RESx settings to sysreg reset values
      commit: 36f998de853cfad60508dfdfb41c9c40a2245f19

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



