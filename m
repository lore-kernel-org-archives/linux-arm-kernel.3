Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23A1C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyGC3dPYEiUfSysrm0g5+YwaFdCwK0NuaEpU2PLk9kU=; b=0FXsyFjSYqPC6Uy/QWj4FPH27g
	+obP82ES34vFpPCXKu1n0utbsCLh1PQDa5XpeOqiPnPrFMwSOXZnVu2eN91Zi+/i9LAOF20ZoGi4O
	j1RHNrh4iDBX+6C1JdSECwbNMW4D5Ek6PsyODsdkhKaj28epoJ/LbfFZRLpzEHpNVBQGfkksgQZ8c
	bXOaD0gqft4nJdvWhJfTLEKJSroOCyB4FBnM5netHAdaa8sV5qWPd61mJM7JIvdZzMd8Ne0nQ/gly
	PuKrbDaTBvn+IBampPkw8JmjYwgsOlTIhwavz6fuaTPRhcmklBdqU91KaUagWf8ovwF0YvnC9EaTi
	EgKfjqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AgH-0000000DD0n-2X6t;
	Fri, 11 Apr 2025 09:28:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39fs-0000000D07S-1LTb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:23:46 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZYqNb4lsqz6M4Yq;
	Fri, 11 Apr 2025 16:19:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 23733140275;
	Fri, 11 Apr 2025 16:23:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Apr
 2025 10:23:34 +0200
Date: Fri, 11 Apr 2025 09:23:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>
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
Message-ID: <20250411092332.00004b73@huawei.com>
In-Reply-To: <TYYPR01MB67157AE764B00DEAC97D4EAAC1B62@TYYPR01MB6715.jpnprd01.prod.outlook.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-2-fj5100bi@fujitsu.com>
	<20250130170422.00004c6f@huawei.com>
	<OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
	<TYYPR01MB67157AE764B00DEAC97D4EAAC1B62@TYYPR01MB6715.jpnprd01.prod.outlook.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_012344_504627_D86F18A3 
X-CRM114-Status: GOOD (  17.32  )
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

On Fri, 11 Apr 2025 02:56:59 +0000
"Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com> wrote:

> Hi, Jonathan
> 
> Sorry for the late reply.
> Also, the person in charge here has changed from Furudera to Okuno.
> 
Hi,


> > > Text identical to memory-pwrite-count
> > > which suggest two things.
> > > a) naming inconsistent.  Why is mac mentioned here and not in the name  
> > earlier.  
> > > b) This comment is perhaps wrong as I assume has something more tod owtih  
> > with  
> > >    energy estimation?  
> > 
> > We are currently checking and will reply later.  
> 
> After checking with the hardware team,
> the 'ea' events are measured at different points and may therefore 
> return different values.
> Since memory-pwrite-count and ea-memory-mac-pwrite currently return 
> the same value, they share the same description.
> However, we have defined distinct event names to accommodate potential 
> future enhancements.

As any future enhancement to make these different will also need a change
to the documentation to reflect that difference (and hence a kernel patch)
maybe it is better to not provide the second event for now?

Or is there some other subtle effect to do with groups that can be enabled
at the same time? I've forgotten how the driver works!

Jonathan


