Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DF6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hs/qnoFpXT5mzrFh3FYSbmqblVEDjKUtya7k9IFqpzY=; b=hSS4oBA2RzdXo5Kum372Vgn5wy
	+Zu0QEFMpc1aeBcbrywR+hAlQFOg4XjNMIFkhOedJKTg6+ohasJRhNHqe9j5f7SYuth1SWDHmskcu
	vukG5J6DtlcnWG7OUS3SizRYwV83VxwWiX65Fg0UqXroXxH7xjHeqrLq4SlikUx0MCqPusl92WMMX
	NvQimkK3FM94Umq5iu1RDG/3re1r5/w3HhjSeBindjpiC0iVOhAzL6LKpvl9n8XYkxy1F0pWG/kTJ
	JkLDCFUwoL3YGI/ggf1i461KuweSu/33M8fZC6/oHzEoclxm1D5Kd8coDvRwixabwwoBAEs99DDfp
	tPquxKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTnJ-00000009gO1-3BGb;
	Tue, 18 Feb 2025 20:02:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSvs-00000009VAC-2yhV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:07:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38f325dd90eso2454871f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739905619; x=1740510419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs/qnoFpXT5mzrFh3FYSbmqblVEDjKUtya7k9IFqpzY=;
        b=LQBUn+fvFST1S+hgeQ1iEXJ3pKtlO65z7X+SVRVGJVmXM7q2g4YL4mu9uN4QccI9vX
         MeaPLsa02JAu6Ulfk/7y73AQuUlzu+xIBkITwVMlIJ9+r4RHaALLkaqPTsBay4wfPXjM
         slsUpsKUbiZb5acSTaX81on9/82aAs263KCQlQxA1uQwLdZVMc/D9Zdvd0sj1vSF0uNb
         BU8xMYaovoMojLEOLE9oYXySm6ObORryy5S2DrobH2+D910/EOSbOO0pTmytykBuxpTq
         41KhesuZBDqHAHr+GYBWWMKiIGZhAmXTdwPLYM9zhdXF0DT8rJ+rPVQqjsr3lQnFYuU9
         KOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905619; x=1740510419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs/qnoFpXT5mzrFh3FYSbmqblVEDjKUtya7k9IFqpzY=;
        b=YIZnAe+zhHYSC1H9QR8VEI4i5iq2rtpG102WYt2hpA5B1suVlqTUuSA7+T+AsKxISa
         Sram0BZbNlt1jsur+jCGvJCjuvin8vYfdzNKe6ZEuLT5zrtyx3sFyRS7/lOQ30sRRxY7
         LuWypUXk7Zup2nTHpY2CembFwaF5m6zYypxi7g7RKj8CTdBv7R45Ftx6pxrdlpyVDG4K
         QbHF1MbOEZtcQvdG0ldGZjXmvwtXGdmg5m67+JkNbRCrS5gFe434X6rPyRw4b4XpJSk+
         cKuoR9OyaVRxmK+u2YczEZBKyRsQgtxkuYMaVNERNlpKfEeAdWq1bG+IBhnbf2OTg1YJ
         Xf/A==
X-Forwarded-Encrypted: i=1; AJvYcCWWz2N6Hv5IuZa8T8vs30apy7LN3b9JBZ8HvsqgyjVk1X1y1i/WOV5nPJxv5n5UcBIn/9nbbtWmSoblE83FOQeA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ywXYUgvzoRNiefmNz22z2VYdvL5O/My11h33GNJBqGlL8i1M
	uDS28fzAkfRs/ufqnQAXM3Uk7IR7Wq9MQmObDbZSS/7TvMwYL6dU
X-Gm-Gg: ASbGncsUd+/WiuINHARGh7IGlPFlqsHJ89V6Ma5ilKTlU9fcAHVrjgBm2lHurGwkG91
	3j7QI0AyXPnpEnE/V98F6AO3KuZp4hr7ggiKHOWUjo6tfyGGHd6Bs6pjZoVotLMvTVlOa44rgtN
	/UmEjV/t2uYaMtK1b0R4tFUbiN/4PsSW+/iFiQu0THKqOus7huGL4Ph1oRnNdfuilWK+7+W9Wiy
	RA7OPTbWsSGE2c0WFUr6kOUNHgz/aFlXIt4ViSU3/pYGgJcO/v1Q3/vzgL6cNEaY5TBDw6Y+m4Q
	qfQdBfSjlLGIGha2KnQR4GUYgbnVWuvIG9BFGL9dKLEWU4Ljl9sgOSCq1yTwV5PnRIw=
X-Google-Smtp-Source: AGHT+IE4Ztj3fqoFCu3fT1sr18ZtU3QldzSJQ2PYy4jRgkP/zHxGfnGiNxC0aElqmtmZKg2tXOMIXA==
X-Received: by 2002:a5d:6481:0:b0:38f:31fe:6d23 with SMTP id ffacd0b85a97d-38f33f2e91cmr13677516f8f.23.1739905619006;
        Tue, 18 Feb 2025 11:06:59 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43991c84fa4sm36268225e9.39.2025.02.18.11.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:06:58 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/15] clk: sunxi-ng: a523: Add support for bus clocks
Date: Tue, 18 Feb 2025 20:06:56 +0100
Message-ID: <10610758.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20250214125359.5204-7-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_110700_749471_6044FE68 
X-CRM114-Status: UNSURE (   8.61  )
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

Dne petek, 14. februar 2025 ob 13:53:50 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the basic bus clocks for the Allwinner A523 and T527 SoCs.
> This covers the AHB, APB0 and APB1 clocks. Linux is not supposed to
> change those clocks, but they are needed as parents for many other mod
> clocks.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



