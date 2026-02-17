Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941E4E6816F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rME/8iwlJHEA/M0bEPZg6LcCv3lx6NMMZMbP/MEKbA=; b=SoCAK2OTM41IlkauBbMdU+oiTY
	EDDLUC12CAO/iadKXrZ38qktHyzugBVwlx8CGbZXyFr3njTi8ruCghx3ooxaDpqIygtcF4Vw2dUg+
	PPgTVq/t/9t/V9vKOPV40c4709SzrLKyYoLUPnin7PM/inb0e5n7gyW7JDN7fGMa+uiHjCRazpkO9
	Fo6m/0+GsHAEfTBHpmCIZw5HnZMpWDc05a2RzIB2qOfY9hjr8Gtr63KGQMuZm5RKr7FXt8gb78JUb
	bZvHYcjQGVf2w3+9zcaewxMgKO/kJTufEKh5K5U2/Dpa1g14u0UQrkX/zzcfrQW/Qb0xMQTQCE2j/
	r+tfCJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIfy-000000083qa-3Ru2;
	Tue, 17 Feb 2026 10:51:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIfy-000000083qP-0MbV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 10:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3890A60126;
	Tue, 17 Feb 2026 10:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2118BC4CEF7;
	Tue, 17 Feb 2026 10:51:26 +0000 (UTC)
Date: Tue, 17 Feb 2026 10:51:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: will@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, corbet@lwn.net,
	yee.lee@mediatek.com, ascull@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <aZRIHZ2Wq81S-FZY@arm.com>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
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

On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> Although it is currently possible to fully disable MTE on MTE-capable
> CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> userspace (with kasan=off), there is no way to limit the use of MTE to
> the kernel because CPU capabilities are traditionally exposed directly
> to userspace.
> 
> To address this, introduce a new cmdline argument (inspired by the
> existing arm64.nomte) to only expose the MTE capability of the CPU to
> the kernel. Combined with KASAN, this results in only the kernel using
> the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> field are hidden from userspace.
[...]
> +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> +			support for userspace

Why would we need this? It's a user-space choice whether it uses MTE or
not. It's not like the kernel is forcing it onto the user processes.

-- 
Catalin

