Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE3AE6F066
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEvXM9nas2G5E+MLH3nAkA5t7zWzN2EXcd0zrqWDXcw=; b=iV6fwWcI79QmAMccyvCqDgnVdM
	xoDnGjBbmOhTL8AvCRP1Oh7hjlkwBOg5cvSDd75Tr+3I6zqPU6yaApqp/Pojx1DHYULDuqq1xzwa4
	icM3+zE2FQGAqUO2kR9y9zf1FlVs5VyyDxAkndhr67UtB+HE9PV8xTV92Clq0/+UY2eoVZcoqVW8W
	DCU6oIhDYBV+Z5lGXL8B5UYYW4tt6zjBDSZvq1LkaZTaCBwIpL03bX4V4Xt4wrqN3h79jomon9+SN
	7BBakPPTy9bh0DCw79YBDFgKvsab0T901d3rvWx996mmjSxB5gUAjTjogajznatny1STk/dKmCJzx
	g3UVbMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szO-00000007OsK-18BN;
	Fri, 01 Nov 2024 14:51:02 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6stN-00000007NgM-2PDA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:44:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A1Eikn0118034;
	Fri, 1 Nov 2024 09:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730472286;
	bh=TEvXM9nas2G5E+MLH3nAkA5t7zWzN2EXcd0zrqWDXcw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kNNTweVNP8vpJobaC3xXB5ifbCdtMeTdk1861uAjXGOiXsQ/AdYTXFMdpNi6Drxc6
	 vUxS5lQWQ39Bp3oTtW8T0JrBkK5CCY7FCrG1/jxQfUQCf/ixu54c4zRPYOkaRVuRUl
	 zjs6H4vHxC5Y4jx4eUtSc19AJisgjiJP8nYkNikU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A1EikI7013217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Nov 2024 09:44:46 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Nov 2024 09:44:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Nov 2024 09:44:45 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A1Eijgl006619;
	Fri, 1 Nov 2024 09:44:45 -0500
Date: Fri, 1 Nov 2024 09:44:45 -0500
From: Nishanth Menon <nm@ti.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>, <linux-pm@vger.kernel.org>,
        Vibhore
 Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Akashdeep Kaur
	<a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power mode
 constraints
Message-ID: <20241101144445.56ejnuoxshqwns37@boots>
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
 <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
 <7hv7x9qsvt.fsf@baylibre.com>
 <CAPDyKFpdgg+kM_Ot5GPTpMUtjmBF-pUhCeRpVb=j852_7qm=3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPDyKFpdgg+kM_Ot5GPTpMUtjmBF-pUhCeRpVb=j852_7qm=3A@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_074449_763034_A33B0360 
X-CRM114-Status: GOOD (  27.14  )
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

On 11:11-20241031, Ulf Hansson wrote:
> On Wed, 30 Oct 2024 at 20:43, Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Ulf Hansson <ulf.hansson@linaro.org> writes:
> >
> > > On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
> > >>
> > >> Hi Kevin Hilman,
> > >>
> > >> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
> > >> > The latest (10.x) version of the firmware for the PM co-processor (aka
> > >> > device manager, or DM) adds support for a "managed" mode, where the DM
> > >> > firmware will select the specific low power state which is entered
> > >> > when Linux requests a system-wide suspend.
> > >> >
> > >> > In this mode, the DM will always attempt the deepest low-power state
> > >> > available for the SoC.
> > >> >
> > >> > [...]
> > >>
> > >> I have applied the following to branch ti-drivers-soc-next on [1].
> > >> Thank you!
> > >>
> > >> Ulf, based on your ack[2], I have assumed that you want me to pick
> > >> this series up. Let me know if that is not the case and I can drop the
> > >> series.
> > >
> > > Well, that was a while ago. The reason was because there was a
> > > dependency to another series [2], when this was posted.
> > >
> > > If that's not the case anymore, I think it's better to funnel this via
> > > my pmdomain tree. Please let me know how to proceed.
> >
> > The build-time dependency on [2] still exists, and since that was just
> > queued up by Nishanth, I think this series should (still) go along with
> > it to keep things simple.
> >
> > Kevin
> 
> Right, that makes perfect sense to me too. If we discover conflicts,
> let's deal with them then.


oops.. I missed this response. OK, I will let things be.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

