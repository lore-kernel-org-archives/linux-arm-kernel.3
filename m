Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021AAC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=; b=G8+4dRXIi72wTZ03c4H9NR3L4z
	MKnYuk94wjzMZlnXVSNzGm1Im8wku8NtENLYwFwpgBlZgwGuqk1M3PVQaAiGj0J68H4sqrtXHIrSp
	PDVLYG11zBJDojbZgiwEkpUEYonaLy6xcB026LqtIgE9SsDP6G26XZM/ZaD7u5EA8w9WP4Ajkx0ns
	UA8D/sx9gGf7nPZC2pyPc487yfjdUPhsc/NxG4Cr95NqdiVTeKkZqQ0h2eSAO7EewEQLk7cjZI7zh
	5p6n8z+cyC3nCbf6jWk/Fx90Ctli9fdUW58QOLJFxbe7NUfuHIlv8GDFEl9Cfotj72qKgF1ScCShn
	4US1ZUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu7E-0000000B1dq-3smJ;
	Fri, 31 Jan 2025 16:43:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu0h-0000000B0DS-2yvP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:36:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385dece873cso1124486f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 08:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341408; x=1738946208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
        b=eO6qYz1dq+1rAg6W/lnB4QlPRPEPhgmQvXG0UWuJZNlkD3LDnsU+b9KJFFeNREBFuU
         9yE2W8y/pat0ye344VF4pxE8meCpRGMek7bpX8QuUzZ1SxeVEQntLtxokjOpHRCwVsV+
         aSvmhRQYcNDH/V4LyKnzkxw0EyDCqPgHb0ZZDuiEwTavVje3bkcTxkKg6/JsSztBrYHf
         iEaHJwdKW5tUfUesKEVmUDh0Pm2xS82cMg3SrOYZA1BVapxktMQZTAqVPb7VZWdU6MQ5
         rCSGAT+mrgB5vCwmFrFmihi9LtzFE3hV6KIyTqvU1Q9PLYB5KdtMI8g0sjmQAzHUMMn5
         oufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341408; x=1738946208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
        b=u+mBBFqLTMMs5dSBqS4pC4v1OAfmfX3OKHHz/ZL6HgGFo2bDE7NcDcr3SYJxC7xUrL
         VL7OXCFfUjL2PMKpRDGu5Ia8456ewanxk8XjOqkxrutpBwCWsKXMP3Qlu2Pdm64tJAC6
         Q0YS2zSTqz+Va+y3/hnt1WK5JBFYRzCe3Hqrg3cy7zVUuOs4/2YAGf8f4LYaEuNytCly
         SJpg1Dq4lY1Y8gY7E13TJCNSCSP/tuDS+Kvi8JI1+M3a8KTFLQtSaGgncjbKuQk7baFg
         99BXrRtlS8Vi2MI4GlGgXBVuEHyKJ185G8tvLd8E0Thr2R+/3geXTaPd10xnZfnDoMaS
         S/pg==
X-Forwarded-Encrypted: i=1; AJvYcCVm/SY8uvJ94zepb818C9H2NKAEya2PjMsKyFNap0+7Z9fVQ5L7XpxhApkz6srLii3FkkMQWUb6tR2GB6LbSp2B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8G+l29sWqozuyZiKup9BuN5/rJxG/cn8Qt3Do115p8n3IouMg
	jf98Ys4TL9cPwCu2EWnHwBk0/3nBKgjgLht0iv+iTFcjAFFy36Q7cbttrqACHNQ=
X-Gm-Gg: ASbGncslSPAD+OfZKXNX7l0xidDieO5A3mHNGZU/WAlmsm0hi4eCvyS9e+0UA8RpJnZ
	7z2sXJ0nrzo3fYOZDb7Q+q2XZ91SpXi4+T4WLCDjxZhamHJct/XiaRlsJ9ODmBHbzuhqIHEjlmJ
	u1CxyVW2UpSeB/R2LQtumb2ugh/7mtSH7StwCBarWZU3uwzoE/ITt27apncwR5eXkKQXuIMIkwX
	5BUX0ZoQtoCKQp38G/2QVvsgctzsJg5cbb2src5VSeIBWc4vcS0ERT2cFgvWFjKSqH9FoT7NzHe
	+2UM1JZHCSYbt7I=
X-Google-Smtp-Source: AGHT+IF5Phsc9N8X46dajNfJWnr4UVEjpzVbx4Mq2WI4DCkq1bHDvZhiQxOuFhDTImar5RTr5xSPFA==
X-Received: by 2002:a05:6000:4008:b0:386:459e:655d with SMTP id ffacd0b85a97d-38c51952173mr9891268f8f.20.1738341407991;
        Fri, 31 Jan 2025 08:36:47 -0800 (PST)
Received: from pop-os.. ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:36:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Cc: quic_tingweiz@quicinc.com,
	quic_jinlmao@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 0/3] coresight: Alloc trace ID after building the path
Date: Fri, 31 Jan 2025 16:36:12 +0000
Message-Id: <20250131163617.1730505-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_083651_755608_4E6EE1B8 
X-CRM114-Status: GOOD (  11.18  )
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

Proof of concept to support CTCU device. Applies to Jie's patchset in
the parent email. I think this would be a good simplification, it
removes some code and makes things a bit clearer, and works for both the
old and new CTCU requirements. It will require merging into the parent
patchset somehow as it undoes some of those changes.

James Clark (3):
  coresight: Don't save handle in path
  coresight: Export coresight_get_sink()
  coresight: Alloc trace ID after building the path

 drivers/hwtracing/coresight/coresight-core.c  | 107 +++++++++++++-----
 drivers/hwtracing/coresight/coresight-dummy.c |   9 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   8 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  20 ++--
 drivers/hwtracing/coresight/coresight-etm.h   |   1 -
 .../coresight/coresight-etm3x-core.c          |  84 ++------------
 .../coresight/coresight-etm3x-sysfs.c         |   3 +-
 .../coresight/coresight-etm4x-core.c          |  83 ++------------
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
 drivers/hwtracing/coresight/coresight-priv.h  |  17 +--
 drivers/hwtracing/coresight/coresight-stm.c   |   5 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |   6 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   9 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  13 +--
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |   2 +-
 drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
 include/linux/coresight.h                     |  25 +++-
 22 files changed, 159 insertions(+), 258 deletions(-)

-- 
2.34.1


