Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7BC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=; b=g6FeSOumwQYD2J/y14UZS0iHk8
	kqKSzp4oLYB6IvSAtme3j9LLofWLN62rEamPjvMLlzoF+isjhIFk7c3FURmE5Ayh9lDr2tbVRiH9a
	qBYTsLWpQoj0WwnUd0JMRjTijobihj9AFPx/VYDU2WBdLoZsfGPhfVe3xohzl6MUsn93PoKOkKP0F
	DTBNAxpQstiRQ0NG4anYbge9v2JnYaeikhpPzFnU/TppWASRssQcKV/yQFT6d1ogUBJeUKup7Dv/m
	GpYnoqW1feZG99RsSn1Ecx8tEoIaHEpOrJI041BzHtO5EY/6cUDNUHiwotv8R365pVB5O9pA+zrgD
	bFmfFcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L2q-00000005Cx8-2QC2;
	Tue, 15 Sep 2026 04:45:24 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L2n-00000005Cvu-2Z81
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:45:22 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f705536so659726266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447520; cv=none;
        d=google.com; s=arc-20260327;
        b=NI6eANxY+CY1hSlCpFzpIm0sNayjpozNbOEaLkg+gEw147AHk56RjqoR6SxldmDid/
         Q8+XkyByJz2bAINOBPgPoxZY8ydl6Rs/VfMH9HVc+7Z04OLez0r3jxlXUBPSDxHJwPXx
         b/bC/TUT+8xMUYo+WzPLBNted6EGEgigFpKoBZavwfXf6gtaMngykRO6DCDiMQtAmscP
         I89Lt5wE15RFTpTtMVlr2XjSybQaAe7xxtWB8HyWLVKdL/bZ9W6r8ciMnvf52vKTuv4s
         xP7aSboJAhB1VZssHub+uE4WRcdsRhzRPTkzevJE0VSuY6mJQ3AITgkT2bcd+cE3yWk+
         M9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        fh=nUuF7JsrPd5xjxoyLbC3YZC8/g+vAnkQaNGfozYHZ7g=;
        b=VvRt7Cxvd6JqQ5irgE6rN7ciuNhxgipUa/bpzEzY2Ar9w6YjVBq1Vu3m13uy5ZjZfC
         V1l7itRfylUEp1Haltk6EwEzALTUv+TNOu2b/KB7+2xDM+RPxRPyl9jb2oR7ns/Pmqgk
         IaswifxgCDwL5rt7TCZCTg0b42qzr/VR3pChGwbUbscW3J1WzRDnsNG0G86Ym/e6i3M6
         mukoEFNlYxsVKnj6MA8qKQxjAqTl+xTAX2JFBVhN2lW84l5ALS+Cepta2NnJDKA0Gzqb
         sINfsjLHaR0zbQg7/It1JhfxKGA0QTuao9ERhR/dWe4rAIxugThad9kcY4gDc4ekaOKl
         VQcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447520; x=1790052320; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        b=KgbyzkGDUjDNktw3iFq62DUwYrZhEy6LClJE4ETHIqe4KcS5qXYTrkR1RBnFRteA1Q
         kvGfZlXgisscxNaRNJrBuNoUz8m4xg92valnbZLRuUB7o25B1OK9A0eptEvFkc/4KNcG
         JuI6AwZ8E0cvyssih/12cjaP3dfTWKsanB5PMKP/s9d5FKUOCbQzYmEXrB0mx5miH9Kx
         6VJWLiy/IAqFNJjoP5Bs6zwd53m9EmlRiIlOQWVPv16IAoIuYwZTUVLgFHevittocQ9k
         uNm8yLsSCfd3eKlg1Iyu5UXG0iuMkzfYIQmUd9Z0y15mZ3zS+JzX+dZAaijf2uV0W4o1
         xnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447520; x=1790052320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        b=fDviWIgmPegwG0eGvMj9vdv9l9XD6tOpFQZpeMm2U6OkrkHqMQD2j5z3kWFbbrxrNs
         EuWT92vF7PidH6tb6IdVoPPv2RIpVMtB+qGDa/XcNAVuWPSFdfY+XandPJ2w12FghtBj
         u6D5nzA7Atl4bG4oOT0VP1wRk72JosmAli8P4lKYZXwtv0WodRRVes8xDcVI2+0bHAkR
         ZSgApTs3yr4teywihUT+OB3U+KXkHjq0ARUas/K9bOxtvXxXY6Nr/nvaLexfk6Oq+4aK
         tBhGz8m7EFqVdWoPukgJ8hVeziHuaDPp9aVLY9IFi1+k1ION161oLJfUUleBc7IPwlpr
         q2YA==
X-Forwarded-Encrypted: i=1; AKwUvBwliiYryy8l2E9sY6LEVEVqPMKqTfjruSKC1Hcn8XwywzkN8PBjHxQbtxPNoOF9R//ByP2I5gUoj/Fn7Fbb6vgs@lists.infradead.org
X-Gm-Message-State: AFuF++kIq57/AoZQZsuMayF87EudeRnua5/bio+QJG18FU8nBgBupzab
	xIP4RPeiPxtKWFKktyQ0ebO9Z8BabF3xNLiTatR2anZdUU2y8BFe5iiOOmwIP1VvMZqXy/tBEva
	z3Vq+soDeXC/BGzEsqE5LJ38CXez5+Ko=
X-Gm-Gg: AYBFou0ErB6y6XT+kjg/iUu6ddMMYy/BSHNHQGgdLlVlOQ9gSZIJ/+/cmzWw7YD3mun
	NRV1+F0bP0zc80s8EdDd/C/XeTjNl4jeMfFsad/wmLuAGMZB1N91sN785kxpch5bb+W/f2bf3da
	imm57ktHsWIbOIXQ12ppdBPsypZ4M8ijF0bgyOVBXtjCTT+CEAcq7xBhwaI4yZu984tgxm70/tt
	kiaSsiHXvME2LSmSkv9aaoPkMQZTyUGMo0wKtvXMaaQQB8COoav93Qiy4WJNtcT9DiPn9r7N0Py
	uV10ArOsPakiHTq+lnwJOHdXC+yb8CYIW/4YPcqQ1s96nIFBsVhlmg==
X-Received: by 2002:a17:907:7b85:b0:c26:36c4:858e with SMTP id
 a640c23a62f3a-c29b8726f8fmr326120966b.25.1789447519950; Mon, 14 Sep 2026
 21:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-4-linux.amoon@gmail.com>
 <a835cdf1-b0b5-4719-8b5e-226fee78b856@kernel.org>
In-Reply-To: <a835cdf1-b0b5-4719-8b5e-226fee78b856@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:15:03 +0530
X-Gm-Features: AcwNN1X6uQRHhT6qwboNgDZri63s8FVYRlQvpJVAgezJWpeLkP8LX7XyBkGQ7dE
Message-ID: <CANAwSgRETNrPmwGvv2z8Q8EF--W19u6iB1goNZHUzKp64s3_Fg@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] thermal/drivers/exynos: Handle optional triminfo
 clock correctly
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_214521_670019_E9F9E08B 
X-CRM114-Status: GOOD (  15.32  )
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

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > The triminfo clock is obtained using devm_clk_get_optional_prepared(),
>
> No, it is not. It is devm_clk_get().
>
The data->clk_sec checks were changed to handle the NULL return
 from devm_clk_get_optional_prepared() its only used by Exynos5420.
> Order your patches correctly or do not introduce bugs in patch #1 which
> you then fixup in next patch.
>
I will reorder / fix the series so that the clock API conversion and
the error NULL
handling are introduced together.
>
> Best regards,
> Krzysztof
Thanks
-Anand

