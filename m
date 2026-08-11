Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C58BC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5VtF2e06tpanp+udcTWrYBDeYnqMz5g5fGAiiALqjG0=; b=O4nQZEh+8r/7fo
	BCkmsBbw5bqPTsHqDiNsSF3yCK5R0vX80wH0/z8+QhhD9fmipMQ4oQf1l68VGXddji2Y6V2cwdt71
	V8Utgd4ORkf2aj1pisDcPdVZg9pxKlrkjtgpG+oPcM5Zy9M3V6+vpXw5UwC1WSE7j1ZLpXLL6t0hB
	0yzGA0fGCn776kWuP3V2NR7gMayQ6zbl09QZ39scdqKEkosO9cVmHWHxjHsU0oTLhJujYxds5arYu
	YYPU1/ELJnwaQ4dRlGWfrvb1mH3pUzggbSJzMk8j1J2ZKGAVWIx9U4TPK5xpKt5GFtfqLpcC9ZwyW
	ULyeMYsx+csjDe6mzSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYw-0000000DMQJ-0AHK;
	Tue, 11 Aug 2026 06:02:10 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYt-0000000DMP7-35D8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:08 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6acbbcd3798so1629211eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428126; x=1787032926; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5VtF2e06tpanp+udcTWrYBDeYnqMz5g5fGAiiALqjG0=;
        b=Xdtmuu2jNODbshtdolaEyj/PNjHkoKuYGcpiLtWkxmnSMWlAR8bEKNJjGAgkxHpZCr
         cPXiaSaaveXCcrNNZV63BenBHlqizQDOfXP7aL0MXxx5oT0pL0XeiDX0+HJhivaJ12l5
         NjtN+iCYiGNK3aD0Zqoz6a68uf333Evpd0bgbYpTPTis/KA6Ctea4PsdZpnb4WhlJWCJ
         aQQKbvtwyRiP4H7V2Qp1r3DdXPYDQFzOb2gUhRE9rVQadHJqP8lrgB94bh65EfuLX/ca
         zBq+eQlbOnzigPj96y6Gp0qzuQZmX51fw52vk6vPg2bfvcrE+CX/TmBTaWpAujqQ9sCA
         5O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428126; x=1787032926;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5VtF2e06tpanp+udcTWrYBDeYnqMz5g5fGAiiALqjG0=;
        b=a4aQBwG0GIICkpkaojAilB3qvRm/J5Gst9rMsXhqTYE8jjOi5DKgtrZrtzzDnZoHsB
         4xi1xrG58rUTwa2Ti0fRxljDCgf0aB6VuKW7g+gWpLyWwq/hApBSelzYX4szTlIqm8QE
         Xd6KYf91lTlrkRk7tRbyfHkHRK3shCT8mY7+JXAUF6oMvwenWqNNVvk/fCOg4k2c+omV
         vcSZ1IQaoGP5lHQbtN5EP/TAsJY6juYd/VyUUZFoAkIAKeFPc0dgbNKkZ89nBGZ65k9l
         yKxvcSiX+OnoHEBzRreRwyvbQfIOmQYOawqcZdq1VNZPf5lWlQyS++c3DodTWS/fF4ws
         RtKQ==
X-Forwarded-Encrypted: i=1; AHgh+RokV7X4MqzWIZSrZMzAT5/r9EhO9V091EQHhKAVAFhL84xX9L/wuazETwHDZbvHhIoeNapEEw8QGVeHE1zlfKPi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy1v8VFYdvyfdzCy42GCsKXesJg9GzSkPTRlRPDgsbZbFz+C32
	yaV7N0RiHNIghyLa8xYAJs9REvpmb4vqtlnlila5xtCAq70UBb4rtcXs+WE/Cw==
X-Gm-Gg: AR+sD12CA2AGQsoDJAWgDiqNBaLxiUQODBRDpJ6tJqAFrBhUK6/KMv9ygUZc5wt++h4
	xs9dH36Vjp6V3HI8yGSv/4W9tRqFPIitHq0NdqdOEMYHT1nkcUSYObCGcHAFadn5J5h3gT2l6mh
	1eC7KtWjTyP9rsPuGW/ISq9wZ2g5yiASJoC9Z8Bv6yJ7BfLETSn9uOFdC3gYVKTwjb8EZrTXC1h
	tGnlxo8QjCYjTQoEb/EQ3wFv4fWWr6ufQAIIwLMFAgDpjEyoF8ohpRo/n8cMbnQ+Yi06iRUk0da
	xhfi73ggvChzozc0ycsqvPvk4yxu6gsZhzatTlFGJqME1tGV6gGMR9xfHjCYmGbBCv4/EPlf8MK
	yd/vObSD9qCI8lC3BDAWYW21MdHLeMGrfOLXH7yN+FVzgu/vovNMI9Zg6foIbuV7FIO48F+mPRE
	4bKoB2PUbVxko74H7fxlaeXSGUj7BX5Pmgl1vqv0QNMoZp6cZSRbFuX8I0AyEc4cuGAHWgIyoEn
	M9V1a6AxQgWut882tE4uVnpZf7uazJfNzA7kdxy5439vCjLZ1uOpuaGnIrCcHNsq/Uy/S2hy/I4
	e4MU5faXImJPYRWaLhpm+k+vqRz/1B8+FXG1oXN5yNMqf9fbKeqLufBBvkzi24JIIrogipD0Wxo
	zJNrwtenGL7m6oP3n
X-Received: by 2002:a05:6820:f026:b0:6aa:c3f3:fbb0 with SMTP id 006d021491bc7-6b0a31e9e09mr310661eaf.32.1786428126556;
        Mon, 10 Aug 2026 23:02:06 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: sunxi: harden protected OOB handling
Date: Tue, 11 Aug 2026 00:01:58 -0600
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQ2FaCVyldJGaq42IiGS2Ce
 PdO2+XP430HKFUmhb45oNKblYtY+EsDwxRlJORsDa1rOxe8Q91kZ5QoGZdaVhpWylhKwhfvpOj
 vOd2uXYghEhiyVPoNZjye/9YtzXb7qnCeH/SS012CAAAA
X-Change-ID: 20260810-sunxi-nand-protected-oob-fixes-15db4368a8ae
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230207_785787_F3C67885 
X-CRM114-Status: UNSURE (   8.87  )
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

The H6/H616 variable protected-OOB implementation has three related
failure cases around its per-step user-data lengths.

First, propagate failures while allocating the per-step length array.
Then reserve an encodable four-byte first section for the bad block
marker and reject layouts which cannot provide it. Finally, replace the
per-write heap allocation used for BBM compensation with the
controller's bounded 32-byte stack buffer.

These fixes keep the calculated, advertised and programmed OOB layouts
consistent and prevent zero-sized sections from reaching the BBM path.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      mtd: rawnand: sunxi: propagate user-data allocation errors
      mtd: rawnand: sunxi: reserve a full user-data word for BBM
      mtd: rawnand: sunxi: use a stack buffer for BBM randomization

 drivers/mtd/nand/raw/sunxi_nand.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)
---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260810-sunxi-nand-protected-oob-fixes-15db4368a8ae

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


