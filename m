Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862A8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQtVdU4BeC2AMmbgJ2ufg8rg5ddlBHc8GgL90KZnHzU=; b=RbF9JvhriTBx5ojgHe9VfNkGph
	qGjgIm/nCtieL1QALqMEce9vGeJY2gM7Q5h4m8CsC5dWYypVGGeRmp5yunJNM7lCzH1pyfbUlMa5N
	07rtGldOGsGsGFM76TZdpVOEWGDiX+PGuERDtZYMgWAszSSXr/lYlTDqp5Wzcb270f3YNr147dxtT
	ZZR883SyQTFhbT5vQoCgcH62ZyU2TZKV4JGXG8gXEcZnebxGJeUxmDsfCBCLZq6+7hc4ooWLiVw11
	zjyXQCcScgvePVeetsMkdA+rBuKGdSKfRw9CapkP/XEjv6VVx8yC30lbfPnYRXd1ImO5lXoHCtbba
	qxgihrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9g-0000000BZTI-0lh0;
	Mon, 20 Oct 2025 00:53:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9X-0000000BZNV-2x4x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A35E45BBB;
	Mon, 20 Oct 2025 00:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08420C4AF09;
	Mon, 20 Oct 2025 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921615;
	bh=Hauj1v8AzIcWYsh5CTOeRlzypb0Dv3HdLIY/wCgEtzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EDmcNoYSTLKuVAnezV8raI05zhSi+N8DFRp5eUI+SDDMEQx4A3Mi+XXEyv8kGwS9H
	 mfsiBZOBedmzyu4nmcPr4bmk+suPDgv0bollZO8GCcnM9d3HW/XHoLopB7XAPRttT8
	 ILXgXsR82tNvVEzfu/dSwY2hS1dVzqtgPmQF5jWfTKlFV5ARz+6VvMp6ycsodwMBqH
	 7h6cn3vxwdujzqKx9Kwtmz9g0HC1wQdeph9vx1px3QV8Sp0T/5JVBSKDmLVdJ+i0NR
	 7eGFPwi5GdBWcyMgbJ+lnupzJRhvo7uxeFOT0KqAMY5/y9vsCt8VK1UHi+T48wFc+c
	 S9X4Wqc+dep2Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 08/17] lib/crypto: sha3: Drop unfinished SHAKE support from gen-hash-testvecs.py
Date: Sun, 19 Oct 2025 17:50:29 -0700
Message-ID: <20251020005038.661542-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_175335_763760_2B75EBCA 
X-CRM114-Status: UNSURE (   9.14  )
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

The SHAKE testing doesn't actually use gen-hash-testvecs.py, so remove
the unfinished SHAKE support from it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 scripts/crypto/gen-hash-testvecs.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/crypto/gen-hash-testvecs.py b/scripts/crypto/gen-hash-testvecs.py
index cb6f6cfbedeb2..ba241cb1ed2fd 100755
--- a/scripts/crypto/gen-hash-testvecs.py
+++ b/scripts/crypto/gen-hash-testvecs.py
@@ -59,14 +59,10 @@ def hash_init(alg):
 
 def hash_update(ctx, data):
     ctx.update(data)
 
 def hash_final(ctx):
-    if ctx.name == "shake_128":
-        return ctx.digest(16)
-    if ctx.name == "shake_256":
-        return ctx.digest(32)
     return ctx.digest()
 
 def compute_hash(alg, data):
     ctx = hash_init(alg)
     hash_update(ctx, data)
@@ -166,9 +162,9 @@ print(f'/* This file was generated by: {sys.argv[0]} {" ".join(sys.argv[1:])} */
 gen_unkeyed_testvecs(alg)
 if alg == 'blake2s':
     gen_additional_blake2s_testvecs()
 elif alg == 'poly1305':
     gen_additional_poly1305_testvecs()
-elif alg.startswith('sha3-') or alg.startswith('shake'):
+elif alg.startswith('sha3-'):
     pass # no HMAC
 else:
     gen_hmac_testvecs(alg)
-- 
2.51.1.dirty


