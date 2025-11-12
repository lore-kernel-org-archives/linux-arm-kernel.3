Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0624ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDsBSlb7WeG4t+Zz0qQoWGyQAvxf7H4neeIGYfC2zjY=; b=jlw4SiHkRa/Bb+CvjaPoKVS1YV
	77uM9pLOUDJOHojWq7VSS/0lIixzNflUH/DfPGomnyM0CftIk5ec4ZljpAHKi9AyH30ZqYJiQM6Dp
	V6a+QU6g3Us2WFa/NI7OgVYeq7W+3kjGzUmHB2GwXwUs8ebVWRQKGseu9cKrvA057NehcbI1RPysq
	W8eGBOjnOpCjCbx7aSqe53zCAHfhmWpW/R5/3ULvgdhFeHDPWpVT3fBmTDSRZpybHmWYOtQNTktOt
	n96rPrHZ6xdnjIx8ZIlEJ02g3T5QSn1QEd8+g6+1net9vPKgzA++j85REGvHWy1WzmuWd71d3/6SQ
	PWGQ/ibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgK-000000092VD-3Kiv;
	Wed, 12 Nov 2025 15:22:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgE-000000092Mm-21HO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47774d3536dso7195315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960961; x=1763565761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDsBSlb7WeG4t+Zz0qQoWGyQAvxf7H4neeIGYfC2zjY=;
        b=tx6oMk2hktP1X1qz6hIBHqY/998Dy6931e9FrPMUzwW/kX5p45vzSsExL0FGsptn03
         kxKK+2glvfUwRmtCrR2PEYGaT9ELSYG7GQBeB4kHSD6Q+VVz937IpWrShi0U9KYcy0br
         r7clvcvKOF+m63oUOfluTEzybltVqBnYJzeLhZjLs21jWUWf5zij6+3PPMayzE3Doba/
         RTBKhzLtYGH2ZX+RLGtClH+Xtdlb6ghDzOzGd6nV4hI7hGNhPqO0bsJ6yvOjUkV/swI5
         qLMflCzAEsa5/8hnuTmVTOS3FBYV7QcCkmOaJ/sFBnWRcS7pY9+nIMkNAPQ7GECLQnkf
         2WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960961; x=1763565761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RDsBSlb7WeG4t+Zz0qQoWGyQAvxf7H4neeIGYfC2zjY=;
        b=WuHgBpSF2UpzyTwRF6+MB7YLfqybWXnl2dB+GPgbxp9e4nHHpc57V/Ka3XM9JeFXkA
         3XdrpCgDL5LWw2JFcUdwQaOlYmgy8xtIDi71ll0EBbKqmQdo17JrJYtf6VxxtWY+BI6c
         l2UV6+sX5jxShukJsyJ9qhw0s0V+DwW6ukLMxmXS6TcubOIR2J319sHNiPxpdyg+4ezX
         cV7wmOcbMLsbI6jhC7Is3BzAS4/G7X3ZiJBgzJL5Ghgt69tlkxs6QxKGhmWk+6bvt8+v
         9idQMusg8V5r6Y6w7NGZJ07IsLYbUzeypHQwgmHCPeDiQr9sNGeOufjhmqiX55wI+rXx
         nxsA==
X-Forwarded-Encrypted: i=1; AJvYcCWSzSzmjNTtO4R7iJkByZoJy5PKuysxmBLDGxTbMmsPVaWHjCZM1iCiRQWyiWBJ+46VK4KfPerxb213Sz8zFOTc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfg0ZKvGEXbv8RFh3SRXnej4Bokh4y9WzJCqQ7ufsK98YSyapf
	Fnfv71E1bXLk6Gn+ZHFC9eTTqrQdqdoSFcaj3TbHVRLFEAxWpOgFuygFyC94Xb5g9RE=
X-Gm-Gg: ASbGncsp6tUkIr3vRfUVSxLbBRhOcZWA+vXqRUqGlrF28VYJ9fmO7hSttCXJTgT8z2X
	dJ2+sevNCZ7FvbEVxwv9UnjJsOQsCaVXEsNsT4rqLbdYiCLBYG+eULVdwRcuqjIGLKAl/8sgLPK
	16D6JIE5Z9YM/uWLyZlKzt1/0Fz1hu7CMPXKYXFQimD3lpWRUWVMlLXWCFaWi0sr3K9Q8u5Lomz
	+AuMmoItL2HX62N6o131DQSsbhMeNiEDU4f3t5thAREIoVBvuhvBwReJFotk6WHVf3XlDOl30Q5
	hQADlvlGgKPFh9KSXeeBtGF7BJTouudcMc7QIHFKVVs4870hk9Bz50kAMtCEsEboXzBMu1XU10o
	n6x/FsLMz1Tc+AegT2+PkCdFIW//g2wglmSG+p4WgngA3thALbGSFFK9j5m/FbaaJdWvsv9zYk/
	j6c+5Fuvz4hA==
X-Google-Smtp-Source: AGHT+IEuc3bgQChegQeV43CchL7U+HtACup7lJPgzLmedOPZfHtTOSw9g16bfGt0TS1oBLr+C/CdKQ==
X-Received: by 2002:a05:600c:80c5:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-4778142013amr40810085e9.7.1762960960555;
        Wed, 12 Nov 2025 07:22:40 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:40 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:19 +0000
Subject: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072242_542189_A3C61434 
X-CRM114-Status: GOOD (  14.46  )
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
 Documentation/trace/coresight/coresight.rst | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..80b5ed09d69b 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -613,8 +613,19 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
        <coresight-return-stack>`
    * - timestamp
-     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
-       <coresight-timestamp>`
+     - Controls generation and interval of timestamps.
+
+       0 = off, 1 = maximum interval .. 15 = minimum interval.
+
+       Values 1 - 14 use a counter that decrements every cycle to generate a
+       timestamp on underflow. The reload value for the counter is 2 raised to
+       the power of timestamp interval - 1. If the value is 1 then the reload
+       value is 1, if the value is 11 then the reload value is 1024 etc.
+
+       Setting the minimum interval (15) will disable the counter generated
+       timestamps, freeing the counter resource, leaving only ones emitted when
+       a SYNC packet is generated for every 4096 bytes of trace.
+
    * - cc_threshold
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold

-- 
2.34.1


