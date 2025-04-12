Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2BBC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Subject:Cc:To:From:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAFzW0ymkaPRNBJhUxqHJQFObzo6YSO+XlIk9KglnZc=; b=Qs8Yxsg5rPCuD1LAUMXR2vR6Az
	19SIvV9c2iqNnzoMHWuTnHDMi3PNSxPvuzQCW9lTjWt/+kLj8Z3W9nSiYwAcooG2DVH6wBYuZbFhS
	h/0SQg8S83v3mQhyNCzHTCv73n4NKymzBEK2Nl4W6jIMuY1FMe44dol3PrsvYMqpwqkdgLIe3t4fh
	cDPUZZQGBiFFyzVduPzMvozbe9D3H0PjHGb3TxsLEMPhroTJBq5Usw7etBaD1Wumdb0Pel70p+L/k
	qYVKroOeZA/zKsSkVsJ4l6UkuO/bDPGAjkjMHr/bBqhSjZNRAKrmDhg9+k0RV4Gd0gnBZM7KcVDf/
	RTOsWWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3YJ1-0000000FnIM-3piU;
	Sat, 12 Apr 2025 10:41:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3YHC-0000000Fn5l-0T9Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 10:39:55 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so3196715e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744454391; x=1745059191; darn=lists.infradead.org;
        h=in-reply-to:references:user-agent:content-transfer-encoding
         :mime-version:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yAFzW0ymkaPRNBJhUxqHJQFObzo6YSO+XlIk9KglnZc=;
        b=dR5B/NF6koDfujIyWSwbDq3hFkXf58I6YRlk4Mc/tZ5nrhso1tmKfeSZMdee2Skuo1
         A/Q6uswidRwaNejTcb859D57z+gmZqJ+/BQp7CrRMZiTCbvNBsiO8/e4b0ikWDpIGpWO
         vfhCURkx8SK/vSJBLbslQJWjE6NNZ4JrP/MKkol+ReKG2Vj0+Tm6MFxpSFfLl/HVn66I
         6RxmzsOYy7frmXPc0KRQUw2yUWKUQJD3ECHiX2sA3Ozkv6ZBoRjjURy9IU3ifOlh5OYv
         88QDrd9i3Tah8Jqz+3mCfXKYHmWtLxsFMW8jjj/QwuIIZ2PkJBm3bMYHbIUG/ibEmdKi
         +ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744454391; x=1745059191;
        h=in-reply-to:references:user-agent:content-transfer-encoding
         :mime-version:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAFzW0ymkaPRNBJhUxqHJQFObzo6YSO+XlIk9KglnZc=;
        b=iSvkB7Hal2XoEB5YVsqLVX5YxaNxj2Lmzg1f9L3evVanUeRL5zMaVXQOzSHiBLfuHK
         iES8w09Lg3uwU0bUQDG5HPgy5FYvLir7aGjLIf+H9EzTs4H3XRwF5yHczCoa3EQ3XcBc
         F+Ze7Et1n121OtNJT4PJssubsW9ZkVfzudwO7OrwhXgmfyUmnjXFwZTVKcDPnXsdrCCQ
         kJVEbcW6+8pQTz+5WFEMcllbinL99Sn5tvda3/ThAAq0ByEKAtq1CEWv3won1idLzTcd
         AKHFTwhCFsmRCADTMC0C6UKlGngSkaCsqcfipjcFd1jgz6rk4Z8m7QdBmnQ4yd/1rnGE
         v7og==
X-Forwarded-Encrypted: i=1; AJvYcCV6IPAF4iDq1nzCtHm14ULKCSvZmwR2taT4FsdKxrasw+MVRbh/SRpCgR7OPgCKcFg6oSuft+GLJflxuv94deGS@lists.infradead.org
X-Gm-Message-State: AOJu0YyblOFAyAlVbX2szYbApuHTStRzjl9A9gBUK2ULFzGJ/+vfc5Ut
	tBBqws6OUchnbnNJ8gq+CcL68f+YThPsD1XnEWwA70sOOiauiqQp
X-Gm-Gg: ASbGncs8hmvbSwhsuL4EbSefUWh9KINRviuDzm/taUviRbyLsdouizjSJc87DpGIOy1
	LFoxE3JHMZoA2lQR3zJOyYfLEvlyxabw4FcJgB6+DyPXX/U9TjZWIIxHCrFbm4s5Rmw5le6gRM+
	THv2/kT6qzKISWqhM88GFkjTyMS5wyxCMV7TwMxyrYv5Cgyls1c9mzCoNVyIU4ARPlsZVZ1YsXq
	/JsUesFv/0u5rizWx43HKZFBNwwEz0flDb8TKwDK0bbiXbPhQmWxRi1N5kib6tJN+qRlUfbuV7a
	Va5x37KN+errz+ZdRR2exkoX+ehzWLj1LBs=
X-Google-Smtp-Source: AGHT+IFYfq5iTVEjCE3996E/WIGRHlIRpig53diaZf8XS7XcDoOf7GYaOf5VLRd+nDqBV62DgJ8OOg==
X-Received: by 2002:a05:6512:308d:b0:54b:e70:3647 with SMTP id 2adb3069b0e04-54d45289b2amr1794412e87.7.1744454391263;
        Sat, 12 Apr 2025 03:39:51 -0700 (PDT)
Received: from localhost ([5.18.181.127])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d503d08sm607672e87.135.2025.04.12.03.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 03:39:50 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Apr 2025 13:39:45 +0300
Message-Id: <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com>
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Sudeep Holla" <sudeep.holla@arm.com>
Cc: "Cristian Marussi" <cristian.marussi@arm.com>,
 <arm-scmi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
User-Agent: aerc/0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla> <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
In-Reply-To: <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_033954_151797_8A3639E2 
X-CRM114-Status: GOOD (  14.71  )
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

Sudeep,

Thanks for taking your time.

Sudeep Holla, Apr 09, 2025 at 14:12:
> The start update should retain as soon as Platform uC acks the request.
> And 2 notifications can be sent out for update procedure started and
> completed. I don't see any issue there. What is the semantics you are
> talking about ?

I'm going to refer to section 4.1.1 from the spec, where stated following a=
bout
delayed responses,

"Messages sent to indicate completion of the work that is associated with a=
n
asynchronous command"=20

Compared to notifications,

"These messages provide notifications of events taking place in the platfor=
m.
Events might include changes in power state, performance state, or other
platform status"

So before I implemented mentioned driver I had red this two and had chosen
delayed responses, because it had seemed more appropriate. Details below.

> Even delayed response as some timeout so I would rather prefer to use
> notifications

Hmm, I see.

> in your usecase as it is completely async.

Just to emphasize, according to the spec I don't think that delayed respons=
es
and events have different degree of asynchrony. The difference is in the
initiator of 'messaging'. Events are sent by platform to indicate its' stat=
e and
delayed responses are sent to indicate status of previously requested opera=
tion.

I used the latter, because firmware update can't happen spontaneously. That=
 what
I meant when used term 'semantics'.

> Yes neither per-transport nor per-protocol timeout will suffice in your c=
ase.
> This 10s timeout is specific to the update operation and hence use
> notification. All other solution is just workarounds not generic solution=
.
>
> --=20
> Regards,
> Sudeep

I see your point of view. However, taking into account given arguments, did=
 I
convince you that delayed responses handling should be implemented in sligh=
tly
different way?

--=20
Best regards,
Matthew

