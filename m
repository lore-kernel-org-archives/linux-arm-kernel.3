Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DE0E67807
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fS1npImPfHb20Sl7e7er9IvRC0E477hQsJ+7VA0CBuE=; b=qUGqGZmQ925uHbC7c3xeFsVDY6
	ftmFkTPXJlpBf8ZPCdgtDX/RsLVgeYdYDTDmjjFD0On34XNGRUcJl7XA/KIVEw8QS1/JmZIqyRNOw
	j5D6ByyxgzX0YdrLPBpCK6NAiC0Y7mH4aUxnNTpXqDzRNNKQchtIeIBAEASahMR7ItNwqJBnYPzjV
	15NoXAqKt6SoCMTg8oKqm868hudMGdI3bG4Uz2LHsRjxJFAzQCdJ1EmvsVa02zrS84lyyt91oW0ZT
	JRzzFLVLA0ruGFPR+L8B2iBcRl0tGMWm9FLeWCei+jY1ZgQjtXrt8lOclz1Lan9695Z5TXoed4b2H
	AyAosX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7UaL-0000000B41r-2bQL;
	Sun, 03 Nov 2024 06:59:41 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7UYf-0000000B3vU-45QY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 06:57:59 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5ebc1af8f10so1384962eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730617076; x=1731221876; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fS1npImPfHb20Sl7e7er9IvRC0E477hQsJ+7VA0CBuE=;
        b=MEwrjgSvsbh4CwUiwF/+5SKQr8KJAEEe9FsDd0vYLxygHxZ3FbVyBwso3gHLESe8A5
         gm4PuHiRO1/BE6gk0mJpK1C9oA++uU1CJdFvQSJx/niK2D+kee3KE5kuvgUVoJFD2HE0
         sslckawsvJqiIkQdIkqWTjeo3YPUOCpiGMFch1p7A0agpj/oioq8e6707vq93VMXuWSb
         ETI0uqpCosqFuI8AwxWmGpeDfnq9TOhwWOQcXPhmmOVFvWaRUeP6x3GJOtRkotlRVfYG
         UMz4ahAYgfkaLGKEL17+k+EaxWONWUVkcMPC5sPN9CNFSRUKW6fz6I63jQUdfu6jeEA+
         wp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730617076; x=1731221876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS1npImPfHb20Sl7e7er9IvRC0E477hQsJ+7VA0CBuE=;
        b=SPPAJQieJrIg4b7TFUdIw2ox+HEHGb8H9CVuNIP8FaD5LMj8c++2H2BqYr1eYvJoHy
         S8j4k4nDkqnpLz1V2HECaj9UD5XLBaqlQIOo00wveE9K9Gjqw30hiW3mYwBO2YTwCtHM
         BVxh8yOBsorivpuMP8DyXTG+PdsDxt8622KzutERntSlIlyFrdiCSJYWxS8wq+4it+Vw
         Pd0TUJWbnloTIK2QehAaqBSFSRhY/Onm4OTpRypIUk5wkoMnv3wZEusBDhuj4RL4qt4n
         UdpJGbOrCHm3VgEiM6lmHcq3yWJ8LBnZ5dWHinFso1nfUDRBKH5XZ1y8mZph4KnkKsla
         paUw==
X-Forwarded-Encrypted: i=1; AJvYcCXfSu1MwgT8n/2eCSxv0k7uySq9YDf6RDJ8nSFlnqAoj2scfYCaOgCuiaFbA6oV4wAK5DcKJWbihTGqyqCsWFNK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg3IQOFCjNRUxEz5SpeAc/+AzVtx9ZK+RY11nc3tmN2LVCtFaz
	UaNmzAEhnf4RxLcYaF+CZZFlUvvlEFElTWdbAHEyJbVTrrfqpgoJ5I4vRRnHSZPFeRg/nwqrLQC
	IeOMgm3GYl8bgUpFxSnfo370kwUZzEi4IshWLWw==
X-Google-Smtp-Source: AGHT+IE+q1rK+3oCKtp9SkJcnFzCrL9vfkFECGy5BIRlaiafb9OMt6z17EkSsb1RPUubkyZ3F6wWlfWwl558mwfUioY=
X-Received: by 2002:a05:6871:c707:b0:28f:329e:9f23 with SMTP id
 586e51a60fabf-2949f07cb9emr7517716fac.42.1730617075872; Sat, 02 Nov 2024
 23:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241031150033.3440894-1-peter.griffin@linaro.org> <yq1wmhl6rp8.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1wmhl6rp8.fsf@ca-mkp.ca.oracle.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Nov 2024 06:57:45 +0000
Message-ID: <CADrjBPp9-ucYgztdRNP81FfY0h+1s7N=LEPS2Ny=D2Vh2HsWYw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] UFS cleanups and enhancements to ufs-exynos for gs101
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org, 
	tudor.ambarus@linaro.org, ebiggers@kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_235758_072652_83E0C814 
X-CRM114-Status: GOOD (  11.00  )
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

Hi Martin,

On Sun, 3 Nov 2024 at 01:36, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> Peter,
>
> > This series provides a few cleanups, bug fixes and feature
> > enhancements for the ufs-exynos driver, particularly for gs101 SoC.
>
> Patches 1 and 2 were missing your SoB tags. I took the liberty of adding
> these instead of having you resubmit. Please acknowledge that these two
> patches should have your SoB.

Yes those 2 patches should have my SoB, that was an oversight on my
part.  Thanks for fixing it :)

Peter

