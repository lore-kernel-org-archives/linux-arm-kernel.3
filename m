Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FA4C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roa5rJRAYtI/tn+NF3Leyf70YfVlfQw4OIxeKs7HAhA=; b=oyRnLhn5vVYaSL1lypGLju/Xd4
	zNGwXmW+Bf9A7kdLjfzjuR/u/sZ0mFoqpqYZrTUo0d4oDINGwLpr+k12kgLJZIoSJPQBEh3CUG+9y
	heGRvaUWtGxmrQEYEVuZSMtSehVlVIJIQDwn0oe1PjNvhP1ywFfck8ePA12Awtd0Lo7UsXTrPUZuK
	5ki4I1B3oDeTOir6WoIP7hWAdD+ypuuW32fR8HHLVjKJqXIH/PN2hjEKLq8AY9oafLyrupoXSW3+C
	kjlYq9ag7//8YeALOBtrwLfbac2C248hE9LWrWtvogooY/HKphRWw1IlC3YBufo6TsAPXTbzVKdxc
	bmGvD8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbgU-00000002NB9-1ir2;
	Mon, 24 Mar 2025 06:53:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbWt-00000002MEa-3Sb9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:43:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3996af42857so3185620f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 23:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742798602; x=1743403402; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=roa5rJRAYtI/tn+NF3Leyf70YfVlfQw4OIxeKs7HAhA=;
        b=ab+XXR1EuCVPC7T1L/Cuoy7/lFnEVjFlaXlCNTRKv5zc0jGgTHzL4hoxXbsX0QX7Z6
         hEoo47hhRsx+vKsESxWEsxA5jdctYE/QnSHdVTCUY2lXF5gW6JZKqCVjsLq4Fsd8ZJkf
         35DxAHdPYj6+K/iBvKPTcEBckRSfJA4m8LR7pcHhWigqewfYWb6t7tOTCMhJfuXcW1T2
         Sj4Tgabhwq+PB3yT4xWqagkcllgzYtJxnbskOPVBnXP811aQuqzjw0fey9gYSWt8XRBu
         Lvuh1X4ZWfrczrrYp0N2t/rB4xhFeCPyhCxOOsR2PxZq3j9xyrOxYD78AqwIUvEoEMNx
         E8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742798602; x=1743403402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roa5rJRAYtI/tn+NF3Leyf70YfVlfQw4OIxeKs7HAhA=;
        b=WypLfDgHu8eC33l4Kg5xqt7vhu6C6U8dScGCUVEGRJdROdxDOM9QuWq6fZMP+gGzhX
         63mU0ZL7KsluJWu8Lu/RZLltceZMCmzcNa7ctm8XB9azqZwV0VaNEwoyXiCCZyJdQRr4
         l8WDnEM1RewAlZcc5NxRdX1I5BMXYXz7Q+6tnk0kub9R/CfBxOszznGiZPZXCMVkq91E
         yM91g+sWqGk5Gqh2xYc8KXp4eWNP8U4AMjJ7p1nnxtcYeCLUK1GvbzwY5+hUysq+wnTj
         j5WzNxrdaClmfZsFZ2UoGySGwGs75Atj/2eF05U+SUvJUL1lrXFtEC2QSswDa8UVepJK
         bqIA==
X-Gm-Message-State: AOJu0YwkW8GxyT5k2vfBa57xjv9QvZPRw142zrh3JlvGBBHWdLOpxPfL
	n1lORxhmaRufSFCrIISGrMDenZjE2uKRNnhqc/T6IQo5ftaORV5531PAQ3SKb2g=
X-Gm-Gg: ASbGnctDO6yRLSoE3yldiNn/MijoxE+AScuLo6ePt9mV7rGu/PhQ3gtH2VVhZzVn3gO
	rzPePA6+jhCujtWYA61PgCZgoHIsieG4kh/CQLE2UitrjYEk7FzCjW6YSI1pYGcO2ZUukxewDOE
	325z2yNLb6EDU1LmvZuU1X9TQxB9SSHZAX50COXx/YZMjabi6eLuM9/mymI5R+6+Vpx+Anv1BYg
	oDCeN53O02mM8+EZGYJbatzodGAKXCVWPa8U12SvmicQlPO2omvb5vy2s3kg9W5CAYFULVVeX8O
	MtF/HVd3WKr1AmHwEQIvrSLfbS1gfx4TaJwSo8KFVfvZcPligj1pwExSxl4uI9QghGHVzkUZmlk
	l7GgWb+Vz
X-Google-Smtp-Source: AGHT+IFvQv/kkM416uQwEtFPB4/n3UYfjtYLOWd6Rwc9FTH8BKmvt8rRWrYokvD6EeksOhqYEE/oWQ==
X-Received: by 2002:a5d:47ab:0:b0:391:23e6:f0ac with SMTP id ffacd0b85a97d-3997955ca8dmr13950976f8f.11.1742798601722;
        Sun, 23 Mar 2025 23:43:21 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d440ed786sm159469985e9.38.2025.03.23.23.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 23:43:20 -0700 (PDT)
Message-ID: <c16c69eb-a5c6-4b3e-a849-3b1719d26dc7@linaro.org>
Date: Mon, 24 Mar 2025 07:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: s32 architecture upstream tree
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 chester62515@gmail.com, Matthias Brugger <mbrugger@suse.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>
References: <2f686d68-4852-4aff-a551-51e8515de6e7@linaro.org>
 <fa9d57de-9eb3-d317-3d39-3940248ca17a@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <fa9d57de-9eb3-d317-3d39-3940248ca17a@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_234323_875673_F655A46F 
X-CRM114-Status: GOOD (  14.19  )
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

On 24/03/2025 07:27, Ghennadi Procopciuc wrote:
> On 3/22/2025 1:39 PM, Daniel Lezcano wrote:
>>
>> Hi,
>>
>> the MAINTAINER file does not give the information about the location of
>> the repository for the s32.
>>
>> Where is the repo to base the work on ? Especially the device tree
>>
>> Thanks in advance
>>
>>    -- Daniel
>>
>>
> 
> Hi Daniel,
> 
> Shawn Guo's tree should be used for the device tree patches. Please
> refer to the 'ARM/FREESCALE IMX / MXC ARM ARCHITECTURE' entry in the
> MAINTAINERS file.

Thanks for the pointer.

I don't see the SCMI clock bindings. Who is taking care of that ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

