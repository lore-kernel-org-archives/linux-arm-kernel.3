Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF59CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHhDIiZekTEyAYDgcBX7q1siYTr1dOxWIQ4BtmseKVg=; b=tlmaHd5YkW4/1ko5veMjrNDtMI
	1Lp36uTBpXluMUl0hV6/+G+yJPdSLFYyKd9RDjPeRagFctDM5lSCB/Mx7+CK0kWNfH0TMfj4NWL6M
	3zNZRlW+j7e+l4vMcYhzaKGbYUmQZ3wIP+PglasJD3sHG3SkhFBYng4rnZNOwHgyt72lFQyNCIEG+
	t2Zexr9h2ba8IAw1A1r1j5wjtxj0Ky5yQ3KNgijWoj7bhBIXYK5LXCTi16dyZbgbbbQeCLuxXKRt+
	8PXZYkH8EJrR4vNBRp/Nhqc8FGON7buigikg3En0PQHiag5shfVwvyiZ+nqUN1Y7ackdIYvRThurz
	8c/7rTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt6T-00000006YhT-1HxL;
	Fri, 31 Oct 2025 17:39:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt6Q-00000006Yh5-0Cco
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:39:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD5251A17C2;
	Fri, 31 Oct 2025 17:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B07F260704;
	Fri, 31 Oct 2025 17:39:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00D9311818007;
	Fri, 31 Oct 2025 18:39:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761932389; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PHhDIiZekTEyAYDgcBX7q1siYTr1dOxWIQ4BtmseKVg=;
	b=Q9YaIMCDe4UzfWR/C1Ro7yZCZVAk2YvR22FyVv+gZwDEPXE3zYwhptvcZYxOpqo0nfhXUM
	K+D7t9Lqs7mEabZT+nNz/lrUZFPqT3sy5II5H+qmMC86JnRDcUPq26J7n1Wy1RXx3kSfYS
	LwxNNNzVYs+4UceTBncb61zqjEOdQMrEQKmpHvqrXkyWfV9WAOTJmHk5gmYs0ea3zGBUuM
	zBNdCcH0ZLa1oUvz3MFn33q9wCDfBencaWR31dHZs1DU9DW2Dm8Xzank0SFd1wQaevHMZT
	7wBktRjcfnbeS3rxxwdo5EHpP1PkH+qnsl7I9adJM0s1SEXrPjMRKJmKLEKa1Q==
Date: Fri, 31 Oct 2025 18:39:44 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Marco Crivellari <marco.crivellari@suse.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 7/7] qede: convert to use ndo_hwtstamp
 callbacks
Message-ID: <20251031183944.5e3f922b@kmaincent-XPS-13-7390>
In-Reply-To: <20251031004607.1983544-8-vadim.fedorenko@linux.dev>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031004607.1983544-8-vadim.fedorenko@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103954_220073_529EC251 
X-CRM114-Status: UNSURE (   7.14  )
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

On Fri, 31 Oct 2025 00:46:07 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

> The driver implemented SIOCSHWTSTAMP ioctl cmd only, but it stores
> configuration in private structure, so it can be reported back to users.
> Implement both ndo_hwtstamp_set and ndo_hwtstamp_set callbacks.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

