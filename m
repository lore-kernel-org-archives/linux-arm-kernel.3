Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2717FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=; b=ySePgeTAtyyDuXXik0AGhSAa/F
	tFkDZ6Yjenn256pTdCCzTuEMsrSb64+cmeWw5WB6H41cTvmENxRRTaa2BSu/tY2HIUnJo4J/ZyF7r
	FnpOS/e/vxiXJ+KRkjp3H/jhG+sqnmE1/T78oFnm5x3RIRA05XQZlzTejZ+cwciYeoe+5gEEzx3Nb
	pB5g7mskVzm8Y3Fn+gNNg9ap34cmbLC4g6Kz3+ll+c4hhkwTLjPfmwTBM81c0tYdLVZPWwylRGguI
	pwCIT3IVmpX5BOlTWsEGPWs1CViLIMRtn5qPoO2cOhCzmWuQWCjiTMelG4WJbV86QLF905g49motI
	eVLWrA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglO4-0000000CuYN-3N5W;
	Mon, 06 Jul 2026 15:37:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglO2-0000000CuXW-2xEK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=;
	b=NMJ9GV6cX7vFnkh8V5Y7gkgaTzvT1TGe5GHv6a1bwzrbGDXQ2v8QiUAccjZ2lEY4LKx9TC
	Y6LXx5qVd3QICFyUMUiqmXeVM6OYAxgwD9YZNJ536V3TsRGUK1u05sg+Mq2hVWfuiA4RWM
	0hnpxtgAQsRdrKkDf2LUa03SwNMMsXs=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-IEJgmGPtM8SrMqviTmf5yg-1; Mon, 06 Jul 2026 11:37:32 -0400
X-MC-Unique: IEJgmGPtM8SrMqviTmf5yg-1
X-Mimecast-MFC-AGG-ID: IEJgmGPtM8SrMqviTmf5yg_1783352252
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6677ac73e1eso795713d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352252; x=1783957052;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/pDoKEoQmk2z1wFY/sJFIdvOlkBp5OVP4wtVG7Rdj4=;
        b=JofsLtpW0IJVFlKUQvsgonDvTxnsnk/jP/yfVAVv8aZnYuPtOf9A5bY9AYkJIVwI9r
         F+E3RATzlznWPrrB/VYKu2dFeoL16eVb0Y3y5mpVVbQDShUCVKjNDwzDNrZwNfH4MQNn
         Y32FdRoY3fLwhfs2hxArQX996Oh55bfZMOHZl5QnSx12pmW3rnOlvY+dFbUPoqbnVMki
         UnIbzEmLgCdBvRyNunkZ9zG8wUXCcAEGdrZHil2QOvf6C3xkhgitzbsp5UND01zKOdU0
         yNIZGUClH/THxXjHyyLWhfmwGpRyAOALFyRXcqfbl2C4O2JuC/GhKrPefVAC6WZZuiUh
         T+HQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTVQrMtl5Aa9TKMy3bBu4aZKtzYTv/OixPf66+zaIJeAKI9vJRyIsm9/qnW52zOW9QL7jYCVfCH5GRRCVWHUN6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7VCQEVuTET4y6AK+feWUgtfVKQ9yyTNOKmiNfFZDevVYhS4Qu
	+as/tswC+VKzwMLG9/+wn/pyq1RAx8kOcZjx7zmMKIOV9Y3urp1GjqOpeA7Jd13V5Yv2WLtRTAO
	ApsA3CsPQUeLTT1bXOeiC+dDgxjI0apz7oPzZomh9OFFc1ksvYy6HJs3agOXHfexQHckQ954Qw4
	gt
X-Gm-Gg: AfdE7clf5JBYAI9unGjTYUBQItkMm4GddSoU1WzpZLy2xtYH7H56DGB96F92dv6D9aZ
	jx/IkNgN0YkJUqkxPJasYkQpaXBqGZlxWsPhkk1A3y4lWHkWgfTKO35/aUBx2hpsHofQNNKcAoc
	vBiR5jPIlL+5GM4dAS8N+cuN2/57+0AIUKAEGMoKMcqL+LDg13Zaf6ZE7aE01fywOPwoR1h8DWe
	Yz4BibbsCHHqa4N5NtTQmP1w9wQWF/qWzEwcWJVUprBJh8hGgOTpzxg8ptc71e9hjMwNw4KgL4j
	XUb7eqlo6WikoooHAzymOjxY+AekirwJ7DHNM77vEaTGVpqt8VM+g30Ub6SoaP/11IPEnspaoLR
	ZvFklIjNp4inMb1uz994q+d+XLii5wfwNGIqNZ2mGtpzjZQ==
X-Received: by 2002:a05:690e:4850:b0:667:78df:cc0a with SMTP id 956f58d0204a3-6677fbff299mr832915d50.51.1783352251795;
        Mon, 06 Jul 2026 08:37:31 -0700 (PDT)
X-Received: by 2002:a05:690e:4850:b0:667:78df:cc0a with SMTP id 956f58d0204a3-6677fbff299mr832885d50.51.1783352251259;
        Mon, 06 Jul 2026 08:37:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66640402ec3sm4964158d50.5.2026.07.06.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:30 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:37:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <akvLuLVq5SmaNro2@redhat.com>
References: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7whxZkH2-nuwMxbRCHq89wn4KxXmNpQlbdwFvaBcw5Y_1783352252
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083734_830834_50135A0B 
X-CRM114-Status: GOOD (  10.59  )
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

On Sun, Jul 05, 2026 at 06:35:24PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


