Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3003C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5X8mE/KoQZYB9Ga7UMKtniR60FOQlB4lNDY8z/m1SY=; b=uznZVaAx7o/H2G/o44X3p7OyIl
	j9TQNnEL2+n3U4s6M++Zc6hebX9oQerVH5rxE4Eafc0iErckJx6LTbKfGlic1H1HtAQ4vHORJ0/fS
	LygMayc3MXt0JqUj3zVB9xyc3iOVdXR7Feumv9jLSp780nP2WKLdJMgm5zm83RgdTcohas4mX+a4V
	MYkNQd8s14MWGgfUDByAwzAPHLAklwzvQe1ysV2SJ37hdVhYBGWkGjKgINpGi1D3kRlpNMxWippUS
	ODaSXsKhMr6GK9aRRkVqNbRI2SEA09qePSyXTAMgO52LxBOOL9DABqkcSnzINfvMiaYeuXuZ1LhUv
	wSNWT6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3PV-00000006SYH-0cwi;
	Tue, 11 Mar 2025 17:28:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Ea-00000006Qy7-0Xab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B885A45FFF;
	Tue, 11 Mar 2025 17:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55EBC4CEE9;
	Tue, 11 Mar 2025 17:17:36 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	robh@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH V3] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Date: Tue, 11 Mar 2025 17:17:34 +0000
Message-Id: <174171335999.3659520.16613654046629962007.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250227035119.2025171-1-anshuman.khandual@arm.com>
References: <20250227035119.2025171-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_101740_252037_8D6D7332 
X-CRM114-Status: UNSURE (   8.62  )
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

On Thu, 27 Feb 2025 09:21:19 +0530, Anshuman Khandual wrote:
> FEAT_PMUv3p9 registers such as PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1
> access from EL1 requires appropriate EL2 fine grained trap configuration
> via FEAT_FGT2 based trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2.
> Otherwise such register accesses will result in traps into EL2.
> 
> Add a new helper __init_el2_fgt2() which initializes FEAT_FGT2 based fine
> grained trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2 (setting the
> bits nPMICNTR_EL0, nPMICFILTR_EL0 and nPMUACR_EL1) to enable access into
> PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 registers.
> 
> [...]

Applied to arm64 (for-next/el2-enable-feat-pmuv3p9), thanks!

[1/1] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
      https://git.kernel.org/arm64/c/858c7bfcb35e

I removed Cc: stable since, if it gets backported automatically, it will
miss the sysreg updates and break the build. Please send it to stable
directly once it lands upstream, together with the dependencies.

-- 
Catalin


