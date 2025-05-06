Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCB3C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a29NZaixDq9tf7WrgqxieSl6ERYlEPB6Gu2gnH5K9g=; b=brhSrKTO0U70Bmfoz4/JQjRIIM
	0PK8bBXrxukQrfYT+AStZE2rruvVG6qIAb9mGHOeonSC57dNz2nnEFidesbtwluHh0CwH3wyiZEF3
	OrHieto+ITgMUraE0R5K8QiouytsE+MsAW7X646bIFwp043qaSkCgwxnK5tYqa1jDnEJv5uL8zYMT
	tKn3yNIDX1TkIgvHwzf3IPR1q5RgRUySi74/p/W8FQKcXq3VvmK9HFfraV4HVDNTZOCXz8EVto9lC
	y138JYWDliEUe5JBpN+K2IwjeuaG4EAFf3TrbWNLQDeSw1F5xJM1BiFUqL8G887Sl1Y/1V0rdwZfH
	+SsvUq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEWu-0000000BM65-1Yjy;
	Tue, 06 May 2025 09:24:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDqF-0000000BCHI-0D2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD0B144C13;
	Tue,  6 May 2025 08:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD75C4CEE4;
	Tue,  6 May 2025 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746520794;
	bh=R/t6fC8BgZ5UGdDoJP9eN+Jq6tu4AHWylYBkIjZvB30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRSTsY5LuJkkIY9zFfEo0+imGmpxP0qCMWRRx1CLhWW/GFA7jcIbnxSjOMe9jmpZM
	 STHSWL7V19PlSxKqKVjmL58P/cPDCTKJAJmEaqrlq6PTGduSpQ9RwKaU/YH2QypP1p
	 R5svl3kG87xcom0CWV/q+/h+tBjJB12yEJzH+9FyWRup7uNTTtuw6XjD1KCGcNAIRm
	 7xqhV21ksPpOFXpEsIZIxptRmMdN7kVcqSr06B2R9UTOR/fPpFtksdfy/TJDk2ugQh
	 QZYgAceEpQiefLtcrPMCfftTDcKJNIYBMUSsAeQCP4Zpdu/HoebMAEcWf05WNBP6Oy
	 rFf81znN24FIw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCDqC-00C9CL-B9;
	Tue, 06 May 2025 09:39:52 +0100
From: Marc Zyngier <maz@kernel.org>
To: will@kernel.org,
	catalin.marinas@arm.com,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	joey.gouly@arm.com,
	oliver.upton@linux.dev,
	Seongsu Park <sgsu.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cpgs@samsung.com
Subject: Re: [PATCH] arm64: kvm: Replace ternary flags with str_on_off() helper
Date: Tue,  6 May 2025 09:39:47 +0100
Message-Id: <174652075464.339217.18009123147130751247.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
References: <CGME20250415012410epcas1p42b48977934c21b5db0b19f4185f7a63c@epcas1p4.samsung.com> <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: will@kernel.org, catalin.marinas@arm.com, yuzenghui@huawei.com, suzuki.poulose@arm.com, joey.gouly@arm.com, oliver.upton@linux.dev, sgsu.park@samsung.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, cpgs@samsung.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013955_105548_F38A9112 
X-CRM114-Status: UNSURE (   8.39  )
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

On Tue, 15 Apr 2025 10:24:05 +0900, Seongsu Park wrote:
> Replace repetitive ternary expressions with the str_on_off() helper
> function. This change improves code readability and ensures consistency
> in tracepoint string formatting
> 
> 

Applied to kvm-arm64/misc-6.16, thanks!

[1/1] arm64: kvm: Replace ternary flags with str_on_off() helper
      commit: d2f14174f9e839e1128664ab339bbe17c333208b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



