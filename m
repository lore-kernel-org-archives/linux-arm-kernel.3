Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD761D6100E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OznORozYizQxwH0YPp/AAs48x/3QH3/xBBmeqZor+bQ=; b=fM6R14B9dhhhwDbNR6AP51vdUa
	2lR/DBd/Ry6mIl+hR6smuQb9cXIqeTGrsSSMlj5NPZY4+t6AuOKA03x3gxSqcFI/VZKmQ3n4kXuKr
	Rwxvpgko4PL64PeS3eL9kWSTLaU7qclespYlp4aqZh4zO8ty/tTxH9zDfblyk810DUnWwFMGO8Pet
	0mlywsqwq01Ccbp1S3t8klUIIr0mI0MKqsF3kdNQjCjrUdMGO3PD8eFOo5PBbLAtJKBbHXz5AZZJm
	c1sBHECNhaBI56faWJuFl75RMswKRAxc8iDyhTWrWRIcg60Sk+BtROMomQp0SCvIYelFypFAMqiWo
	APZiasew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQyE-000000005xx-1hcI;
	Thu, 29 Jan 2026 12:17:58 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQyB-000000005mt-3OMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:17:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OznORozYizQxwH0YPp/AAs48x/3QH3/xBBmeqZor+bQ=;
	b=prWDpijG40MZmkg1lzmAGJw6xmt4IAKoEXYw3AUU90gjbb0oBm/bMqiWzRbjhgrO13AxqgaKN
	gal8bbTwofUWrwhXvRnZJ0Eh7S4I+oWj6h7757vNn+INwVKhBzTMVX0EqJNiGFFenjRxjbGw0+N
	d8fUrJVvIH2H/VC5BQ0ym0o=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f1yhm551Qz1P7P4;
	Thu, 29 Jan 2026 20:13:12 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f1ykf1dmTzHnGjf;
	Thu, 29 Jan 2026 20:14:50 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id AA4B940569;
	Thu, 29 Jan 2026 20:15:39 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Jan
 2026 12:15:35 +0000
Date: Thu, 29 Jan 2026 12:15:34 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v4 10/36] KVM: arm64: gic-v5: Detect implemented PPIs on
 boot
Message-ID: <20260129121534.00001133@huawei.com>
In-Reply-To: <20260128175919.3828384-11-sascha.bischoff@arm.com>
References: <20260128175919.3828384-1-sascha.bischoff@arm.com>
	<20260128175919.3828384-11-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_041756_622079_B294B22E 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, 28 Jan 2026 18:01:54 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> As part of booting the system and initialising KVM, create and
> populate a mask of the implemented PPIs. This mask allows future PPI
> operations (such as save/restore or state, or syncing back into the
> shadow state) to only consider PPIs that are actually implemented on
> the host.
> 
> The set of implemented virtual PPIs matches the set of implemented
> physical PPIs for a GICv5 host. Therefore, this mask represents all
> PPIs that could ever by used by a GICv5-based guest on a specific
> host.
> 
> Only architected PPIs are currently supported in KVM with
> GICv5. Moreover, as KVM only supports a subset of all possible PPIS
> (Timers, PMU, GICv5 SW_PPI) the PPI mask only includes these PPIs, if
> present. The timers are always assumed to be present; if we have KVM
> we have EL2, which means that we have the EL1 & EL2 Timer PPIs. If we
> have a PMU (v3), then the PMUIRQ is present. The GICv5 SW_PPI is
> always assumed to be present.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

