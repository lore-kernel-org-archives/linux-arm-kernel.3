Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F33CC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=; b=iY5wsWudG+87OscwY0B6kBz3IA
	CapLxe6ob2cztFiwozwTOVoOsPTx2L09dSZrxi5oNCy7Z1/Wb3eAvTLo8CMXb6064hEO5lK7lgsCU
	eIMljPclwke9q8Wk/3Ej+NDKMvuaEyqDEjwbabztde7vuVfsyPVS8G1c2AtQd5OKCg8VRDTx3e7fr
	S/5e7d9ffgIu+Tb35RPzEMxs+D0wGA4SloIYbGpNS+PRtmcT6rdifrm/QKYu5IgLfLwRqbhQSVfPo
	viYtQmtfenaqjFpfg3pc2DKvm1nl9nj0/n6E2KywbvEpt6aUUtW+BLppGHWTrL+nRM/g8P940fKmT
	d+Y6dOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwIH-00000005msq-2hyK;
	Fri, 28 Aug 2026 13:06:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwIF-00000005msK-1f1G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:06:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-495590dde14so9051255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787922409; x=1788527209; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=E6Q28BqMXrpp9imkNA0No9dHUTA3bWoqTKXOFFR6MJGrl85WxPYFvqSn+SoIZTMeZ8
         zGHxWV8+1NcHANRwc9gksHRqgiCDeaVEAbqXUlqPWC0bs12dtmwqN9xMA7pYjdLdhxEW
         F9yL0vNKmwmz+4SFZHvkS6KA1QpKGH3QuIh363DlYVcbRq/3ilQkCmxxSSZ32zTDx9ob
         TzPjFd7tnVQhzBhh95pQyor1PHJiz6kNB1guMZE0idLAFCrFPciD/ReRUofUF5hvWMka
         sIaIHrQBCJbNnItEZleA1zFR2shWgmSMvBEVq/QhAAfU1Gk1E84pUDCBoEF5w8YJFq7j
         YmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922409; x=1788527209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=QMMX1Mc7hHr0Mm0EzOfJkrMpLbnj1RH40AtlgrT3rCtbUutSPuefSn3GZ1+0FsbZ8f
         2JnVYzzRRlXOt9YxYlb6BQSv5i0E4Dax7FYjsJOR+mWVpvP6eJpOl8yhUWnZxArvFLVa
         pWbL+pb24TYwEtm3nfKggZRnNWKtQzagbvTMhrqEnxXdRlXR2iUJvA5b2KmE4AXS0tOF
         zG6KI0iHwl5yPwu/5sg/xYAaKTiCGPz5N8cYIqI9oRNTP/mLiWkJ9f89Oqlv3KELgrd+
         ypECIz34cW62gh0pMVPj/PCARwj8qfkEB+R8vO2L+Zv0NyvGKRYQuu++UhDohu/qs8VO
         TrwA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5B1gO9L8zwRmho/gc0etmUlsDQWR+UzZpz8Fu6SpqXjmc2Oquvnry0LXPBO0HK2QgAd/gnFUUrx9Nb3RHJ87Z@lists.infradead.org
X-Gm-Message-State: AFuF++k7QC+eNgQ5jSHIzMnXQdkBQ112L50qIrVneKX5RxSw+yVs7+pv
	iMLnHh3VVtch7JpxuDFDfZQsZpMQuV7CY7+E3AIKlPNQn29Xxo04PDBxuOJB3Vn/gOk=
X-Gm-Gg: AR+sD10mn8rBQXkJoIP6CuA87LqZdgADt/bMPcM972L0SBHnwQ5TowgJ9pYi3MPNjn3
	AvMDAiSIZbkpsGrpas7rkiXJjRT0NY/dFg5qr60b/i3K92QPn40Yl/rK8WWB7988JorGAgzWowr
	+WXUMhMxf3xhjA+/2hfsbkqKeOAqgHBDPupRRC4XZzW85RGss0S/hxA7U7MAJyUPSr48GtxUcVN
	PWE0rqmGVBq75ri+pYWUX+hrrJq/tGuklGTzGlRENp/mSusUbvJGJiWHKH8elmHbdk1Sr2aQD7x
	/Yklfzj94rI5/odDwqaOmYRFcZ3FnCeAQyF1ekV3bM6HruleBv/j5TxThjQ4nde3Uax9G66u39i
	Wwx9tsBISt7lz9ya03U95dhtqygW54P0RYJ8BPzTZFJZDBX9V4afBWSTFbnpwuzIyeyGQAKILwq
	aKlh9/rmcHDBDdrvKa4GOe7S6UsgmBzqzGBBFmoWx/smvJygOnQET1C2VhEZPnozlZowVewq9iy
	rFKA9tceZ3w6J3ndaOzJCLdcOgg1cDR9NVHCFA1kXzQE9mUxwVelbwdpeAXuufAj+fzS4/AJfJS
	LWI44OaI7TtevYtPuPvwWMN9D+33ueFLQMSl0euKRr8fosaune7iLYv+XJwVdnMBSwcsKBXxlgZ
	AD7Ev9yrNZCs91feam7wzuc7hA8WegX0R8UACPVzzOrINh+W2offvHkfDBCjNfwSAx+lfWyI=
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr97741555e9.5.1787922408578;
        Fri, 28 Aug 2026 06:06:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm53999285e9.11.2026.08.28.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:06:47 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:06:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 0/2] iio: adc: Add Axiado SARADC driver
Message-ID: <20260828150644.00005d5c@gmail.com>
In-Reply-To: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
References: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_060651_482495_BEE5D2F8 
X-CRM114-Status: GOOD (  17.18  )
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

On Fri, 28 Aug 2026 05:28:27 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> This series adds support for the SAR ADC controller found on Axiado
> AX3000 and AX3005 SoCs.
> 
> A new driver is needed because this SAR ADC controller is a SoC-specific
> hardware block used on Axiado SoCs. It has its own register layout,
> channel enable handling, conversion control, and data readout sequence,
> and it does not match any existing upstream IIO ADC driver.
> 
> AX3000 provides sixteen input channels, while AX3005 provides eight
> input channels. The driver uses SoC match data to select the number of
> available channels for each compatible.
> 
> The driver supports single-shot voltage reads through the IIO subsystem
> and uses the reference voltage regulator for scale calculation.
> 
> The datasheet is not publicly available. Public high-level product
> information is available at:
> 
>   https://axiado.com/products/#AX3080
> 
> The register definitions and programming sequence used by this driver
> are based on Axiado internal SoC documentation.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---

You didn't have to send a new version, Jonathan tweaked the commit and
applied it:

https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=839dc31a0c6508354b18d09a9e5aa5d8f4c05860
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=205f4aeaae3148848c153a0d98a6f604b39aba7c

-- 
Kind regards,
Joshua Crofts

