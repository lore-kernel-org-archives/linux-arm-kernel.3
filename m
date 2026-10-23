Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9DC606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gV0Z74TQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oESDUsak
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=73AIKSbXnm7iEYTouzViIQzL+RlppRhBp/kP6VeGFkw=; b=gV0Z74TQfKt/3X
	YZ2c/iM8exr7/GsK+fNNL7WqOcOjYUVhJOhU/kkUPJuG1RZcWunlOf70yyztbwsuuMI2BcNb/AA/h
	uu/Vc1FmCeSi161MAcB/lhNCUqHjUYz6ixa94DLebaXYz6MLo197rhHnH3VdVTrYxf9CMKvbJqBVh
	we3qhMTSdTI3tjUj77Hp7gzrqi68uIt734w0wkjQeJxCqIjlw1P16OB4KAlTwx5FavZZNxLI2yq+D
	ODaEsHPaUHFg2tGDu7yGeM/pUjEh9jYU0L5WgRMeCX7WpFXJdUHVGknjJyex5dTXthKU1HlMXkR9w
	PALzkZp4bRlRxvPcF2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLTy-0000000GtvU-1ogV;
	Fri, 23 Oct 2026 20:03:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLTq-0000000GtuE-0rIV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 20:03:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89F3943D5F;
	Fri, 23 Oct 2026 20:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0381D1F01828;
	Fri, 23 Oct 2026 20:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792785789;
	bh=73AIKSbXnm7iEYTouzViIQzL+RlppRhBp/kP6VeGFkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oESDUsakss0mrofMZOFxZbw4ICto+6WAZh/A4KTfqvWKeeo6GoIH35y8OSWaaQfAo
	 9fcNdhd4+WC0Dh32yR0DvXGtZdN6vChjrCvfqSFEQ6l1bI6BiG4SjErB24/0qj79+5
	 n38ovGqG0ItDpQelkDYtZJWKq50kiKD+8CHi48DXr8iun8w69Y3c2dQrRjh/xU4Z9I
	 RVhFjtLrjvkU4fmurcrvhoWexkyxiblZXBu54XeH/IQSQkYY71mgeR7fQJIAVgY2MW
	 uo2RQjdKEk1zWKshNXghg3HDgd9kRE3lBWnDC5Ogxxg21FD2w+I7eLCovGO1KyvB6u
	 ridSoZJrOrmPQ==
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
Subject: Re: [PATCH 5.15.y] KVM: arm64: vgic-its: Don't dereference a NULL collection on ITT save
Date: Fri, 23 Oct 2026 16:02:48 -0400
Message-ID: <2026-10-23-1-daily-reply-0012-vgic-its-null-collection-5-15@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022174537.2767-2-aarnahmd@amazon.com>
References: <20261022174537.2767-2-aarnahmd@amazon.com>
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

Queued for 5.15, thanks.

-- 
Thanks,
Sasha

