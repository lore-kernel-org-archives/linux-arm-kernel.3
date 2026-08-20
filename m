Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9873C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBG80TE8O7koV0M/Wd/+svOF4P4mOtCGkWlnllaV+RA=; b=hga98zDyxJEHWw6ZFWG508P1DF
	C/yU7YipdVIoBpSK7maSd2JL6wHJHr3fLHKeTJcb2NR8EudMHuoP5El6zGhaiAkC1UaI+gDvhPOQn
	TWCFMoJHodmYQLKYeAPm2N1Kg8o6qQpPTvia+dT/i84XPGdcYNaLcirwOQ352s+YXcTB36gX4H1i6
	IQ+SkjQGkrlEeezjRNvGcCm1/g0clbK6GtVJUmlovgN5BiRkM4mWyCkZcmtIdPBOpUwzTSIVZVHLO
	HYB0gA4esWnHUNAiWa/9jjT4DI4bse+K0EYPjrxmDw+KWnTGQ/4TXylLsCa9YBoizhpB7sL9mNaX/
	f3CfPlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0OL-0000000BNzr-1RuY;
	Thu, 20 Aug 2026 10:53:01 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0OI-0000000BNzK-1ZpN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:52:59 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c15ceb17a28so159528166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 03:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787223176; x=1787827976; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBG80TE8O7koV0M/Wd/+svOF4P4mOtCGkWlnllaV+RA=;
        b=KapBrQo4fAo/Dkq9cjW3xxjxqSfs0mYr/b5QPMvgRBNbkR/kz8vYgur9hsXOxDWfh/
         1JTM/744IlYzascB3gUnXQooJXg0lfatg5oQNlABF2FPEJTpN3kTsg6GWbAey46JQsJ9
         aMbwWgZp1dmxqwGjDtCoxKZEYxam2uzbHfh2HYEG2LapHUHBJD6L42ZujUE8lQ1p80i3
         CztnfugCelrrZEvZ2qfIX1rg6UWbajoohX2ncEv6LmeUZmPDePfPQFv3AxR/o0dN0D+X
         QYbIIcLLzvzN05f+09QgxqhKaENUtAUWfg3LSKiKwVN3W/kObvq+pp3UzdzW7o514qgW
         JHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223176; x=1787827976;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBG80TE8O7koV0M/Wd/+svOF4P4mOtCGkWlnllaV+RA=;
        b=muArs3wUz2qKzkbsZyEk9OnUm02oh7HnWGGXBKT4/VKc/zuvy5OxNRPbd0GV1Kiyo/
         r69dTiqvFcuM593arzXmnSpQ6fFRbQCZ7ZQuF99F8eGBoTrDIC6DFZftoNmIFvDDEacj
         Dr5eufY4HI6UNvlR5dQnRIrEOUPvSDmVyx3OfRODfdtc6iRLZ0AxH0PctXkiyE2J5jmR
         OG6fQ0h6hr+dRxh+tluK/nzVMKJk6A/rhGCcDYg/5ttbytxLolLsHhSWNk1XluVMIWiy
         h4kLVp3AeXgYIL8jDvnI/9jP815BdSnP+tUI1cmFjba09SpTBGrWSKybtx5oeQyqoMEt
         UOaw==
X-Forwarded-Encrypted: i=1; AHgh+RrZXfLu2uZR1ar54Yl4DpJe5gkHHSvBH5APV/+ngnuAkjo+wg1OmSh29jMGi7i+q4GQx06oTZFkiMrN/ayI23LZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxNbuuMpccPv2eBSI1yvMTiiMXOt/WILnwVtXEqLTILZnFR7spy
	e+S/q7P50BJs+OaFkyI/bnYVm3Y8+teb0xb11L9DxqrZz7cVeC3RKx05TyPMRqPPZxAvVBaTLxm
	t/GeS5kfPcV65cyz3cg==
X-Received: from ejel3.prod.google.com ([2002:a17:906:2a83:b0:c16:11e4:9d9])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:928c:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c23f92c3376mr791823566b.6.1787223175489;
 Thu, 20 Aug 2026 03:52:55 -0700 (PDT)
Date: Thu, 20 Aug 2026 10:52:46 +0000
In-Reply-To: <20260814220652.GA101268@bhelgaas>
Mime-Version: 1.0
References: <20260814220652.GA101268@bhelgaas> :q
Message-ID: <9huzik55kqrl.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v3 2/3] firmware/edd: use kobject_put() on
 edd_device_register() failure
From: tarunsahu@google.com
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: dmatlack@google.com, Nicholas Piggin <npiggin@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sourabhjain@linux.ibm.com, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Russell King <linux@armlinux.org.uk>, radheys@amd.com, skhawaja@google.com, 
	djeffery@redhat.com, Geoff Levand <geoff@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-arm-kernel@lists.infradead.org, souravsgl@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035258_456627_12398C2B 
X-CRM114-Status: GOOD (  23.99  )
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

Hi,

Bjorn Helgaas <helgaas@kernel.org> writes:

> On Fri, Aug 14, 2026 at 09:00:56PM +0000, Tarun Sahu wrote:
>> As per koject_init_and_add() function kernel document, even if this
>> function returns error kobject_put must be used instead of kfree.
>
> Thanks for adding this specific pointer.  I wouldn't repost just for
> these nits, and wait at least a few days before reposting for any
> reason.  But if you do repost:
>
> s/koject_init_and_add/kobject_init_and_add/
>
> Might also add "()" after function names consistently (kobject_put and
> kfree above, edd_release below).  Also applies to the other patches.
>
> The current subject lines basically restate the C code; you might
> consider more of a focus on the problem.  I ran this through gemini
> and I think it did a decent job:
>
>   firmware: edd: Fix kobject reference leak on registration failure
>
>   Per kobject_init_and_add() kernel-doc, calling kfree() directly on
>   error bypasses reference counting and skips the kobject's release
>   callback, leaking the reference.
>
>   Use kobject_put() instead of kfree() on registration failure to fix
>   this.

Thanks Bjron for reviewing. I will take care of them.

~Tarun
>
>> When edd_device_register() fails after initializing the kobject with
>> kobject_init_and_add(), calling kfree(edev) directly bypasses the
>> kobject release callback (edd_release) and leaks the allocated kobject
>> resources.
>> 
>> Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
>> registration failure.
>> 
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>  drivers/firmware/edd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
>> index f980c5b56858..763e7b16d517 100644
>> --- a/drivers/firmware/edd.c
>> +++ b/drivers/firmware/edd.c
>> @@ -748,7 +748,7 @@ edd_init(void)
>>  
>>  		rc = edd_device_register(edev, i);
>>  		if (rc) {
>> -			kfree(edev);
>> +			kobject_put(&edev->kobj);
>>  			goto out;
>>  		}
>>  		edd_devices[i] = edev;
>> -- 
>> 2.55.0.691.gc56d675ccc-goog
>> 

