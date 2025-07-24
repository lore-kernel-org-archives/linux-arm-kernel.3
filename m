Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21788C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrjIGy29vhQmG8TWG3X2445EHE3hkTtQk53xAku5ZzY=; b=Wh3vDxUlV8Vl3Qxh0D6rPr+IY5
	+GWWHQcBNy6neE3j7MPZxzxwDaLx247mSetdMr7/3UYRyKhe5hyfTt8MYxZLsI0f00JEJloEBSOmh
	f1Fzkpi38x0MWNDI4/sg+5H7FVGXgP5JZtxQsdq5xlNtGrhzKn0juWILKBo41joQvd8gRPGkOQzQQ
	Qtbbush6FeuP/W+4o/qZiAaa+o2Zkd4YVixsar/DwxMGRDFKLzeVtzoEfylOJQRtuAbTyWcFd+ZqH
	CJPQ50ke8w4YptqeCLNoISAsByxeUzY+H8+LdBxowTNetjRZEJtJ9/YXzSQ1keA+zyYr/NvvTsl6L
	XjWZPevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexre-00000007rZL-3v1e;
	Thu, 24 Jul 2025 15:28:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRD-00000007evM-0oEG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-455b00339c8so6847635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365406; x=1753970206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrjIGy29vhQmG8TWG3X2445EHE3hkTtQk53xAku5ZzY=;
        b=RH8S0p22yTpfcgdWXnFcPoqtR3E/W0Hl2YjJty9fLzZZMAg3a82vYF+8Jssl9ghgQt
         4Bf+xGdKzclRvA0vxjuPeTlzVWLzSG7gjLY+PK6a1yAOzvLxcJQlfd/t9jn0Yz5VZSCv
         uM1K/3r36bvNXNCJ0KhY9jT73B5mu+JIAJDow2qGqHPe0CUSf750Oi/PMk+VdMnfNu3v
         9skqKrlRm3LUndSHFrJNB2CDR/RkAAXY+hLg7LFOAuTD4YfoBDgxoqwgN8IUgBD0Y7sL
         dlkrqt0SmPS4Mrms5iZrIIHMsHmWZMuEgWQAQkXOnqRGNGGVPu4zWECVUIIOeDBij7OC
         TjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365406; x=1753970206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrjIGy29vhQmG8TWG3X2445EHE3hkTtQk53xAku5ZzY=;
        b=K4yZ1ejYPa272MdsRXwvfR5acTMl72SMCqa6eHK6DPLHovzPAfzVtLs68hPkRTNZyr
         C41A8fkx4Tl3aJCnd6939RnOp5xC48FsctFdIX+LaX4BaJmIDZZsvMkbHio8vZDGNMH7
         slQpUDpF1tjBmS6dB/iTMaRAfNGeUYukQ3IYIuxFKTcnHJnRhsboFYoIIjfTjqYi/CPE
         X/K2GmaYKTPxazdyf446LzFR+U6aoiclMQg0cHP4yGvfMWSO4qKc9NYW+9rxC7SPbq0n
         KwSlXJuN3UhBvWr5/b0ird+QPnOUdHosR0HhBnE+BKIywHrWitN2LNbsPr47mSTvQrKW
         9hVQ==
X-Gm-Message-State: AOJu0Yz+crGixcsR6rDrGHDoQFLp/psscZUIfzx6LiwLlwjD7kdLUaND
	tCc+gySiqX24B7TbaRu5f0nAFpXJh7knXIAd3DnICqFFD5ZzQyU6aAM3VWqhsifmGHs=
X-Gm-Gg: ASbGncs753VfYwqJ3858A0IGDUKhorTvOxOJWMTt6KGe1dlbfk0JeO5/HwdBS+Cxe/y
	SucaNbNm59t/IcmFbUnR+A3vXLOv1ADu+UmqEeqDuS3NqYhQ4oN2QU2jF85zY6tTSOLi7JRAfUp
	ZImaeyyTPbwrhO/o6hvxCvLOk2CweDTbwJFCED5mUlOpZH9Od4aifl39hPH/64sqgt6MjgtGqrw
	e8TMUQCOEMcyA/gySSYf3kni8D7jrFdhskHgueqB900lBfzJ6uz92I60qkzdsWk5MPYpeuOsqKu
	BojrdFajX8aHxEiWzbdePHh9y+gjCaHLH4BjWu6gCXaUmCA3ocs4XY9lUzD1N2D9kDUgMvzFtgE
	UtpYJOUEoN71kNpzFTkMv4eLrPoS20RgbF2phRQRFRssnffQ+djRLElZbwQBfpIwOGanIsSFeHB
	TWmwjEC4ahTl/f
X-Google-Smtp-Source: AGHT+IEVcqWnuyhtVrHKBupbieg0QvSQq5CXC89YW4ucbe/Xkxqrak9r8AlJ1/jdx+SIbeQvU+walA==
X-Received: by 2002:a05:600c:8b70:b0:456:2b4d:d752 with SMTP id 5b1f17b1804b1-45868d2c4cfmr54619365e9.20.1753365405757;
        Thu, 24 Jul 2025 06:56:45 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:45 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 26/29] init/version: Annotate init uts name separately into Kmemdump
Date: Thu, 24 Jul 2025 16:55:09 +0300
Message-ID: <20250724135512.518487-27-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065647_237530_9E18633F 
X-CRM114-Status: UNSURE (   8.34  )
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

Some specific firmware is looking for the init uts name region.
In consequence this has to be registered as a dedicated region into
kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 init/version.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/init/version.c b/init/version.c
index f5910c027948..364e7768da68 100644
--- a/init/version.c
+++ b/init/version.c
@@ -53,6 +53,8 @@ const char linux_banner[] __weak;
 #include "version-timestamp.c"
 
 KMEMDUMP_VAR_CORE(init_uts_ns, sizeof(init_uts_ns));
+KMEMDUMP_VAR_CORE_NAMED(init_uts_ns_name, init_uts_ns.name,
+			sizeof(init_uts_ns.name));
 KMEMDUMP_VAR_CORE(linux_banner, sizeof(linux_banner));
 
 EXPORT_SYMBOL_GPL(init_uts_ns);
-- 
2.43.0


