Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8A2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IY7v4Zi/Fu9rYdLW7DVELcSJJEpH68M/8w+jya2QF0=; b=u/iqmqBpFmAX1HeSSci4oGd/Jf
	ZGKiCkvfwQrgG6sZjFWcW6SLtQ1wDqnsrU7JCpNZs2NddV/slvrtO9RYWUbIe8mDTo7hgcmVd8ynv
	JyOyFL9nwT6ZZ7B+5ZZxAcdfCCjzlvDo5kNZsjzmDy+jDo/7nErJCEdX6QKfwRn4fR52hc8kTxnek
	csAUYUNUEsBa+Om4W1Rh+HeQ52qB9tpgoOTKeaaQQdnMChTqolIfCzHIJ4SbyB5D7M1TnlKrVszsC
	5SMm13KMRqEHrmn9OhSj0D69KPa4Ivwo+CXxKHck5YtuHNdX6k3bhU8BA7hEmsDgRcGEzDHpiTfD/
	xHR4Wdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBu6-00000007MHc-159L;
	Wed, 12 Feb 2025 12:31:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAxs-00000007BnP-2Ib2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:31:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1148021266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359894; x=1739964694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IY7v4Zi/Fu9rYdLW7DVELcSJJEpH68M/8w+jya2QF0=;
        b=eUOBjiHfdWo9Lz7lz06R/9XpMTIyUnPw/h9arvMBfPV4qvMUnkrhRZ1pOKBUqGaCo0
         Hhe582hR92txGpKw3ACSfph4JQgbnvEZ7HBlQlo5t1s7rbf3E8UhZ0w388msCrbPb/rn
         xsHfzyTDZxGkNwG/GUKyjDz//LYcQybcJ1lI0rFGUozcfaX76NjbKm91iCLLbbokopn7
         qPtbLTUoc4o4FW50eGvnsrt+noeeITOxJ29snSqQNP9w/I8KD0N8BfaK+CVZqmJy3vyr
         erphbz3l3U3Tq8myhKGscVAti+luBm613VtFwu5qxLgyd5wCj+mHIol9R1VN9NvKSx47
         Dt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359894; x=1739964694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IY7v4Zi/Fu9rYdLW7DVELcSJJEpH68M/8w+jya2QF0=;
        b=LZE5E/2dyX9ljQuFusoYfSDlN4N0q8F8lfXcWftywm0AJ8dzB6WqcrZURiEhGkuet3
         0N1uch+/5XOqLuF7GwK81LKUSlWELcZgrwxSpla+845XuFV7RqLWfdLo39eLM8On0TXl
         VByi3aSaCQHISXBD6GzOO6yoThc/KORXLebuQVwsfjUacPyolKJwgB8DsFgClDnCoqpD
         NxNSKVVFBbaw8DLB43p31BaVwUdJEb7lOP8rRpD60NxfCsgiAM6CZL8sneyarBa9zWyZ
         886XHOi52eYM8E4cnHaK77EDtVT6/6sBZqfJiyJwH+TqCVQyjiXujypV5YD/wu1F2Pmk
         yCQA==
X-Forwarded-Encrypted: i=1; AJvYcCXNNWMQ+Y7SInSNkJpZVvEwVfI+E6PN/lsJH3emsMbmmd7qfcWxcxiihkLgFvS1AJdIbfDox5MVZUNi3NVp89Bl@lists.infradead.org
X-Gm-Message-State: AOJu0YyP49EANxrL6ysIvvXoPI25hPtGxVkzIVPxlTLc0Hb8sxexK+rm
	10hsC/kLUcvVv2bVwOspZHxpjAcxULlNwnRaBO+02U6DLwXwxKngBjj3kUjafquZKS0vrTBk15N
	d
X-Gm-Gg: ASbGnctHC5Aq/eKedqvBH7eumcHVaG6TDdtfC23F0/pHQfQpOnT3yjHg2ZOSO97lIwh
	OB0o9tCa5mz9pT9KXQ35niL5gJggTpkxr9D8TnEQXVmJ4J55aiwBbVEnagW4JvHS08laukQaUpT
	115NKAUpOOeu0iTSKq9lnuSEbFQWwQezutJYB9Lr+gVCpjXkDonHVoYkzGpX7KZeblBLBGJa2Q/
	ZB4Yx1TeXuA6dM+VZM7GMKuSfav9+acuXmBxVq5hwm91FX0Je3ZtnbsK/uLjjovF61cxmZpxXd/
	fFIKrL2iXSm9aMlVz6cy
X-Google-Smtp-Source: AGHT+IE8r3Uu976/b0hVMNfiMuo5JA7dISIXfDl7r2E96RTKYYYlUfjyoNpZXPWOU+uynrV2OZsf0Q==
X-Received: by 2002:a17:906:6a0b:b0:ab6:b9a6:a9e6 with SMTP id a640c23a62f3a-ab7f34a11a2mr214687166b.46.1739359894370;
        Wed, 12 Feb 2025 03:31:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7c3aef933sm570929466b.120.2025.02.12.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:31:33 -0800 (PST)
Date: Wed, 12 Feb 2025 14:31:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, kvmarm@lists.linux.dev,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	virtualization@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: kvm: nVHE hyp panic at: __kvm_nvhe_kvm_hyp_handle_sysre
Message-ID: <6b7780ee-6dbe-4e2a-8d7f-4057e83c767e@stanley.mountain>
References: <CA+G9fYt6Cuu6=OO9w80yhJbZB77Q0qf7nzYdvjbgDbgAw6t1jw@mail.gmail.com>
 <8634gku30g.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8634gku30g.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_033136_589130_3E5A85FE 
X-CRM114-Status: GOOD (  13.91  )
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

On Tue, Feb 11, 2025 at 11:36:31AM +0000, Marc Zyngier wrote:
> On Tue, 11 Feb 2025 11:24:06 +0000,
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > 
> > Regression on rk3399-rock-pi-4b while running kvm-unit-tests with
> > nvhe, protected and vhe mode with virtualization enabled.
> 
> I do not buy this. RK3399 only has ARMv8.0 cores, which by definition
> do not have VHE.
> 

The links to the dmesg are at the bottom of the email.  It does seem to
be a RK3399 with ARMv8.0 cores though as you say...

https://lkft.validation.linaro.org/scheduler/job/8117232#L1395

We'll test the patch.

regards,
dan carpenter


