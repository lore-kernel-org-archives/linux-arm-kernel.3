Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33355C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1Ju9ChBoPJtQqkm13X9ek0t/vFqTZS0ihzaKbzH1mE=; b=IlCIFS3osqnbwPiKItpKoDyTKQ
	s9NBkPPIP8el6A5OB6jZO/AQWIfXxT+LqPYbvh7E5ZQcEAl6PjposUyv1kCv06DyZ2cFHzsOckGQb
	b1Z9pKDbjbbpBOXtDvAlKHz2SJtMRFP8tJz8OK7G8SLRXXOovFVQia5jMEcVc3KzcpVp41aIWuncM
	ktBeyq385ywVPb4amUgT4P5ca5Km1RCaW6eJutj9K+frAh7IY3/ouWUuZh4CflfzM+JBQPV41rRBH
	21dLWlqd7U/6nwbN+qHOSc5YRnpJo/cdTm8Q1V4WpN7Wk/3j+2G7Hvc7gAPpentNXPTCGdZ5MAgEs
	7E3ym2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0sy-00000000DfV-3rrP;
	Thu, 22 May 2025 08:02:40 +0000
Received: from out-14.smtpout.orange.fr ([193.252.22.14] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0ie-00000000Bdk-1v6Q;
	Thu, 22 May 2025 07:52:02 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by smtp.orange.fr with ESMTPA
	id I0iWug1mepEs6I0iWuNbkA; Thu, 22 May 2025 09:51:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747900313;
	bh=K1Ju9ChBoPJtQqkm13X9ek0t/vFqTZS0ihzaKbzH1mE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=sTGilTwv7vGdfmPIkqPqsGmqnJeil395nO7Z+kHwbhmTzsF7qyFjO4znK5A8URi3u
	 yb3zkm7EdkgIV5+C23Dww8jdH1ST8/innWl5VRlOQzzX0Ki62vO1YSQXfq87Gb5Adb
	 hOApvPCWNEQcuTOMjmg8xJfvEm55YsUh3VYFsvKo3g6tVGUpJTJoqmpeBcRdHVTl+1
	 trufRx+Pi1ZszjiCmcBaSFq+MnznMdwO4hqeRdiRNBgVLvnabxquc/tq5nByDCZMzs
	 7s5y7sZaN3xiONXZwWsVTQYTeOFsFpdtxW8UdkgKi0OpYogS/QFZKcWcd4hc71A091
	 MzAXW16/HSKcg==
X-ME-Helo: mail-ed1-f47.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 22 May 2025 09:51:53 +0200
X-ME-IP: 209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-601dd3dfc1fso8984711a12.0;
        Thu, 22 May 2025 00:51:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ3XMrsbjyJqmlhaQpENiSPVNONWuv83ciCdTQlhKgDgmm1emztplbeX4gzNfrqw6vgbAa+lWhf/HRcyQxZ2zy@lists.infradead.org, AJvYcCW6Jc0PRZEyMphV9K9zWoZ2b0j78BYUn+5/fPA1T61xuopaK4pt/amv4gQ+vegF/dd4eQXATmAHbuHRYTZmN1w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyHbDnVL5KzlOw34rT0IbLf00lQp8ZZnJhPBi+u99yEoVc66CA
	CsGV3L58c/1Jm6B4uDp1Nr/xF4JSO9dJO4tZIIOVKW/m5D15FMtbVDrczpf5Bt+UiO79+LZiTfl
	lzFOIbMwf8vQ8DHMXIPPB2JRl8SWLIEE=
X-Google-Smtp-Source: AGHT+IH+G1RV6f4XSiIEPdRrb6TPdOE7pGKLKdSwxOPEVBL4YFwSKpBYuEYJEJFRYIUgbOU8zKhMjLiGuFzdQ8+OFcE=
X-Received: by 2002:a17:907:7252:b0:ad2:39f2:3aa8 with SMTP id
 a640c23a62f3a-ad536f9d574mr2255053666b.38.1747900312547; Thu, 22 May 2025
 00:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250522063232.2197432-1-zhangqing@rock-chips.com> <20250522063232.2197432-3-zhangqing@rock-chips.com>
In-Reply-To: <20250522063232.2197432-3-zhangqing@rock-chips.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Thu, 22 May 2025 16:51:40 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJzR6ucRnCHFq8ZFRnznRsFYq6BMQY24aaROJMLWigU4A@mail.gmail.com>
X-Gm-Features: AX0GCFswcIk3OPc4Qw6f7CtNFw58HMRmuvPUjxlDYToAYSRWrO6-0BPCSk3B_vg
Message-ID: <CAMZ6RqJzR6ucRnCHFq8ZFRnznRsFYq6BMQY24aaROJMLWigU4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] net: can: rockchip: add can for RK3576 Soc
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mkl@pengutronix.de, kernel@pengutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_005200_915077_EDB5AF43 
X-CRM114-Status: UNSURE (   6.42  )
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

On Thu. 22 May 2025 at 15:38, Elaine Zhang <zhangqing@rock-chips.com> wrote:
>
> Is new controller:
> Support CAN and CANFD protocol.
> Support Dma.

Please write a more verbose description with proper sentences.

> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

You need to break this into several patches and several files.

You can not put everything in rockchip_canfd-core.c. Create a
rockchip_rk3568.c in which you will move all the already existing
rk3568 specific functions. Then, in another patch, create a
rockchip_rk3576.c that will contain all the new code. Also adjust the
headers accordingly.


Yours sincerely,
Vincent Mailhol

