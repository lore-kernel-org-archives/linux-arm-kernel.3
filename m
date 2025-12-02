Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC74D11715
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVDDeDsI7voWK2iMpphDuZXy8UNo3zOmfcXW7ODA8PQ=; b=TZuyuW2YdQ4IE7Fh7nInPIKPxY
	9cW40ad1Win3d685z/h/RrsJnd/qud7kMB/QKkO1wubq+aJXGmRJd/KI8ZGKHyLbOmLGM7BZoX+S2
	7HhyF++HGzGUnDF+SricLmKiS4cMFcOp4R/u0rN7HIIP8GbsJhKVDLAi7JRi5Sdc7lub2S1+5K+61
	pD8p/SL4j2tOhJ2rDQutvpsFwpe7utUfw3m2ZEE7Xj+4cmOyu6RMK6PXqVt+IjnnKR65RodsfX/7o
	JIY5NL2Wex0T/hLZ2Z6ghxnrel6SG4BiPuwp7v6BIaU4X1y/7hs3sMCaBo7fRY6/mS8/IY7x/shIt
	4IwUMY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTiZ-00000005e5x-0s0A;
	Tue, 02 Dec 2025 16:59:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTiW-00000005e50-44sH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 16:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D103441973;
	Tue,  2 Dec 2025 16:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA00C4CEF1;
	Tue,  2 Dec 2025 16:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764694747;
	bh=BKuRmo/5X5VVzMCwr0RNY84CwTP4HWe2icEbznJHVzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKAi/mUAqSC/tVRSdbcmC8qjlezFOCw66U60BYYB54O8IHOMfIELqMmRm/3DgO30N
	 jXu7BmHni2QysJ+encGdMUd2U11R5r2u7gCtWvZBBzjDO//T/zVij8Cnpha6MQ1fhJ
	 zbkJf8+kEILwxG3D1lWhiIXXYOiIkix7mbCFNlGSfG5lCJqTf01zSQrJt5CW27paFu
	 mYwt3ztzKiaKc+3bttfcOz9B3Bv8xA5W0s3HlITnSCpgjtymU3btwcrQq+BPLek8jA
	 jlaKIRNXFH2V0mEITs0MuHOLE92cvn39QfC22BSjE/rbB00WQXapE642ZijCDvfOsX
	 9Jv1TTBTDbjxg==
Date: Tue, 2 Dec 2025 08:59:07 -0800
From: Kees Cook <kees@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <202512020858.8BD22F486@keescook>
References: <20251127105958.2427758-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127105958.2427758-1-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_085909_029039_5D56B414 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu, Nov 27, 2025 at 10:59:54AM +0000, Ryan Roberts wrote:
> As I reported at [1], kstack offset randomisation suffers from a couple of bugs
> and, on arm64 at least, the performance is poor. This series attempts to fix
> both; patch 1 provides back-portable fixes for the functional bugs. Patch 2
> proposes a performance improvement approach.

Just to chime in -- this looks really good to me! Universally improved
performance, reduced complexity, and better randomness. :) I'm looking
forward to v2!

-Kees

-- 
Kees Cook

