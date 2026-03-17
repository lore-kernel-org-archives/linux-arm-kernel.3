Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAB8F3381E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7Mx6eeZpxXcv7YlSHdBrf+rst16QwTCw9p3ALVYP0g=; b=QYAZnjcw1SPkwNOsBQ0+bZ+2pJ
	gQ9ZjJva2AAqWu1CiO17C2B/J4lwryxJAFgvZBRvqjma3eKyQlX3FZybbOXzPn3nTgfLiMf3Pvd4T
	7E37llY9Psz24KaN3gOC3GdbkCEmVeEkOug9FDKXjwLoci0qo5F/7tM47CpIprgU+LviJFVny3VD1
	iysdKYyTa4rHxYA3+BdvN4A0WI5oG3wDs7/sq/+da4qEW4xX71wFeBYlXCZSC8KL1GlcKV3zFjvCp
	o6oAZwuy7HVuixG0zEJz73kf1CN0tAr8q7wjmczR5jgHDHrwt6O0CrhwIlv4DGoFqqzFm1vpNBsFD
	z+nW6FSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QYl-00000005qMj-0UEP;
	Tue, 17 Mar 2026 09:17:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QYj-00000005qLq-1EHf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w7Mx6eeZpxXcv7YlSHdBrf+rst16QwTCw9p3ALVYP0g=; b=LE55J+7UHbXfFuvN1WUj1k/I+1
	8OfO9USOTTCoSpAYgwa5+VZWPQ37E2MZrpYhq6laTgnBqGMc5EvCFhLaT9BV7bqzpsgf9dv4tNLNc
	yC10zGFGFSdFF0V+4IdZ7IkAyJC4o4dIyQhU5CWqT/xLcW6sbdf/fGs2X71TK9q3AHVvBDlZOL34h
	ntfMrV34qMBGr+tN9yTqXo+4VSMcRbs5Sgzhf/rEspvYChGPLOvKEteWlC9T1TUhIbo5zbMXT010p
	Y55eorS+KcQPn869tVotosZ5NnG0Sa0NffzedniKRgTWUtv+QzjeoRj7cT9OjM0VoLbD1C31wEvhZ
	Kqak9kqQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QYg-00000008VgD-01rc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DE17416B4;
	Tue, 17 Mar 2026 09:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757F6C19425;
	Tue, 17 Mar 2026 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739068;
	bh=2hcFEwJyOf2nX0PWgcKQNQ+3rAyX5VnYVAQvAbGsd9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qhFyvEGuenOqVw1VHqqeC5SSSe3R6FlXODXdhtr38NwdofspNKh9nLjJ+j6zrB+lg
	 n/bFUbN1ikYDYIbC78NUzI1FxPK3UMTMp1e5RM9f14hHrH0Q+eVfcXmyfreUOIq6lO
	 NhL/C4jns9d9/Ve00PzYF2rOIvQT+R5Ze7GDFKgWpxPzY+Bh1ujfgptYQ9hEPTh64p
	 4gqNWbSWMf98kJ7UpOv44U+9stN8ZxtJXX8O5I3WvgQSOfshqgLfgLig7BMuXM9SjE
	 JYjgncEp6HjqZ/dKhIpQMpytwMJWNby7aQ3xmH+h6Q4JQS2mo7JcXlX+BBx/TM12+q
	 +K4Z5FKJ+lXWQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2QYc-00000002kiZ-1IBN;
	Tue, 17 Mar 2026 09:17:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: avoid unused-variable warning
Date: Tue, 17 Mar 2026 09:17:43 +0000
Message-ID: <177373904370.1873870.10413529929219722866.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313094925.3749287-1-arnd@kernel.org>
References: <20260313094925.3749287-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, vdonnefort@google.com, arnd@kernel.org, arnd@arndb.de, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_091750_346506_7FFD5C42 
X-CRM114-Status: UNSURE (   9.08  )
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

On Fri, 13 Mar 2026 10:49:16 +0100, Arnd Bergmann wrote:
> The 'cpu' variable is only used inside of an #ifdef block and causes
> a warning if there is no user:
> 
> arch/arm64/kvm/hyp_trace.c: In function 'kvm_hyp_trace_init':
> arch/arm64/kvm/hyp_trace.c:422:13: error: unused variable 'cpu' [-Werror=unused-variable]
>   422 |         int cpu;
>       |             ^~~
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: avoid unused-variable warning
      commit: 8510d054b7e086a71a9191ac3399231290dfd272

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



