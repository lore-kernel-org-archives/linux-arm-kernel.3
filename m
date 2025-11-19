Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BE2CF3953
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=; b=sPZ+eV1glomWFcCQoWXBLkyz1A
	9fLm6oi+8XT9WtamLkKT7nZfWWZkHegiQnb/gM7WNmYdH4OZpQf3YppO9z4guDba3sCuyMKsb0FAM
	oZKL5VuMVGbTUGglGClIGCzSgosjOL1dsGqAqqJ0YW+CV1R/rNQvwjO/BPNWqlTeYS26AwyF29ekt
	EhnOzn/1pk4lt2pxNp+P8Q92Vtu42W73rBgTZ+GHIVkpaybptQDNPsSH0GgjvuaH590VBE07VtI1P
	cfPsIqrRckaO6ODBMQQDtW9oSCPWk2/cxALP62JP4ZTVcriyMEbhhyrxgov9LOCIAvz2/SiYsfQ/j
	y03A8aDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktJ-00000003fF0-0Qw0;
	Wed, 19 Nov 2025 16:18:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt7-00000003f3C-3JzX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47118259fd8so51678065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569111; x=1764173911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=s8VsgIi1lzSeKIJALkmI00Uudfqw6LGeaDUMEJP47f7umUuV/QV+nNcbJ9Fwq+6bBX
         huEUS4vxnsMVMJ8w19BvHl6sy01H4KnO6sznjuRhWcOB6/38YlEunwHLb+2hv18jBaxW
         j7PaF5XZaot1pA+V7eq3TH5lQH7yI/btGSPpTIVGKpnL5M6hFT5IvRCF8UK8oNETXYIi
         sTnea1vJKPRUZwbaz2PvahOkjCo1y1Ar/utJpyqKJk7Hxd5FDffxWlBRrmiChs/eBpmm
         OABVH8+yshtY6xdVKNRwpbdG/XcCt7SlOphinGbqD7KJ11QLzxrI0mfulQKmgDWQBMW8
         39VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569111; x=1764173911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=v8qsZckrPO/L5hZdS+ndooWqavsJrlCett7b/vLi/ubYK6CLuFnSjt69nhKFBow29s
         dtSPV4EXtD0bZ+iy/UiApEe3LjEa23W3bPbK2ENV+epe3GdwmgEOTxtrZP+DDoqJei71
         NzXV/eLqH+3O5Naa9KuTmD9HmDK1vLVeNIsrvMD5DzafS6x470eyaD5jd2HoAVlKLqun
         SsDUiPjwvNZO1msv7j+nFkUooc6pm0TWORAm5kvlkMckIKgdAdRU1aH9Ydsc4LcHqFKV
         GSz2SG8zQD5dWvBC4P1IrSeJrMJP+Z3VrLFu3UHCmpo+QWFHE3Wz7eAYyFawRF/qu+/H
         cbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP0uYHXyDsWmnM0Mmhccrrf6mK0h/g0uJLZI7wT5jRJ+Qq2lIqUseOIDhWxROJ2DKql5KdpmXHNS+aTPGGN356@lists.infradead.org
X-Gm-Message-State: AOJu0YxEGBR5qDasJl76sAcAy5nbkxMN5Yjbsv9bHZmgmtNzBODc6cqZ
	667ZgbDLyccJMl/wjYNg8Qa3CL4l15yw4YJ6LKvg+4tp6wszRf0Hu/MKM3rzRnpegrg=
X-Gm-Gg: ASbGnctfiVKzaNm1bgpuTaxVARAorLB4MHgz5I/lzjj9V7kVC1sokpNyut2KTCDLpzp
	/LMjo+HhuMpTdVEEWkiNAAS8Jsk+RloAWjPTNRcS+TYf4ePMC3/zy4BQ5fueaKPLAso8fqV5Gcz
	+TCZ0GtnpmPhqvGRNK6h3S1KPfNKKGAQ0JqDu7Sq3fYOfG5lneFOVHfcwPg865ZsMxlA1l+Hj/v
	Pxo3+onaL0PvbLCSM6jpiutEs7prGevYbY4/8+oFhuKeloS6rr8pNFKtAibDU3DulnoEgfinesq
	DxGI8zsBTHshH8i/VCB8k7Uk9AHIni++Q8KIM3AdO+bCSwlfP+gwNVkXpnEAHOATwgG7iyjTFv1
	VV7UCxfLV5xIR1MN0kevshdK0vIF1IGBYG4/PifCokRs1Lso2l/kNqxXaYhyaGZ5mWQsB3HqGOM
	G/zxrd3Qta/wsKpmHHUhmrzXJsoKtJBs4=
X-Google-Smtp-Source: AGHT+IHdpfGKmHi4dDxwCxkPLQGkWAFqU0kact4PGhTMGVixHnJV4SZCke4Dbaosdd52MSthTFvACA==
X-Received: by 2002:a05:600c:6b47:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-477b7348cebmr11811715e9.8.1763569111423;
        Wed, 19 Nov 2025 08:18:31 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:31 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:09 +0000
Subject: [PATCH v6 13/13] coresight: docs: Document etm4x timestamp
 interval option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-13-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_081833_893952_3A51D28D 
X-CRM114-Status: GOOD (  14.56  )
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
 Documentation/trace/coresight/coresight.rst | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..d461de4e067e 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -613,8 +613,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
        <coresight-return-stack>`
    * - timestamp
-     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
-       <coresight-timestamp>`
+     - Controls generation and interval of timestamps.
+
+       0 = off, 1 = minimum interval .. 15 = maximum interval.
+
+       Values 1 - 14 use a counter that decrements every cycle to generate a
+       timestamp on underflow. The reload value for the counter is 2 ^ (interval
+       - 1). If the value is 1 then the reload value is 1, if the value is 11
+       then the reload value is 1024 etc.
+
+       Setting the maximum interval (15) will disable the counter generated
+       timestamps, freeing the counter resource, leaving only ones emitted when
+       a SYNC packet is generated. The sync interval is controlled with
+       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
+
    * - cc_threshold
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold

-- 
2.34.1


