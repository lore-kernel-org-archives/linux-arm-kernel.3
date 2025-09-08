Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72C3CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5l6wg9In98Sp1cT3+vqavGTtoTmprMYlqUOKy2UyFE=; b=zgxyzGHJwIv6oFjHmUW7JV3c28
	QsaafbHcD6KdOf2XQKTitBjl2rrNHaS4xgZ1o3MulIxoiA75mvPwxBBGX+m/tkNCMb+wcWQ7uM26C
	C9ZIivqO8VHREyuep6ArQOjaBO/R1TpGtbLfDxCwu1N/hj29qmqpA0CduQG83hZqAAFAVvV0XDrGI
	UErTgvv0ZSxSRlb5rvWBIwozxBy2DGLciN+4hNZIYWmN+PJ5PWNTGK/TkKMEP1uf6ahXjbygIPxV0
	eK/9m5h3I83uazoYQhZwF24SDhkcpcqExouemnjkGDusCI8IV+YxnPLMYPCHbm76OI8oL44bSQrPs
	mXFMerUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhLP-00000001pFV-05zq;
	Mon, 08 Sep 2025 19:16:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveDf-00000000apo-30MF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28276601FD;
	Mon,  8 Sep 2025 15:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB94C4CEF1;
	Mon,  8 Sep 2025 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346950;
	bh=MIQXdTqzCuyImVdiOhE8rNTbwPNyhkIPQlXgimdMFS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eS8VLBBREUZo0Z+fEkRclXc/Ugf9tnzjnb2Mkkf9ZH7jb8pD/bE2s98uC9ORSn4ny
	 eJZ9C4bOHme7m0M7Mv/BMq9ShLGnf7mVmOBlb0Q9FAtwa9qAIjgXlcoim7zO83OTxH
	 Rsqyffu0poYiAYBWvZC2gkP4W/ef/qgGHCIe6Q67gPcWgbHuyoMPwao9RO/apcnasm
	 bxQzlT0wBKTasoOvFqexeJrmdx4WjaBD+shC1OY8nwXs77VvFbpq2P7r8uMmLPFTcM
	 Rr8DWhQU7nkNQ854Ci0VY0vziXP3u7NsgDVXfq3erdZjH4fflhl1LRAxLi67QsYvPB
	 gOocdgx62KnXQ==
From: Will Deacon <will@kernel.org>
To: anshuman.khandual@arm.com,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	broonie@kernel.org,
	yeoreum.yun@arm.com
Subject: Re: [PATCH v2] selftests: arm64: Fix -Waddress warning in tpidr2 test
Date: Mon,  8 Sep 2025 16:55:31 +0100
Message-Id: <175734146103.139506.13467439064813237125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807114247.5915-2-reddybalavignesh9979@gmail.com>
References: <005af416-66fa-4222-964d-e20bd2eccb7f@arm.com> <20250807114247.5915-1-reddybalavignesh9979@gmail.com> <20250807114247.5915-2-reddybalavignesh9979@gmail.com>
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

On Thu, 07 Aug 2025 17:12:29 +0530, Bala-Vignesh-Reddy wrote:
> Resolve compiler warning about always true condition in ksft_test_result
> in tpidr2, passing actual function.
> 
> This silences -Waddress warning while maintaining test functionality.
> 
> Fixes compiler warning (similar for other functions):
> warning: the address of 'write_read' will always evaluate as
> 'true' [-Waddress]
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] selftests: arm64: Fix -Waddress warning in tpidr2 test
      https://git.kernel.org/arm64/c/50af02425afc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

