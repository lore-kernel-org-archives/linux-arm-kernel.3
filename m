Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF10CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYJbNr/FzY1+zoA5tKpao01rUyzDVS9XAIWE0H2pjng=; b=kHkvz9xD2zi8XGhOJkiqz28KJI
	n6fCJkZgoDDNSJMLYZq4AeUk/cMW2XwC6Oi2QbWreF+fPJr7VrkYoJKwqxzpQWE8i/CmH2ag1QknT
	05PSc3Nr3MtjFJm4+LzGxQbnQa/L0z6rk/E1AcidLvkm2L5Nh/lfjBdbIiVf4XKo3xlWzdJz5mUVE
	oRMiZOXpZzAXcmqsdJx+QdFcagfxAJSEVf/BibH+TT2mpxHInvnPCyxrN0MbwuxOkPfXTue7T630/
	GccqG7IV0wCvgvknWA/xSqV9A5kj5abWQSKzTSFyJvDCyV8PHamnVo7Wl5Fv1xcjnLm5ho+/KbAzj
	0k2i8Lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZ4-00000005XwK-2QXB;
	Sat, 06 Sep 2025 00:13:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uueov-00000004ywY-0BbJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 22:22:14 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7728815e639so1586049b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110932; x=1757715732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYJbNr/FzY1+zoA5tKpao01rUyzDVS9XAIWE0H2pjng=;
        b=zNGmOYRYVO1SiZdOeYqQv+vTpESD1lfVnzaGd9/xe9ZaxUJP0m67iK1meRhNK46pq4
         la3K0c9Ij7NAOrTBAL5EddW/ts7OUPO7BrjpJX8ngo2NJ8lVd+B12xMLVyKAFRHk2EqK
         s/IgRlVGRIVtW4bhmZz1rLt7lGUNq5h+PQm5WPI73mxY4zwolXp8n1WTleU7AZSMTGAr
         bSa+pxyuDqo11rDlH7gostrRq7MpBZQ+HorIV1zNXh/+cqtQUx4Xf1z2uVl/SCGqXORq
         Qw2iTvvyJbYuMzGKSMdY0KmEevV+uAQp0V3E1Imk+Wp67GvFxM5ABEPw1GEvWbvoU79k
         GEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110932; x=1757715732;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYJbNr/FzY1+zoA5tKpao01rUyzDVS9XAIWE0H2pjng=;
        b=Vhb5ZRRlq+HUPtAWvTgRRH8iYcVFyVk/k4lRP37gDwvLB+OhQMv5neKm397XEGG1h9
         uwBcqxL00zscmzfj0zzLd1tvmcW53qOIz6EJtKhZw/BnNse23ksJaj+Kr2JDFh6sNGN9
         JtG9KZy2gnBiMT1sRkA30jlK0ZmSej/w4cs82PfflgexnRl0+GWK4sqYqtpRTSA8NUV9
         db+veHKSB3yLsbeIaR5BayVY8c5fHdXM8j3FC/+eTde5U7cQSzus3UZbWLghlgpdlwhR
         THcHjZYGU+W+Sq+acwhx2wM8qvekU08rFLs/L1KjvKxJo7oPYoXErw5pD6evMr9OVSnv
         VW7g==
X-Forwarded-Encrypted: i=1; AJvYcCUSuvwf6vS69j9hwHphs02AJ8PBuA8kNP9kvHzgBYX6qFTjNOJ8UvSiL3CzzXfmgvbnQCIL/YU5HsdFl0TiL91W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9a+jVFIUATPJR4zUAFGipwUrqp0qkkSgv50FacUSubnbiI1Ix
	2itGRyDpa/e6ZjzbqBUxkc4eYq1U8ZQdXpcV5mwhTZZAcoaAswdxABtNzPOLkbT3oIY=
X-Gm-Gg: ASbGncuoodAuPmAwSGwQd7e4eUzHUwZ9xqSnTMiEZdUMfB0S8w2tSGbAuQ69VSanUdA
	btek8z7nKAlm4H+wWb+dx1dw5gkkMOc+0tkqWFkqKtXfW0Sbtv9EpduDO41ViLY4fBOYNEMcIRF
	8uc6qgHMC8Hiu+xR7bxKNKBowpjzoQ/YhtBZNC8H1bx/llvlYA4Ko4FxcR214GQp976NfjDLl7F
	HoFW1gBUwgkWtUWHQSQtkxxntyI5Zn9CofiUTLRyGgPHw3Oeqexcjt4GRhcOEz3vmZOg1pVy1h8
	CNzFmAOl2Nm0KIsjmAr1/3z/n6sWoWWJrtB67L1cdVZ8KR15AVcURElOIqEkqZne37bTf3WKR6O
	AG1k2lr4gBXxQw925IHFVphn23cS5UCt0k8EJXaw+YQ==
X-Google-Smtp-Source: AGHT+IGaXEwoc7ILB2arBg0Y16+KGjCnlIvUXKnnyBv3PESilhG49cI++fLCWMv8Z7e3a6gXIMXVhw==
X-Received: by 2002:a05:6a00:17a8:b0:772:5165:3f68 with SMTP id d2e1a72fcca58-7742de615c8mr302181b3a.27.1757110931832;
        Fri, 05 Sep 2025 15:22:11 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77274171cf4sm11008985b3a.76.2025.09.05.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-omap@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matthias Michel <matthias.michel@siemens.com>, stable@vger.kernel.org
In-Reply-To: <20250717152708.487891-1-alexander.sverdlin@siemens.com>
References: <20250717152708.487891-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH] ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1
 pins state on reset)
Message-Id: <175711093087.666031.2909646610138285182.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_152213_085696_2227547F 
X-CRM114-Status: UNSURE (   7.62  )
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


On Thu, 17 Jul 2025 17:27:03 +0200, A. Sverdlin wrote:
> There is an issue possible where TI AM33xx SoCs do not boot properly after
> a reset if EMU0/EMU1 pins were used as GPIO and have been driving low level
> actively prior to reset [1].
> 
> "Advisory 1.0.36 EMU0 and EMU1: Terminals Must be Pulled High Before
> ICEPick Samples
> 
> [...]

Applied, thanks!

[1/1] ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)
      commit: 8a6506e1ba0d2b831729808d958aae77604f12f9

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


