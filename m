Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53319EEF319
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6IXJ4+AIDPs0nIBd5//+WvmemCt3YPebZ7hJpPlxSc=; b=KITxWlj2QObebXRxG1SCyOpGVt
	6L713XBILlCTRp5OevsUuOREYyuL1UAfhaWifKzEXMO63zcIiOOgvUwSXnvmXjXeoE2KRaNyXkZ52
	aw3AEpFGb9o6PlMh2Nu5yns8Wrl+CswYwzjqmfXElufJ5f0huEK6yOOBTw4GWeHPD17HgAeEK++im
	QyG2k+Tp9umVhBB/gQYUDFjs12H0Bd0sXQxVmitw9tUbR05BgDHWCUlGZ8iDJkBRagLot0l5bVD+k
	tF++H5Ov/nfecU8FpvSHx6lcrOtulU2JmS0MKONHQ+xw/3+rxnvbXVjZnE0Um1kGGDv60AA8uKDei
	8NXGBGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ry-00000001M6s-1SdU;
	Thu, 05 Mar 2026 09:19:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4rw-00000001M4A-1XOT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:19:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so4628739f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772702382; x=1773307182; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6IXJ4+AIDPs0nIBd5//+WvmemCt3YPebZ7hJpPlxSc=;
        b=oexo8R6wdEkUhOiVpTEi3FmE/UY02s9vs84+CxSXyjWIV3ktxc8u8/g4bqLrIad6if
         OsIZrZIKcci9JzjSaq9+CAtk227qYKiPYQeSRSJkCfR6MkK+/EXcN6n5yLnuqP1zAFi3
         Wf9ajzSS9qbIuq4g5OD9QQJqal+3Adx0xSLkynVX9+HhllslWffCis9IIvtUdQunsp4t
         9MJIig5XIDFUX36vZPUbuiF88rKrAl0eZFr5r9U/f/BaeEQjOMcGL8jlAzXIL75nt9hF
         DhlLtbh4akcj8HHw2ywyEaGqa3YMPlJ1hoOFo7IbjbuZuXHgXTxKgKJpbrsvAZtEPf7I
         HQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702382; x=1773307182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6IXJ4+AIDPs0nIBd5//+WvmemCt3YPebZ7hJpPlxSc=;
        b=h4B72RutYySNtfDt6Fw1wj0S49vWVWdT69RyFSdr+DHG6GtiCv4qMtzTjsSBxOk81W
         ZFUL+f5lvWUS4HYOWMMZ3O8MM/B59efRbxfpbEnei857TpU55WCuG4otz5Y5f1dL3SW4
         hXCemq6vFrjDXgaxZjTDL3TFMserVnSouFXPJZqYUizTJ34XsQaQZ8b71wAZxTi9cKSh
         j10TfPmMqgRGoK1o4Ty61E7Z0tXgg+pj8siEhsjw4i6C2wvmR66Wv4MM4VfpVWeJMukD
         h1j5ErLXfrYeY+sqT5fNOAXAwy22dEJtTzrI7JLQn53BiED5hopiBqNKSsQedDHwYna5
         kKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFQncWOjGsq3wflGiNFpzI+ohxeiTkGZnWdtmxKJhY28Taj+m2I2QWX+sA9+EFXeMq3oazLQSsxIYDf4eCPaXy@lists.infradead.org
X-Gm-Message-State: AOJu0YwtoIp8LgABUcZ1YYxJIoLRYxqpqJx3/uGxB9/6OUIpY+JtsMqp
	FMiHbOH35vhUR/v3HLDwNJHkdMFva2ZN8VUve3NYT/Kbovg1O7TLIOvlOKlhzJHhymo=
X-Gm-Gg: ATEYQzwKvdkFiSrJLKOr6Y2oui/lYWImreeZgB0i8/ioKn+DLFEKN65lOaRkA3O5mKd
	q1+DBgJDr+eJ+5SITvLhuxP33ZMEf0sqTWIYPz0vh/IQqbrZlHeLMy2DWuKV4zkjH8GQzxawC9P
	mkOg2SzHnwktdsmW0mZeiBhaVnwNr39yvmgKhecKXlQs6vwKeq9vBVmEQ8LHxMaAej2FbBjenRk
	MZZ5lJH8vpwO9LSP3Upg78sJDwIZSXtwcGlj0efHn7p5Gz/P8QrEuCjMLMqz5TTGu1TyBKOVJ76
	ozjpXh4XPM04TPdAvodZ3eCw6kSqEcV5SbADr3L4CtgR2lHj7Zc+0xdkCSyTueJyu8mUz4zDaP0
	pxBLCjaYDoBvEAABW2N4UN8wmrFRemnXLgdjW3AzOxMPuKvY9asRF5XpZa5THkQH6fd4YQ9vLab
	XpuZOmnrjNk6m2WsmlTuPAiQ6ic/xq
X-Received: by 2002:a05:6000:22c9:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-439c7f99a31mr9373703f8f.10.1772702382012;
        Thu, 05 Mar 2026 01:19:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm25732463f8f.33.2026.03.05.01.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:19:41 -0800 (PST)
Date: Thu, 5 Mar 2026 12:19:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
	sumit.garg@oss.qualcomm.com, jens.wiklander@linaro.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: optee: Check return value of
 tee_shm_get_va()
Message-ID: <aalKqp_VPJjHxcQg@stanley.mountain>
References: <20260305071533.930896-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305071533.930896-1-nichen@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_011944_433962_6699C678 
X-CRM114-Status: GOOD (  10.61  )
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

On Thu, Mar 05, 2026 at 03:15:33PM +0800, Chen Ni wrote:
> The function tee_shm_get_va() can return an error pointer if the shared
> memory is not properly mapped or if the offset is invalid.

The memory is properly mapped though.  We just allocated it on the
previous line.  The offset is zero and the size is
SCMI_SHMEM_MAX_PAYLOAD_SIZE so that's fine too.

There is no need for an IS_ERR() check.

regards,
dan carpenter


