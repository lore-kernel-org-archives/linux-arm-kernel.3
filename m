Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0D10F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gB2i70YY7tA8bB0dumzedAxykUOjDm3U5xR1oNIAtA=; b=ktKUvUabzwfvgP6xpld2GWuGxf
	lZarNtpQswc7EmRU0+Z+G76CCbESer2Jqfx45Wu5eY2cod6hB8kBYRaCcpysIxxTUwHcfGcopmgZS
	J+dM+sxvKo1vl4j3wwazaprC+U4x35dKWp9gPlRrXXtx+5cZQBHAJbgDcxFEvdfFfXxh8i7jSc1I5
	27Ok6mVKvvHOh8rRcrTmMwZzq4/VLIzE9O/X15Sy19RBuCdEj2kjRBPTDAKsFlAss8pvVNrBNrd5A
	gQW8TpgBkAOsZ/08wEwy7Xj1f6Vm+vw/kPSNi/tJjOLgr+3a3P7HZ9W3pMJYQin1Cu04f3xl7mnm9
	u9Mi7jPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SU0-00000008uKS-1oZz;
	Sat, 28 Mar 2026 12:09:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6STz-00000008uKL-1K0k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 12:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F3F360008;
	Sat, 28 Mar 2026 12:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100CAC4CEF7;
	Sat, 28 Mar 2026 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774699777;
	bh=aj2WoZSD4Ghz0WN0CvxQLhesl3mrrJl9JZMEkXD6iJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k/r4m/ueX4BHo3KpJu/EnzGu9hUWVECJ9zT43JbN/vOCG9z6Gnjl/MCj9KDym5wY7
	 neYO7SvL/1stOEBVXgVmmwlml7aAlX2WSW/IAPRNjXJPUFxhfnwk5xCehkqjQf7RDS
	 K1vNH4lR04IJWfDU+t/Betv8YLU8kJ4jUAQrTVP6vEZmNvQr1NHeH+vG6x99PokfiG
	 1P/ZhIc23nYpHyF33u6y5nhbBXp/hDkea3hwiGNz4EtbkgdjJOXtmm7ZgiNrmc7HuO
	 XWEtUeMRudf3FCXBvPIWjBPud2IEgBzp7fV6VgRWxoGkVbS8wy3w1q5ACAfXM9RS+Q
	 8HWkcVP97AgeQ==
Message-ID: <7d1b7aa6-aaa8-4116-abc2-382511823a9c@kernel.org>
Date: Sat, 28 Mar 2026 13:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: fsl: qe: panic on ioremap() failure in qe_reset()
To: Wang Jun <1742789905@qq.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, gszhai@bjtu.edu.cn, 25125332@bjtu.edu.cn,
 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn, stable@vger.kernel.org
References: <780c1ba3-6639-478e-896f-e35ec059b58c@kernel.org>
 <tencent_FED49CF5331CC0C7910618883332A08E2606@qq.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <tencent_FED49CF5331CC0C7910618883332A08E2606@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 27/03/2026 à 01:12, Wang Jun a écrit :
> [Vous ne recevez pas souvent de courriers de 1742789905@qq.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> When ioremap() fails in qe_reset(), the global pointer qe_immr remains
> NULL, leading to a subsequent NULL pointer dereference when the pointer
> is accessed. Since this happens early in the boot process, a failure to
> map a few bytes of I/O memory indicates a fatal error from which the
> system cannot recover.
> 
> Follow the same pattern as qe_sdma_init() and panic immediately when
> ioremap() fails. This avoids a silent NULL pointer dereference later
> and makes the error explicit.
> 
> Fixes: 986585385131 ("[POWERPC] Add QUICC Engine (QE) infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wang Jun <1742789905@qq.com>
> ---
>   drivers/soc/fsl/qe/qe.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 70b6eddb867b..9f6223043ee3 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -86,8 +86,12 @@ static phys_addr_t get_qe_base(void)
> 
>   void qe_reset(void)
>   {
> -       if (qe_immr == NULL)
> +       if (qe_immr == NULL) {
>                  qe_immr = ioremap(get_qe_base(), QE_IMMAP_SIZE);
> +               if (qe_immr == NULL) {
> +                       panic("QE:ioremap failed!");
> +               }
> +       }
> 
>          qe_snums_init();
> 

Applied, thanks.

