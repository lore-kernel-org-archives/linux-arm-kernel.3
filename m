Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE4BD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3sn6WlPrbdS65TUj6zZh3jspJHmou/nbFLvlvYT/Yo=; b=PoM9raI4NCb+FYn+P10RBhiQ4b
	QNKvjNBu/Avc0pySdn66QUsDmoBbisY1IOEv2TWQnKidAo8ZEP3smvUzwJg126lmqukbsHZ3qt2Ki
	Nk2S1zf8wzWwdFAQyMSADX1QKbdSMsmJcbAC30T3r7Mci/iFlYiWs6wdGsr3A1AlEcLPH6iXm7Puk
	//wu+RoAocHCYs2vtBt1cMYodYZRhTsVNVTfxEppq0WC6jCagQoEg2Jt0CMMNjzPwSrLA2ZC9wmsz
	km1hxlDaPkHjHjP2rhgoYfOiP80pO/lmpnLUf1mN120RB2AcTCHUleuD9LFEJP65NJslxqYCK9jaV
	iCsdywtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3QV-00000003ED2-3mz5;
	Mon, 15 Dec 2025 07:55:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3QU-00000003ECY-3rcb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 07:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5574360129;
	Mon, 15 Dec 2025 07:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC736C4CEF5;
	Mon, 15 Dec 2025 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765785326;
	bh=2qJr895ogd7LPk/YsFAb/JfvV6B7y4KUOhDxybT1U8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqsTVgQ85nB3TC8WJu8my6yqsPEwgqdKMCHvbMV9Kk9vZi/KtU34Vp9mDYZkIkGvS
	 Rdv6SZ2PGO5hUg31hQqFiZC/huPk/HA0qATQzmYkwMQtpaYjN+4T9amD49GWE5OTJu
	 TXoehSJh6ITWFZt9u5OxLmWBwMA/F0j6FVpaB8S2Y49wXHS9cMi5fPtyXLwr3GxNGb
	 OGV2YoE22969pwGcn4fcSsxyzrpMTOFqil6WPhBRXBDoPKCsD/eGYt2vQg+B7xmiwv
	 3jKkeDKGQB2NhEQIhKXRSDf+rtgAke3aFRxjbovJXfcxMrj+70Iq8wHl5KE7H9xNQx
	 0S+Zv6QQWugIw==
Date: Mon, 15 Dec 2025 16:55:19 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	op-tee@lists.trustedfirmware.org, linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/17] efi: stmm: Make use of
 module_tee_client_driver()
Message-ID: <aT--5-bIY8S2PiZa@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <0896270bc530d1e3b7fbcf5f7e168172dcc05d1e.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0896270bc530d1e3b7fbcf5f7e168172dcc05d1e.1765472125.git.u.kleine-koenig@baylibre.com>
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

On Thu, Dec 11, 2025 at 06:15:02PM +0100, Uwe Kleine-König wrote:
> Reduce boilerplate by using the newly introduced module_tee_client_driver().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> index 65c0fe1ba275..5903811858b6 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -584,24 +584,12 @@ static struct tee_client_driver tee_stmm_efi_driver = {
>  	.id_table	= tee_stmm_efi_id_table,
>  	.driver		= {
>  		.name		= "tee-stmm-efi",
> -		.bus		= &tee_bus_type,
>  		.probe		= tee_stmm_efi_probe,
>  		.remove		= tee_stmm_efi_remove,
>  	},
>  };
>  
> -static int __init tee_stmm_efi_mod_init(void)
> -{
> -	return driver_register(&tee_stmm_efi_driver.driver);
> -}
> -
> -static void __exit tee_stmm_efi_mod_exit(void)
> -{
> -	driver_unregister(&tee_stmm_efi_driver.driver);
> -}
> -
> -module_init(tee_stmm_efi_mod_init);
> -module_exit(tee_stmm_efi_mod_exit);
> +module_tee_client_driver(tee_stmm_efi_driver);
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Ilias Apalodimas <ilias.apalodimas@linaro.org>");
> -- 
> 2.47.3
> 
> 

