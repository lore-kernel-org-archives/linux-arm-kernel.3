Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598C8C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYsstLUHA4+O8kBjsO8+8kq4A2q37DKWSh7yXTB84NU=; b=YRmBFvnWoUmbAnqPJWGbD6QrVj
	fy5WjD+fHaX89pQBOanOI1R2DGLQr9xYaB9mfgMoViDCe0/uQLwk1IE3NEP7ErysLKHNeM75Dm9S/
	UXDQokWJfGC8V/k2iDajatRocCplo8sNw2XMKxEHH5NWVgfzC2l1YaFWQOi3VVOZyb8RLuaUXljku
	Tyu35941pL8GK2tZEwdCNyGu4xix9mnvZxTGTe9msXp0Z9UQQ+D3pmdtuJrjG5YCgZYgfpRjvXj0O
	EsLrklofdvidU3VH99pCKHqfnWZXcnFjiGgNJSTyEwaQnjgoigdhcZC63ejTRBHVZxRObyzH3wfFR
	CC2LgojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTs5-0000000Gc6P-0JjP;
	Mon, 24 Aug 2026 12:33:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTs1-0000000Gc5t-3xEe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:33:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso5703947a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 05:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1787574823; x=1788179623; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYsstLUHA4+O8kBjsO8+8kq4A2q37DKWSh7yXTB84NU=;
        b=qHKj2b947M0g9b/BRq7C/YPlrNlJy3gvK2xW5I8YP/7xhCXe9YZhG5BbvOue7ddquD
         Xs611c6tGT+16ghVQZUHVHYME/IVbn3AjYN98H3rzzV9OmUQfPa9pfQNsvVhLR3uLnIB
         bKeWq4PD2lm0TO1fwhxAhNzpk/lQmmwIK7cMJNx5Qn//+U3Y2ByZL/xwzuliiqMmU2A+
         l34rCCifmn+5ui4KzC/UfI5Oh9k/ECaHq19TQwpRZ7aKzEr7zzCSs4qI+NJNdyDoVItH
         ig1RbCaliDEn5/Qequysttu7C6Kr7+7PbzIpii0ZaCICln3pboPtwDioMLMuuv8g6Y1h
         9m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574823; x=1788179623;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYsstLUHA4+O8kBjsO8+8kq4A2q37DKWSh7yXTB84NU=;
        b=eq2Y57v8DK1GvoAwZw+90p3fI946twPAZdoKqz0AWj/hKchgkpQyDBhzUAP7m0o/d/
         mPW/IzL9FI91Y6122gQHeOd/vnp0DHy4/FTxsrYdAt+IUT9Amy2GKdF4mJwI7ft06Fd9
         jWKOtFuQYXh55y1V2GRwOVaqDuRn8V7Fzi8f0hhwPj4YWxfFRmfIK3pfHSG6YBvK5HfF
         W6IQ+GqT2c/GwP/eQoDCkUf+Pig9U6qymjNZOs7JhjgcuW6HDQvbe7p/zRWV8WY0gUHY
         /a1CruAOW3QJ4GKCUFp9qszRoG9aIlyQ2VJfAIpRl6mhNNIiKO5I/PWe349Yuu8jV0t2
         iezg==
X-Forwarded-Encrypted: i=1; AHgh+RoiSgzEuVSAALl2+7ou2uVAg1cd+nhPwhPKGg+oglPLxBYhmgTNVRMFcL0a4rknw66Cd5MssS4vKdoQBJejts5e@lists.infradead.org
X-Gm-Message-State: AFuF++nhEGNlrZv6ysJipn3TY4N5d1lybNvwXB31bfKbudF9Cu08ZR7u
	QOWEz4LACCMB/is6NQEehsZPwD4JqnOQdQDUO54tDkYY6r/fxfZS52m2wiilgq4BZlVMn4NKQaK
	hjAv8eNA=
X-Gm-Gg: AR+sD10+wSw1dPcBMtBZg8qKUr9ybmCIdVcb7FDJtlvN+z9rijnXT82M18Jx2doQS5K
	eKqnPwB03eVQDyZJv4tIKTcVN/APag5hdbi0K8t70ZCmkHnu4D3sP8nDM5IVFvbl190I5jaDMZe
	HxFRU3W1/oc1SPIUomd8kIRKU8Ki3FWrYUqpb3zJgOC+2Ia7qPig+rzfTz9JpcPibQOKvY5XqkK
	Y3kN8ixdQcmOpRaDp3eALRx5o2LQCe+7of6SiTBI+4gZZrI/ykhhQfpNH2p4KJGAGqe3OD2ppFM
	nbiX6+54HHV444/MfJXlWkADtDkFMklJ7B2gOPjZoFrClBEk8J3xlhGRxn/I3hIxZX+OM1M8aq5
	8m+IKJLJnHFn6c9GMfaTYtslEIYry0ewrXSB3jPQhP3R5tHQr1ZCHdYUyMOo+2r9900qLHCksYH
	s52fTFinWDeJmSeCKalMwKBRkMibtWLxF+WV5FqSdXo2Uze9nAIG/M9r3kUG7kzO4VChoN3OAjX
	/fbZtBQUYLOz43m
X-Received: by 2002:a05:6402:24c8:b0:6a1:4458:7f2d with SMTP id 4fb4d7f45d1cf-6a42f172088mr22058897a12.5.1787574822559;
        Mon, 24 Aug 2026 05:33:42 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d741asm8342424a12.27.2026.08.24.05.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:33:41 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,  wellslutw@gmail.com,  andrew+netdev@lunn.ch,
  davem@davemloft.net,  edumazet@google.com,  pabeni@redhat.com,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] net: sunplus: fix tx_poll spin_lock missing irqsave in
 NAPI context
In-Reply-To: <20260822135103.6711ba25@kernel.org> (Jakub Kicinski's message of
	"Sat, 22 Aug 2026 13:51:03 -0700")
References: <20260820130159.1584806-1-ag@ffroot.co.za>
	<20260822135103.6711ba25@kernel.org>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Mon, 24 Aug 2026 14:33:36 +0200
Message-ID: <sa67blfpujj.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_053346_121340_8B5E3591 
X-CRM114-Status: GOOD (  13.43  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> On Thu, 20 Aug 2026 15:01:59 +0200 Andrew Gaylard wrote:
>> spl2sw_tx_poll() runs in NAPI (softirq) context and acquires
>> comm->tx_lock with plain spin_lock(). The hardirq handler
>> spl2sw_ethernet_interrupt() acquires the same lock, so a hardirq on
>> the same CPU while the NAPI poll holds the lock would deadlock with
>> IRQs disabled. Use spin_lock_irqsave/spin_unlock_irqrestore.
>
> Please explain how the issue was found and how the fix was tested.
> I mean - this is an ancient driver, if you don't have a way to test the
> fix you should not be sending the patch.

I'm testing on a Tibbo LTTP3G2 board:
https://tibbo.com/store/tps/ltpp3g2.html

This work is part of getting it to boot, getting it stable, adding a
couple of missing drivers, and sending the changes upstream.

I found the issue using lockdep. At least, I though I did, but I've not
been able to reproduce it, so I must have been mistaken.

Apologies.  Please drop this patch.

-- 
Andrew

