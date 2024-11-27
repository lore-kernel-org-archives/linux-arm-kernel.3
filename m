Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42480D6ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HCAuWu+V7VZ+rFKxKqyS+9DoTo/OFL0+V5wGxEuB7zI=; b=e2coHPZEbKx/Y6AW5Wum30ZWzy
	WZ+Fq/K3Arf6YQTq3Mdoi4FMJfc0WFL+Cm/J/1ifCMJywv1wPCteeassszaJuvoxin0aPZiwPljuL
	MwV/qkFaDU5FDsPwwqXGNtVz3ACezYBdgMZE4J1wFdofdaMqsbL+lm7rrkTLK1zgc/8FfrH38jJKR
	kLCfjKOniozWpZY/O5ZKYNDyouFNQU8bsrIKHXBjaugQUAQPubH8g/Sl3rdmZFCTZcGwqsMNk6Y1v
	mRZmCqNroezlyy7dg2E4oCeIDFIwAZoXyeB/reSRy0xzNBORmXMz2tOxmMhpHQZrY0d/73k2sFASE
	0nyiGI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIKo-0000000DHca-3zwu;
	Wed, 27 Nov 2024 13:44:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIJp-0000000DHJC-3RHe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:43:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso13605365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732714979; x=1733319779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCAuWu+V7VZ+rFKxKqyS+9DoTo/OFL0+V5wGxEuB7zI=;
        b=OJA1S32KNpB5ytkaLxj3r8iroQPlntTs/WPgVDWBq4thpucLwA3ZcHroIq1AZbu3nD
         Jnq1RRNpuUUvj3RDwlsQFo9pTjPQ7FiKiqZGc3zXoDhUd8OqEGtCvNHi0/bDBHEGU2/Y
         7+YYOIaqUQ7C7SmHcSr6zDVx0b5pI9gbRL4Mv/qLHKzG2FA6plWFVaCckXylXR3NDusi
         hOIhADdJ/+LCftM7AiaQHx+jksn6HrOJ8+JAn9vNSlS5tY2RtzCZkbXf55UH3+Tfjk4j
         v5hCNQ1O/O36Ug4r83t3z1f66rCoQvQZ58cIPIG4YJJDgR55xmCDbJG1Ys4bY4u+yyNw
         8xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714979; x=1733319779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCAuWu+V7VZ+rFKxKqyS+9DoTo/OFL0+V5wGxEuB7zI=;
        b=vkJgZHm64Fp4C7JlsSBNBioV8I2ph0JemaRzaz+2zRbdKhpuN0lBdbJc/YxOJVXOdk
         ebLZPAKVBAtVsNusaDl9cGEGgPXuv8FvEC5MLXb2bVh3/NqDXORJ4/u4A06nj+ZSDQvM
         AH1r1TqmbdILskBkuJaUqoHn5/+sGuRpB3+/T5tMVeZ1M+Aayy0DJElp3b3qvMqD+7Hn
         54xhjA0i/xb3jTpRidViNGd7uREpl35VVf1XDZa2FOgHqS52s9EvTO+MMZUzEDXk7DAx
         wlyMOJd1uFTs56wGLRl0I81POouKA5nupQmyNAdygc66uohYqVbFe2tKvOMX32NRwk96
         vLuQ==
X-Gm-Message-State: AOJu0YyxS3YnDupFgyvH0Bolpu3tEx1bL4FJA9YoN62w/Kcidlh8LB66
	CMxpJqBrqUvDEu1EaHItrNKVyt40wSzCV3Kj1D8XtkqZ3fdAONPz7piTeNeWJMHeApTlJodGxUk
	y
X-Gm-Gg: ASbGnctzA2OgMCl5x/w9sNjZlseXaYEu2UNNlaqKusWxcfNHp9VO/UKthS5tFWrhIgN
	ui4/fMn7enw4mxPyf5EvClI7ljD2NM3CXyDkm/RPVnsYFOat2+i+CLi3JaTNY/fR+8jTL3TglAl
	8ldqYu5L2QRo+44AZtD/+ku6tclOKDmgigGq7upqCSMulnzjg1TGFfYLloFmKMkY4lI48FM220+
	Yase/HUxATsQ1hYju4pLp+owBVpF8a4IqqIUTgGu0ER2A1bpEWL
X-Google-Smtp-Source: AGHT+IE4aMEOtU8RVRCofnpurS/X9S5YYhfiVo8pfMG4zNg/q5kFoXtc3bz//V2XNK5d0rMQCMSh1g==
X-Received: by 2002:a05:6000:4708:b0:382:5010:c8da with SMTP id ffacd0b85a97d-385c6ee187bmr2868608f8f.59.1732714979608;
        Wed, 27 Nov 2024 05:42:59 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:9ff7:e7c5:5e0f:c5ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm16804645f8f.1.2024.11.27.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:42:58 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	james.clark@arm.com,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 0/9] coresight: syscfg: Add configuration table load
Date: Wed, 27 Nov 2024 13:42:47 +0000
Message-Id: <20241127134256.2254851-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_054301_858469_1ADB5881 
X-CRM114-Status: GOOD (  17.02  )
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

This set extends the configuration management support to allow loading and
unloading of configurations as structured tables.

The existing coresight configuration configfs API is additionally extended
to use this table functionality to load and unload configuration tables
as binary files.

This allows coresight configurations to be loaded at runtime, and independently
of kernel version, without the requirement to re-compile as built in kernel
modules.

Loading configurations in this way provides a method for atomically programming
the trace control elements (e.g. filters and triggers) of multiple connected
CoreSight components as a single system for a trace session when selected on
the command line both when running trace via perf or running trace via  sysfs.

All configuration are validated at load time as being compatible with the
CoreSight system in use.

Additional load and unload attributes are provided in the
/config/cs-syscfg subsytem base group to implement the load functionality.

Routines to generate configuration tables are supplied in
./tools/coresight.

Example generator and reader applications are provided.

Tools may be cross compiled or built for use on host system.

Documentation is updated to describe feature usage.

Changes since v6:
1) Rebased to coresight/next - 6.12-rc4
2) Adjusted patches to split the load/unload API from the configfs attribute
   declarations
3) As unload order is strictly enforced to ensure dependencies are not broken,
   unload is now a simple write to attribute to automatically unload the last
   loaded configuration without need for name of configuration.

Changes since v5:
1) Possible memory leak removed.
Reported-by: kernel test robot.
Reported-by: Dan Carpenter
2) Reuse mechanism for reader code revised. (Christoph)
3) Unload mechnism now by name in standard attribute, rather than
entire file
4) Mechanism to check last loaded configuration can be unloaded.
5) Documentation updates.

Changes since v4:
1) Update coresight/next - 6.1-rc3
2) Update to lockdep fixes to avoid read lock race in configfs.

Changes since v3:
1) Rebase & tested on coresight/next - 5.19-rc3 - which includes the
fix patch for earlier configfs works.
2) Lockdep investigations resulted in re-design of some of the code
accessing configfs.
3) moved load and unload attributes to root of cs-syscfg. (Mathieu)
4) Additional minor fixes suggested by Mathieu.
5) Memory for configfs loaded and unloaded configurations is now
explicitly freed.
6) LOCKDEP nesting fix for configfs base code (fs/configfs/dir.c)

Changes since v2:
1) Rebased & tested on coresight/next - 5.18-rc2
2) Moved coresight config generator and reader programs from samples to
tools/coresight. Docs updated to match. (suggested by Mathieu)
3) userspace builds now use userspace headers from tools/...
4) Other minor fixes from Mathieu's review.

Changes since v1:
1) Rebased to coresight/next - 5.16-rc1 with previous coresight config
set applied.
2) Makefile.host fixed to default to all target.

Mike Leach (9):
  coresight: config: Add configuration table processing funtionality
  coresight: configfs: Update memory allocation / free for configfs
    elements
  coresight: config: API to dynamically load / unload config tables
  coresight: configfs: Add static type for config attributes
  coresight: configfs: Add attributes for unload operations
  coresight: configfs: Add attribute to load a configuration table
  coresight: config: extract shared structures to common header file
  coresight: tools: Add configuration table test tools
  Documentation: coresight: Docs for configuration table load

 .../trace/coresight/coresight-config.rst      | 287 ++++++++-
 MAINTAINERS                                   |   1 +
 drivers/hwtracing/coresight/Makefile          |   3 +-
 .../coresight/coresight-config-desc.h         | 105 ++++
 .../coresight/coresight-config-table.c        | 431 +++++++++++++
 .../coresight/coresight-config-table.h        | 151 +++++
 .../hwtracing/coresight/coresight-config.h    |  98 +--
 .../coresight/coresight-syscfg-configfs.c     | 577 ++++++++++++++++--
 .../hwtracing/coresight/coresight-syscfg.c    | 103 +++-
 .../hwtracing/coresight/coresight-syscfg.h    |  19 +-
 tools/coresight/Makefile                      |  56 ++
 tools/coresight/coresight-cfg-bufw.c          | 328 ++++++++++
 tools/coresight/coresight-cfg-bufw.h          |  26 +
 tools/coresight/coresight-cfg-example1.c      |  62 ++
 tools/coresight/coresight-cfg-example2.c      |  95 +++
 tools/coresight/coresight-cfg-examples.h      |  25 +
 tools/coresight/coresight-cfg-file-gen.c      |  58 ++
 tools/coresight/coresight-cfg-file-gen.h      |  17 +
 tools/coresight/coresight-cfg-file-read.c     | 239 ++++++++
 tools/coresight/coresight-config-uapi.h       | 105 ++++
 20 files changed, 2644 insertions(+), 142 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-config-desc.h
 create mode 100644 drivers/hwtracing/coresight/coresight-config-table.c
 create mode 100644 drivers/hwtracing/coresight/coresight-config-table.h
 create mode 100644 tools/coresight/Makefile
 create mode 100644 tools/coresight/coresight-cfg-bufw.c
 create mode 100644 tools/coresight/coresight-cfg-bufw.h
 create mode 100644 tools/coresight/coresight-cfg-example1.c
 create mode 100644 tools/coresight/coresight-cfg-example2.c
 create mode 100644 tools/coresight/coresight-cfg-examples.h
 create mode 100644 tools/coresight/coresight-cfg-file-gen.c
 create mode 100644 tools/coresight/coresight-cfg-file-gen.h
 create mode 100644 tools/coresight/coresight-cfg-file-read.c
 create mode 100644 tools/coresight/coresight-config-uapi.h

-- 
2.25.1


