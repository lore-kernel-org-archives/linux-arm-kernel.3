Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1AD10F2869
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qcI9XjgHO00D67R5beUMGOyLcg9xVIHG3fHhbitsjw=; b=QwsF57Tl7SWfhYdOAp0GUjejGO
	gQnmZIWhLuySAluZsDxYd8T7r/I9Amvko89QlMnkfoht4jMQ+Zfnsbl2w7hkpIBNdro3Nmbd5XVMj
	4jJdcaFw8bpXYrYCrpJlSy6C+t5BIyvi11RJCQVjeMEbWljn7rbI0Kjaddd/3D7BWXvNdEiFVQRjp
	/mCTex38XtL3oktA5yG2+kIVc/Hdv4VlKlsduI8oqXaQtKFeiBL0LU+BI0XYcTth7Kf0FUHnooarp
	Ti8GiGHXAK1nZdltRV3gNDheaJjH548GLIRliJjPAKt0v1eOeyClOf56UPK/rkt46amHKDEvOMHTz
	CHgkxEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D1I-000000087J1-1bwU;
	Fri, 27 Mar 2026 19:39:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D1G-000000087Iv-49Zz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDE9E60054;
	Fri, 27 Mar 2026 19:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457F3C2BC86;
	Fri, 27 Mar 2026 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774640337;
	bh=6m+QQM3HH64vBWB9ttrYHPv7p/YraE7ev05IU3DXyzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7chMGXe+3e7WS1rbF6pR+y/vGBrhxSxU3qNZw1UwKPw8/QT6vy8P4a51xnltG0b4
	 npraO7vFyKbiRssc/Cd2H1zqfgTF9twKPad2qQJewDwAFgeAaZBZeAxem7LtY4XANw
	 nwIRSi6DQb8HN5aB6yKQS77Q9OEQSg7kcwRQkNaWPsf7FnVMzBmQ/l6wp0RGOk6cLN
	 d3zzOp3hRVi+7WVhbYJoBosBKfd88Rc7SiKPs3wDA5C7q1tfO4MWgadLpMmokyx/Ba
	 wv5w7lGgsVi7Q7nWoFjGPdPgm2hZDSrYrnN90eufSib7wlIE0BSTXbq5NmO8XjB+2s
	 QG7/JKEyK93nA==
Date: Fri, 27 Mar 2026 12:38:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Demian Shulhan <demyansh@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] lib/crc: arm64: add NEON accelerated CRC64-NVMe
 implementation
Message-ID: <20260327193855.GA25969@quark>
References: <20260317065425.2684093-1-demyansh@gmail.com>
 <20260327060211.902077-1-demyansh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327060211.902077-1-demyansh@gmail.com>
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

[+Cc linux-arm-kernel@lists.infradead.org]

Thanks!  This is almost ready.  Just a few more comments:

On Fri, Mar 27, 2026 at 06:02:11AM +0000, Demian Shulhan wrote:
> - Safely falls back to the generic implementation on Big-Endian systems.

Drop the above bullet point.  This patch doesn't explicitly exclude big
endian.  Which is correct: Linux arm64 is little-endian-only now.

> +	/*
> +	 * Reduce the 128-bit value to 64 bits.
> +	 * By multiplying the high 64 bits by x^127 mod G (fold_consts_val[1])
> +	 * and XORing the result with the low 64 bits.
> +	 */

That is not what this code does.  How about something like:

	/* Multiply the 128-bit value by x^64 and reduce it back to 128 bits. */

Granted, that doesn't do a good job explaining it either.  However, a
full explanation of this stuff, like the one in the comments in
lib/crc/x86/crc-pclmul-template.S, would be much longer.

I suggest we leave the full explanation for when a similar template is
written for arm64.  For now brief comments or even no comments are fine.

Just if any comments are included they really ought to be correct, as
otherwise they are worse than no comments.

> +			scoped_ksimd() crc = crc64_nvme_arm64_c(crc, p, chunk);

clang-format doesn't know about scoped_ksimd(), so I suggest overriding
the formatting in this particular case:

	scoped_ksimd()
		crc = crc64_nvme_arm64_c(crc, p, chunk);

- Eric

