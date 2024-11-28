Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA35D6D25E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 04:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyk7Iou25uRg3TCJZa+tSFUnZozoGmQKQzSvVwcJ1m4=; b=BfJQZTSvn5Dmc1H2QTCFq1k8nL
	c7BTiV9UchFycVdfH5lQbmbY9UMB4bo6zDDelGZpI8CeEtmDDkevYOeIdsv+aygMKXIImlEA3pOZl
	aGF7MmPkuAJ8ZOYLB+USuUn0cHPKCasGdEIiiqO4bA9rJKjdvZlDuYbnRNxFSHippLsf+VH4bjKwW
	6FPIrnMBuWAm7E10GQWO9Et/JURSZ39ra5CkBZbwwyhtUFJy4oLe1tIw6ai2rGTaLyA+fPX7nCg36
	LXOTK8WR9kVU1O5WyebPVPj7y5c+PfMoK2lgkl6Hd9buOf/QuQtnYdjQa0V69ZCdtxRnSQdWrnQcY
	phUsUqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGW7w-0000000Eg9x-0ezM;
	Thu, 28 Nov 2024 04:27:40 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGW6x-0000000Eg2v-237W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 04:26:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-724d23df764so459650b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 20:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732767998; x=1733372798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyk7Iou25uRg3TCJZa+tSFUnZozoGmQKQzSvVwcJ1m4=;
        b=jwiXROO6M/+EfOtekdbI29fI7+4qhpfxeRD809i9hSBO4uIPvDdm2k63M7M6Kgd5TD
         5/22I9vbdmoGL003sKTo2Bd4HZHI+c/umBNE/H1+SE+weu3B7fWZbgZsTi0ZrpWGauNA
         G8jQ5s3Ic7ZLnMki3ucpmu1o2cVkkVcJKZjYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732767998; x=1733372798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyk7Iou25uRg3TCJZa+tSFUnZozoGmQKQzSvVwcJ1m4=;
        b=CAUynDq6Fyknjl92JN4+mUpORSYDuw/Ks+wCOga+nI7qOXXKEhjEa9IwxtfmnhjEdj
         3AAefWRPQH5Nvr9153PSoo+cwWMkcL0yFwTyaGJR5U7Ji96D9SyCBMadIFYF1PkA5cE5
         XyCBEzte0NEKKorATJv9x+gt9huH8XQt6gtz4OMmthk20Iyal/j/GLr5AsTxmDYAjcr5
         DT6P9rUkQAUNioo5LWL0BycadmcJ6S2pmb4XGpRIW60cwf+S+N3yICLefiOoYMws2olO
         qtMa5/VgIOegjrzjnzW70eocDlqPs3RWem8/llQeWPkeFytDyE5HMyWeiqbXxAfwFeHw
         K4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUT42otZ2v7poZ6aYx2vSqf6/OqvYrNNeJ+b6Jou1qjUbwVPNnTC9/FzG4Dp9QijNwaMkIXdfYscuomP4l+2XzO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Z3K13egoyyPb7/OfrtWcvPqOXGsU2fQpXP83gwBQ+lP5cfvq
	0oCinOZK6y59V7JqwrMlKHfbBT8QWY0TNEVWdnDOaNrcAPNFurJ9Ybo6ninzig==
X-Gm-Gg: ASbGncsD9RJLEw9aIUTrb+WeACAb7jkFt737XUzL323pWjE3pCc/mRIQbI6scPkujRg
	nBQ2H4+dw0a0uTiONQSOo8HXOMjDDdtmzY00YWTGpAWueRoO9ndX8aUNxWQtRUFrSWshECpk8fi
	iL/xeXDd8SIj/W0jMIP0garxMBc79F5Qdja9/y9Hwpk7emNu8Y1mSE7jezeoG8nQayVm/L2ARW8
	xtGLUoHoSGfLSy359swGKXzOd6Qf7aaIrPFXY61dY605PC+LZVH3DvOg9QoGNj8dGKJ
X-Google-Smtp-Source: AGHT+IHeZNuSWgVtWvTDokMDlIw4ArRKKjwJZ33jbZfsR02Ur3asny/Ji3uLw2rlY2Y0R8BhHPJDpA==
X-Received: by 2002:a05:6a00:3d0e:b0:725:14fd:f62c with SMTP id d2e1a72fcca58-72530078935mr6645836b3a.15.1732767997932;
        Wed, 27 Nov 2024 20:26:37 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2db5:507b:eafb:b616])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541849509sm439133b3a.197.2024.11.27.20.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 20:26:37 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] of: base: Document prefix argument for of_get_next_child_with_prefix()
Date: Thu, 28 Nov 2024 12:26:30 +0800
Message-ID: <20241128042632.231308-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_202639_547522_62132E20 
X-CRM114-Status: GOOD (  15.14  )
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

When of_get_next_child_with_prefix() was added, the prefix argument was
left undocumented. This caused a new warning to be generated during the
kerneldoc build process:

 drivers/of/base.c:661: warning: Function parameter or struct member 'prefix'
 	not described in 'of_get_next_child_with_prefix'

Properly document the argument to fix this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411280010.KGSDBOUE-lkp@intel.com/
Fixes: 1fcc67e3a354 ("of: base: Add for_each_child_of_node_with_prefix()")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
As requested. I assume Rob would give an ack for this to go through the
I2C tree since the offending commit is there as well.

I also put this patch on git.kernel.org hoping that it gets some bot
coverage soon:

    http://git.kernel.org/wens/h/of_get_next_child_with_prefix-kdoc-fix

I guess I should have put the original patches on a separate branch on
git.kernel.org for bots to run earlier. I'm sorry for not catching this
sooner.

 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 4cba021c89d3..7dc394255a0a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -648,6 +648,7 @@ EXPORT_SYMBOL(of_get_next_child);
  * of_get_next_child_with_prefix - Find the next child node with prefix
  * @node:	parent node
  * @prev:	previous child of the parent node, or NULL to get first
+ * @prefix:	prefix that the node name should have
  *
  * This function is like of_get_next_child(), except that it automatically
  * skips any nodes whose name doesn't have the given prefix.
-- 
2.47.0.338.g60cca15819-goog


