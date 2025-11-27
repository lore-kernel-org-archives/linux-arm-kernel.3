Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FCFD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EI6kgvL/X2FwMq5df3gm5aCyq4yZ+zKdpH3vVyaOUw=; b=ZQ6dl7wXQhTRcCdQt3lyRWBXXS
	hJbUO33n4Wi6+SFp2+uCOW7LLDnZwfBpoif7Z2ufpBjyS3NYKqQyCjBSrNcBB6Pc8okhBESiCjXA/
	5WS6DZ/W/8a0yoNC23YD4ZXxgsRsIzbt01ahQ9nvEZ4uI0JFzeTuVlNTrkEyt4vTtOK6Nv93SNGB0
	6L15dBXqt9CsuqdnabQvhG8fGFielnw/FpEwOdMnIFqB8s1wQs4abLDxN4LFGDJUAEUDvK6FtE674
	b243WjybAohzhPYqfeiW5Kf5P4ed7clfaLonmwI2gm7y4P3VSphs3tNTwklXZ4RqlV/gfra7RGQNZ
	FQsZWgsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOd1S-0000000GmeN-4Att;
	Thu, 27 Nov 2025 14:31:03 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOd1Q-0000000GmdZ-26nJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:31:01 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8a3eac7ca30so55798485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764253859; x=1764858659; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/EI6kgvL/X2FwMq5df3gm5aCyq4yZ+zKdpH3vVyaOUw=;
        b=bnp1DBWkowdPtZgJKw87Oeq4SEWST/XVLNoEV2EKNGOx/nXXwdmP8qV/LNS0ANphPU
         Scsxy6l/PoLdlASBok9laGbWA/qVmn53Rl6IM48w7tAI6rEtgThgc2eojrLLfbSKugBC
         XE+kWXXMWXyxlgQkN3FKOJRv9ZwHVzNcf+2mh7a+yq3Hr6BejBaoukF0TEJaR1JgYkWY
         WQqIbsecOagL2cM2LQ7PdKFomBbn3FXYP7Cdz+5SNQY4QPkT6EoA1HRJVJtDRAAhKDs0
         6ssZb2NFuXCdzUyUvyDVSQsJnLS8rygZAh97z1xMYLnKMtRIkhiHKDQciK4ik7naAMD/
         IKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764253859; x=1764858659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EI6kgvL/X2FwMq5df3gm5aCyq4yZ+zKdpH3vVyaOUw=;
        b=pHh6Pb4aZF8prB9DoOSLfBnw0Hjv6zJN5nMYV/dAr0OMxIoRYIuZE+o4nKlh7r+Td6
         HllIuoDWKz9/Qqfe34No1xonMrFo94VpXr+IGWXH573FYnDmqiXT7kQphAaDVQKn9avh
         QWSww7xIDNhpVHFwLHgkXZoDLGigcyn64cqPJoKjvF8mILHW/iRtiHkR2LjlzXLgu8eL
         m4bzOaev4C5w7if6OPgJlzDrCun4V2gNIin34PSV9MCytQ7QFRbHW5Cya1ATgTKkYipo
         ECF+rFHIDtdjb2cJGeqF7t58clYfPUB7LUvINaiGzTSZYx8u0SPQQnRNMqfsYcZFBluc
         WJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXMgU0atDV5yL8zWIng3CF2MrqhDpGv05lmKZ0OOz2aWQEDJB+a2zf2RAKMhKz+fw4SUVK2mcbIIhkaPfKUs0TS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1CV/j84nKtT7yy0WLneHuyueOkmYk5vZgduL5/jwsL5lNJZ0x
	0C0VwyeNZifXG7fYm85G8iB0ShoSH0WraZJN2Gwi3czh40PSXgQ019sMEcvddeA95e+LhhybELF
	BEbsG0YnI9BbVQfoya2hlwqJN4Cz48K8ZScUnq8R8jw==
X-Gm-Gg: ASbGncuCMhcJmhLM8EVkBjRSwc3tKhsmAP2n/IINaci+Ek3JfpV9MO0GYlhqRiOV9cn
	RATsrDbujP8zuU+7LKR01JDKyR5YJIk2owJ3p5CdErUa9z1UjUybfKl13G1OQuk4/uFEPKsKR8G
	5wLQ764Ua6SeBlb1cHzBy1JIY5H79i68Qg7VoBYNw7PafIt/dMyVCNoeSMgsq8PzFo7ArSEYhGF
	pReady1PBmC0VAC+vM+WLkhZ9L23/8LjH1oE+ndvJVsZf2RGZHX+KsjBO8YX3yPBxaWxIsEnknn
	tOHnMNXUHQgHxHUSEN28aeTbBGIS
X-Google-Smtp-Source: AGHT+IGIzNSYZO57m/mmGew+huIHcPsfN7SZ4IBsxq1B3WQsEAznzwipVs8lG/T55jia4L93ypHORv8wCyjNc3IxwYk=
X-Received: by 2002:a05:620a:1990:b0:892:ce2b:f869 with SMTP id
 af79cd13be357-8b4ebc446acmr1322259185a.13.1764253858444; Thu, 27 Nov 2025
 06:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org> <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org> <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
 <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org> <aSgPhd4u3Oqi3Ymy@google.com>
 <20251127092231.GN724103@e132581.arm.com> <bed84247-c3c0-47b8-a491-9af9e51ca5a7@linaro.org>
In-Reply-To: <bed84247-c3c0-47b8-a491-9af9e51ca5a7@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 27 Nov 2025 14:30:47 +0000
X-Gm-Features: AWmQ_bmj8SwFDT4tQzIHgvsq0QFS8SCHH7hwYZpzFI5n1ApZVD_w2HPWV8O6aNA
Message-ID: <CAJ9a7VgTZqQHUAPPhyuECT+54MRUH-OLs1XdBS=-Jx5oVfoZQw@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com, 
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org, 
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org, 
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com, 
	milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_063100_571249_53CCF60F 
X-CRM114-Status: GOOD (  36.30  )
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

Slight simplification...

On Thu, 27 Nov 2025 at 09:30, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 27/11/2025 9:22 am, Leo Yan wrote:
> > On Thu, Nov 27, 2025 at 04:44:53PM +0800, Kuan-Wei Chiu wrote:
> >
> > [...]
> >
> >> I don't feel it is my place to say whether the etm3x driver should be
> >> removed entirely.
> >
> > Sorry for confusion.  Your fix patch is welcome, this is useful no
> > matter if remove the ETMv3 driver or not.
> >
> >> However, if we decide to keep it, I agree that aligning cntr_val_show
> >> with the cntr_val_store behavior (using cntr_idx) makes more sense.
> >>
> >> Here is my plan for v2:
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> >> index 762109307b86..77578885e8f3 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> >> @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
> >>   static ssize_t cntr_val_show(struct device *dev,
> >>                           struct device_attribute *attr, char *buf)
> >>   {
> >> -    int i, ret = 0;
> >>      u32 val;
> >>      struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> >>      struct etm_config *config = &drvdata->config;
> >>
> >>      if (!coresight_get_mode(drvdata->csdev)) {
> >>              spin_lock(&drvdata->spinlock);
> >> -            for (i = 0; i < drvdata->nr_cntr; i++)
> >> -                    ret += sprintf(buf, "counter %d: %x\n",
> >> -                                   i, config->cntr_val[i]);
> >> +            val = config->cntr_val[config->cntr_idx];
> >>              spin_unlock(&drvdata->spinlock);
> >> -            return ret;
> >> -    }
> >> -
> >> -    for (i = 0; i < drvdata->nr_cntr; i++) {
> >> -            val = etm_readl(drvdata, ETMCNTVRn(i));
> >> -            ret += sprintf(buf, "counter %d: %x\n", i, val);
> >> +            return sprintf(buf, "%x\n", val);
remove this return...
> >>      }
> >>
> >> -    return ret;

else here to set val.

> >> +    val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
> >
> > It is not right to read register at here (it cannot promise to read the
> > CPU (cp14) register on the target CPU).
> >
> > Please refer to the same function in coresight-etm4x-sysfs.c. I think
> > we can do the same thing at here.
> >
>
> That's a different fix than the display bug though. This change doesn't
> change that if it's already wrong. The display fix should go in alone
> and then if there is an issue with not running things on the right CPU
> that should go in separately.
>
> >> +    return sprintf(buf, "%x\n", val);

just this return point - but emit_sysfs is now the standard way to do
this, since we are making a change.

Mike

> >>   }
> >>
> >>   static ssize_t cntr_val_store(struct device *dev,
> >>
> >>
> >> Given the upcoming merge window, I plan to submit this v2 after -rc1
> >> is released.
> >>
> >> Alternatively, if the consensus is to drop the driver, I am happy to
> >> submit a patch for that instead.
> >
> > Please continue this patch.  Thanks a lot!
> >
> > Leo
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

