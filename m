Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35F6C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=; b=c6H/XGVW6/ZEzF1DaCLQe8DGgL
	3LnrIFYIRiqk2gDTS0VeTCgFkc0JYm/ZKhEQwkfwEFbpztE+CxNcvxtl4Ny4x5DG44zGAwVra7Gtp
	1WRexg5DvgNr6qjMAqNN0i3V0lXL+r4G+Zta928bmsPl0R40fjb9HB/wz9b9cOD4q7LmebXeE4yYk
	cp/rx7kRG9RXjcG7qQQ35xMCoHk43OPDEU8P1650nvywXjuLo45OrPQ2NcWTxfgfm7a1W/Tb9I/3l
	NQUTgKNne37n6yt8lkJFrjBkNuiDV44Dpu+RLnIcxXVnT/J35fJ6GgjvzA3pcv8XLm/zRlZ7WG6Mk
	YffNMCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkclI-00000001NBq-14YV;
	Fri, 17 Jul 2026 07:13:32 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkclF-00000001NAn-1UYo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:13:30 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c0c68aa31so42712521cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784272408; cv=none;
        d=google.com; s=arc-20260327;
        b=KtAdmpe5tIBVbBqSEbuYemxdQLxDmxbxFmwXIG85OIlACly5WAraVE/pIdlaKPFOG6
         PWdkQKIHbVRv+/MEa5IiAPzkcUuJ+GAnlUS7C+hdJliWMbUji3zGweAoJCQMw7tf+/ZG
         Bd9mZTH1iumc5hKHqWZhEXWhOa0LQRNytm3Gkc2KARxrBXNleouHzpLjiyOFCQmtuJHT
         gVZdkBGTdbC29ET4HWmg6moCVDtZxTBhoI6Xk6r6mqT4I9xI80XYV/axRj2dDX0jRSgM
         esnTpcwIHiY62jnc1syYWHjxDkAE1N328NqQWRyRibildj3BlwHn4nJ6pVPcTO4kPyJa
         u1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        fh=ghSs3eE8FgRaoKn0K6PisP2H6VmyUTaRppo4u0BJxac=;
        b=pDCkdzuyxL1CkRLUlHL8KW2OiSvrpSDpIPIVEIxCuhXp7/Z0NZqO59yZK2rr9yYu6T
         cM9RZfKjmoY/dapy5hSkP1DjnHGgiauJsGyLYlc1SofcB2fYHs2AdH48WkMnM/Vmhcxu
         pzQRjzPGbKBJYpekGv/2UGbRgeFgdvtth1+8j6FVQj1rAAzD26GyI8RuBEwEzbKJAhFf
         1Ja5l2q13PHT+odGLYdLwA3ZllqBbX408ys1S7BtGf6SoTeyIjU9ZSuWBpo+eFDqBwph
         q1r6cZXu0j42hSMdbMMaTk2jwcI+duWHCUnx3eVRIcSTnPwWiBC3I1esq6CnS+FPqq34
         m72Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784272408; x=1784877208; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        b=fjt42tZg3XHR/tDUosgwJWQTK03RctZ/TKD/V4T5pPArCNntFj0aFAg5L57Mib+VGD
         RCL6WYtgqLX94UzriUrvdB2yl2AEVhDTULVsZeF9kDtbVtvh3rVk7GR52VvrQNHepDT9
         FHs9NEdL3iY/02LXmr3Z1aSpE7aIOR3L4zGF90HLZ4CdGU8dcfjQaYt7lsoFKh8sbv/p
         k0rnZqwGBk2N6PtkyblTL8utZIovewZ3Oz6K16n802+1ysK+hw1a5q8kYkJ+roNaph9a
         z6pOmKefjQy5qWdO92O4TvrsIfACBYYMbQp2ZFKiVgXEXmCu7qaJ2P0yTu+HXRmmnGvr
         SoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784272408; x=1784877208;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        b=TxYP2IRKf0XRcEe+4E6yG/mk44JkyP7VGcOWiqWOIfbC7RN6uMDzYp/Y3CS3QLJoOB
         K7kC4vbJGzvGhCDY1oUspGRoRPuoQyaiKQplkcxr3mQlPJxV2IBdEErWnRQa01smiFTx
         hlbPm+CgK7/hfYQVcUr5LbUNXWH1jAAw8FzuQroCh3uNDayzFcPSFGiEW2pHJviEjNju
         7hu9DDa2Si1uerjm2rih+nK9/oPT/47TPdd0gJ9gQu77sC6LL/kLe6Iu/Q9JyV/gVahy
         oY53PHykDZEhArWAkrUc/YV+/9JxYLYV+wk6UzRKT7F9d70AzYUZP5/EbVLmL2/q52Xp
         NaJA==
X-Forwarded-Encrypted: i=1; AHgh+RpBmPAsX6tpLlwOseGCujo1gjVE7Hvb6V1yMCnr9+dZLYqJ+b7hVLIFQSmFstVELAhsLfJt9bOOrgL0VkU0Wx2O@lists.infradead.org
X-Gm-Message-State: AOJu0YwLcTjCVH+d3xsl6+blwv49VB97RsahJtOyiAeQrcPekCcQ/XLm
	ftI666q0xEsH5bZIfIOEp0yqF7jaEZLdsU8zgNqhlqJ0WBqVtXXNLdaU4aU+hef/qbSiqpwCs9d
	fU4bxxvooeSV4I228EF4zilyK2gYgkqo=
X-Gm-Gg: AfdE7cnkHCh+hCx8ctUx80wWigBZNWS7A0wEWdA3ZvlXenjyeSIjgJ16QPe8Bh1Gpvk
	XJiuCjcHgkbWT7Wc193bSmUmWSp1X1h81wgMCOk4ujjsvtYiAFFvhcMnHIooGEhymMO7MHhjt1K
	4CgDMKdm+77UOcpyRns4Rut+3habfXm/4hLMr/shx+B1KRW8/AhfORbqhrbFDXM61yQTlH/evLO
	Hua2I0XWo2Q9bukVaOkqiKWx/sSIPwzrwNAKjtndrVymj9Yihfr0/DO86E1Lb8e
X-Received: by 2002:a05:622a:551:b0:51c:135a:5b53 with SMTP id
 d75a77b69052e-5213aa6e46fmr10419721cf.11.1784272407938; Fri, 17 Jul 2026
 00:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260716161923.266315-1-akkun11.open@gmail.com>
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 16:13:16 +0900
X-Gm-Features: AUfX_myw0V2Aiz3FUrMgQlgFVz4GkSaEohB1xo8heVTI4ZdFmSeFalXVsz80Rxc
Message-ID: <CAKr_iV7_k1cAMxOeE_SmR4ydTnhs9oDAaHYp=DsZ-YAPHpqk_A@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_001329_403677_3E61C072 
X-CRM114-Status: UNSURE (   7.12  )
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

sashiko-bot said this patch series makes a regression.
Should I add another MT6589 compatible string such as
"mediatek,mt6589-resets-wdt", insted of changing "mediatek,mt6589-wdt" ?

