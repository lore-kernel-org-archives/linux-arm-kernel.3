Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934C4C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esbbA0aHxV2C7K7XPMRSKO3A35omNfgqBS1hPBjtmXg=; b=Bdk7FHUkRTtOqPcckX70GpCNhJ
	jFceBElYEBU1JG3ZOqeteiZ0OQ6EVOJuIOTZ0rj1Wlu9zln5sQIm5Fd6L8gy1RwlYCtKSmrSIFOCH
	p3U1uZ2EP9uQszfyF9QoyHTdMlJwpznafU41bURrcQzimRZAdYM0uCH1RbhKII56viajVsJxWWZi3
	GLXGdOrZr9espZt22WQLbiEypiWyuI1QGIHOQ15Hez+yCjiWIsj9cZjGm0FSfrIUWHKW1QQPQQog3
	zaYvXL/gki5BVTdF71nYHuHq2DtG3nKWdO+uQOWl4rLASHFe3RLhz9vYCdO5pmV5e99xVu6WwFgJ7
	Z+dkS9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMRy-000000051b2-2bWS;
	Wed, 26 Feb 2025 18:48:06 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMQI-000000050RW-1ZAc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:46:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QIi9ms2156450
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 12:44:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740595450;
	bh=esbbA0aHxV2C7K7XPMRSKO3A35omNfgqBS1hPBjtmXg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pBfjg8U5jkATBCxBRPgW1hxkKxkjGDHEVGISh7VcEj5YIYrbU+fYbnsayWPzlFKcI
	 47JaBvj4ZjrahbShEttZOLhtpYWrZvE+Dn2iMeKZduVs2P1eJ3xxTWysLT/29QlYTd
	 cP2MVrU0/cHm+OCLt+4sGqm7SAwgQRmoH/hTrANA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QIi9GH029156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 12:44:09 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 12:44:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 12:44:08 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QIi8S8076566;
	Wed, 26 Feb 2025 12:44:08 -0600
Date: Wed, 26 Feb 2025 12:44:08 -0600
From: Nishanth Menon <nm@ti.com>
To: parvathi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
Message-ID: <20250226184408.d4gpr3uu2dm7oxa2@handwork>
References: <20250214054702.1073139-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250214054702.1073139-1-parvathi@couthit.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_104622_681174_56DCF10A 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11:16-20250214, parvathi wrote:
[...]
> The patches presented in this series have gone through the patch verification
> tools and no warnings or errors are reported. Sample test logs verifying the
> functionality on Linux next kernel are available here:
> 
> [Interface up Testing](https://gist.github.com/ParvathiPudi/f481837cc6994e400284cb4b58972804)
> 
> [Ping Testing](https://gist.github.com/ParvathiPudi/a121aad402defcef389e93f303d79317)
> 
> [Iperf Testing](https://gist.github.com/ParvathiPudi/581db46b0e9814ddb5903bdfee73fc6f)
> 


I am looking at https://lore.kernel.org/all/20250214085315.1077108-11-parvathi@couthit.com/
and wondering if i can see the test log for am335x and am47xx to make
sure that PRUs are functional on those two?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

