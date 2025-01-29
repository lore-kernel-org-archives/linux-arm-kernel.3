Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1FBC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 21:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mxRYzzqPEi81Yfzc+wDSZaiIM1NQOITOroGLR3jJeE=; b=Y4jvtP7pPNVUljRTZcHLnYh9Mw
	jN7ObUzXmtvsG+osSjyg22xTK9YLUt58w+g/qhYRkt9KL/QHfSUeVzfOz9KizZB3Bnsf/IZdlz1MF
	lsNVySxVrUXcpur/+oH3t2OZL+w2oNnAbE3T2iRKVyD6eopAPpHZWTCk4e79SWKPGGdlqXWz601mh
	J0zHuMzCQ8uBqriqsWnOaxhwogtzTjA5v14Pv7v6GghDnSVMRQLZKtnbIH9ojRlaCY+j5KV0z1ZZj
	NBGw5ASwzZXjuZdvFktA7DWxLjJkDgO4Hz0Tiwm+A/rKBpT3wSIvZ4Sk1SpHuxCWXfaVANyeJ2XX+
	nvvZncCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdFgX-00000007pEO-2qm9;
	Wed, 29 Jan 2025 21:33:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdFfC-00000007pB0-1v8R;
	Wed, 29 Jan 2025 21:31:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43635796b48so424295e9.0;
        Wed, 29 Jan 2025 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1738186316; x=1738791116; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :reply-to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mxRYzzqPEi81Yfzc+wDSZaiIM1NQOITOroGLR3jJeE=;
        b=EXx424ZIzH5L5UTHtuZfMwNB9Ef282B3PMM84oxnw0uv6h4XK1t4rA4ZQg5wkq0MKS
         f/k2fznK9hQBswyG07Z7QP7sOvaZz46vbLDHtntZ2fk4IHBXEKbrzYzH7aAYYQhYHDpn
         Fan3xVStlg6U10zngkDvlbheNcQ0cdK8SvhJZPg92Lzd/b+EQ4N3kc+JvifjsO6JMaC4
         SWM379TkoVN+Yg67RvFfYqqkPXkGAjPpc4Wrbc0W2v6lBmPTi1ifDk1oArheJPYC0cjI
         vr8DrDSxDt0LaAC9Et1lRjs479b1XyPttnFrRed8rsX5JDpgIPW8Hm5STJllMloghT06
         alXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186316; x=1738791116;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to
         :reply-to:from:subject:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mxRYzzqPEi81Yfzc+wDSZaiIM1NQOITOroGLR3jJeE=;
        b=QD1oUCFJSUrGKitFxucG+FNgjdZDt0V7Mh1KDzmWzI+wtJdo3NQ5YKeyJLU+19kYr7
         aKl9X1N95ABxdyuGyEiCecMQYIm5KqQRxd5ecE0cLGdaeHQnRKUQ5QHFAkLucemqzOVT
         epr7RgdBmSbTmQi/7kr3YLWzVXXQSZxglSlAbGPUw7X6whq7ORllXZp3KdjCcZAACPm8
         jDUIqrP/ZCj4OQ2BVvWrTSyFknbJ8FZ6VGlO89knYxRBZLS7UFcsaJ/YvOxk0WFz/iPo
         oQEY3WRAFrtquMjVsHEtaI/44eqCM7LLGk0sNNaEJ3Y/2b7AMMiZy/cvEuC91f7NpgC2
         8qJw==
X-Forwarded-Encrypted: i=1; AJvYcCWZgw0ETWWUgSNewkSiaj0B0ctbZ1t1ErNYi1l06ZLfEAhgwaR9ujWBfsZ/jdfrPzbvK6NSnkMq+QsbhCRvflQ=@lists.infradead.org, AJvYcCWkhzZgYFEaKjr0nNKlWi1DXbuZ4WGygrqJWUV4J1bW3vMq9lCu7La5BNJZeDcx9y/OjAy0DIjRcxXdw0bCfW0g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4xY5bB09PA5Vw4IEVA+W/3ntqfNuG5IDwpkxSQ4PJPlOWa/hY
	QHUDi/2WXL+X375bzYvm8/NKzAqoO9LgmWcioLW/qIYNNGDQ5ziR
X-Gm-Gg: ASbGncv1CVmXG3iMAqXhUhEdICkM1NRh7d3oi4k2otrrsYlpWXgorr+kdpp1HPz60X3
	4g6BVmz8iwpsjsupmyb3ORXUVRawf8sNW/R/JToY7qOyKkTwJaIt6AMrL3Umd2EDrjFtWVOstli
	aqOf3hgclqkOlD6b7VKJSh/IlsItNTw29gjMyuak45D7PtRHbben3kzU+obmEfdXU9RIXGemmF+
	p1m58yJ/j/yKDnwdx9mNfN5jx5JeMeBK8sgecQzdHWqJxx8pasNWK6aZ9+s8NXXCgKyY9xpeOJB
	rT7joGASWrvOoGcPhZ2vIhCUGEXUTw==
X-Google-Smtp-Source: AGHT+IGedQx8nJF0pB4rZnHrhu3PXTi+i9kN1ECPmuwLHVbiAK9j1q7WJRyCg7jJveT7M1cRft1Ahw==
X-Received: by 2002:a05:600c:4445:b0:436:e3ea:64dd with SMTP id 5b1f17b1804b1-438e1709453mr7299525e9.11.1738186316020;
        Wed, 29 Jan 2025 13:31:56 -0800 (PST)
Received: from mars.fritz.box ([2a02:8071:7130:82c0:da34:bd1d:ae27:5be6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc51672sm34892865e9.36.2025.01.29.13.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:31:53 -0800 (PST)
Message-ID: <b1266652fb64857246e8babdf268d0df8f0c36d9.camel@googlemail.com>
Subject: rk3399 fails to boot since v6.12.7
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Chen-Yu Tsai
	 <wens@csie.org>, KeverYang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 stable <stable@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 29 Jan 2025 22:31:53 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_133158_513605_64BE458C 
X-CRM114-Status: UNSURE (   7.42  )
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
Reply-To: chf.fritz@googlemail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Marc,

 since 773c05f417fa1 ("irqchip/gic-v3: Work around insecure GIC
integrations") landed in stable v6.12.7 as 0bf32f482887, here the
rk3399 fails to boot (~4 out of 10 times) because OP-TEE panics (gets a
secure interrupt that it cannot handle).

Setup is:
 - BL31 proprietary (since mainline TF-A has no DMA)
 - OP-TEE mainline version: 3.20
 - Kernel v6.12.7

<snip>
[    0.000000] GICv3: Broken GIC integration, security disabled
<snip>
E/TC:4 0 Panic 'Secure interrupt handler not defined' at core/kernel/interr=
upt.c:139 <itr_core_handler>
E/TC:4 0 TEE load address @ 0x30000000
E/TC:4 0 Call stack:
E/TC:4 0  0x300091f8
E/TC:4 0  0x30016664
E/TC:4 0  0x30015710
E/TC:4 0  0x30005714
[   26.087363] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[   26.087925] rcu:     (detected by 2, t=3D21002 jiffies, g=3D2233, q=3D24=
16 ncpus=3D6)
[   26.088530] rcu: All QSes seen, last rcu_preempt kthread activity 21002 =
(4294693363-4294672361), jiffies_till_next_fqs=3D3, root ->qsmask 0x0
[   26.089623] rcu: rcu_preempt kthread timer wakeup didn't happen for 2099=
9 jiffies! g2233 f0x2 RCU_GP_WAIT_FQS(5) ->state=3D0x200
[   26.090617] rcu:     Possible timer handling issue on cpu=3D4 timer-soft=
irq=3D293
[   26.091218] rcu: rcu_preempt kthread starved for 21002 jiffies! g2233 f0=
x2 RCU_GP_WAIT_FQS(5) ->state=3D0x200 ->cpu=3D4
[   26.092131] rcu:     Unless rcu_preempt kthread gets sufficient CPU time=
, OOM is now expected behavior.
[   26.092926] rcu: RCU grace-period kthread stack dump:
[   26.093369] task:rcu_preempt     state:R stack:0     pid:16    tgid:16  =
  ppid:2      flags:0x00000008
[   26.094192] Call trace:
[   26.094409]  __switch_to+0xf0/0x14c
[   26.094728]  __schedule+0x264/0xa90
[   26.095040]  schedule+0x34/0x104
[   26.095329]  schedule_timeout+0x80/0xf4
[   26.095672]  rcu_gp_fqs_loop+0x14c/0x4a4
[   26.096027]  rcu_gp_kthread+0x138/0x164
[   26.096369]  kthread+0x114/0x118
[   26.096661]  ret_from_fork+0x10/0x20
[   26.096982] rcu: Stack dump where RCU GP kthread last ran:
[   26.097463] Sending NMI from CPU 2 to CPUs 4:
[   46.276364] sched: DL replenish lagged too much

Is it too late for the kernel to disable the "security" since OP-TEE
assumes it is enabled?

Any ideas?

Thanks
  -- Christoph


