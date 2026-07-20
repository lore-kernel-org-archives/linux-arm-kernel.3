Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F8C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRPQsRwj+n1ng0H+WDG2QV9LkRG40/jMmpAbf3NOmNY=; b=rhWhLqimfAADH6nj0kBEYmVFdC
	uhboasSITc1fw+SD92myTj80VJ+BzkmLYV6zRRq7bXds2Ps3QbrbUk8YT8sX0Dm/3fRXdl0HNcJRV
	6mYxj19tkJPWK+JgRYfOXDZ64oEJvgFyxzBMYoi/YG9yY9jSMX2S4n/spgWYtnk+S3VCG77RL7QOC
	0oaJL0u6DaYIpFJL/LcjIq/kvJBwk8HXUI19oTVMQdTgxzGWx67+EgALeHXxVNeTx2t6ky8Uj1/n5
	XFmQQHfRaLMX5VHPWTQ8yB6MmLyi4PsiYJbvbGaj6xpIxyw4fSXsp0Qn1qcZhwPc4M9XCR8xsRbS4
	93zCrrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpDQ-000000071Bz-3ryX;
	Mon, 20 Jul 2026 14:43:32 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpDO-000000071BP-1rmQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:43:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so6342026a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558609; x=1785163409; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRPQsRwj+n1ng0H+WDG2QV9LkRG40/jMmpAbf3NOmNY=;
        b=nsY6Opra+kipU2otEQZIDsgIetR2Glu3Zbt3UQ+thKxpUIAaVlM3E3DsMlIeWWNYz9
         8Wur1N1XKP++N+SZ1kt/YStVYt8D05YfBImP6Gozw6zwDugQAYHZIQhFdjGkrQcA/pL+
         ELGovIWFQcYq21UbXK3cf8JS5ghXoc4LTnWJOav1NF1f5MzdGFj//c17g3SyjTLQCi6Q
         PG7bgFMfjnb1/8UWUqfYaBf429jCTNMRtHqDTAyRfoCFIF1Pp9Eh0zhbkRqPV9istvJq
         vTGB60KKsLH+PX7E2mJfC8hM0gwTcIxPW+6B4LOJx+CAJT8trLqHXM5ss7w9iihrNNKR
         fjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558609; x=1785163409;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YRPQsRwj+n1ng0H+WDG2QV9LkRG40/jMmpAbf3NOmNY=;
        b=e6EdLeTJJFlemNRuJsgxn98XPePQSlZ04y8ZK0HMu7EUYmzS1mOC/LW7kcO585oJeK
         J1wVw1wAVjVgbDC5JZcojOq0u5sjr/qjTpjOq6Nr/RWqQbVdiCP8RQtetc6Dnz7aAI8H
         DC0QALf5I+OYfv5oj5wK3oZY8n4+CbdHSllc0HU3A7mjFCVpLr1/iSZ+YEg3aBKxgEov
         bzWk58cEXEzuf0S4ysKRoXaKUwfC9BWSPeIBUu88it6Y0tZK/DNjibfL1tm62v8564uE
         d/GeNtEg3hRUqhKeqsyilLeozPt2iV+w/E3SI7mQzQ0siTuMp5vy/XAycd9o/0lrvSUO
         1PSg==
X-Forwarded-Encrypted: i=1; AHgh+RqrnV84LG8oWTx8/kVwY8Ji7CcgYARidzILja3uTF3wYfD85TwmI/qINYJBDClPOITuRTfp1ZFWbGZ4UgDHHC0h@lists.infradead.org
X-Gm-Message-State: AOJu0YwZDjhILezIHMzzccL1SA4+erWUDaHamo78suOlBRR61Eq9ZnJE
	C9ZdKk0flnMQW61/T0eq85TynI88ptKYppBLTfesum1n8JKngcUorx2/
X-Gm-Gg: AfdE7cltaqsXtUXjWeiz6J8qKj7XjJSvKLvllu8L5DqYIYEc/pR152XudA+rR+OCFbK
	gyYAFBkIAyB3M/CrLckchtsIrJr2mFx9MAyt9G8RfJ4iF2Mx2+MqQWXyvOOH4YlCWj05zaRg9Qr
	JJbugRnWDa70DzL5x5dBz/OutJw7Z661q4Kajsk8QbVlVvX/4eXioeaiesC0E3PO8z9gubcD5oH
	wVw9Kiht9PYigqLWnO/6RL/+D5959raUY8uHbZBWRDQuB1OVPXxH31enJs7sCCld5hWwwIUNXui
	A7nZ6++MZMs37ZAS3kATtce3DF0viKoz7Bc+OvUUdM3mRtrkLFP4Cu5SrERZdWJrIFotD4/NdVi
	6xsfd0mLLpqkBIRTrdMmgSs+3EroJaYfAEIND/SK34j1AP0/upn/SDZXDscinuYiG6p0Y48SzaS
	xl8oB2yz9TfEIF85lZI5dztQyC6VRTfft7riNMUn2EquE/b1Bx7cU=
X-Received: by 2002:a05:6a21:3981:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c3ad9646afmr16051848637.49.1784558608970;
        Mon, 20 Jul 2026 07:43:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm35894013eec.2.2026.07.20.07.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:43:28 -0700 (PDT)
Message-ID: <612e3496-2917-4d4c-8794-69c3b5b27c5c@roeck-us.net>
Date: Mon, 20 Jul 2026 07:43:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
 Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Brian Masney <bmasney@redhat.com>, David Lechner <dlechner@baylibre.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Pavel Machek <pavel@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
 <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yanteng Si <si.yanteng@linux.dev>,
 arm-scmi@vger.kernel.org,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
 <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_074330_486833_EEBFD666 
X-CRM114-Status: GOOD (  20.28  )
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

On 7/14/26 06:16, Ulf Hansson wrote:
> On Thu, Jul 9, 2026 at 5:56 PM Cristian Marussi
> <cristian.marussi@arm.com> wrote:
>>
>> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
>>> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
>>> SCMI server from different architectures than ARM that's why remove
>>> ARM/ARM64 Kconfig dependency with also remove ARM from description and
>>> rename folder to reflect it.
>>
>> While I understand dropping the dependency on ARM (I always wanted to do
>> that and test if it worked at all on some otehr archs with QEMU), I am
>> not sure about the whole renaming party ? why is needed just for
>> cosmetic reasons ? it is at the end an arm originated protocol so I dont
>> see it as a being wrong to be named as such even though used by other
>> archs...I have not really strong opinion on this...
> 
> This is certainly not my call to make, but I have to admit that I
> fully agree with the above.
> 
> Usually we don't rename files that indicate a legacy platform name,
> just because a new company/platform wants to make use of it.
> 

I agree.

Guenter


