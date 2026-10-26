Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43401606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hNQYzjXY;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YL5aGo/3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8T6J8yDzBrrY8+0J5W7yruUUBqoBGCuuq5Evn3v44KM=; b=hNQYzjXYteH/uJ
	yZFi1G0ZLypwZ2Ud6r5Dw0i7jPuQiQaocASZHJDeY4ckz61omAP3/dasqjAnsfDAABgfibta2czvi
	6NA6ctWiryPMKQR6Vm7rMo7K6RKADntXqDhJiaJf/4udh8Ot+SelCfZeEPRLPrOv/diKGMnTF+/Gi
	JrBV2ukcKvv+H3EAxvrYjlRDiE8Jsc3MvoC+yP3Ar9x61JXCiKTyLV6R9IOCA+w6JWftYCCnjAE3V
	FBABeEKu3OOl9SZyOmxsFHdFQ3qLi6YbMNQCZRauSOFbwZMfyn7UTeRaJhzbd81Nw7VsW9VFLxaxG
	UgHuyE4W1+vDsVeo+ILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIDr-00000002HnD-0NuD;
	Mon, 26 Oct 2026 10:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIDp-00000002Hn7-3Xk6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1788242BA6;
	Mon, 26 Oct 2026 10:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3601F01829;
	Mon, 26 Oct 2026 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011592;
	bh=8T6J8yDzBrrY8+0J5W7yruUUBqoBGCuuq5Evn3v44KM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YL5aGo/39dTI+cih6/OaLzbIL/1z1YCq23fgbGwaBHXiNPAke7lmvEa2zzM0fRTW7
	 CEsO9bqaM4xGgxqQ+OS3QGoKRe23WPhnaQxWzRctSixGPIZTsxJOAdfQ0dG42FXiI0
	 DjS8A3NLtM+42EWp4oPnMuCv71SfXhd15BCPYCOCN8D/3+5ODYvu4eRKtrBfQpZEA7
	 OklV5XMgvqzIA/xLjVoqp/gfUJukcSbdXfA77Jf2a9y9NY8WxZdSvkGU+K58CGWOrm
	 mZwOoJp+YT0zruYqkaEfPBkaMFl9o7lL1k06EkjzZcXJjbp8e2B1GLVtqXQhtMBjk5
	 mFsyxAx1/kFjQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	tglx@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Mon, 26 Oct 2026 10:46:26 +0000
Message-ID: <179301154574.1773497.7405050699126931502.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020222817.1231643-1-julianbraha@gmail.com>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 23:28:15 +0100, Julian Braha wrote:
> ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> dependency, ARM_PSCI_FW, is met.
> 
> Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
> select conditional on arm64.

Applied to sudeep.holla/linux (for-next/smccc/fixes), thanks!

[1/2] firmware: smccc: provide stubs when discovery is disabled
      https://git.kernel.org/sudeep.holla/c/6cc03818814a
[2/2] irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
      https://git.kernel.org/sudeep.holla/c/40b097fdfd00
-- 
Regards,
Sudeep


