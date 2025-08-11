Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8B7CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NMhYy0D7+tDMBqaPesJxlaquyxiEfLakNWEt456gjBI=; b=SftfbntPTsaZ0X
	8SLyyLKgmdNDceV5uWvRHmucLdm+sOSyYkLMZ8wxEC2AP2JLAe/bXDX0GXvrFgI5VLlUi5BRtgFMt
	p0qg4pvzsYJIwvAMIKolHrjKWZgJ9CJtUqIyi1s+T38eEF+Pj4E3M//9vYrMaLh4PZwyZBnJ/vyMZ
	fPRi+COmg4a0bwR0LllL81mcR8i+h5B70NaTarQCsVoEjWwFvdzZ+hpH3c2td+xkk+rMdy4KHpmt+
	kFJtlqzzbz/UpyrGEJ3oVlopEHHBa42FX6Uod5mXdpIoKD2TTuE3K2yOISrondBVyRi1h6l7TR8Rb
	Macn9Nyy0UzsaK+yDooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOxY-00000007ANg-1usZ;
	Mon, 11 Aug 2025 09:36:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOtV-000000078hM-3FuI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:32:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b7823559a5so1858109f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904760; x=1755509560; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMhYy0D7+tDMBqaPesJxlaquyxiEfLakNWEt456gjBI=;
        b=Q1Oz+63MBBzElH3ySqxE0tdz/iCv8QLpKZ3WUkALL5hk/nfWi6HGVVad/SybUSwCKq
         1/LjAxvHQ5ErWjYuEXSY9NYy4bRLIRvJTGM1rXwIc5hP0iluA7ahS8/xI2qBjYmKsgNi
         dIGZLZHxrlkheEYC32fUQr03YkSpAMJ/ub1O6DeVQKGRjtMuqXq15jPguU0x9LxRw6JP
         6ko1nOLy1Qcqev11qrIcr+6jnbpfOTzNK5xdoexKYZ2AKQ9f3cQptIfCLfRnfEYoxvee
         JAJCHPZ+0uV+w7dfM6UvfVkxFNGhr+rLxFZsDyB6ps1rgJNdcFZ+gMFGWYQro6SUgnQO
         oVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904760; x=1755509560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMhYy0D7+tDMBqaPesJxlaquyxiEfLakNWEt456gjBI=;
        b=fICqiGbuNj8QCb7bFGohCEPY6eUurxzUExNVsToj/sOV9+EwG6bH+GUBqgm7GBs8Bp
         lNCpuYfgEMIj3xaN/MfJIyLFAr/MW2hbtzXWJg9U5rknFcMCuXVbSG0FuPZqQ+Go04zZ
         sqiOr25fOGofuqtum+PdcpIMRZq8uXnceRGxoSLOOzu1nqaaLAuNmTDWvWK6kfsRkBFT
         akYZonNPEel7dCfO0EDT3ECAPgJdqPASTdr3SxT/fGGDg5p+bxBpEZmk9Y4DJIc2waPE
         y8MbrsI+TeuJhX2Vv5x0sjQgWbbKYJp/zr7RgCtuhSQDo9ucAbf3TqLC7UTp485/p2e3
         Mbgw==
X-Forwarded-Encrypted: i=1; AJvYcCVKLrAH/3Jm3LPaNVhUqMnLpPbAK5sHuCk+ZEdRS0jklDRRU16KiLlh3QMq/Lweel+gt1VWClQQEADP6a5f8wOb@lists.infradead.org
X-Gm-Message-State: AOJu0YwQOqNXe6vpH7XVS9Hke/RQIFEh7kFoQVkURaEHbqqIG+RQsmPI
	xK9XyyTrf2qv28k/cGNsQo2a6Fggd8rXUGubl/MBCsJSXCUrNakf+OQjhQrLempFVXI=
X-Gm-Gg: ASbGncuzwZlKeywylzN26yD6vBCg/dYSQ6XCFTJ7OwEyBB3aT97vAkSo6O0q8d9arsT
	oGpmAjZGIdTVH8dAlQ5NdoAZHFDGzOgaL09YY5+mNrMixQjtnw/RmfCYvrMSIsBZlz2ZLzL65yC
	9oKw++DoCCSL5+LsqCRzP9z0tSIwiXL+jl5K92U1Ml3jr7tSPPur4AOcj1W3d0DyTi4gOBCN0NL
	MY1iXe85H+jQc0ys7NYXg3UANi6ddfANpDWN9ks/Qaw+6dZa8EIZREic8m+F/O16YLJi2tUGiPw
	niBPZ2xLW+NGoe4iiZQbR0ZKZcxT11tyjgTlDZ1S7gb/BiwKlUagTgBcSk58iIzKdM3v15BSXcT
	g1o/WPDrC2JI3vCaK/QOW9FbHZdlgkNo=
X-Google-Smtp-Source: AGHT+IG926P2UAZWTkKtlExqrZmNaWG7qVePQONHyDrug9yxfDtNL3kmdiq1ifaCnyzk+36/Ct5zPg==
X-Received: by 2002:a05:6000:4308:b0:3b7:9214:6d70 with SMTP id ffacd0b85a97d-3b900b2c485mr12845369f8f.15.1754904759816;
        Mon, 11 Aug 2025 02:32:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/6] coresight: Add format attribute for setting the
 timestamp interval
Date: Mon, 11 Aug 2025 10:32:05 +0100
Message-Id: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJW4mWgC/x3MwQpAQBCA4VfRnE0xSyuvIodtDUZZ7JRI3t3m+
 B3+/wHlKKzQZg9EPkVlCwllnoGfXZgYZUgGKqguLFW4uJUVvaLewY+RD7SeqLbONDwYSN0eeZT
 rf3b9+37Hq4JgYwAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_023241_835703_3C13A25F 
X-CRM114-Status: GOOD (  12.46  )
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

Do some cleanups then add a new format attribute to set the timestamp
interval for ETMv4 in Perf mode. The current interval is too high for
most use cases, and particularly on the FVP the number of timestamps
generated is excessive.

Although it would be good to make only SYNC timestamps the default and
have counter timestamps opt-in, this would be a breaking change. We
can always do that later, or disable counter timestamps from Perf.

This is added as an event format attribute, rather than a Coresight
config because it's something that the driver is already configuring
automatically in Perf mode with any unused counter, so it's not possible
to modify this with a config.

Applies to coresight/next

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (6):
      coresight: Change syncfreq to be a u8
      coresight: Fix holes in struct etmv4_config
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Add format attribute for setting the timestamp interval
      coresight: docs: Document etm4x ts_interval

 Documentation/trace/coresight/coresight.rst        |  14 +++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   6 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 110 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  86 ++++++++++------
 4 files changed, 144 insertions(+), 72 deletions(-)
---
base-commit: a80198ba650f50d266d7fc4a6c5262df9970f9f2
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


