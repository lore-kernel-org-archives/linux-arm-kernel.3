Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C049E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E8GoCBmwykt6c3qkAuns3te+tR7WufYhRllGnYRB9TU=; b=ZsYjdXr52bS0DiJJMLQ2Zlw3i7
	U/MWygjc/6ZBLAARDjfg4eGcSzZmEc30ux/rsm33pcumfGLUW632Hx6N3AyK81DwtOp42AUAp1fUb
	B0W1voSO8xhLbLR39slWGuAp31bTTtiCAjBMXF0zZj1BQE8bujdVxc6Yjk6jrK48NCuQKA/L2WMvU
	MOTh8+co9OJ9oZWDRcesNA8d7QaMMWg+lLFCk6ab20wO1B6oUJfoaueKOv9e/fBq+O5d2Q0JNRrCG
	trfjeG0+iaO6HaO1Jw1hF5ovRxLCSHlfjznqkjbK7UK+atVwlKdTnogwS3Y7A1vFTTcALq7W6L3p8
	cYcOBtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6zx-000000049Se-2U1A;
	Fri, 13 Dec 2024 14:50:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6yr-000000049C9-3QuV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:49:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361f664af5so19346825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101364; x=1734706164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E8GoCBmwykt6c3qkAuns3te+tR7WufYhRllGnYRB9TU=;
        b=aK4iKo8tZ3sA7O6Ytws8neKoO0YPrqz3L5RZQPacJ5B/MdL1xuy4v1z1Gw4kDJrX0R
         JBYKsdL8DK2mxNg0yv2mqGEskGmlWfQkLLmTcAEdB+BKOTnUAXiqMY2VySn/VH1tvNiy
         Q8L38v9P8cynigRKavGWJBHbcelj1oi2g1kgI3TPVuPYWYk/SQU9MHUVJUVh/rFtGzCZ
         oywAEejNm/SbVeDFBad2Bjo/tQ04iMF9pCpDaC9bKiORW/Ahpjd1WhRSPrYiQ3g4AomG
         ffaVNUGIuUMz0x/zYzcGrq+9baMQy99IDSUVu7ZpemB/96kzktsQ8RWs32pz/UyczrIW
         OOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101364; x=1734706164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8GoCBmwykt6c3qkAuns3te+tR7WufYhRllGnYRB9TU=;
        b=ZTzH5Z0Fj0Ncn0m/8Yo4CBMNWXdQDbo5lqdZDuzBP8mhaNBWEgmDV24tnXK+KLP5iG
         QNFm/sXxNwu5ti7IcgLkJUZYTH2fgMEDy3yIVqwwqgYFLB5vAJ1NKsNxNuNXwtxkoqoq
         2DSfItUhJWJY5jst/xjPZjnlzPdciDMBZxPcIWwNoS3OrUM5UNmnpjdZzJU7lwQPpCil
         EJ6CpLGuXkbQPKXWq3rR916XPk6L55NCrlkhLNCsQJVQM75BF6bQo0BdL2PA0s11vQlq
         jvw4LEOGQZgV3wvbRmALEqDbxO+HoHz7LsGjpzUXfpS/7N4y/CrnzTTOc0iEg51GKfvX
         1zTA==
X-Forwarded-Encrypted: i=1; AJvYcCUzpTFmiH5uXyIEDKm0vyrsEL1doP1tVoFwTCM0j8DdE9ytEMclG7OvzHvOiQKYCtGYOJhfsxD9w3lMuvPmhOWo@lists.infradead.org
X-Gm-Message-State: AOJu0YyinT+Lz/A8zDPSJCuTCk9imMgdJuy4Gv4oND0fFlNqIXVtnYni
	aNPn3l55wHAK8mRqJdUXDQyNqe8lp2/0ZKemW0zPf37W30Vum1W1yxpUAGcuBt4=
X-Gm-Gg: ASbGnctAR9g++xfZFQoki11gi/aNngtvRaKRDH72R+C7fPIV1Sisg0cxRKQlYLqRgM2
	TQPy3IaboaCNAx7z4fVm0ZplRRmiWSFLrNeRlvk5dNbgoq8LOTwgLu7WXRpW0NQuTPvwjgwUHSv
	2KCB9HMrYX+hWKvUIlBGz+3RPsQ9yvomCXWTmyuP5eTCJQKdGmeSTlssmvuPBzvkfRGhYkVZmrU
	nppri+9Ko76AZGJq/6xJ01k5t1wGJW36y0NLtt4R61gWMmKkzqjD1565Q==
X-Google-Smtp-Source: AGHT+IHuKTAtkAStuGvLvPcrpQeQQpsEVf2xFpYQ2v2zKJ5P0Iz/QfOrm/aJ+WBkyPYCOtebr28gcw==
X-Received: by 2002:a5d:64a7:0:b0:385:e9ca:4e18 with SMTP id ffacd0b85a97d-38880ac23d0mr2122716f8f.1.1734101363889;
        Fri, 13 Dec 2024 06:49:23 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:dd7a:c2d:2b46:b1a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c50b7sm7196295f8f.57.2024.12.13.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:49:22 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v2 0/3] Extend logging on TMC start / stop errors
Date: Fri, 13 Dec 2024 14:49:16 +0000
Message-Id: <20241213144919.110642-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_064925_861571_70CD031D 
X-CRM114-Status: UNSURE (   8.65  )
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

Extend logging on TMC start / stop errors

Recent issues with trying to debug TMC timeouts and flush issues shows
a general lack of logging and context around the possible errors

Add logging to general wait for stop coresight routines and return values of
watched registers.

Update TMC to use this logging.

Changes since v1:
Rebase to coresight/next (kernel 6.13-rc2)

Mike Leach (3):
  coresight: Update timeout functions to allow return of test register
    value
  coresight: tmc: Update error logging in tmc common functions
  coresight: etf: etr: Update logging around flush_and_stop() errors

 drivers/hwtracing/coresight/coresight-core.c  | 50 +++++++++++++++----
 .../hwtracing/coresight/coresight-tmc-core.c  | 37 +++++++++++---
 .../hwtracing/coresight/coresight-tmc-etf.c   | 12 +++--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  8 ++-
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +-
 include/linux/coresight.h                     |  2 +
 6 files changed, 86 insertions(+), 25 deletions(-)

-- 
2.25.1


