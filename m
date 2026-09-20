Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394BBC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffK5pX2P4j5nnWE22zdQRvv3PmDqc/mpfQ0x6JR+bGY=; b=2NnAmQL7pXEOM1C0g5MjOVjLzF
	3GPRXOvZ8/ls4AHUlj/LrpyWzYVNvmYQ2EmWwx2OAX3kh3FQZzoU6EDpW4LyCoxEu961st4JBbpQA
	TgA1ILLkB6B+l9zQhVAUIfSM19x98fj6E0S9Y0HSJFH5VdPjY0JqJvYVNDZ48hmMdu70AcJThAs1L
	3bBoDr5+lGy5ubx0Q0DUnLMwwGTHb3tjsQpJSLqFRgZCTP3cLDcm8ZPHuPVmIAYNRkkhCurWiHf4N
	JPBue6rhKtdLkZU5a4sm5H5Da8sGssst7aom7UK3GdVE+sMA4/0/NSKuR2jynhjf4j4pMvhmxV5oo
	X8QI0A7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CbT-0000000H5Hy-3BWf;
	Sun, 20 Sep 2026 08:08:51 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CbQ-0000000H5HU-2T0x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 08:08:50 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 8514B1D00126;
	Sun, 20 Sep 2026 04:08:43 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 20 Sep 2026 04:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789891722;
	 x=1789978122; bh=ffK5pX2P4j5nnWE22zdQRvv3PmDqc/mpfQ0x6JR+bGY=; b=
	hiOdau3tJseanN9UGeT/hyopDUq909AEOSOO0qPPRfdWa7ROAcZutz1If4WaqCrg
	E2fY8hEw3Oe/q5HR6G5ut1TcSePahiSlpZCrdfvutF4q0rlp0cOpcEO+gu/07PwR
	Yr3tMaxtlZwwdVur6ZU1xN4G6cBTdyBkBz5/Asz7xUPH1EVn+pWRV9yYvaXyihCY
	k6wj8/fGe1ScY2eg8P9gxT6tfYLbC86rnRPQm/t6t0ZvkS4Xgf2BPV+TG+dIl7ZD
	0l752YAEVxjF5eDWcVfEqVuS60TPneTZk8BPrISlKJHyGqPyEJzF8rcFikVoyiCE
	L4duObt5n39aUjmsbBjWRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789891722; x=
	1789978122; bh=ffK5pX2P4j5nnWE22zdQRvv3PmDqc/mpfQ0x6JR+bGY=; b=n
	7DryOvczrfjQJfyMjLdHexgunoqVHlFk818jo9uvn7uY8/OKoGmdHB+VqS1/oGQ2
	PkxX76Yo+wJopHViGDVITykPDP03EH9A+kC3+KKc1M06eBWA211/LOJSNzQjxfhn
	sYvtVffuSaY1jwUZlP7vXcl0V62hA/0WCji8BpItIkz7uCBlpzUUeuj72y/+nXeo
	adr1mo5fKDbPkAMfnq2HoSaNBv38OhopPcg8+KC2jWK68kLjKEMaaWkmN4GCpVEL
	KczxxJOlMlazVCTLtvdgyvsDw7hkCeb6clIFdDKWg3nHMZm6fM4kXlKA0prKHQBj
	ZVZ+G6NCnhnSyjwLQLUTQ==
X-ME-Sender: <xms:hpSvapdlT71GeQBqPZSRYIB-xqGX-MDxrSdXHyiI2C0qX_fQviH-7g>
    <xme:hpSvaiC_1mTNKngEjzU7Lcg-GyPS40THRpLJku8n4LU33rUSgvjP6j90SgMeJOR7V
    D6qNqvkpt-98xih0uPef4y90uqtKI1U4Gkvgnh13EF_k0nnvPJ_0dIp>
X-ME-Proxy-Cause: dmFkZTEApUgzq5R1VaYiB8MFrbvSFPa+DmFBNJpZek7io0x5WLEWe09xu+8zMYW6sFCQ6g
    nFVK5n2aPOk/a2gPj9tQY8VwDW1SIxgI3P6nBkQQc5DVUsmNCfGC0mopPl+MAbInY/3Gkh
    j0YtB97ONIuFQCUaey1rx+FiG/uJeaWXejjymul3jWj4pBlVuIMlWQdgSoJPwcDLbOYrKb
    W/TUNj2FtkB9gyurLT0GrvyXlRYrCoh/uwO0BS4Zri5uB5QIp4yj3SooL+cOHjgjKQtcMb
    9d2HJzy4fsnlbbhKt93gcSZtTjLDkhxZF51yQ0w3XOdLj0F6NFL22MAcr4JWdAfCLplyZW
    wWEqAWjMEfytO0Rh/kapbNPVE6WW1ip4gAliOVTuKEHbZzcoL/5evojz+9Qh7xQcL9UR3t
    BTALAIap1b6rOxA1GFZ9VmqBCQ3HHtwHIqukmmoj/8B+LGZzvhY37xLsqw92RWKz6+KIIz
    rwpzlaKV6FBvN/ZqqZfR84PjC4aL0RhSnS0piZFdQcz6dSqy62In/l+E285g//lDNsAyMs
    yB/XXat3PiOZzNjjjVCvum/qgj7SsL9E8sqNOFaEL3eclFuefgBFBqWh5o4tPIcHzZjk7d
    5Z/1IXBALmuFtxnUuSKpWU7T4GfDqAweCSuLQhkTBK1TStxGrds+bVLejX+Q
X-ME-Proxy: <xmx:iJSvako9_b5zIahQiQuDfJiiV9qyxcKyWlq2W4-9Yak0cCAqD9u06Q>
    <xmx:iJSvavDNbEvGcXrj7dWmpDLHMTtiFYNyky5vuEWf57ob7KBcgNe4RA>
    <xmx:iJSvanGMRwr1-DZAYDSpJrElc37hW4YlZ35jhwHMQX2f5IVsFQBVPg>
    <xmx:iJSvap3oWmXMTDesGRyMGSctsWmhFDDHh-t7ldvXZIMOviM0fXSEHg>
    <xmx:ipSvauadPHzJOlhh6ASLyqa4GQbzyYwg_SC3148ZXvchP1L6KWNPTCv3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9F89132A0087; Sun, 20 Sep 2026 04:08:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AzgOxjlYMeWB
Date: Sun, 20 Sep 2026 10:08:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <qingfang.deng@linux.dev>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Vikram Sethi" <vsethi@nvidia.com>, "Mike Rapoport" <rppt@kernel.org>,
 "Shanker Donthineni" <sdonthineni@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-Arch <linux-arch@vger.kernel.org>
Message-Id: <5847c824-8d69-4d02-af2f-896bf47f0732@app.fastmail.com>
In-Reply-To: <20260920014357.7069-3-qingfang.deng@linux.dev>
References: <20260920014357.7069-1-qingfang.deng@linux.dev>
 <20260920014357.7069-3-qingfang.deng@linux.dev>
Subject: Re: [PATCH v2 3/3] arm64: use generic MMIO accessors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_010849_094321_C0F9DD62 
X-CRM114-Status: UNSURE (   8.62  )
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

On Sun, Sep 20, 2026, at 03:43, Qingfang Deng wrote:
> Use the generic raw write accessors in place of the inline assembly
> stores. Include asm-generic/mmio.h after the arm64 ordering hooks so
> these accessors are also available to the write-combining helpers
> before asm-generic/io.h is included.
>
> Retain the raw read overrides when either the Cortex-A57 erratum 832075
> or NVIDIA Olympus erratum 1027 workaround is configured. This preserves
> the alternative-patched load-acquire instructions and pre-load barriers.
> Use generic raw reads when neither workaround is enabled.
>
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>

Sorry, this is no good, we need the compiler to issue the exact
instructions from the inline asm here, both in order to guarantee
these can be virtualized, and to prevent it from splitting up
larger register accesses into byte load/store on unaligned pointers.

     Arnd

