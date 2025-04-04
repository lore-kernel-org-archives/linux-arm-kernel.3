Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE92C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 06:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVWOwvRPO7YvD8ife4s6y5HXtx59DE9Bhv5GKy5bWME=; b=o+yyn4fxUM8tXzo4DK4tEDk6vl
	+OF5M6YfsY68qjhQpuQantYiXDg1gej1io430Vucwm4TSHsRklLgne9du8fFsbAHYQEOmFkJoOPaF
	sD8thrZ/xNS8EcNRgXohjMJ+OZMBjuZgp+oU70XxkJz19IkFTMsZofMDdqhu+qE7OkhW4cerA/fJR
	IqbcKz+EnXXgj37gr35GQK1djwzCZqUSqlGGolaYeKIYkrdO7bqerH0NqSMWf0EvQKbu8+5q0hxVy
	E42nq9PzO3mkP1LDYriEASfmVzEp/e0GC2ZXC7S4UzJiJe2vIOlDjs6MdXKzw+o6WNYKd1Q+u2uq3
	/i3RX1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aKM-0000000AqmY-2uhP;
	Fri, 04 Apr 2025 06:14:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aIY-0000000AqdP-344m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 06:13:04 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5346D073265204
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 01:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743747180;
	bh=KVWOwvRPO7YvD8ife4s6y5HXtx59DE9Bhv5GKy5bWME=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FLlcagOCAFXhKEBo2g69Vx91biEEicL67yNaykYglTguEFH+U1KZVfHYarNRCHBua
	 DCDOeF0+rF+wOQ3+Eu3Z+ZCuL79E3OANB4j/mA+l0/LlMJiywQg3u96TdpH0B7HFJS
	 CX8Efn0Le1+K6IWtV9jDlMjPBz1NxefQfyMgYXeY=
Received: from DFLE20.ent.ti.com ([10.64.6.57])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5346D0b3032094;
	Fri, 4 Apr 2025 01:13:00 -0500
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 4 Apr
 2025 01:13:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Fri, 4 Apr
 2025 01:13:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Apr 2025 01:13:00 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5346CxRT123540;
	Fri, 4 Apr 2025 01:12:59 -0500
Date: Fri, 4 Apr 2025 11:42:58 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pmdomain: core: Reset genpd->states to avoid freeing
 invalid data
Message-ID: <20250404061258.alstrdgpz75gywna@lcpd911>
References: <20250402120613.1116711-1-ulf.hansson@linaro.org>
 <20250403080815.jsdoydcczkeuvmy6@lcpd911>
 <CAPDyKFrgYVMvaBf13ksdJ6Zr6bvLo1Jmz8yLiyg_43hs65STVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPDyKFrgYVMvaBf13ksdJ6Zr6bvLo1Jmz8yLiyg_43hs65STVQ@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_231302_923251_0FA638F2 
X-CRM114-Status: GOOD (  21.00  )
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

On Apr 03, 2025 at 17:55:41 +0200, Ulf Hansson wrote:
> On Thu, 3 Apr 2025 at 10:08, Dhruva Gole <d-gole@ti.com> wrote:
> >
> > On Apr 02, 2025 at 14:06:13 +0200, Ulf Hansson wrote:
> > > If genpd_alloc_data() allocates data for the default power-states for the
> > > genpd, let's make sure to also reset the pointer in the error path. This
> > > makes sure a genpd provider driver doesn't end up trying to free the data
> > > again, but using an invalid pointer.
> >
> > I maybe missing something but if kfree works similar to [1]GNU free() won't
> > it make the genpd->states NULL anyway? Have you actually seen scenarios
> > where the genpd->states is remaining non-NULL even after kfree?
> 
> Yes. kfree() doesn't reset the pointer to the data.

Gotcha.

[...]
> > >       put_device(&genpd->dev);
> > > -     if (genpd->free_states == genpd_free_default_power_state)
> > > +     if (genpd->free_states == genpd_free_default_power_state) {
> > >               kfree(genpd->states);
> > > +             genpd->states = NULL;
> >
> > Also the coding convention for kfree in other places in pmdomains
> > doesn't seem to follow this practise either...
> 
> Right. I am not suggesting changing them all. Only this one, as it's a
> special case and an error path.
> 
> genpd->states may be allocated by both the genpd provider driver and
> internally by genpd via pm_genpd_init(), hence we need to be a bit
> more careful.
> 

I see.. okay then,
Reviewed-by: Dhruva Gole <d-gole@ti.com>


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

