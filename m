Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0636C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT+HPlhcuk/pySSVcjY3DaH4g16kjYMQ2/8qrwSmd8s=; b=iPIc1jZn9YsGe6E9ncX9FY4T3h
	ZZyKbI/ug+BsMognBFf2U/BlXOAVEQJRyBDSkM1tr8KzolH5+2BsKK7TynuzSJ1Upm9lMVCxPX2eQ
	Md7q5Axk0Gs/lyuEzo+xUS/J3GTyx4uLlVZ9NINcj4m37Vfa07mR4JFdLuu9DjkTxW31bWiiwKDtS
	B2XoNQE7N5Xbq2mqO/W7r+GW/PZ6lNhKkqzJr83/vQS86bPC0VjtRsSG9NIfI63zV4DatsK5312ct
	zPdKkP0pyum8IX0aOzyS7tLtsRMbGd6ERn3WNx1AydrN3kX5OR4Mh8XAb+a0vTe/dOijn/Rhm9mGs
	Bt1nxSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHO2f-0000000DB0z-0577;
	Tue, 20 May 2025 14:34:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNxc-0000000DAAF-1ndi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D717845142;
	Tue, 20 May 2025 14:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8C2C4CEE9;
	Tue, 20 May 2025 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747751331;
	bh=RT+HPlhcuk/pySSVcjY3DaH4g16kjYMQ2/8qrwSmd8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1S/SWLvz3cIyclj3BPJe0OrNjBmWv1N8+sit7t6sVSXBnIbhqwpnwhHF8r9U0O8D
	 mrxG5z3euaL2pDtdTUYRVcd2ebCfATINAkd7UTSKcKl9m0d9mjgR/XEXMHaPAuQrEv
	 V5Yud/38PwijNXDaK9gpYC4GmYmKyAXDVJEVd2AJv0LQkc8w6gQUTqqOPa/JEez8c3
	 v7z+MTeN31ObDI/OpbqS9VsjfA2XKYRaar2wtpAVXFZKy8npxHR3T6nGTUiM9VviEc
	 ZXauznCkYWlEfJcPIu92q+6+bQ+j8oUTnl0LqhacdZoNF9VwFMxL/DQrzbVukyb8yl
	 Ne+53ipCE2e+Q==
Date: Tue, 20 May 2025 15:28:45 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org, indu.bhagat@oracle.com,
	puranjay@kernel.org, wnliu@google.com, irogers@google.com,
	joe.lawrence@redhat.com, jpoimboe@kernel.org, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <20250520142845.GA18846@willie-the-truck>
References: <20250320171559.3423224-1-song@kernel.org>
 <20250320171559.3423224-2-song@kernel.org>
 <aCs08i3u9C9MWy4M@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCs08i3u9C9MWy4M@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_072852_483568_667AA5C5 
X-CRM114-Status: UNSURE (   8.79  )
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

On Mon, May 19, 2025 at 02:41:06PM +0100, Mark Rutland wrote:
> I've pushed a arm64/stacktrace-updates branch [1] with fixups for those
> as two separate commits atop this one. If that looks good to you I
> suggest we post that as a series and ask Will and Catalin to take that
> as-is.

Yes, please post those to the list for review.

Will

