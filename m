Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CDBE6F08A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 20:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KypOe+BlfLSfJMLuOXuYaOsSBR/ncaDRPdeWgpwfoQE=; b=o7g9NSwpCdJzs4PNX6IORcU9tq
	jp7lCJllh9NMcHA/3AsNoC2JSLhLoYkBMzFB2odFc2fnTqEyr2YLSbe8tUrCJH2nZIu46R6nXO/d/
	WBiKTChMXJmJE95Ck5QcIQK4cEuu2Pl5rM7U7sxlb54+Xk2/qJh3eQWwepbGp01V7f/bch89kOVWx
	xln9Cp7N2fOwnLRQQh1KDFUr0G5BSJ61IP+VP6DiJItgz1ntLBGB047P/IPH2uihKYFd2KHosbTlt
	9iWmvVMWnJCmhfMUsyzTF4bsG1MyTQWiKgubE5lkQBNmI5wF2BeMabSuVUQU12uotMChdbbZ9SJNk
	Eb/P6+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6yN3-00000008Gfl-1VZC;
	Fri, 01 Nov 2024 20:35:49 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6yKD-00000008GDe-0H5I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 20:32:54 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A1KWmqa034638;
	Fri, 1 Nov 2024 15:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730493168;
	bh=KypOe+BlfLSfJMLuOXuYaOsSBR/ncaDRPdeWgpwfoQE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=U/2QVr+vHmyRIWdgg7K1N/XnCu6lUmpi3RJwtidaD/KThJ4ZtLXaymBTHDKGsjdkv
	 jSGrmS0gWUEYaIJ41S9Mn5eKcC1eStwzk0sGU+RWMU91b/hb8ZEzG3xqD9/MJr1otN
	 BXrmMuAo1njmmf1I4ydFRISQcnK1dIBqnibsvdfc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A1KWmhS014997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Nov 2024 15:32:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Nov 2024 15:32:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Nov 2024 15:32:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A1KWmTs057956;
	Fri, 1 Nov 2024 15:32:48 -0500
Date: Fri, 1 Nov 2024 15:32:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, <linux-pm@vger.kernel.org>,
        Vibhore
 Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Akashdeep Kaur
	<a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power mode
 constraints
Message-ID: <20241101203248.oxddn7yea3us5nth@tables>
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
 <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
 <7hv7x9qsvt.fsf@baylibre.com>
 <CAPDyKFpdgg+kM_Ot5GPTpMUtjmBF-pUhCeRpVb=j852_7qm=3A@mail.gmail.com>
 <20241101144445.56ejnuoxshqwns37@boots>
 <7hwmhnnf0f.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7hwmhnnf0f.fsf@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_133253_264348_72275C9F 
X-CRM114-Status: GOOD (  30.10  )
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

On 08:35-20241101, Kevin Hilman wrote:
> Nishanth Menon <nm@ti.com> writes:
> 
> > On 11:11-20241031, Ulf Hansson wrote:
> >> On Wed, 30 Oct 2024 at 20:43, Kevin Hilman <khilman@baylibre.com> wrote:
> >> >
> >> > Ulf Hansson <ulf.hansson@linaro.org> writes:
> >> >
> >> > > On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
> >> > >>
> >> > >> Hi Kevin Hilman,
> >> > >>
> >> > >> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
> >> > >> > The latest (10.x) version of the firmware for the PM co-processor (aka
> >> > >> > device manager, or DM) adds support for a "managed" mode, where the DM
> >> > >> > firmware will select the specific low power state which is entered
> >> > >> > when Linux requests a system-wide suspend.
> >> > >> >
> >> > >> > In this mode, the DM will always attempt the deepest low-power state
> >> > >> > available for the SoC.
> >> > >> >
> >> > >> > [...]
> >> > >>
> >> > >> I have applied the following to branch ti-drivers-soc-next on [1].
> >> > >> Thank you!
> >> > >>
> >> > >> Ulf, based on your ack[2], I have assumed that you want me to pick
> >> > >> this series up. Let me know if that is not the case and I can drop the
> >> > >> series.
> >> > >
> >> > > Well, that was a while ago. The reason was because there was a
> >> > > dependency to another series [2], when this was posted.
> >> > >
> >> > > If that's not the case anymore, I think it's better to funnel this via
> >> > > my pmdomain tree. Please let me know how to proceed.
> >> >
> >> > The build-time dependency on [2] still exists, and since that was just
> >> > queued up by Nishanth, I think this series should (still) go along with
> >> > it to keep things simple.
> >> >
> >> > Kevin
> >> 
> >> Right, that makes perfect sense to me too. If we discover conflicts,
> >> let's deal with them then.
> >
> >
> > oops.. I missed this response. OK, I will let things be.
> >
> 
> Oops, 0day bot found a build error in linux-next when CONFIG_PM_SLEEP is
> not defined[1].  Need to respin to fix this.
> 
> v5 coming right up....
> 
> Kevin
> 
> [1] https://lore.kernel.org/all/CA+G9fYtioQ22nVr9m22+qyMqUNRsGdA=cFw_j1OUv=x8Pcs-bw@mail.gmail.com/

Kevin,

Unfortunately, I have chosen to drop the series. We are too late in
the window to take the updated series and wait for new regression
reports. On the flip side, this will clean up the flow for Ulf to take
your V5 since the dependent series should ideally hit rc1 by then.

Thanks for addressing the report fast.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

