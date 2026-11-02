Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4D6083619
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BGWxa7f8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGp/FbGp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CEYWK6dZMstnnI6DPMgpQiEcWnhOCPU2yQEpw8GUcNs=; b=BGWxa7f8SvljbK
	TSgEAGmHq0FNfT/NAqS4i6rjJjcT/4+jMYt951PuxdVaMGdLf1YQN2FCb7cIBUNU0PGbIQrEKHuKr
	SmnvTW+m7jembEALSFejWaq9KTRB+SBJjN34KaPuLchVG5Dtxc7kyIU6FZ6A2VZoYPXYjS25NalAn
	BcIuqf0L12CVhsR39VfOrwQiTVb6CceUP0CIB81gnBqRXkkei8X1WLK6Cv4VUHBScCbjyfluNcaMJ
	N1mDIJ66qc4t7MgNiLAqiQ1GySNZO/TQV6csCCkROGpJO+0mB875VctvGrSPgHoP7Pm7ZgiU6FL7R
	W7FUrlVlNilYGP3AYrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNujl-0000000HGwA-0cQk;
	Mon, 02 Nov 2026 16:18:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNujj-0000000HGvv-1UUd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:18:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDB2242B15;
	Mon,  2 Nov 2026 16:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EBF1F00A16;
	Mon,  2 Nov 2026 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636298;
	bh=CEYWK6dZMstnnI6DPMgpQiEcWnhOCPU2yQEpw8GUcNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FGp/FbGpc0lRcpJbhvzYIYewjQMX/cGbpfWsgXEbXvFryJxqxKMXFS8voviRT1jvQ
	 cWfLJIren/DHR74/jHx//lCBojRvFDRbA/Hg4TFhX2TUw2sInVWamaC/TJDBYfs6ph
	 940xgez1STlKWRNhpHWhXKzb4A5XPDiJhN2hyd70RSm5NyfwIvMRhvtfdLqzqjIvV0
	 RHKH4VEertGeSjcsC+A8Cr7Nv8fx3Qmm1Zc/Hq1BN+zSZRdKMdvUIShZjJMMe4JW5f
	 fDFVd0egVTpH2U03jkRe+cB4BE6+hhGYM8YN/5eWo6e2eeU+LITBOXQTG3MX5PIQKj
	 D2Rk+GNQeF99w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Free mailbox state on mapping failure
Date: Mon,  2 Nov 2026 16:18:11 +0000
Message-ID: <179363627396.1026156.9462471466297757648.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028153203.3305067-1-sudeep.holla@kernel.org>
References: <20261028153203.3305067-1-sudeep.holla@kernel.org>
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

On Wed, 28 Oct 2026 15:32:03 +0000, Sudeep Holla wrote:
> mailbox_chan_setup() allocates its private state from the SCMI base
> device before mapping the shared-memory area. If mapping fails while
> setting up an optional RX channel, the core ignores the RX failure and
> keeps the base device bound, retaining that devres allocation.
> 
> Release the private mailbox state before returning the mapping error.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Free mailbox state on mapping failure
      https://git.kernel.org/sudeep.holla/c/38b6268eae65
-- 
Regards,
Sudeep


