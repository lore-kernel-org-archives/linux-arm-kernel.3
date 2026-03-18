Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F6FCD0C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrTjxBzkA8E/8TnT5udli/s694DpyD1FsJpsEGO43Ls=; b=TI6NaQBeKX+3VkZpiPhu4c1eyw
	ounvF1zozhpPIozzyo+4cBe1nOvoRsov3z0kAcGK3WNiuOlq3DbYPd7qRIHlbth57dFm/eLc5w3/9
	aqTp02yNROfmdTd/jM4i8zj6SBYW+g9Cru/HB3uHmHZ/tPaj3JkLb2zpTCBlnBeD+IVyPCA4R5Yz3
	mtLUErKrAs+9zxIe1K17jtS7RG+Jtahs0syZ8m1td3vnQZ0iRClOSYELxaBc4JlCltQo+z1Oj2sP1
	4LYAw4a89B8JK2VeN6kQ2IP0f2vVpq0r+OoshjNKFY07wAOvAHY8WhM0a54eo2ig9Usit5nln2QsG
	0P6Ro73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lBR-00000007uuw-1zzb;
	Wed, 18 Mar 2026 07:19:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lBN-00000007uuY-3Ngd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 07:19:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-482f454be5bso5239175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773818348; x=1774423148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrTjxBzkA8E/8TnT5udli/s694DpyD1FsJpsEGO43Ls=;
        b=lvQ4kzuyYq6HJQmQJUTbfgsraDcWI2xZ71QI3YBvzQgz14MvHVKChgTSXA6hzRWZFS
         hfqH5FdTxCYILNH9/M6aaN320qQjjZDEiSumd1+S9lvvkd9k0isQ1sQB2xq3DTHZ5ZHy
         XETOEkCksUxtzcMUcm9r4sc8w7NH0qfQ7pLNprErEsl5dQPxmbJzOwOVYtGQqKrDsLww
         j2gHha8TQ1TESpbOsNJjJ9CeqSp/XnHzSlefTQu8Y820+MScXLt5WhrIZwKxFWt4YWIZ
         jHaAfc5Ge+P3piWhbb4yqcFQSb6aW2W7IjjibGm+SrDCOxg8jOxSVAMBA2oyrHlUT14b
         ogTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818348; x=1774423148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrTjxBzkA8E/8TnT5udli/s694DpyD1FsJpsEGO43Ls=;
        b=La9aCX8dCVVCxcjlssXJfck1XPYQ81pPmCcjId2trZz/ysmNqllq8z/jvdfQNMvEBR
         eqQtFAKHiWuAJU40AVR1tggmN49gmuQHMNE2Of0Oujnrg7ezjgkTYcdyOkqhTyxy/+JW
         Xx+v3fIAu7Gxhk2l5TIWSugT9U2393qC9mRIZPwkQxxtI5CxosNshMSu53eszbq/vyQo
         eBOAmF1ESsHFdEFRvYtRNNs6faAfAWw1apkx2yut9wHXmeOIjcn5osLVWcwQ2gXhNPOD
         xBzxWUwVFbN+bjwQ35p2cAZ37MVAeIy3hUGaxVbbSzrtGQ5Tn6rrwAUFOgswDubaS7jd
         qGbw==
X-Forwarded-Encrypted: i=1; AJvYcCVMCIgv8K1ftSzqfwoYMkG2pM5TuRUcq8HdpOoM1Z2AirI6h/f6R3UwvFVUfzaNXL315uCkmnNJ7Yg3w82obZRs@lists.infradead.org
X-Gm-Message-State: AOJu0YyamHvBxqdRMs3VBqhPpcVTeta9oMIeUZCPAXVI9N6PLWqEAY1l
	GG6wxl55ljY/myjDurN0PvnSiBGuG+Z9rFXn9pHgc5ixdB0UYiYiObCkf+G7asxu2m8=
X-Gm-Gg: ATEYQzzY/s9JFZXxom1NDI2L4K+KqiIax6ADrT6crWLrjni/NQ2RytBWuXBP3ovnaG/
	XinFDT16UOn4arbzBlXHTPIEMzRY6lgYShpxRGq1komIcfPbRZJ9rYBz5c5JhFQqDSburBM9Jdh
	fyrdtk6H7+kTAXzHO4ZhbrIJF7HzhDEa/S86SngT9aW73Vx5k1vsnqrPDzSRhsjARsOuzCMQkw6
	8kZ9JMbgha5UbKL9t25FEPp3MtNe9Ly0LX7/6YVvD0cRB1zuqpXmlBk/uafwcGWR+/7H8EmuqKu
	xufqhtOeNOu5b1ci8PMrsXGt7nxFCmUulRqKAfOSPRkm5tLP9/LFmoGQtwXIlqxkukhrxgC+BEe
	DXbEfw+Ov1oIRU/Wp3aryEPdfXw64Dw1AjJO7RLBEGu9YhjDn2XLjaXmdh+Olbi5wOZpd+9fjqY
	k8ynvVUKxeYeZClCAUueYSeA944EWl
X-Received: by 2002:a05:600c:c4a4:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-486f40c9015mr31500395e9.14.1773818347740;
        Wed, 18 Mar 2026 00:19:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbcd78sm12200225e9.26.2026.03.18.00.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:19:07 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:19:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <abpR6N6_4JgQTB4M@stanley.mountain>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
 <abl1fPQEDE38KZQN@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abl1fPQEDE38KZQN@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_001909_891555_F5697F7D 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, Mar 17, 2026 at 05:38:36PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 17, 2026 at 05:40:27PM +0300, Dan Carpenter wrote:
> > The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> > reading or writing to the pin.  In SCMI, the parameter is represented by
> > two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> > SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> > PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
> > 
> > Add a function to translate it to either INPUT or OUTPUT depending on
> > whether it is called from a _get or _set() operation.
> 
> In three consecutive patches against the same file you have three (!) different
> prefixes. Please, align with what is being used most in the driver and/or subsystem
> (the driver seems has no consensus with itself, so subsystem then, something like
>  "pinctrl: scmi: ").

Oops.  Crud.  You're right.

regards,
dan carpenter


