Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F88E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 10:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5uSC3BK+YvGUsKSKx/YNrD4AlAFZtoOKclTkZr6p54=; b=TzYN8T7UBL8BZc1ETGw1H+YQAc
	lE8igSulgHVIA7nxxuM22COnZXRDw2TZjBPKt82dYulJL7OExJhV3J14zdjYSi9kGdMmyzg8KmI6R
	Cvo5Hgo4EX597/M/5Om1IlqrzkW6P772X2VgE0xX+EK3ezlbOmD2muzjd+wIgkhPqKcTsp9ubjlmB
	gjIKAVxt0N9cNdmtXVu0DjnV9HCbh+PhBBNALUj6lk5DJ9EQsb+IOxDZ1va5P3QqOPTyyve37pgE6
	Q/Sqk3AO8YbL2TZ7LnyszfpSVqSoNadnEh97DlkC3GnVusy9JV7PT39EqZAcKPIXmmLW5BVmZ+ZzN
	zGoLKd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3Hu-00000003U0s-1OSp;
	Fri, 13 Dec 2024 10:52:50 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3Go-00000003TsS-1eH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 10:51:43 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAW5Gf002214;
	Fri, 13 Dec 2024 11:51:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	G5uSC3BK+YvGUsKSKx/YNrD4AlAFZtoOKclTkZr6p54=; b=V59d/Tcak9U2dgRH
	IieiSNH5E9xkRhqCZH3nlT4/henx+nxTNXz4bglJg5tdoBYQs5nEMOhEAe0Zszq8
	mev4UqwhRvA5G2uSm+THWcdqbkuELoqDsTb83kCYc9RqkbowUg1vPnKVJJfgtcwe
	tIGMNxFh+U23kxQp1U1o3B0d/3ae+idNFqs85362zq3BZVamCxiwvctJV9iMomP+
	+/5TGY7nLZL0k44sSR/4D1pA66lXhlKIXOQejNNmjKMfY+x+a418pD6J7XToKZeV
	EEqn0RsO+wpR1U0X5jbe06mfIBz83J3Q/JYzlBdoBhMya+eaifghcKKP3XkNGATA
	BK3MZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj75wr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:51:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D82F40056;
	Fri, 13 Dec 2024 11:50:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C4BA268D8B;
	Fri, 13 Dec 2024 11:49:30 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 11:49:29 +0100
Date: Fri, 13 Dec 2024 11:49:24 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: repair file entry in MEDIA DRIVERS FOR
 STM32 - CSI
Message-ID: <20241213104924.GA3662210@gnbcxd0016.gnb.st.com>
References: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_025142_705969_33664642 
X-CRM114-Status: GOOD (  17.31  )
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

Hi Lukas,

Indeed, thank you for the fix.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Fri, Dec 13, 2024 at 07:00:11AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
> adds a new driver at drivers/media/platform/st/stm32/stm32-csi.c, but
> creates a new MAINTAINERS section MEDIA DRIVERS FOR STM32 - CSI with a file
> entry pointing to drivers/media/platform/stm32/stm32-csi.c. Note that the
> file entry is missing the ‘st’ directory in its path.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference. Repair this file entry in MEDIA DRIVERS FOR STM32 - CSI.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bff3d35f80b5..230b7a4ee95f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14551,7 +14551,7 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> -F:	drivers/media/platform/stm32/stm32-csi.c
> +F:	drivers/media/platform/st/stm32/stm32-csi.c
>  
>  MEDIA DRIVERS FOR STM32 - DCMI / DCMIPP
>  M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
> -- 
> 2.47.1
> 

