Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE5D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8hSoFbRC6UgMvkba9IddQVbd8BN8EHwUuiQw4WJtJg=; b=jsdnzgPtMAMrmOD4qnEqNC1N/5
	vu4Qq1Y80pIFe2HH8gHeaPajdCPOmlnWUo9f4Z9VI/2MqVp5f0DY/OKQVyepAc25b8QBHlKLJvDPl
	7SQi6v2i/q3CuvQ/WJlvtAvoI5fqzVZt9IejNxi2VZAWicVy+rmPDVcqhZ/khHY9jhEckzJY7xfmq
	PLCH3bPNZsv7DZmv0aO2JS5fFxO1yKRy981NnrkF0COXiiT35XrmMMMoe0qHFluQIY5VlUMeH/tea
	/ccctbnaqQGLjz+KRf5vlbghHsMrIvxjK6Wce+6V//unYFRl2fPaR/9kECgvjlfLJO4bodP4OgYob
	uqr19H1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3RD-00000003ELI-14EL;
	Mon, 15 Dec 2025 07:56:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3R8-00000003EKQ-1XvW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 07:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EE2A4165B;
	Mon, 15 Dec 2025 07:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F90C4CEF5;
	Mon, 15 Dec 2025 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765785365;
	bh=MlLssv01cYup7HpjM3F8nb2QRsjJ2hpns8lGvv96LxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=deQNvTratwzTgo1nYpirqW+raG211ew5e5OBLf6eOcDnhuHXPD80+udhz+WDYVaD3
	 uPznMJOefvjSB0YpIX+U8ByiU0aTknd/jqseZKkoy5F9ZGRSR7tkGy+y6ykzzT8FL5
	 Y4mxOuEDOvg3ynqQGStVdFuzjvpCqNoWba/+xKiVE95RKHeBLlyRb3rHQwBjo5AZE9
	 Hu73u4pMijggb8SRcIj2w963f5s6bs1PoPnE7c3IH/AeWyTj6b/anVxbt/NS5xX/7V
	 iMM/XK0ynNtSqkNQoN+JRyUCgOv2LvzBGKeJ3otrWuy2CAjgb17cgQpWXcytkZKIRa
	 k00BOxcaaco7g==
Date: Mon, 15 Dec 2025 16:55:57 +0900
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
Subject: Re: [PATCH v1 09/17] efi: stmm: Make use of tee bus methods
Message-ID: <aT-_DbMYPN0p2CrK@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <9e3d9ab0f7987f313237b51911865f0cccae8eb5.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e3d9ab0f7987f313237b51911865f0cccae8eb5.1765472125.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_235606_425983_328791BF 
X-CRM114-Status: GOOD (  20.49  )
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

On Thu, Dec 11, 2025 at 06:15:03PM +0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> index 5903811858b6..7b04dd649629 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -520,8 +520,9 @@ static void tee_stmm_restore_efivars_generic_ops(void)
>  	efivars_generic_ops_register();
>  }
>  
> -static int tee_stmm_efi_probe(struct device *dev)
> +static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
>  {
> +	struct device *dev = &tee_dev->dev;
>  	struct tee_ioctl_open_session_arg sess_arg;
>  	efi_status_t ret;
>  	int rc;
> @@ -571,21 +572,19 @@ static int tee_stmm_efi_probe(struct device *dev)
>  	return 0;
>  }
>  
> -static int tee_stmm_efi_remove(struct device *dev)
> +static void tee_stmm_efi_remove(struct tee_client_device *dev)
>  {
>  	tee_stmm_restore_efivars_generic_ops();
> -
> -	return 0;
>  }
>  
>  MODULE_DEVICE_TABLE(tee, tee_stmm_efi_id_table);
>  
>  static struct tee_client_driver tee_stmm_efi_driver = {
>  	.id_table	= tee_stmm_efi_id_table,
> +	.probe		= tee_stmm_efi_probe,
> +	.remove		= tee_stmm_efi_remove,
>  	.driver		= {
>  		.name		= "tee-stmm-efi",
> -		.probe		= tee_stmm_efi_probe,
> -		.remove		= tee_stmm_efi_remove,
>  	},
>  };
>  
> -- 
> 2.47.3
> 
> 

