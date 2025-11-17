Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94299CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG4H2La49IPH9JICRol1XWzBsQIr45lU2UQ86VKuZj0=; b=dYmBKFY6V7oEK7w21/8148IwKI
	Vd/l5+3c/Y7VNwCHOVNhx+97NKq5jKKPr3yWwdkqPfT9NKUzGBZfeP5gMpac+cfFAuV2E5CzrrJFe
	2qLAVfHP4vOE0Eg/UaGrwDViU/N3cfMd22AbApRXGxjaLz4HPQjqF2QMZZAX8VinHJP52+lYdZp57
	yMS0UDZml8vIE4RMZLRyh3sJI2Uy3298EefynuNI+u3oFVk68W189wmzrgG04JivovUHwEIKc0KH1
	+4jvXd5Bfgr+NJRb059OQeWMn2r2HDvu/JW+2rKaFcp4YdWhSGQH8kqVSAFeKsYrMJSGmEeSg4r/k
	2VDRxVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0Op-0000000GGoh-3mj8;
	Mon, 17 Nov 2025 14:40:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0On-0000000GGoA-1Ih7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7406F4449D;
	Mon, 17 Nov 2025 14:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E0AC4CEF1;
	Mon, 17 Nov 2025 14:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763390408;
	bh=XG4H2La49IPH9JICRol1XWzBsQIr45lU2UQ86VKuZj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=idscZYcHGv8Jv8v/H3Yp1ccb8itJfApmliuqawqYoj1TU+gC7GlNIWYig75Jfbw8L
	 5WZNBJR85ofTXv2ZDQKM7MaTdcftnDlr2fMJ5U6Bcbya1TiP2ewaqj7Asto4J8WifV
	 msAPKmlXF16VoO6GUkTDVKMw892GNoIgjLBLwi+YaUsrKLKMlm1gWXao+r7obUk2v7
	 Zjk+9xokWwv0v+iWRTrWvxiOIkvPdw47xrq26jfVTleRuINaXqV9eW2rNzT2O5iNsI
	 fqXny0ZEzZ6gbJ7erJT9bzq/HkZsJR5jbwBo0/qdn4RIAg+y/yNP9EzXCHCbldNuEJ
	 ziCVbKbEout4w==
From: Sasha Levin <sashal@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 5.15] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Mon, 17 Nov 2025 09:40:06 -0500
Message-ID: <20251117144006.3870742-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111202946.242970-1-ebiggers@kernel.org>
References: <20251111202946.242970-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_064009_365461_3FEFACDE 
X-CRM114-Status: UNSURE (   4.50  )
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

Subject: lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Queue: 5.15

Thanks for the backport!

