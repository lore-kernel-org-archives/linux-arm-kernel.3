Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NdT03oGF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QWbjlLOr+8hkpwlUSwLszIplc2RXylAKoniq+0KkMAI=; b=NdT03oGFwShub2Js85udWWP7x2
	zcQIXNEnUqNfWdOaHI5G8J6t5ZxXshVYc2O1rv25fS4K1n/C4PHLbluFFT2C0JxkWdn2tXEL0YPJQ
	jUlIYD3NG3oemyBUI+p/ah2oIBOoibu5K5vk/LnKNmmZ1RVA2KAKm71qBWQAOuH+eHWwXu9DbmDsz
	eIy68EPHeekeozMTBi63SusPpNWs78M/sYzOXWMT5boQnbLR4Hj0+tqOLjyv5QOnH7tufJlnH6Cb8
	R6/z41KNbNiDmQzHM+PLgMee9JPV69lJla7il2DYRIpuhymuKA5KM+ZZlxodwa4OgGTTHhQ02oL1/
	9KQYLp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS9M-00000004Hfh-3uQO;
	Wed, 04 Nov 2026 03:59:00 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS9H-00000004Hf9-0Jj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:58:59 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 4 Nov
 2026 11:58:47 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 4 Nov 2026 11:58:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH 0/2] gpio: aspeed: Fix lost interrupts from
 write-1-to-clear status bits
Date: Wed, 4 Nov 2026 11:58:34 +0800
Message-ID: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqt6moC/x3MMQqAMAxA0atIZgOmFAevIg6lTTVLWxsVQby7x
 fEN/z+gXIUVpu6Bypeo5NRAfQd+c2lllNAMZjAj0WBxLZLRaWEOKHVHPdxxKlL0hpzlEH2EFpf
 KUe5/PC/v+wEVUbMRaAAAAA==
X-Change-ID: 20261104-gpio-aspeed-irq-status-1fc21a4edfcf
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>, <stable@vger.kernel.org>, Aaron Antone
	<aae@amazon.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793764727; l=1310;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Spxhcm05RN8n5Sh9TZW9A+mV+AO88j/EoIbdaSDAC1Q=;
 b=8g/Xu7pU2y1fekmgY5p4e8m8VTtBLtTYoqVWdQqsYQcNcbyBEVhAedQYqRNqcERFOBFSADxdx
 TTpXNzDJzH2DlwXjM5x/4B7aOHlLrSzdi4D7Qkn8sa3pN1cll6XdZ9m
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_195855_147050_FDA37E4D 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Aspeed GPIO interrupt status bits are write-1-to-clear on every
generation, but the driver updates them with read-modify-write helpers
that write a pending status bit back as 1. Each write therefore clears
interrupts that have not been handled yet.

Patch 1 fixes G4 (AST2400/AST2500/AST2600), where the status register
covers a 32-line bank. Acking one line clears every interrupt pending
in the bank, and an edge that latches after the handler has read the
status register is lost. This was observed on an AST2600 BMC with two
lines of the same bank toggling together at host power-off.

Patch 2 fixes G7 (AST2700), where each line's status bit sits in that
line's own control register. Updating any other field of the register
while the line's interrupt is pending clears it.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Billy Tsai (2):
      gpio: aspeed: Clear only the acked line's G4 interrupt status
      gpio: aspeed: Preserve the pending G7 interrupt status on control writes

 drivers/gpio/gpio-aspeed.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261104-gpio-aspeed-irq-status-1fc21a4edfcf

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


