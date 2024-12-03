Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF82E69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eUOXxza2xZDbeONLJ88WTGExZzUw3RWWcYeyA48yLeY=; b=yQefHHZJ3GZqYg
	YrD1Ei+IqIDYaZD4a0D6aOPESX7FWchkXDE5bHLjt93aiM95Ca26GClNRdm1d3nbgwg+U998rZ8Ro
	TeYEFBx0BdqivKAmG6ZvKEUj4mXiaA+AtNZ4xofw+GZPIGweNukKDZooWVuxU+A3/EnDPLzAsgMqe
	uCjn0YH65YD8sAawIBo/MXgt0cjG0dHwEGssfhCSMmiVcq76DFI7FwA5GkRsXsxRb1NHKfx+8nTdw
	vGI0heyHWNB4poFdGo1GogiVn2lymoLqj/sk+cC9op/jl5WjSoub5DI9jeBIzAhsw4vG31hynxArL
	moBJzxbPto6U/iH5Q6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQg8-00000009BLg-3XJE;
	Tue, 03 Dec 2024 11:02:52 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQPq-000000097sb-1Fvt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=eUOXxza2xZDbeONLJ88WTGExZzUw3RWWcYeyA48yLeY=; b=zP
	A4v7ePAjjTQxnrQjzUzObzLd3YWI1sYezNf+8pFa3iW4WzerQgFaS6p9WWRS8WvvDhatu/O0UHXwd
	QpoNH5WEKTxH/0S4XB1J+5CfC0SVoI/hEb9/Dh9BhxY5Lb2DLjIGnTTfTa14TgApRzy2HdgjflJNV
	cVNRe85XeXKITI3CNsb2pcg5KCqVJhLIdF/3EWG+LZG6BY/dvhk5fuPcjTf0Uv55te0anokbByCx3
	OMFEOW6YGgd+6Pe4I3S2DIyNM4+iaLg/9wHsIkX6mj9kRgWb7mW/q/YAhWikrvqnptPUD2Yh36EGh
	WHnqkYmBJxeOHTEfTNw08hhBk7XrRfBQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-0001Oj-46; Tue, 03 Dec 2024 11:45:53 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPg-000L6S-1L;
	Tue, 03 Dec 2024 11:45:52 +0100
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH 0/6] rtc: Fix problems with missing UIE irqs
Date: Tue, 03 Dec 2024 11:45:30 +0100
Message-Id: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErhTmcC/x2LQQqAMAzAviI9W5hVcPgV8SDaaS9TOxVB9neLx
 yTkhcQqnKArXlC+JckWDaqygGkd48IoszGQo6YiV6OeE15iWg8M8nDCQL72rafZBQ/27cp/sK0
 fcv4AkCfcgGMAAAA=
X-Change-ID: 20241203-rtc-uie-irq-fixes-f2838782d0f8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=1634;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=IsM5qwXmVYbtpLyfbaWedFs/VMNxgxhIv9ZcK9/X2/Y=;
 b=4m2rQQdcFWIslwIXR8uaXwn9QhTkD+u/aJnbsc9jpodG1R+miZyhebqDjXFK0hnoSwtvJqSE7
 9r4bEt+i1d/Bjx+kTsuQ7Nc01QvjWyus4rDJ8q5znc+fABJWVbu69NQ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_024602_444050_A640E174 
X-CRM114-Status: UNSURE (   9.42  )
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

This fixes a couple of different problems, that can cause RTC (alarm)
irqs to be missing when generating UIE interrupts.

The first commit fixes a long-standing problem, which has been
documented in a comment since 2010. This fixes a race that could cause
UIE irqs to stop being generated, which was easily reproduced by
timing the use of RTC_UIE_ON ioctl with the seconds tick in the RTC.

The last commit ensures that RTC (alarm) irqs are enabled whenever
RTC_UIE_ON ioctl is used.

The driver specific commits avoids kernel warnings about unbalanced
enable_irq/disable_irq, which gets triggered on first RTC_UIE_ON with
the last commit. Before this series, the same warning should be seen
on initial RTC_AIE_ON with those drivers.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (6):
      rtc: interface: Fix long-standing race when setting alarm
      rtc: isl12022: Fix initial enable_irq/disable_irq balance
      rtc: cpcap: Fix initial enable_irq/disable_irq balance
      rtc: st-lpc: Fix initial enable_irq/disable_irq balance
      rtc: tps6586x: Fix initial enable_irq/disable_irq balance
      rtc: interface: Ensure alarm irq is enabled when UIE is enabled

 drivers/rtc/interface.c    | 27 +++++++++++++++++++++++++++
 drivers/rtc/rtc-cpcap.c    |  1 +
 drivers/rtc/rtc-isl12022.c |  1 +
 drivers/rtc/rtc-st-lpc.c   |  1 +
 drivers/rtc/rtc-tps6586x.c |  1 +
 5 files changed, 31 insertions(+)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241203-rtc-uie-irq-fixes-f2838782d0f8

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


