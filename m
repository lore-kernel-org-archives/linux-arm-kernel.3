Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851CCF9D0DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rb3BLemqhdiX3ZwvRyrWGWGBqhlheXx+K5Ge+Z0UaZU=; b=ITJ6v/cUoFnT2fvqRRPDueknxZ
	6qckui4QstCiBge4t76XCXZ3dCkqlvhY47vlKDei8ex5vwuj6YIY6WYHQ49Flq+9ol9vfMmq6r18N
	P0IEq8FhfNcidNC/UumEng2zYegZU0pqaBBOSQS4bqDjW0caVCBFvbOvJwOSMp/6QbiUl6AA+TIfj
	q0pxf32vCD5T3cYu7IArKv4k7OeVPe721Z/AYPlvQhel6loYgmrGzD3WN8pbiZsFesmNLT6xbB6Tm
	AjgCB1UcsG2zUzHxytgu7K25ZxBjJLs67GKPs125WrOPaCvA6OrdhYzSMXNPddlcX5dEioNoU3QNU
	5Q7p68MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmTJ-00000000IZd-0URF;
	Tue, 14 Apr 2026 22:43:05 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmTF-00000000IZI-3rAX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 22:43:04 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1279eced0b9so8819121c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776206580; x=1776811380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rb3BLemqhdiX3ZwvRyrWGWGBqhlheXx+K5Ge+Z0UaZU=;
        b=BnymCIhIYlHGBaXeNGQm7g7LiaImA1OsPrpK8X4mQHJ6wmcwoLZk4dAB0qDPghg44Z
         B0cHyRCQezjS7WKXS1lvvMhI2KuECvP/fboeWR/gkwW26P/jIuZwU2/aRtkHf0HjNxDf
         bmpOEvXoS0RUpIqhChCnnR+fWAHSnTO3a5gz+/Mx6f3/Dr7giE5q87XkxRBsMZNGeknk
         f5citxSIsxVuoCnA1SDU42Pqn05zN/P07jMvzoVck2i/KS7uV1jBdqvyiUSgbHPxCIP8
         /r6tvBjviJX4WOGgh+CWxxCIFmRNSDFiOe6r5KzHeqBIy04RZJGgeryOLqiRwZnOr6lZ
         oKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776206580; x=1776811380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rb3BLemqhdiX3ZwvRyrWGWGBqhlheXx+K5Ge+Z0UaZU=;
        b=YAVGQUr8SoU9wnxMGbeVj1EL116nqC3CyYvZsXPr0H8i/62mH3yVcsSg7WGF64MpQC
         GRJ/O+knRTe8wLFmhY731hEeL3UaikN1PdsSO98Z6ekT7i+msqPQIz87da0mFMlhviw4
         OEue8TXF/K6T0SBAnUjN1UHTpD+CS4TrVe4I1t5VsUCJgHSi5bd8ccV1Cbgtt6xwU5MW
         0HHcqcYdD29xFeeFy3/Bd1vvAnm98rBAk2/QVOt3e5HD89BKvRq76YQTN9XOlP1eFGbN
         6BBNAR3Ha4TOqWJy4gcPWGS2Nsi2Dtfu+Dgfi/UP/R+PVxI0SII7JiRt6lt7JoybERAC
         iaEw==
X-Forwarded-Encrypted: i=1; AFNElJ/NTyMJ4FbPyYi761+n5/ghLWwf4+th71WaTRO6DPo9JS/BKhCckQQazwuIVklngdaV6S6M5FEoqheTVOtkkthu@lists.infradead.org
X-Gm-Message-State: AOJu0Yws022zCKHOzGmk98d3Imsb8mhi4ek9c2avseweGlccDK+xu6Gi
	dFehg0rVNyPp718gZZcwXTKYGlYIsTOEnRpr7frNlb1zbSu6lG3o4Fk7ZaWQXpLMsmz9MZg1HnF
	cTBNeiD9A1A==
X-Gm-Gg: AeBDieswdSHxtbQGu1SyqQDeJjmuBqiqTd2wYmVGInMpnMmVYHkGRrXJKReV8VOwT6h
	//acWIF3bkIfXhHBUqn+EvbtKJ4+/JQrJyTYFNc0y81BEdVUvKxkjbY2bbFk8viT+z5zfo0E38d
	6YNfzR5jkU4u/HvPhM3NINVSz9CYd6K9bwPWn3kASQNifBrICjqie5j/JUgsgoVRitZlJLlLszQ
	MmX1paLMy+P/bP1vCDaNmRvTpfzHmgXw5nOEca9FweX2gqzar0lRRoaItZwVMs3u08/eeiLCqyy
	OEdN+LWrpC9wVFPJF4n858I1V/HbybfcijJasURhrStp+ZnwjNTOOlXfr8h1KdTGtcjYi3OOyTH
	ImCpsx/j7CALukabPdYtmt4EQLi+KNtHCk6UmU71HCgiox0/Mrw1FLnndwtnBgemEtbqMynzi0y
	QN8PRNmLOqxuFuC0vxkBjuwVGghcZpXNHv4ErWJFFjGZM8I0RL7/taiEe7o0dw0eBPML+6wS5O0
	Bx42Ub6UzWRcqCNYQwUUJ6U4RYh6PNjTTZlcdv07A5n/AtbLQ==
X-Received: by 2002:a05:7301:1f05:b0:2da:1a81:588 with SMTP id 5a478bee46e88-2da1a906cbdmr5452024eec.14.1776206580488;
        Tue, 14 Apr 2026 15:43:00 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2dd32dc2827sm4650361eec.23.2026.04.14.15.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 15:42:59 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Subject: [PATCH v3 0/3] iio: adc: xilinx-ams: refactor alarm handling to table-driven design
Date: Tue, 14 Apr 2026 19:40:32 -0300
Message-ID: <20260414224245.8493-1-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_154302_500632_53E6B788 
X-CRM114-Status: UNSURE (   7.39  )
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

This series addresses significant code duplication in alarm handling
logic across the Xilinx AMS IIO driver.

To address this, the series introduces a centralized table-driven
mapping (alarm_map) that replaces multiple switch statements spread
across the driver.

This improves:
- maintainability (single source of truth for mappings)
- readability (removes repeated switch logic)
- extensibility (new alarms require only table updates)

No functional changes are intended.

Series overview:
- Patch 1: fix out-of-bounds channel lookup 
- Patch 2: convert mutex handling to guard(mutex) 
- Patch 3: introduce table-driven alarm mapping

v1 -> v2:
- Fixed Fixes tag format
- Replaced AMS_ALARM_INVALID with AMS_ALARM_NONE
- Changed alarm_map base_offset type

v2 -> v3:
- Replace 'i >= num_channels' with 'i == num_channels'
- Add missing trailing comma in alarm_map array initializer

Guilherme Ivo Bozi (3):
  iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event
    handling
  iio: adc: xilinx-ams: use guard(mutex) for automatic locking
  iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach

 drivers/iio/adc/xilinx-ams.c | 190 +++++++++++++----------------------
 1 file changed, 71 insertions(+), 119 deletions(-)

-- 
2.47.3


