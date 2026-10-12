Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6E0CA9EDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/NVYlNtZdFzL/ni+C7ZpCO/mYnVfuhj7NKhjkzFMgA=; b=OgIaH8ofW9Z8YKzoDyZa/N9tU1
	9FwouH18DmTUbNmLs55DSiPd0U4T8GDT1VUEYHUPc5iUF9FZiHx2hQFDVxJxhIhscb97ppwl+TWSD
	hCBqP0EGOWVYW1VUvS0gPCFBIHMedmoLDxl10Th5gytY3/7MwQFbXolkEHhs2kMkp8PVuVB4hbGmj
	KwS6XtvFK/z46sMzsAMaGie0hv0knfTdono/Ute3DGsWeK7R6E18ySN5OI5x+tAhwfl9Jw/XIjQ/D
	OxqLXahJU5ONBno/HjFw6t0bjl46dPySJbCqRRgb2oDF39RgSdX6HOp/S4bYCdVXkYMRd96YDvlwB
	1Jyx/kHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHwG-0000000Anif-2X5f;
	Mon, 12 Oct 2026 15:27:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHwE-0000000Anhw-1laf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5256169E;
	Mon, 12 Oct 2026 08:27:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B69633F7B4;
	Mon, 12 Oct 2026 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791818860; bh=//nw8KB9cpdJOUZo71z0ZVaFWnQ++bk4joXDKnezZX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjUEyDpobZT1D9Yc4Pj2/LisiOwtlhr0JJifjbDYehQrudpwvNlTKolg6xnhm9bot
	 bcd4W/a1bUXU5de67C/wv6rEQQEI4UTcBPgTg6E8I3mq1lipq4U8fXM1bCWZWSmEv7
	 Z8RkOtRjHn0vyvM5f2riR6h8nzNmaP9RpjkYz8m4=
Date: Mon, 12 Oct 2026 16:27:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Sasha Levin <sashal@kernel.org>, andre.przywara@arm.com,
	bot@kernelci.org, fenghuay@nvidia.com, gshan@redhat.com,
	james.morse@arm.com, jonathan.cameron@oss.qualcomm.com,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
	reinette.chatre@intel.com, "will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
Message-ID: <asz8Zj9VyUATs0MP@arm.com>
References: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
 <20261009163235.3-1-sashal@kernel.org>
 <18df4643-4213-4e0f-94e7-b1e43adcb5c3@arm.com>
 <d8f4fa6c-cb56-4dff-8951-ed2fdb859dfa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f4fa6c-cb56-4dff-8951-ed2fdb859dfa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_082742_510563_BBA122B4 
X-CRM114-Status: UNSURE (   6.59  )
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

On Mon, Oct 12, 2026 at 04:00:10PM +0100, Ben Horgan wrote:
> This is the clang build fix I mentioned. Just adding a note here as I missed to CC you before.

I queued it already, just haven't got around to run b4 ty yet.

-- 
Catalin

