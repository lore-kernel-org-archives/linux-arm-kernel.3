Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA1DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0C1e6ZjdL7cPakdNxrRlggTVin64kjut7JVZDAb140=; b=m9+IOT2wPc3TyXA2SnIxzQxt/+
	Mxdetm/BJR46BEBGFjLZz5jD9HCkdAqYgeezRRbWCApCo9lPb39pV/xcLZ7jaNRfFSgjKhyUXoMPp
	9X+HPUyKRpckbOsjUaFwNQZPusbNNbvr79v7Lp5/StEOQDeJuHK3Hr44JpOTlcuClrTeKD9r/wDEF
	TRB4i85WnEBnsdQtxM3aeoPh2CRwR/+Ty6FrvjQGzFDNj8PHLEtnSwCthua2zjR8ofB09kYiN7kHi
	uS8XtXqbUcl67V3R3QHXADUjdKgNKUkmFQoNhmGV2etFThOT+lI+wEgA3HVpOJKOpVFzI0thiWg3j
	idMmnwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaf3-00000009BZJ-1IXx;
	Wed, 19 Aug 2026 07:24:33 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaf0-00000009BYl-3JAR;
	Wed, 19 Aug 2026 07:24:31 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id A84B01380316;
	Wed, 19 Aug 2026 03:24:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 19 Aug 2026 03:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787124269; x=
	1787127869; bh=G0C1e6ZjdL7cPakdNxrRlggTVin64kjut7JVZDAb140=; b=V
	fIsNgpjcWEvoCHm8wvtFwR73MHwY9jvlh0ktvLSh3EJ3qRgqosUCFyA9IILRJSOh
	txVjq0vCx70PGxJX4jhfVOjq+1l4zFWfty9htaNn6t4G1p+CclEd8NpnPemrXcp5
	SwmccIS04cEguoFh7diZKxx6DhdYOtEvd2pjwpgr3JcrI9OpNk7gH1BYb+0GPdO3
	m4iWwvdGD101mMMKJJZMW7WA/2xk4fQpsQ5pW+HKQOLdybnIHB8RMBk0170683XX
	IHPQbkCO7wXqDpnrChPKCqTYBNM5gb4w7vOCqDjtr0VOWOK0jlL/dacyKtkTxjGu
	VILYQfUuFkkWQr2aDMcrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787124269; x=1787127869; bh=G
	0C1e6ZjdL7cPakdNxrRlggTVin64kjut7JVZDAb140=; b=enlEApicXhstIG/U3
	OP2t+vaSYrqDv6GuCiLtGp8BWoqshScvjEbO0XD84TvjHGggLiLCUsvgw5BTERnu
	ENqATpVcNO6zsCjgHIvn+yYHYm8epOqfsGh3LGnzCBj/eeYbCSTS6kkKw4v2a3sy
	h8OPQvjufAgi4hCYCpa7KLUnorzcedjqs+pV178FPLrffTReOXtD8uzltP5jUKyA
	+18QiDVy3L5PEK0/208vpGeQHfCfGVRdbpgfMMy8BiaJwLztgbAxGfB8alt36Mbs
	3vNYEinp9cawH9CgmRb42HYXb4X196U5c0ErbGkhJWheTikbHjgHnVjeFxeyjQ8V
	ejRLw==
X-ME-Sender: <xms:LFqFau76oeh6qQXhjNUFVm85iuqqZVdiVwd03w-X9D6W59j9fTV0Tw>
    <xme:LFqFagG8Qw6e2DV_i9N9v9jJE498osUfNiSrvhCjgwcv_ptUEz-ZzdJWymHm7TrDC
    cXwbSqDm_OvfPqCU1nAS-93-ambRXxBIK2RJVsqfDHrcmhZG2UBkQ>
X-ME-Received: <xmr:LFqFapC0JqbkjevxrPSBKs3vH1H0jQRWhlwAE_mHAOXrzfALGnLsorPPshRinT5A_RVvYyyuKA>
X-ME-Proxy-Cause: dmFkZTFLR/dnNZQt84OlycGQ955XSt6mLsiPdxZ38PLxh1zGK0IjgtpTWWMqr0dq0XdJRa
    ZUGXcrkDsG54Z6DBErZW+H5kJIXWv3ZaanedG6Iu5O8PGe23WRs0uci+1//YCH8q0uN6Dm
    xgaWJm8zd5pYVcnc44ckoaevOmd7lyN2EbF13A+Bj3Jte6hl0CbqH0tYrDv+90P6mypksv
    oEg6qSG33YxlvU+cDs966TYxwNOg9eCuJL3q7b99IfjytW50H7J5V0V0JgBGxgevl9kjK4
    N1sQLtAGIfDgkX+Y9hlRp1Gwh3s3/FoNLEa/EUbVF/9sVNZgtX0gKHX5xVnkU2s4Pr/JGo
    bGve1tAYxrl8urz+0MUUbbVLQsFYqOqv3FH0qWmyP7jc9kkrIQDEFCqy7reBVnL7a5fw4L
    0DytQGIW6KMz6AMlXn2R266s39qeHwMmBiCRZZHnUB5wSLmM0eVwJZbQi89STxt5bbF3K0
    B307bTlCsgnWUERZooMSU12OptV+i8+8Kpdw7besL9QVJnP7H2DLZIEvEuXBGBr26PiJ4I
    1CdBR3E9zMIVNeFj/XoUO6Nv7FOpVeGlYr1SOFyymtq7xbTfvMSE1X3Fe7pJGfaAOuqjOE
    tS18tWkSDM9TYJKZ/qqK++xjrtrrnJ1XEbruaGBnnvpcQ6pemPfvakXQ0rPg
X-ME-Proxy: <xmx:LFqFalzH7DtQaK5SX1XjqAsQanL8wRZCkMbdk_VGJMhp5xMcH9mJyA>
    <xmx:LFqFat7NC8drtubeZytYhyDanX5jGsgKJF8UtMmYWu-CwBhsaY0gmA>
    <xmx:LFqFamzuiJ439eeQiKQ0Yhv2vrfbErujYC26P5zYuVjCD3KsPp3H2A>
    <xmx:LFqFahen3cnUOz49Ey_5chKPIDAKJrWXPlvGjtthpdc4rv5rVpQZHA>
    <xmx:LVqFaoajtM5MyGt8yuds277Ul4yzf__nFVpt2ARK5qUucZlkWPkbiKAV>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 03:24:24 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: royalnet026@gmail.com
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	chaoyi.chen@rock-chips.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/12] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Wed, 19 Aug 2026 19:24:20 +1200
Message-ID: <20260819072420.1780708-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819065146.5904-1-royalnet026@gmail.com>
References: <20260819065146.5904-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_002430_904987_96FCC651 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Igor,

You were right, and it is one line.

Three runs in one boot on a ROCK 4D, one variable between them. Each
forces a timeout and then runs the same convolution.

  put                after the timeout          the next inference
  put_noidle         runtime-active, rail up    0 of 128, MMU_DTE_ADDR
  put_autosuspend    suspended, rail down       128 of 128, no message
  put_noidle again   runtime-active, rail up    0 of 128, MMU_DTE_ADDR

The domain never drops, the bus reset it cycles on power-on never fires,
and the MMU stops answering. Your third bullet. The third run is there so
the failure is deterministic rather than intermittent, which two arms
could not have shown.

The fourth run in that round is void and I am saying so rather than
letting it read as evidence. It meant to force a suspend by hand and
separate an armed timer from a cycle happening at all. I wrote "auto" to a
power/control that was already auto, so it did nothing. Five seconds later
the state line still reads runtime-active with the rail up and genpd
active_time still climbing. It failed the way the first run did, so it is
a second instance of the bare put and nothing about forcing.

pm_runtime_put_autosuspend() is patch 3 of 13 in v9, its own patch rather
than folded, with your Reported-by. The interrupt mask goes into the sync
patch, where it makes that patch's own sentence true, and the lockdep
point is in the message. Your Reviewed-by on the extraction is carried.

Twenty resets recovering on RK3588 with the domain dropping every time
does not contradict this, since the dropping is the step my failing runs
are missing. One difference between the two tests is worth stating now
rather than after we have both quoted it. Your induced resets come from
JOB_TIMEOUT_MS at 2 ms against healthy jobs of about 5 ms, so the block
being reset is working. Mine come from a job that hung. Whether that is
why your domain drops and mine does not, I cannot tell from here, and
RK3588 may simply have nothing behind the domain that needs cycling.

Both limits you drew are the right calls. Testing through a path you have
reported as broken would have told neither of us anything, and only the
differential earns the tag.

Jiaxing

