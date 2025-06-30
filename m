Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E4C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFJVBCaNVmIa+LRNfcuVusQgHetS670aTkr2XzGPeT4=; b=FQmm5xtWHfK63r0YvDYudnHWm4
	2izE8/rVFgOO/O6xZfDWZL2mv2bp4QGxkaVhT+sPd6e3Z0M8ttXX477J69WtBKsgQTyNeuqn3Xon/
	yPVID7D64j5Nj1fg06GyAL42WSpXQctd3pmIDRWCd5EYeDz0Rpx36xkIsh1sXa0FrfOPAeCs4l+ud
	1TzusPrzh6K+jVHQrCzOGXK5j6IUYYsIpwtTpJ11CISOhMuTGAX7t/46JZ+DnJn+uxwFoZBDZOKFY
	S5q9CWY1dHM0OSYBQrZmdwtY4AAf8JmVDVMuU7zYmSAdp9Pp/Cryp3bxSMdTy+aa/Xu/UG/Kb4sb1
	NHkJG37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEka-00000002PKz-1u79;
	Mon, 30 Jun 2025 13:40:48 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEXs-00000002N9W-3mO1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:27:46 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bW6L95Wqlzdb8p;
	Mon, 30 Jun 2025 21:23:29 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id D451A140156;
	Mon, 30 Jun 2025 21:27:29 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 21:27:28 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
	<tianjia.zhang@linux.alibaba.com>, Dan Carpenter <dan.carpenter@linaro.org>
CC: <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>, Gu Bowen <gubowen5@huawei.com>
Subject: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
Date: Mon, 30 Jun 2025 21:39:30 +0800
Message-ID: <20250630133934.766646-1-gubowen5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_062741_118164_5C971C9D 
X-CRM114-Status: GOOD (  10.34  )
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

To reintroduce the sm2 algorithm, the patch set did the following:
 - Reintroduce the mpi library based on libgcrypt.
 - Reintroduce ec implementation to MPI library.
 - Rework sm2 algorithm.
 - Support verification of X.509 certificates.

Gu Bowen (4):
  Revert "Revert "lib/mpi: Extend the MPI library""
  Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
  crypto/sm2: Rework sm2 alg with sig_alg backend
  crypto/sm2: support SM2-with-SM3 verification of X.509 certificates

 certs/system_keyring.c                   |    8 +
 crypto/Kconfig                           |   18 +
 crypto/Makefile                          |    8 +
 crypto/asymmetric_keys/public_key.c      |    7 +
 crypto/asymmetric_keys/x509_public_key.c |   27 +-
 crypto/sm2.c                             |  492 +++++++
 crypto/sm2signature.asn1                 |    4 +
 crypto/testmgr.c                         |    6 +
 crypto/testmgr.h                         |   57 +
 include/crypto/sm2.h                     |   31 +
 include/keys/system_keyring.h            |   13 +
 include/linux/mpi.h                      |  170 +++
 lib/crypto/mpi/Makefile                  |    2 +
 lib/crypto/mpi/ec.c                      | 1507 ++++++++++++++++++++++
 lib/crypto/mpi/mpi-add.c                 |   50 +
 lib/crypto/mpi/mpi-bit.c                 |  143 ++
 lib/crypto/mpi/mpi-cmp.c                 |   46 +-
 lib/crypto/mpi/mpi-div.c                 |   29 +
 lib/crypto/mpi/mpi-internal.h            |   10 +
 lib/crypto/mpi/mpi-inv.c                 |  143 ++
 lib/crypto/mpi/mpi-mod.c                 |  144 +++
 lib/crypto/mpi/mpicoder.c                |  336 +++++
 lib/crypto/mpi/mpih-mul.c                |   25 +
 lib/crypto/mpi/mpiutil.c                 |  182 +++
 24 files changed, 3447 insertions(+), 11 deletions(-)
 create mode 100644 crypto/sm2.c
 create mode 100644 crypto/sm2signature.asn1
 create mode 100644 include/crypto/sm2.h
 create mode 100644 lib/crypto/mpi/ec.c
 create mode 100644 lib/crypto/mpi/mpi-inv.c

-- 
2.25.1


