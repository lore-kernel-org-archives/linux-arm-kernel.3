Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C90C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=; b=YzXF74tGr8z1E4fGU2AuV2ZQxq
	BWDTWrF4BmQXLRsdo14GiKkEwoAkbKFSMWWBSl7RDq3Pn/yBVbJ2gnqes/uqxHzjn2ubRtCYo4laY
	1DyaGtTDts88bngTzQssBENwZe4kZV8z+5bn6JN1GJvcgyjaBlZwARdYaNpHojFyq8OjBjFAzHLsH
	lBTSje3B70mb1qonHnLXbCXV4eF2Vp1TU9LasAbSnHDsIWzxL/zFZ827kPJgb6G7h3z6hVeWmkD/I
	U4GI/HxcHIqBtHrsGfSJpW+nPEZspcygoHl3HNwqb9ETx2VdQSZjxCk2JGEPS8QXF0lp23yITH0Br
	Dp9H4npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtuw-0000000HQAk-0tyA;
	Mon, 03 Aug 2026 14:45:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtut-0000000HQ9P-1yMW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
	b=ik8udXTVni+1mP7SuB2+yjipiUGmZOk3GH7wijrMJC65BEMp0VBleds2Tt5zK5Xrbw610n
	7MncY7ic6VxbpSjfd444f982tZedrEMxNJV2K5IQ2sqsrggCPInynhK5rov942hsff7iAr
	DZd7RjAlLS44P+xR6fatyBqP0oiRs+A=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-Tzg1Sk_TPDqcqv3ortgzQg-1; Mon, 03 Aug 2026 10:45:16 -0400
X-MC-Unique: Tzg1Sk_TPDqcqv3ortgzQg-1
X-Mimecast-MFC-AGG-ID: Tzg1Sk_TPDqcqv3ortgzQg_1785768315
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81cb01c07b2so60019547b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768315; x=1786373115;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
        b=qVuevojRWIfdlHWckX0zHyN3rOBaIlLRQ5u22RMpusBo9XCCMPljQbXdicIgFbO9eP
         owLd6D5AHPWSFBstj70urXrnnzjyeMpZ6R5KgqHamCyp/zg2j78DqpMLvEMxS89VvPiS
         RrVahQ9aisoNtYH5CYu5g7atnW6R968lZ4DvW+Jggeo/BATtpsqaO8HMAFkPGksT2WPv
         bsCt48i0O5uIkHpvrn5b6QHmctz/o+LIA5Dvyz/X0Pk4Hb9He00mHCT02CQXoe8+johs
         Br+qoVdpRB/EXCJQVnhjHobnrVh7rsx5l0VWv+OIrx3vz0iCafXk/LaW4OYiHYSZwvFK
         /3lg==
X-Forwarded-Encrypted: i=1; AHgh+Ro83qd1qSo7JNTOINfJL08h3OXcmKz/9/OWIvQ1mLrXGEixm+ikIsay1HKFu5MxVnCyGYjTMdvF2hxbY+tM1Eqy@lists.infradead.org
X-Gm-Message-State: AOJu0YzCfHLmAUxyeU4rKmu/QALmtkOjBMY5AeXpBzs5i2q73wGTDh52
	TH/4T1Px1caVZ7EB1rwt3O9RFwrlxlu/49FRwLDB1uRSX0crE95Z3pcpynzPNLx95pVUvvJYAEQ
	z9MN1hAE7BKnz4C/6skZ+qOK++4yDVRsDNdXGPlsF77Y1pO6qNPHcDWMbBGcAQnbnWkoVQVUf5Q
	NX
X-Gm-Gg: AR+sD10H+xMdkXKaG9ZZBIRoPUpbBz+brzuYLXFuNovby1n7TKxxEKaoIOIsRPADcvb
	+DOMDeQ+7VeL/sSqxQgxxv7lS1z0zgYQ5gA4PvNinf/PMbSJrgD6CRtLVpkDqcD1Dm0gEon4LZX
	41mbD2YbIvLB/7YKJGEHJ5n0c7VdMTWI0MQVDERbkXc4XG+jboKsqMrpLcbRJOueT3UAUkpvN6e
	Aio5J/y737XlT3umNW2ySs3Eg4CnmCsvraH6BlHSn/OUqnBzXARTSQQ4kU0SRau4FfJ0rnQp7Sv
	R+Pro3hpeEjqgwh6Kfu6pwLmzkQOEzZT87dSvMsN+r0Oe8IIfGxGMQHTLSRC80SRg7GnBwR4yaF
	w5+eUrWEhLbY8vfvtK78OT7X140qV125L6Ko=
X-Received: by 2002:a05:690c:338c:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81fd4bf5dbemr122418067b3.35.1785768315484;
        Mon, 03 Aug 2026 07:45:15 -0700 (PDT)
X-Received: by 2002:a05:690c:338c:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81fd4bf5dbemr122417297b3.35.1785768314956;
        Mon, 03 Aug 2026 07:45:14 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf841e1sm56661767b3.18.2026.08.03.07.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:45:14 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:45:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 14/25] clk: mediatek: pllfh: Add configurable clock
 ops to mtk_pllfh_data
Message-ID: <anCpeNMp6XQPLU4R@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-14-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-14-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kXpV8RH12dzNNBKG_prpIKWEF06OwcFgcSPsNBgzABg_1785768315
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_074523_577373_7C7E03E1 
X-CRM114-Status: GOOD (  14.25  )
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

On Sat, Aug 01, 2026 at 01:21:00PM +0200, Louis-Alexis Eyraud wrote:
> Currently, the mtk_clk_register_pllfh functions always registers the
> default PLL clock operation set (mtk_pllfh_ops). This does not allow
> use a custom one, for SoC such as MT8189, that needs different
> set with support for set/clr enable.
> 
> Add a new field for the ops to register in mtk_pllfh_data structure
> and use this new field to either register it when not null or the
> default ops otherwise.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


