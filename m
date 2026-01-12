Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014E3C9EC91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkX5yDTjRJ611tuHkq5WRCO3e4WcJthRvyDmZex1GBo=; b=45WUbrzynY9OZjTECBo0kZadWe
	PBs0Vpw0z/k5uxsrn77RWVC2yinc1xqfAdIcqJmYvIOjx8kWBuWcn1Z07FvqD/mK6UKw0ROV5Coga
	EovUOAvtclrVSyhzUy9MIZWHC9rG1htstINTLMjNhigi4n5NTUh7XW1kNzlHqO9K4tLGQ+CQd0AkB
	og/3sVtXIs1OQo4Cytnsqad2l+44wVlmk/D/QUGx/1MFeED/ZU+a1zu8cSzHQe1jiObb0IhyOAG/n
	pV5IEttjtTP5Hdstu8dgtRHI7D52GOmN1Iz+msoFJ1RBv3wLc0r80CujM/cmTuKeJEgJFfU6e0QFn
	JF8c9xXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIG-00000005RUn-0CT6;
	Mon, 12 Jan 2026 13:49:16 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIIC-00000005RSK-2Dvd;
	Mon, 12 Jan 2026 13:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225753; x=1799761753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qCWXBi+aTKd9zaGMwJOJjmzr111g+vvf73F56N3N8yM=;
  b=TExuWMYfNPDuaSBWoCTZeJ9/SkESuKjEECH9XtUj/RumcB7Uc7uSR+mC
   jcDwm8lH8b6lKkolAHAdb/kKoErCAtJSVKLZ7a/+d4uFYL6DmHSe8MNYL
   GnMPFcfTVaht4a6QMj6Rx9UDi3Joq0n37aXpPmqQsAcSXDydOfmfNnwoZ
   Psw6OQg2gI9NBSem+ZReV9XfIm+6fFZ5fkQf9hTwNmNw1TZmiZRhnwwwg
   gVoDfEBGoaUzy+5BnXHaKxNfxwolUykxL1psddOruZ6Z0ad8EDzKyauRA
   vZu8KtQrsHQwiPPEUcuM7XygUXY9Wzp9g41XYU/A8iaHAmsr8pLDxHiV2
   A==;
X-CSE-ConnectionGUID: JMRysPTVTkGWT7Pgdtn++w==
X-CSE-MsgGUID: OAqzPklYRZ6zO/kJqTMh1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80604512"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80604512"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: /tOT5H3WTR6cNGHY74iXbA==
X-CSE-MsgGUID: ZOLMNcZMSb+jYMwZW8Iclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208568090"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B394599; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi@smida.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 1/7] units: Add HZ_PER_GHZ
Date: Mon, 12 Jan 2026 14:46:09 +0100
Message-ID: <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054912_627478_C3B0DD49 
X-CRM114-Status: UNSURE (   9.46  )
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

The is going to be a new user of the HZ_PER_GHZ definition besides
possibly existing ones. Add that one to the header.

While at it, split Hz and kHz groups of the multipliers for better
maintenance and readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/units.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/units.h b/include/linux/units.h
index 00e15de33eca..0c296a004e89 100644
--- a/include/linux/units.h
+++ b/include/linux/units.h
@@ -25,9 +25,12 @@
 #define MICROHZ_PER_HZ		1000000UL
 #define MILLIHZ_PER_HZ		1000UL
 
+/* Hz based multipliers */
 #define HZ_PER_KHZ		1000UL
 #define HZ_PER_MHZ		1000000UL
+#define HZ_PER_GHZ		1000000000UL
 
+/* kHz based multipliers */
 #define KHZ_PER_MHZ		1000UL
 #define KHZ_PER_GHZ		1000000UL
 
-- 
2.50.1


