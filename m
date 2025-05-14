Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6082C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CR2ZXenoxWCZFBOd+n+M3JOTsCVcCZW/A24+saUigk=; b=n9jm3GyW5zcdEx0jDjmcYcqEEf
	3pwYNkujkTYS3Rf5Oic8XbISZDqjAUvfgh+PTCoq/gGWIv7UFsTgzdmWmjqLyR+8ZS2XPmCrihJYd
	8asjpRql21F5cmLpbHaqIFCmYR4bk/4deQU/9W/fGQVlFaNKaQDiISLuKfUEVQ1X9QV1n7BSKvSwm
	tu1A9wgGIlFJtAYIElwBdFHZvQVKMdDsWAhE7pnJugka2v8Eb+H+jPbsp6MT1/H/J/vU19bTuzbqc
	Xz/WjxIYqJSfmIeSfrotzVXleSs4UPKCzl+a4fP7J9rj3P7BXzTJbW9U2gXzMbOBy4aEl2zUI0ZAy
	yyPT8xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXf-0000000FGns-02MB;
	Wed, 14 May 2025 13:53:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8iR-0000000EiK5-2vk1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 09:47:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7F7B5C5E81;
	Wed, 14 May 2025 09:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6073C4CEE9;
	Wed, 14 May 2025 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747216074;
	bh=TG0IqLi9AgL0Uh4OwoVqyFUkBSVCDzsr00L7JqscPGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BKJ/NDQPzgPL2kV4gUS/qrUj3/e/JZ7/nyykwXtI6FqNNyNXs935nu4z/ooJg3J5c
	 tEBCioUOB9edyD7uC3jIWaeWbbijfow+7XjykDk93CGOEpEizatuq2nl8r+xxbSUSW
	 YYZ5EY8e812ArH0NDML5JRrwOEuwLTG292L352l0uivzM0TmE7goUKA+8+MWrdYSsL
	 PUgOjzCTnK4g2pHVQnwTEx8eoXNLQU5bYPoOXkHdK1oQuePJ7WG7fj7+PGdElKN8zJ
	 B8J6oeAHKEp9Kr2d34DMtyG3vR0DsfplHKVpVe1tS6zFBJ/y7zs7DkxkoKW+JgLsr3
	 l983tbEQPg8ng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uF8iO-00Eo8b-Pz;
	Wed, 14 May 2025 10:47:52 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Address Translation fixes
Date: Wed, 14 May 2025 10:47:48 +0100
Message-Id: <174721605556.2224247.6675762921692651616.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250422122612.2675672-1-maz@kernel.org>
References: <20250422122612.2675672-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, scott@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_024755_779511_C002071F 
X-CRM114-Status: GOOD (  10.93  )
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

On Tue, 22 Apr 2025 13:26:09 +0100, Marc Zyngier wrote:
> Here's a small series of fixes for KVM's implementation of address
> translation (aka the AT S1* instructions), addressing a number of
> issues in increasing levels of severity:
> 
> - We misreport PAR_EL1.PTW in a number of occasions, including state
>   that is not possible as per the architecture definition
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Fix PAR_EL1.{PTW,S} reporting on AT S1E*
      commit: 493b01de726d02e835c510d01df6880fa28d41b7
[2/3] KVM: arm64: Teach address translation about access faults
      commit: ed648ab8043aab3135490d6c01f1c889c4bac62c
[3/3] KVM: arm64: Don't feed uninitialised data to HCR_EL2
      commit: 3e4d597220587593dba505f5a7e932309155c54d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



