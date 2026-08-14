Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D22C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PU9G4zdXRl0NI31/rfDwJrFlwhd8fgXP9fxLHMqe2k8=; b=ZFpuZ/yK84kKfleKfOO+AB4mpo
	pHhlqE694CWadR5xf34EdwxV0GvTtmI5uS4kUu4K7BUV7SLDfuS9XK98HhMx31E757meABTU+b4kE
	MbrfpuRy9CkqfNvRSOlftlX6rk00O0mjySq3+QF7fs+GjeCuGRdAD14yMC+E90MgvcD4dtibyqV+d
	1OH7VGrT7vjdgI1UahfqFTkybM1DE58C3+Q+AH2IwgNTk/IpSUGeka2pFo85QGLvttmU12HF2T0R5
	/eosbSgApRziuq4IL3v3sqLam5CnChaocMUPJe9DlXHPmnvhYxS5M3FLAhifDHwYtG1UxRy5vLLyy
	x0XPLxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuryS-00000002ihK-46FD;
	Fri, 14 Aug 2026 13:29:28 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuryQ-00000002ige-1mld
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:29:27 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-698aece3d7eso178575a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714164; x=1787318964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU9G4zdXRl0NI31/rfDwJrFlwhd8fgXP9fxLHMqe2k8=;
        b=4KyXMv9AUB9+3faWxTDzJL0zOwL4Tivb+JknFhDX5P/EzAU3le7nbaZE1eq0sFU4UQ
         3F3AASiLdAN3el07yjavH2HNzSclXfDLQysL+AsYhECoCRHIl96NevaQBp6wMlNMVZuL
         G+SGkf1mDvdJHjgN/NO5FBHfxdHc5hBOQe7Lxl25GjbgXZmQss8nepBaiWcdGZVgth2V
         efFNfVuZEwJiHgxk2Pax9/iAXeLrvSau9iHPijwQdTVXPBtkGgTxHHPueDWBU+xzx72b
         LdbC0Ubr8UcI7T4ArqSBaFKN/rYHUbr3tdAZhVb9dsu+3Yv4kFwwiFgU9F59aAB9qY+I
         IEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714164; x=1787318964;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PU9G4zdXRl0NI31/rfDwJrFlwhd8fgXP9fxLHMqe2k8=;
        b=Z1k/VTtppTvnBq6norbZnBqnv7lfT2uHTUxeme6pRb3oxioMiIMk4WHWqYWDNKw4qp
         jPXcgOPrGlpNsRgY/yhdbyXPadyyb19sWlA9UIko573npJXZoPMyqTotsy/YY0ld+pZf
         aG7LbqHOwZZydwM4XMybddicad4CICOg61RukIH8bASh531MpFECAmwc0gkWN0lsj2N+
         rpN7mqDHTbzGlyQNud1nEgF/QskFM7QChmE6aRnjmopZ2nNC0UC/PTwFCmxf6Z0+ppYf
         a5GMr1O7gEw3VUL0phfjz6W4jrG77rT7+bA7AwFhdMTSuMGr+HERNJrT3mHzjh3y0xmm
         91GA==
X-Forwarded-Encrypted: i=1; AHgh+RqTwuc0U26y4NAZ/UJGKq7tiPD1CLatUo1epgeC0TNt2KpBj0xJAJKc243kbsW+N6arj6JWyCPhq2kyiYLGC9u8@lists.infradead.org
X-Gm-Message-State: AOJu0YwkI6L5vaHx+u4kosYiiDGE1O+7VGS+NVHSXkFPVr3VJnLI5cDz
	P2axXZ/s86LU5QIeoxE++TyTj5lHZj/+cl4PztG0WFum3YAeTR/LVo8ndCo+sbaO7EI=
X-Gm-Gg: AR+sD11TpqwdIHnevnf6rEL1XS92ZEx14BL/GEabnA7xbm5TLaoLtFGriw3lSFypbz3
	BaXNPahMauQa7Syp9Xzg+gNukbx8qVfgNOBTYHnLFpcJYSLBRiuM5iira7m3ie20wfOwSqF6GnF
	ZyFJysVlDYC4Fx983pX+q+YaFtMkv+Dx5eqIA/wLYfN8g38peFFbyleeqd2VfVzFx+lPWqDNP0q
	F5UdJw+1K26UCrEGl6bkbK1QQElckcgikkSwPylJzB49RYuyz8wP0bWtxi/jYCCIipjDVtH7xKU
	7+cOEI9sN7jRvgO9govC2BcXrhUxGa443VRXTHR1BA6TgtLCn5gZRNsLnj0v6AbnYVi+ZvUCnNI
	XKdgWOEySTJzEeJj6PYDfGuMhDw67nuDppXQqkjcYCeL40toS0kiisEiT+QBYWA7c6905Ph6zK2
	no/HLDnirmcO8XDgRwZEmCDTAxvj5ZljAtMx9/wTsYZ8OUoi4oMz+Dn59swugLLVFC4Tq9MFA3h
	0qUXCKWvq16iBl6zYIcc41RUKQYxlO0BnrF4GKfzoneM7MVaJLS9AM6yg==
X-Received: by 2002:a05:6402:3509:b0:6a3:72bc:7bca with SMTP id 4fb4d7f45d1cf-6a38a98619emr1635185a12.3.1786714164235;
        Fri, 14 Aug 2026 06:29:24 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:23 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH 0/2] dmaengine: sun6i: Fix two bugs in the DMA status path
Date: Fri, 14 Aug 2026 15:28:28 +0200
Message-ID: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_062926_539904_5A8D45BE 
X-CRM114-Status: UNSURE (   9.54  )
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

This series fixes two bugs in the sun6i DMA driver's tx_status path.

The first patch fixes a non-atomic read of DMA_CHAN_LLI_ADDR and
DMA_CHAN_CUR_CNT in sun6i_get_chan_size(), introduced when cyclic DMA
support was added. The race causes spurious ALSA xruns on Allwinner H3
(Barix IPAM400), confirmed by observation on kernel 6.12.

The second patch fixes a null pointer dereference in sun6i_dma_tx_status()
where to_sun6i_desc() was called unconditionally on the return value of
vchan_find_desc() before the NULL check, present since the driver was
first introduced.

Both patches are candidates for stable backport.

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix null pointer dereference in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)


