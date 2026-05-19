Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9163CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 02:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=; b=XRZ8ZXyTOKiw4/8QmhQqCiV49C
	InNtpFZyakCs3MGkUZJAnh7AjX02x8R0aopssW5iYZHBlFjSlCjTYOJe0o+maxTfLhrFa3MWhWda4
	WvcDpBlmf2uisOeGz/Njak7XuzuQEz4ruVO6OzYX1XF7C5fuiInKj+EUT20bUZ7smXdqDAu6JowcB
	0sez5Ut+uWKmtmMF9jNJlOE3XMALQ2fFyAwnu1GRfbXXaej1ypOoMajhI8FOmpj1XcvmaSWdoZK6Z
	BQdl0kQigi7kfSpp9ZP06gldz5Zn+KH9dT33Tpb+yvpu2gXbx9uG1AfhuEOr01c4qVPggtzV1oHO+
	Wjm9udZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAM5-0000000HUZE-1sQo;
	Tue, 19 May 2026 02:38:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAM3-0000000HUYn-42C9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 02:38:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-369742178f8so1690573a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 19:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158326; x=1779763126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=cSQ1O6hh32l9txYOvAm5HKT5ZeFqF01SG9UvbaYvsVx2QgTcDN/VjtaDNZ9S/K0uT1
         bF+4DFl2wzOW3GHK9WgWLC4mpZTN1joc5E8Pq4Az4i1sR2LD5HxbyUZp1h6lFVEsUOWG
         0DSp0O7tsfEQIbS0+8UmUAwAtP29g6xTw5qFk10s8hwoMyQLcvZ1ZhrrMvTtEMwOasay
         UcvPMvpUYHP5frzbpkNsOgUb0EafUZBzqQbVgrKaTN7/S5c7wG6PyVFW0kjsheIbQoBs
         SsSzy6XC3lIiLe4pp1Qx/sDeBrTaV0M5rYi44GQi5VGYbWmrkGIkO6gtMzAOnXePb4I9
         yw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158326; x=1779763126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sk6tV1sPr/bj1s6vxEL5RD26ZR5/PjbXYD2u/WPihaU=;
        b=Dm3j8y8DSis4bJn27XVvngfLxCHnvk1HXDVf3+uX8xO/UQ/UG89SMBxoYMBnoTfNNq
         pz7oStbBpRzPHLtKbthCylDRf5wXkQiog8D1KGe8Plfo6I6NRrPvGAjMncLh31cp0QaS
         /bsrafmBU/eY2+Y/SQ78uvOku7nL7Bpa+E68lR6HxGxkJTVJM3K8fiT74HotX11Q5G+7
         9mp+ra+gllWQeGg3kkhgk9zi6G6pMYz9dg1G8IrDh4PTpDJ7/rlcjq9v4KYwrNcjvqNJ
         mSaiM4xzLcLiDFhM1lzI5Q53p02tqcqhw0CAJTQYN9luOBWZkFBzf5Llhbr7Ac9k4zN7
         y/rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fwGMI0AH05/DjElbom4XZi8cXe/QJCWBKsGxYrORal3r3c0BjSfkQBfNvXMckRLxwS8FOgkGIrVue8YHI1Yff@lists.infradead.org
X-Gm-Message-State: AOJu0YxC4xgthI1ufQllcl86Zx9jpMp718tIQZo7lRdQ4yXV7hhGox7n
	L+KgqhBoqkewssWxXLrckL/tJ+EqGnVaAF4IMhp8oJErie8x2yQqwGbB
X-Gm-Gg: Acq92OHpbidWE+DTL1B95oxhAtVBUIXNnVwaxv4wmcPVC10d2Gwx0tRgOjDCt5IBeLe
	q3qZ0UjcxpnTD+klyosmCQ/gMd2FOjdpVEutpOs3Jk7ccUb067AAK9M/Cosp2YzeF8UgwlzpcRW
	OKHML70RJnNfZOgLZfvUBBtHBXJzxLnLkMEsBO6957DhH9iTSxqbWLjGhirS9d0Bk99YoEnuM97
	QmrehT+sVmfwIOS5LjbTuG3C2XEVeL2DUFZYwx7WJimJUPZGXxNnCkmavYBgfG4muX3+mAlatBs
	NLqRke8VxV4GIS34PoCXvFJRL64A0v1DrgDkpckpwui48GWNY7lZDxrFHwe1lgx6+ZAWuyPz1ee
	VE8OEanCONqmfdEJQDJT5aWCu03pP/xHrxh3L0/iXk9GhtX+g7OCJFlozQiElNvR5Ghw3r/HrT+
	97vZkavuB/klo1SKlNNUtvawy8nS+52VqKZ2Z6jP+jlAUCEPLYe7riuCcDp4PFXz4zFT7lWduwh
	H5UTiMKIFTLDQ==
X-Received: by 2002:a17:90a:e710:b0:369:ee20:f5e5 with SMTP id 98e67ed59e1d1-369ee20fe62mr3060296a91.2.1779158326394;
        Mon, 18 May 2026 19:38:46 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm12407713a91.2.2026.05.18.19.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:38:45 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
Date: Tue, 19 May 2026 10:38:36 +0800
Message-Id: <cover.1779157117.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779088499.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_193848_000410_FEBCA871 
X-CRM114-Status: GOOD (  10.70  )
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

Add initial device tree support for the Meta Rainiera6 platform.

Changes in v2:

- reorder adc0/adc1 properties
- add Acked-by from Conor Dooley

This series adds:
- Meta Rainiera6 compatible entry
- Rainiera6 BMC DTS

The DTS has been validated with:
- make dtbs
- make dt_binding_check
- make CHECK_DTBS=y

Neil Cheng (2):
  dt-bindings: arm: aspeed: Add Meta Rainiera6 board
  ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-rainiera6.dts  | 1012 +++++++++++++++++
 3 files changed, 1014 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts

-- 
2.25.1


