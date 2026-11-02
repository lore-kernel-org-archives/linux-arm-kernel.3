Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51DA6096226
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2LmbLQFW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYpvuCT0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eI0wI9+p7WOpJfp3rC9C9H32Xmag6INnn2VGhq7DbOU=; b=2LmbLQFW7symCZ
	DWUcoX3rGJn+pO6gC0fVsvE2L54hZLG9SNXxbEtZYt9RCFXnjl9IhfUN9vPXNmkGR1L8zp1TzEhcQ
	GYCWmaX6QSsWL5Lft3t4WXRBweYIG9tceR77w4NDsm4gOW6JrFmEHmj7O3QYOt9RVqfuTLWTUykae
	+z6VJHaav3yITVZe3QPJ9Ca1mlBipxfVTI1YIcksJVuUPYK56O5V5KW0aZ9y1Ppi/HdZWsHWLYFzj
	vGijR1wZrCV5sexTWK5iC8mVQDlCgUBrtDihnrSKzGw3Fq3i+tP3OMZ6mMqZnPo+MEuAN4nBu1EGM
	l7bir060rvit/uxgOgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNujD-0000000HGpH-059h;
	Mon, 02 Nov 2026 16:17:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNujB-0000000HGp7-1Vvn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:17:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCF95432B6;
	Mon,  2 Nov 2026 16:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707081F00A17;
	Mon,  2 Nov 2026 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636264;
	bh=eI0wI9+p7WOpJfp3rC9C9H32Xmag6INnn2VGhq7DbOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZYpvuCT0boVRsnbrBtGRI5PDOz73AJ7KeVEtSXZcs/s+TQQPPF1tJol1065eI/zSi
	 z4GXGC7W7yi4cCFQRCJvyYXb9UD5U1wxYhjimqHFya6cbnUvKHwcQB19ZU+9JgGMSR
	 K0mTKqGi2L7sQb69aY4QIpulFBve7el4E60dmooDYtO9KZ/nK8ra6x8t9QIzZ89osG
	 grbJPrRnAe20tBioL32GeM+IluJ6wRW/ZXdr4jcBplEQidU0KEEHIdtph8WG57uzDp
	 lewcLPc96fR3lafjS7QhgmUdWyA6DovTwSI1/YW7h+L1kleuERAPCp+3zIRbjmyHTZ
	 RAcRLfi/n2oIw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: imx: Track copied syslog words
Date: Mon,  2 Nov 2026 16:17:39 +0000
Message-ID: <179363621802.1025709.8964118647981515869.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028130502.2999676-1-sudeep.holla@kernel.org>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 13:05:00 +0000, Sudeep Holla wrote:
> The MISC syslog iterator records the number of returned words plus
> firmware-reported remaining words in the caller's size output.
> 
> The debugfs consumer uses that value to dump its fixed-size buffer. A
> malformed or inconsistent response can therefore make it read beyond
> the copied data and allocation.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/3] firmware: arm_scmi: imx: Track copied syslog words
      https://git.kernel.org/sudeep.holla/c/3baf579ba766
[2/3] firmware: arm_scmi: imx: Validate MISC control response size
      https://git.kernel.org/sudeep.holla/c/4e3652a0ac71
[3/3] firmware: arm_scmi: Unregister notifier on enable failure
      https://git.kernel.org/sudeep.holla/c/b9bb2eb88037
-- 
Regards,
Sudeep


