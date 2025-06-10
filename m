Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BCEC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmTZZsuZ+iEhfapNz0SEcqSCuYLGAQ+VKSXs1QAIz+8=; b=O9GlSwfDWhn5fkfmY7YvLt06Qr
	f31nK7ppON38EnKAAvkzXuIQJGI0EZ8m2Kaerv9xvVuRzb5BpAxW6HWcx7ukNozlsSc04CMj++0K3
	b32Zqkg6L2d9+EhPXQ5livyEZalTtlHnT4pEFZrG/5t/0e7/mMEB+QHDjn38itBGe6DVf1D3/45yT
	duKoXOiZWaH64JRi1ueNd7ld+Aka6MVxCk+sB4H7z1qtEmXJbJ3Ii2uTAdZ5waJQ0Q/mD4eaAqcev
	dt/t4bZFe+cttZiGPWwHIX2ruMSoBVi0vN3TWJsAqWaHTX0NkHGr0q7l7tAqUR/669Apk68yLwcPi
	XFDY5ujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4uj-00000007x4S-48jk;
	Tue, 10 Jun 2025 19:45:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yn-00000007Qp2-2BjG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FmTZZsuZ+iEhfapNz0SEcqSCuYLGAQ+VKSXs1QAIz+8=; b=Qmy4WQ7c7nP8DT6oFHidF7XbkE
	FT1Wm1v3s6+uszXeHA6ZsAK6XBLjEeX54Fd4YUWr9luj1MLHJCWl/VluvWKQWf7Ec6Sgd+uXbW2Jj
	QxY0tgjsAeroRC35zmnQzPp24PfAV86CEiaG9PwY5XPGxticqUoQYDtKC/X+d3t07AvXoaiXSGTts
	Ij23q+CInTZ8pqhpYSTpQch0aWWP8YP/sPCapelknpKkxX3CPgLnp40Y0y71EWzN8U6eMQHDewKOL
	m532X7uGE/rC8PMNENenCuQXPiujFkiw56Jr1oHiH2gyddZH4FGMf8psoCi6f5eSyWBBWXjMIID70
	9Wn35IcA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yi-00000001vWz-2tDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D62724A8F2;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81EF5C4CEFA;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571839;
	bh=8AHayrsdUhbqQMcspAGbazKi3nWfZBzVE3Bi2u++Vts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZRy7mozZmTZtMXeg5kTY8XxSdQNQ8J4sjPhHeZI+koSVcL2WMvUppih5TRtunv13n
	 574/jhpTEAvnkL2ZcuJvpNNQJuVrnpVI8j0DTz9WzBSzJM7jnc48fYqTu4hRhOk/OJ
	 iT2kLT/brZGg1/j1mN2vdCc2mt7gUhUUKVTZXqdH3jkLRl+ZT7O3VOcUHgXY4sL1zU
	 y5qfJJrSY684CgknFYjqGRESPGCHmf5J7wP2V9gCMDqlsjOa9m/dIrEK9ghjoN/6L+
	 2ZfTA49DW0d1fFnp3buPNO5yVmlAMx0cuzpryDVZZ0aGDXs3dCXoksU68jy64d2cZc
	 CGrWPlVgbMInA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B67C71131;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 15:29:45 +0000
Subject: [PATCH v7 04/10] soc: apple: rtkit: Make shmem_destroy optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-smc-6-15-v7-4-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=985; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=8AHayrsdUhbqQMcspAGbazKi3nWfZBzVE3Bi2u++Vts=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4aHf6lPwZLfTr37rzZuMXQr0dpkvWbLfuZE+Svuj3t+2
 f2/5dLbUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhInBnDP7XK0ExmQdffcXVM
 M9RMPdfsesw44UyPqY7Zo7pL3xbLqzAyTJ5+ULtCpehDnRsHV35Xy+puxf+3u76KLbmkPHtT4Za
 JLAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171044_930458_412EEB24 
X-CRM114-Status: GOOD (  10.71  )
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

shmem_destroy isn't always required for coprocessor-managed buffers but we
still enforce that it exists. Just relax the check.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/rtkit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 5fffd0f003dc2f4f377faf96cce0c1ce4ff0b788..b8d4da147d23f7e99e76eea314e4d976cddbd1c6 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -279,8 +279,7 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
 	dev_dbg(rtk->dev, "RTKit: buffer request for 0x%zx bytes at %pad\n",
 		buffer->size, &buffer->iova);
 
-	if (buffer->iova &&
-	    (!rtk->ops->shmem_setup || !rtk->ops->shmem_destroy)) {
+	if (buffer->iova && !rtk->ops->shmem_setup) {
 		err = -EINVAL;
 		goto error;
 	}

-- 
2.34.1



