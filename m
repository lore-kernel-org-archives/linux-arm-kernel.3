Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6291C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=; b=tdq1FhohM8fSaV74GBLea5M0W6
	YtXomHDrEzo8P1DvJBu6XgMc+2s4bRDxQHLeEFjRiKBxb80haaTfjG923jcCAyHesnbMMjmQv4Tns
	6f/Y6qp32wcv1x76LN8rnsnOQJ0e9+iuZC7nAh6Q7kuyEkWTP6gxWlb95jqGmS9k1yTQzglc8Sag0
	9+H4hNL7FJWH06ItlLc+BsMvKqg8HnxSs6j+e9/VDYlqPfrjYOAb3pQBeLzf96rZ5i8FfhZu5Wv1K
	7zoi6pjreURHYkNYQ/V3YkYPBy3qiD/c8y8vhmIFH+yPl6X+mTcNftVb7eX6DYCrFqlfq/wwELHo/
	RcXypQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaYU-0000000467g-27TU;
	Thu, 27 Aug 2026 13:54:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaYP-0000000466W-2M2b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:54:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ce98cb8165so12137425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838845; x=1788443645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=;
        b=Db0g6xKZhogfEIwb+DRxqfMHatOh1Qwf2OUNIps05eZgYEMT5XGMOg0oOolmpJmemE
         vaRsKV8OKodQyZSs70P131oqjtisbDED01GzsJMw/Pg9mIdgZEdp1j9mEb6sPCZIwVlg
         QISzEbMGY9M4AB7zkLyzGJLDTEAg0dqo0PsDGurRt5BH5024f4HVDlVaS0rizmz286I2
         1Qy+jQP6vzgrvt9ZtTZbf5XtI46IFRWD/igyGP4T5lPcKjMhpgXLqyEI/uDah0QPHbfj
         m9vWWdjkx4MaYjEWhL7FcIXvPQe7Vp2R15PnJxnJ4bKwz0ZCzfsETdZPV8dYy13p0COj
         5FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838845; x=1788443645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=;
        b=FZJuf4ROTUTWkqBFejwP6huEI15ZuANKFyl4y1/5fZzVWant9vfkUt8DA0aSgvFYbi
         QMWGuPR6QHtbibhDFTjMhoZR9VOaqse0JKUj3op2/JYjDSbHdTbwyxXJ1yjYxKYYsGH+
         bZHAqH/N0ccxb4CkkYkgdp0EfcOEwbQCKOopNdj8BODpfHU6fnFW4Vkg3UDFvFaXSMZc
         mAP96UuaFXCSyiCr1uXsclbX0SBp7NhKzzJO+PSEcs43xRYtFCC2lp6HYQ2euGNkcKzT
         h0rRZFTPz+UbLIA+KxB1PTC9VRajrMFq748jebq8RYOChaj9WoUf9yP0sl01TwuK3TB1
         seXA==
X-Forwarded-Encrypted: i=1; AHgh+RozEmZK7ploPbI+MbF4ol3sEyNRj8mC0sxK2AUaj6rG7fYuIRwPkHZu19WCVRS2IIOzij9vFf+6G00Eyr4l1P2p@lists.infradead.org
X-Gm-Message-State: AFuF++lJ9edgyXYvCXE6WzkWxeNUpui23ov4F9jpXAStK2dzIFRnQy1p
	zLy1Jp+De2CgNK/pwm+SK4snvEUHnimDlbgJ+Wc0wuZXPDPI8aCeYpSW
X-Gm-Gg: AR+sD11hwrVV/oULixEYIo1a8rcYvVv/JyLV7d+Qo0KJwzQ1KVhdNtyMFaAfPWhusQ7
	9Aligbcir24dyQS/KQv2+W9Hpn+Gv1TnSLvkIZSamJu43fTfvvwXcavG1pRTKo0afOVRWeZ5ZIj
	ipzuTLGo4wkanNADzoiQCug8UD6TFGulH6T7EJEMPgNRmzKwudZvJQYuJpcgzX1gMBUw2A27f/8
	+HsTTA3tzOGfQyoCmvWuVervLkuobRmrUY3UXHdhwsmQRjILc7ZykuHBkyPALbjKPYkd3wI9XLc
	oDB5uaSAUATOO8U+vWunaaurTk5c+WvG+JZxBTEPJ9iElZpowqta4R5vNO9VVCNfnA03YaWst0W
	d7q0Q6bt9ctRUWrI0SkhEgrIhskVb33M8r4PZs165bxTULrkuEoyNlr834H1fTbGSsj+hcixCMJ
	4zvmOgfk3+H8yvr4OyBjPHb2Tr5bdr524UysWmMzDW3RqwUT7imOvARtDt59nmxPoQfcrKcQkKN
	v2Vf+LqbY4V6A==
X-Received: by 2002:a17:902:e74e:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d72600b801mr85038015ad.3.1787838844476;
        Thu, 27 Aug 2026 06:54:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c34ac6sm17479885ad.73.2026.08.27.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:54:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:54:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wanming Gao <wanming.gao@mediatek.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wallace.yu@mediatek.com,
	Jarried.Lin@mediatek.com, vince-wl.liu@mediatek.com
Subject: Re: [PATCH v2] watchdog: mediatek: acknowledge pretimeout interrupt
Message-ID: <5e1793d5-6c78-4372-872a-069fcd99a07a@roeck-us.net>
References: <20260827092616.2724197-1-wanming.gao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827092616.2724197-1-wanming.gao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_065407_707395_585F422F 
X-CRM114-Status: GOOD (  12.64  )
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

On Thu, Aug 27, 2026 at 05:26:12PM +0800, Wanming Gao wrote:
> The MediaTek watchdog pretimeout interrupt is level-triggered and does
> not have a separate acknowledge register. The interrupt is cleared by
> changing WDT_MODE_IRQ_LEVEL_EN and then restoring it to its original
> state. Without this transition, the interrupt may remain asserted and
> cause an interrupt storm.
> 
> After changing WDT_MODE_IRQ_LEVEL_EN, wait 70 us before restoring it.
> This is longer than two 32 kHz watchdog clock cycles, allowing the
> level change to propagate across the clock domain.
> 
> WDT_MODE is also updated by the watchdog start, stop, and pretimeout
> operations. Protect its read-modify-write sequences and the complete
> IRQ acknowledge sequence with the watchdog spinlock so that concurrent
> updates cannot overwrite the temporary IRQ level state.
> 
> Signed-off-by: Wanming Gao <wanming.gao@mediatek.com>

Applied.

Thanks,
Guenter

