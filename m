Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DB5E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvCMeefCAPnlsZFUmeFXkEx2sE1Kh2bgtimzMnKwYL0=; b=n2wpEx4dl/CP7tBxWDnxGRSELo
	TPWTh8VNotfrZSansa05Q43zMrDF7imZCyc6ymgDfoiuxusDD9D4BH4SycXnYYjtSr1IN39kTRqEV
	0w7yvEn6zx6MNeuTThXHQV0msaHLmI9yZlVkMIKuChOJosrl55mcb5C4a71ZqKWJkzq5pGC4LNjC2
	AeS5WR5gQ36wLPH1aUZVOqqePK4PrIMLtH8R5SWO0laidwlfQnWujFEzrKZsSWVQaNEMv6WIxASRU
	Qv6e/X0Vw7irDGonL3/Dk6h9EZhUgZ34dVomcZWpqi5uRfnCru7e4yF/GKRgQQxovuNzvRUu9xbcD
	zQ4LV03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKfU-0000000EfH9-3OIZ;
	Wed, 11 Dec 2024 11:14:12 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKeQ-0000000Ef7g-45Y1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:13:08 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Y7Xx940vqz67CvH;
	Wed, 11 Dec 2024 19:11:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9ADE7140113;
	Wed, 11 Dec 2024 19:12:51 +0800 (CST)
Received: from localhost (10.48.156.16) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Dec
 2024 12:12:50 +0100
Date: Wed, 11 Dec 2024 11:12:47 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "
 =?ISO-8859-1?Q?N=EDcolas?= \"F. R. A. Prado\"" <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <20241211111247.00003a05@huawei.com>
In-Reply-To: <OSZPR01MB690841B2D3522EC863F10800D4242@OSZPR01MB6908.jpnprd01.prod.outlook.com>
References: <20241108054006.2550856-1-fj5100bi@fujitsu.com>
	<20241108054006.2550856-2-fj5100bi@fujitsu.com>
	<20241108141911.00003e14@huawei.com>
	<OSZPR01MB690841B2D3522EC863F10800D4242@OSZPR01MB6908.jpnprd01.prod.outlook.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.156.16]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_031307_150975_84E7B371 
X-CRM114-Status: GOOD (  13.47  )
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


> > > +device_initcall(register_fujitsu_mac_pmu_driver);
> > > diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> > > index 2361ed4d2b15..e6e49e09488a 100644
> > > --- a/include/linux/cpuhotplug.h
> > > +++ b/include/linux/cpuhotplug.h
> > > @@ -227,6 +227,7 @@ enum cpuhp_state {
> > >  	CPUHP_AP_PERF_ARM_APM_XGENE_ONLINE,
> > >  	CPUHP_AP_PERF_ARM_CAVIUM_TX2_UNCORE_ONLINE,
> > >  	CPUHP_AP_PERF_ARM_MARVELL_CN10K_DDR_ONLINE,
> > > +	CPUHP_AP_PERF_ARM_FUJITSU_MAC_ONLINE,  
> > 
> > Can this use CPU_AP_ONLINE_DYN
> > or are there some ordering contraints?  
> 
> It follows the same principles as other PMU drivers.

Some of them and I suspect the is cut and paste rather than justified.
+ Not sure how long the dynamic part has been available.

> 
> >   
> > >  	CPUHP_AP_PERF_POWERPC_NEST_IMC_ONLINE,
> > >  	CPUHP_AP_PERF_POWERPC_CORE_IMC_ONLINE,
> > >  	CPUHP_AP_PERF_POWERPC_THREAD_IMC_ONLINE,  
> 
> Best Regards,
> Yoshihiro Furudera


