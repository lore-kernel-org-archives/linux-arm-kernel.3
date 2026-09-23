Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8B3C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14/vh+QzZPhsx5uvQM0Uz7p1ZDkGwAb8ilKyyQwVJng=; b=F3IrsGWKQqREkFsl4HKoOrI8Yx
	1p1cmakdXlbdr94wF5Lk0KKe957UkbqIFY24Red0q8Wns6lJttnM06/G7caPWqLTXiATqihiReXgK
	8nit1/XAtkI1XVkr2H4NDyGzdP0DG1ktMtz4eeOOTgfkFlcv1sAoFtgyIUvoThoPQNlDxSsp2YY+f
	owZzlb7IVXyC8unBZh/QPBSqc8IHPxCzcDpRfgjQAxo3MRYjTzCop/jFvw9MKYXr+mGKr0W5/z4rq
	PdzxzkV/K7EGvvPASppII2qfWC6g+lANXM86yx/zVMI27plbAhpCTIS8c+1weXprxmnLEi/AJkju6
	g5hv1Syg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JU8-00000007mC1-3ept;
	Wed, 23 Sep 2026 09:41:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JU7-00000007mBR-3Erp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 09:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=14/vh+QzZPhsx5uvQM0Uz7p1ZDkGwAb8ilKyyQwVJng=; b=EPim5ej5xyMk5Z7mRNb1p2cgez
	77ussZOJu7O9H1VuxE/ma8BwVCushrdMygB7wokH0tAfnyFt1y/r2MJocBtqeBnjs/sqoVF1du3I3
	ROMPtEWfSvVCKVucGUl+mBRMAkQ6U0eJ7Igkv3+7tRZLCOhAl+gGnwgjTggnvNf1jo1qfJT9NE5xn
	lMKMIU/U2jSuBXLfzUtBxEQkvNMmP9OutPLalPtnyiuB1+4ZjAlVhk97YBhWSaDTmx2nEc0oR2mGt
	Mz6y3YKkdl9xk6WOt9/zNzIiVlqcZ/8ksZCh11526Wner4IPJefQXro8zgTJt8+9AAsWIf3jF0c0C
	oQ6+UMZQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9JU4-0000000EbAm-1GeU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:41:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D628C1A0FE8;
	Wed, 23 Sep 2026 09:41:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 941C460580;
	Wed, 23 Sep 2026 09:41:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11D91103293EF;
	Wed, 23 Sep 2026 11:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790156495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=14/vh+QzZPhsx5uvQM0Uz7p1ZDkGwAb8ilKyyQwVJng=;
	b=OLRLlN9lAltV/1QbWWGR8Pkwn1w2rOSYmM9jOs/uT+NrrfciKSQQCasv29uuO5DEMaFR58
	kiPMFvNV8H6IE3jBlcPiiCjNNx/R/Nqr7q04XX0GiAX23f/h6yviJEx+jFfsPPAqEmwuyY
	a4SYRoP6aAFTY11A/ccCU1un7OFtTElsmd2lrlkZC5q9iPcW9SWiZ2VatsdINJfOxhKkgm
	E3GL4eyV5t89ETSfKPYSgaPcJGOaWJlASpKxlHRm6aZhaBnOD95TDLcy11Cl565UDL4dnK
	Z7zC92+KvlCltjZzeUQtLgh1HOnkzmlDpGYVQ6ysLRtkFvkjkVGCoyg1+HiMbg==
Message-ID: <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
Date: Wed, 23 Sep 2026 11:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Coia Prant
 <coiaprant@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_104148_642113_DB65FED4 
X-CRM114-Status: UNSURE (   8.92  )
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

Hi,

On 9/23/26 03:07, Mohd Ayaan Anwar wrote:
> Hi,
> 
> This is an early RFC which adds the XPCS and ETHQOS plumbing required
> to enable 10 Gigabit Ethernet on the Qualcomm Nord SoC. This is the
> first time USXGMII together with an external PCS is being supported by
> the dwmac-qcom-ethqos driver.

There are currently 3 in-flight series that adds glues to DW XPCS and stmmac: 

This one,
The Rockchip one from Coia [1]
The S32 one from Jan [2]


[1] : https://lore.kernel.org/netdev/20260922200336.2201212-1-coiaprant@gmail.com/
[2] : https://lore.kernel.org/netdev/20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com/

MAINTAINERS entry for XPCS says :

SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
L:      netdev@vger.kernel.org          
S:      Orphan                          
F:      drivers/net/pcs/pcs-xpcs.c      
F:      drivers/net/pcs/pcs-xpcs.h      
F:      include/linux/pcs/pcs-xpcs.h    

It would nice if some of you could help maintain the core XPCS driver, and make sure
these series aren't stepping on one another :( I personnaly don't have any XPCS HW
for tests.

You don't have to do it alone, multiple people can co-maintain that :) Maybe
Synopsys folks can also chime in ?

Maxime

