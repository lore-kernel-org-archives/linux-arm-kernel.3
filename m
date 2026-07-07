Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9A0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+fjWa++UBimAMIMqNtyKD1hu2ij4ym5qJ6xUR6av8M8=; b=SS4hU8erGRPOoV
	fhnG+ifaKD1OsYowvad+3eoO7B1sUNsomZuezB9ix67NXELK7QGDxtgr/w4pG5F2m+u5AulIXQMOL
	Q7cfvn5eyyINhQpktSB5Uc1lyYfE1a7MrEDhmHDRVrMYb0CkvxWXhPq13ZmUYKFL3AmztOdI/EWcV
	rL02ZPuo9Wtm/x6Icq68w9KUgKzAnvd1993lHbA2B+hLz9Ut24Hz/4f4Yu0JpJrqfW9cooZau6Iat
	BcZ/ihYosXU3RfN4Jbw9EeH0CyM92g66tsJ+0P4F7gl5v9o/Nzm1HqqCB9EYC52dGsojgCZRRbX1Y
	zJ05W5y8NQsNZfDx8cAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwG8-0000000Dz7Y-2sde;
	Tue, 07 Jul 2026 03:14:08 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwG6-0000000Dz6f-2FGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 03:14:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so3225232a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394045; x=1783998845; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+fjWa++UBimAMIMqNtyKD1hu2ij4ym5qJ6xUR6av8M8=;
        b=qx/Rwp3SAU6eCIwLQQdfo2pYxhjcDlLyz1+S30Im9ngzwsnlcOh2+0JCYDWB0yfH3P
         gioD1Pko706KErE3JTBH8BNDgA9QzUcqe21adFRcv2Lo/92HMUT58MRPrfJUbxgHw4IA
         xdef7F9TrdNq2JwolRM+DGHfx0fkUDw57GPtAk45C4lj6WB7eYxpvN8IMXVbJKDVC5wn
         imzlF6diC5tlHm/QVriO27nKyndJWvZczTFDb54NxknkMtWjhGA7UokfYGYoluJcVEzv
         pByFmyS2gy3sPr/oW2m0wtMYcq5i2PCsk1M63ejx4zZb7j2Q9U6n4tivGzTTaytde6OJ
         HBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394045; x=1783998845;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+fjWa++UBimAMIMqNtyKD1hu2ij4ym5qJ6xUR6av8M8=;
        b=XRx7LEAu3LQjD57fAB8LvNh8yjSSS+68jrPxNon/yJhuYDrXguFhL7Y9B7Kl3v9yl3
         Vi155OFGdoTu6Na37Rt9a65/vKmdPicHKZqbpMwCJrPKw2QF5/NESzS2GFFYulWjNjaN
         hcJGsX0ydD4vD8hR3tAbBlDNi9jK0zQvLB+1tioIsXywIz4P+6jsw+0plIvMkvhYrj/d
         bXlkq/QmxTPgfmfyHxUSrstMGM1qVZ+ALGZRPhTJ3uaVv9ys3owZglQMI4Gmlh/6aB6K
         asHKjQs4QhwZNhgRUA7sTq+xrLEhCUShrOXLWpm6sGdIKy3a5n23m941pFeYNvr/1w/X
         kytw==
X-Gm-Message-State: AOJu0YzxZ3f0DJgIYzHNBvO5T4B6En2zW9BGaaBa0V+MBRFmXk5iv9xw
	bUm+FemAyHdbLBRpr+WOENgXr3/qsmxJ0gUsYjj2IPEgbToED1JNbBpw
X-Gm-Gg: AfdE7ck4UZY/LvoFqPvcQdcnF7aztAPX7k9EmX90Ir9ijCEwpjpI2FGZTxDDkzvnFh7
	jGy1BnZo8uIwb5a2EdqjgO47raK9vuACmvIv8iVZ1xyB4excqKzabrJTRtIqPvJh4lY/1YP4Jbr
	PcaocStvsd0dZRn/eVowpPlFmlldtcAtGjEOSgoFD4Jzfa85TLMg/AUOaCKv6BgfR20qAVypd91
	QqZp1pDRDUXevSHS3vyBSmWoShTw2TI6xk5lm1hQJArSKrp4aO8I6LSqUxjC40o6mMRWG/NlpH5
	LaRy4KfcgxAZ+cw509UyDLkehbRaljEyTWMsgqCwcJYzOr8XhnfjBT5q3RULWVWcbqnofj944VO
	joYqcfzwHHOxmKG+dkP3dLx1dPFVFTMJXUXqCGS4gpivWXmgjl5veCqUljIHeQ+g/64be3C4YXV
	4Gvhc4HPwL0xMrxha2kGGLtE+EseXV4YCuJdv4pzmxRZCjnCFJlZhFAqGRRWzMdmeZYuKjxYxCP
	CjVYTcqT54Rl24=
X-Received: by 2002:a05:6a21:3294:b0:3bf:6c08:2849 with SMTP id adf61e73a8af0-3c08ef2d446mr4097835637.56.1783394045522;
        Mon, 06 Jul 2026 20:14:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
Date: Mon, 06 Jul 2026 20:13:59 -0700
Message-Id: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPduTGoC/yXMOw6DMBBF0a2gqbE0dhQQ2UqUwoYHDIWJPOEjI
 fYeJ5SnuPcgRRIoPYqDElZRmWOGLQtqRx8HGOmyybGruOa7UW8ts9Etzh2Md0BAU98QAuXmndD
 L/v89X5d1CRPaz29C5/kFSAKU23EAAAA=
X-Change-ID: 20260705-sa1100-swnode-a2eebe973ebb
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_201406_603833_14C01FD1 
X-CRM114-Status: GOOD (  10.82  )
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

This patch series converts StrongARM SA-1100 evaluation and handheld
boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
(struct gpio_keys_platform_data) to static software nodes and device
properties.

The first patch registers a shared software node for the SA-1100 SoC
GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
node directly to the GPIO chip prior to registration. The subsequent
patches convert the board setup files to define static software nodes
referencing the SoC GPIO controller directly, allowing pin bindings to
be resolved via the attached firmware node without relying on name
matching.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      gpio: sa1100: register software node for GPIO controller
      ARM: sa1100: assabet: convert gpio-keys to use software nodes
      ARM: sa1100: collie: convert gpio-keys to use software nodes
      ARM: sa1100: h3xxx: convert gpio-keys to use software nodes

 arch/arm/mach-sa1100/assabet.c | 75 ++++++++++++++++++++++++++++--------------
 arch/arm/mach-sa1100/collie.c  | 74 +++++++++++++++++++++++++----------------
 arch/arm/mach-sa1100/generic.h |  3 ++
 arch/arm/mach-sa1100/h3xxx.c   | 69 +++++++++++++++++++++++---------------
 drivers/gpio/gpio-sa1100.c     | 10 +++++-
 5 files changed, 150 insertions(+), 81 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260705-sa1100-swnode-a2eebe973ebb

Thanks.

-- 
Dmitry


