Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12965C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=; b=NdzW84P27Dz722uNEZzRQGtKNh
	lPpY2tTgiS/g4ggz621E7f01Bmr9v6fCCxBQoK0XFvrFUjt8aP0FIGH+egfRpdT1FVH8vDLBdFfLL
	Z4PgtfzM8fwPkdzw5dtfdO8wskfkMvxfGgMoWDD23Jqi1xlzMBwkyvAQpWQrRvYbKklbvlUVCDRxz
	JgsEbr0ZsSlUx1oPYzPwJNLNTzDS50zpL32yAuVrCbpO1rqmcAn8XQW1FsMgbh+6BITksTaF46Rqd
	GFKCwg+UIU/J/7wMo6v3sROXXY59Pxb1CxJSV8ql40zLk7nW2Mh3W24b+NUmg7gqi8LjkqKiBaelJ
	z+8t3RHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvD4-0000000014Z-137p;
	Mon, 03 Aug 2026 16:08:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvD1-0000000013h-1kBP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
	b=hRlvQmz5ae03YDCtz96DfE/GTYefu0aWA7pvGMkDS6D2D2mjvWqM+KwVhugq7dZSeOQWvy
	eg1Ri/HdHBCWbLQDkJnkS8owhvImkSk2dB2Q6ow/VJ5gf88R4tnnO9ufQiswZ/gpIfnshz
	0qCfHEsXkoLMgOKwXKA7W75k2375AoY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-OmDr2covM2WDp8cTZGssvA-1; Mon, 03 Aug 2026 12:08:07 -0400
X-MC-Unique: OmDr2covM2WDp8cTZGssvA-1
X-Mimecast-MFC-AGG-ID: OmDr2covM2WDp8cTZGssvA_1785773287
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e71268bf6so5693187b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773287; x=1786378087;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
        b=XBZZ3aCfCNhfc1et5l7JJD5FYkTVJqg25lT0jxdGwZxFcioLEa8enXhEDN3CNkJIDc
         GQ5TnEJfvcJ9+E3PIqny33OocEWYx6kZoV6FFk8Au98Doo3q2mG69EZpAm/Sfdyuto2a
         vBlyjrXB53V0jASyRO6lpk4OK47aCeTuWsjq10J8cs7xdD9U6TUmybHMiP+PNd78X08v
         rIaSrzwCRwjUJdfkZ+X0/tKbbOG3VOsbfhemKi+eAMzsjQN/AUceFkMmHFH4NOmXTXzb
         MFgHE0flYCxgkVnRzP7GYylN2YykFoejUZ0zez+2wTsHbiO8VDUSKCuDPuF6HCjBAsur
         XCFg==
X-Forwarded-Encrypted: i=1; AHgh+RrZ9ifm1lBA2xtgoU5WmdD6f/0bmtpzozqhzZnEmVFZiEn9am/2RV/3yhdF0O52CnR82w4UvdUyTE8cCmz2S9WI@lists.infradead.org
X-Gm-Message-State: AOJu0YzZtzE1aEFbo2fy4UqRJ1LbHxc4ZAseocHWe9sYaikMMNhXQ+of
	8Db7Y8uhPxmK9kG5csSt5shl10HEXy5yWWfEQTLZPBUYv8KiSe+3B+ocQ+o2JApVaMzJtBcUWoU
	AzY+VSXYsSz6OiX5u8UDftWYX3J3n4tuP0l/QuMV1sX6KA80IAS9ytjlSvoyoHjg5+Cp2tb5yOQ
	iS+LnyVRSB
X-Gm-Gg: AR+sD12aAThitJ6+i+eXdVYItJTW4IXhDEuhKB5BWM3YvUZ0EKgrkyuvZLap4VgNoip
	8HNMCQ1P4FhkrOKVq9HyF2DONGcu6xe6IqP5ocPjgZGwUFKhkLF4Gr5/IJdYtRoaeRDKtn7spBb
	OqOELZQwbA/TuwjrKFmaI0o7gYzyBvt1ZVg7NG7e1sIn8d1dnvthPsHG2SSJ3NfEzwVpbsUcoMQ
	96bx5RKT+4NDTzj6ozmjoFrNBsv/+c5DFrnLFvKbwUQbkyC2+qlo2swuuZijgdlC/PiMI4XPHAp
	fDqle3kNTqgh3t2zuJ0hSmoM6Si+CHR0KnLlGZ3MrWudASSPLXLTYHJtZVk5yH+yzF+av8L2xJR
	LVxngx6BGBQQkLxC3WemhtxjydslaH3BdVU8=
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134145337b3.1.1785773286898;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134144907b3.1.1785773286508;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm57310617b3.39.2026.08.03.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:08:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:08:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 06/12] clk: zte: Add regmap-based clocks
Message-ID: <anC844zWjrph3KlX@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dV7RlxDDLo1_zxtKCvwI0cBDF4MpaGkpYinIm2uyS-M_1785773287
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_090811_517567_09E00AA6 
X-CRM114-Status: GOOD (  16.19  )
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

On Sun, Aug 02, 2026 at 11:33:38PM +0300, Stefan Dösinger wrote:
> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
> 
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.

This second paragraph doesn't have to go in the commit log and can go
below the ---. Otherwise looks fine.

> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


