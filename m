Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F118CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=; b=pBvTaBrt1c7Ux/SJgolx30HvbK
	P/BuGJMiLxk1fwUkniJHByzzXc4x7mbf1idQbXWE9VzVtPY9k8jPI6QVHmTOtQc9OdgmOlVpjGTZs
	yHx/h1HOXJyz3LKU+x/CwsRrbzEB6K8S5R4I9tnNY8SIwyl6i6dHClMruXhBAJ9RtWCcvlzIKYLXM
	QBI8Sz5Of8KcDxFjbq9t9vqEYbyEC4FOmoft9jrLEsp6E7p2X+kCmjmMEGJC6vlY19fiB8DHGBJTc
	yDKGKoxQJSDtHdRNL+ZAFHULetVtPCuP4o+MXAeA6E4tErRCrHuUQ9fcfNVieBahV5p6uZqL482By
	nhQKNoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1wb-00000000VAC-1zAX;
	Thu, 18 Jun 2026 01:53:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1wZ-00000000V9Q-17nw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:53:25 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c0115a3794bso68318566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 18:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781747600; cv=none;
        d=google.com; s=arc-20240605;
        b=ARfq8n7iBWeYAn6R+4tBdM6ncK1+V+s0bXY2IpGIqIVVWdmmYyomdLjWnhCw0r5Y5a
         KKMHbG1VLUn0BXB+z/B5O9tXvghz64uzOZk8ihltyIAMhHcd2ALI7/tWr0ct+bQ5IOfQ
         TEWcxEYHClxghRPgWfO6B0df6WPTdYmcOJwdOUoq3+mZ503wB2Sob0VHW414AHY0aoqX
         5SMtYAU13KNek4Mzhm36w1hB/kUTzJhTyY3M8JwNN2jvX41QFN+QnXg/jdcgOFhA+O7z
         9D0yP1o7HvPkAdLVeVF78hgwFkblXMpI+vlqowHvs2RuP7XLpVLQVLZeOlsBmRnstjn9
         6wEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=;
        fh=TCpvwQqLcKFGiIpS946PcdfBuXXRXG81vM175m+IXS0=;
        b=GkGlWXc2oi3nxk4LGGalPfqd4RsWj79JCHVg9qDX8Y60hWvtCiWZJ04xrgowrs/K3S
         Txe7nLxFZ9e2QSQ7Z4ZIASWtWY3HOVwodjUYJDIXP8DX04cfQh6lqhI0l727w2PDSPVY
         vWL662j8I8+Blz1XUTM1Zn3tQ9mgIXb8Q10fsDyJ7K/3L377+O2WgHMMBCXS3oSv+TFJ
         3V/PJWXcXWmR7OBYoPF0NjS19X4trSh8nhr5ISRG1Cp1CcDacANHTvoFP/MYBakir4sg
         Zr4QTDp7ZX+Uqc+ptNup0vVpY9IvHGoiRoOM6CyN7UKnrSMHa07Vr1Ag9mVYJSRhuert
         N0/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781747600; x=1782352400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=;
        b=rXNbOv1velHaskNlgiWDUH2uhOg1onVRs+PS6H7TsOuwsAd2QO7GZaTkmASVz3pNFU
         fQfW+wop3TPXllxuye5MIPJCazSzANJ206f67ddk69Tw27njmiJUiF3I4drPpTtzM3Kj
         ZMt+NrsYwe5mu+oUiloanXXa7M+nrUs1KgQ+W1kYcslGgYSqnbgSrwe7LZjwGLcxiPwz
         DetmpuEgoTaKGXhMZTDExUI8mP/VFZR+DOKxw3cdUYcXdYIfMgNVG/UA6Cyvb33kGFvB
         VewnO6EfDEZjmLX8AtW1I6vVvuXgXu4M9d/93FsDaLIfCpMMEWM4qWZks/+urnduTvwz
         Jggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781747600; x=1782352400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82lqWZt5WGmEK1KMEqJe8T2qeTr6htkdS62+9nO0IT8=;
        b=lhf3PXgO9rw8YB4laH78YUKdV2T5AWUXaHps/uiTCxV+AlukzncdKy3fntEVCsXmAm
         YYoWImDcxaBNAKyxvJOb9wmib/cC52ZfyLcYZc1F2PwJIwW/0MIdvnwIq94tkke47HN3
         sI96peqrrF+CQuQYc8D/gUlOj9DcggaC1eps+0vkqSIFEohuWaRdmrTZTjvIIWiyYda5
         8Oaxmwf6DmKsRqYoPn9mMG9WwtPUsG3iTFcY8b3L5H9HbbAhltfcEYC4Sk8DqwEU8SEe
         B4KhVFaSiD/y8yutjED30PumrqkscN0dOT3GHbmoQYVvWClKCXISMshXzuJ4eax/OlZP
         QbOg==
X-Forwarded-Encrypted: i=1; AFNElJ9xbDwMpAJ4rKp7OaoFpk4fpAIlGQ9EQsO8ca5Ob+Rlux4vnvoOExEC19+lti/ygcuw4b2vTkIOJ+GE6p8IhuhI@lists.infradead.org
X-Gm-Message-State: AOJu0YzFYdHDLsPobJOpQwmys7Q6CypZI7D5eF30FbvdtKaC+C72XQLM
	OfQ6CcHJUoMeON6Q4GgUR/0OLW13bCM5yFPLoQO+uw2mFnZlnN8ogxXxzuGfc5v8VBnbD7PovCc
	I5UUedEOgcK9iDumMsz3loVaVoA/USJ0=
X-Gm-Gg: AfdE7ckUPV9UUlilaFoEqIXgSHJaHcc6uxGSBjuknJ2SdzzGhhGU75DM7pIbttURFpM
	blYAFKx7VgZLNyTo8bENpiUn5dIXm0MW5ue9uvcnGgS7Nv43+sgDM0qrdc8eXg1pq48pwM8pkOY
	DtfAiZpDLIAF/K1495f7wC2SZOZEL6YRqRzJSEaIstpMS1l/w5DtyDKnQ0n19TgCGRQtURPIlBZ
	fIcUTeCDsE14U0wVtVkmxp1fZ26INMLQ0nIiaWqL1htDdknwKwNsxWtSplDzPRdS+NwVvQ=
X-Received: by 2002:a17:907:c50e:b0:bef:d3a1:5065 with SMTP id
 a640c23a62f3a-c0749f7991bmr72270866b.18.1781747600035; Wed, 17 Jun 2026
 18:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260608021048.2577577-1-dbgh9129@gmail.com> <20260617152615.GO10056@google.com>
In-Reply-To: <20260617152615.GO10056@google.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 17 Jun 2026 21:53:08 -0400
X-Gm-Features: AVVi8Cdlr_Qe6ahvFQ5QtKi7fzQZ_9bCMLj4ZxCwFjjGj2iWMUbd3Sm13KClPNs
Message-ID: <CACrCO_V24P9LqGu7M2M9b_1Y34rMh7t4=2-LjyR7ZVJcP7gn0Q@mail.gmail.com>
Subject: Re: [PATCH v1] mfd: mt6397-irq: Fix PM notifier use-after-free
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_185323_310521_A8A14090 
X-CRM114-Status: GOOD (  12.91  )
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

On Wed, 17 Jun 2026 at 11:26, Lee Jones <lee@kernel.org> wrote:

> [Severity: High]
> Is it safe to explicitly remove the IRQ domain here while the devm-managed
> parent threaded IRQ remains active?
>
> The parent IRQ was requested earlier via devm_request_threaded_irq(). Because
> devres cleanup does not run until the probe function completely fails and
> returns, the parent IRQ remains active and enabled during this window.
>
> If an interrupt triggers during this error path, the active IRQ handler
> mt6397_irq_thread() will execute and call mt6397_irq_handle_reg(). This in
> turn calls irq_find_mapping(), which will dereference the freed irq_domain,
> resulting in a use-after-free.

Thanks for pointing this out. Findings 1 and 3 look like pre-existing
issues. Finding 2, however, appears to be related to the error-path cleanup
I added.

I will rework the patch so the notifier and irq_domain cleanup ordering is
handled consistently.

