Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE3ECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wkxWw47BzORbcIvnRcjuJoLYpePdE9B8SaY9zOEa/I=; b=opPRXiRBgzI7cTI82bfU+km366
	kmi4nMUgPYHNdiapVswPOoxTmDwqngGEQKPcYPbUyXQ3CnlQJmwpjjY97bQPUAMYL2QuoiGLCdPdT
	hUq69w8vB4tUZHFAN4gdrzsB5Y3Slh7ZIazhIob2Eyvls65VLvZTADShaOx6Rs0iUxEOwIhEqeTyT
	qIaMfXlucd4b3pDUH6Hs/RxiYyKpTndk4jn24vqhDTr8++x6rdDSoycxY2XRrVLCa9SVCT5wQjfs0
	8ZygGfJHV6vcxf//TUThTSTVPt9rM12j8BVDB8v4zyF9H4ZrppIeFIfCLs7V2yJeRKX6wQmRtUyAz
	d34Jktag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjF9-00000001RPo-3mxK;
	Mon, 19 Jan 2026 07:00:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjF7-00000001RPP-3j3T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5946540732;
	Mon, 19 Jan 2026 07:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E107C116C6;
	Mon, 19 Jan 2026 07:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768806004;
	bh=YvzjJHnbrMAmoE/TSVnhogdp44McXfMW4MzGac5horQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jW70hutAeyrClYX7yTEihU3wZwlmrM11rZw/9AoEEboc2kkVpGJvVTMrhZKKtOcUm
	 DUCnHEAhqf8siCiZWjP9RtDK8zyLHJlOCyw6rPhkZJpky8G2VU7h9P5LsjbPHQUguU
	 r1pKsVhyWev7xf7QjHEr2BIvlswoYc3kwuEw9bFmP6BXCYcF4ZmrlXbDU1Ow0ppqIU
	 ZVVXGL5w0YJT4MgQfW0IBx2t/K+XFVHGymbu2gdqdoJjdodcQS2ryEkI+JC/76jQXW
	 RjMqeqgEYwnBgRERK2odmIWsvNb9nKHAGq2ZvFJvcICCdMcmei1dBOLDFdt5BfERUz
	 dqZae3CNawUww==
Message-ID: <3860577c-2cef-4e10-9cc1-33246d261a8b@kernel.org>
Date: Mon, 19 Jan 2026 08:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ
 handler install/remove
To: Chen Ni <nichen@iscas.ac.cn>, qiang.zhao@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260119055715.889001-1-nichen@iscas.ac.cn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119055715.889001-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_230005_948415_231612E6 
X-CRM114-Status: GOOD (  17.34  )
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



Le 19/01/2026 à 06:57, Chen Ni a écrit :
> [Vous ne recevez pas souvent de courriers de nichen@iscas.ac.cn. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The driver currently sets the handler data and the chained handler in
> two separate steps. This creates a theoretical race window where an
> interrupt could fire after the handler is set but before the data is
> assigned, leading to a NULL pointer dereference.

I don't understand what you mean, how can this happen ?

irq_set_handler_data() is called _before_ irq_set_chained_handler(), so 
how could an interrupt fire _before_ the data is assigned ?

> 
> Replace the two calls with irq_set_chained_handler_and_data() to set
> both the handler and its data atomically under the irq_desc->lock.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/soc/fsl/qe/qe_ports_ic.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
> index 61dd09fec6f6..8e2107e2cde5 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
> @@ -114,8 +114,7 @@ static int qepic_probe(struct platform_device *pdev)
>          if (!data->host)
>                  return -ENODEV;
> 
> -       irq_set_handler_data(irq, data);
> -       irq_set_chained_handler(irq, qepic_cascade);
> +       irq_set_chained_handler_and_data(irq, qepic_cascade, data);
> 
>          return 0;
>   }
> --
> 2.25.1
> 


