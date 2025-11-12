Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95105CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z4YAab8lEVoX8o7HKOXOiywpYzCpEEyW7oCkq/M5CVc=; b=TsZP/kQ16IkCnd
	P1aOzFjoYQq/82xGlD19JYiOXFwXbk9+7f6qd90Xh3HX+1Z4U1uU4EQg3PzYbKVnbSGRUzZ0csFcg
	P92P6X61rsnQr4uIoiLzd8/rCbYPhZGwQjwbDB+iYZ+IalCJg86B8yb3BAF0nY99oVODN8KTzT4d9
	vGhe6AG5GnKlzYVn8EzPtN9gBDme0f1UtnoPccnIxL/GIODo+vdCOBrI8jgLxQYbl59hpUHSWqnEs
	HQ34KKvX6hJbX3aoBSZMAp1BpovSLrqxoLVfdRzh8V0GADoi9opZE+y0WD5lOwewt5ps9w+CoOoxk
	SW5B0jDkCJ9MZwFvtj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg6-000000092Gp-05e1;
	Wed, 12 Nov 2025 15:22:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg3-000000092FX-2XFV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b31c610fcso829377f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960949; x=1763565749; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4YAab8lEVoX8o7HKOXOiywpYzCpEEyW7oCkq/M5CVc=;
        b=s7LVxbzzCTNDU7XAX+2vCED5nB2V03w1eAgUerhsO1Kvr6J8+hAEtm0VOUJmZOtTw2
         73NCPCNVAW3/otC4xnrt2PxZ4VfhFmwHjqnx4giGsUvzM0HCyAe3O0UNjxMB2wypxUMX
         QfG1hIRU1Pj1kR/XtU1ShCMiWY0QDu7ApsVXJy0YiQSV4UEakqGX5BJGBJRQ4MF+3FuQ
         l8B95hd1dCPtMH16nGR6fMZyh20knEo5ouf4PSrqnSefIFG6RXFK3CtLGBrIgr64usDZ
         LCkFhoHUCpB6iEDe+0jiVCcLyv8+Y0+jQ2TxXaJ0J7puJzncm/x2jrTLLhY/Xg/I24Ht
         norw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960949; x=1763565749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4YAab8lEVoX8o7HKOXOiywpYzCpEEyW7oCkq/M5CVc=;
        b=pf2+HfJmszuZmTe8teJkEb5p9gUIgUP5ckXh0QBikfuUNu5YzRbAPVmDLUM1E2CiFN
         nDcsGPaBw+9QUWh8DXs4ab1WZrJ6FKMfFzfBJ8TGiD//Gt52sG4N8BghUcgOdLvr4Ptw
         fciHCOVV0BfB8FhP+3yER7ak4oWYOOfj5QPICdB40IUpOGxaFNOAMBwa5gZCYv6wwDnf
         k9oK5XpqDnLbIh3FC9MJ+4diAbkD3aSkw5nG11MApCLYjgIcJC047bCeL/KFw9CGo5so
         HsDJC0oMXZTsK4GLk56pDWHmfQ/D4GO/26qUZsMr4A+RQRs3DRAZK2Uj1BhYp3p44yYU
         6A+g==
X-Forwarded-Encrypted: i=1; AJvYcCWCmlMDRseKM0wv5ywhooHI9ilZ7Oie4J1xCs2TjVC9cUDdoP2gLOz6WAB6gzu2sYLPaz8IKx0Tv3p8HdH5AoxO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl0oQP7N5TLRDisNHnazEx2+G5Q0Sq+JcJs/zdxkT8DzJPvxsX
	lH5Fya1RTpf+z8Ee+g5vMouEWxcRmxnica0/x0QADoHU6M0tDk9XEo07lzRUbmHzAms=
X-Gm-Gg: ASbGncvtHFyaTWhesNThDWwAJow5kfUUV/OLHz0WFJit49Ye5W5PaTmNmGvn0dh2vlA
	EtodgyQXZ6vqaoz4wg7tVL8o7C9LOngJpmmImpCOL38WwrBcTk3R3VvZ9ZMhBt/4r9cQqYpaK9w
	RBmN+X2eD1Go4/j8E134JLD+k4lD4G3dIBOlo3KddoMrR4H+VqIofgXbnTy+YZj7N4hE5CDFtD9
	/6byjIOjz3WJ+5d0BHGDGhoCZRvfbimHypC/mgUxooZ9ANRiBG8pam6jRh2om/Vbgxg8NsYy7fu
	QI1hOLEO1fEEZiAu1YPzphkZJpkvKXayrsbhtxWgb/i4m+l7ZE6n0zlylU41tLW5NLHki0/KNYA
	KXCsSaX/dF4xOOamH3wyZRUx0pQVyhaavkcyHHgDusr1KPnf7aOzgn74pUQq7ujSppjcC8DU0Ub
	aYnFHFxK4SEA==
X-Google-Smtp-Source: AGHT+IGne5oDnoDNxspZOCag1+PS+dRQCZvqbFW+O5kS5m0nBl9iRLtaXl0HXuN+7Jr4WMxw58qV2A==
X-Received: by 2002:a05:6000:4308:b0:429:c711:229a with SMTP id ffacd0b85a97d-42b4bdd4f2bmr3324821f8f.56.1762960949156;
        Wed, 12 Nov 2025 07:22:29 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Wed, 12 Nov 2025 15:22:06 +0000
Message-Id: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6mFGkC/23OwQ6CMAyA4VcxOzuzdcDAk+9hPMDWwYwO3cwiI
 by7AxOjkePfpF87koDeYiD7zUg8Rhts71Jk2w1RXe1apFanJsAgZxIyeq6vGKgKNAxOGY93KhV
 ALmtRohYk7d08GvtczOMpdWfDo/fDciLyefrWSs5XtMgpow1jXOkCRcayw8W62ve73rdk5iJ8E
 2sPRUiEkoVRTSmLqtB/hPgQnDFYI0QiDObaQGMqrvkPMU3TC4G5yJU5AQAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072231_681673_FE3DEF94 
X-CRM114-Status: GOOD (  18.54  )
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

Do some cleanups then expand the timestamp format attribute from 1 bit
to 4 bits for ETMv4 in Perf mode. The current interval is too high for
most use cases, and particularly on the FVP the number of timestamps
generated is excessive. This change not only still allows disabling or
enabling timestamps, but also allows the interval to be configured.

The old bit is kept deprecated and undocumented for now. There are known
broken versions of Perf that don't read the format attribute positions
from sysfs and instead hard code the timestamp bit. We can leave the old
bit in the driver until we need the bit for another feature or enough
time has passed that these old Perfs are unlikely to be used.

The interval option is added as an event format attribute, rather than a
Coresight config because it's something that the driver is already
configuring automatically in Perf mode using any unused counter, so it's
not possible to modify this with a config.

Applies to coresight/next

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v4:
- Add #defines for true and false resources ETM_RES_SEL_TRUE/FALSE
- Reword comment about finding a counter to say if there are no
  resources there are no counters.
- Extend existing timestamp format attribute instead of adding a new one
- Refactor all the config definitions and parsing to use
  GEN_PMU_FORMAT_ATTR()/ATTR_CFG_GET_FLD() so we can see where the
  unused bits are.
- Link to v3: https://lore.kernel.org/r/20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org

Changes in v3:
- Move the format attr definitions to coresight-etm-perf.h we can
  compile on arm32 without #ifdefs - (Leo)
- Convert the new #ifdefs to a single one in an is_visible() function so
  that the code is cleaner - (Leo)
- Drop the change to remove the holes in struct etmv4_config as they
  were grouped by function - (Mike)
- Link to v2: https://lore.kernel.org/r/20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org

Changes in v2:
- Only show the attribute for ETMv4 to improve usability and fix the
  arm32 build error. Wrapping everything in
  IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) isn't ideal, but the -perf.c
  file is shared between ETMv3 and ETMv4, and there is already precedent
  for doing it this way.
- Link to v1: https://lore.kernel.org/r/20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org

---
James Clark (13):
      coresight: Change syncfreq to be a u8
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Hide unused ETMv3 format attributes
      coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
      coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
      coresight: Don't reject unrecognized ETMv3 format attributes
      coresight: Interpret perf config with ATTR_CFG_GET_FLD()
      coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
      coresight: Remove misleading definitions
      coresight: Extend width of timestamp format attribute
      coresight: Allow setting the timestamp interval
      coresight: docs: Document etm4x timestamp interval option

 Documentation/trace/coresight/coresight.rst        |  15 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  59 +++++---
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  39 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  36 ++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 164 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  62 +++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 247 insertions(+), 152 deletions(-)
---
base-commit: efdccf6a511891db037e08f1351e72eaa101021e
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


