Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D41C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUPsHgAchWrRVDG9iW20v8U6ksxTr54/BuEyiaNJv1s=; b=niJl6VZxZ+DtUXC+OQ/3HqynhS
	AEalUNZucVQAkmtW+DzHQOH7biCNAX3d5z0H7+Vc7UXYV6o3o7FME15uFehzlpQIQYE7XXOjCfCXc
	JkZXPu5ecmG3J25MpAACEYbLxGlshAjc+olu+9s6OKXABdznbOQG6urIj3vcp/VATl0dKuHJG3V7N
	/hd873Ew9/d+i2dNiqHmxve+s5yVj5/Z2ajEfTIWHPuGV7ifodZWKQqFR7VdwaiY9U9CqZ3dJ6zaw
	oA1rLvLmrb2rZK6Zhq50jU7QZJJss5t2RPoE2wBFZkVSdMZIZ6njGmk2lZX+E74znPWOoIuZteqAE
	gaMIRcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YBD-0000000DVJX-2wfn;
	Thu, 10 Sep 2026 06:22:39 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YBB-0000000DVIi-1ntH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:22:38 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebad4acso1539238a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021356; cv=none;
        d=google.com; s=arc-20260327;
        b=bXUEpNDor53CtudnFpsyEu3th5eCVBMfsBiM/dxbLpNkloE9EjiTyVojBzVF1qtK45
         LhFZlB5OSbGb8Qgmao7aS22Aec7/npKX4IIw19dkqTVNn8+ugixuUc/FeFKyxEvQIrbc
         0ivztaa4kB1Atw/PTEjCRdNjSchzqzmKXSpulRKz5IBTMQfW/KO0kJ52rtZistbvrD2q
         gKWV07pgh+6cfBCn18xxJ92uYMF/NeIWT0bvAxG0kuNZfTe01rm/0VgmBrs0TwmBeiAM
         zzTNY7eveBepuiI+SROJ8rp3CKo7xb1bZvbZWzjhksVr2QD3BJVAFwjLNWs5oqj4ciYn
         zHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GUPsHgAchWrRVDG9iW20v8U6ksxTr54/BuEyiaNJv1s=;
        fh=c5C9UZBBrJbKmnEx0OlFChT/4BwPPIjY50Vzza2fYCE=;
        b=eYFUMUWSv1ajTiHe1JHryUMXQ0WnhEbswkmwZVs7dNgzkyN5a4WOPF6a1HkoR6zX4j
         PuzJWuYNkxm+iX26fjrOsLniDVNk1LNbPXE+63poIeRufYkbKxRMo7TVGlxFeIEdGqOW
         c2+KGVh5M8YbAs06IzXgB/ZlIh7Iny10iHqafeACPwAAvjP1YdRM5ncqDprhbSSZTfi3
         D/1QAqwqZmEDj19ldmeWg/7e+mCCLhy6V6q9QDp8zCkoVBy8rX56wCgZaBcc8aU0zZl/
         rGkbEc+6N3NuF0/KlezyvT/tp3R7eS+EY9D+Ez1A2KfjQ4gm/rXGP3X5t3MXcplrQRmM
         Ao+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021356; x=1789626156; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUPsHgAchWrRVDG9iW20v8U6ksxTr54/BuEyiaNJv1s=;
        b=atXGzipFHN/e4axKPzJdOl6QlqJZof8cCk9mKHha9mpjXXP0FkJNAhAypl86lCcnnI
         GSe/V0wIejmp8W36w16P9tqh/EVsomeRAXLm668eDpgTrXH8afuR1DQ2FfTmOort8ae+
         OyL0PqdWxOnW84gdu9DCLL+6tUT5CHwCCaW0Ayek9Rlt5ycqFnQXg14szBGVJjXOYieL
         PmNRaawgZahefRxk26J410LHq1Cfq2iFzNPKx/ISBjN84xmMlnJb5hpyHYzqLPkRtYIN
         6s+hDh8U/ssfAKgOoAghQzY6A0mt5BHLsdoPmQ6bPanKypoirTVBbmpQp8jBKkCiJRpJ
         91gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021356; x=1789626156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUPsHgAchWrRVDG9iW20v8U6ksxTr54/BuEyiaNJv1s=;
        b=KRmhtWQoCTClbJtPAYcVu+2m1/zUNrwYutbhNB7dqcgZzCCrm4R8EdYOoGZsh90MMn
         z6pCTZ74lg3g/APd5ha1pD/51zE4ruSTBwzes5qqJZ99TDnGMsCn148yNQ4D27BtYto1
         2YO/Avznv4MaKgperCy3bq32Q6sFkXwX0sr+1Qdff1081PLcMT3oS3XDxKKGLOmDg5vc
         L7CPPC9vi21GSzTSx9Pha49bd36lc8b8nNhHARlJfzHeySEW7fxJI6XgGTUGO8PD64fg
         NlapGURhcmvz7U9xI7EXJMlVTIoogtqwEWFSqlgwbP8uyI+7+VeR4kbL5dGvCqma3YyQ
         GwQg==
X-Forwarded-Encrypted: i=1; AKwUvBzdy6EuckMfjZn73f0YIaAc2S/JLv+g01PHYYHX3gTSjLBhKJ3sJ470na0GaVnfi19a5JmYsCjWT7ZjQtNaznnh@lists.infradead.org
X-Gm-Message-State: AFuF++nWgWaW3ecjip2CaqHuHl/GJ+YkMuBFUBea4Tjyw4WV1/JCzYBr
	X3U9JN/Fp2n2r1HPe/FQ9VcxEIjJxxmFlbN/mdH8RC8daF8OmKgym7RjcNEWaBuYgfRtpphwdRs
	JHYUTcknh13h6183mxwXfhNSkvTb3s5s=
X-Gm-Gg: AYBFou0NXe5jA6sRfj8gr3VzVHixIIg8fGDKWTO+xxulb7rRsQO0syj2A6+47nfqiwn
	U8JaF1msTaGduI9KFjr1Wq1AMeBS0/xx+saoxb4F6kYfgu/UMXeV1JYklI1fp8znNdzQqOOaARM
	CzRqnCGZW6GBcs7txWYXi5BDwhKUxFquP3Ypp/7FyA92xS4qDWNwL99tCH+O+mY0DMaSgG4Qt71
	sQEhtW0ewk9oz1zTUB4bEKQ9mypZoZBuFM8ub6ooRT0F/T0zkPJMNxAPJcaXwRCkXWB6YhGVfik
	q/byldvn56RhMGx/PIY9P1SLaavXdHkcc+VlTKPPUWa9mxkv9cfvUaLYm1kiaUplJ1MnRHlIS1n
	bEIK6BZqXHTj/HkTYRFHxULv2lC+gUgszzeRc6GGerreE1fi12Rxli7y3NUe6UEHoOJM=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id
 98e67ed59e1d1-39bac3c452dmr16420821a91.18.1789021355888; Wed, 09 Sep 2026
 23:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260909045450.16176-4-phucduc.bui@gmail.com> <178901787314.219967.14642070814356568514@kernel.org>
In-Reply-To: <178901787314.219967.14642070814356568514@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 10 Sep 2026 13:22:24 +0700
X-Gm-Features: AcwNN1WuPv7sSiyeJm2_sYNBm74wkTy0S0_3POKTQUNGnsRp5EnocmR5Vn7LaC0
Message-ID: <CAABR9nEGBohTLYGh9N7z5u2hMAwY3ZpU+zTpxi4_imLat8PgBA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/3] net: xilinx: axienet: Fix IRQ error handling
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	horms@kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_232237_472764_EC08DA88 
X-CRM114-Status: UNSURE (   9.33  )
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

>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 (2) =C2=B7 Low: 0
>
> - [Medium] Understated impact / missing Fixes: tag.
>

I've seen different opinions regarding the use of Fixes: tags in some
of my patches,
so I left the tag out to avoid unnecessary discussion.
In fact, some of my other patches did not have a Fixes: tag but were
still picked up for stable later.

So I think this is ultimately up to the maintainer's assessment.

> Pre-existing issues:
> - [Medium] DT binding and driver disagree on the ethernet-node
>   `interrupts` list.
> - [Medium] IRQ mapping leaked on probe error paths.
>

This is a pre-existing issue, unrelated to this patch. I'll keep this
patch's scope as is.

