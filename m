Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04913C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTC4XpI//h0XnmIXXaWiuN+B6ESLOrUKksA1fAD5EdQ=; b=sEUOdqQLE2W3Eua5qPD3RWzlbc
	cFO9glQTwk+fBkj9afqik9sdkKqZKFcJsuhWwFtdh9bslu+aM384L9YhYPFQNNCHwe0TSgJWjaZxg
	KCRPsDvtx1p0BKOSsEBe8JPXfWGUdKYtC+qAz3s1g7PILWOlKkQCFty84dfIbwa8XvJjzi1aMdtlw
	m9uQzKK6qz5aHJ3Sd0M6y8U0fKWL0qqjL+VJF+J2w5cV2/J11sSahPbFM+GqmSrX7+wppQW3atfJd
	NSXF0mR++Yvt+syPCLxJ4baj0es4deoig3SHVMkWWcVAMbWZbj67RvUzyI3iSZI6f17rXrI/fRK5q
	lcfg6s8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tputw-000000099OJ-2OeH;
	Wed, 05 Mar 2025 19:59:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuQA-000000094Nk-26Yx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8931A460F5;
	Wed,  5 Mar 2025 19:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0237EC4CEE8;
	Wed,  5 Mar 2025 19:28:43 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/2] kselftest/arm64: mte: Minor fixes to the MTE hugetlb test
Date: Wed,  5 Mar 2025 19:28:41 +0000
Message-Id: <174120291692.1422545.4418874969040688067.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221093331.2184245-1-catalin.marinas@arm.com>
References: <20250221093331.2184245-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_112846_610273_2EEBE437 
X-CRM114-Status: GOOD (  10.57  )
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

On Fri, 21 Feb 2025 09:33:29 +0000, Catalin Marinas wrote:
> The first patch makes use of the correct terminology for synchronous and
> asynchronous errors. The second patch checks whether PROT_MTE is
> supported on hugetlb mappings before continuing with the tests. Such
> support was added in 6.13 but people tend to use current kselftests on
> older kernels. Avoid the failure reporting on such kernels, just skip
> the tests.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/2] kselftest/arm64: mte: Use the correct naming for tag check modes in check_hugetlb_options.c
      https://git.kernel.org/arm64/c/7ae95109c64d
[2/2] kselftest/arm64: mte: Skip the hugetlb tests if MTE not supported on such mappings
      https://git.kernel.org/arm64/c/306219d59b72

-- 
Catalin


