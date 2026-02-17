Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC2CE909A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=; b=uEZK4+hfT7AiRxHO9xYjktv/V9
	LFf6C/QhS81cT2ZWQ4jKCBStW1a0T8B2RnIeDhsIr/P2HaD6c3cvQ6QlPchbJ9Gz/X9B1on3oYIRF
	L/aKWvbA+08t5TkBK2GIdljIMh0qQnVSOXMh99K1/NKb5NkQxCa/uupAlzX+7FPGJIKKhJQlWknVX
	Lp7ya7j6rrM7txJ2NycGu9Kjfjj6Hh9BP8OxzpiggAw7fKWMj4+6bTKNkS9EgvBAldIhdFxoZK5ir
	xI6oGBT7k+OrCZswc1Tgor0Frj/jaJ+5ajNzkV5i/uxGJvWurGjUlFj32NsMb+uOp7D1zN19tjfMC
	98Me/Ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLhy-00000008OXR-1c40;
	Tue, 17 Feb 2026 14:05:46 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLhv-00000008OWE-04Fq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:05:45 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-6497b819b07so377220d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 06:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771337141; cv=none;
        d=google.com; s=arc-20240605;
        b=TB3bMQdzypY+N4tJvZ2PedfaZd+6XvrCKhRkY+cupRWYD+Z0b3i94VF8qrlni2fdqi
         wLaEIuBJUVhgT4F+CLhseXL87X92hxhv5j65OlFhe4o7Y2pZASZ8A9v2PfN3e/thKx8o
         4rXmiIny2CRc95UmzYpNu8I4Ihb5F3hfVt0hY1He5WPMHJpxpXQUxRWlGHgJh0WMSOMy
         3uH0vV+LekqX+14/huFO9H7KVdkyXXh/AqaGcXqyKn9C5z+QscCbnr0UTAgLik/ZPx1u
         8k4FcPB03TqvCV84o0nZxfoME4QmS18Q5MJbAaoss9a4Rnplj3+sFRkbKI87lyeelEAC
         FByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
        fh=M5ZLr3fxxtMETpEf07bsRjwS0IQWq/vE8cW+rpqy68Y=;
        b=U7gNeFGUItBZxogDaxPjC7/seGRYxUQ8ajwk+sJDoD71IzQkawm4t+Owu2iUF2LZ16
         Mu1kvRf6MUNo2ynd7jcMFWa23Hxu9+A92I60XcmT+b9oRAKqCXBzoJsa/RAdaM9HLO0I
         RXyW8GvOr3axzpWCOXjcC+qdmyhqnwp1zVk5WqEzTFGcnxm7lBXk1q8/ZmYCwp9hrboW
         6iP3C64yBJ/sxpi0e51jGjNjXt9BWLOxZO421Cn70MSvxUpSPoQicbEScx3Th0fl5qcl
         7cwV2GpEC55P5XZRYLPYXEHKjP7LIc/Z/Fg8KMvR7t9G/GkQ4MaLip4eBSmYkTZM1JPq
         pJ9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771337141; x=1771941941; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
        b=jEToiA/52kZg3odX3YQh5LhzQ0tfP5rMXkvznN4OpIunh3RDsxXySzLNkiyg0eFPMr
         hD4nQaaMbSTfX7ufmm2aiVhGvH/4Dg1l+RrHuqB9foPE8W3hvuttid/+ursHtQ/uciDc
         JZiPwkpanbT/msJvX3yif5zzAIAfvLEqVm/CCLcATkoMWwMXB+61+WQpmSssknvrQpsd
         SqCmnyqppI8m66yx91Vf3BKE8ajhXw9z6Iz+qs9HUbx6Or6Va29aPMZCqgezNJzz7f/4
         nmjemHb1JQ7AY/m8aY2ozlQSITCHUeJpLUHsDLRMSE6faGddgFfDE5k0D6Zy+tdda/ld
         BgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771337141; x=1771941941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
        b=bYIhaQ9QO+DgEgknTfEOpw0XsEPFTuvnni6YzAHpFl90sUnhKD4a8kKxwNVN20rY78
         xI9a+vc/nn//8tjjHjih0kMlVZCYGRn/wgsFvO5vfxc/eBfvRxDUJCjnImcLOP2YFOqa
         zz+wCqwJsDEtkwUkP+fbwaTCPIglpLQ/XO8TsTgsSGuy0z4eyP/qitIO4bXJh60kc+Iw
         dhyGYF7WQGiUEWYVty9K+UKoa29kdK0YolnkKJ6KBX17TO0SGQ8XBPIZ0QdJGU9WnW9T
         xqZu0yRIUYba2MgEAmhL0YUKPN3BXZPsaxRvXPRqNXIekcCqU+alB7uXsI459+SP8rkV
         oFVg==
X-Forwarded-Encrypted: i=1; AJvYcCVayyOGPeTkY90b5/zMW4RQcpUEQhusFRbzQ18Evs6RagZOwljGIiL/YGUMawHT9VH3C854JcPFUf0NDSLDUi41@lists.infradead.org
X-Gm-Message-State: AOJu0YwIsBxJS+ku+MfHq64Y+2ICxAmg096GbmddTPcEUOq3GITGFvOO
	ncj2U9VMZWXFHafFb/G0dC4Lyi9lhWyrh3IMq5SLYG7BXaoMrGhae6ONm0aCz9UV/Fb5fF8fhDE
	bQXqFqIqQ810h+EE46l4D7PkJcr1Ezdg=
X-Gm-Gg: AZuq6aI/Sw0AqeomDtRc42Qms0FpC7/Prb8/EPQCMQ21CN68ovp4jZGhH9JKT1K5y8z
	XdDPWBEbARBqRh4B7e0vBmR8p0JeahAOJRMnfMVZf5fBSMJ3s+K2ok1AeE+h8VZKk8jFpxUgV9d
	ih23RN4akZ3xGPtTR3D4zShntMqMotxt8MMCkgyJK6r/JE0r9ObK3fjkeA+UHK/UuxDPiuHPDgQ
	zVwLdG5jMgHL2HgD10m4Iu/yhVKW0TBQayQB6f3NkxWNurYm1QKGX1r3WqHnDrQrFFII9RrtTq6
	+FG5XQ==
X-Received: by 2002:a05:690e:1c1c:b0:649:f09d:a6cc with SMTP id
 956f58d0204a3-64c14b29c19mr10963024d50.1.1771337141377; Tue, 17 Feb 2026
 06:05:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com> <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
In-Reply-To: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 17 Feb 2026 16:05:29 +0200
X-Gm-Features: AZwV_QiVnluoIVm_8_wyxtM9osk-BEP_4tSvKqw7PjMg4MAO7-oL-lW1MUMi7lE
Message-ID: <CA+h21hoTJXkJr4_KWtFsxUMeqOXesxk5WKZbr5GWHawAi=idKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_060543_063897_F597C189 
X-CRM114-Status: UNSURE (   9.20  )
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

On Tue, 17 Feb 2026 at 15:58, Vladimir Oltean <olteanv@gmail.com> wrote:
> To help the build test automation select the proper base branch, you can
> use the "phy-next" or "phy-fixes" git subject prefixes when generating
> your patches.

Ah, sorry, I missed the fact that only patch 4/6 touches linux-phy.

What is the merge strategy for this set?

