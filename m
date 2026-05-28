Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F96DCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9t47wUhCNNof8aIgbegXoRABZWz8Z8Ikx0BlTL06w04=; b=y0Odri4Q2NRZOW2bB3ud3irqI2
	1rvd2qJlnbSde1ElkUOEklTAxs9DhcuJemlLW+6PWTnyj5iTdzAQLYCgVfVfSm2LmYX8DdLJ/siBB
	UdoDqSD3rspYc0DZnV7vX1+0SNZVLfG3YAHsIB4pgu0Uf8BM8Q0JxRy6JPL50DPirZRCc1joU6ZMK
	E6CcDkWb8pRK7IcrqO5FifT9+h6Pqm/qhyKj6RhgH0vVbnhDhQzpANg2TQoJe3VzsD9q5eEUd91uP
	9qC8HPxv+iEkP5+wSAFf1po2QTrfDk9zj4iCf5Lj7gNeOfYR3FIA8z0WPz4xjjGdQOOYZhm4YiYhS
	ZajSpjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYQa-00000005cck-1LaD;
	Thu, 28 May 2026 10:57:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYQR-00000005cad-1PSe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:57:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CA1E60514;
	Thu, 28 May 2026 10:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4F91F00A3A;
	Thu, 28 May 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779965837;
	bh=9t47wUhCNNof8aIgbegXoRABZWz8Z8Ikx0BlTL06w04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nStxKLPl63L6txLgSYbTP+sOuHvI+kfP4z6UbWYSPsJiSfxZMp2fNjGO5veO3PSyo
	 XeAkphExoRlXnntuA242D+FvvTCptu2kcSVlvva7ZDH4MV5P3ztKptQgCa/FL6B5if
	 cirwL7QynGJXY/G62g/d1EG9G3So7jS9zOYQUCbmVqrLs8A40Q6rRH19sgPaz/3Zcx
	 q7ouVtdEXPYO7PD8HTwEQTg9eCt1fYAFIDaJLjXuCFz7a8kE576HMcFPCiajjQjn9Q
	 dpMV7Whlh7a5NK8++ip7Q3JtiVWjIePswSym8XYSZfIRoUm1FFNpjR29dQPt6HGdx4
	 gT0RICPCX8GPQ==
Date: Thu, 28 May 2026 11:57:12 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] arm64: hw_breakpoint: Disallow breakpoints in no
 kprobe code
Message-ID: <ahgfiNTct7d4dLPL@willie-the-truck>
References: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
 <20260407-arm-debug-8-9-v4-1-a4864e69b0ea@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-arm-debug-8-9-v4-1-a4864e69b0ea@kernel.org>
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

On Tue, Apr 07, 2026 at 09:29:43AM -0500, Rob Herring (Arm) wrote:
> Taking debug exceptions while manipulating the breakpoints is likely to
> be unsafe. The setting kprobes in the breakpoint code is already
> forbidden, but the setting of h/w breakpoints is not. Copy what x86 does
> and exclude breakpoints that fall within the kprobe section.

It would be good to spell this out a little more clearly, as "likely to
be unsafe" is very vague. There's also plenty of breakpoint handling
code outside of the arch backend (e.g. in kernel/events/) which doesn't
seem to be in the no-kprobes section, so it's not clear why that's ok.

Will

