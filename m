Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370BECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y46zxO1C4o8WUqtj07jqBENmFGWJWEsozuquXurmpj0=; b=s1V/5Snuw2tyfblIs8KDN4d9B5
	eB+lA6DcNVu2+UTRRyi+rgZ+U0iwC+Y7K7qxCRsNmF7hsuy2mQPJNURxTZolrB7i7ydnyGqO+2IWg
	8CSL27vACSxBLHHZAnbNSOKcXvn78zIu1DOi3vNMrGZJ4SNEQDbLVQjyaARRcimothvsrV01yc+5v
	mFWPcIdmu4ZNCKTjgVeaHB6tiNxaC9dY/GFuozd3PH/lDeGABGW8WPpHDLERpkRRiRdl7pAdfhkAH
	IeacNEWfhuVeC79niarDQgn5++gs7uWR4EO6ouTk2BEgEPzO7TGC5ORX8jXIMt8MYNyj3AgelJutS
	T7L/M5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIk5R-00000006o0v-2yCa;
	Tue, 11 Nov 2025 08:50:49 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIk5P-00000006o0W-1usb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 08:50:48 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-786572c14e3so38104177b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 00:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762851046; x=1763455846; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y46zxO1C4o8WUqtj07jqBENmFGWJWEsozuquXurmpj0=;
        b=eyzI4IBQs4wj1HythoPgxjfXWiYy8+Lge9h029qmf/1HVy8BoHRwILTrqKiGHus8G9
         klTnS26EaTMSibGRf9DKecV5hBhVDfLgawzWplwaFXXtCVQdXm1dwqMRMaeXyyGdpVi5
         HWUWtGe6eXU/uytYxkCJqgtnakAc4+dTJQ4t+3IiIYnr+uoENGIdqAOEFOzOrTeMHqhz
         6oCV4i/kSIySRFm7vFXRHoZgMsct3f3Zk7ZE39t7BL+GqtfReQxpjkI8jUWdBYlNcqgY
         S5vbNgnhos6kSD+9MXy+gUyhJyU/0d7+3hwGsfByy6R5dvCEGSIwDT0ckLI7jN2pxJ7N
         Xt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851046; x=1763455846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y46zxO1C4o8WUqtj07jqBENmFGWJWEsozuquXurmpj0=;
        b=kmj7xBQCuVpsnEiejLEdumNkaC6p1eM579nyx8uYhXzjxJY69PGmWSMBOlm5tc7hoF
         gFiX/ltZuygBc+AjrAKwuoFSWTLWCbpLcTFL0CZfU3Hx/jyK2Qgg5jUBzaT53d+If2e9
         /BcBecplBcoYuu70fE+dv8GvAmA1TTqJZs7ozWz84PipM0ORrCvWfv9cCaRPfcq2uOKV
         gIEN/br/czO1JydyW3KQFzsBq03Yw/BMCQMi6JeJjdzm0t2SOVoe04ECJ1P9RJVArS2q
         Fx3tg78gUe+qsUq7f/Gl4zbgX0/7P2B+akbABN+SI9mKxW6avsiSe7h7iCX4jWShTc0W
         hzYw==
X-Forwarded-Encrypted: i=1; AJvYcCX0CG5wUXQaLdhcCtBXFXDVywztkx89Q70zmsz55O6Dm6bebaj6GjNo4suio252lJFtl14aExjAZODj6GZicff3@lists.infradead.org
X-Gm-Message-State: AOJu0YxHCMOQDX0W0CsDpMLGjDk01DOxQi0GG+O/ixFtMPCXsCOMVwI+
	0TeMrXIXBiIIuxPXsY3l2JBQl15SGtj/j0Yz2Qpq0nFuyUUJKs6h3w+awwF1W1NdHCPN3YMXGlq
	6MUGtc4+tnouoADTERliUEAIvx3Hbk68QYodKfd6LKA==
X-Gm-Gg: ASbGncuWfb//tvrYI4i66y8VmzEOJaSuFeOuGWc2dzQ2CZyHMBYIAJdjFhfSA+mFhUS
	gNZctT9evyMYO7rqmhaF5vZXG3YSITt+5FMdY/XiagBLL28zioYoMqABC4kFgUhTxKsDFzgLyyL
	KcEKOfqKZAb5DCYFmsQvB0beli+4ezSCOrrvtlmfIW+dnebnwFqNA88d/UyrLyHYPOJh5rbFc+l
	W866a5bdawicg5h4YdBLNIy3d0iV8BgS930hZ/YfPc78DeTq2k5Ym8uVsFmEJK8LqJw+0Cw5wRY
	VME2O+Ft2QqJokZAa2VWv1QFMEg1q//jEm9WxSc2
X-Google-Smtp-Source: AGHT+IFW04NMmm/DmGXKuNoocNXOW1P5E9RSrXkBfL6e/iKOHrJptvsyGLLUH1wJ5OdOEoN0Uvp2X+BW0+RpDBRk76Y=
X-Received: by 2002:a05:690c:688b:b0:788:c74:d038 with SMTP id
 00721157ae682-7880c74da71mr3427737b3.39.1762851045790; Tue, 11 Nov 2025
 00:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20251111060212.1963608-1-rdunlap@infradead.org>
In-Reply-To: <20251111060212.1963608-1-rdunlap@infradead.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 11 Nov 2025 10:50:09 +0200
X-Gm-Features: AWmQ_bl9LggH2BnIOi8b_6HMwtRDi2PxmqidNChtL-tYmJN-Isc3DYSw2FH9LTs
Message-ID: <CAC_iWjKYBgjG=C7NgAFwn6uBSMS0t_WepazvcTQb-gPewL9ckw@mail.gmail.com>
Subject: Re: [PATCH] efi: stmm: fix kernel-doc "bad line" warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_005047_511608_3D2BF377 
X-CRM114-Status: GOOD (  16.01  )
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

Hi Randy

On Tue, 11 Nov 2025 at 08:02, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Add a beginning " *" to each line to avoid kernel-doc warnings:
>
> Warning: drivers/firmware/efi/stmm/mm_communication.h:34 bad line:
> Warning: drivers/firmware/efi/stmm/mm_communication.h:113 bad line:
> Warning: drivers/firmware/efi/stmm/mm_communication.h:130 bad line:
>
> Fixes: c44b6be62e8d ("efi: Add tee-based EFI variable driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Is the fixes tag necessary here?
Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

Thanks
/Ilias
> ---
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-efi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> ---
>  drivers/firmware/efi/stmm/mm_communication.h |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --- linux-next-20251107.orig/drivers/firmware/efi/stmm/mm_communication.h
> +++ linux-next-20251107/drivers/firmware/efi/stmm/mm_communication.h
> @@ -32,7 +32,7 @@
>
>  /**
>   * struct efi_mm_communicate_header - Header used for SMM variable communication
> -
> + *
>   * @header_guid:  header use for disambiguation of content
>   * @message_len:  length of the message. Does not include the size of the
>   *                header
> @@ -111,7 +111,7 @@ struct efi_mm_communicate_header {
>
>  /**
>   * struct smm_variable_communicate_header - Used for SMM variable communication
> -
> + *
>   * @function:     function to call in Smm.
>   * @ret_status:   return status
>   * @data:         payload
> @@ -128,7 +128,7 @@ struct smm_variable_communicate_header {
>  /**
>   * struct smm_variable_access - Used to communicate with StMM by
>   *                              SetVariable and GetVariable.
> -
> + *
>   * @guid:         vendor GUID
>   * @data_size:    size of EFI variable data
>   * @name_size:    size of EFI name
>

