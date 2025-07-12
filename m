Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FB0C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Yy54miT/gWfUHu8Cyu4CItLZigxgVN3p5H0HM5sD8=; b=MkWOndVTs4DHN7WIERcM3wHRR5
	OJqJz2C/HQSGgDvgC79aw2ta4n9q46S36xTb+miGEz0Y+3HaiMYc3q0V9eFNjnWvcfIx6oJFYTquV
	zUCSqDj3HqmcZsCar8mosLksCBR4yhMsmyXBOEKTXoHZHAxnwDNO4Mo3y0+faW6sx3/hi4Cx4PkPz
	ZzCYuxIek2WJbO9ce9tHmMf/1Hi6xwt6LvpGzYP8PXROiEG2UVRU33/bsG59sywGTres6pe9ILlI+
	460K6F3KLWe8Pg0j1ecpU0k4cyD+2B4q2juCvTx369yekJEFWjH94VdZ+BlAbTk6I3yRjuEvgzQ0b
	cRL9L5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahW6-0000000H1uY-3FAS;
	Sat, 12 Jul 2025 21:12:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahOv-0000000H1DB-2C1X;
	Sat, 12 Jul 2025 21:04:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-75001b1bd76so642919b3a.2;
        Sat, 12 Jul 2025 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354293; x=1752959093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7Yy54miT/gWfUHu8Cyu4CItLZigxgVN3p5H0HM5sD8=;
        b=cPxAmFHAXBRvWcWU6QdwZXVznLmY/lx6h7ide8jTqd50c3XwbEpTvQsaLJ1nuw5XIT
         EtaJfxoyKYw4CeqIrb4eQpQH+aZOuTtaox8fjcyMxZSN0hL55ID+wEd4aybPMr9rfwOu
         Wgxe0GxH0IIBngFeBQwk78PbpUgiLk0iODGq8Cp7hlXk+4NXYIW2TCE+/GZsGSS53Tkn
         X+udK3NquYuRSSw0On1U0RwyvvygTVMvoD4wKhErBKZewQA0Wo/F6rFeXwLg1L5qQg21
         thaGi5lvRFzw/HRmrS/ugJHqc2muj+wmtw+S2tIUOvdIrI0a4PjDxJ4fFSCmBeefj9To
         /aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354293; x=1752959093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7Yy54miT/gWfUHu8Cyu4CItLZigxgVN3p5H0HM5sD8=;
        b=GgAGe3GDsv/mYk4qsZCdlBZdcHk+u5w81IorHY/aBJTP0PsGJoX8d7sZBDH6X0fAOH
         XLniwdVsyGEC9DEl76npXKoHsBA5k0I2gbxO9+qvCQ8jpAOxlgcpiSVl4IkWzkF1vFHG
         UyfIcw3Dr+qMlc1JvRnPEdSvp0Qsplqn+WLDVV8o2CaFm3PtI7ePC0Zw8UPWj+ZQf2sj
         hYeSnHYYzRX4LREcXU8aAXt3nmvvrYsboU/o2/Kcstg8b6ARwitDxtOqXXbKFOtk3Iz/
         fl3yc2zkPXpnN/X2vscjIDP0S9BC5UL4bxrQ5qxyf60wz0rwX4r5A5rKfqX5Fq7ul4yo
         NVaA==
X-Forwarded-Encrypted: i=1; AJvYcCV34idEgUIkgRRiS7MesI8ztQmWf0r011hRiGEiEvZauXp0OXDt9pZjcM7DKG0KWQju/7v/fyFfrI7RgyFlUp2e@lists.infradead.org, AJvYcCXJiXEiiAC8itYgDFdQMaLPvfQQraDX9iByE6NkB0b9cxs4RCMXx1y9RdFj66ZUQQ/5my7Zf/Teu37DFs99LuQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVlREC/lmqURjNsIN+f1QDQ3Vkz5UZI28R5LcCyiF+lb4zuu8i
	GmXd/f9Eh3kD7i3LRwyJM5veuSEy1YhTdUB7z1cdNBEAsK3xBv3zGQ4l
X-Gm-Gg: ASbGnctsu3bFzp0RisA2VlLSl0guXfkkNRs0nvhojL6HxTwsKnEy0c+IxGJQrYPwh2O
	ulR6kYemE8EkSIIULLmRdxBN3K2U6BmgkxtNE1Pc8O65y7asblvzLwkw0yF5h3Id3P62ZQsRNM6
	pI8pIsA9ywXxIMvyzcoL0+qyUNoIHmWP2l/fGqBm2W495OEpEWGHP5Y50OYawFAJxBNF/SWvmlf
	U4jKb/LCCHQXYxEvGw0tlB0LPTdSJpLDPShQhuw4LPL0tPHniR9UUr3TLrrYEFm5HNz0SRa99cK
	mdeMBM4YIi5Srk/3/yankmHn5PDizNBWRfuHOsJtiknVT359Z/kmzlkxWp1xzpVKlUKqeJSSxcq
	sBmMw4SVfbWpl9A==
X-Google-Smtp-Source: AGHT+IF6HHVjmY1jRKlMjLDChjNeQFSBgVcfL3sqPPUX07rFfyjAqJU724onjmlyPqicF8MkxgnX5Q==
X-Received: by 2002:a05:6a21:62c1:b0:231:e2e:95e4 with SMTP id adf61e73a8af0-231352477b7mr11392023637.16.1752354292751;
        Sat, 12 Jul 2025 14:04:52 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm7988645b3a.5.2025.07.12.14.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:04:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv4 wireless-next 2/7] wifi: rt2x00: remove mod_name from platform_driver
Date: Sat, 12 Jul 2025 14:04:43 -0700
Message-ID: <20250712210448.429318-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250712210448.429318-1-rosenp@gmail.com>
References: <20250712210448.429318-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_140453_555221_06656587 
X-CRM114-Status: GOOD (  11.56  )
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

mod_name is a legacy debugging feature with no real modern use. An
analysis of the underlying MIPS setup code reveals it to also be unused.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 701ba54bf3e5..e73394cf6ea6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
-		.mod_name	= KBUILD_MODNAME,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


