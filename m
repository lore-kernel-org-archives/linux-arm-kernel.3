Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0204CC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/ysL39BXCiT+DYriWX3dNK7myzJEyB3iQxRDritJU8=; b=SsMABVCfvTWJzyIrTil+ndinON
	mSeJXd5QDWy9v56/aLgU4nuB68n3ZcYsO3+5o0FredvrQL3XLCvCIwUgiEUKLZzaIkKesoeryOvAV
	Qy8hmQUlBkueRwQxqx0OkZlhLInmBocExQfAqIDITJvfDbSbkAMIvY5nfn3PfjTjJynwChE0+EktO
	4zc2MJFSVXfryxMNI7WNc8Ug+6DwcKGnTy2qaJJg7Ofr1Z+OhjqKsismiYszmv1a9H7fGUmomKYO0
	+0R4RvCy6pZgFEN7XNynkQX3TOetNLQtn8VRojzz/Ws2qi2YzdyAPBpxPSCq8XV1FpuBJ6uPHLQYi
	+MhKXEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0L-00000000wWb-0dku;
	Tue, 25 Aug 2026 14:19:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys0H-00000000wVd-0222;
	Tue, 25 Aug 2026 14:19:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 27BD06020E;
	Tue, 25 Aug 2026 14:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 49A901F00A3A;
	Tue, 25 Aug 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667591;
	bh=9/ysL39BXCiT+DYriWX3dNK7myzJEyB3iQxRDritJU8=;
	h=From:To:Cc:Subject:Date;
	b=ab0tLKx05tPEH7QKGj5TX/qnI79VQ2pg+Dqk84HLPUwnfI4a+w9tSmt8OUGqaswps
	 U8Kzb0rYCXLSlhNvvVFiCrxlBKT4pmp4fD3JmqoGqU4zXGeAcYq30KTBXN5Em+P5Un
	 cV8P3vLtY8iNPMQpBPlr/F6N7WWLsvTf9qYy4MPI/nefryQTL4UwD1wCzVcNJfY9PQ
	 sn/t+2JAezxw0348wlJ3cUaWvip8amAcx2jOXyNO1TifsbSp8FXePuqIKx26/NiR/V
	 YrMI/bnRbXb/Nt1r1EgaN236mC+2HFbDNF7c5jAYUUTJxwg4XoBHi8tQsWF13zzd7G
	 8CbdM+tcMgChw==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/3] mailbox: rockchip: Some cleanups
Date: Tue, 25 Aug 2026 16:19:23 +0200
Message-ID: <cover.1787667315.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=807; i=ukleinek@kernel.org; h=from:subject:message-id; bh=mHK4g9X5bTqZYLLpsHXgGH8SY1HXHnxduprHV8sh+CU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqjaRrSUweSKGFVZomJpbH8b+OEAkJjfJMCHCUu n1DF+MdSRuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCao2kawAKCRCPgPtYfRL+ ThYaCACC8AqL+2klJufSwVxR4oO0r+gDwp6jTOuGFWWo289JC/8XWrSMMCkDVTl8FwzbjEyWdP+ 1JhCKQ2+1Se5m6wuO6PB3oD4vz852qMg5H4p3Ww5uhmnd/VPKnZNQ5z1qJIfj7JU/acIhSxnkuJ yIj6aIINpCfCkOwICfP7/0heKPG6qja5T8FYPOwSfSrFgxfPqvY8DebTYOb9GGTT/bkM4khNzkN Tvf031UVsqQo/duxZZ7q6DED+/Oo7iKg/SPHlTCUqRRMnFzWdvha1WtbKmmbb6TXLn9HtL8B+Q+ JQWE8pP21Hzu+66DrDG9KEFnWU27vk6jOIXadOC0MePrqMa0
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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

Hello,

while trying to understand how mailbox drivers work, I used the rockchip
driver as a reference for a working driver. I didn't succeed yet (so
it's unclear to me how the .send_data() callback can assume that data
points to a struct rockchip_mbox_msg).

This patch set is the result of picking up the patch opportunities I
noticed while looking through the driver.

Best regards
Uwe

Uwe Kleine-König (3):
  mailbox: rockchip: Add a prefix for register defines
  mailbox: rockchip: Simplify device variant handling
  mailbox: rockchip: Convert to use dev_err_probe()

 drivers/mailbox/rockchip-mailbox.c | 60 ++++++++++++++----------------
 1 file changed, 27 insertions(+), 33 deletions(-)


base-commit: a8406e6c0b793ce0788019683837c40855b55995
-- 
2.55.0.11.g153666a7d9bb


