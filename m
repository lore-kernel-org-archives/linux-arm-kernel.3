Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A67C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpdZS1uISB9PX6+/mFmvoGcmNoH+HAc5IkpoWEU15/c=; b=qiWalPp8o6YgTKhon6JZKi9QdL
	CEkrguEWgHJgz2aXvjqOCG2bU4TDyQhMaDckfkRq2li+EFTwxtPJqODjXeiQAF0GeDZkhPLU5USxq
	6NHHQjpu04ezsr4oy4TuZQvpixwvNIqPWn6jPnrP151pHMgHgCIPlYUWuPcHOQyqPY3vl8ru6GwTZ
	ahx4+JbdEyG0M+8/hwgx+gWlOcCg5kCXO8KKBqZy1sEP3BtMaRalNsSJp9KgekcFVs4ZvFGQ0/R2L
	xtoZ5vO/8MS4ahSKR7/RGLVzyBLMJLirj4Zj53KAeQkUL4hMjQUgeMX3PdaadUVhYaTipqfeMzJHH
	WJYaoCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6X-00000004ZMF-3iyw;
	Tue, 04 Mar 2025 12:10:33 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQmL-00000004SgQ-2sia
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:49:42 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7272f3477e9so1762853a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 03:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741088980; x=1741693780; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MpdZS1uISB9PX6+/mFmvoGcmNoH+HAc5IkpoWEU15/c=;
        b=nJpr6005xUHZp5GvbuzpqCvy/txfLyTAxmRhTxHXMrzknddCEJhm2LOkP8U5LivTNW
         ft3liUU2KoO+UG0u+FWX0dHG6NOyPeD9EI5fGkgDk0j+alGUKvpHMtGGSPHPfoyceG9U
         tu8+izmuqmkRk4WoGwaN73wJXNR89aKOCWDVEaXAzM5aCp4NYaLAYUGywhn1Oba4TPAO
         gWRaB5LknDo1J0HJUq9xlT7ksyhAI0EEfOMrxo0lCbmVgZzv4hrRrJFmrFXOl6HTj4Zh
         ZGgEM5FVVNu01dEbSOJGZ5VjDxJm9ZoSFMcjfZufolcWmKiMk3BD6n6NLEAnHHn39NXm
         ymjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088980; x=1741693780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpdZS1uISB9PX6+/mFmvoGcmNoH+HAc5IkpoWEU15/c=;
        b=FrLJIh8ReFD5HJPRKzISo4pHLrc62dl1ATO3+xjYlBVIJXmLrHeQ6PlH/X4XlH9FF6
         QCDLhLVwTg7bZpYzEMuJ64jiVRKPO2zwqc2vKm9Hg58LZ0uZQ/08+XZ9xvHm0FuHAFy8
         W3quQ4bfIKPD+V+vKpKk2p+GJRY1uGZ4Ff6XEl6K5m9vqiEMAGXWSDE9AtjI+1rnlfNO
         T2Q7yy3ryu1T/dZynmTdcEdZKLXE32Az64KLGmoi7kBPZkODHSvRo92qP4YOaYKb4zck
         4b+Hj29vQTQ2KOtDmycljS0Eb0a3G229NdJp3rGIFFQLGdmtaYhHWO+fySwctRvIYptd
         sjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg/kuicuVpANV4k4GGsj0L4nNtU8Niy/zVWxgXmBl3bWdEVw34cckqqWGU/Sn25uZLweh9GMbBDYnaXWJCwmJu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/+/UbvBnwkdwuPOAERcjZlx08zoW8u3NQMEtvNfbvrMFJEf6c
	zyCT4hx+i2EDUCmwxIRic+WqUOf1pHaj9HDzSsOH9Y9NS+UmS7I7TLrkat33ikQnh7gdHa3DQUB
	umxRCIVmNX00J0ytPDnRv7MliRtBssFWJxo74VQ==
X-Gm-Gg: ASbGncscTsTEJXc8P3nrlE+tIPBRi8m9Ztql3DAaKxEKthSJJyg1geXk51RdYLNKMCv
	tBm1fa9Ikl1K/fcJa2xfYBitXvGF1asdQ6rZsQajQ8j8YLEIWDnU7z6ReUhOr2rv+eEC7WYyJnP
	KK2nsE+S39Hjn++ljonNT6GyOpaAU=
X-Google-Smtp-Source: AGHT+IEGafDyYI67R/1eqCjcojvEh6ldPVuHGNWY3NXJkAyzvOXEUtHCKhyAhFW7/MlCSqajkBLOaAJFFsTna+x/OIg=
X-Received: by 2002:a05:6830:6995:b0:72a:ceb:d511 with SMTP id
 46e09a7af769-72a0cebdcc7mr3644538a34.11.1741088980595; Tue, 04 Mar 2025
 03:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-5-peter.griffin@linaro.org> <bb595629-f975-4417-af28-8f4924a5ca5c@acm.org>
In-Reply-To: <bb595629-f975-4417-af28-8f4924a5ca5c@acm.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Mar 2025 11:49:29 +0000
X-Gm-Features: AQ5f1JrFaXvZ7X3TIFZCXeV9ZW9xw5dAWQ1CR6t-L_n-p6-nOP1fD87q5_gFbhs
Message-ID: <CADrjBPrpXH1E2Wt34KXgfdOTNE1v7JCwU3AN7dqoAPYS7j=8YQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
To: Bart Van Assche <bvanassche@acm.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, krzk@kernel.org, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, ebiggers@kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_034941_731321_4A4906A4 
X-CRM114-Status: GOOD (  10.98  )
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

Hi Bart,

Thanks for the review feedback.

On Fri, 28 Feb 2025 at 19:18, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/26/25 2:04 PM, Peter Griffin wrote:
> > -     hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_TXPRDT_ENTRY_SIZE);
> > +
> > +     if (hba->caps & UFSHCD_CAP_CRYPTO)
> > +             val |= PRDT_PREFECT_EN;
>
> In a future patch series, please consider renaming PRDT_PREFECT_EN into
> PRDT_PREFECTH_EN.

I was just checking the datasheet naming (it is listed as
PRDT_PREFETCH_ENABLE). As well as the typo in my patch I think your
reply also has a typo :) I'm assuming you would like it renamed to
PRDT_PREFETCH_EN?

Thanks,

Peter

