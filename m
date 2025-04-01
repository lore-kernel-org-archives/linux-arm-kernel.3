Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3B9C36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lVQoemYUlfCPwZiQBfRAg9BVnj4fMqGZfUkpdiHtqKg=; b=E1cl58HiZHTWFe6oSeSAHTXFrk
	7Ro/E3eon/mUjH8ER9WhSWF+A2E0npPl+4oLZtIbbhiNFbxInJoYmlPfVV9GDuPdkc1WwWO48T/dz
	AAidLrYHyglGPVrYbvo2IshKrDE7GqfyUmzpmz41WSYnzfDABpAbzkXLFNx+SPQXf0i7PkEihU8oI
	BW/H9SR3IbxC+vfhSxITxYIBjAaWLjJ2UTIU1I8DXAIJ3qsilDZSQMS6/9147CCErud8UUoARpLDL
	r9DA6blJX85s8M+CzAz/RJXtzfyEFyaB7HwNIet6t8WbANjFj8IRZK3/zGD/TqeAk2IU3xeFNITBA
	l50uFzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzizf-00000004R2C-3yzz;
	Tue, 01 Apr 2025 21:17:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzipp-00000004P3w-3E5x
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Apr 2025 21:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lVQoemYUlfCPwZiQBfRAg9BVnj4fMqGZfUkpdiHtqKg=; b=JkAlIfGS2pxc80iARZmB+k5JB6
	QZDbCB1i00+IzmgQKTXEUESKL4KWtD3SLotEwXn6d7fIKUVGJl/LZl9igudcN/8HVyVjoywsnbJfN
	8049KbR3UJK1URafVl2vI+CCpZqi5OonntkRGng0otAqAp3dUR3Uamfgl6ebSNkyhpgoXmWn/xWi/
	lYaF8Ab4PAzjKRNgZaBTkgWC253gi8SUAVl6Pix5OxW7KfoR5XdXjRLT5rip2A41f2aAQJxqGv7lf
	wlqB/sguEz+CME6eVNyIffgCEIyQjH3VayI5pdYP8R96zvhyFLNjLiVHhJwabhZkG2RaKoXyV+PHe
	qlSCA8ag==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzipl-00000006sXd-176S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 21:07:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224191d92e4so114249325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 14:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743541660; x=1744146460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVQoemYUlfCPwZiQBfRAg9BVnj4fMqGZfUkpdiHtqKg=;
        b=QFvy9sFY6Q8rJ8tZOuaNifcrtLqeRmAuSjA/rCINziSbWskJggITf+JEV/Rrr55d5v
         Y1VaOCU1t0ZGNQ1qPkgKubQmp0QAZnh6aLq/s1lAGA/gLo2+yqi0FX/8YNav1yMk/kXe
         UD/RvGJgFaJNd7WM9g2ftCts/ekbWUIrQH/C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743541660; x=1744146460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVQoemYUlfCPwZiQBfRAg9BVnj4fMqGZfUkpdiHtqKg=;
        b=raQ/5ICBnFxzjG7IhrVn6nD421KIGAAdChpg+0Wo2H1uSeylUKGfcQ47cyxE5MfRno
         gK5wxP7X/auPCBVIFaEiNrLb7ndAcPHvUiZHqohq+V7uVzlwCLUSjEJd7tWUlrxgMwgu
         Ah96IcavtngRH6abt+jJsXZssU5qjs0XgTlalnuSc1DLmVk10tn7f16Ni5SXVGraBzXP
         8mJ0jd8OtB2hFrzARVP8gGpI9PKBo8PjCil9XZNP3XYEyFTXAK2w4GCVQY00acLcgy+0
         jMe2R4Dpj9zCHh35ZYczVkEHKYi5tns/RP7b+Kp6CIRLjcQyD8pdkZXHjIrHhO84Jzhz
         3Hgg==
X-Gm-Message-State: AOJu0Yw/2isHAz8rM+e8y9BcomMNb19FJcg6hx8gq4BOgHYem7CvIjfR
	Muqjgf0XprJ9tmlfct1Qgik8Cc8K21JisDbiTswm3CXsEPYuXxiZs4zcSINDUCjrs5mJVMqCa61
	L05eNhUVedN4OUNqeUtyNS0xHoMfs7vmanNoAwaEfMt1FiM+Mnznj1PthrRzhtw48WsfW9d8bXe
	jaosdYSe4DMx/zbYGF8r0JrUmiSugiuh8bhTlZ4WOfZSQnV1a9ImU9GZ+R3w==
X-Gm-Gg: ASbGncvFJMWgFCPYYu3/BNiv/VPFrRJpgj7bF/v8ddh80z5/Y7XPMOjVDrbkzjsJZE4
	gRPs6DheRcesWbeapmgsfFW1PPf2XUY61Jz0Bir50hNrkHPtoJTmEPtB5NmbSifRfLBSnT4CZ2z
	5CAPIi9O+CrdcqceA1M61WIxyCNeovB41fSRqp/GAvsACt1MRm/zSt+xuyYeXSMhRVwXOiHHo5a
	Ech8TkEx12HAyauuTWnd0bcvdBjG/IWwQMaYYoYLT+RnRjJD8C0jSX7YYmPs5gRUiuyNfvP5sRr
	lgqzSPA3XXqpqy9isBOUXpT+0pc2sJSEOGtlHq+jYxGFerNKmxxQCyGS6AKuou7M/WlTvJYfTD6
	Hc5BgYoMdVWkF3rUwwPwy3w==
X-Google-Smtp-Source: AGHT+IH0PQ7taRoykgUfWzcSREeHMofrh9rV4j0LFTSx412vSYptiSojp7iGvTEFiYHXeqxqmv5rHw==
X-Received: by 2002:a05:6a21:3a4a:b0:1f5:7710:fd18 with SMTP id adf61e73a8af0-2009f609379mr21130355637.17.1743541660157;
        Tue, 01 Apr 2025 14:07:40 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deef7fsm9414995b3a.9.2025.04.01.14.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:07:39 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: rafal@milecki.pl,
	alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v2 0/2] phy: usb: add support for bcm74110
Date: Tue,  1 Apr 2025 14:07:34 -0700
Message-Id: <20250401210736.2613748-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_220745_674913_1F0E59EB 
X-CRM114-Status: UNSURE (   9.48  )
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

bcm74110 adds a freerun utmi/ref clock that saves furether power during
suspend states. A tune is also necessary to pass USB compliance test.

Justin Chen (2):
  dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
  phy: usb: add support for bcm74110

 .../bindings/phy/brcm,brcmstb-usb-phy.yaml    |  7 ++-
 .../phy/broadcom/phy-brcm-usb-init-synopsys.c | 61 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-usb-init.h      |  1 +
 drivers/phy/broadcom/phy-brcm-usb.c           | 14 +++++
 4 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.34.1


