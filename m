Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC9DCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=; b=29Olai3JFnxCQoU632iKXmVCuX
	z5tRG+Dab113rrle5Fnw+w8ObrApWW7FKhaXt5oaZjT0oKTAhTUgZRBRlOa37ZWdu2JLR/+9rFJuw
	TaaKKqp7udskdprDJ6TQTPFa+Qwgp6V8D2uFkoWqnUDZ1p4faoPI7DlD377G7Web+v/xXG44NesF0
	lDHmJx1jV8ydRM4ISxgJkPi9cV50WtGI2Q+fITvcWvWJWRIcFcwpZByV0KSpW5nnuREKvMgIowenD
	74XBMk8Lyl3c4c+vMr5DFhx768fq4ISvBcCuGclgxD5o9KP4NL9vshJRyyVpnxHEZkbu0MgT38Vzm
	OqNaiXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt6g-0000000EjJP-0cny;
	Mon, 18 May 2026 08:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt6f-0000000EjJ8-1fR8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 08:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=; b=mdiStVJxJI25MNFoMlE9WPUsdA
	vUUO1Kf0ohztVR8IwjMS0fsAj36g61TUZJCBYrCAhO7RI6z2nlt+yRshjcOGkfAkWz1lkVdYOqvxQ
	UVGPEqr6w06tOta0UKipiTTV1QcwHnS9l3Z30c0MMgfdZljUEBvJgS0tfUdtO5VPwmcLVKjaLKaH2
	9Eq7bRDc6kt9lxSqgPIt3QBI2hWWcXa4G2OQnE1/UkzcF7ekqbf40/qfVwIn7q1wEHIlGL5uDfGb1
	HeTWzEEPXpGDW3oY0ys32IIpzA5/SHRL7RYQboBUQSEFohPQ4uqiJ7T7g+DLqi0rVRtNG1JBoLSZa
	O1nG7y3g==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOt6c-0000000AJVq-07E0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:13:44 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c8025500cc7so1484704a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 01:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779092020; x=1779696820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=;
        b=PTwlluQO5vvmGee++7NOXnrFwUTvd8Wm43/LBJEewHkqitCrHhfOKrWXCVL7qJcpKb
         EggmJ4cQA5m1+IA9pL03ur8us7ht/vEJYdDosYQsExc0Kz2DXH8cUaCNP0gQrLeD8UDM
         kgEOqrzjKx6eICPpR5m/V46sWs/f0s79PjzVtq+eBZJ2ltQBxTvEUEHRVW/bMCavMoMU
         u959ACyqMmsB5Lb+o8V+Mr7shNi1Sva7dyr+hfOGnOqEbyUwLXyn5/ZErzwu6szQ5uM/
         aLfFMstc5cifiszvQCQJqn2RI5FgNrqkrpR6eLl+Arn21h4sVpLYq6qYNRpbvO0DEcZn
         CyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092020; x=1779696820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtmjcFudJHdbwgaOw1dq0xgX0ESp0DVFqApr/5XXiuc=;
        b=R6QbUy+kCbS4ee3M6v8lVQW9FZ36tBrE38IupmupIDDOdhiFvckZxoQy/PfWjJ1v0L
         VA9pW4pWHHTwqFeF2FJO1AV0KLXyGz3Fb1lUmyRiWfWnMF6NNWR9MOLHsVuGj7523hCZ
         iQvjaGQA6A86sbRCZUJMWSTiPynBehuWxXppByQo2FCSZQ29UH7QwILx95AWtza0tdtR
         89QVFsFEPAMb7V1s3/nId+hoZ/GeTXfzJeJHRK6czE++XMGsYoiffR/mwiNNi+hqJC7m
         uV1WLvvL4EZ37f+2wcn1uhdZnF9ACZ6eNyuTPgHmguBVAh0js+pNKjlXgtdMr4fiUlL3
         rKIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7L0pAfXKpkSloDG1IoGmIgWa1Q0ggnZrNWvEVPktDAII3r1N8pZWB/BFZD4E6aNnKKbJ5ueJHM2rRAVYC259v@lists.infradead.org
X-Gm-Message-State: AOJu0YziLZnOx1hHkCMGyWLf6q6KFdMRMwvHPC/Vczxvd5HE/nWtJojx
	0x0Az/5b7DKMLtssfQzgmc0FXItkSQUJjv7XoCpCEcpL7NnJXXU5cx5W
X-Gm-Gg: Acq92OFDZxMLyzrEYD81xF83Zhprkati4NOUJbOUFwuri4IBAckObtedIxqgTTVDinL
	n+pzoG93tZAo2gV/+89wRfaXpAdF8mKTzE449u7JiR9OQJPyB614VgSBq321zUS28dnUKccE4Oe
	NAggPpz/1eZenWDlx5PAPcJqO8KjcSEE1NOXa38+ucEIjEA5B8EKu0BakDU+GLn/YaFJvme1enx
	04lfI1shGMRxFEnFEjgFrLr6Jc0IPD5SDdRSlhwuOOnisxGKWavSFvqFAD1qzxT6xONwQmsaVFz
	sx+EGzssikJVO6HJrvSTAa3Ilbo7uMETvrbaDIdNVSX6PDIz4WnokooWPEFJlg2wf/wJm0SYXie
	msCX/nrzwPQj6PP/tZyI5xmG9BgsFX2acQJZs5SSM2xKL0nX1Qzmew/5NiftTlX+tMmiAkR2q7U
	12zVrAjKccHAVSf5+2YJQzU/k7ATfoQZeWexcE4x2tgFwMoRJ+aPsNqDiMqg3TNSeIWniiY1Vki
	e+vmTizZcqQ/mK2LwlPz3vC
X-Received: by 2002:a05:6a20:7294:b0:398:9d5f:e093 with SMTP id adf61e73a8af0-3b22e75954bmr15671941637.19.1779092019769;
        Mon, 18 May 2026 01:13:39 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb100706sm12749462a12.17.2026.05.18.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:13:39 -0700 (PDT)
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
Subject: [PATCH 0/2] Add Meta Rainiera6 BMC support
Date: Mon, 18 May 2026 16:13:23 +0800
Message-Id: <cover.1779088499.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_091342_661495_130836CE 
X-CRM114-Status: UNSURE (   8.94  )
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

Add initial device tree support for the Meta Rainiera6 platform.

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


