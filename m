Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C82C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 22:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pgJcNNaIcB7VF2rGgBtMbF7MjrWDu7+HbpybgI/inbs=; b=FF5Fx5vl3VsCkdMqagNAT41Buz
	GkLghf1/EEGsAt/URg7gmKU93EtK6xpI0d1P8wb2iw6pZmEWtEJXfOG0OQYUfcOMzsm2BYRKh/LuF
	JWKbIHoNW0ZVX5fGRtHyf+qjGqdV9IWW6BbKKoqRh8XZppJt0giw+V2tbEAWoMNaobTU9awAppXvS
	qarefrp3YYZvs/oHOBaQOzKNa/nzHbHckXEz44J7gvq55ZVVzteqmSZrL9mVcuiCRXK9y2QZf9IQK
	dh7jAT3o3PtwMUXvImNaQKUpDZsrCNRAyt2macv91NWyJi5oZssdQWOnSP2Ro5QJE6NTUaabA1Pzy
	6wjn3R8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAvl-00000008orU-0zH6;
	Wed, 16 Jul 2025 22:48:53 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAtJ-00000008oe8-40a8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 22:46:23 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2ea34731c5dso318908fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705980; x=1753310780; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgJcNNaIcB7VF2rGgBtMbF7MjrWDu7+HbpybgI/inbs=;
        b=kQGLUQAnc2csqdW46APz/CAUgFDPr6u5w3OzOEfAMXGjYF6aMVr1Jy7lgfzQMMMTjQ
         4IRbLtflqi3hoItw8hklZ9uvsjAgBIls4tgrvpMpGYD0jEHXG+upVVOJpJhtiYb5Ml3G
         D/yF3ReIzt6wX2t5MrgJw0bODC+UtAlkSnlxbMV1TWdWcpN1MWNJyNHm3423PIKVjfQl
         G17wz8p4ryjr3cACLWoMYB0sKe9gpyNWzc28bLJNN8xLETdGgCX8qXAm6QD5uZxEWYLI
         0C4jKSp30V1NefkG3CqtseiezFkYysbKsGiRdld8i6gG8p2RNf3CkPbwH6N3didk2Icf
         DzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705980; x=1753310780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgJcNNaIcB7VF2rGgBtMbF7MjrWDu7+HbpybgI/inbs=;
        b=FUS9ZYA9/Vr2vfel7t7ZVFk056wU3Ukgxt8TFAV6EzWXOMHCvrAL2yTsppDqwKH7ij
         Nt4X55lGWnHpyKdbiOPHOL//3aqQ56jj1agc8l0ZfX/MzTPKDOJnJzwgmtqJiKJmOYLV
         OKyelR5o1GD40rReTgItvFNkKF5E5mM7anTqH8sEuaOSqoTzeuwrI4Gq8sVgq1Dqm378
         chfB0HMFWUhq3hZb2cJyjIQvvDBMz1zm1siUsJ8cPoJZVOPnJCs7Ns1PefD02x0N4Kpz
         H0Yy51Yd9OPybisWcFohbmyTWKhFxB9NXxwPRHrwwYZmBkiCXwCxko9Hdd5OzLj4YYcT
         rYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI3HfynUMnmXLNsRidAfNx/IXVOMHQ8++uCd3zWTgfLqV8T6doJcCvoRk64fsu7CXWIlqi5P999XGOacU/Yqd1@lists.infradead.org
X-Gm-Message-State: AOJu0YzSE4/b9KZ91CUCOI3phS1fKFdlXdsoc9EOJLWr0wIzFPjL8b2a
	p97Ag58SOp/nNE84xaqH0/o5VDw41gQh4j2EV2Cx4gVsY/CR7PGsEPIuL2HsppeVGws=
X-Gm-Gg: ASbGncsE0k70BM3J+0FHx7yjWL+9j1B1wid3Ox9DWiHjn6/XFKlVwc+5SGPVy1/la0t
	bt6rLnhn9c0w/hB25xvShUd5Z8LVou7NX/lM6zfeWRdZybvF0htvEoT7U19F661ZGP11xcX7qpT
	rBQIGlx3L03XipZNjM55SODHLEHZoi01tk/rAufR6N2ojoB8zeigR9k6rigeWjx8Nim3htzErTa
	FplGl8YJaPt17xiqVvICTMcv2NLtAsGWX7YYFFnzxJXBxdW5t1rwf3TrBXZPPY3DZNHOyGH/rnC
	L4cAlgvzBbtd3wEGw1imn4ypWi7gISqhbwt5bXCBcnDbrWwNvQgaAjm67ebBPXGSbGLSrhBNFp0
	VgdZImScZU7k4Z4xEBAvgDIhw9K/+QQ==
X-Google-Smtp-Source: AGHT+IHhOFmUmhBidSkZlxAn7V6wq2jgbTir2wDMQeNvWS4TRSC8XLkdd89dV6UDIvXMlv0ZdC5Okw==
X-Received: by 2002:a05:6870:5b9e:b0:2e9:9e9:d94b with SMTP id 586e51a60fabf-2ffb257d356mr3201213fac.39.1752705980494;
        Wed, 16 Jul 2025 15:46:20 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff116dd664sm3898775fac.42.2025.07.16.15.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:19 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:17 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 0/3] usb: chipidea: imx: Fix style issues
Message-ID: <a5f4c53e-98a2-4eb0-9f30-55313be27f86@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_154622_000785_58B7300B 
X-CRM114-Status: GOOD (  10.01  )
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

Xu Yang pointed these style issues.  Sorry for the delay on this.  I was
out of office last week.

Dan Carpenter (3):
  usb: chipidea: imx: Add a missing blank line
  arm64: dts: s32g3: Fix whitespace issue in device tree
  arm64: dts: s32g2: Re-order usbmisc device tree section

 arch/arm64/boot/dts/freescale/s32g2.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 drivers/usb/chipidea/usbmisc_imx.c       |  1 +
 3 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.47.2


