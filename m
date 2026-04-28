Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D51DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=; b=YWEj8UdV6BG4HK8AkYgiCdklDK
	EZgO0ETJAy/0pH/a3jJwek+rpNc+CM51NqcQ+Ud/+9jG0dwFZnm3Ots3Pl7X5asaWng2Kb0e0JenR
	7G03uqGt5emByB6lMuSXObFMLgclyyrtXjzD2/KwVLVtmZRmmtIhOxcsM5UkXASYZaILuWFZI0iwy
	TlFTJ9wYa++wLUpXTbctcx4T5UjMXjtFnyHPXVcshPYsG/psM8vum4TRWfs/0uAtnLp3L3Rlnkdb6
	b86UJQpROTpBFGd2EqGuBdv4YlJ/tM7zM8VDDEPpD4LDgo8mDZY9mpt9FubmGMPT/DeU2ehFNNgdy
	9yAdYiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp7t-00000002SlS-2WWl;
	Tue, 28 Apr 2026 20:33:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp7q-00000002Skp-3ffx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
	b=CmONUsrkr2XghnHP7VDcp/KTtBBWfzXkhW3OWNWv68ttv5ZKvmeujqYQDjmxWaKZy5IBqA
	VOs+IqtRFC+Y8RZTiE5jLJBxVRdXqjEgGtBvMc8rdiKc6ERO0Z8h6jr3Lnf8vc0yIxUzLB
	DruexHjgdDBO5QmsWN5fSNoIQpAIFXk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-5EwAtSyINsOYFyMqJHQltA-1; Tue, 28 Apr 2026 16:33:42 -0400
X-MC-Unique: 5EwAtSyINsOYFyMqJHQltA-1
X-Mimecast-MFC-AGG-ID: 5EwAtSyINsOYFyMqJHQltA_1777408422
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb007bc36so22596811cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408422; x=1778013222;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
        b=pFtALbT/Gp8oeiLMJ38RQ4hd5P/e3qngVmW7PE2t4aHo6eHI433X1JT/DcX5iBhxqF
         Oz1Nw1JkLszFJY99nD2ztNABe+Pr4FGJAfmR4I166JhLO7GW6+Z7kaTmkI2YJffONom/
         aMqxDhK3t1YAmOum3lD1lbDdFFwC4weoK2vIxvsmZebsmd1pBYBugMHwNIqLX3X3T67d
         98TU3zuIPTRLXrbu9n8XqAz61U8Fpu2Ids/1gpX78rtwUB1ujrBUrchL5WVPacTDc3jQ
         hI3qkXrWx4CCVzhgFhrQz3NgKOUJnqRXyfL28pcJlK+Ohqv2RGIRRhtdH9n83nC6cKjg
         t+nA==
X-Forwarded-Encrypted: i=1; AFNElJ/n7+gJAm8H7MVFlAIeuWnzk7/BRYmcKrhjFwi4Y2uTpG9SaxEIiw/FputpX1NHbDnvMIigYStSgI8ePNJsG7sC@lists.infradead.org
X-Gm-Message-State: AOJu0YwM5f80pN+Z3TR2czxPqF5MwNjPFi89aEZ2E747PqT9wsmq65mg
	iQd9XFvW4Bsg/c5pAMWdPsoMq2aTdtKenM1kwksz6Tq6vgYoTsFR86q0cqkk7NYdkVAwPc1hG6O
	pr5m0Pi01MMY5k96Y4G9hFC1vEx7KWQPqGLnLI4s/7MKLIo/kSxagB94TKKODPSrJ3aWiHTY5K0
	3J
X-Gm-Gg: AeBDietGP6jlc9o5c312wdnoCRbvHnLchbTxZbDBoxOQz+bbTLThDhYtUH6sWNfTgZB
	rnHZUjjCiq60+q7SPm2Vi+clLMiU2+Fj6iH5WanawhXm95DkA86daLltfpIZXKSnUuBjG/1hGJZ
	xzP/vCcZwRtc0Mu/qg1a4NlgM9lf6ylnJuE/L+RHw7qMS9rVr5vRj9TUdRChQwwe7NCzi2/onyr
	0Ji4SLVziBBvyILBupAIlHfUEpH5h9d3hBfibThB5U+YysYx1Dj5dBPttDY3vGDyW1XMMIwFvhM
	B8JKr0nEfV/YR441s0Xq/vosFYDjFDq19awq+dngoS/VFBVUULy8l9o9gDrHapOWYjedzHHPqNf
	+wYgYtGXMU5CkCNJyynf4+yN0nQuE+a8=
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18458301cf.32.1777408422371;
        Tue, 28 Apr 2026 13:33:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18457831cf.32.1777408421914;
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100da4d312sm25243291cf.1.2026.04.28.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:38 -0400
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
Subject: Re: [PATCH v3 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <afEZotnIZYXEtMiC@redhat.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-4-cristian.marussi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20260428201522.903875-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lxoUFtwKaVjGJfQguorCAmirGYvyxZ-qOnLCBw-vVU8_1777408422
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_133346_982413_9CF04006 
X-CRM114-Status: GOOD (  13.55  )
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

Hi Cristian,

On Tue, Apr 28, 2026 at 09:15:10PM +0100, Cristian Marussi wrote:
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
> ---
> @brian: I'd modify further this clk-scmi driver, with a patch on top of
> this series, to properly use your new CLK_ROUNDING_NOOP flag once your
> series AND another (already reviewed) series on clk-scmi from Peng are in.

I don't know if Stephen is going to pick up my CLK_ROUNDING_NOOP series.
We talked about it in person at LPC in Tokyo, and he was the one that
suggested the flag rather than a new shared noop function. However he
didn't pick it up last development cycle.

I would recommend NOT basing on that series of mine to reduce
dependencies, and so that your stuff doesn't get held up by series.

Brian


