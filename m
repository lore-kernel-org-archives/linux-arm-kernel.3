Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1F4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br9Y8ByGePUt8hPyQifOh5PlCzWR6zg2I9jLgLrnzj4=; b=MhO1yta6Qw1f1h4OXtiXiSByGs
	j7IdbVI9QqkiHT0Ya1MQLaELeuxB1F+rpHybolEIPzm30VH7u7xaU4QmlnWRO8cW3tnFdReQhoi6E
	YxnotxrO0tYbXqLGiS04s+NXLHi7idN/pw2QvsmfFjlCSM+KDHAQ7mQHAocaPK7rDdoHgsn5FlPzK
	90kQG53jwpAm7wxs29axAEkHeNxC1J2hx1GCGjloPxyIsdTs1+VXwtZfNO2y+KsUibYE/mY4b94LX
	nnTMM+j26c9D1VvrbW9bBzsOSRaekBL3BFE36qibRgA3aM5OgYDturGafLGb4Ag6gYjyW3vwXhKGz
	bGmjE+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDev2-00000005Zix-1HBw;
	Sat, 10 May 2025 07:46:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDet3-00000005ZLs-0X45
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:44:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0365F614BA;
	Sat, 10 May 2025 07:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CA1C4CEE2;
	Sat, 10 May 2025 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863083;
	bh=bE/SOpoChEP71E9o00tKei1ZQQ2RQ/5dOoWOaqj9An8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRm0JemUldpe+AgpDLQ5gUzWpGiNST07Xb7zIxeqwnu7jsSZr1yS4/lz4mfza2rln
	 G7AyXvCic3ERDJlHJMfN3/S7aWRxrb7rmLDTtta01a79D3ACZLBzNl2+Zd4CVFHMqs
	 quMc08ZsU6wqlDsG6c5lHSD5KEpOOdNF1h70gGSb4W8qvFDaK7kw0dKtNwzqtYeQgU
	 zmm/Yxvof1Ps+yJAHT7+PbjkbgIV7njlN6hU0BumHXRHQ8/Aw16DO7Lf8ciKRklKi3
	 JDoafNUlWi1+P/wswBxr6C1sL3xDClwUVa6Rsq0Wk/bcrQXS2SN5ixpLivo249eC2O
	 Ja0cRETdRmAjw==
Date: Sat, 10 May 2025 10:44:38 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-integrity@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH v4 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <aB8D5syofPSqjzns@kernel.org>
References: <20250509085713.76851-1-sgarzare@redhat.com>
 <20250509085713.76851-2-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509085713.76851-2-sgarzare@redhat.com>
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

On Fri, May 09, 2025 at 10:57:10AM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> Add a new `buf_size` parameter to the `.send` callback in `tpm_class_ops`.
> This parameter will allow drivers to differentiate between the actual
> command length to send and the total buffer size. Currently `buf_now` is
> not used, but it will be used to implement devices with synchronous send()
> to send the command and receive the response on the same buffer.
> 
> Also rename the previous parameter `len` to `cmd_len` in the declaration
> to make it clear that it contains the length in bytes of the command
> stored in the buffer. The semantics don't change and it can be used as
> before by drivers. This is an optimization since the drivers could get it
> from the header, but let's avoid duplicating code.
> 
> While we are here, resolve a checkpatch warning:
>   WARNING: Unnecessary space before function pointer arguments
>   #66: FILE: include/linux/tpm.h:90:
>   +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,
> 
> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v4:
> - rework the commit description [Jarkko]
> ---
>  include/linux/tpm.h                  | 3 ++-
>  drivers/char/tpm/st33zp24/st33zp24.c | 2 +-
>  drivers/char/tpm/tpm-interface.c     | 2 +-
>  drivers/char/tpm/tpm_atmel.c         | 3 ++-
>  drivers/char/tpm/tpm_crb.c           | 2 +-
>  drivers/char/tpm/tpm_ftpm_tee.c      | 4 +++-
>  drivers/char/tpm/tpm_i2c_atmel.c     | 3 ++-
>  drivers/char/tpm/tpm_i2c_infineon.c  | 3 ++-
>  drivers/char/tpm/tpm_i2c_nuvoton.c   | 3 ++-
>  drivers/char/tpm/tpm_ibmvtpm.c       | 6 ++++--
>  drivers/char/tpm/tpm_infineon.c      | 3 ++-
>  drivers/char/tpm/tpm_nsc.c           | 3 ++-
>  drivers/char/tpm/tpm_svsm.c          | 3 ++-
>  drivers/char/tpm/tpm_tis_core.c      | 3 ++-
>  drivers/char/tpm/tpm_tis_i2c_cr50.c  | 6 ++++--
>  drivers/char/tpm/tpm_vtpm_proxy.c    | 4 +++-
>  drivers/char/tpm/xen-tpmfront.c      | 3 ++-
>  17 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index 9ac9768cc8f7..7ac390ec89ce 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -87,7 +87,8 @@ struct tpm_class_ops {
>  	const u8 req_complete_val;
>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
> -	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
> +	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
> +		    size_t buf_size);

I'm sorry but now that I look at this, just for the sake of consistency:

	int (*send)(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
		    size_t cmd_len);

I.e. match the order and parameter names from tpm_try_transmit().

BR, Jarkko

