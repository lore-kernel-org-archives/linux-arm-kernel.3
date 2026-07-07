Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91F2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JqovvXzMlh5rauQf8957U0jSCHUoUql6bim5TQYvA0=; b=MGDQe0I+dj0cI5fVTBZwONv5pr
	aavyZdDDtYjAksx/5WYd/d1NfNkuXdGeBEcB2hxzy4uUIzsqDs04I2ssKFn4/Umvl5s2N74I2ZgPU
	MfVlIbCWrrYVJTq29Fo//r2j54Toj3gzZ7IzxlnkIDENaMia+cS5lAPGLeOgtUwrNa/ouFGRz2/E4
	NmfcAjAutYG/FbJOOT0VLQz4NSEusbYZZWNLamRbXkZjurTM7WchJTgeIoTpXgkrXCKxqXcI/n3E7
	tjr8B3jAWHgznceGRSk8XLuCGTviO+6KF/cBDkc9QWMMDppR/F1RYmfFaYMWwMVP00vHirvDhlOJU
	4Xi/BzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75l-0000000FCmg-0tXn;
	Tue, 07 Jul 2026 14:48:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh75j-0000000FClV-23AZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7JqovvXzMlh5rauQf8957U0jSCHUoUql6bim5TQYvA0=;
	b=Wd0ZBkzP2O7Es6CkZIe+sDPxdyH9WkDybSt2g3TJ9Dq8PxyHkPn9LAa1rwHE6NrnXWpxAt
	2xA2+EDHLdApTWQQzz5TGb/QewUKqQZNzym0z0rwHsLFsDfqFzR1Vxjm6PDGyH3duz4GBa
	kgunfQs73d0aMdzcdSGOqvxE1nUX2K4=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-qo2bMKCrN32yA_ENmxZt9w-1; Tue, 07 Jul 2026 10:48:05 -0400
X-MC-Unique: qo2bMKCrN32yA_ENmxZt9w-1
X-Mimecast-MFC-AGG-ID: qo2bMKCrN32yA_ENmxZt9w_1783435684
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a0c02365c7so5353337eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 07:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435684; x=1784040484;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JqovvXzMlh5rauQf8957U0jSCHUoUql6bim5TQYvA0=;
        b=dnDyO4TuP3n2faUrmtF94ITj10GMaeOWLnBdmC5ULSlKnRgZl1YNi1/VF/T3PxSnyC
         U8urXeRv5a5/jB6KSZLokx6G+aG6I0558hK8SnRIBwz12gBSop+9BphvfhZxmV+6DFdX
         HLnaraRGW5P6kpEx6FItaFJh2P15MfSWW5wa07HxnWRBuoB0LP0rBu4qdiCSV0NgfjMp
         TVCfL1c84z2ht7A8DNNRs0TO94KRP4SBGAL8J5iKaY2IB1Tx1+NmwRB/R/um9+kaNkLo
         uBkbRFWownm2ntpNNTaIj73ZZd3R9ac+wCSk5T1ru94Myh4tMLpFckQoelgZmqn9YNjl
         Es1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/sPVakkBkukGZZ3ItrnfvBh45Ds+eDk0h8ori2CeKyGOBr26JMCnprFBGIZjGTcwPi+l6OPj+woWljEslLOFvb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg/6uc5AhEEbnu9c9NNpH1oPf/NrVyDc6KrQIC2Qo4UQNeVfBh
	tB1X7xJY9Z8B1TvD7KKrPjOppR4lv106ViWYwClc0dYh9X/81wmfmO1mFIFy9joT/bnYd1mJz6/
	hcQqATK4wH0wzyeqd8jbkvRfRokHgU2cUlSSHNUQRWXIQOuel8pVkXteUtcTDA7Nov1rEuqtA0h
	/h
X-Gm-Gg: AfdE7cksy7HNNs/pEbUTn9L5cWKgNrX8ZB2iwJhJ6QE05XHvaYgRA9a5ebCIqtIdEwd
	1r1VcZFY/3ITut/FKmezsJ/eucwVKWtJBKeDk5fCf8kaPQA6rdHpYbuYbm9kGotYVn/XAuUXvcP
	OnMz7ZIorn/au9WIDmHdtGZEvUbNUufBTQRDFz7MH1+n52odSP9oirRBJ9ugZJVIMhy5ztNfh7e
	XRLPBum754atVXIsIgHfbfnxwWWUAEKM+jhkB2D5NRaxrS5eTIMABItVT5gHkMYLadbARKfRbpG
	NDRpHWZrtr0saDZCHTNVCHszilG8T76IgZkO4OpKibNDFA7nzsYj+/glV2lgIuBPZU2tj3mOzu3
	P1j2o3+yw
X-Received: by 2002:a05:6820:1f02:b0:6a0:e1d4:7fdd with SMTP id 006d021491bc7-6a3553de9bfmr3896705eaf.23.1783435680171;
        Tue, 07 Jul 2026 07:48:00 -0700 (PDT)
X-Received: by 2002:a05:6820:1f02:b0:6a0:e1d4:7fdd with SMTP id 006d021491bc7-6a3553de9bfmr3896690eaf.23.1783435679782;
        Tue, 07 Jul 2026 07:47:59 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a3103e064esm10772021eaf.14.2026.07.07.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:59 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 4/6] clk: mediatek: mt8135: fix memory leak on module
 removal
Message-ID: <ak0RnIsPqT8fQ7c1@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-5-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-5-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b6H2dB0NFzRYY6u7wpgbJ9VTpVLfDTgaZJz7IAzgGYg_1783435684
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_074807_598111_97ACF6EB 
X-CRM114-Status: GOOD (  12.53  )
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

On Tue, Jul 07, 2026 at 04:48:33PM +0900, Akari Tsuyukusa wrote:
> clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
> platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
> platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


