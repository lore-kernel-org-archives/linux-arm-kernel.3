Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5ECC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=; b=j9ijdEBl+wbNkXn0YyMQaTs233
	JwrqwAGbehDhBjiv1yysQBl4iDRPlb4w+tZwi3DRLkl0mAV0uK/48l8m17TIYOXry5P9caAOytMux
	Yn/UWL+UbYScqliE5xQvCDxMw+Y3CHLX8PReSTOQtz0ND8DPppOPrcUylGXZsmaGw1NvWBhlqXJDq
	DJsu4EsQjhRF/esyEM8Ff7va7t7FKNtKX9yzXYEAAnWkPZTVptpH9OtgJOwrW2cp494kJcJdraFK1
	jhyeVXeVjzE18Iyrn+BxV+gX5OOhCRstxwP1pL1wikdxZ4sog+qdD47bStcUfzgB7qsOdLX7RWqXi
	SXfNk07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IeK-0000000Bq6z-0evS;
	Wed, 09 Sep 2026 13:47:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IeH-0000000Bq5q-1Im8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:47:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so47115071fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961655; x=1789566455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
        b=DLMXVq2SnzzgtMnTphFXtxPTTul6op15saBz766EZFV57tpeyn5Ye9oN0PXnuCtKtj
         h1fy+0P112f0HccTfcjhZMKIW8b88oSoztSIdq1AZxR1PJgvQBbnfYmBNpJHspN9Ulor
         mU6F/TF84EhFPa/1LT2ryQQChvxfpghSlTsbRjDvWhsWBpR7jqKxEiVp7ASYIygFOmXY
         U2WKU5LaGUv2znoWtvFzaICuGx5dFXU3E4syvZs6fxom5HvTfUK6Gt+xqXSh6PAa9Q1O
         6pNKEfVBPYUSTeJ8ZTiGMcp9uVjSrq0mJS7awQtCojx/eO3ZP/KW4l1yN/8aNbXTB/9E
         laxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961655; x=1789566455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
        b=TF4XHoz4j0LAwU/dlkNQlq01KgHutXfC+sqxs+YcVVe8RH+AugGY+2q68NXoishE8o
         GFy8krRMURO4cfCVyZpKWa47VRSdPkVQsCcwfeKAX7YCkibB3ahoh+PCjwyK4RwlHAXq
         sECONaShtybn24OcjRpS390l65z9KWHUxNZjcqKQ4t3J9eP4bqfxKSz+7q/l6RnCFXIK
         HnCfZwEkMJZxmQk3BztDHgWnntRtnxKlluy/KEj2aL/UgGkw2UdNNwDUE5ePQwaueXIW
         OkZO+9Xz26RlCUK72LGbn6fejtF5joc4kC+lOUnn+vK/nyYgOi0Mn7ZZRWCliGANmMpX
         UqCA==
X-Forwarded-Encrypted: i=1; AKwUvByXWSSyIjB72Pg99J+q5LiQMchT8YesC0MBiyL5FfdMyEKD39bqfEYV/rtd1sGXNCC1FPb5rNxaA95FNHZs8npc@lists.infradead.org
X-Gm-Message-State: AFuF++kHEmJzfhmpwfKI3qBWo81W08AYopq+WR1hF1oB4UU4ZMqMD8Zi
	vCFqySAZIPgOjYERrKtnrW+FDg5ibdaLROH0O58n+KCqfe3/nLfVmjIx
X-Gm-Gg: AYBFou0CfXmZExB4y9HOVjpACIjXszAqnwF2vJp+LRHd0fuEVGJ3FwmglP1zKS/wSHe
	GwrqfZyoeX+kKR1Y2bYjzuM1GNDKBA+8uXoyJs9BOIdv5Tj0iu/8P+L+0gWUtu74h6tmP1NB7Dx
	vNIffKFTc/kuXnwBcboxLOrSzVui4tm65o5+5yOeb7IA7pntGc6GfkdUEgtYWeLcfJcSpvM+xQk
	H1xnrt7jOao6kwrb8NbE4HZVVfyjyBbCbnYubU6g1FYv+9ruOS94ZaKrpT24YH6r4UBvRKLhRa4
	D1eIJKolgExBejSI5Ui9ujocaUwqEhdjNB6wp0BCrc9/qWqiKw/BI0buSZUG0MDw671AbmgDwq/
	EX/s14FucHVyCWcR83dTzIiefl9kwhywMs5B+21t9h2XDaJXvqP/+HXxSsBcFO7DS9dgQxqJiKl
	MlwtTQNjAt/NsRo4BoTci0VZzrHO79ov9kFlgAyydqZdQ8yrTqcHAaYysfXTF5mQ7ggTnuSwC1W
	viJt6AzOTy4JA==
X-Received: by 2002:a2e:9fcb:0:b0:3a3:7681:6d72 with SMTP id 38308e7fff4ca-3a37681756fmr35983981fa.27.1788961654972;
        Wed, 09 Sep 2026 06:47:34 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a58f539ec8sm136161fa.12.2026.09.09.06.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:47:34 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: diederik@cknow-tech.com
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 16:47:31 +0300
Message-ID: <20260909134731.364-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
References: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_064737_360529_D153FAC8 
X-CRM114-Status: UNSURE (   9.00  )
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

On Wed Sep 9, 2026 at 12:29 PM CEST, Diederik de Haas wrote:
> There's already an attempt in the works to upstream NanoPi R28S support:
> https://lore.kernel.org/linux-rockchip/20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me/

Thanks, I had not seen it - I searched lore before sending, evidently not
well enough. That series is further along and covers more of the board,
so please drop mine.

I have the hardware and will review and test that one instead. One
finding about the PHY reset has gone to patch 2 of that thread.

Andrey

