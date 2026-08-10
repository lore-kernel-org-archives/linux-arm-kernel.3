Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53A3C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=; b=DRrjfK3lWS7DtRvXNEnpG6X3W7
	OztoWIz2S5btaQ6OlfK8U1Ag6lIk9u4Sgzo9pRuu5R5W9VFvqZnCe2iqVEmVjg6Q/eBUiezJNsAMz
	8D5PCCVUcpNh20VFskByvRdkLzzTnA/OHSpQP229ZLXH7mwb7DMuLZn2NDXURTThNLojObsFC/PLf
	GumUoZpv/b8nBzh4CGkReXjIyLDhzwTasbHLRsp/o3M3gr+8K07hqK6WlqOpaF0HXRso69YUXjANJ
	Ki6g609y6XDV1y1Fdv7mCp4KcW3bXW01awH7UywrU/Aqpx0tOIDk4KGvs6l6u9S9pFfNXLy9dfttV
	bqcBeypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXcC-0000000CudC-354Y;
	Mon, 10 Aug 2026 21:33:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXcA-0000000Cubt-1Y4s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786397577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
	b=BPFQchfsAn6968le/xLNeMPgECzIqr7kONUSGFKNMZj/K0LQvzMNFqSkZu4zkUOm9a8zr4
	YeVPMg7EvAdv3ahP9pGmH5g985cbCH9qSeKqcywQBMKxfCTrZ26kA2QgMUoP62dQ9k3ZYj
	HCdSpZWPge32iLA0JJTLIasmTIWfsOA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-eKwIF1l7OjyVvzUN8ltoCQ-1; Mon, 10 Aug 2026 17:32:55 -0400
X-MC-Unique: eKwIF1l7OjyVvzUN8ltoCQ-1
X-Mimecast-MFC-AGG-ID: eKwIF1l7OjyVvzUN8ltoCQ_1786397575
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f5b54da461so32648197b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397575; x=1787002375;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
        b=HwyjalqWSDlFHVKUMzZ+/1j7oDAogjpCt/WyCRdD1a/HN0BIN5KqOv0F0KGKv1VGqh
         6z3zFDTrb2s3VoHeZoJq+PYsMqdAe+p4RL+YFADW+/TKPIyktKjONAvFeqkIm+2C8cTN
         ChTf1PjWNz/owc2Wgm+i5V8PeqpNkLn0WoiA8gXnakwZpm5NG7EXy18WGJyGZQU7oKDc
         yDh8/qKVzeX1D8dNwE+Mp7eEpTtTXDK45l6LYHyfbr2ajTkHdnM8hwFVMOmu6WCuU21o
         SEWiHrjbCGj1GEtSKQBfk+mN3ewQfvwR388kIWWywXqe6P6cBGGYj1rb0JDmpEpLl3Nu
         0j1w==
X-Forwarded-Encrypted: i=1; AHgh+Rpzoi3K/YMxIT4O1fpoav6PWtGU+4vaQQtYScoqdDkV2NAXZGF132NBMqLug0SkUcsHZfSMbX6jqamBfYGr8Dnq@lists.infradead.org
X-Gm-Message-State: AOJu0YxrxVWO1xmcXeSQOkttIeIkVn4tFfsFX/3by8k4lZPGAUhu7e6v
	9loNCz2i+Tq1WlbSFCiwaUhqpmH/ROv29B8EBkaQPi6N/kEltlx93jxbfmtNAAXNf84+7TBrFgn
	srERRRvnZwQ9s8J8vUcYbN7NHkS1LmiM0oPcZs5Rl2blFCsMIjy8JF89vbU1zVZfvuutOnRJQjO
	OB
X-Gm-Gg: AR+sD13ww+JMjpWVQViWBdT+PRfqnfTPtlojx7bl4CeYa518oDX84c1cUssaLbLKNzz
	MWQJCQ6EkkcTJ21lVevbyI93zehlYiFQtrUQm41RTkprC9Jg8C8qiYjOdBTCy9tK2c79cph5p5Y
	cp4Cigs0vDqumtoHQP8Nz5LO28n6I+MBDkOPp4wTXYlGkUtoHNUL+1vPR1AGq/qwiqwLKPbWB19
	VG5ERp/GPMl4DkuYfkasKit8O5CwRY9BSJz/Kwkm8rFO+tkc2Gywn2Vgq0n57LXqQzM8D59qwwq
	h7FK02GVUu4gzey50l0L35StvVVKwAFJVRcFdpDU/0J9Y7sFvxa+++1cZ1EwHouuQnxJGd4FFZw
	TElS15yO/lXufk0T0m6ZS6XQdrop4fKxw9gc=
X-Received: by 2002:a05:690c:7286:b0:81e:6a10:f90f with SMTP id 00721157ae682-8225ba2bd2fmr193701477b3.17.1786397575341;
        Mon, 10 Aug 2026 14:32:55 -0700 (PDT)
X-Received: by 2002:a05:690c:7286:b0:81e:6a10:f90f with SMTP id 00721157ae682-8225ba2bd2fmr193700877b3.17.1786397574844;
        Mon, 10 Aug 2026 14:32:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f079a0b0sm63450967b3.12.2026.08.10.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:32:53 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:32:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v12 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Message-ID: <anpDgt6ZlkFE1ONH@redhat.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-11-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260804163807.1285869-11-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e8jNFccPdvMhQtdB7vSS7a2CchvsL6vnC6ZVYWklddE_1786397575
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_143258_479271_2C884875 
X-CRM114-Status: GOOD (  13.40  )
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

On Wed, Aug 05, 2026 at 12:38:06AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


