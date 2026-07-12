Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D924C44507
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=; b=xkjXL46g5ZKr7a
	2YFZCeomRtp0qL1a+YUbGFwMnDL1qE1aeqsIbRY6T761SC11tPUo/gpCOIg3HJzf7H4sEMZs5NhBP
	HDZvAs7vsojZ9zqkQY1FXPQ0bWP3fiFKDAUROBhaG07zzMmf/36/ZjiBPhYfonvQ1gnGZ8KG8XTWy
	ADSQhNgTSYQIpUlagFZuFx+7cA16mN/vU+EPDP/ZWK2ASF6CgphU5WqxlJ2O8/MOhdjXOJrZ05RVC
	5+fNEYwxBvXIuF4BQ2Jx8z+tu8VorXs7K4xlj5vNgdamKJZ5TCknx14YGkTapthtdRmxmUPL0a2yn
	Ba89R/PyW789mHsfi2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwZi-00000007b2T-1Nom;
	Sun, 12 Jul 2026 15:58:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwZf-00000007b1Q-1R5X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 15:58:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caed617615so24777565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 08:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783871914; cv=none;
        d=google.com; s=arc-20260327;
        b=Hj9o4k2ORTeetnhZNLxZ1/8+1u4n9pY9KLjhtReMIFG375hfF6/iU/2VDVZUB2u4Jl
         FRUy7Dy6tGhtAt1ZgiYjLa5NjrXw0wk72tAsJkKuPclLOd3VHkboGu/OvHpjeVQtFEKJ
         bD8Wx9wH1D5eZQYZ5pK4PxkytwdMAyMyxGSBqLPJJDwkM5bfiOJ1qMvSXvyIxgw07+GI
         v78qKyinO4RMb7L8SOh/OqjnGtpANbEPGg3gPSD7ev7wEDmEEUYcIPVrpswCWHYMRAAR
         +QxJXElwdeYoOgTsGmXhOldCooz1gqifsVwLSVVhQZlj4DfNvTMYGeROP3KwuwxrwWxF
         qTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        fh=gK7+AhGpB7GAqTVZf4nImBV6GL9XNCZn/e+fRGBIPzQ=;
        b=jBWhHdn1QHyfKXO2pjR4SmIfkowoNrkX0/cKxuhs9tMjqNSmzwwPcRH8B0Lvs7v96L
         IVPGMbwDeeT2QY0IW71HrWBVUxW0x6/hIOkYY9U4qJKy3/P2fK2p3VGeBSUEErIQuR4W
         hfGtBwcFejSi2iS9GcbQ3Bd5XbMisSYxPfvh2l/h32dOTK4VZZ2GmoW/V8crwVKDPTve
         I6yIOCn/U0dZ2LqzMcXCc7icWU2EeO4KdIBFz0o3roEAT2ykP+6i33x46bvqCeRnVjx3
         lN1/tUc6xOs1e0cXlGG7TN0O5w1bWCWJ0ft/QCie8iHfQQpNy2E+Ed7xNY75GbA7xyMk
         9MSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783871914; x=1784476714; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        b=n8zjbCGk2Jvn/N5d6mcwXqQz4Hw94X7H5vIB3zpw0aDh7NrWHk5l84t6WgwyMdCLSa
         13oFCpi5X+6ouux3Ofma6s0JjXnzw8YA9AoSVFtE/+R30eoZ9MTWDk2e/Z9tgb8GeYy/
         E7lZtHqLRd7HjWxo+EN3/WAZwH77iDBtstiZg1ScYGBnzu+/ygFqqBU5jCw3+RM6fgHL
         skbiomeZvWpTM6GQdL7+W5lBauoYdLlHgaTcviwU41lY3GoOIR6WAV/YOoRncbeealXJ
         txiZgu6kcw1cI7qH1S2TryqgAvkfT/4We67Ois0XjwT9uaKeknakupkgU49tQ76gh4WV
         imsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871914; x=1784476714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qoHPnf7RHTkFcOSnpyDI8RpBT/XeamlmMbf/yeH5Pg=;
        b=Pj3tAVx5o9sY1uHIW6WM0NF5dwF2ggEOeHTT2TX9/G087XDjAoUN3z7or6UNKvaJj7
         0RioPfbPgtF8FGaOhS5QGVwNa12l/HNNg5Wueytl5gsjg2Dn/WtMU/WeeQHWiTLV1av7
         tG+IMbuEVkw8zhE3hSsoDYtywX3gTzShXdA8kRouxXYZpBAZyug/IMDY8rHTbgdDLTSa
         VnQJQSVW0H5FF2vPCbJVuh3s9Dx2t3V7/uy147tet4/H9GH14rfXASfv/5nneEe2MZVX
         uqOr59HlxOXmhmkIIpXAHvmAgPA9AJxfgRyddZbRlO5UepnmNRJNtkmwbyW5aDS17R8O
         KSug==
X-Forwarded-Encrypted: i=1; AHgh+Ro1HW++x5smnKbDQUqnA6X4PPq3N5KJfse8ro22nDJ8uq+VcG249MF5sX4HR3wr5N+DLKEJ0odizi3adgZZrv0L@lists.infradead.org
X-Gm-Message-State: AOJu0YzFwnmthvF/328NNpItEFDhqah199msXbcv5w5OLhKmLRowb1Mn
	Rn0cGdPU/luq2iHYXExI7sp1HTYjj9EdWStcSUMkdhEBAaYIhD5KOnabMgPMIL9I8pN3yLswIp+
	/ojjd48mEEW/7Zrr2Mq2FzCUnRdiy7ss=
X-Gm-Gg: AfdE7cm2yegQVLL4sBY4yNpIfkUyskQFPtGrsUEg9cm7ewkS8TUIIA24OuFyKlFnF5N
	+V9wNYzoxyv5q9EdecjW7alEM4QfqA+v/fo4kM7iOVBM1BrbRh8ltoqAlti/QmMeAx4HYlLJvRD
	1/4p1pvo9RrTDxRAZOecBFoxji+gFq5Tw4eX6OjLbxtaNvddiBHPkOdP+SfarhX4zCsSH0cFlwV
	PzMbIM3m/76+lYyKVfRxFrEv7/eZyZClbVCIHIRvjbQ3KA1I9NPvqzWEg5OLcrI1ya9RV2+yVvt
	onDZt50Vp0RR6ftHVzn38EbRejKstw==
X-Received: by 2002:a17:902:d987:b0:2cc:ae2b:b6d2 with SMTP id
 d9443c01a7336-2ce9eac1d98mr62500805ad.15.1783871914381; Sun, 12 Jul 2026
 08:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260712145718.126492-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 17:58:23 +0200
X-Gm-Features: AUfX_mxcpSIQ4DLxW6ZIvnxFvpspk6KaYmziRMf8gxBgAEDT5L34RLygHbWHhs8
Message-ID: <CAFBinCDvwvc+qO-_-XUUf9orypOL1XJo+nukC4ZXnB7UtKMj4A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: Drop redundant $ref of
 firmware-name property
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_085835_381329_DEF22E02 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Jul 12, 2026 at 4:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> The DT schema core defines the type ($ref) of 'firmware-name' property
> as string-array, so individual schemas do not need to.  They also should
> not redefine it to a single string, but instead just set number of
> expected firmware names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

