Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBBF60A2605
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 20:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HM+zfM42;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Blr3eB+j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VwsTNUIWgPGNrUvwHU2JTnkVF1TKtK53W++DxYs7jXE=; b=HM+zfM42FIXWO9
	v3ksIsuzrghMbv5/84aOSneAuktUisF4lrVDnA3C9+GwFsx11QmLSh/bPbPOKMroAuQsNnkv8Q8w2
	7FOvIzEWO38ws9e8pjuwJkoJLOpct+c6MJWtLkaGuaTcXbqP3dyg0Ob4PJbBDlzkgLTxuyxH+ZUBm
	Y5vMT/25ECquvep0A+WxtMPTU23/JKxxTgMOML1bfdMywwcBnlh/9R5BOTF5Y7+7vGHSj1nMleuqU
	RB8NHtgVh6h4vwInEf53tCOsA6jBeCxOVRQYhEAGaSOSO8R0i7L8uS7FE/IOgxz1wPEIVQUhGcJnO
	1NQogjHNKX7tAepIpOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLTq-0000000GtuH-1Mgy;
	Fri, 23 Oct 2026 20:03:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLTo-0000000Gttv-1Upj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 20:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0CEA40A4B;
	Fri, 23 Oct 2026 20:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416311F01825;
	Fri, 23 Oct 2026 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792785787;
	bh=VwsTNUIWgPGNrUvwHU2JTnkVF1TKtK53W++DxYs7jXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Blr3eB+jadRq8XnnDJI5LiUGJYjybneYXqIdZ10tcNU5k09Uus1d2wZWZgI9Qm+io
	 lk1LGvRT9AouoNEAHgaMcgOjZxEgBYhTXNmKosueDRi8QiL4Wbhlj+5oe9JnPBeCcN
	 PTTzQGOpkHzUXbfG9uV79Fcbfc70Ktpu24KXjX7t7+mNM4dK5M/gzyo1yCb0PqXSns
	 p0KgBluNj2HqiDwwcQ5XTqDHvW/i6KHKm54yJ4NM0iTNvsZAjK1p3C9QVbTTIEtqC+
	 XICQv/+OUFBTZcj8A0JC2Zxqv5dm5U31HLsDy93W8uDcGhN1gvPBKAZVuMb2bTBRRp
	 u+e364Q3fQLcw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	fuad.tabba@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aaron Ahmed <aarnahmd@amazon.com>
Subject: Re: [PATCH 5.10.y] KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
Date: Fri, 23 Oct 2026 16:02:47 -0400
Message-ID: <2026-10-23-1-daily-reply-0011-vgic-its-null-collection-5-10@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022174537.2767-1-aarnahmd@amazon.com>
References: <20261022174537.2767-1-aarnahmd@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> MAPC with V=0 drops ite->collection but leaves the ITE on the device's
> ITT list, and vgic_its_save_ite() dereferences it unconditionally. A
> guest that issues MAPD, MAPTI and then MAPC(V=0) therefore oopses the
> host when the VMM issues KVM_DEV_ARM_ITS_SAVE_TABLES to migrate it.

Queued for 5.10, thanks.

-- 
Thanks,
Sasha

