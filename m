Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEECCA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=; b=TTkN3rjFsolNTOZPWzFwqfBowe
	8BKGDzzFxRsEWX0Y2s4hldd4Ij0PipKaamvtcRqPb3ufbiZXTutQvLKWgS4K+1fAy4rx77bS0PlxU
	MEGifsauDj5+NClc3xkw40JfxrxI8lIQTOldqYgEw0dH4jrsjjlvf97wcviG5Q3I9vgFO861gxeQt
	O3SW+SObMA2yjdklX+S4cwgXjQ975l6NJerg2VycMv4eyCf8JPzxBmzUA4cWelvqZInkqWz3zBPEK
	ffyawKbaOUaQT9iADbqMZFkf7MkPvmQcyhNLwADTOGAVsmAiYh8Q4lj06RZZ1GTd3Ea1vjN99NnSU
	i0pjGfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPD6-00000007EJ0-28SE;
	Mon, 11 Aug 2025 09:52:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOtb-000000078kn-3ynj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:32:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so20508155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904766; x=1755509566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=uBZjXHk85oTw7PpRHWKD8BhGUAZflgRNbX9QUEZHvKrzuAcC218O0WDRl/eK7bx668
         V9ELODouTyh9y8BxMyU4Hoi1O3tiFosxVtFlv1YDnW2ONFvOIDdaBnBR6eBNx+BzdZNz
         8zwi4O/q0UWE5Cjeoj1YOlx09YbhpkXPNEu1as6jzBV9I7KBBMzic8/AQFHz28RKhOkl
         LnIblJVUbpj8aDj7FqagjSOKZzCBE58bEzSHAj8d2lXy/l867NT6mgJymQd04YamGmeN
         sZRA4S5uD4wnYk+pkLUVPKNulSvRJ16l0pDmacn64WfnLARsWFH9RK4M/KIqhhMbA/Yy
         Aqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904766; x=1755509566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=fUpLFHCrdIBp/3Ey0cze0S1dLIIwhTrfdULAORF8jkf4hNUezOrdveDQVRWqgRtgV5
         3rvOOr6ErWXlYy/ueLGZl1vfs2HrIROAFC8ZIQE2UfUPe0gwVqYZCWV9PvoK9gnvU8+B
         RYtUMiypCGQkF73Ueo8SwLxw01R8Cf1X+sn/cbcEr002hiu7v9NmTiGQ9LYz9LnFkTZn
         Wj89Op8hBl45JOPl2qpxTLiiu2epiLezzo2ZEQ3OjEMR4gIXY7nKmGMcNLk4jJLWDLLa
         R5rCM47C9V0Z9z2rkwdrPMBsbKgNZizmW75NEhrLQxDIJrDamorDHZgDAcrB5WJ9gB/0
         4L2g==
X-Forwarded-Encrypted: i=1; AJvYcCUa324D92sVWVQKmJ6vwYK/InSjsL/Gos4AqOW/cFcVv0plmjguV5tHdLT+1QHMZ+mDDOVLrc97QdZTtDOVDGdP@lists.infradead.org
X-Gm-Message-State: AOJu0YyUO7AJovwmbKkgsbl5YtcZdFkA2uSGGNgEGqpIRG6JzP7qwnlP
	KS+4YbawiJNLULBToZgkAu45zGWgbRZo+yvhb3h9vjW31rnfE5T18iUocm3VyKxr6Kk=
X-Gm-Gg: ASbGnctQSdRxZ4uJ4ENE4qcr8qXUZ4nIRBB+RJpd5spzxE2oE+BuLENndDcTpRG7tc7
	Xg/QHW+KlM2BsN3PJOYLHhg7pX60JT8N1eO9PBpu8CwkmwaflozeWctPHn+KX3tDox2mWjmAlCN
	n68YtHhBj9SXcaCfAv9qUutCDjEPKHwH21IeDA7DlRFRwQWA2ggZ03Y0Qfzw4wU02kCNgQTK7j2
	144sYN/jqtkJ425pVYjEJRBmVrxAUvKEFEp6BXRySlZGrI2hildb/dzTzHWlAwXALtCO1wwb7oA
	y+sHS+I0baOFUQ/8mjTsJ8Wd04pmFzyzIc5yKJY4dC4O2zfjOVqDGLq/zG+xHC9vrEZ1ECVsD/8
	vO0ZcY6ddvGuXjYa25YatSA2yIIFW0e8=
X-Google-Smtp-Source: AGHT+IFaTuEhnneSdqUPVkp8FKoh0YP1/7nEOnYDv0UVx8tWLL1thpj3XGM6kh71NmUAd49x6WzJSg==
X-Received: by 2002:a05:600c:4509:b0:456:496:2100 with SMTP id 5b1f17b1804b1-459f4f2bac3mr129344465e9.31.1754904766361;
        Mon, 11 Aug 2025 02:32:46 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:11 +0100
Subject: [PATCH 6/6] coresight: docs: Document etm4x ts_interval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-6-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_023247_996130_0D6A2A48 
X-CRM114-Status: GOOD (  14.22  )
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

Document how the new field is used, maximum value and the interaction
with SYNC timestamps.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..0cd83119b83f 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -619,6 +619,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
        value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
+   * - ts_level
+     - Controls frequency of timestamps. The reload value of the
+       timestamp counter is 2 raised to the power of this value. If the value is
+       0 then the reload value is 1, if the value is 10 then the reload value is
+       1024. Maximum allowed value is 15, and setting the maximum disables
+       generation of timestamps via the counter, freeing the counter resources.
+       Timestamps will be generated after 2 ^ ts_level cycles.
+
+       Separately to this value, timestamps will also be emitted when a SYNC
+       packet is generated, although this is only for every 4096 bytes of trace.
+       Therefore it's not possible to generate timestamps less frequently than
+       that and ts_level timestamps are always in addition to SYNC timestamps.
+       Timestamps must be enabled for this to have effect.
+
 
 How to use the STM module
 -------------------------

-- 
2.34.1


