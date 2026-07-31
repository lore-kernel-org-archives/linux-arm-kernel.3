Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BDEC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zBCM5Nh2Z+pyL6wOrSHgIaBsinADA485LhOFyzTIsjs=; b=npHAdwidbMhWAH4ac84pg07bde
	17VG3p/kwjHgoZUQeAmiYHLPTf/SYflK6VRoDo7SG7R/bH1TdYlNtmM8qMvVQEqlQg3zs+qQ16hlW
	uCfqLiI3MdEFkl3irqEXi1YXQOeQH+AH0hy1Xn0zGeZ6wu1Ijr5MvTOx9Ci+/j+dsiGkUumC/+aCX
	8edfI1Gh5inCWZSABHt5PwMkGGzPwSoACkKjoPpoZbpwXyM/of1f2UHnbfrUoOt0mnyUF3f839wNb
	TxKqkvNZd2tPw3qLWgMKTl47WLUt6LU4tfFssSFsrk08cxRTOoh2dXXmUtyYFeoEnjOp7afgiCHpZ
	F5xizO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpror-0000000DLJv-3eTu;
	Fri, 31 Jul 2026 18:18:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprop-0000000DLJM-2QfR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:18:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1184462f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521930; x=1786126730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBCM5Nh2Z+pyL6wOrSHgIaBsinADA485LhOFyzTIsjs=;
        b=IIn7EilUXacYqSxQjE6L5vjYi+aFwtLHy9JXFxgK6m8Y/qgI9jYZAeRc2szw+fqbzl
         NdQ+ZtmaByiKyfdMucmy4E3hzKXohtNSQciYyw73iiSygt/20m6GucsItvrh2LTBWhYk
         4sUtTN8s12Feo2oe2aGGtdPp7J3irTk1lUL5Ebf2t8T+1kIGNGNRpnwiyhaq+N7QPmwC
         Ah8MHRUb61MYZwXHpXPGjGqzjKylFRt4ZAzL0Mjsz9fycVSXOWleYZ6rfUocXqZsNxRZ
         Hpbwmtwefr3R0HgPsvkTNbXSjMomrKaEqGpx49/qBfz0ZCc7AOUQPOiqFqzQV+Uj0NiZ
         D3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521930; x=1786126730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBCM5Nh2Z+pyL6wOrSHgIaBsinADA485LhOFyzTIsjs=;
        b=XdHR4kBEXWeYXtnHAbWPcWRDSE4hQNNB/PH16bjvAQO1MW4vQ8JGXIP5lmn/vqBuky
         Nq1IZxUUc8CaBW72GGGTsV9yBK0akpm3fj/8YBl3MEOmG9Xi/MdJ8zPSbTZWrqRA9Pai
         TPlTq6xq4lVFcxErcz4ZyXvW4AgGBuRqw8+EQLWPNLMb1gMIxNsdjyEWQh3CG59tYRl/
         gK/s3Ik3IAc9WNYni5eZ70Tn0OusuwttMIuJA7BONsXpFlecrPFOkAsox97EzicsBNTu
         Vk8bj6j1eu+70pCwVkoXArQidzQzVu/Bgb/eJX6ZGyJwFYTAO3NqN+0vely3LrGM71FO
         Qe7g==
X-Forwarded-Encrypted: i=1; AHgh+RqVwIR9ZESHHjHkwtg7M+peL/koUD07rkSOMSZtBP7PC2TNMgzSRrRBx+yJ2WHTEl5knxUP0fWYJy7tTZzB2QFz@lists.infradead.org
X-Gm-Message-State: AOJu0YwhO8Kr5EP1TypmbYbZI0FLFunhS1dDclraIQ1Mqhkbflu35V2T
	Ix/NKcGFF5JhsN1dZ5+rQ6DGQ6Z7CZ3Gq6ChVtOv+FLmPAGZR/kEjXit
X-Gm-Gg: AR+sD13WDFoDG52bastTbkj4XyH1xeBfvlHlJv1oN4qkTqFGUxweH/DS19PkT3fGXVu
	cDPYeR3/5UlSF84n2vLJXJH9OZu/2h8fy7x8dcs9QDVMgECfSMvvp5uUPCFvbxsD5mB/+iIsgKt
	cYON/AvYhTyeTl1m81fMU1ClsxSgk6L1HAuq5lTI2ncpzhaG8vBOINq4TnbkdUzUe0NNQSdoiHl
	BcOpBiBOirw49cpS9YeLXBFDzw+9oHL1juCFzj2c6zimUj5fT6nThJoAn2zBCqffhSGxP9gIL9u
	KEHCVUn62Vy4dy7qHi8KXmgIfD/u7Ajr2pxcEw34PGHR6OTomS2IDf2vMDWwmCe4FJ6sK4AMawQ
	noIMDFifguhFyEQP9WWxeoFZS9Dq5OXm7Vr78EIq/Ko2VrWS0Csn3hD+Hz2obe7ZtVbH9HQ3tkD
	RcWaDhvGuL5HME4QTPxe8mQCrs0+JjZdWl06oe+bgjlojLBaHEqicfoTXlUCpqaPUdn5VDVpHHp
	ePSpXu0wwiU4gC7iziBNFJTIMNXJbJBW+nNQ2YHKaaWBDfuxo49+pw3avRSCZbp2qynIdBBTDlc
	HZtI7KlVqYccoQRt3kW3mC59w231kQ6pqSsXBXlXleEQOqR4LOpz7TZ3rhx3t9M0JlJo
X-Received: by 2002:a05:6000:c90:b0:47f:d0fb:ea40 with SMTP id ffacd0b85a97d-47fd72db353mr1079198f8f.21.1785521929339;
        Fri, 31 Jul 2026 11:18:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm7293694f8f.4.2026.07.31.11.18.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:18:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/5] serial: fix console lifetime bugs on failed bind and removal
Date: Fri, 31 Jul 2026 20:18:39 +0200
Message-Id: <20260731181844.11330-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_111851_634041_65E3B1B7 
X-CRM114-Status: UNSURE (   9.77  )
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

This series fixes four serial/tty error-path bugs and an i.MX console
port-table lifetime bug. The fixes were found with failslab fail-nth sweeps
and sysfs bind/unbind sequences under KASAN on QEMU's raspi1ap and
mcimx6ul-evk machines.

Patches 1-4 fix shared serial/tty core code. They move fallible allocations
before console registration, clear pointers after uart_driver registration
fails, and make a non-NULL tty cdev slot mean that the cdev is live.

Patch 5 clears i.MX's devm-allocated port-table entry after failed probe and
removal. It keeps the entry valid through console unregistration, rejects
duplicate lines and serializes table updates against other port probes.

Validation includes fail-nth sweeps on both boards. The i.MX tests also
cover the sibling-probe race, sequential unbind/rebind and
CONFIG_PROVE_LOCKING=y.

Changes in v4:
- No code changes. v3 was accidentally sent as individual mails.
  Resending as a single thread.

Changes in v3:
- Drop Cc: stable from patches 1-4.
- Patch 1: remove redundant uport->name clearing and credit Sashiko's report
  with Reported-by and Closes trailers.
- Split v2 patch 3 into two patches with corresponding Fixes tags.
- Shorten the changelogs.
- Patch 5: use scoped guards, reject occupied slots, remove the unnecessary
  line variable, document the console-callback locking constraint and add a
  backport note.

Changes in v2:
- Patch 4: serialize port registration and removal with imx_uart_ports[]
  updates to close the reported sibling-probe race.
- Patches 1-3 are unchanged.

v3: https://lore.kernel.org/r/20260731180343.10818-1-kmehltretter@gmail.com
v2: https://lore.kernel.org/r/20260719221014.44354-1-kmehltretter@gmail.com
v1: https://lore.kernel.org/r/20260719160812.35407-1-kmehltretter@gmail.com

Karl Mehltretter (5):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: skip cdev_del() when no cdev is registered
  tty: clear cdev pointer after cdev_add() failure
  serial: imx: serialize imx_uart_ports[] lifetime

 drivers/tty/serial/imx.c         | 20 +++++++++++++++++---
 drivers/tty/serial/serial_core.c | 32 ++++++++++++++++++--------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.53.0

