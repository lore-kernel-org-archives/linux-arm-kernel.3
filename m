Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F59C36011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hO3xQx9aw1GJXrcafbGcY1h23Byz3iA3lG0yj8pcrQU=; b=xeJB2/m0LGrWBaRQuAwIosHxF6
	XrEkqaBBBrFASTiAUwGKxbFgjRh8hNA3NMxltp4osL+bnbTvnvk/OmJl3EdopoX0uJs8pTxSSYyQa
	OQVUdTMCEA00UhXAYEpmmGOIglDxJW+BwdGe1bd5o1zzyNeeW6eiCGSPZAvHa5nIu2PO69Tgl2zH4
	Tp55p8IgMFi7SwJEcJ0F8uPbGs8Kk5yJ5EarUmCJawyFW1fFJbatrikTqnhNM9+Kk++f4vXj3uqqg
	zdM79VedSvsLvAgUZSdwFa9K55kKtZN2aaI0JzTSBDBWT1xHcNpx1CLi6yPEugOA7bzfx9DpSpVLg
	xcXpY+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsQj-0000000BlwA-1O1L;
	Thu, 27 Mar 2025 18:58:17 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsOz-0000000BllY-3VR6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 18:56:30 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2c81fffd523so415652fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743101788; x=1743706588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hO3xQx9aw1GJXrcafbGcY1h23Byz3iA3lG0yj8pcrQU=;
        b=ETV4Zi2dL82olCxsJ5SDNzUzPWzsedXc3/Af+4Cuwu1ZOmM8yWsVDhEcLtoGVYTnLK
         5WFxGK5t2oB6UtchWBVdiM6OGF/Nk2/EGONjRyfybmJ3DBJrrBawbj+Ya3VbHQIYhfLY
         Pd1heeJuz02o1uMNY6YgpGSSfgT4ZdTZmALtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743101788; x=1743706588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hO3xQx9aw1GJXrcafbGcY1h23Byz3iA3lG0yj8pcrQU=;
        b=jwWQG66CKFrH5vyF2gJ0E20mqFJMamkjO+s8QhK3JKsKFcRDOcHMQPAYsfoTVtALQb
         cne9X/vG+7LSWH4aSQbibu5B+yOWrsMPzY2JM2Ws/5AALwrspPVy+aF9T03FO8yRjcEt
         8fQWuv3lNQ/ogztgpNftYip/8argEQQYWwF00y4eHlXVI5HlUdF99OAmGugdlGXXAYFY
         qUpZNQQFxrVb5F9GzlG1KDXDIkyyOnq1i33CSF67o5k1NyRluOJMVeaVz6BrAUNMl4Uj
         hT8WqyFXLJ3uD4ktqyafEAkcqMlui+cW0+7YbkCUoDndGcx5x/HzunuliwCkGJJoNe2J
         kpBQ==
X-Gm-Message-State: AOJu0Yy5j11KtrlnuxC1vPWZmAd673W3gk/Wd5c3Rl2I+Qh+i4xWIgu7
	0Ozo8Uu6SR+6lCLTut2AMMEP0HSSEhhiRYWreBIKXGEMCFg0YuUtvRTqz0DWZixT8Xs8XzNlpCR
	AFW6HuIZUySrd6VJLh0su8WCemcEKBAbgKLnk6Sg1J2weCDk2yDDPQJOInl2N6wdKLgYlW/YWnu
	+6B3qECERW7R8M++IljpGhQCQOqDfd33NV07+4G9OsCtYJAUSRfO6m451byw==
X-Gm-Gg: ASbGnctLd/1TPf7j3UK3Ove6beOG138DAPTpmWlamBoYZ/DcQ2g1P5Ba56AiaXbuySr
	HN6xDoT0PgbLSNBNTLcJ+2QYMf8FrbqIJSUn3W3KNNudj9jZ7mKhM8Y+YqgSTi4H8ScVefTwMhf
	mQ8jiP0nL0+nNauWwSeTrzbCEu4vtd9ncZmgAx8CWwGActy/mc4L9qmNoXHkqQOxzSF1vQ/xCLs
	qR6CBOUw3EIBRBXtwbPAwcO6yYtQMswmK4pIyBmx+iDwMru1hhjyRFvoOup4uwPNERmi3WQR3YU
	0eaTUn4L43TrmheY/Pl0P0IAtvcOZLKosVIC9FX5eNZvQ0QwC1hyk+pWkTQl7VX2HRmGbysxLUN
	MmWu3iq82BH3rMlHOmAdf4A==
X-Google-Smtp-Source: AGHT+IEg00tF/zUqTuDnp+3xAYEBy4WbNKI4GPO4ni5mjeP42q5NxY0LQvo8mS7zFO0Ue236qYrYkA==
X-Received: by 2002:a05:6870:a10d:b0:2bc:7007:5145 with SMTP id 586e51a60fabf-2c847fa96edmr2929868fac.9.1743101787781;
        Thu, 27 Mar 2025 11:56:27 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a3f3db1sm77997fac.4.2025.03.27.11.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 11:56:27 -0700 (PDT)
From: justin.chen@broadcom.com
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
Subject: [PATCH 0/2] phy: usb: add support for bcm74110
Date: Thu, 27 Mar 2025 11:56:21 -0700
Message-Id: <20250327185623.3047893-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_115629_865330_DD2F0C96 
X-CRM114-Status: UNSURE (   8.08  )
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

From: Justin Chen <justin.chen@broadcom.com>

bcm74110 adds a freerun utmi/ref clock that saves furether power during
suspend states. A tune is also necessary to pass USB compliance test.

Justin Chen (2):
  phy: usb: add support for bcm74110
  dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110

 .../bindings/phy/brcm,brcmstb-usb-phy.yaml    |  1 +
 .../phy/broadcom/phy-brcm-usb-init-synopsys.c | 61 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-usb-init.h      |  1 +
 drivers/phy/broadcom/phy-brcm-usb.c           | 14 +++++
 4 files changed, 77 insertions(+)

-- 
2.34.1


