Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9612C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tsLc8siM+0HW9pE+Gb2ZSVB1MZ9waX5wUxfXK54WP4=; b=vvi0Zam8zcofwffdWZdRLuX20Q
	GjCSFSuYwzNRjT3zFBp/Mh0Gj8Klfp6TdCIzmbfNuuDbbhIMdx57I6IX3WH50B6cPaTweuQ9trpj0
	EUDxRwThWe0ciZ/PlqaTIEFz54OGN5smZVSaO8WKsQv/mMkJZohFUywaDgz0disk1ulHX9iB3U57a
	8mSoGOkbr/wzIniBpe+4V9GdGCwPsocY6jZr4gtY2eICiO0JoGGO+++2ARYHeZ+c7qcrQ87RwOVl3
	y65UXrlKxEQNPFtFjiCbCfPlsDFKGYnqd+d+mPAhTv+vzmTJuoXTWAMT0SXPLt6ug3rY3McFb5DyG
	u/193XNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEzp-0000000CyvV-0U72;
	Wed, 28 May 2025 11:30:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKExf-0000000Cyq2-3hLK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 11:28:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6nLd5W1Nz6M4sd;
	Wed, 28 May 2025 19:28:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B605140113;
	Wed, 28 May 2025 19:28:28 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 May
 2025 13:28:27 +0200
Date: Wed, 28 May 2025 12:28:26 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland
	<mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 14/26] arm64/sysreg: Add ICH_HFGITR_EL2
Message-ID: <20250528122826.0000566c@huawei.com>
In-Reply-To: <20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_042844_066956_22B3FB60 
X-CRM114-Status: GOOD (  12.37  )
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

On Tue, 13 May 2025 19:48:07 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> Add ICH_HFGITR_EL2 register description to sysreg.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

Hi Lorenzo,

> ---
>  arch/arm64/tools/sysreg | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 0927754d9fe2c5addbd9693d83b7324f1af66d3e..d2f53fb7929c69895fe8a21ba625d058a844d447 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3616,6 +3616,21 @@ Res0	1
>  Field	0	ICC_APR_EL1
>  EndSysreg
>  
> +Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
> +Res0	63:11
> +Field	10	GICRCDNMIA
> +Field	9	GICRCDIA
> +Field	8	GICCDDI
> +Field	7	GICCDEOI
> +Field	6	GICCDHM
> +Field	5	GICCRDRCFG

GICCDRCFG in the spec. (you have a bonus R)

Of course the real question was what am I avoiding that made checking these
against the spec feel like a good idea? :)

FWIW with that fixed,
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
for patches 2 to 14.

> +Field	4	GICCDPEND
> +Field	3	GICCDAFF
> +Field	2	GICCDPRI
> +Field	1	GICCDDIS
> +Field	0	GICCDEN
> +EndSysreg
> +
>  Sysreg	ICH_HCR_EL2	3	4	12	11	0
>  Res0	63:32
>  Field	31:27	EOIcount
> 


