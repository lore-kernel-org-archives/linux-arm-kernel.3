Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259E3CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EgJ8cza8obh4F0WjYyrhKNk+tJNJ3STV8lFyU3BHI9A=; b=F4kXvo4gdB7E82utU0DJJRp8v0
	E0yF3NqlGTcBwe21yVDUeGJryitJbG/tCtwru7QrNBsc67ckc3Et/RyZB1+DUmw3uPlNmTi1x4nEY
	Q294R31XPoqsTjARhir1uexfQoTQnw6y3DkxD8dQQvJ93k2e2nXMaR08PCrh0i0XJiPZuH+jY1j9n
	GChvuVekRXNYzxnywDhPpOd1P9uaVkyhUEYR4mNOnRHiB6/Vr31h0djLiReEo4Vc4mKKRRXAb9dIm
	wZk9zG4EyVJovm3oz+0FH9SbO2gV7g2AE5NZ4SqW3fIorY7rGIs7Rh2wdObEgc4XeE5J8rGGf1eIe
	KXe3gOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoSn-0000000H6f8-1kT3;
	Tue, 12 May 2026 14:52:01 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoSj-0000000H6d2-2AtP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:51:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778597513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EgJ8cza8obh4F0WjYyrhKNk+tJNJ3STV8lFyU3BHI9A=;
	b=mOHh3V5pHQpT8v5T9Y4zMsa37lQWDGlAP1Sdq1sZsSfe4JeqDfPxtsvY1w0OwgCWh7SBZ1
	HE+aGfiqrXSXzH0CM29/rpaMnY3UAjf5z1xqGDEieeIieJeZtJJMfeYi1A6k8zIcDS2iQW
	NqtJRDCCx+JXuoFLKKCDFDmxzkz0Dw4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel - use min3 to simplify atmel_sha_append_sg
Date: Tue, 12 May 2026 16:51:24 +0200
Message-ID: <20260512145123.303311-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=thorsten.blum@linux.dev; h=from:subject; bh=np9d+kDlfRvRjOfinM9OPjVIiZ2MZZJrAAaVMwkIueA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnMdtmNV65qhrcuLYqes/q0w9Q/Gd+3hwYks15c98Wud 07O1oNPO0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi01cyMlzZ2bdV0X3ui6WX O+PXae2JW1UZLVLh8yhMd9GTn5bVlokM/9Pm3Lt1cOuCUnU/cf6arO7j19idSi0drh+00nFhLfi 7jxEA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_075158_206256_C39627D5 
X-CRM114-Status: GOOD (  13.84  )
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

Replace two consecutive min() calls with min3() to simplify the code.

And since count is unsigned and cannot be less than zero, adjust the if
check and update the comment accordingly.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-sha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 002b62902553..7e7c83a3d8cd 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -305,12 +305,12 @@ static size_t atmel_sha_append_sg(struct atmel_sha_reqctx *ctx)
 	size_t count;
 
 	while ((ctx->bufcnt < ctx->buflen) && ctx->total) {
-		count = min(ctx->sg->length - ctx->offset, ctx->total);
-		count = min(count, ctx->buflen - ctx->bufcnt);
+		count = min3(ctx->sg->length - ctx->offset, ctx->total,
+			     ctx->buflen - ctx->bufcnt);
 
-		if (count <= 0) {
+		if (count == 0) {
 			/*
-			* Check if count <= 0 because the buffer is full or
+			* Check if count == 0 because the buffer is full or
 			* because the sg length is 0. In the latest case,
 			* check if there is another sg in the list, a 0 length
 			* sg doesn't necessarily mean the end of the sg list.

