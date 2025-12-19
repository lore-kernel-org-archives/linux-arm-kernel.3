Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A441D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=; b=mGOt0rtKBLNfdhOaOQzhDpocU2
	7hfH4XdV/eOlgqaiRuiffCI6OiIrZbKdtwge/ra7YCJHCUxlurBc4cVemozpcNJ4jVDQqhjbA3IHU
	qfYyymnvRfaD0hP6ayrELTidafP448mWynrMyzD0zP7gzl0yxbpPnJ94EOHTykYlfZtsuL9b4GeCS
	yp11+1EZ5NNnMWtLeROSYmbH3ZKcD+yx8IOeeQoMmTjc/k4Fpep+FuPDnzyHePcw+BRxPuYKytb2x
	//xdiXluYaLXPSZJh3M+vslrbF7rJikRYIvvAeF/gupI7aDQaD/PGN2nR4ay3wI6wmYduISVc9Jqf
	HBfh6gXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgTM-0000000Au3o-1Ons;
	Fri, 19 Dec 2025 19:49:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgTJ-0000000Au3J-1bjq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766173743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
	b=KAqaGfMJVNLAaVtN0ua6ijH2K2pMSy+o3HSVnerXsRxOt0HNrTupBwCJgJdXloFPznD20s
	qevHKGSwJBJXo6LZUi3wlHpfBXRTCMI2knSsYSuWLK5MuJsZzU9ZgOYXOfsTdTbNbdIJ7U
	3ajFEcTtRgljnso56mrpH234CUvWLT4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-fQvoalByOS2U2GCeKE0mYQ-1; Fri, 19 Dec 2025 14:49:02 -0500
X-MC-Unique: fQvoalByOS2U2GCeKE0mYQ-1
X-Mimecast-MFC-AGG-ID: fQvoalByOS2U2GCeKE0mYQ_1766173741
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb6a7fea4dso485639785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 11:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766173741; x=1766778541;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QHParoqmwM/fv693piLNFSOhOcM5vYfUKurXmOY6eg=;
        b=gTOEGjS3tDwFR7RZRwOKccFZS05hS4m5xk5H1UqmzrBRXtE1w7HHXjYETyTAWKGBib
         IxrlWiXOWGrfdsQ2TG7eZ2cw0nURhlMP2E3Tn97HYmpUPCKglw3nvvSb9/i1BgVlSDDn
         ULZoZI+z6zWSfC61jdG0TzT9W0bC0yPzPbKLmxFUaXYLBRU5WhdDQXf+Or2BsZ40zfYZ
         WOpNXXbo1Vsgj8UIb4NpeYPsJYydG++KFRrWphMPzFmymtCwf8UkReKsv1qI6d69i4BP
         YFoHBKtnI6ij1mSrazG9PM/gbTiZ9cFEzBme4/bUblvKL3XNbWCJxAfR56V0zqV31J0b
         5ZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXuDNhdSjIcZ3W9kGNh0Jfa7/iNW1kdbST11g5oYrzgTfmNeqNfelm2JBtolz6ZAIBCtz8tPb3RW8yjB1mn6l3@lists.infradead.org
X-Gm-Message-State: AOJu0YxeB/PmqplmmtgEvzVT87tdtHWre6vx2YQygqSaoP0axq6aiWlT
	qpOnYTtJmVEaazDO5xoFZ4PFbvW9pAISt1+I50NtGx1VwZwfkHpMTv4Urk1gZ1REaqVwe7h/f3C
	Z1uswWG93hKMUJw4n7s0yh3pw7fDm2pAeybnknSiFCsLA0C+/pJAr1J1mVNqU0e+AWZHO9SeYno
	kG
X-Gm-Gg: AY/fxX6mFhQvoj4apydseOvChc7frTVlH7Y7sd0QapV7uuCz7qp1K8K6vrW5Nlr5zLl
	3HM2Pw4D2DCD55Gp9GBQdbfQAfixp5oPfvZYXaPXUmpHsnsTIZurFlG5b4CxwJ3oDF48eycJdaN
	z501kWM2xvmBOXRRhyMld4HniTNyrm4h5+UUQ33WzK5spR+MqysPUmEzHDlkDqlWffIKhx7813m
	3pqafraiNCMWZkgHSQZtqmoJomQDEnXr2j3lBwbCFe8fTqU/dmvfAqAxTBJZl+/0xHM1KysdUbw
	XKNAxK91pzCZes0d//9RaTT7MmHvKq4/a68QdZyQbfgV3ZEP28AmD3LfF0dof5tH3yQNOjAY9AY
	FJj0pkvqy
X-Received: by 2002:a05:620a:2915:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c08fbde546mr650956785a.26.1766173741570;
        Fri, 19 Dec 2025 11:49:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhmkU84dkGCcwT8u/xbGrBML5VLUNpWzlUIRhCANoKaN5hf3mFDRW42eqFLJM185p9R9rh3A==
X-Received: by 2002:a05:620a:2915:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c08fbde546mr650953885a.26.1766173741234;
        Fri, 19 Dec 2025 11:49:01 -0800 (PST)
Received: from redhat.com ([2600:382:8519:53fe:9d9a:13fe:abf1:fb80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783a81sm248019585a.9.2025.12.19.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 11:49:00 -0800 (PST)
Date: Fri, 19 Dec 2025 14:48:56 -0500
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/6] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aUWsKAMDm9_5jxsg@redhat.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
 <aTvpmQAPE6HfIy+r@shlinux89>
MIME-Version: 1.0
In-Reply-To: <aTvpmQAPE6HfIy+r@shlinux89>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lrqwo48WjwlCqk4I_Jil-JHNNN5EeuHze6iLmMdil9Y_1766173741
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_114905_493316_38597519 
X-CRM114-Status: GOOD (  11.25  )
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

On Fri, Dec 12, 2025 at 06:08:25PM +0800, Peng Fan wrote:
> Sorry for top-posting. There is only one comment from Krzysztof regarding
> cleanup API usage. Since 6.19 rc1 still not out, I will wait two more weeks
> to collect comments, then post v7. Hopefully, you are ok with current
> clk-scmi-oem stuff.

I can't speak to the SCMI OEM extensions, however the other clk patches
look good to me FWIW. My Reviewed-by tags still apply.

Brian


