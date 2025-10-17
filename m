Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A802CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jds9FbQVToZMq0A1MAQ5ASuVvwS99Qk3Y0TcKZJfkuo=; b=DsvPuxAbVg621vIMhDyWCtgrpm
	J6XiQ3xo5YLP3jzX4C+a08Qez/NBeaIr415YgChhc80gV0Uj2L7AqVd9gP/MDRU6QyPJeZu6afaoC
	cq+PJezPMJLqFaTa5SgsKa3yPD0t+vV5HlD+DhXMdWwVIOGzhkzOszGD4jELK16cmEhhT4KVljl6d
	OBjTH/hBG/dSNjDF564YzLKRgZsxm1ImvS5q0UwB44l7S+JyFR+UYXNkCLnodm2mxzpQOXSs0N5wX
	OWZ6xpHg7QZncYnN6Mf0cDlEMgM/MA3VCSGEDbil6znBDJCWPgWwz8QK6nYqhL8e050ZBTRjulGuZ
	i8NhxtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nwj-00000008YTM-0gtj;
	Fri, 17 Oct 2025 17:08:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nwi-00000008YTE-2uI1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:08:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A3CE647FB;
	Fri, 17 Oct 2025 17:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C1FC4CEE7;
	Fri, 17 Oct 2025 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760720931;
	bh=XkqrYshy9f5RBQoj9MIloVV01+5FrU30jnX6f2x2zlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RU+rwgSv4iuKjVg3qskz2Da8IIqfWRx2nH5XNKYx3rABA8SniF8XOSZtxn54ONnh3
	 h3gSp1//4s+avGx+IBevbXWDoA+iH2hZUb7O/etF2nLNGAXWu8HA8HvKvFUnUC6hHl
	 1zWbj1oDGDmj9QFl27wRriu40MrUTWn31CogT/HIoUaBiVQvU0kDf/6SgtI0jbV3l0
	 yvfaIFUYDl1r8Dhmpk462kfowLQGSErbVtwGHFxTwGHCC/QmBQwGaEsFegBmya+P1A
	 OoKJw+odc+Ie2VdNaYIg52Fw1xuOV2qS3D1LYUgKMrpbsoYvuwfbxW35B+3vAVocko
	 U8o8j4vsRcCXA==
Date: Fri, 17 Oct 2025 10:07:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 00/21] arm64: Move kernel mode FPSIMD buffer to the
 stack
Message-ID: <20251017170718.GE1566@sol>
References: <20251008154533.3089255-23-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
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

On Wed, Oct 08, 2025 at 05:45:34PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
> context switch out of struct thread_struct, and onto the stack, so that
> the memory cost is not imposed needlessly on all tasks in the system.

This patchset needs the following fixup to build:

diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
index 7f02a767f675e..aaeeab0defb5d 100644
--- a/lib/crc/arm/crc-t10dif.h
+++ b/lib/crc/arm/crc-t10dif.h
@@ -17,11 +17,11 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
 				  u8 out[16]);
 
 static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
-		if (static_branch_likely(&have_pmull) && likely(may_use_simd()) {
+		if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
 			scoped_ksimd()
 				return crc_t10dif_pmull64(crc, data, length);
 		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
 			   static_branch_likely(&have_neon) &&
 			   likely(may_use_simd())) {
diff --git a/lib/crypto/arm/sha512.h b/lib/crypto/arm/sha512.h
index 8d3af965d2b34..ed9bd81d6d78d 100644
--- a/lib/crypto/arm/sha512.h
+++ b/lib/crypto/arm/sha512.h
@@ -16,10 +16,11 @@ asmlinkage void sha512_block_data_order_neon(struct sha512_block_state *state,
 
 static void sha512_blocks(struct sha512_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		scoped_ksimd()
 			sha512_block_data_order_neon(state, data, nblocks);
 	} else {
 		sha512_block_data_order(state, data, nblocks);
 	}

