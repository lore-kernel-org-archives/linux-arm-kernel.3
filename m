Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5284AF30271
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ji/HiPx33LRvrrck2DevAZuVlZNRX98YJJjGEbG8cSA=; b=ggABKWkfXXYx6Z8Cqw0URtNqUf
	45+GWEbBG0bZGnKEqqOc3x8pQCObguq6VETyLPkEQ0HpU8MpjPPJiCY9/iyK3KQ7PQfQLtcqr+X+S
	4mpYB+Q5eXHY8YzEUXdgvvfN9PIQaFe6VjLImGG0WBfLxoIKWbnIttAUbhrOtYK/Bfy1nlGxwuBho
	HvVMEx5jIECHMYJqiruEizySuTDFml86RuT/fWlrNsUQaPIPJA3UJDF1jN79I9PXfotpvDRe+U8wZ
	kLi3LlMQxoNqqoUbLTyI/zDiB3AenHc9ziLG/Ip4BGJSH92t/MeMfpJXapmozMUCbORm6x8eWdn4x
	JMW2Ovog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1n8L-00000002gFp-438i;
	Sun, 15 Mar 2026 15:12:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1n8K-00000002gFW-0cCA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 15:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D41644067;
	Sun, 15 Mar 2026 15:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BC0C4CEF7;
	Sun, 15 Mar 2026 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773587519;
	bh=6jQp4ea3K3hRb3fhb0FEeSzMJUsm3BVSJ/Pao5wNtNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TuC6Tv/YRav5hWMQVY1n8ds6PVQRaEXmkqV5HnkMb8QUdDkq8pmhJCsS1yCSlufRT
	 eIpjCx/DsXjz+/a+3iO4DTVBbCj7zLlfS6zFzTYlicEiggh0w+615rb7lN2IaIPGl/
	 J2C2UqI2urx+SSaflRQI8y+g7nPPEu3cbi516dR3e+afM7vuRZfRzK5AwP7O5LqdfK
	 RjbaITlZ6qeFaboki++hc9GIYW1fCOImjAc3u7y5oBTdqH7XL8VGvEMb80f/I8eIkV
	 zR9UlU2386mCiJEfdxA1auuauhuGuQ4iI1qAnEQChOglz6dY/6IXwBm01ksLjmYaQm
	 1Tsaq+ByWMYLg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w1n8H-00000002AWr-0hpc;
	Sun, 15 Mar 2026 15:11:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Discard PC update state on vcpu reset
Date: Sun, 15 Mar 2026 15:11:53 +0000
Message-ID: <177358750718.974845.17608338527108220660.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312140850.822968-1-maz@kernel.org>
References: <20260312140850.822968-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_081200_206917_90D2C62C 
X-CRM114-Status: UNSURE (   9.35  )
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

On Thu, 12 Mar 2026 14:08:50 +0000, Marc Zyngier wrote:
> Our vcpu reset suffers from a particularly interesting flaw, as it
> does not correctly deal with state that will have an effect on the
> execution flow out of reset.
> 
> Take the following completely random example, never seen in the wild
> and that never resulted in a couple of sleepless nights: /s
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Discard PC update state on vcpu reset
      commit: 1744a6ef48b9a48f017e3e1a0d05de0a6978396e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



