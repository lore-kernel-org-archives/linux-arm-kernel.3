Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89CEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=; b=BJi/+o0sCPh7VbRUXxno8AJefv
	BLtzE6v57ETnbWGfKyXFxfwsi6E3uBl033GR8bW8FDX7kC6kdoaCtedfQOr3hxYwmPBa5tqTlqBoS
	gJZu8qc8F3jUhS4Pgl0cBbVyoEsAGEkSN0RGlZrdxWsEh7Ss9agRCedKSDjyMAmaS79LwdZvJqCGI
	ZwG2NKrcDPYez4x5vWHTBfMtipWYLqhTcxIFxHm8xxKwd7jAaL7Tjf7oiuu5qJhhEJlIbgrP1AhwJ
	I33Q4kYbm9TP/H+R48O0RazaS7BKGDUXMw7t6T+858KVvR79ElgQHhd/zlpymHS7vgve9frrN1HMc
	Q2NcThQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL9s-000000058Eb-2wwY;
	Thu, 02 Jul 2026 17:25:04 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL9q-000000058Dj-0ajt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:25:03 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92e5d50b0dbso154043585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013101; x=1783617901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=KOw7ppQDPkhINy70o62RXonOIAI9DGVEYq8rLsXDL64OHb+mZAOWdxJJZZEYox9zTG
         oz19Rl8qp4JaQNzIg2Fua5Z+0covcBawxVOsG/tHy1/a03PWsa1fXQooFLXxO/4ilu/t
         i8BGN52AaR5BpbMbebTC6wxVZYFk7oFkGITx+Eva6qD08RZTPmUkvXeRgg9kMwcMnGGi
         D9iX5ESICAlPvLv71iICKw7TjJvPBEWg/9KrLIpsdL6cCK9SE3fGgX7Gorh4p+3nlvkm
         CQ/hDgoy+wa0esA10N6bnsDKWUwDq+xlAeF7iH77SzwH+qc4a1XCqTUpp+WR5AnHrBjr
         4x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013101; x=1783617901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=V0Nu66gLaTBO7H8lGaxcJsGYZBfk79ARWRh0c8YhPQdd0ZOmHos9XGeqZs57sQtvYm
         53Sp5fhI2WcrNU/fjwwDk60hGFr1ZJOZ2soOiGgODAFJddtSClMznnO2o6X7lDB0p7VB
         NKLSSje48D8hYf3mvTl8gtF2pbZ3P0KRwfkVV63QAfu/Uzq1Pf1scjDXayKfkdf1CDfB
         HAVT8MBxbeTTdBktU0FVfLaGXnWnX15HmEPR6cWDKLQN2nSphuTbH8U4Iyq21VA7Qr+d
         Fb4Kvrh7AANU+dNH3cciD0ttM8hG7KRNAmIxPJCmdCYal99VAqTro4rSuChKrz8/h7Zm
         MXJw==
X-Forwarded-Encrypted: i=1; AFNElJ9KSB6coCiakWrDeNeBVNlhPIya33i60EnojX8HRDskT5oFOi1nrJ1Q3EknzSEwbdkBz1uYQWhCTARdBy7DZ7OZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ/Ri+YxjH1XHcEaWKhqt5oX0BPSV2qmFDVcZEqHqS9DAMkv1n
	HrLGXcvrDfDA4bM6YPIbLUGG8ribozyoqFocOGd+NCYrhMCD1LUtG5zg
X-Gm-Gg: AfdE7cmtQcXX0TqK6/KPU0dSZKOsutOgbBfoKdkN/N9/RJOlqU9Q5TlpdM9jsogvD/x
	S3NSj08qniA1+72Zl16b9cwIQPQcHuldgD0HP9yNErvPMjcI7UYeknUUbFzqjr/+cXOnoJTH9Hn
	rtfaEqCNuvRVfyfwCbvmoEcpNk+FEvdI5MpKStvbS0KQrhqxGvQpnbO1mRUmwEsPzDrYQFwImu3
	0pYF0fg3PMcGaH7g5Cnm2cbGwkv5v09STLmq0hUrPlGomqgOzRFVCW+wvGKA8cto8D3iNGZp3o+
	XPQOe20QDkmBohj928QfSCCNrUzlsJJUNaH9TjorRfiFh5pAqtNK/J+vDvYu+jGM3cuxY+Nbaol
	1ALTS4QKebqqqH4CDIsGaXqmcdXDUgaoldt69hMMzILF5cfT5wHJy+7W7a3HdOYhEyNOkzYGjfh
	d/l7jIpzcDIOcMTDML3V0OXO07rd7XE/rCj38cqwHktKubkxn7ATgQf/e1USI6xGQqx7mtzw8=
X-Received: by 2002:a05:620a:4555:b0:92e:44be:bbd2 with SMTP id af79cd13be357-92e7afb2399mr780848785a.9.1783013100344;
        Thu, 02 Jul 2026 10:25:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801948a8sm265545285a.35.2026.07.02.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:24:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Thu,  2 Jul 2026 13:24:56 -0400
Message-ID: <20260702172456.848487-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_102502_185504_31BE171A 
X-CRM114-Status: UNSURE (   8.78  )
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

Hi Junhui,

Register check for the mod clocks in this patch against the public A733
User Manual V0.92: 88 of the 94 mod/mux clock entries match the manual's
register offsets, with the documented gating/mux/divider layout at each
offset. The six that have no register in the public manual are the set
already discussed in this thread for provenance notes - avs (0x0880),
spi4 (0x0F28), sgpio (0x1060), lpc (0x1080), gmac1-phy (0x1420) - plus
one more: tcon-lcd2 (0x1510); the manual only documents VO0_TCONLCD0
(0x1500) and VO0_TCONLCD1 (0x1508).

Thanks,
Enzo

