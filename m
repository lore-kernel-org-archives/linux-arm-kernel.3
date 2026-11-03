Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78FC60850AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u8/jzZ0L;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSTrAcv4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uv05EscnTJ3kxav6QFkV6qM9VsMv62uR9qYoY8LEkSQ=; b=u8/jzZ0LfC4Ui5
	6Fk78PKuevuWunBHrCIxYOMXPlnFSfjspu5qSaSw/6shF1mHXH5TEkY87XpSC5bfX+mBXGGU1N3GR
	CV9nNvhJSuTxuWjfM0XbOKp3+hXer229ZUs9NReMrSva7rXMShxnAyd0SqssKQnquSEPG5c2+pY5v
	7r1358w+AmHYE3PUvMorragrtd/PxLdpLpOFNQW15f4tjSLk+g238tFhPEKXjcPVwSM7hURRkVU7W
	xxR3uZHZ3xYD6PqxJs91hcPiCPxx2+iJlCYnUWJg8yjHFs9MhNYoWDu0APHbJalfzgiIQq1hBK08b
	kXazjMNmb2uQMl/f5PVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDX-00000002SzD-3QSl;
	Tue, 03 Nov 2026 13:06:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDU-00000002Svf-0Pyc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C650D40326;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DF11F00A1A;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711179;
	bh=uv05EscnTJ3kxav6QFkV6qM9VsMv62uR9qYoY8LEkSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nSTrAcv4wsBRDB5Gl53KLVEB9IbIw7Lhu/cz80kl/dzx5Bxf82MwtpTYeOKVxT5h5
	 oTYBfAHmbmWytLCE+q7Cp70Gi4f6vyrZ2eZA6p0JscYj1NWGq57obb8YiVlsRvn9RG
	 xXoHkV+RVePgXy5TQauEG8QLQ6oZHuk0Xn1m7LkM5ThM+uyubfeS8CEDMzFW7+1/H6
	 GAwC77o4/19cU9UmKUYORNbKSTqoLMUuifdN7YWT5DBFQDRWuECx0PdUPZdptoUvts
	 BlGOkYZKioca7qKp/0pw1akVR6yvchhKPHAUz2ZF8gjelTMAcryvnMGv3TBpmRUqWT
	 2LvMmt6o+rNSA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDR-0000000ATWs-3sDx;
	Tue, 03 Nov 2026 13:06:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH v2 0/3] KVM: arm64: selftests: Cover the ITS MOVALL command
Date: Tue,  3 Nov 2026 13:05:32 +0000
Message-ID: <179371111252.2844725.16046624190812989103.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001071100.190013-1-fuad.tabba@linux.dev>
References: <20261001071100.190013-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, ndaugoing@gmail.com
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

On Thu, 01 Oct 2026 08:10:57 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Make the LPIs pending before they're moved, since pending state is
>     what MOVALL moves. (Marc)
>   - Put the test in vgic_lpi_stress, which now builds a VM per test.
>     (Marc)
>   - Test MOVI as well.
>   - Rebased on kvmarm/next.
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: selftests: Add MOVI and MOVALL commands to the ITS library
      commit: 6e4aea4c279c1be2707e5f1d8f94a3afc408b591
[2/3] KVM: arm64: selftests: Build a VM per test in vgic_lpi_stress
      commit: 0edd1f549a1d543fce3e0f6b5c87d182575cb267
[3/3] KVM: arm64: selftests: Test MOVI and MOVALL on a pending LPI
      commit: b5d08dcf25e7a22a7f52d9806c6c6db0c3354a0b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



