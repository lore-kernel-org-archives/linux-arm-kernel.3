Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B959AC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsVXx4T/Wzy/6XSGD+DUILQk3DAKIHtyfSqqCGTBTk0=; b=Y08BRXBU+3grmBUHZ4jrk86vTC
	YAJ7WuvnOj7HXtnvk3ARoeb/0/Wt+N9v0sdcPSpjsHkAmeg1a3aUJbwR/095YvJcJjiZlk800M+jF
	5H53xCcN86cG2Dzorzo7K4hYGihmTXdfLdXIwkRls4y5WFl8EvnemH/n1T2H+CfasaQDsbZq4xy1x
	NrCfw147qZpEbbbS9ePeQBpap3IMPGbpdkDtRjYN7xDsOwd9UksCknXa60EsITKcUau5ygsWyWaf1
	qv8CIKW0e/zSuzLYyy0iJH3s7x9/E+StPt6satb3FyvmimPAjKcF9CrRM15NvKA6zBOSztJSXhSfE
	1dol6Wyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueADb-000000029it-3OZ2;
	Tue, 22 Jul 2025 10:27:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9xW-000000027cB-2R6q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4DB25C53B6;
	Tue, 22 Jul 2025 10:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48B2C4CEEB;
	Tue, 22 Jul 2025 10:10:51 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] kselftest/arm64: Fixes for fp-ptrace on SME only systems
Date: Tue, 22 Jul 2025 11:10:49 +0100
Message-Id: <175317903265.3058188.4852096181091664179.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
References: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_031054_659744_68BCAA33 
X-CRM114-Status: GOOD (  11.45  )
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

On Fri, 18 Jul 2025 23:14:49 +0100, Mark Brown wrote:
> When testing SME only systems I noticed that fp-ptrace does not cope at
> all well with them, this series fixes the major issues so that the test
> program completes successfully.  The reason I was looking at this is
> that following the recent round of fixes to ptrace we do not currently
> offer any mechanism for disabling streaming mode via ptrace, this series
> brings the program to a point where it tests the currently implemented
> ABI.  A further series allowing the disabling of streaming mode via
> ptrace will follow.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/3] kselftest/arm64: Test SME on SME only systems in fp-ptrace
      https://git.kernel.org/arm64/c/b021f45d39f3
[2/3] kselftest/arm64: Fix SVE write data generation for SME only systems
      https://git.kernel.org/arm64/c/aa7d3c8bc27d
[3/3] kselftest/arm64: Handle attempts to disable SM on SME only systems
      https://git.kernel.org/arm64/c/4752dcc156f2

-- 
Catalin


