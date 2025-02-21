Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6D3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6QZkoQz99ku1qUbiKn6ZpRq26MJicyjldUn87JLXdV8=; b=XG6FebceTKLlfKhVThK8rsaMF6
	9jR869ey2A8Cpgubr6xq0s2FuO/0eE9ME7X1Xt3p6rijYrs4U+j96rzZqpyfPuyTjcdYwa8Vj8RGv
	ar92O6JhOOQf9z1j6c5JfgOnku7EPOMVpccLkT9lgQe3NlWyA2GaXLYtQbXHfebLmA6Bl2H3WFNua
	UmvvErXp6uQOrejc0UIUQ+FRVyHZDFdE5nCOg4Xj9eFAc2UigktRNJfbJ25r/75M+PfbgD5HyI7CN
	HsbpMFRf9CEZuDQoMhEiihAjIiHtMU24bMhAJuAlem27SngMw5bCDW2RoYWM5tUleoKX0/YmuJ6dO
	TmGadaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPdF-000000050LK-0nPv;
	Fri, 21 Feb 2025 09:47:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPPc-00000004wvm-3Eqy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B643E5C0746;
	Fri, 21 Feb 2025 09:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F38C4CED6;
	Fri, 21 Feb 2025 09:33:34 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/2] kselftest/arm64: mte: Minor fixes to the MTE hugetlb test
Date: Fri, 21 Feb 2025 09:33:29 +0000
Message-Id: <20250221093331.2184245-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_013336_863600_62A0891D 
X-CRM114-Status: UNSURE (   7.36  )
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

The first patch makes use of the correct terminology for synchronous and
asynchronous errors. The second patch checks whether PROT_MTE is
supported on hugetlb mappings before continuing with the tests. Such
support was added in 6.13 but people tend to use current kselftests on
older kernels. Avoid the failure reporting on such kernels, just skip
the tests.

Catalin Marinas (2):
  kselftest/arm64: mte: Use the correct naming for tag check modes in
    check_hugetlb_options.c
  kselftest/arm64: mte: Skip the hugetlb tests if MTE not supported on
    such mappings

 .../arm64/mte/check_hugetlb_options.c         | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)


