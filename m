Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F555CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F86qHzfSNyyr7ljnRqTcoUSyZ4OAM8WiMExGqRcfYRI=; b=OzDiEcZ/oP0q55Pj6goEcJsxYe
	O3qEM0OOBbCSd8m4NWZbiRb45EAXg4idSjQSDM2HeoCsACu5tEGZBtyOBMRFK/RawHZjJ+93uGxlZ
	1SJkqcoFxNJcgrcqqDXEUdsH4+lGcnTq/huIPxK1LZeGV0PyzYD3nJ82AV5RegbC7AsBfj/RaDMCn
	OOrqQEpJBSwrY9twEHoBKe8I92NtYE5xB7cNyeu7noRT5i5NJVtRoHHX5Av0HmACYxSCfnabI9TjO
	dGKCItn5NUwVpFAyLy1evMmPNqA/Ci2hr3kzNP800seu/bIVHl44sxf5Vq02V/oHpX/WhGwSOETtq
	VGtWuncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIwJ-00000009gaG-0xua;
	Fri, 24 Oct 2025 14:38:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIwG-00000009gZf-4AbB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:38:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11AF91516;
	Fri, 24 Oct 2025 07:38:36 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A16A3F66E;
	Fri, 24 Oct 2025 07:38:43 -0700 (PDT)
Date: Fri, 24 Oct 2025 15:38:41 +0100
From: Leo Yan <leo.yan@arm.com>
To: tanze <tanze@kylinos.cn>
Cc: adrian.hunter@intel.com, namhyung@kernel.org, mingo@redhat.com,
	graham.woodward@arm.com, irogers@google.com, james.clark@linaro.org,
	john.g.garry@oracle.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mike.leach@linaro.org
Subject: Re: [PATCH v3] perf auxtrace: Add auxtrace_synth_id_range_start()
 helper
Message-ID: <20251024143841.GU281971@e132581.arm.com>
References: <20251024085625.175688-1-tanze@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024085625.175688-1-tanze@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_073845_066511_45741827 
X-CRM114-Status: UNSURE (   7.41  )
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

On Fri, Oct 24, 2025 at 04:56:25PM +0800, tanze wrote:
> To avoid hardcoding the offset value for synthetic event IDs 
> in multiple auxtrace modules (arm-spe, cs-etm, intel-pt, etc.), 
> and to improve code reusability, this patch unifies 
> the handling of the ID offset via a dedicated helper function.
> 
> Signed-off-by: tanze <tanze@kylinos.cn>

I built perf successfully with this patch:

Tested-by: Leo Yan <leo.yan@arm.com>

