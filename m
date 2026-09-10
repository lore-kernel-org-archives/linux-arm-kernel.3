Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51BBC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0smL/d6QKu04fRHQtGBAAZuzGVVYkDUilTOApT5q0GE=; b=dO7cjtDC0CxdJZs7BrAVXAZkZG
	zL4QCWiyxwqF44IRfIXg4N2E0gjNFJqroVFM2QIT1WLsxeEBQjSnZNx42dBgltiG/pzxvqoIkiRc+
	sBWpLmtBuyrcQTBRFn9eYKGfDnWBPxOjG2F6EULj4XUrPE3WPkzYkpAQ/W9KP/Osj50KqcVwPGKoj
	BvN4PKvLeN0eC8dIh+iP4LHjVdmd7viD5viRchbRkRBaG6DFPBBO0rBkXzKs1DTq5Pl18p7e6DXfM
	mZ3lWNUsD6DVOf0G6pFHp1vlJpvK6wHufuJFDeRSGUCKsHeuWMXIwvYukz67YzYjhhRkNadqlzEIy
	umuU+aew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hbV-0000000EwcC-047z;
	Thu, 10 Sep 2026 16:26:25 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hbR-0000000Eway-3v3k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:26:23 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b0dd3e1d0so22735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789057580; x=1789662380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0smL/d6QKu04fRHQtGBAAZuzGVVYkDUilTOApT5q0GE=;
        b=obzX0IVIoqBGdjTMNqsxR6YrVJXp/htVmwVNyHyE7FeTQnN11ZmmggOFrkS4s4GI3y
         /BoMpyH5JkW0eb9r7nURDAgdOziwavFZcjtDAGi8KOMCuUpg0sKChp/qCH0DOhZEPQWl
         fQvwqS9BDIVttEnid0uyfw3hIitJRGZLt7kDmyj5QiFo/sm4wIrfiysFvszY8aTgzWqN
         QDvrWnQH7dW8OKcZt/PTix5j3UVWNX5V6xpNkyWZShCNONNDO6ToDSTZvDTspthEVsPe
         F0YKJu8ujrl+i0tYzRUhjE5oIW50yKXNgyOmSX4tH5n5ed62+FuLealil3FXbdlr5XEw
         T6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057580; x=1789662380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0smL/d6QKu04fRHQtGBAAZuzGVVYkDUilTOApT5q0GE=;
        b=s9x6aCN0sDPmp6dF8KjANPhO5Ir6hcVSa8Sg2Ti0gbfFKqbBDacIY4O1gGWK3fRIsd
         UmEURjbVddT6oqtX38rIeMlojcnuxRUOdSTcIYpm9LffbRSv2gIoTElM1LbXPceiEWgx
         18fNJamkQ1B07DG237NNeMQgkc0iNlBT6v1x798gMsP2Oxp2MEVQBYx9IZZgQIuKmRcB
         UaLusRrzKFi0v1ZpfGvi4SydIXZZeLfERH/VvCaWudjmY6IzZAibTXoPriEbw6YQdo0K
         5kxPpwsT81bv4xeHXGWDorR8Z70vo5gwX4ziXDdtRA4zLzmYac5jc3Xh9yICr4Om52wc
         hMrQ==
X-Forwarded-Encrypted: i=1; AKwUvBymd/QlVcE8szjyN8Jv+Wcnjc6SleCqII4ZYBHeUKrnvBiwVd7sO1O3LBsZVf5hInWeNkio7KQinP1e8Rr3kwAU@lists.infradead.org
X-Gm-Message-State: AFuF++lrZHUI8OZu2iVtKf/zfjUGPtpTjVO4/rCIFIwTMLubIh97xPew
	4HZDuqELe2H7nBCkvmpfa2Ni7rPNZ3Kk6a4pLw0YMOPBqrmHSWpLYpch38MpNqx+
X-Gm-Gg: AYBFou0hcZqm+FLJfMd4OC0kz5mrwzJaj8loYgmffC7sCWqqXuFmIja7QctWC5H9OgJ
	n5pWOIItOyaHjgfoGuRdpfQ4eQEZg4z5z/7BpOSZPsn6ZT005C5HugVv5Lz13JJ08Fo6m9PIfTm
	BK4VOl716kztPRZY0YUBBF/90yyyXguDMWGVYOn9embSGXNzDGWRb5gQTexBiPtDQEUKko38S5v
	N8FTwjFPGPMaQQgJyxgCsVxA3aFHPTT/yxEq7mdLUody4e1c4SN8KI6VUSQ9Mn43tcIV2f/rmWH
	Pn8mXYSsZ9mE4aB+glsh4XO91eEVie7OnoFGh68b3lfoq9ZDIZHYgxmwmCfdaANY9KkjuitKALv
	ihHWzm5Brr+6qqPihzZ0r7ODCgV8yhCnGn/T+mrGhl5e3yvVyJlD4b2IP0xgnnrTGn4Nvj0Fr5M
	pAypB/G5qB0GPSEPhl16/oCQSoKvI2/SfWmWJ4Lvt4O0brAByQ28U1WojuvGBXg+NN8f29pKiV9
	SftxML0BYsP0dI0eESPIK/7+irL6mhnxniUb40BfgTTMYPGCka21rsFGY3DjNXpzfo36HKCGzu4
	BuGa
X-Received: by 2002:a05:600c:c494:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49d010c3969mr322629105e9.0.1789057579609;
        Thu, 10 Sep 2026 09:26:19 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B91460038D48F9767ABDC4A.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:38d4:8f97:67ab:dc4a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60946249sm7275965e9.0.2026.09.10.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:26:19 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH] drm/connector: Cache out-of-band hotplug events
Date: Thu, 10 Sep 2026 18:25:52 +0200
Message-ID: <20260910162553.6262-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
References: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_092621_991230_6BF9EEC1 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Sebastian,

On 8/21/26 16:55, Sebastian Reichel wrote:
> When the USB-C state machine finished negotiating DP AltMode before the
> DRM device has been probed, the out-of-band hotplug events fired to
> early and are lost. Without replugging the display or reloading the
> USB-C driver, the DRM driver assumes nothing is plugged.

This is the boot race I reported in [1], and the patch fixes it here.

Orange Pi 5 Plus (RK3588), a Samsung monitor on USB-C DisplayPort Alt
Mode behind fusb302, on drm-misc-next plus the dw-dp and Rockchip USBDP
PHY series.  The same tree also carries my pending vop2 AXI clock patch
and the pending dw-hdmi-qp audio guard; without those two the board
does not survive the boot for reasons unrelated to this patch.

Without the patch (one boot on that tree, two more on my daily kernel)
the DP connector reads "disconnected" from the moment dw-dp binds until
a boot-time service of mine unbinds and rebinds fusb302 some 45-70 s
later; only then does the link come up.

With the patch the display comes up on its own: the same service,
running 40 s after dw-dp bound, finds the connector already "connected"
and does nothing.  No warnings over the session.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus, USB-C DP Alt Mode

[1] https://lore.kernel.org/all/20260811211534.8618-1-royalnet026@gmail.com/

Thanks,
Igor

