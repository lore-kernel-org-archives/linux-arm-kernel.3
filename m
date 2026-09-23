Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B6DC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUZaB+3UwVox3QuJ6fhpHcHgvKk5qs3qiEgpgLo0ESw=; b=JXfIpQEy+Lsj3L2j33F5g0oiMa
	5JIaCiTHsZWTUankFneQbfVCBPo0DK6G0bkSrKCFCZtOQ20FWp/aHUiJpIXjm9w/1zosLELe6k3eA
	VQhjfWkDqabNjOK7b3A4jZvGKNk33PAOL2sV8KCH/ak26rHlwyJF2+tk6q+5es8fB1NCJ1GoxuMiz
	U7GPO8xTnsGr1rvablqM7dFXY+41YKARtCll9JkLPQmgd3Pq8qKjbHApbmZqNoTfoY0DPwan0Ljkh
	DKDxnoWrs3MDuTqqOMskiQjZQ2QYukxgCN4/ao2uVDZn0R/Uy4VVKL77ma+MVV8lNkPWQZGqXwf7N
	Fp5f1jDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NwC-00000008WPd-0iCT;
	Wed, 23 Sep 2026 14:27:08 +0000
Received: from mail-wr2-x23.google.com ([2a00:1450:4864:30::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nw9-00000008WOU-40Fg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:27:07 +0000
Received: by mail-wr2-x23.google.com with SMTP id ffacd0b85a97d-482e1b55da9so111296f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790173624; x=1790778424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUZaB+3UwVox3QuJ6fhpHcHgvKk5qs3qiEgpgLo0ESw=;
        b=opH6ZD7Rg2txCkI9ciBY8xVizi17uMIH5YsZ5Ne6QYaisxB7Lf6Vy/2WkIpgJkokvz
         WZJKyvzQKWHnPqimit5/KV8ms/2jdsHP6OjFds/kuHCPyGuJEQGgXLlWQbMDJaFcjZRc
         4L7PxC4YjNPQkYUARbhzDTaljmFhvl5sWxsR9BBmULR5k/fgvMIwnI6DDQMKqiirXcma
         YdVlzWuml2NEXE3a72xjRuK4svuSj+pcmsaIOKwGR2SjpGKQrrVpnhyTPJVbPz4DNOyY
         9eyosNIrj6fUgYS6OyC8OZnHBA2A/VlUvUcFFsGCszBoVlmj38ZC2CcHpg9RSMEccH4r
         Or1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173624; x=1790778424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUZaB+3UwVox3QuJ6fhpHcHgvKk5qs3qiEgpgLo0ESw=;
        b=IL8xuMj/PyAIfSjAFsCkDNs06mkqYCiDO1NIP3IoQwmSVsoc1vzcQxODgOVajjjaIZ
         l5jSTUS69fINXG2wUyMw9MjTV76bAGGGwStMOJS8AYKGnZy9Z1HB7jfm48JS5uCXApw+
         6pRaUprEfQwJ9/Wky2QXoyiUP7qqc2krqfNkWSHghngacAkjxnR0impGa+NAM/Z9mDf7
         4KA/8F4aU81kUam/XT0A+thczZ8D0/0On55V2u1gTClPsYUW6DkebS5rEVOfOz193Gn0
         3aCC3bj4YCQkNF0rI2M1tbx/CW5R6uIaJ2U+XC8AnEulVsgjMrOdyR6c1l6K0zCQM8c9
         h4sg==
X-Forwarded-Encrypted: i=1; AKwUvBzT8m4UsH1mE+NfGScFDrvLUh2seOP+3RtxpeyI+GCYzmcJhooGYDAlogM7KVixSS7kl43rl4YbCzTaoIQmxTKi@lists.infradead.org
X-Gm-Message-State: AFuF++kqD7kjUZ0hFLbxwur5W1FJmdTH7MagAWMT5RBiuQdQQG0PIJeM
	SrSq+EA9T6cyWsEvsz+1js/G6KizisKJLuuK2zKPEKo1wYceLxLh+5zO
X-Gm-Gg: AYBFou0mJcEZyvcpVKSYkyLR4u+hG4fAgh/zdGfWH3+xPvNfU0FzTsvas3ktwdBpADG
	fb5CHHHLorV9JQc4y9uASJP+eyshmTLYnJjDsOL0Dr6mzK28pI9XOOVixgF9vDj0SLF6scM++tO
	fQNnuhy44ccIpbUrhQmRiaU8EzR8aJ6bHVw0v1MJrD01bC4AFOrOXKSlXw7DhYHlHx1spzrUJMD
	REfuefF55FU6Hzc5mMcOXG4NRCUDGMhq5X6Yz+dqCuF6/Kbx+TnSXg59n+2WSwlGyLxlzkCPGTP
	psyWHI+H8j8+46R1/7VWoya/n3vI7dBstN+VdY4dNyln+WTjJROQMXjc8bMLuqLM/tnwHfCZb5r
	24QAUUOkWjS0vINUusvkR19V2Tal3hVKLMncI4wZqawZLOmjGY33M/L8C4bQ3yQgEKLm3Hgqq6X
	Qb/OZm838E7YLOLRcLTxuZ4BZm1lFrWbsAuwrQpy30lCVcyEhu+aPPzl0WyRPPAJXekcCPAY+eF
	2Dn0SKnQsyfwbAHUUIM/pcXWPix9CdspVzDhnWDYCE4AY4Ov/J6lYu2r2pEBqmOR43A5JjP0GjP
	3ns4bavDVHZfMQ==
X-Received: by 2002:a05:6000:481b:b0:487:1251:20fb with SMTP id ffacd0b85a97d-48867049f60mr4545566f8f.2.1790173623692;
        Wed, 23 Sep 2026 07:27:03 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F45001B67602CEDBE732F.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:1b67:602c:edbe:732f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c64dsm7388874f8f.21.2026.09.23.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:27:03 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] accel/rocket: add devfreq support
Date: Wed, 23 Sep 2026 16:26:24 +0200
Message-ID: <20260923142624.15791-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arPLjz0fP_b5dseJ@rock-5b-plus>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-10-royalnet026@gmail.com> <arPLjz0fP_b5dseJ@rock-5b-plus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_072706_009755_63CD5588 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Sidong,

On Wed, Sep 23, 2026 at 10:14:51PM +0900, Sidong Yang wrote:
> IMHO, handling rocket_devfreq_init() error as critical error to disable core is
> too much. How about just printing error for user?

Thanks for reading this far into it. Agreed: rocket_devfreq_init() runs
from the probe of the core that binds last, which need not be the core
the devfreq device hangs off, so a failure there takes down one NPU core
while the remaining cores keep running without devfreq anyway. panfrost,
lima and panthor do fail their probe at this point, but there it is the
whole device; msm_devfreq_init() only logs, as you suggest.

v3 will warn and carry on without devfreq. On that path the driver will
hold no OPP table, no OPP configuration and no runtime PM references,
the same as a board that describes no OPP table.

-EPROBE_DEFER stays fatal: npu-supply is first requested there, through
dev_pm_opp_set_config(), and swallowing a deferral would leave the board
without frequency scaling for good.

All of this is from reading the code; nothing was run for this mail.

Igor

