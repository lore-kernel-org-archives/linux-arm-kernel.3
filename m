Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D88C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aO6AF+46Z3abPVk6pYW+WEXPhQwtSzKfUo43A2J5AZk=; b=td2Pp7fGU+2bOjntNraM2ENYia
	8Xbdk6d6cLQedZOxH4BoXnqaCTa9KX8IzkEI/D7q089Qia/4J/94A/RDvytawFHzhUTm0vWQC7Rsg
	19tR9M7Fmfgl8P1xywvAVCzd+W4ZQjmzBiOu/dFVJ1f89yr3HTfxhwjCTPQP9ow5+SaTsX3CCFow2
	KRCFD3vWW4lZYTcgTtn1Tzd3RRwgyJEfIsa0Z9i6ZFT8xzTIsKn7yeJtLdQs6yN/p65/6A7Xx3+p+
	ayLx8OWSgsApiGVJX0vNb4ASRmvCCNI9E8fPnMYQ7ZM8KHpgNEqCsWVYoNtfgYLigmptI2Mnwicji
	s/rO5j2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKkH-0000000CoTu-2Fl3;
	Fri, 21 Aug 2026 08:37:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKkE-0000000CoTW-0wor
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787301417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aO6AF+46Z3abPVk6pYW+WEXPhQwtSzKfUo43A2J5AZk=;
	b=ajkeXUqWkcr7ceiOHC51067dvJ4eGIiB8n0xWJR56yNyfeW7mTK7nnaBvzEUdkN+8tLn5D
	7AKj9lGGTNMpmW0NhrHXmSu+Bix07lunjdTRtV5YFux66E+LsWyf8Z4i4VBQIuvSWfrSwM
	zvmWr3A0v034DcqnUk4y+yUSowqAl7g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-475-PyzFUmBQOrGxxMAwoQFyGA-1; Fri,
 21 Aug 2026 04:36:53 -0400
X-MC-Unique: PyzFUmBQOrGxxMAwoQFyGA-1
X-Mimecast-MFC-AGG-ID: PyzFUmBQOrGxxMAwoQFyGA_1787301412
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5BF0A18001E6;
	Fri, 21 Aug 2026 08:36:51 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.129])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 829CD180049F;
	Fri, 21 Aug 2026 08:36:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 21 Aug 2026 10:36:45 +0200
Message-ID: <20260821083645.200344-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: SBAO3RU9ccgY6FhoRBZcwBb0LkGMkxVVMgFLW1xUbjk_1787301412
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_013658_402987_6293D434 
X-CRM114-Status: GOOD (  13.80  )
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

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This has been split from an earlier bigger patch of mine into
       a separate patch to ease reviewing

 arch/arm/mach-at91/pm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
index 50c3a425d1400..2193e1ab98476 100644
--- a/arch/arm/mach-at91/pm.h
+++ b/arch/arm/mach-at91/pm.h
@@ -25,7 +25,7 @@
 #define AT91_PM_ULP1		0x03
 #define	AT91_PM_BACKUP		0x04
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct at91_pm_data {
 	void __iomem *pmc;
 	void __iomem *ramc[2];
-- 
2.55.0


