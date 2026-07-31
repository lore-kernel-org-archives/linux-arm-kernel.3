Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE7C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=; b=SOi2In332pdWLKTWX4Xen7qjbO
	f7XigXhMy9prDCk7M2R6CTRoY8By6Eooq6wFERdMBu/yhh+8hLc+S+T/wjEINzmgXZBvKdMBSCk2D
	CewYzeIRwiLtIITrbdPOmBkbX4ThNGD6TB5ZrplSgSqzjbtKo3mpGDBndJUj2GiUZzH1KecKYenRb
	OXDFY0poVnwZt+Q81oph/5sZao8WSXxf0KULnfMGAwz5JYitR/GByLSJiYiuV328hq3vs64/+whFB
	EE3ouMyvIn17S1U9Po9NP0Dc9qQC9CEvKpL9NbOe86JRm6JUdVhcVPhgwX5u2Jc29BO/DsMTeQdCw
	NdXC+vuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprp2-0000000DLNF-47kC;
	Fri, 31 Jul 2026 18:19:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpror-0000000DLJg-2ttG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:18:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47db714766aso1474514f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521932; x=1786126732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=FXKZPrGOmBghQiYwyGheGxtpw2U5VrmvjD7H+oMS03nz2MQE+wv1tNEsJBq8y5I+jo
         t7SK77tqT9nZq24eXPv669vNW/J364mEPyJHRErip/3WJA7RPRO4Z7vBZy7cK7Zgnx9o
         vNXt7eDtxBJDXQ4Qr2k0moVjQy9P5+X+ahSHBhkW2mXyX8yLeykQcMXGCJQ0f9xW0dKx
         dLIKQpTK9oC2DH8z4MDoE59W1aPpY/7om0lLuHRu5T4mFmgOs5UOplFtI3W0HO8dwxB/
         bKU9mShct9jrzspEoaGG20N9ueF84Fb9M+/1+5vmcwTNiBjdzPzZ3+kTQevYe/Ct/5Ko
         j3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521932; x=1786126732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw2+6W330KNNbLzF0QvSgAqSLp8AT2ZZJuEbFAlLaQ4=;
        b=etBooMqiHGCdd0loyMrjo2M+krVvlBLukOM2nU1bytCsVSU6zDCQ1sDJiYTPJKrlAU
         337m8WhsyBERX4i3i61hFitm9kn1+2Ahi/hV5V1+f5EO2V3kSas6pxFhjjWIFesyxi5i
         1CkJlc7Lb1+Kh24OYHzTT08JnLZmgQ0RyCQNRpP7MiIZ2vADFBsEIqqODMshDNdVhXGZ
         0jmpa/zyoYa3THJyOXqhV7PY8T++s7bwPCw5X3/U7E7UF+2tzZEE7306stat2Fn2iNB3
         NkJ09Z1UOm9DAN+vtLr0aWtVltyLe5qEuF7GsfA7tzlPlVrFxVdEIsmHhKHWmCcUqtWr
         UsLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPkUatu2wZ+x5QPHKmvGuZTv+v1UXz+oJtzMB8ASTpKgCNQcGqUJJlGimVDRLi25D5zLRAXoLVmu1LfjgnkuXF@lists.infradead.org
X-Gm-Message-State: AOJu0YxRB6jO+mdDsEXhr+9OAs/hWDdgrAiwqvyMnmjS1Y1J2JN/y1SD
	zEK6vUetlKquLHm/nS+tGiYawCxAV5dOUPyv8aFyqwrecZj32Nl2zEYd
X-Gm-Gg: AR+sD12kVXRZMsgLnKQD/2njFRpbmn2/oRFFJCHRFLCPSG3kjjNwuHslo9T8fLoN+CW
	IsZqzb9eC9QZxBolxAgZhNQE31jC3KPMqBxSPwaIzljmljhLPEIEFakqNtNeqT2/7OPx7X1Popq
	U5G0e5jMdqV5tes6uh/4V3cWSHnrMGO1GW6ARAk16i93MBs3qJ+MDrx7p3DHDvwE/lTbSYE1wsC
	Sd0+0gXsRWYX2nZ8PeehNK2Az5bkg4Z0AnWaXxcg0mFHDRMRiZ8VDg6IzMf3yrcn9pTFADFEn6O
	FVi445o+Eo57Nd5YgzFfC3AUplGoOLGK04ubDqiVKKU2xxJT4vhkvMT5G0X1iMbCOw93RS/PYYy
	YmF2Yb29dYiNdXr+B6MMGKMunifxVqlVDv4lFgg5ba4pEH+Q1FM8kkUWdDWbKzAMrBM0RT7QY12
	VrNFrxIvMsssvJhMXq/HHZu9nMvaysskbwED4INSKE1Qq3NGiUi3zOJgy3kQqAPC4+BN/FUo8Cr
	icQwMrTpIDmj3KIx6oISe+Iux9gWIj4fVMdrRGDAtG1wXBqQCqXxiDyb28v9uFU2Rh5Qo1s8Ie5
	OaLzGOCT0VFhvnZK8cOHsVgs0Qfe7XTmSHBVtgSTTC+sQmn3rnxUuU8Ah960RGsgbPmc
X-Received: by 2002:a5d:5f09:0:b0:47f:97e9:fe55 with SMTP id ffacd0b85a97d-47fd32ea399mr6710072f8f.22.1785521931614;
        Fri, 31 Jul 2026 11:18:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm7293694f8f.4.2026.07.31.11.18.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:18:51 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 1/5] serial: core: do fallible allocations before the console can be registered
Date: Fri, 31 Jul 2026 20:18:40 +0200
Message-Id: <20260731181844.11330-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260731181844.11330-1-kmehltretter@gmail.com>
References: <20260731181844.11330-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_111853_749366_305F8996 
X-CRM114-Status: GOOD (  15.45  )
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

serial_core_add_one_port() allocates uport->tty_groups after
uart_configure_port(), which may register the console. If the allocation
fails, the driver unwinds the port while its console remains registered.
The earlier uport->name allocation has a related failure path that leaves
state->uart_port linked to a port being freed.

Failslab reproduced a NULL dereference in PL011 console output and a KASAN
use-after-free in i.MX console output after failed binds.

Allocate the name and tty_groups before linking the port and configuring
it. Reserve space for the optional driver attribute group because
config_port() may populate uport->attr_group during configuration.

Fixes: 266dcff03eed ("Serial: allow port drivers to have a default attribute group")
Fixes: f7048b15900f ("tty: serial_core: Add name field to uart_port struct")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260719070454.D6FA21F000E9@smtp.kernel.org/
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/serial_core.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index a530ad372b43..03ee3d038f4e 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3056,7 +3056,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	struct uart_state *state;
 	struct tty_port *port;
 	struct device *tty_dev;
-	int num_groups;
 
 	if (uport->line >= drv->nr)
 		return -EINVAL;
@@ -3068,6 +3067,22 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	if (state->uart_port)
 		return -EINVAL;
 
+	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
+				drv->tty_driver->name_base + uport->line);
+	if (!uport->name)
+		return -ENOMEM;
+
+	/*
+	 * uart_configure_port() may set uport->attr_group and register the
+	 * console. Allocate room for both groups and a NULL terminator first.
+	 */
+	uport->tty_groups = kzalloc_objs(*uport->tty_groups, 3);
+	if (!uport->tty_groups) {
+		kfree(uport->name);
+		return -ENOMEM;
+	}
+	uport->tty_groups[0] = &tty_dev_attr_group;
+
 	/* Link the port to the driver state table and vice versa */
 	atomic_set(&state->refcount, 1);
 	init_waitqueue_head(&state->remove_wait);
@@ -3084,10 +3099,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 	state->pm_state = UART_PM_STATE_UNDEFINED;
 	uart_port_set_cons(uport, drv->cons);
 	uport->minor = drv->tty_driver->minor_start + uport->line;
-	uport->name = kasprintf(GFP_KERNEL, "%s%u", drv->dev_name,
-				drv->tty_driver->name_base + uport->line);
-	if (!uport->name)
-		return -ENOMEM;
 
 	if (uport->cons && uport->dev)
 		of_console_check(uport->dev->of_node, uport->cons->name, uport->line);
@@ -3102,15 +3113,6 @@ static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *u
 
 	port->console = uart_console(uport);
 
-	num_groups = 2;
-	if (uport->attr_group)
-		num_groups++;
-
-	uport->tty_groups = kzalloc_objs(*uport->tty_groups, num_groups);
-	if (!uport->tty_groups)
-		return -ENOMEM;
-
-	uport->tty_groups[0] = &tty_dev_attr_group;
 	if (uport->attr_group)
 		uport->tty_groups[1] = uport->attr_group;
 
-- 
2.53.0

