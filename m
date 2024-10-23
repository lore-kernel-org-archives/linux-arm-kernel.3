Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E7CCDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03EkkWNUA2udYMdXgJUQ2f1nrezsbqZSddPrWGODtnI=; b=EfI9qt3DI+GznoFuyk65SWDRlX
	5HTRAl1y0c3Uy+fRcQeneDlh/aGE1FW5sD7Mshy2eDbRcMQTWQ1ojEyBNV3PL8CRjKrXdLanRa9vE
	PrEed1LjRYH/OJongvxkEOQhmfzXqRgVWBP/YfhFOjv19crrgMVar6a1aJ6aRJdc7IO3L+aU4eVyU
	81xHIJ/BMo4J4p2Y+RqrnHQRkv+cF4G9kNaAZZzCEOP6H2/9aPAroNEVNVQFwdvj6fFAm9t6pBvT0
	JooKRDvTTULcj6+5WQcHIryMGPS8+WHh1yHc/zrPk0LM1l2Xrg8qgOMxSnZGzpz4DCPGfHY+A0Baq
	cf6tg0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zpq-0000000ECVc-1sUq;
	Wed, 23 Oct 2024 11:47:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZBk-0000000E5Ji-0Mho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4E2B5C58FB;
	Wed, 23 Oct 2024 11:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA03C4CEC6;
	Wed, 23 Oct 2024 11:06:01 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH] arm64: Add command-line override for ID_AA64MMFR0_EL1.ECV
Date: Wed, 23 Oct 2024 12:05:59 +0100
Message-Id: <172968153451.1430969.12754885741229995015.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241021181434.1052974-1-maz@kernel.org>
References: <20241021181434.1052974-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040604_199909_0EFB51AB 
X-CRM114-Status: GOOD (  10.81  )
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

On Mon, 21 Oct 2024 19:14:34 +0100, Marc Zyngier wrote:
> It appears that relatively popular hardware out there implements
> the CNTPOFF_EL2 variant of FEAT_ECV, advertises it via ID_AA64MMFR0_EL1,
> but cannot be bothered to set SCR_EL3.ECVEn to 1.
> 
> You would probably think that "this is fine, EL3 will take the
> trap on access to CNTPOFF_EL2 and flip the ECVEn bit", as that's
> what a semi-decent firmware implementation would do.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Add command-line override for ID_AA64MMFR0_EL1.ECV
      https://git.kernel.org/arm64/c/358dd4a9bdac

-- 
Catalin


