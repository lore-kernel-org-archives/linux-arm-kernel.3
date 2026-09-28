Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FA4CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQrjkRZQeuYzERNWt13KrmtO7dHmdt8dryvfZkIliO0=; b=1p555D7DxwLpbO5+THa4/JqQtd
	xx2bpwM7fLhj2W0yI2jalY09OEFloZXI90mYFOPQJRqllXqOxOp4RXoC0xRjlDYA3BK+4H1NRtAdl
	Ln/hMzxlGKJquW1ZiG82SsplDwhmRAkqDXfNRspAd3cA3ZSYgIf1rPLtiMcnv7sgOKZj80Jxx7K/J
	4CEfFPsfWnnCtEINcZjIQzDTkDbMYj4t8ZoL7ayYApgrUvGp/PgufhFC3lXEOGHAxMayjgg52Au7y
	eWrYTXy/58rZIlacE6DnRztmkdal3I7Z6KgEpZPnZ61N+3xghj/h7wMFbAZJlcahxPl0NigOUlQHe
	HmYAzszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD97-00000000sdR-3Ci3;
	Mon, 28 Sep 2026 15:20:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD96-00000000scl-1fwo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EQrjkRZQeuYzERNWt13KrmtO7dHmdt8dryvfZkIliO0=; b=UoH5tGxhkxZLY0gCMJ2Kuif4qV
	T+i34tdV6n/s1sca/efPX1zBHYjb07NXTqvuBl0IFxIjMxWP0rdIu3H/KOMPnPAjS/jFvJAB8+NzM
	ZUflGLg0WcEUFoOHgQqRo3aVj5HzaQbt1JeN81FjmbuculkNJVhdtpVgzYpmh+fX62PFUIZjcqLEj
	EWdJSgAUG8lP+UqdPWi/yJQpQJ6mcW8hxJIrejHTEZ0DwDgx4Dgz6O4mFKIgxfiR41AAf4UozzVLJ
	IeqnPieiZ8aRDS1YFBKMJSzQKsFl/M77ujGtI15CJmCp7e81hxr3ZaVkVgISkJst7bfBF7Sb8oWP+
	FZY875CQ==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBD93-00000001cLb-1pVp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:19:59 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ec6185so13642165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608795; x=1791213595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQrjkRZQeuYzERNWt13KrmtO7dHmdt8dryvfZkIliO0=;
        b=gXEr6KaRUYkOm158npHdF/sVt3/C/gCrNWVUWJSGm8dHykrFIhowM0uwATSEUc3hIr
         qf4oJBSyd+bmfnfd/zxlMsb05vUgBIj2sgb7hSoIbLTlpvUSICh9PCoUyATWs0ct8JFD
         jWnO+Elr1vKXhNyV+Wctb0297C7e/tdEfcgaIUILKzOzueUxQmqCb5lhx9tK5IaLkhHP
         djK89baSH1dbQs8EXD+Ro9Aq9BGwVva8apIJo75ACP+yTPVU7k3j07qUPysmjXGFTaGY
         1wqAfnOBe6dV7zZEceKj5rJA4LESKgE3glY8D9+TtVRROTgpOlR7NCSlMY8RDRCG/dDo
         ysvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608795; x=1791213595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQrjkRZQeuYzERNWt13KrmtO7dHmdt8dryvfZkIliO0=;
        b=Hm7bSQaH6hx0qqg9rF7KlwDh5kDIU43ONpRl8piRA1rGq6H2sVfJzfxDZKY2KplsXI
         VtMdz0cVEe8cYoSEP+c1rl0lo8VIlK4eb3FOeNXi0ObjbqFCE6EiDZV55YETSt9FeZlG
         Ge/okCaD3EBja082DfTSRipMNxEmzjWmxME8Ti1GsgriJXLmTueIOgSx9TgmjQc7k0mO
         pk+v2aaJHDQR+GeOG92ELOHCiX/p7Q1iJ+G+Q5c9uyhzEdV33P1ypm5D+7/XuppU3j1B
         KgIsxUUAmfY7xj/9IwyfRrYV86JinqJtY+7wXCebZxw/3v4u53OlI9KF/Ot82xxpdRyV
         E31A==
X-Forwarded-Encrypted: i=1; AKwUvBxcVZH6EYjVUeak7bPB6srx54tKva6qQxJldt20xqCq2caA2/qOf+YmqX/vMcHuq61sN2NI4D66MKnDq5r/KvEL@lists.infradead.org
X-Gm-Message-State: AFq9FYKHf0dpzPj3Eo2agF6maHQx83+cf7vxdx2bqJSiuOsqdqDacalk
	4PlBGhNeD3m02yLyUPJMELWlVKOC39XsVvkpScYrxbkv5vXdDLPNuvmA
X-Gm-Gg: AYBFou1DdTC2MHVxz6jI5Q5TnOixB2kWlRlj3Inf862jg8EjZ/UnNR7Y/CtpEzVS1h7
	8Sfzfwtl4h82zuBHtXvSFelH2m00oH4QiQQOh4yfJYn9jzqdHNGUGa4PunKsfH4PNMY2CgRycL/
	RCo/8gJIKDtxcFOrs2/CNxnTO+qbmWqQ0iZZZxetAL5UzL85bjs6M0GFnoxPwNWUATWF9bSzasH
	0rDr2gbIdpSHbyYTQMZUOi1Ajy8ikeuqIdKZmUwaU3MGnhCJFS2fB11GLLjfKGwPqH8Kax9kf7n
	pg2A2m2dzCvUCMyE896ZDKeuJSQsv16v80+AzNUYOsgSbsSj4dD5O/zJHnpZ6ebcONDkS96N6GH
	byv/q/XuI2FjYns3mmzoHryh9WBgsrP0xSQ1pntfujET8rVwDyWRNXly46oZiTO78VtajV8dE2T
	DTKjP22gJamiLpnejmKt6ASINbm6QkmHNrqlr1nYNHFvVSJdpY/9oLe8o3HjT5qxSWppcyE76mM
	uIYcW4IcajFTeovqUkzTKe4J+Dz++QSfpN65+NN7arprpIN5NiSpgtv9CnIqsKhNfy4YzQF2Muq
	FjEIRt0LsXBW4NYdDOF6SYXAsyzAlP+o7fiPC4EjG7GFDVzrd4TSH5RVv4Q=
X-Received: by 2002:a17:903:1987:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2df7da68a41mr101388085ad.0.1790608794891;
        Mon, 28 Sep 2026 08:19:54 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91423df7sm43558615ad.43.2026.09.28.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:19:54 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-api@vger.kernel.org,
	Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org,
	Karel Zak <kzak@redhat.com>,
	util-linux@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Mon, 28 Sep 2026 23:19:44 +0800
Message-ID: <20260928151944.2686626-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_161957_609618_874E3276 
X-CRM114-Status: GOOD (  14.48  )
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

Hi Kairui,

> Just like we already have a "swappiness=" parameter in the reclaim
> interface, perhaps adding a "swap.tier=" would be better and much
> cleaner to achieve the same goal? Based on Youngjun's work here:
> https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/

Thanks, I think that's the right base.  I tried it: on top of
Youngjun's v11, a "swap.tier=" argument to memory.reclaim is about 40
lines.  In a VM with zram at a higher priority than a disk swap
device, and a cgroup whose tier mask allowed only the disk, ordinary
reclaim in that cgroup stayed on the disk, while memory.reclaim with
"swap.tier=" pointing at zram went to zram only.

What it doesn't cover yet is reclaim outside any configured cgroup:
under global pressure, a cgroup nobody configured still reached the
zram tier.  So for v3 I'd like to add a system-wide limit on which
tiers pressure reclaim may use, on top of the per-cgroup settings.
I'll wait for Youngjun's v12 and build on that.

Thanks,
Matthias

