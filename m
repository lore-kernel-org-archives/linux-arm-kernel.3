Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bVtIzKVv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOIpFBTM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eirSbdBsDnP2H3EX3QFaToBg2WK7+I8nA5mg6pTJZAc=; b=bVtIzKVvXPrEeu
	BWvU63gRLkeLXLymfA5ZpQnNtoTtnBMAn2ysoeV0dYxbR/7yhgf8OWvxg4EViLJWlWr52ZRcTtic+
	dFFzbT1z5hzaqqvg7RanAZqVSZRfdJ3zLqn+a643xcq4GvJaeOgc9fbw77b4HiEJ1JhKFG3yOjtuC
	suSF9f3jZa/KuwxVxc2GNX3RstpghKwmb7zy0Sqlb2ibLlN8WZCOpbTcf1J6EpoVSjoU7f3Z10fWj
	DC3hK05jHv8eLe6MQ774CUdnd503fJm3lwpe/h3D5rFD0+ZEGy20H0aBqxb/r0QvrsfdlNchhHlKd
	9FBWa67o60cvyK2M6DoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEpM-00000002cLR-0pyT;
	Tue, 03 Nov 2026 13:45:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEpK-00000002cKV-2Onr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:45:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC28343B29;
	Tue,  3 Nov 2026 13:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3541F00919;
	Tue,  3 Nov 2026 13:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793713525;
	bh=eirSbdBsDnP2H3EX3QFaToBg2WK7+I8nA5mg6pTJZAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fOIpFBTMyxU45+1ODm2v727R+mJeqTcyXMPJoW27BGVkQH8/UcwqGUhiY2OoI/rbg
	 qguwGOOQKUUX8ccM+Mh+2ZrG7w469jX/FfAM7RrByixMCvXq+HK+ke8Gm8Fo5HJowC
	 Ngn7JfIb8OiWC6YN3MTlO0+/zQnp8BijHUdOPKczu08foCQDYEmuqBtIOfsHEmrpVg
	 qFf0vEkAtuUvh8Ef9L5NGjPNPA7JKfdFJWZy5XZkzYmRSF6PGcsu9PrgHmkTRsit4t
	 Hti6kTxBV3WLREHPrhiJR3wkukw2SsJOw4smiFR1KiVxaCpPtgEtPPOOc8Z507VK2C
	 UgSpuAsMru5pg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEpH-0000000AV4j-2A9l;
	Tue, 03 Nov 2026 13:45:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Reenable MTE on VHE guest exit
Date: Tue,  3 Nov 2026 13:45:19 +0000
Message-ID: <179371351574.2945223.14818427732835128303.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026082305.2515705-1-maz@kernel.org>
References: <20261026082305.2515705-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 08:23:03 +0000, Marc Zyngier wrote:
> Upton taking an exception, the CPU sets PSTATE.TCO to ensure that no
> tag fault can be taken while handling the exception. It is SW's job to
> eventually clear it when it is safe to do so.
> 
> It appears that when MTE is enabled and that the kernel is running
> VHE, nothing eventually clears TCO when we come back from the guest,
> so things such as KASAN_HW_TAGS will not work until the next exit to
> userspace.
> 
> [...]

Applied to fixes, thanks!

[1/2] arm64: Add return value to mte_disable_tco_entry()
      commit: 09436ffe8f1b396c6446eda12798e46f82fed48c
[2/2] KVM: arm64: Reenable MTE tag checking on exit from guest when running VHE
      commit: 491fe17530d662a7e6c6b4d139d950dfa0e3a210

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



