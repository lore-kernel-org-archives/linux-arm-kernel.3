Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0464C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT40fs+/wOVv1q+A4Y1ik4iXxFsXJNhtarxPevnq6Xo=; b=09K2H9zwvVz6kirQZPyjIiAohN
	JkN9Mt/aKmfC1GP63fXGk3fhksHtTcI3pGkeM/1Ktpq7yMUua5Pce/d6UpaTCeE1L1yT+hIJuXW7z
	IjMM1DEQqhJ1yjgLLpHmPDs1Em7eVzMD0m0LQyZ/QerusEk0LalUEipHE84E8fOf5EIgT/A04IjuW
	Hm+2QbiqiTUhVvjSWCiNRK3L2mVgSyCnIaARqbutnkOywNLygF0fxNBcnk1vxk4Pv4ucLoZahW3cr
	elA2JSyk02XH6RbIMxMuuoUO8++0FWrs9DGxGo92I39VwmsBrE6wZG4pqzHT984KREw46vnZRDdh8
	F8gRCu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuKT-0000000FChl-2yEN;
	Mon, 03 Feb 2025 11:09:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teuGo-0000000FCIA-3ohO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:05:41 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YmkCr3G7nz6K90T;
	Mon,  3 Feb 2025 19:04:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 025CB14011B;
	Mon,  3 Feb 2025 19:05:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 12:05:29 +0100
Date: Mon, 3 Feb 2025 11:05:27 +0000
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
 =?ISO-8859-1?Q?N=EDcolas?= \"\"F. R. A. Prado\"\"" <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, "Peter Zijlstra"
	<peterz@infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <20250203110527.00006747@huawei.com>
In-Reply-To: <OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-2-fj5100bi@fujitsu.com>
	<20250130170422.00004c6f@huawei.com>
	<OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_030539_100239_51318EAF 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Mon, 3 Feb 2025 07:18:38 +0000
"Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com> wrote:

> > 
> > mod_devicetable.h
> > for the acpi device table.  
> 
> After checking, I found that
> linux/mod_devicetable.h is included in linux/acpi.h.

True but with a few really tightly couple exceptions, normal
kernel policy is follow include what you use principles.


Thanks,

Jonathan



