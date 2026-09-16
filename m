Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B542C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xfCnfWUft91FQ9MOOueIx15mDmNvVVdKkU3/hZKgHo=; b=fjOSz5zij8NyqIeene0eC7cqBo
	Hz0/lEs08j5jsI+ehMZ8tcp9j9MJBBAvxyRaLEPj13vifUYWeXLe9GaI1EBRdlE0vJMqD/XD3yyWE
	cPfLB/YrRqfCJICAChFlWjERDBQKWtu0bgH68vo+sWVVhq2UsgUq98FcfiKSVCtiO6UXezbklEvp4
	2/90bVI6rUuA5NmgLOcPZCK3qtMoD9I9o2eTCGx76UGg53BGqkfxNav+3gRgOGMBVCQSLg7MA2Liw
	UeN9CJksGuzrfWDn6ekmomkasfUgiOQIo+MJzNWZ3OjHR3c3qhP+A8/3NZTBq6l22/XUZoKKuu065
	BqI5sLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6njh-000000094Wf-1SoC;
	Wed, 16 Sep 2026 11:23:33 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nje-000000094Ve-2Qzo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:23:32 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso5925395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 04:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789557808; x=1790162608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9xfCnfWUft91FQ9MOOueIx15mDmNvVVdKkU3/hZKgHo=;
        b=rEdKq62IrsCHW8KR9VG/JndeqV5XKZ8WM7aPFY+GUfjx80R2X/z7du4d03TGxeV/zG
         TKbra6ncpS4lOpCB6M2PSCILay3RZTMrx1SR0uijnORguatztF/sdIEjxDSOEHL7/+GZ
         431pm8RUlIZwC31I6GhUKfOwVEDbVrVsGkpH4q/Xfa3peSD59zNMsWQCxB9u0t2mnotc
         eAh0fpd+Q6reLVIgVRXZVJlnc4poIk0SYhiXm18VEEiOzcW/mzXfkmnd3f8AIpBdIbFv
         sGqX9M1awRze/EH/su0Hea8xzd0tqOE9ruFRUm3Rj+oEG74X1IZgvCT72yruZpYL+Xfb
         T0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789557808; x=1790162608;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xfCnfWUft91FQ9MOOueIx15mDmNvVVdKkU3/hZKgHo=;
        b=1HbkeaENnyRLTpC/+usL8ctl3m83lk9OtJ1f6MDYdtEzj9oQbs+vv7uASCg5hEZExa
         rl/IQTnieDZwPypKK/ZEru+tagY4ELkjDjFBteKRYn6NC4jfNTU7GMTyP3UXTEvdUDGQ
         nfqzfBvpAuZv0RpZvu6l/xcteL0k5FG95jJLyGZDybFyJhVj4m+jMprT7jsojWDNJ3Ez
         /UwtgIX9fHHytbzsAodRxgR7jx7RcqGObj1JigIA3OlYU4q5Z2c8a2KmUzsVYb3PaHOJ
         gl2XbHqfKqEdSycKUcIM88Qev/jrSd1c/3LJlv2kWi2m/geO7sYqYPhs7xief+q3EqF9
         kkVg==
X-Forwarded-Encrypted: i=1; AKwUvByx2MlaPMg3ahyGQR/7wUnDiwEWg5xb1rfe4RI8x/bZPaIG3KtTqzDZyKc4DZiEdbdO7X36OngBbmrNPhp3JzFc@lists.infradead.org
X-Gm-Message-State: AFuF++kpfKsEbk8N1kpwHCXVMpAg+W4/JRutKXqzWZ+ve0K3QQfWEKyI
	BQT0AxRGJN+6MsGdGc7jouuiA4tnN6mRbZJxbDzzwqgKXJIBgi2T3CVZ
X-Gm-Gg: AYBFou3PRrjdWypJ99pD2pRWv3Uqw3E4xb81yS8zoAi6bGiB/Vvr4kibPWvnyPQUgxj
	Hv8uvwC+nI98MC1sRxhrU3NaWcrQ0IwCw5UIAjvmdp6OkKiJGHLKIzNJ7pNpp4DfSO+v51Y9/vz
	4qVkowRJi2lGTDcRaSHrzmTwHqNE+DquOx3P0spCgE7z/Qry7m44EnU5sVlfzhREnB8gVGChY5F
	JxxdmIl+Rh0iDwPMxn4nY5kPkB8yetk52IXmLbu+TRkiUYxKddZWBdQeFAA41EiRhl0DZwpDmgH
	ZZrg56pSSRZ8v9JQte+Iti/gadXTUgHSHcwBpA4EsEWTE6QmlryJ29NAch8JPzsWRuwPSLJnPLm
	95V7IJySGZSnXWW3kXOazRqPR6K6E6/OVftLlLayzN3cT0i44lsd+juGzx6pLgInbsMKYPjRNoL
	YmZIvCXb4bYji+ro+PCVYElzGhjOBgnAgrAVsok1JDkY5kbj9GO2bOVKOKCu1/T53IjVSw2Xjap
	cSgl5wbC44=
X-Received: by 2002:a05:600c:6296:b0:49e:602a:b4ec with SMTP id 5b1f17b1804b1-49eb730e225mr53609375e9.8.1789557807754;
        Wed, 16 Sep 2026 04:23:27 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm80761805e9.3.2026.09.16.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:23:27 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed, 16 Sep 2026 13:23:19 +0200
Message-ID: <178955779940.30466.10860982419496123467@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <55538466-2203-42ec-a0bd-b743c04a3b38@arm.com>
References: <55538466-2203-42ec-a0bd-b743c04a3b38@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_042330_961619_A65919FF 
X-CRM114-Status: GOOD (  13.75  )
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

Hi Dietmar,

On Wed, Sep 16, 2026, Dietmar Eggemann wrote:
> In task scheduler code we use cap_scale(v, s) for CPU capacity related
> scaling.
>
> We could move its definition from private task scheduler include file
> kernel/sched/sched.h to include/linux/topology.h to be able to use it
> also outside the task scheduler?

Fine by me, that reads better than open-coding the shift. Your diff
builds here on arm64 (topology.o and kernel/sched/), so I will fold it
into v4 and add the scheduler maintainers to Cc for the header move.

Since the diff is yours: is a Suggested-by enough, or would you rather
have Co-developed-by and your Signed-off-by on the patch?

Thanks,
Oleg

