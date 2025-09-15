Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24664CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qUTD8uROnoCtAqaX/Ri9iIJ3aP0OlkHXH5AZacDoiM=; b=waKZ/FS7ei8Cnn3sptyAFviSO7
	7H4ZQJvqjAt6PCvrTYigLN+LNEQaSYncT3fO5vJdoEpwwk2s+yslX0JPbqy1wfMgzPxorRG4cg5uJ
	++hb45GoIZqe235kBA3/kaI+q6shY8okfF+eD5yTRYK6Ty98CPl/nyjq9t+a6BZOTjF8POwuJA0in
	bxyBms5F2ZpMW6Sp4jL2C5t+46jzbD0/MyvhsaVEbT9+YZJsB/dP9PpiJeVOxAcf2OZVR8PqAzyUs
	/ABb+TUYb0J9cv2rSQqaHl/FQKlB9bEw141R2Ru20xps4KLu+dSfPCJzWQ6G3ZnHqg07Pmvqm0hO7
	v6YhoNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4el-00000003EHI-0WWp;
	Mon, 15 Sep 2025 08:33:51 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4eh-00000003EB3-0u5o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:33:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-560888dc903so4716294e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757925225; x=1758530025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qUTD8uROnoCtAqaX/Ri9iIJ3aP0OlkHXH5AZacDoiM=;
        b=I/4/WTJeytJVwhW5A38W0xRQkRKWYleaRMIZlGlKbWSSbbC6ZeawumKeaHXyXf8d/s
         xGyX55rOimczlitRPzLqMyhm2J/yDrCx680degljHlH7sMOItYVHZvXZSeaKPhX4uDAl
         HoARdWsV671yO4bVzowkmsltEw+Nl+5m78RF6AZOqBla48X3iCl2BLEEngE45pdtBVWB
         tBQPkv6VlsJYuZATDCMFVRVNapqwiNu19lDKhO2ZPjHTR6VdY241Yt7Xwcx9Qep2U8kD
         ScJRRYIKWRO+ea/lFkL5pUJmBm+bY0PZCgqSVO2dA92aW7vZG1Bp7P1jC8dFKSDxew8M
         1/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925225; x=1758530025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qUTD8uROnoCtAqaX/Ri9iIJ3aP0OlkHXH5AZacDoiM=;
        b=AKPIgS2PCmp3ml97+4FZzdE8lUW++Z2zWeP6RgbzB1WxScqke5Mm5z/8YFrFTrgrZo
         oUsLjhKYcIsSEcqUSdi9h7SegnpD9IDE6OVAO9WvJRbI5tTnLH6vqrSLAgpGJ+Fhcf9H
         HC/gABd16QP322WIgFFNfIbLAK0d8gJnU8D1Mz8hELJYhcL225g/42Datcrb5jXK9Vlr
         rd42qVsmyRRKbY0frg0toV6Q6ZrDihbt2bvbCAzWJSFzFuVjaJP2jRk9R8ePD9R5DKPb
         ujMW47GohH5CKnu4Y9ghBm4xsGYS811kgljJ7lu25/cnKt7glvwiNdHX+wMt698AiLYh
         52aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFoe+Z/7CwlCVmU8P6oat0LtNA56WKR4AozPWweGtYaPDxYucBjuHAB71q7UFtWn3uXVsPzZttLbiTB22Me6iJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzzfgaK68gUTGYK7VWdXDAHxK8NewSes3Gx20ZQeffFbSuVRQA3
	VSIAVajymeC5XmoL2gTM8atGbdwJ3l3K5krmHnpjPedVMpiVbdvbfIsez6E/5OQNTYJHuuJxnli
	IhUU1IKA=
X-Gm-Gg: ASbGnctVa/42VGfKqMY6a0+KZ9cAZDZ4Us4CcmSixNQW2xGw7E84dItrWhr0pz7tEg7
	cEPFLeE2XVz1M0zrOKcWabNvGHsBcArXKZwEU3u+I3fnbBYiPvSQP4OWJqJNrHoR1nlCK8psUn7
	tN74pYc6GonUHxJXSpKsfXJsCQOeI61WdVTFKyw74be8kFt/fna1kNg7Cep/7oGkPCOK9P/wU2n
	jy0h9/0yO4sh3TA5bb/ADZilcffcEs9igP+CfWV5c3rV7ZaL3It7MC8d9iQZHHfIuPJ8lfAAWYV
	yPPDgJYzqF54J4YBKvZXHdX7NS+dxixu0NZR4kQ7khKBYDzGR+Apm7c6qyJRgFbCV5TWWT6xjhP
	BDMuusrXLG22zwVi6Maw/CtedxFQAbk81WTIl3hPdXyWdq3T0Fc/tTUE=
X-Google-Smtp-Source: AGHT+IFCaOIerdSvA+z61cnaMnc6f4/AxdvboyLIWVzD2Istbx7t/KAwnGHxWdDUQK//4BQjlegbXg==
X-Received: by 2002:a05:6512:3f05:b0:55f:3e4d:fb3b with SMTP id 2adb3069b0e04-5704d0071c6mr4042367e87.30.1757925224185;
        Mon, 15 Sep 2025 01:33:44 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a6a33ba8sm2335142e87.46.2025.09.15.01.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:33:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 4/4] ARM: rockchip: remove REGULATOR conditional to PM
Date: Mon, 15 Sep 2025 11:33:17 +0300
Message-ID: <20250915083317.2885761-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
References: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_013347_274515_EFD4AE5B 
X-CRM114-Status: GOOD (  11.68  )
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

PM is explicitly enabled in lines just below so
REGULATOR can be too.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 arch/arm/mach-rockchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index b7855cc665e94..c90193dd39283 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -13,7 +13,7 @@ config ARCH_ROCKCHIP
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select DW_APB_TIMER_OF
-	select REGULATOR if PM
+	select REGULATOR
 	select ROCKCHIP_TIMER
 	select ARM_GLOBAL_TIMER
 	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
-- 
2.34.1


