Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDCECD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTIptt7XS14MsYfI5r7PxXNAc/CDaEraJlZvDtwwujE=; b=gaIWyNlYZySutU9xabYwXpoE/1
	uEuA1vrb2N9TQWMTQuUP4jvwAO8BZZ9YJaMpP+iDVyKvybf2KxPoCmpLoyjXVVZCxGOt8PnXDoOAg
	S2iiOfOq36emZ2OHIpOnwAXX6OeWlGIMijsvus7eFhzBqzhnjp6h2QuvT9rIE6+j6+mcVpX2JtX3g
	cZxqo0nzW0pyaOaHsGwhEp3ClZz+OaLCrH317fQMZrav/OacRk0YKpIAK0JQ9RqdPOexPtfwgAhZI
	st33WOc2NcW6E5qZ/jFtESL40rOf1zH07wkRomMvVsPRY8qqHP4uO6fA1ITr2fGZev9/ljwIZgnkB
	Sa30n4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFJd-00000004Imz-1Mur;
	Wed, 27 May 2026 14:33:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFJb-00000004ImV-0osh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:33:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E42F40A69;
	Wed, 27 May 2026 14:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDDE1F000E9;
	Wed, 27 May 2026 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779892378;
	bh=CTIptt7XS14MsYfI5r7PxXNAc/CDaEraJlZvDtwwujE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L2EtctAwbFGwBqyKO8MYKINqGVrUo633C9zq/bNzkWZ3GtdNX52VxNvkoYKQnYipd
	 jBonxge68TkMJqZVteDxUQuaZF3F0Izje54wFy7Yj9xsEYsCN11rPFFgHD2lNZf6QB
	 XJNxfKJmshxJIdHbRLWcboQWgXwIdHaSDvB/JjDq5ubcBPXDz0so9Qwe23oNyCTV9O
	 D4kVfgXS0IvM+TWZCFGjgET3HaalRuY8bzorTQ2LOBlsORjtAEb2zZD9Bq43jeVSd/
	 Fs9UXwibr25cw6RjxFocLiRGOMLo8jNcbqMRJQ/I+1AbgZh8sPp174RFWGV1C6skOs
	 uvG3Wyd6Eyfww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSFJY-00000006iFU-1t0D;
	Wed, 27 May 2026 14:32:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] KVM: arm64: Don't populate TPIDR_EL2 in finalise_el2()
Date: Wed, 27 May 2026 15:32:50 +0100
Message-ID: <177989236079.1515680.15500441600167629178.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518153127.6078-1-will@kernel.org>
References: <20260518153127.6078-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, will@kernel.org, linux-arm-kernel@lists.infradead.org, oupton@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_073259_262948_23DEF29E 
X-CRM114-Status: GOOD (  12.45  )
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

On Mon, 18 May 2026 16:31:26 +0100, Will Deacon wrote:
> Currently, it is not necessary for __finalise_el2() to configure
> TPIDR_EL2:
> 
> * The hyp stub code does not consume the value of TPIDR_EL2.
> 
> * On the boot cpu, TPIDR_EL1 is used for the percpu offset until the
>   ARM64_HAS_VIRT_HOST_EXTN cpucap is detected and boot alternatives
>   are patched. Before boot alternatives are patched,
>   cpu_copy_el2regs() will copy TPIDR_EL1 into TPIDR_EL2. It is not
>   necessary for __finalise_el2() to initialise TPIDR_EL2 before this.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Don't populate TPIDR_EL2 in finalise_el2()
      commit: 4cceeb8da363ac5127b147ee7345104743f53e9d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



