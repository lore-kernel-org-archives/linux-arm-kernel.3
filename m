Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E501CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIl5W/bIgW8FVjVtco/bINFJvVMTa/CFL0n0N73oRmY=; b=s4w2hWUDSBmewV6dzId514ETGY
	kK3AV/FDswxVXHM/0tMScEQIpQu/R2GSREP7cr87OuBtHwX/XnKxi0FWp6F4Ks5qcb/XrWYEDjAk5
	II0ys1vzDWjNOlKyMvmlAfhSmOnVrwVaclXFHWl3iFa3FwLN9EzbFP4bpHIktZpxeRAsPbkThAixS
	3bVssevBMC4etV0nf9zS7bkGp8AaYMh1O3DbxaxzX0AMbCGlsXHPRkapJtrpxuKJSFj89PIMoCkD8
	tc65NvwJxDQE0uhFvJPKyr4Gt/TfwU0F7vN0oJutGHkYqg95lv1u9d3OZ2vUALF31Xwh6c7rnNQEQ
	ZdAFt1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFi-0000000EXmd-3AIw;
	Tue, 02 Sep 2025 00:52:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7St-0000000DGRu-20nk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:33:08 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f76277413so1764381e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744386; x=1757349186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIl5W/bIgW8FVjVtco/bINFJvVMTa/CFL0n0N73oRmY=;
        b=Ou+wH9FWpGZdzqzE0ah2CG5CwEjcUg5nQMAj/sy3ThLg4ydfeIU57LHLosuWQyg5VG
         ToaN9FMnuGF4rnjqLYr3hd1QiCAiRCmZn76Soc4YfkGwdf1F2Q2JLQZUdbdjMbAT+IZ7
         knwzf8RIJd5n6x0P8QSv+7o1n341zt7aCB/fLMt4hnqbMzFTAS62T4arxlG8EwtMr5LZ
         SzjCRKaNEtnjfQ/pwYe9GmtQ+0y/2pjKTEuCi5kD97vtOz9wE1H2QtOtnRf9oyPYCENY
         OCgGlC6eEl7gqpsGvqeaMB5B7QlZPS7KTpbAE2yxE5v8jYh1G5Yo1NczrdZ3iT/EwJy/
         LdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744386; x=1757349186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIl5W/bIgW8FVjVtco/bINFJvVMTa/CFL0n0N73oRmY=;
        b=NioNWJcoXh1SOHrLCQPTBL9tMQ6JSuAyNufmWen9yN3hoGxHfzmOYcxi21Vx/or7FK
         Slf2pZfrbuZnl9yNnbJ7yUzblbofry6lsT6ZPXcKiAis3NpUzwWqFELXL1YBY5nvRPhL
         m+WnqclaufAs685rF2dB2XLaTy/5HT4cyRymqYRI0L20ZvUgAJUbixA7xI1b7aGtD2W2
         YAsN5/iTJWMXu96Tpj34ORkCEl8DySShyYFtayu9sPabYKR9oVnh5kLbnjdZnzrHp8cd
         zeZEyZSvyEOsOgOr2qyCVMNm5MXskfXU9VaZS+ugQcghYTLSRFo3BE6lcaVmaF+HHGqG
         swxA==
X-Forwarded-Encrypted: i=1; AJvYcCXVvhKj4yn2JO7QiVeFrWvKYMUyHKW9T3utqCu/5EoJoQ9+N6wMidWAXajOO0BwT0fAmEmjVdt38z5fN5zjrqdu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8d05+gbv3g35hiqbZqNZI4wai3pAitED8YDUvcPTdhjKlb1cD
	2cxcEtF78Lj47c9UIzcKv7XYzSgSR0QvoojUsqjN0o1bg3e+8HgHZTswjCstV3pvqlU=
X-Gm-Gg: ASbGncvP9Ghod5iQK4bNv2dO95l9DLP39AvN4SwRv9nYV1hhU+GE+B75XUvU6TXgoag
	yjHSj84Swa/HmIrNcoZqvPN4PmC0vO5aziX3x0BzQ5xwIt5bmrdzA5TUIV3hxgh9GVwyqdsJ7P2
	tmxUw5TzzZN+RLwPwhOeRxOtDDHS2BVtyEWbDHJIsmUQlREBrPZRMx4Iq2HKjaCJQoeaV4wCQ34
	ZiKhyytaDx6SFByL2kjxnT83Ki6FQf6uxlFcr1ZwYkcfwd2hRsRSmgQxdPP1Mj1fB0zmSB0kUEO
	CyF04nlOES+okaUFU0MeN+Ni6C2ozQk8tAmY1r4FwAfXBT//ia3CCsid9T3ygzzOtXBKRWwqePe
	/UjhvB0LQgicKfAbN30hDTd3vzBrqcZgRHQ5MbSZucA==
X-Google-Smtp-Source: AGHT+IEOzCiW/l9/IwVBabZcYmD6FGDThQuo6tecUi00yi4YZaYtlLaBCrKKgYh8GWti+hodMlYjBw==
X-Received: by 2002:a05:651c:20c9:b0:336:8809:6730 with SMTP id 38308e7fff4ca-336caf88d6bmr15563211fa.40.1756744385419;
        Mon, 01 Sep 2025 09:33:05 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0e78e82sm15291861fa.53.2025.09.01.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:33:05 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Subject: [PATCH v2 0/2] firmware: arm_scmi: Minor cleanups and documentation fixes
Date: Mon,  1 Sep 2025 19:32:59 +0300
Message-ID: <20250901163304.2504493-1-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <y>
References: <y>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_093307_524274_26AC2774 
X-CRM114-Status: GOOD (  12.14  )
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

Hello maintainers,

This small patch series addresses some minor issues found in the SCMI driver:

Patch 1 fixes alignment and indentation inconsistencies in multiple files:

Adjusts function parameter alignment in protocol_id_show()

Fixes debugfs call alignment in raw_mode.c for both message and message_async entries

Patch 2 adds missing documentation for the xfer_lock spinlock that protects
access to xfer buffers and transfer allocation mechanism, making the code
more maintainable and easier to understand.

These are straightforward cleanups that don't change any functionality but
improve code quality and documentation.

Best regards,
Artem Shimko

Changes in v2:

Added missing alignment fix for message_async debugfs call that was
overlooked in the initial version.

Artem Shimko (2):
  firmware: arm_scmi: fix alignment in protocol_id_show and debugfs
    calls
  firmware: arm_scmi: add missing spinlock documentation

 drivers/firmware/arm_scmi/bus.c      | 2 +-
 drivers/firmware/arm_scmi/driver.c   | 1 +
 drivers/firmware/arm_scmi/raw_mode.c | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.43.0


