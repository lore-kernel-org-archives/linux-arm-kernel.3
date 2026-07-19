Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17816C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qmjtXqSGZiTIHq+gVdls9f/1oloIjlpItQ0r6NzmJqw=; b=XpW0mlssSvVMUZ
	djFKSyHvAuM5j08/8UAjokPw0sQc48diWk4Nb0DVmsBuHKZihkMh0Gfvfj/KLOVpUcPDPXZaUJbj3
	8boVipo8GeikvbicG8aOXny9LdD773XfpdzgbTvTROVHgMewGbXFnSK0DznmUxPmjiymE2OKzxwY0
	mIYngHNmHg0ZpbEVc+rZZktsFg3BLVPEuA2OG/FhFMB2R4FSCdo/8vlCCiQaLEIy3TYeDGAagg+gg
	ql5yCzwJ6ePeAF6/wfQ6bjuYeJZ9oEGS8ZoTmoymn3dzZZV2r1t+IeFd70N4afTZOZVEUmqQZvOV3
	ZB2R5tKh9dFe20J7d0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR44-000000050VL-2eEp;
	Sun, 19 Jul 2026 12:56:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR40-000000050Ul-1b2B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 12:56:14 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceaf8a1265so89153595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465771; x=1785070571; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qmjtXqSGZiTIHq+gVdls9f/1oloIjlpItQ0r6NzmJqw=;
        b=sWTbYbJ4HKyQOHdjFSkNi3c1/xEJgnkcZRMHWuG/Moh59LufJ0C43DPAjK0WPFUFgd
         fJwoYYfZ6EWpg7LvphKVGZm4Zvur6YFZX3p0PeF2J2dfXvml6Lz4grKEsNKxcCb909nD
         0uE6Kwraybo1B5riUhZpKZuVlcCE02cUM2AmGFq+z+mC9aHuZL/nPYzHdMM95VpUxk9T
         bu5NyWz1MpcsHBvLB8abESKqJgzch1bW4JDTxHbF0EEH410oTf1rl11vcaioKs419p0Y
         ljeh6krefFN1S2T1hNt6p82BbMXlF6wxOx+Zn/JJcIPYnPCybvx4OvtodxHlLyJC/8xD
         W1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465771; x=1785070571;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qmjtXqSGZiTIHq+gVdls9f/1oloIjlpItQ0r6NzmJqw=;
        b=EBnAmwF5/+wuaWKulu3c1FWP1rFrr8Xr5CHuouvpVFcjo0Gr8D/1suyho8JGRiBxSY
         V/KdEYZAVXiOj8M0Jmac+dNLd33U+GZ02k8mIzOnZD0ZlSfOw6x/8sneR170LXaB5Pur
         51S4iPRHCD0DDWJp/ulsm0vn8yxR2oO9TvnsrY5dCqToma8Yv6SRSr9NZ1Q/yuoKY6Q+
         NXA8SYG0qO0W2wHqg2OAcfhKFHSsm5Y6lOQCS2nbgxfjyIySRM09WTwUwFT9KaYzI/8B
         LdEYTkTxd3BUhFrq+5Rz8NUqxKNPR/LagX5SxI+hd4gEYG2EJEE7ZIPbW/n8GJE4UVmU
         dC5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrJQpJPzGWfJrMXf8xUwNAyjeKVqslGdvtuz7HjVxmWLMCYPhg+BQPs0uNFSSY3fDhHumm7cJ9gWCAYt+v6h8eE@lists.infradead.org
X-Gm-Message-State: AOJu0YzqKA/qlFMi4YETxhfkYux/yi3aikaDHtlT+XLqN93x2MpkksUB
	n4q7RKXbu3Ds2Yt0Qar+kWH3SvlE/06b9AJykfidOckZurSQ3lp6qXMu
X-Gm-Gg: AfdE7clgNA0QHfdpGqLsji5bIqHcwSkghJF/ZHtNU+5oKT2UZweQxzxxQxRzlRAZ3fk
	EQCEu7sWlwwCjIrohd5rz70gsx5qZGBvXco1Wh/vUHHmbUDXcpUClBrVsNS8AAcPnQYyPC3cIDN
	MDcdzh60tzD+AJ/C/UzQOWLSE4JXupFDHv7jm7cwG+hyG+lOgEktaW8/UdZJBVytRqX3m6LVPQS
	AHmJFUBziwZtsN7OAPkgKGlKEAfEvIaMY3l6ybSnUxSGV3aqRnCmNjrN+c5kfmQfE8ekAinWh2W
	EI47vVzGZ/w7PT5WsFWpCmagmrL8leYzMXcE3zLn3IuiqJ5nytlsngUsepf1kY6Q2/pe6K7t47r
	aEIq+GWQkdiDJ8ibQ+1/0muQmwlxrUEw7l/Xt82Ci/Pq2y92hZBjimO47o80kcPpq/8ykcQwHp3
	UO7X4=
X-Received: by 2002:a17:902:da81:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2cf34a48064mr112928635ad.32.1784465771134;
        Sun, 19 Jul 2026 05:56:11 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:10 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Subject: [PATCH 0/3] usb: Use %pe to print error pointers
Date: Sun, 19 Jul 2026 18:25:45 +0530
Message-Id: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHJXGoC/x3MQQqEMBAF0atIrw0YGY14FRGJ8c/YGw3dUQTx7
 hNcvkXVTQphKPXFTYKTlfctw5YFhdVvPxhesqmu6rZytjOHziYmmSAyRZ/CqkjGhWaxzcfNgKO
 cRsGXr3c7jM/zB/dGg0dmAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=1535;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=tbFY6fp4UldEdOFPWG5qshyGEZr0Xdq96AYMiaJs3fE=;
 b=AKmLrPfrqg8Co2eNp1+tUZNc8ZaIcc3Pvtn1ics7ne1WDLCCZGIYXPUI1ATsLWt53k64N9Qzg
 WbSIB/hP1e3CcRt9EbIhunGN2mAKRvXXd16B7GHliBKtoD87uKcy6tp
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_055612_424076_43E06FCF 
X-CRM114-Status: GOOD (  10.99  )
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

This patchset replaces PTR_ERR() in format strings with 
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
Subasri S (3):
      usb: chipidea: Use %pe to print error pointers
      usb: misc: Use %pe to print error pointers
      usb: typec: Use %pe to print error pointers

 drivers/usb/atm/usbatm.c               |  4 ++--
 drivers/usb/chipidea/ci_hdrc_imx.c     | 12 ++++++------
 drivers/usb/chipidea/core.c            |  4 ++--
 drivers/usb/core/hub.c                 |  4 ++--
 drivers/usb/dwc2/pci.c                 |  4 ++--
 drivers/usb/gadget/function/u_serial.c |  4 ++--
 drivers/usb/misc/usb3503.c             |  4 ++--
 drivers/usb/typec/mux/pi3usb30532.c    |  8 ++++----
 drivers/usb/typec/tcpm/tcpm.c          |  2 +-
 drivers/usb/typec/wusb3801.c           |  4 ++--
 10 files changed, 25 insertions(+), 25 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260718-usb-ptr_err_patchset-7c5d1547bee7

Best regards,
-- 
Subasri S <subasris1210@gmail.com>


