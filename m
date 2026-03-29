Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FB3F3D5E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KIctrFMkwzb+e9qVyARdABXgvBrIrhDp/Rj0SClxo9U=; b=i6WhWyutEccMYlWnyxwTQ7l3UD
	G9WdnM7SYxFWx6mFgrm/8EQKlC03ESdPB7ZDdcqoDv3uwOCgw7angg4rZ9hmIXnwwuu+1USQwfxja
	/Nx4nGLLuNKwOGeZXcnKvu/rPZ3B2mnvbHzcklgHllgDvoh8CsA3z4xS/2tbEGB2OsqKPL9RsxzMW
	jvDUiPKaq3ER4NK/PX5LgrgQk4s3BKLadhzNhTdS4GHnnVCmBPq0Kva2XVpHdLJ3qp7akBD2dITXK
	2OX+6sxguQqhTbQTvNPbTaAtkcKuzosVv3//pzZDGqTsV98/rBrskxbzgoY6dV2cepsyiJIZNxIWx
	jwigeB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jVQ-00000009co6-2vd9;
	Sun, 29 Mar 2026 06:20:16 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jVO-00000009cnP-1iUr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:20:15 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so1078439241.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765212; x=1775370012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIctrFMkwzb+e9qVyARdABXgvBrIrhDp/Rj0SClxo9U=;
        b=SjhOFUwH00HgLlxK+97JNiYU9+wO1CdNClDl2/X66DrpHbxEDvufi0vRGzG77/3YgJ
         FViDxB/AMgjTQyIT0kw+qBY3X2iYTljSlAZQB/6JW/Z7U+paQVwSqyoG36/xw+wdYMBd
         S2CfA8dwjyD7rnAbYB+lZYLIhSu12vh2qVhwxHqSWquH1fyz25OJMdGHDqSa6kswiM6X
         kJg7yVg4HTUBlnYv/+auGFjSvkXRwVRtMwXQM9yp4JZzw4FEbEUTvhFKsCiEAj4V9T+o
         J3d0JqjdbrHl1QkGZIdgWUOQFH5uUpBiMtS4Myexe1hBI6/g1QVbzRJM1CrdYS9q6BKb
         9DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765212; x=1775370012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIctrFMkwzb+e9qVyARdABXgvBrIrhDp/Rj0SClxo9U=;
        b=f33T4O+lRXALOOL5hz8Z0HPG66PQy26dqFSStwoLoXBE8NBN/PSvhkEm0ciJYPbK8s
         QdJBg8XWH2RLddeGpyepKNMqVWN8dVVoIQ+2/Pa6ISLeb+xpCHFbfcD9MBwzGtV4yvUh
         npY7Z2sGFU6n0KuI2y9dVKDAzB1HB+9giCejBieknVLgrqtXIHmRVF+/2O7/xj4DepZo
         1DB5w5c7zM1VWgImJJ7NZkfTVEUFVU5tytDlv7M9VwI8xnTiNQiNsao0i2o26XPBg5+N
         xyV8J9tkYYCsODi5zSksIZzbDlFLg3Ygy/E0lX49ooccTni0QWE1rQQb2ZGcSSxIWUQW
         sHpw==
X-Forwarded-Encrypted: i=1; AJvYcCWokynY420Z7baBL+803T3xGPycX1zoWqg8up9UXA9EOvoxuoV+SgGiLYyu23jeX788ivXNQePMKqkvth279hTt@lists.infradead.org
X-Gm-Message-State: AOJu0YyX5R7iD+hGTfoeyVmLcRNXCFyVYwY6ao8M3DR8KGpj8TEIVlqb
	WdewuFmBTX16UyI5Vi0KLL4eo/4/XhvBibnubg4u6VVZCKp4TtA/jFeF
X-Gm-Gg: ATEYQzw1YjqbxfAV0QhX/an0DkE6wk/V4zcsl3oy0tTro7xhTt7+4DMmolj7dbMCVQJ
	JKYhom2aulcO77cflm9z3Dl8nYtgAunyZMZ8FJkfbvgVIVgD1uvA/WFCCCmEK5OJ6Qm+s5kd4cQ
	GIsLpJeWZBC48DvYQfyPqubvStfI8HxAH/88LC4ZP4B9gJw+BRLgcQ48wKuQbXHPApF+phM8ZEJ
	iv4PA1CiE6aQcR2dWgDARmC0SFrziZfKAphotWAZNSFjvl3IovX1Ng4EnXk/Avam0g8YLdhEQEO
	fTo+5CcQcugUTQ+EUwpb0nLSlo02TNq9HNyfL5iIq8MvDJtfStM9LWdSfAYv+sxJGIwr+bj7zYL
	pZ3+hTIdK1bV1x58B3jmDhjXJ8Vam3BsLvTeuPCZvP9zfgGOknWtrppc+15ohZN43eliHPy6WM7
	nu+7p6L4ITPDgYcsk/HEd7VCthDEUFS4o1A9A=
X-Received: by 2002:a05:6122:208c:b0:56d:4511:9367 with SMTP id 71dfb90a1353d-56d4a0d46cemr2804517e0c.0.1774765212473;
        Sat, 28 Mar 2026 23:20:12 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d76:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893d21sm4429929e0c.2.2026.03.28.23.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:20:11 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 0/2] staging: vc04_services: vc-sm-cma: fix security issues in clean_invalid2 ioctl
Date: Sun, 29 Mar 2026 00:18:44 -0600
Message-ID: <20260329062004.492812-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232014_457056_4C993E94 
X-CRM114-Status: UNSURE (   8.36  )
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

This series fixes two security issues in the VideoCore shared memory CMA
driver (vc-sm-cma), accessible via /dev/vc-sm-cma which is created with
mode 0666 (world-accessible, no authentication required).

Both bugs are in vc_sm_cma_clean_invalid2(), reachable via the
VC_SM_CMA_CMD_CLEAN_INVALID2 ioctl on 32-bit ARM kernels.

Patch 1: Integer overflow in kmalloc size computation
Patch 2: Missing address validation in cache maintenance operations

Both issues affect 32-bit Raspberry Pi kernels (RPi 1/2/3/Zero and
32-bit RPi 4/5 configurations) running the rpi-6.6.y kernel series.

Both issues were found through manual source code auditing.

I would like to request separate CVE assignments for each patch as they
are independent vulnerabilities.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>


