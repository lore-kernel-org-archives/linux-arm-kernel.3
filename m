Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C7C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz31B2dhBshUWYNwR3Q8xs3ULxEyjpdBo/IUGet1XKc=; b=LL90/fyshvmujdXCflYEe8Urp8
	jLiOzs3W7Xcnmy+2TzFfDKl5hAIFydpkUlMfaPFj8anmdIL83p6fIGwlEq7wp5q8MzJxgtCjUlb3+
	InnGW/NuYBaI4vPTt6Sqc4sUxAs1Q7dbuwzM9Od4TBShdTB3pKt6MAUgTo1SIZJIbfdCQhVzvOffn
	Q9a2O3lOmphQaF+NoATnOImIRAGLAS9X1TxKBb//Nq23bs37nbqXrIhFET34yZoE6kN4SgIx2hAKY
	7WUnFVSonej0Ts01oldZklykZ3mDJe1kIj/rVjVee3TErjLPE/BaPqqYqcUJiR4b8V6agWALN3gkx
	3tOoxRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMj5-000000039wW-0cZc;
	Wed, 26 Aug 2026 23:08:11 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMii-000000039VG-2B8P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:08:00 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-73720e58dafso868130137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787785666; x=1788390466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz31B2dhBshUWYNwR3Q8xs3ULxEyjpdBo/IUGet1XKc=;
        b=MdNPmc7Q8cjw3S6DRLFCykSRk1vf2+KqRbK3AMg44NRSAWDDUwmMBB8+/MyLLMqfxj
         ygSfkHpWKMrOWzPH5ZWVIBsWcHvBGbiDdMyN035fSuT56EyUpVNBZ4l536NM7GmGZv3Q
         jmi7SeZDRV4sMOaSxQMuD0g6OUo0FgKl8vYIV9LefC827ALgJ87cs7WbsG5HX/UboQbv
         cbAKRVrmqQyZReA156DtDDGj+sapnEijKoESGns2CBVvo3Rg0Lb/s82PrFtGlqTbWIco
         736ZTEF4dFkfRimhh39yvD3a/rxbT3+yYZYMAwKfowYWWpP2GB9/EKKaW54X3D7kz33d
         nhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785666; x=1788390466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz31B2dhBshUWYNwR3Q8xs3ULxEyjpdBo/IUGet1XKc=;
        b=iPuBmy3aZmfoq7tvhxE9DcCoBjr1N0ewfRCkpJvqj5EUubWRXTYTJ++Um0uTPYaM+m
         KpU9SMHjVwJM43hKYtqDCDUsRIGJp3La1tvTiGfjS+ER8lEiy2QnHL+1A7479cyVs9Z+
         p0d71snp3QLioadMadKQPaOSd8dX0mo4MSjAvZtOuQzyNy/eieFYuVEUslS8TwjUOCB9
         8Be0dXVAeIddV5BH6IjsLIdV6A5JQZFOgYf7JxfrMKS07Trn/txc1pWeEOW839snjPMo
         KM9wsH6I9lP/zT8apRM3AcraN0yDH8qERbvJ36/J/UrGqV4fbPkO8Z1Lw1HJde4dQyua
         CQag==
X-Forwarded-Encrypted: i=1; AHgh+Rr9ROhaGQJY+1Kd1zM03UDU9DmF1olWQ/Au40H7DiApk+IHmKlKgzQhYdiLPdPC1CsmE8DgLYS/ZEMKNAkhROtV@lists.infradead.org
X-Gm-Message-State: AFuF++kr0CQWpuZOtDHpCSmG4smpm4TVAu6RtfgguUkPs2VWk1lBDpF1
	xtaDFFqQP5QsKk92jUuUUAwfL+8Bo6AgnlhHLw343jnpgxCXvbkBBmHO
X-Gm-Gg: AR+sD135VDmOYa7Qgw3DVX6TqZjZiUvV8xWeUAKfQRhGPBXIxOzD52bp2qqzAq5l/xT
	bKDwFm0ci6vbOdORoDZd5WhfFzQVSAPbdgnF64UhKXTeBhmNLn1UslUdlxMwAieFvqt54YBqPP3
	q4UoqMfIO74kwiPwvK3tmVc00MhYrhsN1ALYSDgyEpKrlJzPol+n7HQuSHNbo7mrtP2UG0ZQp6m
	LYJGgP9DCt5FiTC6rKOk+fbhXOgF3WvQ1VlF5t6sctx4XXdET772Xv7HZnDWRiacZrN7vrEbFpz
	j04M1So/97obVVVMDJ1kyYA/hgR8+fuQ14xTRJY3MELeY3Pi89w4N8avl03AQ+spxRVmp2m2V+4
	zZoD3CBZvvmCglTz72vSK487Yosj9Y5wYJUpLYamlfQICc3rN9Rqla6Eq6Jb1vIZpHurg87bMwR
	Xeoyj5xDtTGQ6KykMQlTZgx+Fu90v62hVcHFP0iFLFP+jhD1iQhNt361elI0tqcatgwvQ0wnngJ
	+eDaK0VWfdhThVoYxoyTS+g1sQzu5KE9892d6YksqI457FG06Xbo0YaOwuKe9Gg5AbsKy9GpS63
	GUO+dZQ=
X-Received: by 2002:a05:6102:162a:b0:77b:28c1:210e with SMTP id ada2fe7eead31-782bf9bca7cmr4267611137.1.1787785666335;
        Wed, 26 Aug 2026 16:07:46 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe0ae5d2sm3311701241.2.2026.08.26.16.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:07:45 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Wed, 26 Aug 2026 20:07:16 -0300
Message-ID: <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160748_706793_C17B5A88 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Andre,

This series no longer applies to mainline. Patch 1/9 fails on current
master (45c13f3f9e3b), for two separate reasons - one of them from
outside the series, which is why I am reporting it rather than just
fixing it locally.

Applying the series in order:

  [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
    error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.c:1521
    error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.h:88

The blocking one is your own patch 2/9. It merged as 42e06688c6cb
("pinctrl: sunxi: pass down flags to pinctrl routines") without 1/9, so
sunxi_pinctrl_init_with_flags() now reads

	pctl->flags = flags;

where 1/9 still expects

	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;

as context. A 3-way merge does not resolve it - both sides touch
adjacent lines, so it conflicts.

The second is unrelated to your work. 70f8915ea4e9 ("pinctrl: sunxi: fix
gpiochip_lock_as_irq() failure when pinmux is unknown") inserted
SUN4I_FUNC_DISABLED_OLD/NEW into 1/9's header hunk context, and added a
fifth use of SUNXI_PINCTRL_NEW_REG_LAYOUT, in
sunxi_pinctrl_irq_request_resources(). The header hunk merges cleanly
with -3, but that new use is not covered by the rename, so the tree then
fails to build with an undeclared identifier.

Patches 3/9 through 9/9 apply cleanly once 1/9 is resolved.

Static reproduction only - no A733 hardware here, so nothing in this
message says anything about whether the series works. I am not sending a
rebase: which shape 1/9 should take now that 2/9 is in is your call.

Vinicius

