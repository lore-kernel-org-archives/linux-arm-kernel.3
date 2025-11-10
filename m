Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AABCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWzPWemnSbElAjabzmde4Itt9ehqptnppmUVmOqIRpI=; b=fEM6DVUINFwAz46x1YEHFu8OWD
	oIqicnrrnCS0hiKJratpD+sLwkTck9sBOhwsW+/+nQxSIIM0MvIEkNZ2r8laPYVb1wbPu9DuYen7a
	CLMVJwCTvzTP+UbZaaFDzFO1cthVC7sGkYrrO+o2765p7jSmN+E92Zo7wESoj+mMRgm/fMgWdoGXd
	12+a8PrEwYA3ZRRbG6uqH6/yTNPN1k6QkFiPfLBkK09SnytOzD9SsVzFGy9iV4e/7S2UbIijDeep4
	6UGZw7CZMi6irops7KeZ7I43wl29i13D2z0qgYai5wEiPbpJsMnDC9XSA4De3Cts3+CuzCA3mfA1g
	zloslJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVm1-00000005udF-0g6W;
	Mon, 10 Nov 2025 17:33:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlw-00000005uZ3-0jlt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:33:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso14121775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 09:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796022; x=1763400822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWzPWemnSbElAjabzmde4Itt9ehqptnppmUVmOqIRpI=;
        b=TElDtSYWKK9IRXVvNraofJMV1f+6dWAcVHWEd1qvO3j+KSCZl05kquouJZ5GEp535v
         nTeJESReDXSr+XbeYNJiGz3w3zTgwowhgWFYmKZ1CMlh+mf382c5U1FGRfpTeMOsrk1m
         CNQNdBZkfeaWHl9uwf/eWhozfbR8k3K/hSgL1hYOiVjrmJO+Xu4zSZ3mEMq7y+188IE3
         oe4CqjuXsZdiPCAXhszfgNWyhMWv4e4hH3UFCqiMTQiP7i5sEQ42u1Om+gt52eF4kWrr
         sPVG1UYylntIOKBDTOBr1l62GVAcZTo4xP1Wr2va+bcZG4EazxI4zSNgk2kEiDkuXYQD
         SkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796022; x=1763400822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWzPWemnSbElAjabzmde4Itt9ehqptnppmUVmOqIRpI=;
        b=hiLIFIVrWZC7KbLHHVHtk+GFtREXyhU2UONBNHYV6Nz9QHm7v7JvAaFyAmOuyJ/asB
         5u3yIFtmDNPVyW6sodmtO7R7tTkvhXXrEcfxHNoXbgpWRgXY6tQaC+tBTihl/ot/uCh9
         V7Y+QjnYpTKBit6BM2m9HpheJGVy8YjVgFEI/C/Wpdfqw5SAUP2TnBUs3tfrVRdnxMlW
         tPhrEzW5lZ+gXtnfLGKbaIMOIFgvcgsxLnL+qqQieecD6u0EmPAoxBydRFRWoBcr0E6e
         oa3PqvCQkH19OQIKN3glq5lcCb+jhdCY3npAJeZX0nwCl/x69K9kCI2+Y3qIvZgVB0IU
         gIVw==
X-Forwarded-Encrypted: i=1; AJvYcCUnODhNEIVhOwDSxZ+xvNF+xNjlL33Zy6ssr8sLc/aZHHhihR+8vo5DVMK52h0e2zThLHaUHOsUMs1+zcyvwziw@lists.infradead.org
X-Gm-Message-State: AOJu0YzEz/4Oy9AHfwsYJp+Tky/efvfG+wJVK4wCIn+BGKTK8OB5DaGC
	377O5s/XLQUmbc8dyAH0/tyOhuftFQOx/YFYrl5GC/v2CyyohOHRgXynAIRHGaQpM0s=
X-Gm-Gg: ASbGncuNTgtxqY/+vAq9qDxnojgyR67MHaEYMsCGhppHplHxPgKUVxNoX4mfDvC6G4E
	zW4oFHhQko1HzJ595xqnui7C/COIl8Mtj6zSJmeoqY1EiHkeleMyR50GmTSn6lnwhhXBkxUImuP
	PI+ZSaCc9cVVZdSXzzfFnY9aFz9K43EKYZJdbsnEh4U0OvtIsJ+k7d/mCqLZLPNT9E+D2XDDHdz
	uXxDLowICw9isyhfds4HDP1dLc/tTpxVklToAu2P34A0LXRemghp0rXGIjaK1r9GZx3W/E3oZyQ
	mjxga1IaOYnjgRt5o2DK3vujt4L0AmWQZ0aO8W42SBCPrr2KlQzAXMOEdO5y/c62czLPp9Fbk4d
	auJT/Mb7w0Ho+Tgqd0ukHKaWyji/wPuortJf527o7d3xSfahyrFNhmATbeSHku3wpB/JfxWF+dl
	GRj+a39yIt4FLQoG0bbtg=
X-Google-Smtp-Source: AGHT+IFG+zeZs8i0HcOK4EFCqMFXkt25jlhJO9xhRAVgjZV+KV4HEsFl6cEM5lLjaVjHEaqSmZ4BKg==
X-Received: by 2002:a05:600c:530f:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-47773465f2amr89513515e9.7.1762796022324;
        Mon, 10 Nov 2025 09:33:42 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:40 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 4/4 v4] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Mon, 10 Nov 2025 18:33:34 +0100
Message-ID: <20251110173334.234303-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110173334.234303-1-vincent.guittot@linaro.org>
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_093344_218186_61DDFEFF 
X-CRM114-Status: UNSURE (   9.77  )
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

Add a new entry for S32G PCIe driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..922ebd4787fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3136,6 +3136,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
 
+ARM/NXP S32G PCIE CONTROLLER DRIVER
+M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com
-- 
2.43.0


