Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B3210A88DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1zOqmCU3lvIt9UcmmDHhuBTfq5o//Z1hErSxZZ77qk=; b=IHNomANp31Q4mpdb7oiilNB59G
	BTM2EhgU0u+nZ386Mel2YHprR/657s9d744mEyt+foHun9EdGHQYOdOsgAxl7Y2gbmwSizDpUTHKR
	DOXkA25f5qtLAABQQlV50EblT98oy6+W69YMAMaOPqOMcdUrxvPc6/1d5IAHocdpSBh0IinxbzKR0
	Fb6a5qeCSSdsDpOapkn2KJpVHL/KhxhaVIJEeJUrl32ZzK2pZjFG576q8Ffy47gR27+8OrHuhkLK0
	9ip9zGESYI9KvKJmgLyc/rNsCdXqrRPpXWeYFYYZKAtrzF0pQBuLCvy0c5c2q2hVghg85PZHCXLXf
	4dfQb9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mj5-00000005kqn-3qcY;
	Thu, 26 Mar 2026 15:34:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mj3-00000005kq4-2sde
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEC4943B84;
	Thu, 26 Mar 2026 15:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716CBC116C6;
	Thu, 26 Mar 2026 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539264;
	bh=IrSTSwtXxNH2DPkeoZs8kWgLSaGqE2Fv+K1G1lXYqZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2MdEmGY8wFKS/vnb738PuVKn1ppgaUqB/Fowhzi1yAkJtdQ4EI/KD/yAnR22VPqZ
	 jPpdm/OHprXI5Yy6qK+4AWsFdkUdQ2qBEDKHjz31UyAIuRKyFX17xysfedMzDNFO5O
	 b/5xslJ+M5SV+RApsfmQJHQcGrNQCSuxjKWGlgoBhslHUTVv+DjMe9oZHgiYXz0ar1
	 ZwxIWS5WogAwT3l+MqyS5qQ1x2e9yW/UBgA/UfV2eOpBgewnS9RLNvtW5ttuQP+aEi
	 ZcFyPwM7buM3LENBEjL/tKLorL/vEeOiifHd0t4ImyDDL/2oKpkXR+/4elcnb6/Bac
	 Pco1JxxeXJLcA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Fix resource_size_t printk specifier in arm_cmn_init_dtc()
Date: Thu, 26 Mar 2026 15:34:15 +0000
Message-ID: <177453872199.567997.503753073728296417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325-perf-arm-cmn-fix-resource_size_t-format-v1-1-e84d52ee3e81@kernel.org>
References: <20260325-perf-arm-cmn-fix-resource_size_t-format-v1-1-e84d52ee3e81@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083425_776917_5D4766A1 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, 25 Mar 2026 19:19:26 -0700, Nathan Chancellor wrote:
> When building for 32-bit ARM, there is a warning when using the %llx
> specifier to print a resource_size_t variable:
> 
>   drivers/perf/arm-cmn.c: In function 'arm_cmn_init_dtc':
>   drivers/perf/arm-cmn.c:2149:73: error: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Werror=format=]
>    2149 |                                      "Failed to request DTC region 0x%llx\n", base);
>         |                                                                      ~~~^     ~~~~
>         |                                                                         |     |
>         |                                                                         |     resource_size_t {aka unsigned int}
>         |                                                                         long long unsigned int
>         |                                                                      %x
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Fix resource_size_t printk specifier in arm_cmn_init_dtc()
      https://git.kernel.org/will/c/47f06ebbe8da

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

