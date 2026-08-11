Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A77C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGMemQkEC5pRlM4gYZJhKb5X+L3Mgf2+8jXep9XZ59M=; b=E5wHj+WIr0aQhCBSXCw2c68scr
	8eJxAwPfSL/q6GqlNrlznr1GS2agNTve5sk5oUZPB9MheMx5d6yR+bz7tXVULzUJxPZjbYdbdLCGp
	eS3fyY9lLikfgRqkHO9q1jyLatIOkpDCTXPizpxekRnHcysvlpPHWk4RGl/hWZMv0LEiHGzz2U0yJ
	ShhhyHplj6M9PwIgPpGdpzqUcKghLpjJyeylhCvwXu8V0f0evCLIMwRTU/rfBoD6U9QRJ6riPwUgk
	GbMG3T5kBYy+/LdCEY6yf3BTXllrASfqtgp3LepIE8TH+pe4UHZtF8sG4Gg/VbZCSMhppk1+ZpAA2
	i9A1/Sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjth-0000000DrpL-0Cpg;
	Tue, 11 Aug 2026 10:39:53 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjte-0000000Drot-45sp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:39:52 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6a18e266026so2776716a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786444788; x=1787049588; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGMemQkEC5pRlM4gYZJhKb5X+L3Mgf2+8jXep9XZ59M=;
        b=d/m9cMQPDjDBmC33tZv/XDIruZJp7NPK4KFboR75ENdYKl4FlSn/CmM7rYDhF4pz42
         L9boy01RMymooCG3xek0tr8n/XqzVnu/3HfC0AsRHx2QT79mYng4vLs+Asl67/hJOQoR
         1h4nm+0pLTI/YiqK7MZap3r2z69gXUxJOmauWhFEKWqgk/A0jat0iswsXAKHKfkOLwvG
         8/rqxFPl3hakLFgsXG6FU6SpohjZEMWnBJ+afRrMkh3c8CgkQzH/avN6FD29wZ1UwH9W
         Nc950WlWRxx0HKt5qJle7h8NZJ2lJAJs9/Ch52+fst9K2ofavh8cEEJ9C0nhgkyOk47c
         UwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444788; x=1787049588;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGMemQkEC5pRlM4gYZJhKb5X+L3Mgf2+8jXep9XZ59M=;
        b=fPU/dlkZU1iFYObrmfklv4K7rK7lM7d7V/q6Vzu6zxmnj8FZGREfRCzYoxRfs9IVq7
         JODwXxBl1D6SVV60ybPTRkK0TG8NFjpGngIPbZGnMx8UE46MGGkQMYwYwZI11JSH4czo
         humbZcQsQc/bBuPk0aWa3sflF2qllph1lkR+7sVICzBnMwHOFxZB9JkvjSjrzLKO5aj2
         +0C1xKmYUa6jh33SCdQkdCI3COv4Nv7s5Kj2HW0LwWGOL8nP3udoZDN75NGkGY0eYDlW
         MKYhza1uf5FJo5KuCTeIY3FxavTllzasmxsXSSKVnpl6PSDRdixj1eQVciBMqkRCTRY+
         NH/A==
X-Forwarded-Encrypted: i=1; AHgh+Rq4+5A4RQBsxTY4zAOhRQQJHNPYOkQriNg6evmyusBDJTnBdq5gamDN3/kGWc+46mURG7D2Q5zOFSQE51CzsLTG@lists.infradead.org
X-Gm-Message-State: AOJu0YyCrfMQhKJdPA+yvUTUJTfh7BrpL7gu2U79DKfm6cK9C9JxWt12
	QO9n5HuvCmrniyEnS3unqii/MLlAiyw2p5QhhR9R+YauWCgDpZy6FJNX20F+l6neH0xuB92nvgn
	3zGagfggz3YloHbrqvg==
X-Received: from edbdm24.prod.google.com ([2002:a05:6402:22d8:b0:6a3:6510:8ace])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2417:b0:6a1:ffc4:e4b9 with SMTP id 4fb4d7f45d1cf-6a3644aeb16mr1321144a12.9.1786444787939;
 Tue, 11 Aug 2026 03:39:47 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:39:47 +0000
In-Reply-To: <9e189214-1274-491b-97dc-1b943c6c5cea@amd.com>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
 <20260810162814.1398016-4-tarunsahu@google.com> <9e189214-1274-491b-97dc-1b943c6c5cea@amd.com>
Message-ID: <9huzbjb9hrf0.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 3/4] EDAC/versalnet: use put_device() on device_register() failure
From: tarunsahu@google.com
To: "Pandey, Radhey Shyam" <radheys@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geoff Levand <geoff@infradead.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, 
	Borislav Petkov <bp@alien8.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_033951_029466_D3A7F265 
X-CRM114-Status: GOOD (  16.88  )
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

"Pandey, Radhey Shyam" <radheys@amd.com> writes:

> On 8/10/2026 9:58 PM, Tarun Sahu wrote:
>> When device_register() fails, calling kfree(dev) directly bypasses the
>> device_release() callback (versal_edac_release) and leaks the allocated
>> driver core structures.
>> 
>> Fix this by calling put_device(dev) when device_register() returns an
>> error, ensuring proper refcount decrement and release cleanup.
>> 
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> Thanks for the patch. FYI, this issue is already being addressed in an
> ongoing series.
> https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/
>

That is good. Should it go as saperate patch or it fits very well with
the above series. I will drop it incase of later. WDYT?

~Tarun

> -Radhey
>
>> ---
>>   drivers/edac/versalnet_edac.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
>> index 97ec05d68bbb..2912b3658915 100644
>> --- a/drivers/edac/versalnet_edac.c
>> +++ b/drivers/edac/versalnet_edac.c
>> @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>>   	dev->release = versal_edac_release;
>>   
>>   	rc = device_register(dev);
>> -	if (rc)
>> +	if (rc) {
>> +		put_device(dev);
>>   		goto err_mc_free;
>> +	}
>>   
>>   	mci->pdev = dev;
>>   	mc_init(mci, dev);
>> @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>>   	device_unregister(mci->pdev);
>>   err_mc_free:
>>   	edac_mc_free(mci);
>> +	return rc;
>>   err_dev_free:
>>   	kfree(dev);
>> -
>>   	return rc;
>>   }
>>   

