Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C653C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTTyOX3jUaEfy4dS1Mr4mcXsAm0gVOv4a1bDrBDA1GM=; b=4v62Kn5zsqJgjNcEJATLZbUlxZ
	WctJJa8F8MZZR17q/hHNAKGwe7o2ikNi85Zq8g5wlSGpA328BhYYhDc3QdPTg+eqJCWYACvJl6HyL
	ofIWxFomDFeUYTuTpPpCMH3xkEXmfQMwaESSMKu6DBGMAOxuQeTVpl4AppD5vvSHxBTd8kPr4VSHH
	kvtdwP0boAUwi/GYRaHjxitpAG6pDLhUURoQF8rPcThkXRBEE0k0IkoaiUtaAObqhru2EOQ6owqgq
	cNM5beZFW3OuXiqgM+LjwjnCDMdhNGDqqXn5LEwkVarmZEZSLO1WN30kC/wLSmgUTttXu5NImABcN
	g4O/OsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txACk-00000006tc1-0opr;
	Tue, 25 Mar 2025 19:44:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAB2-00000006tTg-2uDw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 19:43:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1AB36116E;
	Tue, 25 Mar 2025 19:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1F1C4CEE4;
	Tue, 25 Mar 2025 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742931786;
	bh=PQ1ykelCUvUiP0SCP/hX9Nj/59NCnq4VPDmBUPAiC6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AB0+yvtoZVeX1qyRTwFC+uoPgTEiEArH2wAVXoj/9agIBovYT5kLL9fTdXCYMox3a
	 OFMyW6n5DYKr/Y2KTX8/V+y/pjy7WolTpx00slq98q34aeVmjc79BnGIqptWZx5PW3
	 1KTw4ww14hcuT/iw/2KGjyx7gZjNrMj/1phssAjLzuz+W9+TM+6RCwg3nxA1OXxDTm
	 OIVruxKFD17tG67AktrhBBa0Rr6l77vPyIQZaYrvmGvYI0yqNGV0ot+BC99yCY+ebT
	 VieNRESw3709zC+hHr0jx9+SlgW8zCrO0zzfl8DzgJdrDohKWZViZ4IWfDCUT7Hwha
	 0TjK0ZV4rtYMQ==
Date: Tue, 25 Mar 2025 12:43:00 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] string: Add load_unaligned_zeropad() code path to
 sized_strscpy()
Message-ID: <202503251242.FFDB6940@keescook>
References: <20250325015617.23455-1-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325015617.23455-1-pcc@google.com>
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

On Mon, Mar 24, 2025 at 06:56:13PM -0700, Peter Collingbourne wrote:
> This series fixes an issue where strscpy() would sometimes trigger
> a false positive KASAN report with MTE.

Thanks! Should this go via string API (me) or KASAN?

-Kees

-- 
Kees Cook

