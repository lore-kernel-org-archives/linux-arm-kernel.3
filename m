Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E5CEDB7DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABbFXHA17YPeSFOLyaCah4wP7kD1esZ+i8H/VX/7EME=; b=c++FXDHt0sCbrKSXNvMlRQjqon
	2UAuPhJ2a+/38NOxYEpq2DneTSnaCqshfYm6icfLm24ZwjQlEBTMHPiKAxVmmonYxHUVXWjG7S3UX
	jBbN1MdhP4PJ4O6u24oEotNUhim0csCJNZrLHyQ7FteQczjkdBcL4Q6DOk6rXYrrJqF9NKG+Smttz
	pJ+BIVOWY75Pk52BWfqkEVulckmn0T35MatI8M1458Yb7/N8fuBeyjS/MhHJRkqy6f1ob47tXo7wC
	k69tTBtU9CRKr5UgLBV8Vgeh6IGD0TUBf7OobuDxjAlS0LSbp0h/2+13Wstt+feWAhg875s/LDzjV
	UtFiAJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3Kt-00000006GMj-2IMZ;
	Tue, 07 Apr 2026 10:07:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3Kr-00000006GMD-3d9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAF32600AC;
	Tue,  7 Apr 2026 10:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEA4C116C6;
	Tue,  7 Apr 2026 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775556424;
	bh=6DCORM0s4E03aenlwjof26fclnBM2ZPHGMHWcvXFWns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zi4On3b/icFf0lBSlUCxvaQJUmYHZV6hfANopI8dBnGTl96OydFIYSZYf/TZsKLqy
	 DcR3/rxNFavm4Wxb9U41aa7SWMomDx6dZz6lmn0lazVtCrW1Z1gZEVwJYZb96FbLvS
	 UEzfyQIKNubQlukKrfviqnniTUkIOFI8+gpRSdu4CFs0HU7YejwdfTY+OBWdg6Dfat
	 JW6a2NmekDBTxehodRnaJMAEozcf9HNsQ+PQSVXDTLT15StS7uwRnURHaTkKmROrW5
	 RLLx7NWGM+4ezo1qlm2DWWLaeVvJSKgyr0OvXW3AV9KFxzRPxK6qp6fOIthi3Tty8j
	 eVMB/XivUp3Ww==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	android-kvm@google.com,
	Sebastian Ene <sebastianene@google.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v2] firmware: arm_ffa: Use the correct buffer size during RXTX_MAP
Date: Tue,  7 Apr 2026 11:06:58 +0100
Message-ID: <177555638623.3149203.11228894617554022145.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402113939.930221-1-sebastianene@google.com>
References: <20260402113939.930221-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 02 Apr 2026 11:39:39 +0000, Sebastian Ene wrote:
> Don't use the discovered buffer size from an FFA_FEATURES call directly
> since we can run on a system that has the PAGE_SIZE larger than the
> returned size which makes the alloc_pages_exact for the buffer to be
> rounded up.

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Use the correct buffer size during RXTX_MAP
      https://git.kernel.org/sudeep.holla/c/83210251fd70
--
Regards,
Sudeep


