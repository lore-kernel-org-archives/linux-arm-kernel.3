Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29278CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4LolNj5RgXRiJp9WHX5KF7cNBaLE83TgO48U4ZXlu/o=; b=YLQo25bpuPYJ3S9KWaixQhMnWD
	aMYokjQA/bIPI4cicopDNvsDgvfym8Vk1f+RDkj0GTGdDhZ+56RvExAfPzF5RYcMxAacIB4S3uv5S
	V5BWo7ChF1X8XV55RPJ42bIBG51qG/BAPGwpiW9R1qH9oNQd2JV+YDm+1hO+0qzfbWAdtOwY2qPdG
	hD5FZR5Cgl+U4EIKOuz4dlXrvLD/Id2a9LWmyEjlfH+T6Rw3OD5hiH+lAxfGs7WKiDFpLzdeIXKXN
	fYKFljHDsIcomXsN3XIgbWgkjYO7JKrrkpaXBbZ2RSJ+evv1HLoYWcfLZr1MUpXJq9fLVJmU5Wo6S
	FSbhuJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5kq-0000000GHK3-2zq4;
	Wed, 14 Oct 2026 20:39:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5kq-0000000GHJk-0dvi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8225E43B85;
	Wed, 14 Oct 2026 20:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 590B4C2BCF5;
	Wed, 14 Oct 2026 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792010355;
	bh=COt3GvWqWgF0CxI9plDeQb5zlZ9CoK/iukULf+JUTd8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OnRqdUeje8h7xcsJrIWm4dgO6n/hNW17viy2Nzy87dNFsiI1cfChmAmD6QpUXHsoa
	 dVkc6gsS4TwWl769C+MA+/BEiwfpBDHyi0UEOVpJonnKhiba2IReecOiP99qGOx143
	 VXUWaWoQL/HbYK5qmAra/jCe+o8bAWyC9rGJM2ijxxVG85Sw6JD/b/xnhDhIi6GbBE
	 lrjtUHy6150ZRU/fUJDrPPVMiXvCF5c3s+HHXYWKGfcH2Hea9rmtgWuvQhIWQ/RBlb
	 IolWh+E6AQgPx78DL3G7K8kEifqND/K5ev4X4X0ApDR+AfidJszsB5hPMHx/wjpUG+
	 f/sOXhS7hoMyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B74CC6B2D;
	Wed, 14 Oct 2026 20:39:15 +0000 (UTC)
From: Vladimir Kukharenko via B4 Relay <devnull+vladimir.genproof.com@kernel.org>
Subject: [PATCH 0/2] lib/crypto: chacha: Handle lengths of 2 GiB or more on
 32-bit arm and MIPS
Date: Wed, 14 Oct 2026 20:34:20 +0000
Message-Id: <20261014-libcrypto-chacha-32bit-2gib-v1-0-e0719ca0be89@genproof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3nz2oC/zWN227CMBAFfyXyc428tpOQqKr4D8SDL2t3C0nAN
 qgV4t8xl0r7MtqjmSvLmAgzG5srS3ihTMtcAT4a5r7NHJGTr8ykkB0I0PxA1qW/Y1l4/dfjSlo
 qXEayvDUKW1SdER2wajgmDPT7tG93L85n+4OuPJTvRcLTuWbLa8YmzNk8s2Pz+V+FVnZCr5RUC
 gQHjpZixJQ3e0wzHlZLil8PnTUZuVumicrYaBF0HwwIAx4G1+ug1waUH3or0cLg22AHtfZsd7v
 dAVdR8MAIAQAA
X-Change-ID: 20261014-libcrypto-chacha-32bit-2gib-5a3e5e36a061
To: Eric Biggers <ebiggers@kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Vladimir Kukharenko <vladimir@genproof.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792010354; l=1694;
 i=vladimir@genproof.com; s=20261012; h=from:subject:message-id;
 bh=COt3GvWqWgF0CxI9plDeQb5zlZ9CoK/iukULf+JUTd8=;
 b=rnntLP2QYnFZTNLD0UoAJH+5N82xB9Y7wkvlKAyjJogo7+gLjT1eGgZHZSfqMxSU84345q47Q
 +cvgDd+YaR9DXMeWRNqIYZDj/OTr3obKCf6qGcBhKWqNd2UzOwlcVWW
X-Developer-Key: i=vladimir@genproof.com; a=ed25519;
 pk=EqOzBSKBgFn7ExzKj5f9T8u+1yTrGVlLBwf3fj/sdHM=
X-Endpoint-Received: by B4 Relay for vladimir@genproof.com/20261012 with
 auth_id=1169
X-Original-From: Vladimir Kukharenko <vladimir@genproof.com>
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
Reply-To: vladimir@genproof.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 32-bit arm (the scalar code) and 32-bit MIPS, the ChaCha assembly
treats the length as signed, so lengths of 2 GiB or more are still
mishandled after "lib/crypto: chacha: Use size_t length", since size_t
is 32 bits there.

Patch 1 makes the arm assembly use unsigned conditions.  The MIPS
assembly relies on the sign of the remaining length, so patch 2 instead
limits each call to 1 GiB from C.

This applies on top of
https://lore.kernel.org/r/20261014152604.323310-1-ebiggers@kernel.org
Feel free to fold these into your series instead.

Tested with the lib/crypto KUnit tests in QEMU on arm (Cortex-A7 and
Cortex-A15) and 32-bit MIPS, plus a temporary 2 GiB test on the
Cortex-A7 and QEMU user mode runs of the MIPS assembly.

An LLM review found these bugs; I used an LLM-based assistant to write
the patches and reviewed its work.

---
Vladimir Kukharenko (2):
      lib/crypto: arm/chacha: Handle lengths of 2 GiB or more in scalar code
      lib/crypto: mips/chacha: Handle lengths of 2 GiB or more

 lib/crypto/arm/chacha-scalar-core.S |  8 ++++----
 lib/crypto/arm/chacha.h             |  2 +-
 lib/crypto/mips/chacha-core.S       |  8 ++++----
 lib/crypto/mips/chacha.h            | 20 +++++++++++++++++++-
 4 files changed, 28 insertions(+), 10 deletions(-)
---
base-commit: 40f47fa10a1d19c74f48a13d97b2eb19d5fb938d
change-id: 20261014-libcrypto-chacha-32bit-2gib-5a3e5e36a061
prerequisite-message-id: <20261014152604.323310-1-ebiggers@kernel.org>
prerequisite-patch-id: f66d78884d3d0cf68e1efc9635c084c6b700352f
prerequisite-patch-id: 64c39ea52fe4e25501701ffa262fb3525af29f0b

Best regards,
--  
Vladimir Kukharenko <vladimir@genproof.com>



