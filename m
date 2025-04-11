Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8016C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 01:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=owww72mo7rRa4HGyljLXSQgsg6KGAlIxseqdPKYlAm0=; b=ucGDos19pm6lB8
	wpUdinRr9943RQ+3HaguOsDFKSX2n2OD4tAs8Vah92WYPudDprmb1h7GqYALfUH4Yf5UwMvb3Zl9H
	1Y0TTLZqM5h9XvWhSjf8VYSCkGWHVA8Zfr6IFGHLwqoh625JomvJ9pnP1tNAzrPL+ViBQOIooHlie
	f1DfRh2hxvPCjNfajr00r1gE7QPD4g3NOQjIU1N4j8dUpZ3I0Oq7JHD8Ply5Zt+5rK3UwsxfsZdhB
	3EdrUHtjHPPUquBdoIDHpmZXakrXpjLAmajtvfWIeCSkl1kt0mSpy1s5wRpmnHB/oO/5J3oM6RyI6
	oSM6HtwadAqBm6+RiXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32yr-0000000CDd2-3kVJ;
	Fri, 11 Apr 2025 01:14:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32tR-0000000CCQy-01qi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 01:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744333747;
	bh=owww72mo7rRa4HGyljLXSQgsg6KGAlIxseqdPKYlAm0=;
	h=From:Subject:Date:To:Cc;
	b=XqOdX6U3Cq0OakPdb4QSUC556jn3yncHePtbEtu0jYQLrwHC7TKOeZ0RPYiMGHHvW
	 TN0bxeNNvhlBtp8tXolu6w0pxB+HhyYZ45q3WtAOZW5BZTCpFjl3cIl/AImVPxYzBY
	 +tf2NTr8dXALLFL4N+70njc+TxSuzcXFxRqqHgp+q+hm772phcDm4IBaKG/iKOJj6g
	 Jys/+azHbxTEL3e+t8R5XJN3hW1BGC7ea8rXFNmoMAGI/l8iu5GcSCuTHE4FaW9AIK
	 fn07ZDMEA+xhsjsK2Tw8+Pn1c3SciinO7Dkp1vZnUNujcZCmD1vgZUjxMVbdgD/dQJ
	 hJYJLUonN45MA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8D5237D705;
	Fri, 11 Apr 2025 09:09:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/7] soc: aspeed: lpc-snoop: Miscellaneous fixes
Date: Fri, 11 Apr 2025 10:38:30 +0930
Message-Id: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5r+GcC/y2M0QrCMBAEf6Xccw/SxELxV8SHkKx6IEnMWRFK/
 91DfZxZZjdSdIHScdio4yUqtRhM40DpFssVLNmYvPOzO7iJozYg870l1lJr44u8oYw5+2UJOYY
 YyOLW8R2sPZ1/3PFY7f/5l/v+AWm6cWJ9AAAA
X-Change-ID: 20250401-aspeed-lpc-snoop-fixes-e5d2883da3a3
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_180917_270257_BAF0AF5F 
X-CRM114-Status: UNSURE (   5.05  )
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

Henry's bug[1] and fix[2] prompted some further inspection by
Jean.

This series provides fixes for the remaining issues Jean identified, as
well as reworking the channel paths to reduce cleanup required in error
paths. It is based on the tree at[3].

Lightly tested on an AST2600 EVB. Further testing on platforms
designed around the snoop device appreciated.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=219934
[2]: https://lore.kernel.org/all/20250401074647.21300-1-bsdhenrymartin@gmail.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/arj/bmc.git/log/?h=aspeed/drivers

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Andrew Jeffery (7):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
      soc: aspeed: lpc-snoop: Ensure model_data is valid
      soc: aspeed: lpc-snoop: Constrain parameters in channel paths
      soc: aspeed: lpc-snoop: Rename 'channel' to 'index' in channel paths
      soc: aspeed: lpc-snoop: Rearrange channel paths
      soc: aspeed: lpc-snoop: Lift channel config to const structs

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 149 ++++++++++++++++++++--------------
 1 file changed, 88 insertions(+), 61 deletions(-)
---
base-commit: f3089a4fc24777ea2fccdf4ffc84732b1da65bdc
change-id: 20250401-aspeed-lpc-snoop-fixes-e5d2883da3a3

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


