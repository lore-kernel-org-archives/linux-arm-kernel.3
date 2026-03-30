Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B89FF4959
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=; b=0tHHx8WyDHU+8HgjW3M1lQPimb
	ksrYM2t2jUnIVDI15plBOxnzJzLWs5u/THZjBlkU39QCw5KEUe0DTYtcYgI0IEtGhfNQ9kkQC0h3o
	cJkG6MMUkMYskyrol8JHUaA1NeqOo8BXctBlp2uxVuDRapZvQ6PYelNoughnejo4yWlRMyptU7XeE
	ljLjw95uJdzjlRHpQd81D63PjzLPmQxlC5vmatLFbsO3WLeHGl6cV0Jdz1N07XEwIeb5hqZ8IH5zj
	sqk8KF1sd1czZXXznwxQIqHHRMecbLUCKSbNnekK3haQrZN4tESKF+xNaBo3DLU+J+HyhMSVAkFna
	AWo3whZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Db-0000000AmQL-10nw;
	Mon, 30 Mar 2026 07:39:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77DZ-0000000AmPa-1oO8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:39:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-66ad907833dso7225388a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 00:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774856363; cv=none;
        d=google.com; s=arc-20240605;
        b=hsZUA56+MZ5rTms/OBv+WrNG6lxWFs3wocNUPKICvA9OpdoXxcohvUPTR4CRN9Ik+E
         7FTjDU64vJTxfKYlkqkFpUkIpErz1cG40MfigimgmoljfllRqQYdU0mUShj3U8SepuVH
         Q/Hmwx0DZ6oqBHLWvuiiA6EIOsRtrP4rUp3Pwz73+4nvxWQibIC4KoNGedqSJWrIcVYE
         J/m++l6MZai3LoPYvgnQU/GH5ilxwKD7oD/GCiDB+wTecNaKDUSOhlSeMm8k7ATF/yzM
         37qxn6g9OqrIJ2+JEWv0Lsefw3iCe2Cv5vRG8wkhOn5TW0di7pLdo0nMGRLUvCUSxtRe
         eSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        fh=n+Ibnwt4ES1FhNKXd/Rq1+wCOvjIn31zHPXGUj3YQ4A=;
        b=RXhMShzsPlgeaL4df3q9ky3sWgSQ9KGAmlGh02cUyRBN1k7cjSllOqjZ9ouNoJRhci
         1ubGmnz2ik8y0rfwaUDp5oWj3OghMdeHOTiGOfLzEt01NLmAclr2Rj11L276sZYJE00f
         Xn+yfcPber5tA2Ay52gbCfmToIMmqqt4OmwGoJUNElMvuRft4tf9pA0o+q4GMAFrUeyY
         IuljIa6FNVNXQlL3waBIYKRMzRDfFMFW6OM5xboJE3znabkKezxsn7zOeOgEmuFqwSa8
         rIfmwiHUi6jK7pg2U1kgz9hDqnaLg65cDMvakAQEgTPZfbXsXYqnLlpFFtP8YSpT+e3Y
         dSfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856363; x=1775461163; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=M5gvwHZFZbqeE3KwzOn40nfivIfLlCUbF7jflHyy1OPSdl92T34xBfVzNhsPfhgKb1
         mjIMwTBRcyuV6aYwAcQA3ldu4hSkgU1rwnosH+MueDIzZcuqkmh8NmxJoM4yIyW8NEk5
         dg4SoaJNy/ct3tB/SdhyLD/XOL7l8nDZ704PjZIFBqIxvQiG9Co4UCukX8FdqKm24gJd
         LRyoa3jd+3pfcoBRNm6G6gftHzzgPCviUljKMBYgEtpnQYmlReifAI4Jfn0ctv6r40X/
         PnKikvlJOKJ1BrIPi8slWvZOg60MLF6ownvLPpeEcVqeiAA9N+X4i8kTCk2OxMumUd3c
         Ae5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856363; x=1775461163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=ijL+Q2QTPbsFXGbfDVkH9Qf8qOr3jIYoTcQ2Swsg9iOdJuGIslhDPzBxD0HrXkFFCV
         Y8Hra4g1HDY+/oKk/HD1dNAnVuq8fwBUr9KHQWrC002O/wR7qXbPmMBoKL/uKdIwm2w9
         IEQHix/BH/z0L9LfAvYpX1OK6bqLnhyR0E1D0hsIMMkqodICQL4AyrHTrF0bNNFewqWq
         Xg0g8dPON6MhwoGurCD1aBdpq6B/hctb3T+RZvBZJD3iKzVf2iKdS9L29ppjveWz+jhZ
         taIdAHhwVDolML8hQF1irrWLWDVf4jsrRKLwwAqeB7LpcDJoeTbBNUUWYouoS/auMFp0
         upwA==
X-Forwarded-Encrypted: i=1; AJvYcCUi9tWPDY86vrXbikzPNz7e/eWqMuqO449EZeWYTbNFmV6i5UsGgYGFo3/jFUSfyv/FYRTemxw9h7Zjjmlu4HS4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Luv+dFnJdeqH0wciiWE87IsnnQZLlZFNZ51CTI2A3TRxqOcC
	MYn+UylPLrWPo4Ue23Kz+HRxUCervXFGj+tl4TCafVjAlkd/mdXBi+qlxIlg8FzSAXerOf+edOp
	o8QYo0y0nVOQ9Ym6BVnNKu0YMsnFNqSY=
X-Gm-Gg: ATEYQzxgHmeQnRtIWcVBewkAhU6BSsBNyVb6LZsvWyfMhZ5XBTpdN66cyxpTKbYFNQs
	rIzZ2BdImUWyvXoovhic6I4EIL9YNm5BwZSXc35FK26N2WB1l2bTGg0MfekPAWzC6sgwm/5paGf
	w6UMYCGSQXtJzV9kyAtNGUnPh5GpntSJTanyNl7MNYOR/X6oFIpyQkPh5O564ldfEj00wWcLO51
	UYehjx86MayWgNnsqPhokINj8YLTDMfa3fnsa/59JZl9c1CbvDpQt6H1nBtp9p2/ywtSLnhve3U
	jCrXDw==
X-Received: by 2002:a17:907:9621:b0:b98:13a:c92e with SMTP id
 a640c23a62f3a-b9b502b5aa6mr732407066b.2.1774856362950; Mon, 30 Mar 2026
 00:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
In-Reply-To: <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 30 Mar 2026 09:39:11 +0200
X-Gm-Features: AQROBzCKAAw0QfB5IMl3n57JlPRQDr7IJq4vT7zpNh4df3HsPMVBkVCKdEdIBnw
Message-ID: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_003925_489477_5C2B5193 
X-CRM114-Status: GOOD (  19.06  )
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

Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
<wenst@chromium.org> ha scritto:

> If this PMIC is anything like the MT6358, then it has 0.01V fine
> tuning for most if not all the LDOs. It is sometimes needed as
> a rail may have a 0.04V boost that would otherwise be invisible
> to the system. And then if you have something like 3.04V set in
> the DT constraints, you end up with something the regulator driver
> doesn't support, but the hardware does.
>
> Please see how it's done in the MT6358 driver. I spent a lot of
> time on that driver to make it actually support the full range
> of voltages, and describing the supplies.
>

I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
2016) and unfortunately I did not see any fine tuning option in there.
I'm sure this data sheet is not perfect as it's missing some regulator
registers that are clearly used in the Android sources, but there's no
mention of fine tuning in that code either. I guess it does not have
that capability.

I will shortly submit v4 that hopefully addresses the rest of the comments.

Thanks for your help!
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

