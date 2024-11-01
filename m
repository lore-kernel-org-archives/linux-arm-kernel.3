Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90D1E6F062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NN3EbY+BhNgctFk5eHdO+ZGYdUHr5D4XdWKmahmrTGQ=; b=a10cDTZWLl/qc4O2chGKOGXh8M
	eNwJJ1UJKpuijOZVSm1cFO48rjoIKpBa/ucrXZCogcu/Z2CuAQUgopbtyDZNOenrlmdtdxH6HBmLV
	SxOZ9AfZUTunEeF5tqilZaefaUpnM4JPFHDwOWbH13y0N943SRa6OAyeRMJ2vWUBXMnkLshw5Cd1S
	NCz+Y3xpuaInVYWCwuTl4fnUPjCfUOBRuH5TuyGFD1nBOZmETQx9QnDlvwpw11ZpIItj+4Kc1ST25
	BYLkan2H6WcobJgxYsroR2Pxu1yU4gzrtzElBidbWGdtWeLxI2/XrQ71aHF3SlDR6OBrD4laU4Elc
	GGFVrKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szN-00000007Orx-2Sj6;
	Fri, 01 Nov 2024 14:51:01 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ssa-00000007NZ8-3R1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:44:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A1EhsUA117875;
	Fri, 1 Nov 2024 09:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730472234;
	bh=NN3EbY+BhNgctFk5eHdO+ZGYdUHr5D4XdWKmahmrTGQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RaPi+jJaTzaO35ZGP48j4vFXctjbVfgGLmybKtZ26CM+iITAF+u3BIwfA6lyrpJvK
	 1olOJdhIHK/RjCTsnb1Yh6TPF3qryN7OtJ37SL2qMTZgpqpKBxfPq9lpiIAID9qCfW
	 H65FeRnFo33rkdpXl9Tr21jGxvX2srunINJeXQho=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A1EhsS1012901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Nov 2024 09:43:54 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Nov 2024 09:43:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Nov 2024 09:43:53 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A1Ehrwq005744;
	Fri, 1 Nov 2024 09:43:53 -0500
Date: Fri, 1 Nov 2024 09:43:53 -0500
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
Message-ID: <20241101144353.zdwrykik37rrzmrt@bagful>
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
 <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
 <7hv7x9qsvt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7hv7x9qsvt.fsf@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_074401_042266_BDF9D508 
X-CRM114-Status: GOOD (  25.65  )
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

On 12:43-20241030, Kevin Hilman wrote:
> Ulf Hansson <ulf.hansson@linaro.org> writes:
> 
> > On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
> >>
> >> Hi Kevin Hilman,
> >>
> >> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
> >> > The latest (10.x) version of the firmware for the PM co-processor (aka
> >> > device manager, or DM) adds support for a "managed" mode, where the DM
> >> > firmware will select the specific low power state which is entered
> >> > when Linux requests a system-wide suspend.
> >> >
> >> > In this mode, the DM will always attempt the deepest low-power state
> >> > available for the SoC.
> >> >
> >> > [...]
> >>
> >> I have applied the following to branch ti-drivers-soc-next on [1].
> >> Thank you!
> >>
> >> Ulf, based on your ack[2], I have assumed that you want me to pick
> >> this series up. Let me know if that is not the case and I can drop the
> >> series.
> >
> > Well, that was a while ago. The reason was because there was a
> > dependency to another series [2], when this was posted.
> >
> > If that's not the case anymore, I think it's better to funnel this via
> > my pmdomain tree. Please let me know how to proceed.
> 
> The build-time dependency on [2] still exists, and since that was just
> queued up by Nishanth, I think this series should (still) go along with
> it to keep things simple.

Ulf, are you OK with this? If not, I will drop this series from my tree
(we will have to skip this cycle) and do the regular merge via your tree
once the dependency hits master on rc1.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

