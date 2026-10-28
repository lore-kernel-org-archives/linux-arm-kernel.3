Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E79606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W1vyx9rC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5jGn2Uy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EMYPMS5FO1bwNUoeczH2HUUreu/6T5PLlD+DKwBPIWo=; b=W1vyx9rCu8o6cD
	2/2gCAhoW8c6Ed1ySAZ1GCpj+dk+fXXVK0/b8TKLi+Y+EOYb9o5ky51mukrEBA47GUzwegorXjmEx
	IKc+S2qaeUpyp+NMwfoRujbFc1cDK+fY3sZGnu+FXFVunKaSfbv1/GYWWJtzhSpiEJJm9iK0Ktvo1
	wHvfknTeOzlvI2WGkXfE54sVmSGREfecsN/9OZdaJQRF055gg3YFeTdXsqs80OigyXWWniRYBAKK0
	vFSF5NhCX03FvFjcgLqobjRfoHQS2CABO11Gdbb44y9M0NUrc3FptHnn2ICsSpGl0a8pTunup4LjH
	bA68/Cw9pa3Df4jRSCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAp2-00000007y2n-2DBc;
	Wed, 28 Oct 2026 21:04:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAp1-00000007y2g-1Rtl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 21:04:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 653FE43E08;
	Wed, 28 Oct 2026 21:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEF51F01825;
	Wed, 28 Oct 2026 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793221474;
	bh=EMYPMS5FO1bwNUoeczH2HUUreu/6T5PLlD+DKwBPIWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T5jGn2UyEkA8BDqyiSluS0fW9XUoYBNbIWU+LwRgRzxntOVRER+isjJrvyeJ5dOiK
	 SV9tSi2musBQcoaACMjgljbKfviy+euPxbf9Y3Env5gf+/NqRQRLdSLbPT5+LYN945
	 MvQVyuyb/FlomK4m4CKdnOe0fxy+U0wTcYFoCF4KGwRJBtCse14MGp/t1ATD4KX1ap
	 gBTY9yFUdakNV9SUs8xW5lZ65Esg0gEBv7GxSTCB0StvHR0Sax5YXthBsHp1MqSfdK
	 lWoKZgPlkrJFf6GCG3nmGpq1RjPhOCvqga5UDm7tln+CGgwbr1dLMZk031giQTndjm
	 LrQvK6jOQcToA==
From: Sasha Levin <sashal@kernel.org>
To: Aviv Bakal <avivb@amazon.com>
Cc: patches@lists.linux.dev,
	stable@vger.kernel.org,
	robin.murphy@arm.com,
	ilkka@os.amperecomputing.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Wed, 28 Oct 2026 17:04:32 -0400
Message-ID: <20261028210432.2386109-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179250706537.3484860.18363532452101434862@amazon.com>
References: <20261019135441.1420968-1-sashal@kernel.org> <20261019135441.1420968-145-sashal@kernel.org> <179250706537.3484860.18363532452101434862@amazon.com>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 05:37:45PM +0300, Aviv Bakal wrote:
>Please drop this from AUTOSEL -- it's new-silicon enablement, and its
>parent commit 56603c28d916 isn't in 6.18.y, so the static_assert in
>arm-cmn.c would fail.

Dropped, thanks.

-- 
Thanks,
Sasha

