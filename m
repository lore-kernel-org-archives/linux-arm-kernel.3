Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DA8C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dWamBMGzQ4b2qzS5reu3KA74iQ43aQ3a9idYDj5XNb4=; b=3dj9iSqm23ja2ecsFy8s1oKE7w
	sk+IXcV+68IUke6pZLzLO1xxjOZrYbatgr/itPwt1xqrNNgsq/3H8+tEJxdVJ89mUhimcMnBUHG+w
	6rvWq/BsqVmHXL1Cl4xMB1bVOeQXUfiN7i+WCfTKoVs84XOGoPrKcN1N7jBzwZrzdrdxnPsKtaOiH
	oU+RYDFtj8Pv7lnQaKuSkquipjbQMv0mcStb80coSE3rNsLmpTLWpdD9/6uj6Vjtyn98NyYUaqOJc
	0eGQVFdB7R6btaGXVLZEIeIO08NtXLpAEWHVa5UGTlFtbSEcjjfKZK+f9qrYuRwSQr0njfOE4JsIM
	m3JNaKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdeA-0000000FBD9-2Wkl;
	Fri, 21 Mar 2025 14:46:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdXp-0000000F9bH-3xI7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:40:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1847732f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568020; x=1743172820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWamBMGzQ4b2qzS5reu3KA74iQ43aQ3a9idYDj5XNb4=;
        b=Lt/A/oTYmldpevIdZubbEs25bmlODhtAjtQRyete7t9BmVZnpiuLBnLNh3ARItJuZe
         ylCf8+ySD2zigq0LFim2ItuunF9gqAALRKD0RhdXH+MWbT4GjQGilmQlA4TorhXni7rd
         L9ibkqt9DIEWdlEHhe4Ep0NUvaQUR9o7RB67Mp6MxO/DM9SiOBuZaqZqiBX1rdPpF3dN
         ic9ORHa4My2HFYpXH72dDDxppNyDVaFqhcQuWDCSIfEQFenPFgy0RbBnKO08bxMyhxXt
         THry+Y51hfgaCAmSRLkeSqrvC9Lzm9fA1LG6UyAtiD7bJMxpswGnsXNaNQ9geGyw4c4n
         hnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568020; x=1743172820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWamBMGzQ4b2qzS5reu3KA74iQ43aQ3a9idYDj5XNb4=;
        b=RjoH+w1PsgQdNBqB5+R22APkGE/6XFLq+5g80ydVaeXtd54DUfOYBtNxRZe2D6paIE
         vv7I/HQGeTKgrWNl/XgASU4s0dT15cwukfaWSFJbMd9Xdnx1F+VDvxCDODwDW5/d+k+2
         bI1jjvoT4HuMhvygYSVr7zBH+opyPDkK/vupQexk6/+oN47v+/vARu2zHYIVxniFdKs/
         kmoeD1Br84WYsP0+tvPMiLwrCqxat09F7lOFnoWyx6m5CKa5VC2GgvuLqgPGzJOubST+
         VAubXt8c7rOuYbGZA/fsu7Ce6IH0/Pb/N/m3c/ttIIDZa4Uo2JiSaGRVfdiYsASp0g/j
         E+3w==
X-Forwarded-Encrypted: i=1; AJvYcCVbrcTPL1HASl0nyLRbKWRUfI3J7MzLHJXrRX13Euu6UeEV8KKdR2EOpwb9HdYtNom51LCBISZQmXbqgX7A/Rhx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7V4C3UIlZR8Il7W7hkKjy9OAs1gxnZGC7yVRBOE37gsZgDxi/
	vrlMGr11Mz/1xDfg6/8wYVyNR0Ml1on7Lidpzh8d2UrwtXISZL6vi+PJWQ==
X-Gm-Gg: ASbGnctOptEZX99P1o+HUeWpx1GTLDYAA2iCDYoK8OnuUWc/0wFyVNsnStoKE4FMXnJ
	7WBRA4errX5RWwD9ApeaW88ckfHcqBYrO0Xg1yu35UNy7b0RP44dSU7FxdxDkz/27dGFHoRadDN
	G0pNueNJEx+KK9LwJbrf+AXWUdXuZ37zIZ1t76C3qGwHcFKuBKleNNsh9c2F2ZKFzXK/GPLYMq8
	BaFR/x9lbVy0NQRn7VazuCJEXezDhxmB9mEgxEx07btjNOT/QUp4PR1DR6jcCxVRtpUmU+MC6H4
	Qo7CvlafjZoKwsR207OoT1rs1ShEHW07S9NmMniIWfOGQ36YNLeIA6g9LqXZp7VMXN6ab5OknGt
	tuwrnx2vKw7bXaB+GdcgO
X-Google-Smtp-Source: AGHT+IFQeRM9QPE09HFBRqHaY3uOORN2Cbc8vPnkx/biZLOobat7sMvMEqqreD9p39WhPvc7YAHoew==
X-Received: by 2002:a05:6000:186b:b0:391:3768:f448 with SMTP id ffacd0b85a97d-3997f941b0fmr3190399f8f.49.1742568020439;
        Fri, 21 Mar 2025 07:40:20 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65d5sm2557156f8f.64.2025.03.21.07.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:40:20 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:40:14 +0200
Message-ID: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_074021_978620_50F4F613 
X-CRM114-Status: UNSURE (   9.79  )
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

Hey folks,

This patchset adds support for the Exynos 2200 to the exynos-dwc3 glue
code. It takes one clock - the link_aclk, and the dwc3 refclk is passed
to the dwc3 subnode, as with gs101.

Best regards,
Ivaylo

Changes in v2:
- add sob and r-b tags
- drop minitems from binding patch

Ivaylo Ivanov (2):
  dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
  usb: dwc3: exynos: add support for Exynos2200 variant

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.43.0


