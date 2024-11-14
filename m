Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C868D68B01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRdDb0PKtgzHN3bC4xMuxWNPZgnchH9KOgHW7YjeBOM=; b=cEA2qGtJBFy74589nSvshXE7Wd
	ByPfrXM/55lG9dKhXcOQLkAtXjKWLNSszd3dKYCONrzf+YI1bXY8W7RNYq36OAahmqeUfGOKrCkbD
	9JKN4LQXh8qX/YrVggdZ6eJGlODVnAaeKA9tKTuVq2u4MZLfzYoulodqm7eG3dx368w4EOW9eiHb5
	6iiHOK/jF9/+V11mmRU/yJFGO8Z7Z6rZlDrXSCGnc4o9SdFRmSnHS5FoCjk2ML3hyoFFf/kJhFIxm
	iDamDVtN1GOSHTK7SAQjzyY0I3WFX9NY0zrvUR74DbnWObNtYPmhsr9Q53xObHf2gvapeO32UB9LD
	fd3xwuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZDE-00000009wer-0Doo;
	Thu, 14 Nov 2024 12:44:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZBM-00000009wTF-3rj6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 12:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60AE1A4085E;
	Thu, 14 Nov 2024 12:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7468C4CECD;
	Thu, 14 Nov 2024 12:42:39 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: maz@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: tls: Fix context-switching of tpidrro_el0 when kpti is enabled
Date: Thu, 14 Nov 2024 12:42:37 +0000
Message-Id: <173158815061.1443752.2883549048176833544.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114095332.23391-1-will@kernel.org>
References: <20241114095332.23391-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_044245_048259_3346BC6E 
X-CRM114-Status: UNSURE (   7.51  )
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

On Thu, 14 Nov 2024 09:53:32 +0000, Will Deacon wrote:
> Commit 18011eac28c7 ("arm64: tls: Avoid unconditional zeroing of
> tpidrro_el0 for native tasks") tried to optimise the context switching
> of tpidrro_el0 by eliding the clearing of the register when switching
> to a native task with kpti enabled, on the erroneous assumption that
> the kpti trampoline entry code would already have taken care of the
> write.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: tls: Fix context-switching of tpidrro_el0 when kpti is enabled
      https://git.kernel.org/arm64/c/67ab51cbdfee

-- 
Catalin


