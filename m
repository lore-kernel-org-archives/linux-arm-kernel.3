Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4B9CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cnv9PXs+SLKwxhru2dM31XWKUG/qt9LV+qno25AKuI=; b=b5xY370cb8w4PMRlle3dHUXCTS
	QIZOhkw3AoBxBS8uMZNU2OTvb5ecvBPiaqSWxKKyIdsflDlXm823GacXo+E8zL9Yh9qp1HaSwmqRZ
	Nj9u9+BgCelR8mlc4Z2s3MBetR80YIPeV/XB2vf8g65hQBqgfJUvClD/RsJ1jM5s9vV7lLB5nYDuX
	2kvfl/EZx+5DXlXiPXuOr/SoX8XxQQLkiYNZMPqoDKMYM+O+A0sC1iFn8q5W+PxU8WkqRp3ytpTF1
	V7eR+F7diZS1IqkjipGjqzVoIDbUqEjZ1538pqQtsvU21urZ8unuR9LQbfNEEhdXU+ndNCBu8AJo+
	3jZmvt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQXs-00000001CuX-03tD;
	Thu, 15 Oct 2026 18:51:16 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQXp-00000001Cu4-3Zof
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:51:15 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2273731a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 11:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792090272; cv=none;
        d=google.com; s=arc-20260327;
        b=swyq5Xgn0wxaTYs3eZttVupktW2fg4nRpBBvHy1eNQUJynexEWSPfrxrAvRs/ppExt
         ULnxYqAQWNeTuhMJxMZl++tC5ktffZLZN9SvHvXn8sZ2jkGAUMnDgqGYFJUdOnHG3QLh
         Ens5uWTShYA+ApoS/RxhYBwHxIeNztfVo11F+kQP/ge5JEG1Oa+13klnnY8fFvaILxSc
         J+kEut5MifMfU+zoBzIzWis35VxSWxf4NWZv0tYYzFfIAmudoQwYMJylw6//cyxeYaQY
         DkPwfDGOGKfL9UuFnlOjQ5u0BS+Dbmb3/d/5ALmioqBiv5B0w6qqTfyxFQwTpQaSJiZq
         YlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/cnv9PXs+SLKwxhru2dM31XWKUG/qt9LV+qno25AKuI=;
        fh=MyRa4vWXxvIZoY1P/tRrykv7nPsdZFnA6K7nDdsUZgQ=;
        b=WUFexindm5BCuDig9bJruxmuyddlVnNP9wnFweZHu2VJqToW50/H+/1rINGKoWwLa8
         1as/BI/8H53Sf9qf+Mg2K4tpLEyVdMK5n9AgenwPznmSSOcAbulY3WbqbAmDwBWrGNFT
         t3/OgEhxmcSXkFZLVTA3CuLlKToYeEGHQ8xgts3tiEmE2uTzMzn6B9CnB0fGE8KpL0gk
         Kd5GlNY7OX0Wx7TZAvCttq1iDNcasRann95OcocaXN00/bQnupHTaR1ZOr7o0SNYNYL1
         fddLdeufvf45wpX0ks7IwMAI1j31uHQKv/F+PjYA6q8Aa/jRzP2dr4vsoPpU5F+KcEep
         4mtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090272; x=1792695072; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cnv9PXs+SLKwxhru2dM31XWKUG/qt9LV+qno25AKuI=;
        b=jsG/7kem9FfdeRi7qkIm4IFQleTW2zNkeXumKWpsJHAXmi+c+vRPKDlZ6XzewlLk1S
         uYy+XON24RHa6QDGBbnNVSvo4tKsAuc73PXIqW2HSDO2jKSllBIPMPAk0exTukEyBYHo
         RG1U2QBdyW+Q/HJohNoxLjuBKib/mfea9YN86YvgPOpuBTQTknwlB5ELKnNcEcYa+mZv
         xGN94K38YxlAjO2sg57H8+oFLmW8NlCiXH7hN8/mXbaV6D8Vbu+Xou18dks1gRuTbB03
         vIZNsZQJoOwjbBgiqMviY0uqLKJJU7tFSsfDa+59yml38ekrJRGPla7h2W8mxVG1Iye0
         XrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090272; x=1792695072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/cnv9PXs+SLKwxhru2dM31XWKUG/qt9LV+qno25AKuI=;
        b=Qmr8Lct08Lidlsy6UU2MRYo3N/cDP6oirO5BwK45VYTvAdJKZAo2wdgsBlZF5+EAN5
         vvqnk6y8oByxg9abAR5wh4ZxbHljYUEMPcEgTFezhchQNAnAdEKhEoFui0HY9EOYChyr
         F5qOA7MCVItvJD1iQ0XSV6orkqYNh1WaASsr6dtpyIPk2HQua/JuPybI8p1T7rjULcxZ
         gn/g3GsXNpVJa0xgDkfxflBTEI8vcXZecQk1SIKhnnjM7ks8IAJGXUWYl9UMvNteA3DR
         MWnAe0NUUWWuHQJVrHmOMDdDkfRQAE4f3kcNqivQpRm7322UW6blqGKSstdLQWz9edix
         5Rew==
X-Forwarded-Encrypted: i=1; AKwUvBzJBSY5rmgJVaBeM1gV7dSVWivEQIZ7Mq+q6fc5e+JOJKjGyklRw3QCHMedHYYwKEHaOV0K7Ww0o80TgEVEm8Mw@lists.infradead.org
X-Gm-Message-State: AFq9FYLds1C2WnJDnrI7hstHJ+4i0hV46QumrMbWLJ1I1a6xNkMUlve4
	cIA2qAn1VwdBLMLMU5MPntnXvxpvrltbsSYzgogV3QAV90mwRjzCBYqlsvQaskwg21rtEnw0Bh/
	0VfYWEvP0toJS0ovyV06s2zCt58aGubI=
X-Gm-Gg: AYBFou06Ba6WHcO+3YeJyK7ch05C4Rc4B/CTZpKBBBjcxi4CncOzMotYBhzqn9BU9iX
	IZd/mgXB3sJCsEIVnNH5d9hgr2wv6RfwLIxYJexjA6sGPTGe4yh0+bCcGBjOERUkAZOI7sZ3J0w
	9zc62uMgeZM5CkeVxIGO2vTAvns1zGaQDpLmxPfkuL0x+ZaqKIoQ6NAlojQx2KIqAVkUZiDm+dt
	8JQZ3I9gRj/K5ywaIFPv/KQ2PwcbdIXRA3KF9ZpPzTISK/F56epgfrx1zEwUNIEHWv7EUqEj/0c
	iqauchrnIeA34AzF+BpX5GPGbntC63NW5uQIw4wWkejYoYVroFPUjO5I3mmUvZK3uuzrqt+FtSh
	iXsEuOoKvTxNTFL1GlzdwM0uXHhMuHI4/ESn6mg==
X-Received: by 2002:a17:90b:2e4e:b0:39e:59a0:46b5 with SMTP id
 98e67ed59e1d1-3ab3ac9c833mr15854338a91.24.1792090271582; Thu, 15 Oct 2026
 11:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261013220421.1588051-1-bhelgaas@google.com> <0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com>
In-Reply-To: <0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 15 Oct 2026 21:51:00 +0300
X-Gm-Features: AclHuK_BV3ETbypQUjfcwsZGOp4gpBmrzYDmoAzMDYlah33XznaIYLJzxw5l43g
Message-ID: <CAAsRjR=_Q7aT6+NGAszYx=FkFMYWtp0HVe1KJwLwHEVhR0ghSw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] PCI: iproc-bcma: Use EROM instead of devicetree
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>, Rani Hod <rani.hod@gmail.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_115113_917260_21161F42 
X-CRM114-Status: GOOD (  13.40  )
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

> Humm, this is not materially different for me before/after applying tihs
> patch and unfortunately but here is what I am getting with these two
> patches applied on top of Linus' master at
> 0fcb05b72344f40806cbe810de8872f1698bf053:
[...]
> Unhandled fault: external abort on non-linefetch (0x1008) at 0xc896df40
[...]
> r3 : c896df40  r2 : 0000ffff  r1 : 00000f40  r0 : c1ce1a00
[...]
>   pci_host_probe from iproc_pcie_setup+0x8a0/0xd94
>   iproc_pcie_setup from iproc_pltfm_pcie_probe+0x10c/0x1d4

The series only changes the pcie-iproc-bcma path, and this kernel probes
the controller with pcie-iproc-platform, so the patches do not run here.

I think the abort is the read of APB_ERR_EN at offset 0xf40 (r1). I
measured the same on an RT-N18U (core revision 0x01) in September: the
platform-only kernel does not come up, and with this one line it boots
and enumerates the BCM4360 [1]:

--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1388,7 +1388,7 @@
         break;
     case IPROC_PCIE_PAXB:
         regs = iproc_pcie_reg_paxb;
-        pcie->has_apb_err_disable = true;
+        pcie->has_apb_err_disable = false;
         if (pcie->need_ob_cfg) {
             pcie->ob_map = paxb_ob_map;
             pcie->ob.nr_windows = ARRAY_SIZE(paxb_ob_map);

[1] https://lore.kernel.org/all/CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com/

Best regards,
Semih

