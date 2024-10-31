Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EF4D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNw99ZBoCtL9gebq7HnHLHFtZ02VTCgq3uG6OiI7Lpw=; b=3tdwtru1G0Hx6Bj7eEJ6u/O+x+
	Usto7VYAds2W0UdrKjW/eUMprNXFM/E3CYCdCXtj13XYIhqWauLP4rVA9qvgCYwyunHnqI+uPbAgN
	nccL3Zpvlep17u5JbD0inSi4sF+P8bZfSJ+j92GUuz6VuLn87t/MpTKpF+FRy3EG7Nl4Z1K1pwhWP
	VaW9ZI7SkfY2Vbi7JOWJwidCDHrTrn4hDXCceyTYbtUI0BDj5lC+8f7sTEsFnbJoCOchwtAKlDn1O
	/cK1Zj52Aq7WfAmLzKHRiogWZYiFCDpwr7fYm4PMC5OuCAZYSkA0HQUK/S6TCEh1OQpQSObih5BRZ
	NvDzBS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UQJ-00000003Xx1-3sKn;
	Thu, 31 Oct 2024 12:37:12 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UOW-00000003XXe-2FFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:35:22 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-71811c7eb8dso503872a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730378119; x=1730982919; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HNw99ZBoCtL9gebq7HnHLHFtZ02VTCgq3uG6OiI7Lpw=;
        b=mHlA4uhZ/r0XkV+5pT87SboZm8ogjOUROvWk/Bn43H+LEYpeclBi22v+lrzI56hs3G
         /lOSzrclgJAspFMHYwMOMxG8rVP8L/qDWzB2n7kMW7pNwTm50nKkx55cyrm/0hxnHxMW
         HrV0ytpDiMHVYdv0P68VD7DHwDX9x4A7QXQrcjDofAwqkUtSOn1B3lAIusD2V1EbfJ/O
         ouaZSRdLBSoFvrJdezE96YId/bNmmO9GVP4mpPgB1zakikaGceAAA1bfJozgwM2kNQv4
         hU5SHS2dVCoVwvnZPB8mscAa8lBHa1Y7vV3KFaH9N6mtSM5lwDXvzVZ7cvlvwpe0y9KL
         +Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378119; x=1730982919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNw99ZBoCtL9gebq7HnHLHFtZ02VTCgq3uG6OiI7Lpw=;
        b=ZFWihu5CO3YrRTAL3a+1xF/9SjQ+tnwu0PHn3JzDvF48rslNoPJxTzfU2KdqeW/9Tc
         Ncjdn0FC+6s9+4DTSEXdGW889xHlktSt1UQZSKh7pUHiUCQo+2S5MYfPlBlGAeUQ0dTi
         GrtDnznZTBckyt8MvaP9+fTJAY42VvwO22HxRoEPRU3uBB8AwJUeERwQTwRT45zXPx9K
         MMGAn6ls39dZMWff13dMMORHnTTl20A4DHsG9s/rA2649GGGNvWIJsnYQ4tegn+mmW78
         FGJTfE2a9ocoaAdGwYgmqJX5vFhXh1PTFk/VKGEzZ+rMoQ/vpd2n1/YHk+KXJVGqp9d6
         Z/ag==
X-Forwarded-Encrypted: i=1; AJvYcCVEe+3lXi2LU7QFyIX3MfYk+VFowvgvRT+Cb3Iq36hjQLP8EMF9+7bfn4Vz73rOeuWbyD0bUpbtUx99v8NSbxpz@lists.infradead.org
X-Gm-Message-State: AOJu0YxeR/RbnngetvIqV1o2rDb6/VY7feRXU9gEkLp80uaCzDWv5GHp
	b2DQWWzVUWZvtzSb3Pu8hDqHIh+HsQ5GcC7mcrJrxaL14vik/T2x8gln5n3ezIBgf+ZpaU14Na2
	jTDNP4i4kKFYbpmwg5k6rZ6KnicDgmInu9T6yvA==
X-Google-Smtp-Source: AGHT+IEkKbJXyNqLSsuHdItgZxyQY+mBzja5TSh+tq+4mVxz/XjBn5K2/1nC62dW10Qg5qYRGU0KEBvvMHxYsE/WEXU=
X-Received: by 2002:a05:6830:2b07:b0:718:9989:efac with SMTP id
 46e09a7af769-7189989f002mr3434433a34.18.1730378119050; Thu, 31 Oct 2024
 05:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-11-peter.griffin@linaro.org> <b5dcd5df-7215-4679-a6be-c45d525e8051@linaro.org>
In-Reply-To: <b5dcd5df-7215-4679-a6be-c45d525e8051@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 31 Oct 2024 12:35:08 +0000
Message-ID: <CADrjBPoRTidJbUmC-gMDaEJRkF8iPUiGHWE89WJ2=+Ja5s1mRA@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] scsi: ufs: exynos: fix hibern8 notify callbacks
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org, 
	krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053520_606555_9C713F60 
X-CRM114-Status: GOOD (  16.60  )
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

Hi Tudor,

On Wed, 30 Oct 2024 at 12:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 10/25/24 2:14 PM, Peter Griffin wrote:
> > v1 of the patch which introduced the ufshcd_vops_hibern8_notify() callback
> > used a bool instead of an enum. In v2 this was updated to an enum based on
> > the review feedback in [1].
> >
> > ufs-exynos hibernate calls have always been broken upstream as it follows
> > the v1 bool implementation.
> >
> > [1] https://patchwork.kernel.org/project/linux-scsi/patch/001f01d23994$719997c0$54ccc740$@samsung.com/
>
> you can use the Link tag, Link: blabla [1]

Will fix in v3

>
> A Fixes tag and maybe Cc to stable? Or maybe you chose to not backport
> it intentionally, in which case you have to add:
> Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

I'll add a cc stable tag, as there is no reason not to backport this fix.

>
> In order to avoid scripts queuing your patch. It contains "fix" in the
> subject, there's a high probability to be queued to stable.
>
> With these addressed:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks for the reviews!

Peter.

