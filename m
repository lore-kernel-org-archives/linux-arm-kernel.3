Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B64CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 23:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM9g2J61qUgy8rn11tUgr2Kr+gynrxk9ajK18D17/SY=; b=No7brYyGMyMfaJgtfW6gN+5D/l
	fg6LvXn2qf5jYcs7uLqNGqCHL5BKnRu12F9GOR6pC3MgQbWmu9iVtw1L//3iRNecdnzYy3yF2EytH
	kII+KVi1hnOWGm5WZoU49IwxTxJp5OY0X+Qp5801ONsiRlchKSwYMecrmkwlEVFIOvgApm3CFq8rn
	ZdmmyTlv+JdnDwbpIxD4qrBQio500SryN0XpOL1ulGDWw0yiNssruTLG5Ewu+zLcyJH4Ikcrhl9tQ
	mdUtzQWJFCr58ZGopC6mZ/td/QtE0OGBxA+ea1qf/lDkHubeubODxShm6f3rKNrmJlp7a5U09SiDd
	KSz1Bj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9yP-0000000Cqky-2H3y;
	Sun, 26 Oct 2025 23:16:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9yL-0000000CqkP-2mHR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 23:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761520582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM9g2J61qUgy8rn11tUgr2Kr+gynrxk9ajK18D17/SY=;
	b=FZhgUXCgfNhbFC0aLRD5m53O6tcsq4jZevBZGhuMO5eec7csVDXAm/Y0wD7V2iA1AbxPKT
	RgB0e2IXnGIhgFLcUTZoAv60pSRlP6Q+yiQHIQq60wz4HvyCd34tFKyCR/2KU2fYOyd0Qd
	MGmMG/J1iy/ULPu4wec1o6Rby3qq8v4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-eFwD4SvqNt6jQtvNgnAt4A-1; Sun, 26 Oct 2025 19:16:19 -0400
X-MC-Unique: eFwD4SvqNt6jQtvNgnAt4A-1
X-Mimecast-MFC-AGG-ID: eFwD4SvqNt6jQtvNgnAt4A_1761520579
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8911e5befa9so882235985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 16:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761520579; x=1762125379;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM9g2J61qUgy8rn11tUgr2Kr+gynrxk9ajK18D17/SY=;
        b=ggsfkk7PbK4+WwDbupiiV77cqqKAQ2/qj2BDF4JPOpooy5saN0IlMS6DtKTmjutnN8
         3fIm+A6+lV64a9j1/jTIj29ZW4SNQijnQJAAvg3Xkokos0LIdEKHWN1XciShg1vxRs5E
         P4gRecCTx41GcPf74MIbnyASZbP3oij/ukaST/SNfGaSwZTM8mwx0n7xvy6yUjh4UBJj
         IdD2o8ReZGBwuL9o75uqc5WKzLMWmUpz1xE82fAI7SjA/rx8zscOab1TBMe4yRRKDdBX
         qnqbsi5vPU/hgwOo85wuLR9A/iroYa34mP7Pg5dzO2Rp66JwISzMXn7t4Y8+38qzdy9L
         6W9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVhnbpg14PD7mLsLQsuRA25ckPhQMc9qKscCPl43cKk+75qTHi40OavsBTpVETVbNOr+PmJOodn1rq4S6uOj6v@lists.infradead.org
X-Gm-Message-State: AOJu0YzS3bTQmPmI6i7nRh9ONkIEAH3wPYhz2CkO3by5aj9L+hRI1Jpi
	k8OcSK7+DslzreTlZlkPv0m/Lz1s0pL1NQjouG0SUM6Za+4gIk3TC10XOJr5h63mxmy17hqbJds
	Po+6hkUTdJLqi+FRGLcc7uMOYm5GZ8kXqDy1RIqT3QkgPte2QKJRMiWqQIbw2JxslaQiuEDfEzy
	QQ
X-Gm-Gg: ASbGncukPZ54Ox52v3/1o6JOz9aHemKqq5S0YfZ+1Ks2bR+S+dRftexkpEEjyr6JQyC
	ZKMbr5KAFFfjaBYFVevUQ6E1aw9A/8Cj/yimrLdhfgjLtixSa5Whim6PfpGqibEUD4Ma3MsfyY5
	0B4JX3TgHmoGMXMEiO18PRLge4eC74ylG/NAU6v1OX9YQF66zUxCkh2VMtXECb8alJywDdie6GE
	ibTC+kJePC0+nnvu5oVVC54t0wg+zAR4SKFKfdm7Nos9yGr1V6rbvIBWKX+eYr0augcRQlIEb7w
	I4t0UzI/ng7pjjgWoO2GhjDVXjITdT6yrzwpfKAN9YY3maIdqwB/C0LMo0l7eTOQH172zuSgWEQ
	cLThp8gstn8SPYELLpgLMSgjJUcj9
X-Received: by 2002:a05:620a:4454:b0:809:b21:5421 with SMTP id af79cd13be357-89da1bae914mr1370443585a.39.1761520578743;
        Sun, 26 Oct 2025 16:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0exW7QsnW96XJU3LfmVTRq5OXRYKfDNXF9pTY84ykGNprSECOl2LKm846J2PimjM64qIFow==
X-Received: by 2002:a05:620a:4454:b0:809:b21:5421 with SMTP id af79cd13be357-89da1bae914mr1370441885a.39.1761520578329;
        Sun, 26 Oct 2025 16:16:18 -0700 (PDT)
Received: from redhat.com ([2600:382:7702:71bf:259:17c7:d468:3f55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2421fc6fsm435746185a.9.2025.10.26.16.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 16:16:17 -0700 (PDT)
Date: Sun, 26 Oct 2025 19:16:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	mturquette@baylibre.com, sboyd@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.17-6.12] clk: scmi: migrate round_rate() to
 determine_rate()
Message-ID: <aP6rvQD-bwSkhfU5@redhat.com>
References: <20251026144958.26750-1-sashal@kernel.org>
 <20251026144958.26750-39-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251026144958.26750-39-sashal@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _M8bfITgGytOQIrBBwkMYbuUaeVYCd7BdhCD4VIzY28_1761520579
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_161625_781321_6972F566 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Sasha,

On Sun, Oct 26, 2025 at 10:49:17AM -0400, Sasha Levin wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> [ Upstream commit 80cb2b6edd8368f7e1e8bf2f66aabf57aa7de4b7 ]
> 
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops.
> 
> The existing scmi_clk_determine_rate() is a noop implementation that
> lets the firmware round the rate as appropriate. Drop the existing
> determine_rate implementation and convert the existing round_rate()
> implementation over to determine_rate().
> 
> scmi_clk_determine_rate() was added recently when the clock parent
> support was added, so it's not expected that this change will regress
> anything.
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95-19x19-EVK
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Please drop this commit from all stable backports.

Thanks,

Brian


