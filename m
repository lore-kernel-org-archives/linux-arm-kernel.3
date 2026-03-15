Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0F210854B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 00:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+o1XqCalYQnA+laKSrp8glNJDq0vbkvOj4gOv4j37E=; b=pVMmC0+A5EXc5pmkLqlmGOWP17
	QkVPWMh8X0WZZkcF0BPCPc3qbJ6AvcxytpeArFWe4c6o9/7BQzPna7Axb4bGRb4Ins4eXh9i1z7dF
	bDJWMpHKebnoSrzeFY9ega8BrfpcX/0BuoadwoajsieiI/Cd/sxKKdf6JpqRRjBK8srr5NaclqBBX
	XF7dSY8496BULDmnfdNGk8fTOF18fblgthPAGDytdEuQRxCE5vG3y0hvUJMtXQCsCtEUF/Qw+xyb4
	yU2e1KgeR2t7xJ/VInj0zucDlnErk6QsXeLvn3E9y1yFj51ohHGOhw+mJ9QCIByrPTY4thlPWtfa6
	zqeBR5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ZZi-00000002Gx5-0VBr;
	Sun, 15 Mar 2026 00:43:22 +0000
Received: from smtp.jvdsn.com ([2603:c020:1:bd00::1:3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ZZf-00000002Gwj-04HF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 00:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
	t=1773535396; bh=LU1uB/HE/c/73zPowr6km/30RYw7pRFXyU+zsrSKI7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AL1xq9CHRXZnZYKrXiPg8HC0aDmz6xDNbxJnMgiI4k1KnR4DtrDcPBUcPTCpP26+Q
	 Cs5iJ1A1EwiJu2XFsfvxB1e0+MLDNgt1MavHb3UUtDmwWL/UqfdX7At6lCt6WQuBVq
	 /6e40lRRX99Q1HD8Vu7kYatWyOR9uu01tTvcL2/ahsPHwQYsZILfbyosb6+9vR+4D5
	 kMx2tc0J9m68A1pp4K45Pe6OT6LVU3LrfdcEsAKLfMgYBM9mHqS2xjgncHqwvw/IF8
	 TSzNQzLfuJ1/6wMvVO/MsGJYj9+G2oSE7z3RoAADQ9wP+n4ODySKTFoP3CHfRt3gKz
	 KZ4YXmGfqG8mw==
Message-ID: <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
Date: Sat, 14 Mar 2026 19:43:15 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Joachim Vandersmissen <git@jvdsn.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
Content-Language: en-US
From: Joachim Vandersmissen <git@jvdsn.com>
In-Reply-To: <abTuFto8Tc3mhRRe@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_174319_145236_B400C0AE 
X-CRM114-Status: GOOD (  13.11  )
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

Hi Herbert,

I don't think this one can be applied yet since dm-integrity still uses 
xxhash64 through the crypto API. This would break fips=1 systems that 
use it.

Kind regards,
Joachim

On 3/14/26 12:11 AM, Herbert Xu wrote:
> On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
>> xxhash64 is not a cryptographic hash algorithm, but is offered in the
>> same API (shash) as actual cryptographic hash algorithms such as
>> SHA-256. The Cryptographic Module Validation Program (CMVP), managing
>> FIPS certification, believes that this could cause confusion. xxhash64
>> must therefore be blocked in FIPS mode.
>>
>> The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
>> ("btrfs: switch to library APIs for checksums") recently modified the
>> btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
>> API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
>> mode should now have no impact on btrfs usage.
>>
>> Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
>> ---
>>   crypto/testmgr.c | 1 -
>>   1 file changed, 1 deletion(-)
> Patch applied.  Thanks.

