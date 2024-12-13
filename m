Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34641E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZaUJxyWODTPt/EHA59a8Xm+chAdP/ldBcjz3rSODr3s=; b=lltwJIFRpZH8lGoUeRcBynnm7/
	zQR3mipxah/0j2Qqal84C+r0FyhNbBzRnAVKG9AFkHxJNkxMJpvOSgzDQjQtYaCB64SvcYZlMcVAz
	83dejlPcPAU7zfz0u9zJkTDbhLPddomyrmhPQQ4/6TrkE9cg85U+6LnE3hfCLcmclT1WAlDb4JhMc
	CJL432dDLDxVXTIMFOgim7hb/X3J287362+8O/CjUO3O7S5rFCWko++Y/CAeDunuTRJeibCuKk0dm
	sKu1Lwwwb6nLeBKfNidQADp7fhZaG5Yx1oG8tWIqhidYxxASSDLXnOqycgTPAHpLfYjd+cxBe0VmO
	P+LblUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMA89-00000004exo-3shb;
	Fri, 13 Dec 2024 18:11:13 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMA74-00000004elp-3Srs;
	Fri, 13 Dec 2024 18:10:07 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3a7d690479eso16206905ab.0;
        Fri, 13 Dec 2024 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734113406; x=1734718206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaUJxyWODTPt/EHA59a8Xm+chAdP/ldBcjz3rSODr3s=;
        b=dOUvrUfIJpxOtxcAEZNKrG9db6bAMVGN12JnNwIkeJ5rRBP4+nz/q6Iz8pRXqnP0LQ
         +kZ3hDh6+bQtn0A0c9cdNn+Dn6C9if4zm2CdtkJ4towFLmS6VBLNwZfu5ZtPkzxc7DBM
         JF+lv4ETPYRLIdxqbm8rRxeHhZsgQJHEAlfUlrS4Ei7K4TPvpy8Tz/tfKyTLO0JSpb9P
         YR0EFIToHu0Cc8CuqtrvRAPTY3Q5VJWOhvZ+MXMLZitKwxwWZr+HrEyTUzjx1F12tqZc
         bzD3k/1pVVoDooHOeaQZNIjSzGzQDuwp1UuUzj+Z5pZlHyzyH7ljnyYyQ8jy9MdhrDWH
         IRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734113406; x=1734718206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaUJxyWODTPt/EHA59a8Xm+chAdP/ldBcjz3rSODr3s=;
        b=hdFt1RYCEIRIj0bw5SCxiY5QXfTR2luFZy9Ht/m0H5tGNR7Vmcy/6NWMpPYWAd87n0
         BovBNI9jh7A5ZpC5Gd+0X6/x0CCVMVuQxqAHxXTP4ttP/xWnutrPZfObY/c1tN+00LwG
         1OXc6NIUtnW0FpkLq0jM2k1mwk1OP33mH/N2rik0TAaePjq9WGlhqnrmV1B0f7ogCXVb
         DVM5rAW/koO4ec0kZZvouOPXSAnOBT0XsNflZpzVUz4zsMsWiBwW84ueRslaBugsQ93d
         8njTE4PhiCfwBB5ioVZqUDxOciJcP+lNool94u8ixqkkNs8jiieHMs3bzmVjOQQ/EyVL
         JsAg==
X-Forwarded-Encrypted: i=1; AJvYcCUDP4XONUfS4ThTCwFQyNjDyaQ7O3H0WrEpmBiS/uJQkQraxWFr74Vr2OxLdas9VNnA9KyYtwj8rP8xxkRFBV3q@lists.infradead.org, AJvYcCUw0onxDwrnswdcVXxtalsXAnBX4Po/HYd+X0CL1WKx8LlAfKJ6M6HSXQZxb9BqsTepAH6bDGLFD+3oPZ8T04Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxV0UWlWbR2aRm5IDyHm4XpFSRqOMo4BHbu/P549MMSurXPR1dB
	ONHjRCpTTn2Cf2l9joA9gbdZYi6MPmqSMzkyg1MgCoyfNlN8kLFf
X-Gm-Gg: ASbGncuqfa3jXVzHYRO2tnx1Q5E/xI5uTa1nXsabYXHdrMk7xI/z56Gb5gQc4c99EJS
	mpjKyXh0mxIT+9/Yht8cAQ/ITUx+7ipWZYinLuypuKGBrVj+aVRaWovBVDZm35MWIO4F4xQiDkJ
	AGRjmvpW+Uu7X2WrDLQTAbTFEnOQgrPJIT+auIplOo+71DBEhLY7iLjIQ6csOp/1Jb2OzOfDk+F
	iEoVLL7zRXTJkTsRDNVtg0+PSGy17217AU3EwdwAB0oVNs071sCdJ3y/CVAgY/5eYDODDVYpPKe
	ru/yhDVo+x8SZsDlhr1dPFBAFrY=
X-Google-Smtp-Source: AGHT+IH/MEREg6rxAa0/RtNlAsBMr5UpSbMTYOPeTSadT3t2wf9euEA3XWXtBYuE66GNqav6oNdK0g==
X-Received: by 2002:a05:6e02:1aa8:b0:3a7:d84c:f2b0 with SMTP id e9e14a558f8ab-3aff50b340emr43862345ab.8.1734113405813;
        Fri, 13 Dec 2024 10:10:05 -0800 (PST)
Received: from localhost.localdomain (65-128-205-244.mpls.qwest.net. [65.128.205.244])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2baf714cesm2922533173.101.2024.12.13.10.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 10:10:05 -0800 (PST)
From: Shimrra Shai <shimrrashai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Shimrra Shai <shimrrashai@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add Firefly ITX-3588J Board
Date: Fri, 13 Dec 2024 12:08:53 -0600
Message-ID: <20241213180855.16472-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_101006_928139_AA7B90AC 
X-CRM114-Status: GOOD (  15.32  )
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

NOTE: This is a resubmit of a previous submission with corrected
recipients list and some small changes to make it more suited for the
general kernel (e.g. eMMC is enabled now).

---

I am proposing a Device Tree Blob for the Firefly ITX-3588J board.
This is another Mini-ITX form-factor board for the Rockchip RK3588
SoC, along with the ROCK 5 ITX. This version still has some outstanding
issues, however, so I am unsure if it is ready for incorporation in this
state and I have not yet found a fix for them as of now. I invite any
comments.

Issues outstanding:
 * Suspend does not work.
 * The USB-C port does not work.
 * Unsure how to get control over the main LED; the commented part
   seems to cause a failure.
 * Audio output on the back green port does not seem to work; but I
   found this may be due to slight inadequacy of the still-new ES8323
   driver - can suggest a patch for that too separately.
 * Not sure if there are other board features that could still be enabled
   with the present kernel drivers.

Thanks,
Shimrra

Shimrra Shai (2):
  arm64: dts: rockchip: add DTs for Firefly ITX-3588J
  dt-bindings: arm: rockchip: Add Firefly ITX-3588J board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3588-firefly-itx-3588j.dts | 1133 +++++++++++++++++
 .../boot/dts/rockchip/rockchip-pca9555.h      |   31 +
 4 files changed, 1170 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rockchip-pca9555.h

-- 
2.45.2


