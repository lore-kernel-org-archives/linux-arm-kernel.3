Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1418FC97FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 22:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ou3VCAgv12mLm7V7gRrwNZ9br3OzB9kGXeuastWEcqE=; b=eOO6kYZmd8ojHpo3EeLXeNVEPY
	Cof2lRtBdTKMWrtHsr54/TUx/bZtyun0/5t1dT5sb6rTTbrgpto7P8ICh5bhABQyWHpxo6V5P7wcw
	WopBqTz6YrJroNsPBtfmzFm4+XqeKEexookimua84TpR6aF5WHoKWtteEQ9T/IMSCNjUJOTUN5h2B
	fne643+QXnt4+6nYLQU7mZwXx34bBMg1SxA6uQaYe9cruaqvsTWW4MNLjJLyAlDgCdHX4yGIxRHsx
	KLK3u5a8/mXLDVTz4etxVxg4FZwus+Kq++3VXcSlvag0ACaUOUWccn7n+LHyjTdMDPJZRJamC99cz
	Y4F7sk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ySg-0000000ANPY-0TTv;
	Sun, 29 Mar 2026 22:18:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ySe-0000000ANPR-3Uf2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 22:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E4DD1600AC;
	Sun, 29 Mar 2026 22:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E03CC116C6;
	Sun, 29 Mar 2026 22:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774822703;
	bh=t8bKj8rddtYM3Jbs12wLmW5gizkNWgk7J2FrmPL7YAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMZKB+pvpu5fxqqVroKT+MU6KLyohNGrpVaztPDLXbFpKCvOM5Zm2dEQt82yPTdh+
	 OlkrFCmrtpYCSiTF8jdczbInElDu9ZG45m8RcDpSRAQKBi9rHSZmiGyvN7j+DQ3rqg
	 whMuSjL3LNvLQAti8FELLvrAcXMeA04u6n6ZF2n6r6C1XLe9FJtBTBKcCVRu3QbL83
	 l9Gq0y9BpmnjDQbNo3NHgoHbbv7qyJOprVkbV+sasK5QzQX6PfHcFYQaTkkNYXQzlX
	 iH/hYTkTz9IcJqP5pl4eNlYD+gaWb2NY9DPIrrqbFF+/kwKVgFI3EYKqH1NdFy59yQ
	 wwbjOr19Vshkw==
Date: Sun, 29 Mar 2026 15:18:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Demian Shulhan <demyansh@gmail.com>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ardb@kernel.org
Subject: Re: [PATCH v3] lib/crc: arm64: add NEON accelerated CRC64-NVMe
 implementation
Message-ID: <20260329221821.GC2106@quark>
References: <20260317065425.2684093-1-demyansh@gmail.com>
 <20260329074338.1053550-1-demyansh@gmail.com>
 <20260329203829.GA2746@quark>
 <20260329225704.0eb82966@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329225704.0eb82966@pumpkin>
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

On Sun, Mar 29, 2026 at 10:57:04PM +0100, David Laight wrote:
> Final thought:
> Is that allowing for the cost of kernel_fpu_begin()? - which I think only
> affects the first call.
> And the cost of the data-cache misses for the lookup table reads? - again
> worse for the first call.

I assume you mean kernel_neon_begin().  This is an arm64 patch.  (I
encourage you to actually read the code.  You seem to send a lot of
speculation-heavy comments without actually reading the code.)

Currently, the benchmark in crc_kunit just measures the throughput in a
loop (as has been discussed before).  So no, it doesn't currently
capture the overhead of pulling code and data into cache.  For NEON
register use it captures only the amortized overhead.

Note that using PMULL saves having to pull the table into memory, while
using the table is a bit less code and saves having to use kernel-mode
NEON.  So both have their advantages and disadvantages.

This patch does fall back to the table for the last 'len & ~15' bytes,
which means the table may be needed anyway.  That is not the optimal way
to do it, and it's something to address later when this is replaced with
something similar to x86's crc-pclmul-template.S.

- Eric

