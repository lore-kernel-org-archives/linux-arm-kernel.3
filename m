Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F47CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/sSy55cVlTajDSdyXyQdQhob4xLe9O9Mx/OjvKBiH8=; b=N/j5ngu+NGmkeXNVuFhD9GmFwn
	bcJECHCOFGxRWneJn4uZM2I5wRzwz3rk0fttvLAaYz5jSTk+ZYF/av4IAf4FrrGXR1tN3WV44pKbT
	axbuicuiuVWcmKz5KAai/6cicFBt9WE+EyMMs33QhrUgtmHVFEtyi0xftOZacCMelxp4AQYPqurw5
	bh3/yRcXk0y1yw3Rp0RO/OUHwcqZqtFubdEFiNiI7XmUqo7cNjjae+6BvOhlYXYGnbtzqOsGZgsT4
	d5rjM3XT4jKQY7hTa4HM6kYS7o4n95zPPwwIaOUcSGA5cUULy5XaMoHDWtDlaqAlIOQZzAQ9PARWJ
	kfOTROnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXkf-0000000BrPc-2HGV;
	Mon, 24 Nov 2025 14:41:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXkd-0000000BrP5-1r0K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 14:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8FB0441F9;
	Mon, 24 Nov 2025 14:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4968CC116D0;
	Mon, 24 Nov 2025 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763995270;
	bh=XncGfPrcCJsYArhUGXo8sANatKFrQIfr4atzE1U5wz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nEwlnCMf536/aUl1zrHR8DlxDK9Wuqz7X4+J5Dn65GfOULKeqYgDkfcVnGGA0xGpe
	 KP4T2dGCf6MNFiJXOgLq8uj3cxHJYNkqUZVdpcD47pHrB/kM5jOe2VRVAyCEDecdaR
	 Yk0MDoVtjL/ttnfqaDyTTCQGgT+EosFnRYeEpNCWbaFHPngcR/TIw/jwHVlzlZsVXt
	 Vp2eWtg249NKera8L0wTAwNYsPgwDP5p/viZQkZTlnVRGmLtzt4F1UPE8gm85Oppy6
	 A5mC/p6NDtatl/uSdvxzkvHhEwItGVTkxfTKiVRwiK3HiNg5qt7GIgbVTQsa3Ko+xz
	 JMrDuGy5g0q9g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Jonathan Marek <jonathan@marek.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	shechenglong <shechenglong@xfusion.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: proton-pack: Fix hard lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY
Date: Mon, 24 Nov 2025 14:41:02 +0000
Message-Id: <176399113353.3273155.581458888814324419.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251117051211.16108-1-jonathan@marek.ca>
References: <20251117051211.16108-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_064111_501847_CD88EDA3 
X-CRM114-Status: UNSURE (   8.33  )
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

On Mon, 17 Nov 2025 00:12:08 -0500, Jonathan Marek wrote:
> The "drop print" commit removed the whole branch and not just the print.
> For some ARM64 cpus, this leads to hard lockup when
> CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY is not enabled.
> 
> 

Applied (with your SoB) to arm64 (for-next/fixes), thanks!

[1/1] arm64: proton-pack: Fix hard lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY
      https://git.kernel.org/arm64/c/165eb13e485c

I'd be inclined to remove CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY
entirely (i.e. make it unconditional) given the number of CPUs
affected and the dynamic controls we already have for the mitigation.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

