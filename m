Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED09C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xeg/JPm6n6HC2qxgyIIg/Hz6baV2O8fYoHgw0N8NS2Q=; b=I7waPmE5WQ6tnWXYedjVIX9IVT
	RJD4qSjL8bwgOuaPRKVr7pb25tAmf2U25cP/dv4gjZinDYWUyCKh/dnl/VaPamKG8URG0YkqCaUlf
	randaMQ2O6vSOwZtrsgJ8Ml0NYuag4slaEmhNfF+eanvvW32hqHlQrouLvMvUfEkpTywbyvZnuMA6
	h+WvRPW09yzWWUcF+6p7yKTiLish6IC/rUgOHNEBH9cn4KjusAYzHXguFrnkGhFP4+CU0KxPqZhRY
	HFiTyfG+D31jGvjzZ9gC+u6zCxdv8rMt5VgLuUL1ZCfsP2PrtK7UMUONBzIIFwSoUvYnUJWxKEpGQ
	VbLMfrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXlKp-0000000FFk6-2EqI;
	Fri, 04 Jul 2025 18:40:31 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXlGV-0000000FFM0-452n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 18:36:05 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-40a4de1753fso820976b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 11:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751654163; x=1752258963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xeg/JPm6n6HC2qxgyIIg/Hz6baV2O8fYoHgw0N8NS2Q=;
        b=PRZLrRwwSaM3zoMkZd6GZG3K4VukBsOwiTeffdJSag2EKCAj/V2csQYXL6T6ESN7/v
         MevDpgxVqsNLy+ValwFTjr3M5SbQXyVNvYBhDRVf90HnVwMenCLfwmoN8oU8GmkLF1yg
         hLi5FqgfJcmEKcDAszW4xq3koicM/j09djcNg8YbYCUfSx0Av2dVJns6ofC0l49VLwGE
         aCSe3C+ojtCgPIKBxS94MRrTIp//pheXDv2z4tNwqJVpl7/xwDb/QR7mSVQZ5vIl6ZQ7
         r28oan6yLC9P69A6E9t8nlN9fJ+FFoYrCrFiQXN0yk+iaL4WE3zOXQgu4VMnP39CLBFU
         NjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751654163; x=1752258963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xeg/JPm6n6HC2qxgyIIg/Hz6baV2O8fYoHgw0N8NS2Q=;
        b=mlwbF3jAFvIT3KBU8MyfKHaB7PeiaDJM4Keg0cS1NiiQuC2feKxtmwuOEKs3AsJuUT
         rK+IBibRjc3CQRwnGTeijtuY449e8fUxY9mRPpz68Vl8UoGCl/+PrGPUqyxciW3AAX2t
         AuraK33dEb4t2U+np7FqMy70ZpEy4rst5mse6DSvt3e+XxvDneQO4ulInfWMDmzygPjN
         hMuZPwE6d4WOwijb723vReZCKG8Y7Pg/ez7LcLCMUm4gDAwh74lNXSY5J89Mkr6qCCyw
         fs1zeWbr++Wv8JW4fq1piar2VgBqT3JEKC59PmX6XrcMKM3Gs+ahIoWzWOTVBt6ra687
         Y4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2WNo1w8SQw6DEGmBT5DEAjtplqaNSRpge0PqdHgWY43/BilfuVTMHI4mjlcw2JbFgSHWHCkmbsGEzxSXEdLYX@lists.infradead.org
X-Gm-Message-State: AOJu0YzU5Sm3IsGEhngAmcVQbhYbQhF1XyY/u3dwzOg1yKfNcZaYPOKb
	k6YFj9xy6D+IGN2apcRjJxdlX1VgjGhmi7w1nhj+RNMkYDJw6RFOz5aUnsZ6RbO4fpUiwLNB3eT
	gCCPm4v1QWdFUgypZqy6oKL7Cdf5ROy4=
X-Gm-Gg: ASbGncvmgGtj6tk71QmbpJzsH5cL0Qvn2zPnvYA5FVzDyKvJQOU7p0Nm6w5IAi8ZKQP
	BLTBNPzXPhkhFDtDBT5hPD1OgRDhTTEH2y7WkEE+bmluGksR8RIckyJJNkG9/6pahGnEkTOXQYp
	ojjfO6JYHRefCJo6vDHM15BlHjBult150LgZMn422GlEXU
X-Google-Smtp-Source: AGHT+IFbA6BEdKGEcMG1hPfdYdlou35N5PiGkJ6gDYA+8ptFPbpOHXlaxK1xR2BlaFABc43Ybr4ALWavsaG7bbVz6Nc=
X-Received: by 2002:a05:6808:1188:b0:40b:9527:8e9b with SMTP id
 5614622812f47-40d029f52d9mr3054856b6e.7.1751654162680; Fri, 04 Jul 2025
 11:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com> <64f39e94-7e88-49d0-8455-cd77d61d4fe2@app.fastmail.com>
In-Reply-To: <64f39e94-7e88-49d0-8455-cd77d61d4fe2@app.fastmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 4 Jul 2025 13:35:51 -0500
X-Gm-Features: Ac12FXyLydZrRTipZV1GpQ3LNzUnb0dIxPUYlGRWR5QEyZ7_13BUSLAzEe2C5Ro
Message-ID: <CABb+yY1pzut-A9Xf117AoGMze2OevWKYrH5NtWBGFBhAMZky+A@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Chen <peter.chen@cixtech.com>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, Marc Zyngier <maz@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Kajetan Puchalski <kajetan.puchalski@arm.com>, 
	Enric Balletbo <eballetb@redhat.com>, Guomin Chen <Guomin.Chen@cixtech.com>, 
	Gary Yang <gary.yang@cixtech.com>, Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_113604_011670_AD6CECC4 
X-CRM114-Status: GOOD (  17.24  )
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

On Fri, Jul 4, 2025 at 11:05=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Jun 9, 2025, at 05:16, Peter Chen wrote:
> > From: Guomin Chen <Guomin.Chen@cixtech.com>
> >
> > The CIX mailbox controller, used in the Cix SoCs, like sky1.
> > facilitates message transmission between multiple processors
> > within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> > and others.
> >
> > Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> > Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
>
> This is the only driver holding up the merge of the CIX
> platform, so I had a closer look myself.
>
Sorry I wasn't made aware of this. Also I normally let the drivers
roast until second half
hoping other platform folks find issues - I have reduced imposing my
opinions on platform
specific code because it is usually met with some sledge-hammer requirement=
.

>
> The one thing that stuck out to me is the design of
> having multiple types of mailbox in one driver, which
> feels out of scope for a simple mailbox.
>
Yes, if not all modes are used currently, maybe drop unused ones.

I will review the rest separately.

Thanks.

