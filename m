Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=; b=iQIpE6YLIAFhYAqWLjftlZbXw8
	mveQdyLTdXS1wDPZUBzc3kL8H8KnvjO9kTKN0h+8ErYD6651wBJsR43CYAn++ZF54zmdfoJ5dAgM6
	bmnGLIMWAOe2AVQW/bzTLhNo83IS3VIIY6OSrXg+Bq0hUNpAtuJP754brPHwY4F4W1FEbmwJ0Fem6
	hfemCTOGlRSiOE3jte1yq98SAXIjGSR9JULadKtTkfjt97xG2sVAImgLYdK1xEqC4WHSuU483O6XA
	0ly+nV3AZQ/2cubumIn29ow9FHKnlgfl189aOav1EcACC+GhEez5SbAUtiw8BRPDnuaM/UhNmG9hY
	RS8ExT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKvp-000000055zo-2Dee;
	Thu, 02 Jul 2026 17:10:33 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKvi-000000055y8-2Gn2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:10:29 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-664e3ed58bcso1146598d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012226; x=1783617026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=EOGOnowGLESPgxZWWW/BmH8GpBneB3hMTb7xexF5iGnFekUyQavbp73BEJytISgMnL
         PqXKtFM3+TR7kmcRSaWnUOh/pr6pIm6/oiRIT48QBA3HNZc6WmAom/HzBBe6k/KvgCD/
         cCPvRydP4zASFtWq4mzFRbGZGl73T0t3q8RUn4fOhbzoNUYSQthv9CDQLFYQJvOLFliU
         ThuoIIYnpUryEOveEfxTMhpSFJ57c3YdGuSi/bniRF/L6H4BpYdg16hby18ApHuPPgjI
         v+dMKUEiGlxtjgAo672m+nwc18EYwwHlvtyM+0Xg2EXt6QN+IAiRxL/nURKBzkyvGFaw
         R81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012226; x=1783617026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=RTiDF59chi433G/eGooqD/+aEUbUecb0JdWoRLOcegztbpTPcSdI8tKAP+i6EZ5fd4
         6d5tR+NHE9cQs7LGspSjNCSUE8sVYoBbshQ/ndnmZ1Dy/53KDSB+jHNpdsFb1TrM5nSG
         iHLOzt79PQRUdfb+DL1KVyF9tA3MQSjxMVhCigCRRYgMka3Gx4E4LtrzwoWQWIus86JS
         E8fo994UpoiHxmOx1a8moDIebsZrPomiV5x3g3iujbobOuKJtrj4LxIWnDS34gbLY+A/
         HkYMX+4NaS2ey4K2FdJHdDQyGS1J1PvDYi8T7QOs0eh9hD4m7KSgMfhNHMMB/Z9DtmPZ
         ZLaA==
X-Forwarded-Encrypted: i=1; AHgh+RoCYW4DtJ/ceP0XCdBHjLYoITLYtnYNiIc+nCdBwpctpUHC2zq3elue6I3ULot+Q+dm/TpUbOgkwjvhFO61I8dN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2DDd3sDN3uD646v+oluAAxECOg/jtGPpwncxbERX3/7V0mg6Q
	pf+tkUyIR+QD/g31YjL0hgpPr+Hj9W9BqQfNrshHk1f+p/mjuHHlK+JA
X-Gm-Gg: AfdE7cmO3VtdfaVIqCLHRyyyrNpVvsgbZa8NGjhHAL7e7xTaAMqmGjt/3O/KcBz1Ps+
	zLgud1MOQckyLPAQ5Gt9iiCi8GWR7F1fYTk1LYOxX6SQsUdTy1hLXlvPEzlnjgYMNeIabNli8Pr
	0keZaNIMSFG6V3x7VB2UtKrk2oU9HkeTdZVaI+thQaqyga8gu4xnFQ0kUJAlOwoQ2UQHDO1CEcq
	d2BdP8Mq0pEfbe3qX9mo1HDlvMDdPahCkvt+H12DAhJLlKDTQpjD61kl7xlkNBOuTHRf54SmNwB
	wNFgzSqb5NmjG4pld4cItNIHgeRdwoe7FO/4Dos61Kf39OiwoAXkus22ay3HEr80xhPkJPWeKfS
	kxUPkgFCFkRXAJrT4heGvyHTDbuo1KFvsS1F365l0rC0nW1mBqErjN3GFt/KqlDY3AlujdIXXlN
	Syx6j0dk39xYLDRS/A+As1mQnMUWHeS6/2natzqAh+c/nh97l5og4DJ25J/ajt
X-Received: by 2002:a05:690e:2447:b0:664:f562:1fa5 with SMTP id 956f58d0204a3-66636ba95e5mr448218d50.46.1783012223973;
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1354880d50.11.2026.07.02.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
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
Subject: Re: [PATCH RFC 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu,  2 Jul 2026 13:10:20 -0400
Message-ID: <20260702171020.836546-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_101026_577624_67D4C646 
X-CRM114-Status: UNSURE (   9.86  )
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

Register check for the PLLs against the public A733 User Manual V0.92:
13 of the 14 PLL control registers match the manual's offsets
(PLL_DDR 0x0020 through PLL_DE 0x02E0, section 4.1.6.1 onwards).

The one exception is pll-ref at 0x0000: the manual's CCU register list
starts at 0x0020 (PLL_DDR), so the PLL_REF control register is not in
the public V0.92 document. It does match the vendor kernel's CCU
(SUN60IW2_PLL_REF_CTRL_REG 0x0000), so a short provenance note near the
definition might help future readers, same as for the other
vendor-sourced entries discussed in this thread. For what it's worth,
on a Radxa Cubie A7S (26 MHz DCXO) we can confirm at runtime that
pll-ref produces the normalized 24 MHz reference with the hosc-side
clocks reading 26 MHz, so the modeling demonstrably works on hardware.

Thanks,
Enzo

