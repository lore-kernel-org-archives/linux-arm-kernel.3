Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E189606B55C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNN/QI3T;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vAw5UIhC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3arWtRYMgXECqw7+BWms5meFgKjfCsn5/zO/hbfOvZ8=; b=cNN/QI3TwJ/uMGEJjBSvrV5rdp
	fFdXpHHGP6ay5W1SREOxxNGP5EbLxDqn59zDdFjYEgX6p4a5jNLSIxojkDw8VG1EfKOresLy/FmXq
	AJHU4sT2W5njzhyovMg0MXZwIlat+l1WF91gkYmm2PKSUTWXUWPqJ6x+emgWfxuuhuEz0+lGzEgtF
	ak+PDZpCTbF2t1qZnd6RzZ6GlgD2gDgAa/qETFXVv1aPtvJ6mrpSOWDrweBL7Xx/ewnXy5ian8U/L
	kspNezAWPu2wPCvG/cdZMu2TO1Fi5LqLeUkKFfvTFM4oepgLIca1PVpdAEHo2BOhVwUipWyRnF9BV
	/6ND8hLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvsJ-00000008i38-2SWA;
	Thu, 05 Nov 2026 11:43:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvsG-00000008i28-3Qir
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:43:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F65A1684;
	Thu,  5 Nov 2026 03:43:14 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A1A13F628;
	Thu,  5 Nov 2026 03:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793878997; bh=tNLSO+hdm+nSfzMoKkNnsSWYMdy8kNf8a0WRixCTXUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAw5UIhC3psCGMOX+MMnb+D9GR290XkKa9AuHmSzLQJdiC0S0HbR7Iw5xHPxficMw
	 +TW40584w8silG5YCpCe0YcnPdUIGx5aR6jKkTCPT2UtXjT2DrSxQxUUJgZJVJ0OK+
	 tSJJs5TLqJStkuTvwEC8gE4FdxkqVgPJAtDF0E/E=
Date: Thu, 5 Nov 2026 11:43:15 +0000
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/7] coresight: Pulse an ETM external output for a PMU
 event
Message-ID: <20261105114315.GT9176@e132581.arm.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792989860.git.aaupov@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_034320_912312_DD561EAF 
X-CRM114-Status: GOOD (  12.29  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 10:48:20PM -0700, Amir Ayupov wrote:
> Add an ETMv4 configuration, pmu_pulse, that drives trace unit external
> output 1 on every traced cycle, so a PMU event counting it (TRCEXTOUT1)
> can end a fixed-length ETM window, for example with aux-action=pause.
> The feature only loads on an ETE whose PMU counts its external outputs.
> 
> Patch 1 is Leo's fix for TRCIDR0.NUMEVENT decoding, which patch 6 relies
> on for the number of external outputs.

Maybe it is worth to update patch 03 for Suzuki's comment:
https://lore.kernel.org/linux-arm-kernel/82adee03-a169-4106-99f2-7624a4926037@arm.com/

This series looks good to me and I have verified it:

Tested-by: Leo Yan <leo.yan@arm.com>

