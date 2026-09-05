Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E04C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jRA+96YLaMc6tCnYBwn+B3DVe6jv3AYL6noHLa2o+KA=; b=33kFOV5QPyxIfkyENQM4LA5bhZ
	oqSz32Og3QF0MmjRcRdLRz9gfWvmEwBI6bVM9Fa/34RSiQkEurg6nYNL6DMvppzvet3WZQG4VjI0E
	Z6XW7Ee58C0Br/po0xzvQdFGtQGmZyX83r8YQRLFmXVrjBXFAvEng1d+FoJkjhdRB8mIkKv4oCypJ
	zILilPpfxT+mezeX04zUj48vakOHQSl2SqweiqUPaBjoX9XBo018LIMDP1BHUPzGqaor8U/ZjJioz
	xg7In6du7Pv0fho7fNrlFm757sHfplJvv6Fz4qPBobC4ZXUOyGKTwbVsd7tv3/0HBJjHptOG/2j20
	O06pBnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mpr-00000003uru-3R83;
	Sat, 05 Sep 2026 09:37:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mpp-00000003urS-0wSU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:37:18 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1470409a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601036; x=1789205836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRA+96YLaMc6tCnYBwn+B3DVe6jv3AYL6noHLa2o+KA=;
        b=krsXmscrfDFJeG46iT1x/Z/5iVI52QKtAu/kvLCVclL3y3DUtBuqk6RGHj0+PxWJC8
         0UkESHPNYgZUaw8AolUkE9kS4QNg4zRN9RmqSnRS0dCWX7Z6dgLbqEwhgn44wYwYJ0nD
         nFPoegItxrXTBKsUYcyHOarIyRt7ldYhooNWNymO1Wj0HO3EIgksgBzP1gYguurcNhgh
         DHgXKb6qQerEzV+X41jhFscuJX2C4Gd2M2UbXYtFwX374VtLK+6xApy3Q/c5ggJQMXwv
         vX6eZulNRva4WcdvFERzm95+vitpDEjFBgCAe8FTP8YQciSgs3w/xNytFZX0bX9k0d9e
         tMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601036; x=1789205836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRA+96YLaMc6tCnYBwn+B3DVe6jv3AYL6noHLa2o+KA=;
        b=HcUTM8vmP8UJr+njcsiOgTCFaiiayAo3vC6YL94Ait6RvMNifJXVmM/UTSx7h83LFg
         8kYGIbFhcFb154hpTI+ygpYkJmzOF8AyK1wuBzmQ0o+EaPNDeDrM4y4XlEBSuce88dhW
         OxlmexQop9SiYsEj5tDPdIrWk2ju+f5fXPQnLvzQcNrAgT73Bkl2e+UHYw7dtGNIo+bZ
         nD37/YBZtx1aMb1xCbe1PJ+4MQfxRgNOA6Bbg7SltBrCkidXe+jtwvs/csxq8E6c94nT
         sbKdax2yg5nhDqxp0sZ12c3aulxGttjH5BxB3RsPMqUBM7Iu0ffE8YKfGSrLYLmckau2
         ItZg==
X-Forwarded-Encrypted: i=1; AKwUvBzuVmv+swVVKiS8xMMBn4RDpuGrmtXOKdolxwU7m/NgluRSyxOMLaTd/3yBh/T4UuHGPoweROwOzbE/K/sHvApn@lists.infradead.org
X-Gm-Message-State: AFuF++lJjwLb/uKLDxoSmxCOk5htQ5qFd2EMAB7zVBWrSCZRnHvOpk6y
	wpizF6vSptFNwsGRUBExr304sxr/azd/TAf4a6kLpFTK8VEC03JMfC1n
X-Gm-Gg: AYBFou2sKVwVQAy1AGoWwEFHGPRBW6gW9G6RBhSyDiSNi7wsxxO+kRXJtf4gEzZwfJi
	Se6WGdk5pxMNgaWIoSrMdPGPEHo+1bHQ+pEDo8egWAPgdqepsKWradhP2Esre/brK0ZNngVaAmn
	YfeXKA/80xXno9PHLRENcTo5wlkvsXXA2FN3+FohJKA2KtYQGi9C9AdQNoXpAh6iYYdAzPAchov
	jDD6yt4IE4Y5hG33KIro51k//zGdFMdT75gPgCAhBt9g8HtNfuum+G0vFqjyLdlwm7fHLMlnaec
	XRTSRldEPiSwb2wOSE2oHAMsyBw8u+vwBGUgHELmjqXm00aHyNVOXBtAAojY5bwEQ5roLryqzyl
	v7WRTupYRG9R2O2C2BVjXVS/0lrxMVKkGVsE6sshp+gbP/b0KYkqwSNWRR28sIEK4WBlBYlQxU3
	Pwa/9c6pEWtEzx43YYp2jwzboIKzbG/Hwu7dJ0pzjNWntddNk2NJqKzXL3ug==
X-Received: by 2002:a17:90b:1a88:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39b2619138bmr16464351a91.8.1788601035821;
        Sat, 05 Sep 2026 02:37:15 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:15 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed APIs
Date: Sat,  5 Sep 2026 15:06:25 +0530
Message-ID: <20260905093631.48667-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_023717_261213_6ECBEA4B 
X-CRM114-Status: UNSURE (   7.73  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Convert the bcm_iproc_adc driver to use devm-managed APIs to simplify
resource management and cleanup.

Changes in v3:

-Add the missing direct include dependencies.
-Split the clock and ADC cleanup conversions into separate patches.
-Use devm_clk_get_enabled() for clock management.
-Use devm_add_action_or_reset() for ADC cleanup.
-Remove platform_set_drvdata() and the remove callback when converting
 to devm_iio_device_register().
-Simplify the devm_iio_device_register() return path.

---
Mohammad Shahid (6):
  iio: adc: bcm_iproc_adc: sort headers alphabetically
  iio: adc: bcm_iproc_adc: fix include dependencies
  iio: adc: bcm_iproc_adc: use devm-managed clock
  iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
  iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
  iio: adc: bcm_iproc_adc: use devm_iio_device_register()

 drivers/iio/adc/bcm_iproc_adc.c | 67 +++++++++++++--------------------
 1 file changed, 27 insertions(+), 40 deletions(-)

-- 
2.43.0


