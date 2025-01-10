Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4CDE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoOP38KqmTiRF34QmtcHqNJL3B8ytGODGfqOcZjHVRo=; b=YE1bWGzUh6LheoryLUyzS+MNDs
	jY5Vu/XRpVamKfCpQY/ebznF0cFX5/CEN1tq+7pV8KWO09+Hm/4oHqOrRLu0fVHioz6VJNgU7DH9Q
	mE58GqRQC6PZcP4Mezph5APkc6N5QW80dPo0xK0RFsowjGjgY0ucYhHtF0Y0s1DpPn+RrNbtC6ptr
	vZM4MjljU87f/6DUL5o4Ehjqr8NENo3xWz9GtAHoyVWK0UFfRt9I4j1iPwU4Kf9qpCpT6mWOacO3y
	606ZG3fYEKKiHRsDF+tO5qfS4EFY4nxlpNJmJXhA78wBEvYp77I1lA2tJaFwe7CVbOXgRJaKIatdy
	0A8f0mLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCXk-0000000F0Ms-2Cc9;
	Fri, 10 Jan 2025 10:47:08 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCW3-0000000F00J-1xcA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:45:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AAjH8A3299712
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 04:45:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736505917;
	bh=RoOP38KqmTiRF34QmtcHqNJL3B8ytGODGfqOcZjHVRo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=m2xVGszp+6OqZjA4Uv6E7/rwCsLkxiBfbB8sJ9+IXHqHPaNKMckBLEuEwCBD8AP2O
	 5jyf1CzAmm1+DtSjaincUQfqyUHViZ6dLxlYgAo9beXnBg7UVwBHxaLa5WdvBDfINm
	 vuaKAQl//niM7fzqZYBmFOjlj7rDaOTODVvOeT/E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AAjHws061139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 04:45:17 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 04:45:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 04:45:17 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AAjGD4100081;
	Fri, 10 Jan 2025 04:45:16 -0600
Date: Fri, 10 Jan 2025 16:15:15 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <s-vadapalli@ti.com>,
        <c-vankar@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-evm:quad-port-eth-exp1: Remove
 duplicate hogs
Message-ID: <ybyexqc4ssjt5lkr76bfiaf7usmq7xto42byyboov5pjkdc4fn@wsj26klcliio>
References: <20250110101855.156136-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250110101855.156136-1-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_024523_549900_AC1FD723 
X-CRM114-Status: GOOD (  10.69  )
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

On Fri, Jan 10, 2025 at 03:48:55PM +0530, Jayesh Choudhary wrote:

Hello Jayesh,

In the $subject of this patch, please use the overlay name as-is instead
of adding the colon which splits the overlay name:
s/k3-j784s4-evm:quad-port-eth-exp1/k3-j784s4-evm-quad-port-eth-exp1

> The j784s4-evm board dts now has the gpio hogs for MUX2 after integration
> of audio support.
> Remove duplicate gpio-hogs from the overlay dtso to prevent mux probe
> failures leading to can-phy3 deferred probe:
> 'gpio-mux mux-controller: probe with driver gpio-mux failed with error -16'

This appears to be a fix since overlay functionality was broken since
the commit which introduced audio support. Please add a "Fixes" tag
to indicate this.

> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

With the above comments addressed,

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

