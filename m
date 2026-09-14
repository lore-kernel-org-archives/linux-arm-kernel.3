Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B8AC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=; b=XzdkqiiOSRs5PU2GPi6rhVB+7g
	1MxVGqerqiEpA3IEajR6BAFeBO2vnWwg+dOLUIn1EcBpblUwb4++ElPE6i354QtwbWpsU1zsbKW0u
	r3GF7K+dkxswghU1GeD62l9iKUDEu31dVF2tYm31KvepsitLwG2FT+oTjulffzicCvTTU9hQSjjvy
	Sdvxm6r8JIMs5NipDCiaROrbRrWu6mNBbuIGdldtjl1m9r2G+XTDoFTCZG903SgXmkOh4b1fIoBTV
	MCzC8VTdwP0RrEHNUEI7kgP73AVMQh+tzu3eNomwDIKR3dlzX+TrDUN8GneACAHoYT4jm500gha8q
	xtQGrv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66z3-00000003pTo-1YpY;
	Mon, 14 Sep 2026 13:44:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66z1-00000003pS9-1GgS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789393468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
	b=WRApeWotZLBY2logrbONCvvHYsPobQl1pVhbLpvKLRofEXdJ60niUvtflje3TkpEbOSPYX
	TFqqXhVbkC/0dLEulpmcBcfsPob4FhpM1r79Y8c2iS8GKAoZ9UzQ7WpHE77WrUamFA/lBM
	KddgA3tEqgrXgi+GM2B7zqBcAGYHgaY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-O0Aqn1lwM_SrAJVWaIRAEw-1; Mon, 14 Sep 2026 09:44:24 -0400
X-MC-Unique: O0Aqn1lwM_SrAJVWaIRAEw-1
X-Mimecast-MFC-AGG-ID: O0Aqn1lwM_SrAJVWaIRAEw_1789393464
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so68796991cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393464; x=1789998264;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=HRanvyDsitI7spG663wRya9DJycQw3FUiaTl7CCWGeXYPQcOfPJUmkdacmJuGdJDkX
         Yv+OF9OhXiqoouqbOC+fciHobO1n7mieKDSDvsT3dHWWJLlBDRPSFvABNJoNlUcL5nQq
         ZirHtGNDa6LhQQ5bLFaccE6RUKr8YxZSw+Z9oQ4/iKSKsZsCe7smyyN6GzQzhM9qOQe1
         AfBNjdLhPKEoRYUcohy0YwEYe5xu5WqIVOw7cLqVcFsnRdkrC3ZOzBBUFWfagpkOqdti
         7iVc8IjLCPnG1eXO6lvauVZwzoy26WI7fxkGAeU2SA0WnCjU1mMHl8BSYsnG1XLwikNz
         K/mw==
X-Forwarded-Encrypted: i=1; AKwUvBysEf+mD234pcLy7p+RUyDAJAcZWnTqAiUPB1VutLxIjp+wSMxOHaGhzgteV1u3JiG6TVDar1OkxTTPErzKVpJU@lists.infradead.org
X-Gm-Message-State: AFuF++nOS/Ai8Lr+JXOjz3dEYhOBHqxCANXZsprDkVODPGYFvqUrxlxN
	QntgdsvYBUXFfQnEb0EwegADacJDoP4lSexvmDKMEOIaRmKo9NbBb1aNqwqualL243bWKrBd9D7
	vrZK2D59KTCEk9tFSpdhWVxxCsoqCsmZjOgMBJ4USM8TSX5osS4xAB/NfLMSPjht/kzd1dIwZkM
	i8
X-Gm-Gg: AYBFou3JsqFHl4TH6fG165P8DjY9Qbl2xBRYpxWJiZuCk29G3oOGuj/tsDhiekPoEDB
	QbVg+c+mBczFqZSrEYlhkQBTzMu4LPQ6Xq2BQ29FEK2lxMgJE5MBRiHOAK4/HxHnPunFusW0HSr
	9zFN+1yqkAikRZYkxMKen+Y9zd+qmfYQ0aWoKbn5WivKrR11kImgVVgglNZTkIGmAIHW8gua12M
	AnyBNpvrs8ZSdPp3yVdHkTfYd1zML71fJeUNrEYNPCTeIjhEKcqUzfIYatFsrAOG+bHtgu7ifyk
	n5AjGV/Q3wPaEYv/HkTujuqhYa0fJPKnezuIay+pR/khjw62Siojou07YDetMPOCYvNvGArL0IC
	fEUu+bhmhPb7Wnksy/nwdCIMWGUSg2Ja8xvQ=
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35836351cf.56.1789393464257;
        Mon, 14 Sep 2026 06:44:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35835751cf.56.1789393463669;
        Mon, 14 Sep 2026 06:44:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca309989sm100594471cf.4.2026.09.14.06.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:44:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:44:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf6NH-xrMtCQppv@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
MIME-Version: 1.0
In-Reply-To: <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P0d-4fcrIuUVPJVicciUoqwu9ICjqMx8dcoHuW17Rkc_1789393464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064431_404248_343C1BB3 
X-CRM114-Status: GOOD (  16.70  )
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

Hi Angelo,

On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/30/26 20:22, Brian Masney wrote:
> > Should there be a new MAINTAINERS entry added? There's currently 221
> > files under drivers/clk/mediatek/ and there's currently only one
> > mediatek maintainer entry:
> > 
> >      MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > 
> > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > subsystem maintainer similar to what the other SoC vendors do? Help with
> > reviews, send in pulls, etc?
> > 
> 
> I may be able to step in, but I have to check if it's feasible, time-wise, on
> my side.
> 
> Though, that won't happen until mid-September... because, well, I'm about to go
> on holiday (in a few days from now).

I'm checking in to see if you would be willing to be clk submaintainer
for the MediaTek clk drivers?

Brian


