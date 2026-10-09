Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E54BCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c09C4KTZtxsB1EwbJfHre3kLSdUdymxJsJbi/9voYA0=; b=L1quoLQIPY4RFsyM2ciLtyyovA
	EKADLLYfcjHBW0jS1gE/YxmM+QZZ9ToGmYR/W3FQ8V7D3jEmSxPcMsn7+KMiF4UWliFHeg6+3c6d5
	WJ/F8LF7dG0KDh32ZH+oh1FmsxHVpjjbtlwbsfKLOIffzoG8NLCaavcnHYC9Ef4ocipzzpITeBBh5
	gRLaOVqOCXjnxUnTrcqhubLH4ddJ9y1laBdkXLIc2BMpEBFvEERKvblgK5CoRlacVhTAjSW8peHQ8
	CvRFIVVzsUBJYxMWheV+0Wk7ak3CEzWDuOkfEZt+7H54FmNV/Z9x9oGLZ+mrrx4Ehhbggq/5ake8h
	y3D6FVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA7J-00000006LI2-3fpJ;
	Fri, 09 Oct 2026 12:54:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA7I-00000006LHr-352b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:54:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D941F60098;
	Fri,  9 Oct 2026 12:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DFF1F000FF;
	Fri,  9 Oct 2026 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550467;
	bh=c09C4KTZtxsB1EwbJfHre3kLSdUdymxJsJbi/9voYA0=;
	h=From:To:Cc:Subject:Date;
	b=mMTnTzhWWbiNnDJ6gzOvtfs0hAJBQh3V3SB87jY2RW9HQ/QdHd94DCX94UrKjHj6t
	 hxzbKtwGiVGqIR/emfhal+5HbBulT+Ch+toqpZM/Na/lneJ7C8+VvV9dJdJMb/i/KK
	 iIsdn9agveAsrf7FK9H7qRCOAoH7UQWALOyIzLTPhZUd26KpHy2vogP+YW87LcESb7
	 eF5egryx0kXePamJG6XmvxfUP3QX8dEdoxj4TRO4xA79KzkUAJr5s9fk8cTNyW+qKw
	 bkPtMxwVrpFkX9Dl7WwqY1J8HN9kgyr1pz788W18ipeZNhukiawzV5YcUv2Pb4QP0M
	 exF+E0jcktZMA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 0/2] lib/crypto: arm64: Fix Poly1305 NEON resume carry loss
Date: Fri,  9 Oct 2026 14:53:52 +0200
Message-ID: <20261009125354.315476-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series fixes a lost carry bit in the arm64 Poly1305 implementation,
then adds a regression test for it.

Compared to v2 sent by Jérémy Jean, I cleaned up the verbose
LLM-generated text in the commit message of the fix commit, and I
replaced the LLM-generated minimal test case with a more comprehensive
one similar to the existing test cases in the file.

Note: the second commit has references to the commit ID of the first,
which I'll fix up when applying.

Eric Biggers (1):
  lib/crypto: tests: Add Poly1305 split-update carry regression test

Jérémy Jean (1):
  lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state

 lib/crypto/arm64/poly1305-armv8.pl |  2 +-
 lib/crypto/tests/poly1305_kunit.c  | 97 +++++++++++++++++++++++++++---
 2 files changed, 89 insertions(+), 10 deletions(-)


base-commit: 572af6872e520c7102e58362ef7cd7c2ed4342be
-- 
2.56.0


