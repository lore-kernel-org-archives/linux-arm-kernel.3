Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B65EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJDvm2qFGqyazE/f3miZk39Ls5Z/IDZ7Dgt1XYVnHJA=; b=WmNULqZDi4rUMl9sXPDekslX6T
	+APfTGVwtHMd/YNU86Doz2f6hZRDUZ9FACBIbdcSDxyz0ln+8PFGm8OUYAgCGlTOXx5Os3EqpXC8/
	Uk6OpA2145wWSi5kwy2HBG0Q1WqM+b2YbSLX1rtNxUx/2Me6lO4ATkDBWS6pSlUJs5g9X7+9BKIir
	sR5ctEpP6gUFZv8MB5F+dUONlcrTr8CSGcEBGL861HLGYlW0cH7IfOkNRpaR517bG/rU/dpqiB3pY
	5KwzSuylRXgej2MrhC1b37C1uUkqGdSmGAl1SZdDWow5gVBykT5hIWAj766K4VflN1Zk22s9iHxTw
	D4yoB9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp5Q-00000002d74-0tOE;
	Thu, 09 Jul 2026 13:46:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp5N-00000002d6D-1kQW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:46:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493ba701891so14050815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783604799; x=1784209599; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VJDvm2qFGqyazE/f3miZk39Ls5Z/IDZ7Dgt1XYVnHJA=;
        b=kKuggUx4ujlKywzIEC6m1qtog/LK7GVopxlmDolHppzsK5gEgKItInB3GlCiOeO17X
         D4GHIHqakRDlxnPl1bS+oEDsY4Y+OgZHeArZuVLEAA6yka6Ah5OQ2quZAz2mJ1hgurN+
         mroo9Q/XKi/TXn+Q8Nlab16oisjacILKRDFUl9sKh3wQIS4hbO9tbu8ci9mMa3vLkpCh
         6LbC0tN5Onubvsgd8qE82E2Z3Y1KxfLWcgO8y2IKkTF1tVawVfS87shVVlcImJHDC2BU
         /oH57G26DbkkDl9vYBwaJvmmIV53JZfKp8RwrbG47SnzdsmwUiX+OJFA87NV90AHCxl/
         j5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604799; x=1784209599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJDvm2qFGqyazE/f3miZk39Ls5Z/IDZ7Dgt1XYVnHJA=;
        b=Yg0ab6tjX2YtcHbkshvvizKg0E2k5JCIETNtJbQ2EjxT+UAn4vRVngGP7zE1L3ueyu
         aNP8aDp4m3QsPOWc7B0wO2dSHW/gTRmqHzU9xES6HC32kEaHMlK69JjRsrhQVcWPdH+s
         KGm4pwMopGHWlCstjujhYumXklu0fJ28Mkoj8DSq0VKAzvDOxrQhDLwUj+jVQJvqkh3T
         8n8NzoqBMIJY3E3mGvFZv/ufgOYh41la4vCWmDCDvQAqIuwn0wncz9v33qGsXWTEMCoJ
         13YCGNdhWVfJ1Bh/4kNrZamhrRDS0fhHVmTG/nK+44GOxHYfy1M6yESiKgPRiwMIv/Hl
         bqhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/0WKKJMoOtvLcXTmWzr4PokKBj3QpEInEi8I5cSqbEDETkP7qy7KBrwgW2H6kRvRvs7A914Krp8erMs0t2EUA@lists.infradead.org
X-Gm-Message-State: AOJu0YzLzqzkrgz9WreOy2fFMoNajaZ3eTfQxjvsu+18+z0gHOOiVATU
	lpQW3bQaS7TP2hkyXSvsFM0JmIMyUtQL4vrSkQW9jBNCqtIbKCuI7EpWs9Vd0Skx
X-Gm-Gg: AfdE7cn4xIvA4u8FyLSAJv2NPURLxws6tAXJUmvzKw4qaMlxWL92p1/QPtpAt4Cbtw8
	+m22UZBBwMKMXuBP6qEKsm8NawQkadHUrjEEMoH5YXL+Naykn81jctJR6VSOAlC8xVWph9n5dq5
	oMbcNwX4DHuLOvuabGsi04TEbMAw64gh6Q34xD/QNfHekSrZw8GVXs3l9H65qDQh4TPtdxGRQr+
	ECILk0EQDeen6IMMxpzTSzzfnvHzLP+JDMj2R3zlY7LioJQd4YdLvrH2O0o3Cri2xg3Bd2vfwaQ
	xiPAp6fRu32PYcc/aQpjEQeL/JXYTlTBwtzAVZeS7kBamgme8cKSZS/+nJ5geg7VODcfMyHv3RN
	5aXo26xePUwTWwVK2NlC8MmN21JobuMkKKu/P+s5oHbpADfRj1n0fTeYCeFSViLDI9Bzv7QjTy/
	UbQOB4V5A4vezhHRBH5LD3mcD+uWy3cw5V6JCZ1U4gEVAaG0rFWxB6kjOUB0B70+U=
X-Received: by 2002:a05:600c:4e11:b0:493:ee2b:c876 with SMTP id 5b1f17b1804b1-493ee2bcc04mr21300345e9.35.1783604799102;
        Thu, 09 Jul 2026 06:46:39 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm63149545e9.1.2026.07.09.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:46:38 -0700 (PDT)
Message-ID: <6a4fa63e.f4f4081c.1a06be.032e@mx.google.com>
X-Google-Original-Message-ID: <ak-mPUz-V4FANYy5@Ansuel-XPS.>
Date: Thu, 9 Jul 2026 15:46:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/5] net: phy: mediatek: move MTK GE SoC
 registers define to dedicated header
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
 <20260708102341.53919-3-ansuelsmth@gmail.com>
 <788172f8-1005-4df1-afb7-320a135bdaf9@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <788172f8-1005-4df1-afb7-320a135bdaf9@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_064641_455542_3C459649 
X-CRM114-Status: GOOD (  12.63  )
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

On Thu, Jul 09, 2026 at 01:44:37AM +0200, Andrew Lunn wrote:
> On Wed, Jul 08, 2026 at 12:23:28PM +0200, Christian Marangi wrote:
> > In preparation for support of special Software Calibration for Airoha
> > PHY, move the MTK GE SoC registers define to a dedicated header.
> > 
> > It's also needed to generalize the cal_cycle function as Airoha needs
> > only part of its logic (the wait logic) to complete a calibration cycle.
> 
> Can this be two patches?
> 

Sure, will split.

-- 
	Ansuel

