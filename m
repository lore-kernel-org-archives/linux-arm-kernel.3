Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ECCD10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcQcqpW0XvFTJM+qj42pfjnjpcqJ+uxxP4g6ALjEIwU=; b=CR6US2YS6oy9DhUnRlDh3ChNOo
	f+RB84DzTbUsjOaNYp7kvsr8Mb4DIuE+Jqaz65mJERfTqH05ojphs/BBTQu1OHFyCn5Yfy/38bGGY
	hxSJq2X3O+GY4G8JxI+YQDa6jbfD9bauuzWfdfk719BsVc3uBAm89h5BH7e+VMV7RD1syukeEIQBV
	19q5LxWd1OT8zM1IzBjzOuaXcjh4UJY5pn7kB7CYSyOxLwra+Bw8541b1vxyt1P8+0e+YqB/fHt0m
	/JuD4cZaJ/J6dhESuGeD9UzgkrjgorlMC4fO+U6FsJJi6Vj0DbdlEnrcvCIeh1FiMRAhxIeS+8nTh
	ie6GiiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIA8-0000000FH6y-35Ws;
	Wed, 26 Nov 2025 16:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIA6-0000000FH6F-3wpX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tcQcqpW0XvFTJM+qj42pfjnjpcqJ+uxxP4g6ALjEIwU=; b=eLxhXHbXg80TsbXJpRQFike7/M
	rgfawVMG5gr5HXE0G3G+qqboHmGxJkKx34uI2GEFSYiGXEAcucBT60MASGx+R+sMBBgcFEk7CY2rl
	2VWy3g1gWqcC+39efsVPsEK/6eebicM67J0pEWO+1qtyRVUha/eJWi3O6yY2DfD+R2aTOEq06vU9A
	JhIhkMxNSh4bD1kJ4kIexoGOqrW8jel8P4tJ4WW32be0Y1F/NixGnxvcBl9uJQgh0dGgTQNcZKq7o
	of3khALRPvRBiq+If7Dm608cM9A6ub6k21QiGwlMpvHL+evB0EHk4f6k9pBqvlLYC58oRPrckkY0p
	7KBspZiw==;
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHIT-00000008M4h-2nUz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:19:11 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8b23b6d9f11so672834085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764173670; x=1764778470; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tcQcqpW0XvFTJM+qj42pfjnjpcqJ+uxxP4g6ALjEIwU=;
        b=UzL30gqefcUeVHuwCuht82228iOIL5WdBR9/evt0xlG4Alh4DmaftBSvXgyTGAbS4f
         PH9/axLxIREuePS5x5LcWUHVw+SLTFgI4uUkLMgdgUeTe7LEimLwz8ouXonuGgLq3Kc5
         0cLkaH5/RgG99LnbrMMmsoA6BXdLl0dYGhCVCu/wcsdm4qPNRWoQ67syosKz8ARm/pzC
         eHogdvkcPnS9RgPMUVgFyD2iCGGqf5GXfQVj4AgC6oz8W6ectxnbaedgIXrlgZZeQiNv
         ErtqHFCfS3keZqHxQ+laDk68feTF5ZGG9ZhwpnmVBsZHnRffwaMGcmAtHg+ZPn4QzA2+
         0tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173670; x=1764778470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcQcqpW0XvFTJM+qj42pfjnjpcqJ+uxxP4g6ALjEIwU=;
        b=iSGpN7K6iv444p+FzMv8PklHRWJ6YwjvR3QqVecEHoHL8MtDg9aKsR4oQ8RIBclKeE
         BKxp65PHKI72/rGj7wasDPT0RrbGH5CPvCX491sQrryQtjPBQcx6H6xP4vOpnsyWo/F7
         p4eCc8VmyhE9lYZNFFaQYhqcL/3xa8wyfigtEs9X90XBiEIOTC8SMFChiODlV0jA6ut7
         NEgtxip+V27LV/kdVYz6XUspSE6fon7BYu6N5yWrNbr7lRn8e39xY1gEvXg628eKqgJ/
         hladE5B/T3JRQJMiACf2e9fKXd/z53HL04BqPa25EBmw3dMctQaiU4gfReOwwXMqSAdu
         NaKw==
X-Forwarded-Encrypted: i=1; AJvYcCWvSjfyt57sRWA72aHznopLd/K+/VxMZwkWUhViIzFzvHmo5v6IJLrLR8X9cYM76mvN9gqu74hRrdOzvoQnXZzf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qmodHsBDnjbh6ikRxh8J5m87wQJzg06D2vtRsZLtAmGopkD3
	mneVyo/d1W5zwlERSKxzPY1N440ZN435yxMnq71sfiZGcDA98693xBq4YGvIwAsDgsewVn5Cmqy
	CiFLzXwbDR2QaLOzhF75GYSQDFNrUIg82JdA1fjaeqw==
X-Gm-Gg: ASbGncuX0fG4XpwQEAFhTQLCFdPmezxGROlbU9Tg0OjOn8CwFleksGCK928lHacTWFS
	V7bGMFw2dzquCLRAzeqeGVeR2lJ2Re/gBiOyCv3TlO0xOmVnKgiSGVESnz9txz06WKcCa2WClxA
	g+IxhNRDbv9AdI4M091rD0TyZssBbDw5NyU+copKR3U2i+/apxcOfeE/h8oB7DNZQThFk9HDeR6
	VZr6Ex/bYbyJmT2KhgHLWZQuUDT3/ByIHf52adDdC0NOLZztTfDUZAj+eR6uug6z/KDLJOOMluy
	QAFKw3j/0a/N3ZFVpB/vuO99/0QtpgokzeCVIgw=
X-Google-Smtp-Source: AGHT+IEYREzZ9a7aW5w2u2QphT4cr+PBQEzrQyXIwSBSSErZpcXFaCjLBZbKaBvfO3UbpLcp8YPMk++YD4vxAtw67BU=
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id
 af79cd13be357-8b33d469984mr2401094885a.74.1764173670053; Wed, 26 Nov 2025
 08:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com> <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
 <20251126123147.GI724103@e132581.arm.com> <CAJ9a7VhD2p3qMGXNg6deYjE8myB5euHR4FcAFwgg0KWF2HO9JQ@mail.gmail.com>
 <15d536f2-0829-4f3f-b111-b15b14236bd2@linaro.org>
In-Reply-To: <15d536f2-0829-4f3f-b111-b15b14236bd2@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 26 Nov 2025 16:14:19 +0000
X-Gm-Features: AWmQ_bmzLUfnVGvYj-Hu5IiwK8dzQhWo3y6s6dN-IrML8oCpNj4bF4oF31DLYeA
Message-ID: <CAJ9a7Vjia4ENewP48nyDWBcBFbDmwb3vM2JNbNCw4-3yF3ABVQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251126_151909_824738_2C36F422 
X-CRM114-Status: GOOD (  30.65  )
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

On Wed, 26 Nov 2025 at 15:33, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 26/11/2025 1:42 pm, Mike Leach wrote:
> > Hi,
> >
> > On Wed, 26 Nov 2025 at 12:31, Leo Yan <leo.yan@arm.com> wrote:
> >>
> >> On Wed, Nov 26, 2025 at 12:11:05PM +0000, James Clark wrote:
> >>
> >> [...]
> >>
> >>>> This fix can still be applied to older kernels, but seems to me that
> >>>> now might be an appropriate time to consider removing the ETMv3 driver
> >>>> from the mainline kernel?
> >>>
> >>> Yeah, if anyone is using it it would be on an old kernel surely?
> >>
> >> We can confirm this in another way: if I don't miss anything, over the
> >> past several years (since 2017), we have not received any questions or
> >> bug reports based on hands-on practice regarding ETMv3 on the Coresight
> >> or perf mailing lists.
> >>
> >> Thanks,
> >> Leo
> >
> > The key to this is not the questions we are asked, but which platforms
> > are still supported by the linux kernel.
> >
> > The ETMv3 driver supports both ETMv3 and PTM trace (the programming
> > model is the same, even if the trace decode is vastly different).
> >
> > So as long as there are  platforms supported that use either of those,
> > we need to keep the driver in.
> >
> > Mike
> >
>
> We're not running tests though, so if we find out it's fundamentally
> broken somehow it could be another justification to remove it, even if
> the kernel supports the devices. Do you have a board that you can test
> on Mike?
>

Don't have one myself, but I believe the TC2 was used in development,
(that's the A15/A7 32 bit part - not total compute!) which somewhat
conveniently had both etmv3 and ptm trace.



> Maintenance hasn't been zero cost either, even build testing for arm32
> is annoying enough.
>

Pretty much the seem for any of the arm32 drivers I guess.

Until arm32 kernels are no longer supported, not sure it is safe to
drop the etm3 driver as we do not know who out there might be using
it.

Mike




--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

