Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD16EC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tL1lU3S6y66CYudldJj/uj6mbDDp8Lup5C09IlTTtlc=; b=z/8LVlXBPQ4VhMpiCUh3MSKJCW
	uEJ/495A1hM3I171popusPzspcHXZM2VZVjonZeozz0C6zczWFD2oXiNX60z+kYkuFS7digbDKJUG
	Tc5+Yv8Jh4OQqUMd1kpK5odkgZbLlUIrs+TCuw3raulq9rvVYHVRSO/Esi5/QnT1e0a6q1ZCoaK8Z
	HR/96tKsnp06Ton3xWg/QzlFXf5YY7YQgH9zgC+J7lG6meQVjxGp9BbwfL2HxwEg7Q271QuW/dynd
	WRlngtbW28UYlMme0OTQ7VebU1sL4y+iqV28gnxVJ9ElRMn9Z64OYDJk49rmTDZeW72dTdBRsLrey
	dzAYqo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ECU-0000000BiLK-2aqn;
	Thu, 17 Sep 2026 15:39:02 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ECR-0000000BiHL-22ig
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:39:01 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b24c3so612355f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659537; x=1790264337; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tL1lU3S6y66CYudldJj/uj6mbDDp8Lup5C09IlTTtlc=;
        b=mBSjk0sNjB1J/zQmOmV/GnsyMk7OK2fIm5S1Fm5/4+EnG89SkjnLiCp8DBG6Daf2dF
         MomrfUPjfcEUwZhl/h32/5lX8frYBwd21E8umQakK9C+KNM7JTFc9SgZBqbRpLcHdWpR
         6GGfwDFm8PFuD6NUuela55qZmsH1MwZAyl7MOOleI7hpCPjm4dHMfweHkLpqRHFygMaK
         +wKBxUhDmNMPDrZQtBs4dEAFVBuzJAseI005YUXnsZJpf/RXgPt7UF/AUD8HYIUHGS23
         QeM+xLQ/964MrhWg9u0oCz56tFc5wxMPoSNzZTKFTUaYJlOUfnyG+pzDecWfou1RpF4/
         qRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659537; x=1790264337;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tL1lU3S6y66CYudldJj/uj6mbDDp8Lup5C09IlTTtlc=;
        b=TwnEMg3JUUCjckj7nB+xvyfFgqsMvxRrNhD9iTFoLPPO9+RFUfJBQAuWqoGJP2k8QB
         aKzHGeJsfEBZ2PsSJ1aank41U23GAbdjQf4LzZ6vo0mjrNJueMM6L7Oe3MEe1nCy7nJX
         W34HJ1Os733KKENKLCnuPWUM/tVXYH/tQXqj76gF2XyflDYMlFCQPf1ZWOaKK7r1bZNk
         7n+gO5JoN8oNRfBK2ThurYqAUaYZ7DZ3QNpRFYBxlZUnWubJ3/Vp+e4bOc2pOy+Bij7Q
         cITgeKYhmX4vOjd5/vgseYCbLESGFXUerw41LhNegxLyZzeRfrzQp9LMIqW9bu2K/lLH
         bJNw==
X-Forwarded-Encrypted: i=1; AKwUvBznMSvjrMW9pnokWAorF3nfJzL1SDOIbFcuLOPaOPLjouaK7weNCW6FBvMNl+HCbCyXOChsNT1FQArOx9otiR95@lists.infradead.org
X-Gm-Message-State: AFuF++lKcTr8tdSVvXAXYwJOi2YuNAroIvYe33bv6CSF5lUrbTKfmE6G
	frAg82LCGloOAOhH/84gMnwsOFBe855bwFM5EfYmDGO8gG0lkX8PG36R
X-Gm-Gg: AYBFou2UWjrUwmmtlaH9SD92zku8T7M3EIS/m/IunzLqF0I16r6YZA/ii6m3MDvp7uE
	1M44moC5Fjf4R1nBsR3UZzpgEOTjWtRRWrCHQGjNmZq3MrKuseRZRMrZgKiiv4LvX/hWdTOPY7u
	sIOt/AsGOKLcUodBq0UsrgWEGbm+debEgo5X1AdkgYWDNe/kekvOLw66DixePQHrrshhNx10F9Y
	cDFGinar8uZlqBICZ9Y+GLM1rSzmKnrB9aZsjkU15lPp11Khhbt6KxzNIjIPwVWV2Np12kYxLEL
	HTCSGK9lyfu7IYiDtuOj+UAmYZ0YIWy6Bcsv1kuvCv+dBE7PaPLoVm1EDGNiVsWXbk15S6k3WEP
	un6+PEzBSw8KyM2H7Lyx/SEnSOBTP7EwLXu4gOOYh9GpiaaTgbbm8FTdKief+UxgW/9w0faC8mD
	VBo1L/w5JKB7YcUOTv1FCeh04P4AbTtbURghXZkPTT95rqpzJ4bvOHTIzHn3qZvP1tvo+JNBCTE
	Dt+WLNyXqei2sBugj4=
X-Received: by 2002:a05:6000:644:b0:487:4ba:97f2 with SMTP id ffacd0b85a97d-4870cf27ad0mr9119569f8f.3.1789659537241;
        Thu, 17 Sep 2026 08:38:57 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf462cesm15872185f8f.37.2026.09.17.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:38:56 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arch_topology: use the boost frequencies for capacity_freq_ref
Date: Thu, 17 Sep 2026 17:38:47 +0200
Message-ID: <178965952769.2757.5034972953349001664@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bddc9273-fe02-4984-bfe9-5078e9e6e111@arm.com>
References: <bddc9273-fe02-4984-bfe9-5078e9e6e111@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_083859_550291_089E713D 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu, Sep 17, 2026, Dietmar Eggemann wrote:
> Ah, you want to fix this for 'frequency table' drivers.
>
> IMHO,
> https://lore.kernel.org/r/20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com
> is trying the same at the moment.

Thanks, I had missed that series. Please drop my 2/2 in favour of it.

Patch 1/2 here is still needed, and becomes a prerequisite for his series
on this SoC: with the reference at 4723200 kHz from boot,
arch_freq_get_on_cpu() wraps and cpuinfo_avg_freq reads about 524283 kHz
unless the multiply stays in 64 bits.

I will test his series on the Yoga Slim 7x Gen 11 and reply there.

Thanks,
Oleg

