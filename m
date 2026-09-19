Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B4CC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 08:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=; b=CvAe8uCvjK8hueUjIhpwitogs1
	OzDPoyA2shcZbCdsKdyFfOzn3y3CToi8Y+4wtw/k4nJ8z4xW6w1Uig2YQT4xb5G6zqEgEWYwGPFlr
	anMrO3Up7bKM6o4YHtbfFK5thCAUKpNESply95Li9pbgqZ65AtfXoMSx8hRTpz4MIK0Of8qqmxh1v
	qVklcKzYeG7vCZ+yWSgJDk1XAPZ8BQzoHS490pNnPNeBCsug3x9zTJH4Vxgf6nwso0hwTZuZRPyMF
	fMtZEOZGoagjOFpuvUytWRWgfukINpuBp3I73sdovjWMzK9qw5OT8bErsHfZyMXXzUxC0Q4UJcAWf
	bbn4iQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7q7F-0000000G5dx-0DL3;
	Sat, 19 Sep 2026 08:08:09 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7q7C-0000000G5dd-2wLt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 08:08:07 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d3920so9931325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805284; x=1790410084; darn=lists.infradead.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
        b=IwduXu+krVfystGG6wM8h0OrWE6zNDzP4y/rnI3Pzh0SFPsqaB3+yceh6STGAaLp+Z
         bLekCk/p8KueQF0cMUDtNFc/5A1jBYoCy3OkNVf0Odt7ZhqV/X6Rndg5+caufY0qEYU3
         KOBMppaNRNGEqTmKaUieMZm5y/daU6mn6UMCMFmrrfkVV147D2gizBaPyGR9dtih+8xy
         sNrtFghumrAk9TqKA4xh5/AwS/vn2YV3sj2i+jrAhJ/2qHc4CJr+Bfre9teT85NZLE2C
         H/dm06his3tXyI2/Mc+fHfX9XP5rsxzKWrFMgm1pBA/F9sQ+VorF/CL6Yj4I7LwLGckg
         zUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805284; x=1790410084;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KjWyzKuaaX0JxsXON6XUrK35hFIu+f/5shI6BNSQdA=;
        b=mWX0HZGx4OX39VbiUiD+xq9oYjo/3+Mdxk0RDHbxUCFsbVgWkDOFhQvGJ3wS35Evgq
         tRhBarHUUbdCQ4VDPnKglonwr/IXVp7h23MtNY3CEwEZ8mU/S3yGdukPPoIko3xAWl/H
         gTzieU56LtvAcnoZXszQchrZOVvXdpe4PFS1Y8nCJeY8pGPDYSmey4+YeIjkSCEdk/8F
         a0F/2tQRrZjf/CyS0QM56yjiaF0lUEjC3C9E6Xp94KFlYXEmcdXPIcFvgC9SBfWNFvGo
         mrabsI76pnimuAHs6nn9DgPBMbZUx4U6uFCMeVUc8qo1enHpaLos/Ab5sc10HKUQrR51
         zSNw==
X-Forwarded-Encrypted: i=1; AKwUvBw45MA55yDIJyiWJTWOJf1g3uOlB5Gmo9NtPZtoZcyr3rkLLT5Cct1PWUSajPf/iunTAVkTmD+p8EiXeyZFibjI@lists.infradead.org
X-Gm-Message-State: AFuF++la4M/lh+qY5uW2l7wY2ydnmUY02lEhWEHw5KX9xdqLVKMVOsaa
	T/8qWsg+QlhpIiaj0jyZDWjxpahynuaRcv5amhspYbRile8HuwSshb5I
X-Gm-Gg: AYBFou3pwqVbjxbuwNgrcJI+/Gx0yTH3pLWgvyBBDgG0wP0cJSNYvxA2UjZuhYkD7C6
	VVVdo1uv52yHvkT5GDaaopGDgxyLS8WvvEhbMJBV+L9UilSAZuyf2r0aBB2JaKPbAqFsIu1ofIe
	SA23s5Sd6z9votxuV1MQvRwUglG4IvFe40cuNsjsOaCekmhonc99FvcASz2iXUUBioAmtx6qsUU
	ZP51rUWM1BdaywN8abxS2LPN9ZGJBlWUpxa0OfQzzKdnaCx5IQmKBFOGNPtWBR85zKzZzTI+xFm
	CYA2Lu3xIVZ9IGrpqPg11QIwN935e4J2GroWFbRjckmv6iuoZcA83DqAY/PIi+jEWLB3CztGQ1w
	n3Wt6J4OY5c7gjgZcd+bmhf/NJmQrQEJKLeaJJ1O+YfkvyUAzgL8PYP72XQAVXq4ZUe265TMDI7
	SpdhFwklr1pkRk118p/v4+KhBYd3Js3mUdQvok85AVKI8nkI2Evg5EG6qwsqGCjyXvWNfT7WgOm
	GaS6bgVVyrOag3Py1drSe+oWBVUQQ==
X-Received: by 2002:a05:600c:3e06:b0:49e:8238:6feb with SMTP id 5b1f17b1804b1-49fc56daf07mr69617635e9.14.1789805284421;
        Sat, 19 Sep 2026 01:08:04 -0700 (PDT)
Received: from localhost ([176.220.97.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229e0sm4504980f8f.4.2026.09.19.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 01:08:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 11:07:37 +0300
Message-Id: <DLJ50GBWD392.55LXSSAFNR9X@gmail.com>
From: "Omer PALA" <palaomer100@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Omer PALA"
 <palaomer100@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Michal Simek" <michal.simek@amd.com>, "open
 list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
X-Mailer: aerc 0.21.0
References: <20260918194434.9240-1-palaomer100@gmail.com>
 <20260918203257.6034-1-palaomer100@gmail.com>
 <b787a787-5011-4f14-9332-4cca098b374d@kernel.org>
In-Reply-To: <b787a787-5011-4f14-9332-4cca098b374d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_010806_747243_0906D704 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

I assure you this binding patch was written manually by me.

That was my third DT Schema i have ever written.

I used ai to understand the structure of dt schemas and i wrote this
myself.

My intention was to add the Devicetree binding for xlnx,xadc devices.
I apologize if the YAML schema structure or formatting violates current
dtschema conventions.

Please go ahead and drop this patch for now.

Best regards,
Omer PALA

