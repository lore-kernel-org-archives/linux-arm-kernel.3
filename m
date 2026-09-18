Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D672BC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ/vqBSgFHqCJoAqatA3IE2jvlq836FlV9wvuCTBolI=; b=iSJ5tCNobyo4pRrtTC218vw2Ba
	lch4U40babUIfbtR5pYnYtfl7cP2Sm8XMqYfx5+Bh3q23tv0aWX/wozQ8CWSpXzEtgF6q1wURkh3W
	ROJVQ5/b5MkB5FdVUCeNcn62c35vSg/HwGXw4Bxbc1ang4IGdL+nYVbA5t/E2uQWeDSPbRPdwDgr/
	tLwHoXKBXMkvt8oG5EjxLKte4WRKe6+dyeCuFUEwZ5Zj6zjOugSw7ErSmJwx/GV/tnl6pQXHZjzkv
	Z9gKZeIBbe2WlQnIEWXRK1llMZMobc2hLhowjA1scxYQDaDrYgIZWQnlthiE84zdXnmIXl7jbmO5Z
	YtTBVcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UdD-0000000Dtqb-0qWD;
	Fri, 18 Sep 2026 09:11:43 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UdA-0000000DtoM-2oww
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:11:41 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso143705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722697; x=1790327497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZ/vqBSgFHqCJoAqatA3IE2jvlq836FlV9wvuCTBolI=;
        b=eteVM4DkX2YdJStF8RN9lDBRWoKHT22ScfaP9vhGkY0UguBsFmgxKL0LFMpwUp6Bj1
         ps3xCDy0HxFpHis08xgsyjutMryP2SuamgnHdIbVnPF+86tq8lYDK12wagzhY9GLAcdh
         u3PuRN6MCEtGWIVic1R4ilpQMvjqlFz9Iyk+Kw9W9zb6tAXnospEX6dHh2kj3u6qqxba
         OFIBJKmZB33aU0jHis0i7/bzdfcmAjJY6gR5CyDXTN42Y/hrpzBZyU3YgoJ4Twtphzms
         vmY+gkraw63QHwzpROZmCIyzK1lxnbqBtDL1KJQoxJRfKkgQ7n1+XgboBCy8n7mkviPp
         cjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722697; x=1790327497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZ/vqBSgFHqCJoAqatA3IE2jvlq836FlV9wvuCTBolI=;
        b=gqDT3S7yeuVThcAbpfA05iDe3MXmpsBnPN/llGa/9CHYYyuE6t3EIF91twzDmOq4iG
         WZKldclImXXJZCkEMbZP2eEunZzM5ZUXGCUZl/Y1nXyvKTmuSThuXsbnhrKUl4ERE4/3
         OGVSMdDfPfmgpc4gPY7INFAU0k2y3jjt3btEM7e0Ydrv5Urodd8ELfRldN3l0CMRnv1V
         aDaFP/6UmXLHOY6MefCccNRTcHFs+IBhoZZB3fzRvEBQaDa3bFkC9tfYmlFHycdwG7L1
         LE+Tygxs3nTT9F1sHcR6k/lIgz0AvRl10JFxhj1ht1pNHTbCNrB8VJoc39oF9I9HW6ZS
         q9Pg==
X-Forwarded-Encrypted: i=1; AKwUvByBBJHScTNLIhsndwN4/ogK63Gm8O8RGfZLrqqf7QHEy372lj/HLH0X9p8XWFxM8lyPLJXdeOjQnm8XQrCtK85n@lists.infradead.org
X-Gm-Message-State: AFuF++ndFZWVkS1fCxjE7MbU55W87kcW5mzdp73W7xstqanrnotM0zbb
	IATPMhZxzlDngzIDbESl6LupiFqhjJwCykquT8DBO/L177kaqZFH/SNz
X-Gm-Gg: AYBFou0tS4nYXmE5CIBacvtIUXD17wNj9h1wx9pCwy2XSP0zRChCPEjAb+Dma4ge+mw
	Bm4C/u+3rYNkfta1CJ3ZibZSfRYR7Y4pzYlricE6YbamXIHUM1rlFiQ0a28JoQwSmhpLX51DVjC
	nFl9L4UE6LXpP1cYAVaETcY4l8G2s2z/Q6JU92+ekzVfxa8bk4qQ0VK6jZJ9t4aDAZ2QOd24oEE
	dS5AU/GTcROMGhd66pkA+VGGdOr/jEkUNIjeHNtJudMr824eDZeY4elQYPOOgz2tMD8sDzD0GxO
	328VUwJSeQsrZtTrS+9JgqmpsNJA+pohvxHZI5QaB3lO6zoOIpd+D9ScJWw1/JRMtKYMcy5WP7R
	xZr2y7qC592yM9G3lJCH1RFGjdys7VRDdxNPAH/o4u6MBXQut9oAsm8PZ3a/CFjwSoXGbmKwd91
	02jgLzvhDnz+z3EuVLTYlRN5evn61ag5DwjdDs3/rG7/Pf8ZDNbcK/OMjeMRXA5AtTbke4OG76X
	x9zlfuaa1qwMOCpSI315iawSPsGVsSfFcvRkkmCgGV3AV4y2rxIEPmRGd6qDlFnsMciI0mPHvXd
	Ctrb
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr18281725e9.2.1789722696430;
        Fri, 18 Sep 2026 02:11:36 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B829B006E521A2A508563A3.dsl.pool.telekom.hu. [2001:4c4e:1b82:9b00:6e52:1a2a:5085:63a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cfd1dasm37167425e9.9.2026.09.18.02.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:11:35 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
Date: Fri, 18 Sep 2026 11:10:32 +0200
Message-ID: <20260918091032.15593-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021140_730908_3166BABC 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Sebastian,

With this patch applied, the series fails to build when dwc3 is
host-only and USB_GADGET is either disabled, or a module while the
glue is built in. I built it on top of v7.3-rc1 for arm64 (allnoconfig
plus a fragment, gcc 13.3) with USB=y, USB_DWC3=y, USB_DWC3_HOST=y,
USB_DWC3_ROCKCHIP=y and USB_GADGET unset:

  aarch64-linux-gnu-ld: drivers/usb/dwc3/dwc3-rockchip.o: in function `dwc3_rockchip_set_role':
  dwc3-rockchip.c:(.text+0x270): undefined reference to `usb_udc_vbus_handler'

With USB_DWC3=m and USB_DWC3_ROCKCHIP=m, modpost reports
usb_udc_vbus_handler as undefined. With USB_GADGET=m and the glue
built in, the link error is the same. With patches 1-4 only, all
three configs build.

dwc3_rockchip_vbus_handler() checks dwc->gadget only at runtime, so
the call to usb_udc_vbus_handler() is always compiled in. That
function is only built with USB_GADGET (drivers/usb/gadget/udc/core.c)
and has no stub in include/linux/usb/gadget.h, and USB_DWC3_ROCKCHIP
does not depend on the gadget side.

The same test run also shows that the two EXPORT_TRACEPOINT_SYMBOL_GPL
lines in 4/5 fix the modpost error I reported on v14. With them
dropped, dwc3=y/glue=m (the v14 case) and dwc3=m/glue=m, both with
tracing, fail with the same four undefined tracepoint symbols.

This was a build test only; I did not run anything on a board. An LLM
assistant wrote the build script and helped draft this mail.

Igor

