Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C24FEB3622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=; b=j0DGrKlj8dU+3TOcPmTmxIGvRz
	DTKHC7wvAfMvmwZh4WNy+5YJmwl1uuzieh9RapCcaL0U+8ecMj4gzYzSGHlcnMpg2jTYT63xyVKHP
	Be1F1EUbUfHbCEVOdjRrEe7ux0IyFWA3llL+f8ysiOQ2SOChEAF2xE7A28g0Hyut/S86R06BcMejw
	OtPFasNni09e9CZBkb1bnf5WK+Gwk6gZqB//ZgoogqdW3BdnzkAnRTchfSx/GwXPru3m/ikkCfvCX
	L0W3B3JM4nltqi7A0Tlm8zu3zFKatrEMz+49FmbfbhTUIJOAgVYn/8G1RTnfRVJ/4DiO32sWqLGRk
	ORwW23Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6nl-0000000DZ1O-2KRM;
	Mon, 02 Mar 2026 17:11:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6nj-0000000DZ0I-2kPJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
	b=aDj7vDYIBqHOf0Avz5TnNxVEIcWIyNgXsHZqu6RFQ0AQ06zXkvd22BVYLH1hqec3TKQeQc
	Mh+Ot56PbNKdKF0vnSnPKt/4sAf7rI3b0h0sf3oJSGKK+FjpAprkfqwAnSNIpHyuZ/thdn
	RNO2vqalHCl2Blp6P9KqTPlA/42SQv8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-5BQqWQu8NfmAy3edsH9MVg-1; Mon, 02 Mar 2026 12:11:19 -0500
X-MC-Unique: 5BQqWQu8NfmAy3edsH9MVg-1
X-Mimecast-MFC-AGG-ID: 5BQqWQu8NfmAy3edsH9MVg_1772471479
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cbb8040f48so3924191385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471479; x=1773076279;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
        b=GLxel8htRD2RML4dvCNZnMsLKcR2sLZA8wOxqUr6z0LpytHb+k43kHfmYKAFNV143I
         hpX6rbI4DVCeXf3GrPNnY7y+G0GOctXfqCnA7mAPZWC4ARZ4igNm8aFWKsHskAQYRB1/
         FSXDdjN6/j6XrTm7EEx3woEdtDUhoFdiogRZ9Tz2Zy4e4O32zb/OuooO7oVv+7igc3UN
         pTWa7CCnGekmrEmws+mNFEaKhDmseR0aEqm+Y+H3Q8PBU04gyJji+Itu6s07h1PZrmir
         ToRxeyyBX2lSRFmjUzuoenNkv7wYBWRDC6kC6cIVyziRIcnSz6OTUvd9e69HqBwWr+6a
         y2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpDKyyZasWDYMvQfCCO1FH71w31J92ZHX/W3hz1otGMoSs7kF0TbKBQheYezuV994Ga3oNlVuO7BwOBZnWZX1D@lists.infradead.org
X-Gm-Message-State: AOJu0YylKG3ZduuaqorqTz4yABpAa9pQlundDTlk//Yfec3KLTUNlrqF
	7v2Wq1i7lHpXVC+TmBVvFktAz+mApm/RoVuEy2KBx3BiyfCpxnJUE1bmYf2clPPvHoE4ssxTBZW
	qw372g70ykFoSfdmNfnaA6VbnvaeCKLaMfXJBr0lUIeGpZxf00zZ++0FlUs+/FJSyTTJgRwhDDp
	qT
X-Gm-Gg: ATEYQzwUs4U050mcnLOBdPnsMc2sJXVLe0M14bh0e4SQ5xNwFSjHPNOujLDkhTpV/IK
	4uoLSfKros9o37tKZrBKkq2KvZPSXGF21FzP39818oE3kFKHmI1LaPNCTpkPgH0Bynw6G7EURBo
	nD9NlM57+uZKgmg/EW+gDcNpNPGJ6Tih6hUgrQjC5j09cIfVHJ2e6LcaQHBsvq3oMha9upH5DsM
	QIoOO7ViL28uhRphNKpIbOEoRsOmpN/u5Vp6qb2DPP5HGTFNxbxPdLcLjDYqwopvu0+YlbvlfDr
	elAXD2gd367UQoS7djXXZytwMUA5svVsTGsvFHNWj8IJWzGWvvB+4s48gTKzEs3lIMHTJb/Xbr2
	rHALdaGvX0KwX0yawtAq0eD64brTb8Qw1lzMTlz5fwcWzOBBJLarcVPmd
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599861385a.24.1772471478998;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599855585a.24.1772471478512;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6534f3sm1172998185a.5.2026.03.02.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:11:17 -0800 (PST)
Date: Mon, 2 Mar 2026 12:11:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaXEtNilpRYhwmYc@redhat.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
MIME-Version: 1.0
In-Reply-To: <aaI9JBwWaMmfBbd/@shlinux89>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WaBeV565dYRPMc1xiesLjouHdvDfiTyiKH1jtJD5l5w_1772471479
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_091123_769784_6A300744 
X-CRM114-Status: GOOD (  19.96  )
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

On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> >Use the Clock protocol layer determine_rate logic to calculate the closest
> >rate that can be supported by a specific clock.
> >
> >No functional change.
> >
> >Cc: Brian Masney <bmasney@redhat.com>
> >Cc: Michael Turquette <mturquette@baylibre.com>
> >Cc: Stephen Boyd <sboyd@kernel.org>
> >Cc: linux-clk@vger.kernel.org
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Note that the calculation logic in the protocol layer is exactly the same
> >as it wes here.
> >
> >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> >such SCMI clocks.
> 
> Per my reading of Brain's thread, if ->determine_rate exists,
> ->determine_rate() will be used.
> 
>  	} else if (core->ops->determine_rate) {
>  		return core->ops->determine_rate(core->hw, req);
> +	} else if (clk_is_rounding_fw_managed(core)) {
> +		return 0;
> 
> So unless update scmi_clk_determine_rate() to something:
> --------
> if (clk & CLK_ROUNDING_FW_MANAGED)
> 	return 0;
> 
> return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> --------
> 
> It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> above the check of core->ops->determine_rate().

The clk framework has some basic sanity checks in place that are called
during device probe to ensure that various ops are configured properly. I
could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set, and a
determine_rate() op is set, then it gives an error.

[*] Note: I am tentatively planning to rename that to CLK_ROUNDING_NOOP
in v2 in about a week.

Brian


