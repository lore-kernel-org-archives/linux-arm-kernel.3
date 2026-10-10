Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C80DCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 21:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=; b=SiXODBnDe42yLvjYdB/CsrQgFE
	1oLh8a22E4ixC6+axpZa86eWsiVtJBUP0KpllNM6UhlxKYj4KkmJVwDN1GRSH1TAF0mA4Zl6NAQBi
	7nUUmLAocpt9YX1n32g/ktg4c/+ABr31XN6PWYJDPm0AzB182IAxBvfdy8iDy6wUcXciZkXCxoeTm
	lF4AXzPJH7Qw51k4WJj4zKIllsmUX0/V7ykqNgep7MRgTjbtkNGLHfRPGTJO3fJI5FyUAW07p6ms0
	xisyByimOE3/rpRp/GNWBfMvXRXtQwvdywMZImeMKvLg2RVAgVBsvYTnllVOckbCKWs6zq7XAONhS
	FRLbdj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFeag-00000008S1I-3FDz;
	Sat, 10 Oct 2026 21:26:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFeae-00000008S0u-2D8b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 21:26:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48af27fe287so659808f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 14:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791667606; x=1792272406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
        b=MH8GQU/pMTj12hgJu25JUq9rOzS6dyOhJq9BlZhS6+n5dTMcjnbLU6dWxl92bw3clm
         LSEi6OyRtgpOWk/nBEs7hvLw/XnIIZKNICr0wxG8zWwtMcqo3q8PGBDiwsbYlXl1h3NY
         FE8Xtqzh1UluX7Ga4F3hrW0lszMgBV5owNfvJHEMT6vY2aQ5SqDVife8FECaUIL106Tv
         9lWlE3P2Ck+u/ht0+JOjOBAjGxYzMmF+bYoELzoDMxp4PN/ow/ZcvY3J7x3WnouWbKIX
         hN+vupK8NG5u4HpBLPTXXpg4odlZobvM/gAnKDZKe5Erqqjv9KzxJP25fxEcnoqzJbHy
         8v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791667606; x=1792272406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
        b=pyj7lXUCpz2fMlKVFvAFrWETF1Bbfy+uvf7zkPcjD2M0oU0nbMHgQ/pL9CM7wM/pnZ
         Bu2cdobUUJf0XrUAQkKHxG9aoE4/DXdwaLw4YR4Y7pgYREUAmxQdNJtpDGhO6FJkjqdq
         zoUGlgwLC2QhtgtkNT5fwfRRcoMifKwTWaTGIqNp+dwNi9Jp96GhP/AyBAQIaruCel0w
         jSkTt8EhsMvUfUJelcAqsZXBRMl8a9rYspMUP93HhVe8rxowAlRY8Xr+qH9baxmXoqHx
         oVelVBEY1nVXo7Mndd4tPKn06YTiYuiHSZ7pwVann/RKhOVmqg9oMRSyhuBSqoa9HUsj
         buMg==
X-Gm-Message-State: AFq9FYJjrsadigqXTAGT/1MzS2FXAgsz6ObedsXoak60keGSorW84/Rj
	Z2jz4qWXKe645y9wmYiReaaUDOiDi44aMS/7A6tihoYDCCzGTRmfT6Cf
X-Gm-Gg: AYBFou2VN1aDXtiv8E1lEmv6lUCS3xvf/Era4z+sZuXDjz75BpVd20Ft4UchIIYc7Oo
	Zi3VgTNaGQ9i272I5zl7G57YYBxyyeeppv6I7vuQ5R/mv++hjkM0Tu1AqOIBNlY5qnkl4JtdCLp
	OuQsf/FFnqLIvsvDcSM9waVVzEHG/gBk3zLfcrohe0OaCMq6uQrfTpmYLavaNrtF7jtO0QkAflH
	ETSL1t1NYZYXZKb3RTDtNlGqq++UJnDwi+gE1tFGConDlH018eheGdNwSMvSO86rBse0FJwkIDN
	Iq7TqyJ2qmtXyg5M2+AgOYgYYp0cwZwYUMc3nQPPfA1X+CgFT3eWSsrh4uAAZY+V1ssIWz80b7S
	JuTy4/Ec8vkK4t1KB/D3QznuGXU1jl8yiE34r5X469A2XbGZT2abjbJ+bCtziSPLxZUB3w9OJwc
	LQuOI3hggXr4FuuFNjq2jXpWN9aqmfsl78weL4x/o3OWdSL/R2D9w6EaORSaTSqW0vg5C/0yia5
	MyUkMlV+wlG3+e/2KZv9+oCqsQMnCLt8THlCQtl/9sKTG1t+WcTsNrH4uH6WXkL7xkcZHqReHcZ
	tHbCIMn0ZyWgGhyn4cEDyAtiXTQvhNGTlzMqXysdumyGPwZNB8Hxgv6ggokzPg==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr8056240f8f.3.1791667606295;
        Sat, 10 Oct 2026 14:26:46 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ade914sm9978673f8f.54.2026.10.10.14.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:26:45 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: stefandoesinger@gmail.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Sat, 10 Oct 2026 22:26:39 +0100
Message-ID: <20261010212639.1662820-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
References: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_142648_574900_26F8E2FD 
X-CRM114-Status: UNSURE (   9.40  )
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

Hi Stefan and Arnd,

Thank you both for the feedback and guidance.

I would be very glad to co-maintain the ZTE ZX platform together with Stefan, and I am happy to take responsibility for testing and maintaining the ZX279128S SoC and hardware support.

In v2, I will update MAINTAINERS to combine this into a single unified ARM/ZTE ZX SOC SUPPORT entry with both of us listed as maintainers, rather than creating a separate platform entry.

Stefan, take your time with the review. I look forward to your thoughts over the weekend.

Best regards,
Navid

