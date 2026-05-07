Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6FCCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdy5PtRz/HkDIo5L6Ua+6U739iTp3/ZnRsbhHuHjN8M=; b=XNqK0yyz4JJM5OXX8BG18VamY+
	kTD3pHtZLmyETxp7OhjfYl6yxi3HpaoIVjx4oMlrTD/mP0C8r9QapTWelxbISjkYuByrzD47hNNOM
	t6tVx1qCxLiRY7DmT+pOHJNUsUSsmsEyqv8ji688xgwAcYpjtWD4oUgzar/1GQmGv4hzvSSjrkCOM
	I7XTmgwPBs0BXt0RxqM1Ee2D+H/6mucHzacBXDzsEh3pRi2fN6uthZ+fzdwvCAEeIAGypyhCyl8rZ
	9kDCMra/EvNR9xdYdieBQK8H/6BuKTeLnCB0vGgXTo2bID2Vxww5V8pGDlolxJDzrhEZsrz4vYE2K
	hDxKiPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Gn-00000004I6V-3z4d;
	Thu, 07 May 2026 16:08:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Gm-00000004I6I-2i2H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E33F6015B;
	Thu,  7 May 2026 16:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032ABC2BCB2;
	Thu,  7 May 2026 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170091;
	bh=rdy5PtRz/HkDIo5L6Ua+6U739iTp3/ZnRsbhHuHjN8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZXrsRXuKTrmWAAJUa/ZIgyYSyMYUwzsrAWEGTT9WgtinnjihNNt5J1INMOcC5Tlem
	 8gOuJNJ7PQHkv0Srns0u6bacUCy6qOnXpPznj6aJvQ2HiBEM7xB82cIFNkKOlVKLG0
	 QXSaW964r2JHVTGrZROhhEviR+vhEMrhsQbC2CxSj43S8k9zj6APVJK2K2qAoG3nsI
	 kROWk7pxQXJ/t8LyEWDRCsK5mKEmVRfytDKhjmLKOH1PBe9LkiM1Wo8dsiRhKEmxHS
	 Qx3cK4tJQHi8yFgf/j2nr7C9nJoQVpdoA4BpMuSpkYH77ZeG+Q44AijNGPS1kacAt1
	 rR2rJz7j26lWw==
Date: Thu, 7 May 2026 09:08:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 <UNGLinuxDriver@microchip.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
 <bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH net v2 1/4] net: sparx5: defer VCAP debugfs creation
 until after netdev registration
Message-ID: <20260507090810.53e66ef6@kernel.org>
In-Reply-To: <20260506-misc-fixes-sparx5-lan969x-v2-1-fb236aa96908@microchip.com>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
	<20260506-misc-fixes-sparx5-lan969x-v2-1-fb236aa96908@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 6 May 2026 09:25:36 +0200 Daniel Machon wrote:
> Move the debugfs setup into a new sparx5_debugfs() helper in
> sparx5_debugfs.c, invoked after sparx5_register_notifier_blocks()
> succeeds so the netdev names are finalized. sparx5_vcap_init() now
> only deals with VCAP state. The sparx5/ debugfs root is created in
> the new helper as well.

netdev names are never final :( User can change them at any time.
The best practice is to name the debugfs file by some stable hw-related
property, bus, port number etc.

