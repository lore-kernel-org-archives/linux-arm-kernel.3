Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD06C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KjynJ2iDpp55Qa/iGoDoKteY9QmQneQsXJpkrRU1z8c=; b=4vHIYYlNsyH+JozR+FNupi1Xjp
	i4gSBvE6uPzozLV7T2dLdL7qN3Btr2Ti04sJ5/Q0vGOxLLPhoTCNG9xsviEJel9/pbPwW0GNWi5KL
	WSKjK8IEr0Q4L9bgpqRGt2ddjh7DXN2ylWijicz7ACsg1mJhttEgN4bBjVxv7Icahp0ZF0gq69JOS
	oHL1IDpdOt6kSzs7txID7DEhs8fZgJ35oa9ca3G88Ny5URd+OpU3eh1kJDKk1uStPg1i+P5MyE9qq
	qWi+EXH0+8rk3Azt9bQxVMFXfWQyP0NcB2+W16tb1OMwwZTYoVawfl/6QFZizHZlWWJh16TMtum6F
	9dkkYelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpjr-0000000868M-26if;
	Sat, 22 Feb 2025 13:40:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpiN-000000085yw-2Lde
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 13:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BD6B61132;
	Sat, 22 Feb 2025 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45F11C4CEE2;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=YvDVaUlNxk0FFYVh0Uih/QBxDdTXOT7A8XEjDIMtIh8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZhE5nsTRYzQ+xatxbsjltkmXjh4yz5WSZQT0ORjz/ia6DJh/+c0KCvrgkMHMyfvyU
	 bXNgj/KMZL8hfTAfvtWD5nWhDyjoN3LUGVlwwPKv/fkxV8gAcp4vtjWk2Dfa4HLGgn
	 4h3Q2Y2F7/0SwRmqdCJVR5zQ1UPd03x3J0uol3c4L6bbbUwBYTbKGW4/iANsTgpi/R
	 tzscufz5qnk6PQ3YazNK7IIvefqcVF7qgsUzqjiVNW3zC0wDff35tKvJFhYzgw/Ru4
	 uOOl4hdcJIjtWojAHSS7G/G4ZxjdwyIKk3P96DzWVYRUaM4FyJuOah+KTjxWqFDHnj
	 yuLhSTAtwKpEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD68C021B6;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
Date: Sat, 22 Feb 2025 13:38:32 +0000
Message-Id: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjTuWcC/x3LQQqAIBBA0avIrBNULKmrRAu1qWaRiQMRSHdPW
 j4+vwJjIWSYRIWCNzFdqUF3AuLh046S1mYwyvTKGCWzZzxJbvQgy1EPMThnlQ0e2pIL/qEd8/K
 +H5oY4NteAAAA
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=YvDVaUlNxk0FFYVh0Uih/QBxDdTXOT7A8XEjDIMtIh8=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy5HrJq+aLtY2ozoptL78762o7OM1P5+2PDjD8rfuR
 uLhdnuWjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEPq9m+B8UVsSsKB6l/aLM
 SGmO1TO/xDc3TO5efhvyobe+eUXa+heMDF84zpXYKKjnr520yNlii5XDksSac68jXTJCt34JMb5
 9nREA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series adds a few fixes/improvements to the error recovery for
Apple/PASemi i2c controllers.
The patches have been in our downstream tree and were originally used
to debug a rare glitch caused by clock strechting but are useful in
general. We haven't seen the controller misbehave since adding these.

Best,

Sven

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
Hector Martin (3):
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Log bus reset causes

Sven Peter (1):
      i2c: pasemi: Add registers bits and switch to BIT()

 drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---------
 1 file changed, 92 insertions(+), 29 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



