Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D0FCD0423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7JV/PJ0VnrzWpBv4LESf97hWHvhonfUJamLTdd+SvM=; b=IgF4eI1YlGrQTChaFevT3tISBe
	YIpg9IheVWocbnn8yKZw0jq995IVLvZvWzy5IWH9GWm2+hHOieHYbM7eH4d3doP/dfmP4OFK5vDTO
	zDOfNEjsRCBjqaNDK8dCahqa4jiuS/Ihg7jJvbR1pEGmFi4KbQ5SsK8RWJOFUU5q4I3AOiubdz8Wf
	U1+RtXUImBwixRY1yKJWAuvEU8eQJdJFTYxEwPzDvdAJ88D8p6fWH8W2RzPpK0DceUrqVPV80yr9U
	ZQqe2nzJv+x9qPVv8GNLyj9uJKE6YgjqlUf/3gTZ5/jPD6uqgiSAKhmjEdmvh4o6j6MyYhRXVT2QM
	WPNuX9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXa-0000000CD4C-30s8;
	Mon, 05 Jan 2026 22:59:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXZ-0000000CD1u-0ANn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEF2744189;
	Mon,  5 Jan 2026 22:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C25C19422;
	Mon,  5 Jan 2026 22:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653948;
	bh=mjbsh5qTsWiK+bL9N+lcIzG0oeu7SbZwJAqsk6DZtZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KqZDpgzzTWS+c/2QXiq/v/J7NmbO7ILss8exfk3eSj8L2zYvix7/ZDY6YEIknZLWe
	 FpRw1hjFCwKszZ9aNsXLyG9S3+EybZNzMCez1zXD/ipLfJj4axjzgEzaQ2vE9RHy2d
	 oNPNn72qyclj0t+0DddSe/43RKPLNjlVWd7WW53s0tygrpoOLp2uHbe9dly/4BOba0
	 pM9bOKBfSEk8vWSvwLzWwmeldPsN4pYBtXmmkENKiprTz6PI8eb0OPwrl5i5tmTZZp
	 K6ViYlHOkbkdajt65tSVHcRnqUDNp9q+RQ03aBTp/a+KaCXzlNOerzXR/iFypoPjtW
	 NnYRTs3WEDW5Q==
From: Will Deacon <will@kernel.org>
To: akpm@linux-foundation.org,
	pjw@kernel.org,
	leitao@debian.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	coxu@redhat.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: kernel: initialize missing kexec_buf->random field
Date: Mon,  5 Jan 2026 22:58:29 +0000
Message-ID: <176764846370.1457992.3931677360070887996.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251201105118.2786335-1-yeoreum.yun@arm.com>
References: <20251201105118.2786335-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145909_105228_E177BEFC 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

On Mon, 01 Dec 2025 10:51:18 +0000, Yeoreum Yun wrote:
> Commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> introduced the kexec_buf->random field to enable random placement of
> kexec_buf.
> 
> However, this field was never properly initialized for kexec images
> that do not need to be placed randomly, leading to the following UBSAN
> warning:
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: kernel: initialize missing kexec_buf->random field
      https://git.kernel.org/arm64/c/15dd20dda979

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

