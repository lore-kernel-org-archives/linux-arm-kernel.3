Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDE0C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=; b=hba/BjIWE52Moh
	ou4ZVybVbDkHUm7U/s4iKQlZHSNhA1Yv9d48gT/CYYe24Y5COt0oumYsdGmXiZzy50rJaomw+LjQG
	rAMZtaOfhb9sXjolvRo6zmZE2plmSShlGER2KkVzb1J/fw2TM/hDxCAY1HbjvdQzvhbmt6rEyBhbj
	QqbpUYbp6gEW3WPeNJLL+WTviZKvKVvJOfmaomz8Boep7AwXLi97Za2YjdmcXT42b2dUPDCvpO1ce
	mmCAvKBbIjw7o2dGUKrFD5+rpyPjDFTWwF5Zjw7riYWEpBL545TGeafNUW5Xuxx9Rsg3Y6fQQbyUW
	5MGRJGPzfex852YGwO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8qp-0000000EeFy-12zc;
	Sat, 01 Aug 2026 12:30:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8qm-0000000EeFA-28U4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:30:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cc61541f8cso31073475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 05:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587399; x=1786192199; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=;
        b=T6i4pdRA5pNHswqFLXX89ClNo9ipDNpfiCWWaRcD77WhhWI/o8XnjY7r3h1HifTSKv
         npDIOlE5mgreLNaVuAZn75YvgzeuM2TkzeDq1gbw/d3fVRvCysEPvOcPdq6ckxUMzidL
         HwVT7cXqCViWvJn9sPUUCTSU/Yqz3baYKkigzH4RvzmwpTBoQNVTkwsCpEocESi735/N
         gLnRwcaEESqDyi6UeRFfw2Ou6/C5E0blfw0L2NlM9ovVN9w8nsd+4UOYKDBgvxrAG+Pd
         36FVJw2AITuHeknY6bWptygu0a76sK1BcIi+FWpDHGq+X7wsGmw3/S7up0Ibx0zlYkWR
         fa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587399; x=1786192199;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=;
        b=OuZSRWCEk0apNRMW/D/oDr/Tqsw07BTNuAb3nw/F9I/khzbm5UoE5iEJe/q8e9xfnk
         XEfj5YLext7nQH5UsmvaP0tVRsX67Y0UQA7GYb14jCLn+4hILhOFRSBxWNqDnseG1mJ+
         9qF9Yn6wxlepZP6WFjvuvQvnrQs1/yGRsfeYf5qsYu00PyoEbo0KQNDCL1RfI3QTHTeF
         KDAS4WIVWHOqmfYqhX5apu0pFFRQxLxXNUOLzxjUPVOPpxRkReBjLFanPIsGMqsu+hPX
         /F2HInHSWX65FnpcFrmnAKCRRO/tAkujOwBCdgmMIa8h4bFcdia2voHev9mvW57/emor
         OxGA==
X-Forwarded-Encrypted: i=1; AHgh+Rratl7uanW9Utr7oUcVzuXbTPxK50VnPGPKnNae3T+H2QrLFbbIV3PdY6n58mjm8DCbKkqWdIIKuysKgjJuVqix@lists.infradead.org
X-Gm-Message-State: AOJu0YymM4mmZL0WlXfjT7231nusq9wszjGcO3YgJvxaLrO9nEPL2Ozy
	+y2YPear/XtPLtUepwJ6w1iaQlo9tklVhFgU9LstJDI52457NsHRaqqZfkqPQE/b
X-Gm-Gg: AR+sD11wripoWhwyc8Yd00wwgRdMthUM6sG9KUF8vXinum+l3kzNdH7prSux5+Np7xz
	TNZcXn8NkF1m9fci2aTj/2K08PQ7ZTbEGQS1VCwEvAJjsZuv6bLmutUTXcK2jxL6+XdikzNMa+s
	2DFQ2AMiqnIU6bwdv8vG6wEltgeJWgd6c6UBe0R7N7FsDar+ZRzWuVO5JBiPnRPJUleHLEkKd/S
	8LEXWLbOF2+LjILBhrnsm1b9ue9oo+pMoTg5Ln7Hk4zm5644McUF3I6/cefUc1P6MMWBwWYamRX
	KF44f1JjEbyhzilKwGNPBDRtxLaV/oDbfv0K9JfmRzAQzkKm8RO6XNNb0YzDJZhWVjes6nAPzWw
	49pOH3wNAS4Tw/l3ytbqrO5FpBP2Qz8oLWZmlTYl/GjTU46pI6lH6ksaHmRbu+YjeVLUttlX4W5
	DzU3WdxfCEgYlHbZbrH5WLJs86aduWPAN6mp8Xl6Hgg818s2nNlsU0cOZ1o6y369A=
X-Received: by 2002:a17:902:d58b:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d047e39483mr47362455ad.14.1785587399079;
        Sat, 01 Aug 2026 05:29:59 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:29:58 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Subject: [PATCH v2 0/3] usb: Use %pe to print error pointers
Date: Sat, 01 Aug 2026 17:59:49 +0530
Message-Id: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3mbWoC/22NywqDMBBFf0Vm3ZQkaGO78j+KiMaJDtQHkzS0i
 P/eVOiuy3PgnruBRyb0cMs2YIzkaZkT6FMGdmznAQX1iUFLfZFGleLpO7EGbpC5WdtgR49BGFv
 0qshNh2ggTVdGR68je68Tj+TDwu/jJaqv/QWv/4NRCSnKwhmnMXfoumqYWnqc7TJBve/7BwBM2
 Hu4AAAA
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=1843;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=XWT+evDyeLy1CvG7qT+s2Eh+cCd6BaPGI+i6dJwrKE0=;
 b=0f+dwnGYHa4UQ8hP1TjasctdxpWvaBpodGko+alNSS3r7FTk7fgSHNv+UkNuF44cit/1Qe5z1
 lfa5cZCNpZJAUDQW94/1Qjnuq2g/IKzzTddsR2NQSADKcvo6jGCchay
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_053000_558170_10A1C6DD 
X-CRM114-Status: GOOD (  12.72  )
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

Replace PTR_ERR() in format strings with 
%pe format specifier across the USB subsystem. %pe prints 
symbolic error names (e.g., -ENOMEM) instead of 
raw numbers (e.g., -12), making error logs more readable. 
These patches fix coccinelle reported warning: "Consider 
using %pe to print PTR_ERR()" in usb subsystem.

The patches are grouped by subsystem:
  1/3 - chipidea
  2/3 - miscellaneous USB drivers
  3/3 - typec

All patches are compile-tested on x86_64. Please let me know if 
any more testing is needed for any patch. 

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
Changes in v2:
- Remove "This patch" phrasing from the commit message body.
- Trim redundant Coccinelle warning outputs in the commit log to keep only one.
- Clean up multi-line dev_err() statements into single lines.
- Link to v1: https://lore.kernel.org/r/20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com

---
Subasri S (3):
      usb: chipidea: Use %pe to print error pointers
      usb: misc: Use %pe to print error pointers
      usb: typec: Use %pe to print error pointers

 drivers/usb/atm/usbatm.c               |  4 ++--
 drivers/usb/chipidea/ci_hdrc_imx.c     | 12 ++++++------
 drivers/usb/chipidea/core.c            |  4 ++--
 drivers/usb/core/hub.c                 |  3 +--
 drivers/usb/dwc2/pci.c                 |  3 +--
 drivers/usb/gadget/function/u_serial.c |  4 ++--
 drivers/usb/misc/usb3503.c             |  3 +--
 drivers/usb/typec/mux/pi3usb30532.c    |  6 ++----
 drivers/usb/typec/tcpm/tcpm.c          |  2 +-
 drivers/usb/typec/wusb3801.c           |  4 ++--
 10 files changed, 20 insertions(+), 25 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260718-usb-ptr_err_patchset-7c5d1547bee7

Best regards,
-- 
Subasri S <subasris1210@gmail.com>


