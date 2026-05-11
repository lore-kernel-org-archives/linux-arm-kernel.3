Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567B4CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=; b=ijtgyHne76uQNkIFk72v91GInE
	8ZuRX4sU2syf5nJkS4XiMxlCV4ASHiodpJo5mNNvvrm+JjqXG14r3Lzo4d7e2TRqkqCEUi4JXc5ja
	jyCVJTfHwS+o/a1b18GTxYfSrrYkLSk3N9IHXWFAnC5ovtQ+sbtNsuqpC0l+tpYGLAtS8oM/sKjTT
	2v7daH3y7i22gEJNT8ZX5sI0TvhLHd9O7e4Ya7oJqUoE+RbcHelKTLvK3My/HL7pfNYdJvN1IOZQO
	ZuKadJuW5crmoZ8CplyEa/S/rCSrEQKcuJG+qYMwJ2Wl5lmAHbBbSu9tjNGylnbHMycvtfz+5HKxU
	ruTOhlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRsT-0000000DwNU-3fhS;
	Mon, 11 May 2026 14:45:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRsR-0000000DwMM-1th4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
	b=I+5KAHlp8+yv3JdACpupEtPAaer5R3en+mJ5BW/QdJNmNdp/dF+KS4Xvqg2mVuvP4GjZIK
	F3hncqN9/CNuKLmGENGZFgmGZ1aX9wU3DAkrM7jsd5Hpq7GpBIn1Rf1IOuARddwbWRXxBC
	9bF2S0r8xCn2RP85urZgf4pOBTgBBQg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-d6LuNAi1OXyuP96zlnOXgw-1; Mon, 11 May 2026 10:44:55 -0400
X-MC-Unique: d6LuNAi1OXyuP96zlnOXgw-1
X-Mimecast-MFC-AGG-ID: d6LuNAi1OXyuP96zlnOXgw_1778510695
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso43106761cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510695; x=1779115495;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
        b=biVTvneXrgXP/MacIdx5uCBBonu3vfActo+pFUGu1MXrC2CMrjaqF8zIsEgfWyiJ9F
         +oYjQm7xOv79be6Orxf2EIboJbrwUkD0lvatfh6pLPO3xMnSQQtwhEV9sUSPZOt2MUhz
         K0XZesBMnm65IEb2uSR/GMX009BXP234onZUQ1+AiPCNCIrZ98veJ/EaWMkCwCeMAIng
         iAow6Sm7NZ8xoZMJZV6zmXwO+GBJO3VTnAK/JOZjPVTLm1OyuNk+O/PYObWs5PtmQbcO
         4CI5l1//AAW+7Rkdr7mV+6CFiuMMB0IjOyZm7joskD/sb8/4EcDziwO0CR+8Vx0XPMH5
         XCuA==
X-Forwarded-Encrypted: i=1; AFNElJ+xjecemluHKV+MxmthGK6MDi1Aee6B77n8SOrDraFJ+EYDbL3kHVdfIULa/6KeBdrf5/GWGRxurTewQdCIAkUv@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjb/np70OkjEzFN9ntC3iSpWMdui/iHZIxenWss4AtAftAUey
	aZMk0zMhnRtd4MudBudVMFdt8GS6r0yMgrtK08yDTBThgNB4/THU/ibpD5fo7h64Pqs987UYffr
	xXKHdYjXAKewsITkGIOpDNurhQy98sCKWSH/wayH5Lr32eucrtPMJKF5mjBSOVbeh67gNlNEDJx
	Fb
X-Gm-Gg: Acq92OECKKsXau6SyWiUaEcWQkHEmgK8rt6H1Mp7CKN2rmMgIJh7MkYMilw7iTrCbyc
	P1l0vhLk1xwnYZfuL3ujKtyKASOXTBBTkkwUNgSSlVqL5CuuJztUqEgKcWvpEKY9vb4HQ3Ofvos
	MQYMeOQ8Eq7KrxnWELI1Agyyk3em6n/TGtR5LOnP68yfOPxe87dUECBg78zCCL38j9qcNhPsZ16
	8SV5hBTdNhH8jNDycnOJeAM1UqLLvCzxXqt2DJLII8NOldc5MvruhwB8HWeSXrA+FGrZ/1gZ8oN
	vNVnaGbfoz49uGsvZYXXS/0y9xnjsqr4uJ7c82+RZiASv0tfaU5CLOz2Icw8FVrR3z0qSMVTNjX
	fdvinUV+LGK03W2BV2lS+cX5F6lUtom5QHwrg1jYrFtH9SEygcUKTuQob
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798861cf.18.1778510694828;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798201cf.18.1778510694263;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c82420sm105737256d6.33.2026.05.11.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:53 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <agHrY52NvBCWA2fi@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-4-cristian.marussi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20260508153300.2224715-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 92YiXBBzKeU7P7X0mCtHOAsSbBuEjJu3HObic61qWN8_1778510695
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_074459_560083_CE187E17 
X-CRM114-Status: GOOD (  10.08  )
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

On Fri, May 08, 2026 at 04:32:48PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


