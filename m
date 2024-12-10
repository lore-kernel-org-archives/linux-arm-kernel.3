Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA09E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jt4ObXFeKaTPtebjB43oDmCQ3IG87iutOYEfC+fEAUI=; b=BD7lhpXJdtn10s6MYqUEkwiMSs
	guQbwD2eRUUsiJzXmFij3GC5bhMo6kqLmWX0nWjSBgDSSrtcAoJFEGiKgFQ+1yvXVLsj1npH2kBW0
	GgOr7wl+ywqpuIzRMPWMZnbiOVEMiJYeuW3DQEldbBsGkt/No1EHCBkxW80atTuu19CHXI8qS+XJA
	U1KR9dAN3naqnqCrG8Zw1o02xMvDA7JBO3S7KgNUyk3j6twHzljcGomk1kuvarPseYH6lURdBGqp1
	+JPfa05N41pgCvI2Pa7o2x79fbeeMY0ZTGk8CvGMML2qo9cv51Dl/ZyJTFWwESF+BPMQdtv0NI8Pk
	KLP1nz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL59a-0000000CQIO-1Vla;
	Tue, 10 Dec 2024 18:40:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54a-0000000CPLg-0Yow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 239E85C5CC0;
	Tue, 10 Dec 2024 18:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BF2C4CED6;
	Tue, 10 Dec 2024 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733855703;
	bh=KpNX0LGWmothl7OevAsTUynLiliavYKYsayyhEenfuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=da2UU67VP+hVbkEONEXmNgLdBCkho40CwdkbU828OMyjWTDFVPz7vskSB4T0y9DlP
	 wFopAwqyp8HHOgz1qxBYaJ6y8JzmIEEAstvY2TEFUIlyg4A5G4NVm11aV4Z/4rMESQ
	 hW80Pa0qum7q9EPK4RjV67yntZnv0VAjdH35YPEj53zcTbpQI9J5hXfGrJETPnArv3
	 3DsI066Fz6f9LmSsrdLg3Pvoca26drs4AC62ujKY9XG6I8xqHyoXiJfURcRB2VClpE
	 MnIhqDAgh4GhDMLZ6ZoBY7LPRUYye7gL+c4KR0ZyJD4VBJZJzPO4/KCJMNM4iLB8GX
	 ULwuJGlkqn4HQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: cpufeature: Add HAFT to cpucap_is_possible()
Date: Tue, 10 Dec 2024 18:34:46 +0000
Message-Id: <173383261011.2040857.1973906693856719881.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241209155948.2124393-1-mark.rutland@arm.com>
References: <20241209155948.2124393-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103504_210891_5B122948 
X-CRM114-Status: UNSURE (   8.15  )
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

On Mon, 09 Dec 2024 15:59:48 +0000, Mark Rutland wrote:
> For consistency with other cpucaps, handle the configuration check for
> ARM64_HAFT in cpucap_is_possible() rather than this being explicit in
> system_supports_haft(). The configuration check will now happen
> implicitly as cpus_have_final_cap() uses cpucap_is_possible() via
> alternative_has_cap_unlikely().
> 
> 
> [...]

A patch so good, you signed it off twice! I dropped one of them.

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: cpufeature: Add HAFT to cpucap_is_possible()
      https://git.kernel.org/arm64/c/264a593da60b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

