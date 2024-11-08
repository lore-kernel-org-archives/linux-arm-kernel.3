Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC07AD5E140
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 06:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhKZViwIojy1jznqH+DVmUP0BD/k7Oy5tX4x7kzV0XQ=; b=SAsVc9vxuetfmlg4UWd4CRJl8M
	CP3RBBSwMkZOa2U2EBDrIEEWixvInJMAQQh52x9Jy0wPmGbDEKuv0KFQEnuXgXS5mylsIXr6ZEvVe
	IqpbiRC4qaRzb9V+b3JT1Ej88FTcio0f0wB6ooC21hwajIlhWcXDaNChuT5YEdy3bGgWWRWEtSueg
	W6q98E+nqQEXbMLsE+BETU07gONy8N0cPI0wwM4bRUP/llMr+ZNH46HR1c6mAdvpbfBxjL73i8Gz6
	qunqYMx6G+PcUPnWmXcg+oyy9INbu00IViTMeYIrKYjjqT0CYrI84NxbFBSeFiNTMqPzWMsriPMAg
	AhG0La+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9IVz-00000009VGm-30eH;
	Fri, 08 Nov 2024 06:30:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9IUF-00000009V2n-0H7C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 06:28:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so4999911a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 22:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731047329; x=1731652129; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nhKZViwIojy1jznqH+DVmUP0BD/k7Oy5tX4x7kzV0XQ=;
        b=WYeH/G44MfZMp65Yds2E8CJpvYFL7FKqkA9UY5zCoNSBTLwDZ8Ww94GMDFWb4y6Ujl
         nWCLnIizbbdvhKJ/x8Ry6X3E/k6Qu5h53iGVdVNL04nk/e7jrnnPTdzINvuCngRwjW5p
         TjK+ILODSwAOwTX6Eghp5WBNUcOF6dYJ+o8yU370XajhaxysLUCbndfmZPQuHFUUGiH2
         vSisfDjMAsar+U3J1j8bZijBLQORNxu2i5WNqXEMUJxmhXMtsXuODrfd/izUpzL4FD5a
         LMVPyGSjzuPaVwjskvj+xV/2n2/pCEkDO64x1SE/FPlmZSOMRfufRPWK5lIv/3M3NHH9
         olGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731047329; x=1731652129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhKZViwIojy1jznqH+DVmUP0BD/k7Oy5tX4x7kzV0XQ=;
        b=Tc1cPQN5VEn/gZ682UKvTk3HBnwCKOa1IMIbOUK8KnVS5cUb2L/diekQDk9Y0biw7Z
         bFT3bbzT5E4hoso7MH7ZBOz1Pjl8H01MJWHaX4NCrKjrbSUNDsyu9PMCiKLPGD7jIWyY
         t/7S4LUUXJdlxBsIDz9RsRmzeP8+Hrc5YarPF8g5g2GpHP5w5AShI6iLezmONiglnjgC
         u+bZhzp0CYqrTgTOQGJaqyHH3d1ZhiY+0laxnC8qZ/FIQfqXK7/ESMedL3ZjtUAIx/qj
         JLcl0ywOciYquMqlHhqX7fYhJwcCLi9iVl0YuAWDZK/SGnzJRGMWXdzFyQVkXd7VpC6P
         Fdbg==
X-Forwarded-Encrypted: i=1; AJvYcCW+EjULPdJ32XNKwsBDTgSupd7QwLTimziew7fDWe+HWpyURxWFrpjny0b09VeheniWchBJWJLHjmsCh9QQVMUD@lists.infradead.org
X-Gm-Message-State: AOJu0YwP2QCU/c4IbY8EdCpOOuuIjy5REy9Y6QX8e0oZ28pom/U4nMmf
	gHwnkqyyZTCLJ/5pmB1XClpU45a6hfi50TVRJ6J/zjFYp3STUHpVkp1wlsb1DI9ltfqT2KSWtn9
	BmzuI1MXdiDPNgDkMGedCv187djE/q8qqIOxngg==
X-Google-Smtp-Source: AGHT+IF4QpvMl47Anct7uB8oNOeB/KNHWgHKnvD8Y/Uan+WAiJAKM17lcJrxkRIlrQw6Wda6VuR3wUPC5X6N3HpZEeQ=
X-Received: by 2002:a17:907:96a2:b0:a9a:7b3d:705 with SMTP id
 a640c23a62f3a-a9eecabd4e7mr172472666b.30.1731047328457; Thu, 07 Nov 2024
 22:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-2-beata.michalska@arm.com> <20241029070429.m7q5dkumitoyqxq2@vireshk-i7>
 <Zyh_ACbOkSsjcPX3@arm.com>
In-Reply-To: <Zyh_ACbOkSsjcPX3@arm.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 8 Nov 2024 11:58:37 +0530
Message-ID: <CAKohpokFUpQyHYO017kOn-Jbt0CFZ1GuxoG3N-fenWJ_poW=4Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com, sudeep.holla@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, rafael@kernel.org, 
	sumitg@nvidia.com, yang@os.amperecomputing.com, 
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com, 
	zhanjie9@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_222851_139704_3CFE3C44 
X-CRM114-Status: GOOD (  12.84  )
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

On Mon, 4 Nov 2024 at 13:30, Beata Michalska <beata.michalska@arm.com> wrote:

> We need a way to discover whether the new sysfs attrib is to be enabled or not.

Ahh, this is too much trouble to make it optional then :)

> I guess I could change the signature for arch_freq_get_on_cpu to return an error
> if that functionality is not supported for given policy ?

That would be more controversial I guess as we may want an unsigned int return
type for frequency.

I think we can do two things here:
- Just enable the sysfs attribute all the time ?
- Make it optional based on some static cpufreq driver flag ?

I would just enable it for everyone I guess.

--
Viresh

