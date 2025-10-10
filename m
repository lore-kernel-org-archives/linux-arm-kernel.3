Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68958CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 04:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b96lHOK7OOj9AgDqZ6liSCCMlFccuKNhL36Drok74AE=; b=0cvv+GEhvMqAAUdRjLx3TJtqE2
	awfkCkdYsHcnldsPulVLkHXHWaj+WsMCZwQajBhfyN7ov/uMwfZ78mw802QdW9XUQPZl5Ttmo4EeI
	GM1VbuWGw9L17cHMngffZ0bAulGtK7RkJst9JquaZ3fXzxg3ehalar+978L+Jn8mONmQPMAOvAsNz
	xRrPTVzPGWAGN3bDbczmdQEVkFOz48K22oD8FL3ydJ0UPDB0g97JmL21TrIw5KlzXw61wL6U0t5l3
	hepgq+udCCyMWwjpaA4OUY1v+eOxumabUw4+TdEeJdLsK8SM1LJCCIfymw27YUVnd2pTJFn0WV3P3
	cIM016Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75B0-00000007g9V-0Z5K;
	Fri, 10 Oct 2025 04:56:22 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v75Aw-00000007g8M-2LIK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 04:56:20 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251010045604epoutp020b4d29b1d6dbe6642a98ad763385cbc0~tCE7XTZ672066920669epoutp02P
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 04:56:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251010045604epoutp020b4d29b1d6dbe6642a98ad763385cbc0~tCE7XTZ672066920669epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760072164;
	bh=b96lHOK7OOj9AgDqZ6liSCCMlFccuKNhL36Drok74AE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jJlEjJTp5sq57ROgGm3SWlApL12iSHqaj1ZbI6qq+WRcptfj+qZv/BkrqBRfmdWoj
	 WvTgmBaoyC+oOpFea+UpqRBUZ5dFLq/IIGN60LO9y/EgOfWwCdPm8xvpkbMXL622eu
	 CbOb58rmLk7VrljvIGzseAayWQYJ5d1NehI8HocM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251010045603epcas5p100e8b22da565c8ddedc855e3eee2a63d~tCE639vYj2303523035epcas5p1O;
	Fri, 10 Oct 2025 04:56:03 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cjZFZ2QhXz3hhTD; Fri, 10 Oct
	2025 04:56:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251010045601epcas5p29c5dc8d86df33b732d285b1ab7821bfd~tCE5MyevZ0899008990epcas5p2H;
	Fri, 10 Oct 2025 04:56:01 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251010045559epsmtip1ef22b9497c9caa63d35fb46e3b9ed6e6~tCE3gwKOS3107331073epsmtip1L;
	Fri, 10 Oct 2025 04:55:59 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <andi.shyti@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>
In-Reply-To: <4a03bec1-34e2-444e-acb8-cae72dcbe6c2@kernel.org>
Subject: RE: [RESEND PATCH 1/2] dt-bindings: i2c: exynos5: add
 exynosautov920-hsi2c compatible
Date: Fri, 10 Oct 2025 10:25:50 +0530
Message-ID: <000001dc39a2$2cf5e570$86e1b050$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHZnjCsweC3oVP5Ejv6M2pHGPEXvgKyFlopAbdTD1i0nLvhcA==
Content-Language: en-us
X-CMS-MailID: 20251010045601epcas5p29c5dc8d86df33b732d285b1ab7821bfd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336
References: <CGME20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336@epcas5p2.samsung.com>
	<20251009101911.2802433-1-faraz.ata@samsung.com>
	<4a03bec1-34e2-444e-acb8-cae72dcbe6c2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_215618_902368_7C172FB9 
X-CRM114-Status: GOOD (  15.49  )
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

HI Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, October 9, 2025 3:43 PM
> To: Faraz Ata <faraz.ata@samsung.com>; andi.shyti@kernel.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com
> Cc: linux-i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com
> Subject: Re: [RESEND PATCH 1/2] dt-bindings: i2c: exynos5: add
> exynosautov920-hsi2c compatible
> 
> On 09/10/2025 19:19, Faraz Ata wrote:
> > Add "samsung,exynosautov920-hsi2c" dedicated compatible for HSI2C
> > found in ExynosAutov920 SoC.
> >
> > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > ---
> > Note: This patch was previously sent separately. Resending now as part
> > of a two-patch series to avoid dt-binding check error. No functional
> > changes from the earlier submission[1]
> 
> It's not necessary. You only need to provide lore link to bindings in patch
> changelog. Read carefully report you received.
> 
> Also, do not resend non-fix patches during merge window. It's just noise.

Thanks for your comment
I will send v2 of dt patch with lore link to binding 
> 
> 
> Best regards,
> Krzysztof


