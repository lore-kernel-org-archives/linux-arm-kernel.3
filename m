Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15A3E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 19:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+a4BSP8SHR/hJHE6wH3OQMSs3IfQlEwgGqTouscmqI=; b=3opcNABOxkG6IIyy8UxboDxFQM
	rQsuYAVwCJDEXS+OfXQuqSdxMNNGZO9UQEUKmGHnRQc8P4uJ8pf+KnetUWvmz6HwGxjNE86zjbsLl
	lkt+YSStE2OWgieJKAh1k1NPRA1lX6R6jtSzGtoD+4uXQro77sy5czol68mX6W05kVedFNXHBn6IT
	uONfvY2wLvQUCGan+wqEQmKsktR6cuCutd2MWgc0W1R4F2CKwo1XETUwlrgWiEltW0eIE7uqfnmBq
	uEGW99gj2+owRTkKdaEQ7zyqoEbgD0tNiUeP4J26Bb1K0mYyLgTT7W2LK2yLuc5QCEJSUo4EXvI/I
	VMfyo8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZw4g-00000002xyd-0ACw;
	Sun, 28 Dec 2025 19:05:06 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZw4d-00000002xyK-1Y21;
	Sun, 28 Dec 2025 19:05:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] stm class: Kconfig: correct symbol name
Date: Sun, 28 Dec 2025 11:05:02 -0800
Message-ID: <20251228190502.2480758-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

Drop the leading "CONFIG_" when referring to Kconfig symbols--
it is supplied by the kconfig software.
This make the default values work as (apparently) expected.

Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

 drivers/hwtracing/stm/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251219.orig/drivers/hwtracing/stm/Kconfig
+++ linux-next-20251219/drivers/hwtracing/stm/Kconfig
@@ -13,7 +13,7 @@ if STM
 
 config STM_PROTO_BASIC
 	tristate "Basic STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is a simple framing protocol for sending data over STM
 	  devices. This was the protocol that the STM framework used
@@ -28,7 +28,7 @@ config STM_PROTO_BASIC
 
 config STM_PROTO_SYS_T
 	tristate "MIPI SyS-T STM framing protocol driver"
-	default CONFIG_STM
+	default STM
 	help
 	  This is an implementation of MIPI SyS-T protocol to be used
 	  over the STP transport. In addition to the data payload, it

