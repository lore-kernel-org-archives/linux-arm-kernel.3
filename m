Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77883CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=; b=T+mKy/G/jsDg2W
	tu4lsLwiSCFWMnLXKoM+UyHD1nRS0gzGj3Nr6zqXdx8yLVtokvLC3FjhAwcPMJOxUsu2OZnWbHyo5
	RV1syYmQavvBSMJKo4p6IXM23T1oijn0NwM+D2ncklBt5tU0JchklOV889ip4vg/PUkW3dcB3e3V8
	7D6HDWGUWnM0Pp9Af1HVqChp9cTKLcpQ6Bk4YnPyOaXjGkMMW3C1AVni4/rqBIP5hFEUYKkvehH8b
	1+u+nfGO2yUxO5tJAZO0VjfkXruGeakj6kXZSGs17jZvy/m6Nw0f1ZH8GNd4O6a0GClhZr2E61GSX
	RgoYcT+PSIkWdA+3TURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSgC-0000000BqUN-05Gj;
	Tue, 13 Oct 2026 02:55:52 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSg9-0000000BqU0-2YIk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:55:50 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so1054035eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791860147; x=1792464947; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=;
        b=GGl2WemVXBLXZ1LGNDrZ+Ezdc3fIEIJ1paUQ98qpK2WiHzpaEO1B2R9j6iewGB+ms1
         dlROX/jd0ii6ZxgNrJsT7CrQdvw5mp9x+ppoxZaIQu4U1u2T/m3rV0+jFQ6OrQ+tgfYf
         FF4zSsMONoUSYyC2E5Y04Q/MkMYicVCwEz4KzXwv4e/8CUETEl0xAwzhqcpWSEFvsq9j
         lnKZEsJs5SynKAprZW1NtQaRmLhdPheffBWKDfgm6H+P8wZlUY6zKo4CRwaU5VMN63xz
         XVc2xXMMddjiKOp7OMDBQShsuHs+61+AKHeSkxbsdyVly5BjiNJ0PzRjHmu18Xw8H5BS
         jf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860147; x=1792464947;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G+I02+8xmB4l0yP/lItNCeO/Dv9gNUrktx08qk23Etg=;
        b=Io1/0Cp/0IDahbxU+awLBW9XorKuqFXoPgz3WyJodsWXCSag29mRKVkLjl+M/Qzjtp
         Qcf5geYwltVkXB/ctSt7OALUH1WjGWgUgmgC6mU+i2C7etLxUogxGwl2S9giKlibXSzW
         Zyt2d9iD28M48ZDYbXrei8k9PTmkdVQphMgdlKtCfd4yjFPo6KX2VZEWnjyw6jGK4Cpf
         FF+X9EoJWZpBNvE1wLJ32FWbrIAb2p7X/G4W4R6B9ZI9nlvcWwgWY7k4vBZJoTqPSO0V
         uZKrVMArEcjAMXq4rTyCCb048k6tBNmNkfMOXAB/BltSgB4TQjQS0bQsz6M7BgfryexY
         7jFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzphRMQcfAFF+1sX4Hnzv9zJtdVNjqyiNXcbX20T6Vl7x4MtEwrkvp+vs1SCeaYoWKRBGrunYftkR4gSjkHWVeN@lists.infradead.org
X-Gm-Message-State: AFq9FYLE40FJKjpirUqTK0X0fSwf7u2DXG+GJ6azm81QYxGjhW030Qgw
	yjWJprTTzy/bZ0nO40p9TSlNZMZhoySEhORM9qpAEeD1PwanepCLc2Pf
X-Gm-Gg: AYBFou0EbESUSQpLgIkFGzlTKQE1WZw1kQE9qGcZScnMV4XVjVbX6NzvA4WU7sQqdjs
	8S0YVOZYqFN/rmVa64zgOzUDbDA7E5Rb/rZH/j4b+hVTCKv9RB5YQVW1WHs8C1G7/MGRc5ddr+4
	5fRnJrfDwtMPhHpvndYhI8wUJZONOn7rDszwKHETsOZtfwfojabIkOWAIYybL2zUUA1iAUT2eFw
	ADZwlmKaC4KZD/nsmHA2xQgtpt+dTvqAwdFOdHe8pNHv6YEpYR9F242nczSVilecXnkEff3UYSR
	SAytQInqLxol0m64HZXyrbu+vxR1dbdf00Sx6U9gylO0BJ0TALPOuCNOILGtYUYrcm/Zm+mV/Lf
	/xpKBAU6Jlt1FRyY2xIVEMzmnq6rTGCxTmuM7KGC/0SWCIyYZgHGoFbIXd2sn/fd8GgWfDCPWKM
	X+4WH9Q/QcUBFVIZgZfYOfTZrkmXIngmvH/cd/N+GWn39xHndQzDAN3d6JPhpwqNSy5rOxczW3u
	9fVu7cy5kCB
X-Received: by 2002:a05:7300:cf8e:b0:35a:7020:c08a with SMTP id 5a478bee46e88-35a7020c1a4mr6837443eec.19.1791860147092;
        Mon, 12 Oct 2026 19:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:8056:897e:dae3:8e2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm50889219eec.9.2026.10.12.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:55:45 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Subject: [PATCH RESEND v2 0/3] usb: Use %pe to print error pointers
Date: Tue, 13 Oct 2026 08:25:36 +0530
Message-Id: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKidzWoC/3XNvQrCMBQF4FeRzEaS2Dapk4NdHXQUKW160wbsD
 0kMSum7G4Kgg47nHu53ZmTBaLBot5qRAa+tHocQ2HqFZFcNLWDdhIwYYRnhVOC7rfHkTAnGlFP
 lZGfBYS7ThqYJrwE4Cq+TAaUfkb2gU3Eujgd0DfdOWzeaZ1zzNLZvOP8Ne4oJFqniikGiQNX7t
 q/0bSPHPoKefRBB6B+EBYRmuQCWC0lh+40sy/ICqbdDxgUBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791860140; l=1843;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=XWT+evDyeLy1CvG7qT+s2Eh+cCd6BaPGI+i6dJwrKE0=;
 b=MhN1j7+LP8ppCCOHXnmgYWPKdz5mt77RZ7osZR4EN6zzSE9SJMTr1kD+E6OTFGbXdSbofOb+q
 WiSxEwFtLiADqfdVqQXgrT9ibTp9FO9LlutWOlhGP1xqlWhXy308EXI
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_195549_669728_B5D94EBC 
X-CRM114-Status: GOOD (  12.26  )
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


