Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCEACFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qetPYO23uHEJQFYkDreodHVCIa7aeyZcPSuytC2sfs0=; b=RCCGmjNJ7ygYeq0okPTTNPLWBn
	I+YUQIkaESZj23/9UJ+Pl8Z0wJJ+vtyCZB+AUsP1Vh4K9LT9Oq0ZmrfJlGqvy5vcZAzAF+GoqQSmv
	4BoTQy/nrh+61pcXjuX30aSm1LDBAdypWpfWFBPpunCuCUR+vvaRRsAkk3AC4VplIS9ox4NSF/Dxp
	Ff7NbVjAtP27B379dTAVc08Q8lpWXiUFkyz1o4iadfIX7GWLhi7He3igSdOSPIhq/0tKIW7HrHj2+
	GEkp+PuvTh4I3neJfa7swt2XMbvn0Ind8EAG4tvWsAVejfpl+fz8ddaxgnAO9EA+181T8HD4WhfFV
	JyJ4qjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYgr-0000000BwBv-2WL4;
	Mon, 24 Nov 2025 15:41:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYgo-0000000BwBS-1SlS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:41:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9780A1477;
	Mon, 24 Nov 2025 07:41:08 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85F393F73B;
	Mon, 24 Nov 2025 07:41:14 -0800 (PST)
Date: Mon, 24 Nov 2025 15:41:11 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing>
Subject: Re: [PATCH] arm64: mm: Simplify check in arch_kfence_init_pool()
Message-ID: <aSR8l5RN0UFts6yL@arm.com>
References: <20251119130016.283216-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130016.283216-1-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_074118_452233_9EFF50D8 
X-CRM114-Status: UNSURE (   7.58  )
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

On Wed, Nov 19, 2025 at 01:00:16PM +0000, Kevin Brodsky wrote:
> TL;DR: checking force_pte_mapping() in arch_kfence_init_pool() is
> sufficient

Thanks Kevin. I'll push it at -rc1 since it depends on commits merged in
6.18-rc6 and I don't want to rebase my for-next branches now.

-- 
Catalin

