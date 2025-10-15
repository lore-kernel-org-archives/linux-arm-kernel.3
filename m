Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A78CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEscpRiAZP09a2JQp/IONW4mb8MPlVCjQKLrshEfpIA=; b=CfmEskgfNpCaoQtLrqsCAncQwW
	QtVHGf6VEUr7sEQssmfiDSKASCdZxo9ZKPAhfoC81kFQpUwaetGz8pR8U9L+AQn1GSexe4gLWKEIG
	A87dE2AiG0QhTrDpq/vxm0TtIy7REVFVJkSLuoehkj+tMxc0bdf7O1ndpvpyns4OSu0mOZ8+D0lK5
	vj9UcO4ekvTb8JD+DpF4YiriDGpwiE4dq7SzGzeRFO1ipzwyEUB/rZ8jH7glQBUMfV6vn4k9Eqaj8
	7dGZm9vxtt/Or02ZhPEJWlHQbrIb+V8rExvoElhCtv/bx8Ko+dRT4PZ5bLIDNIiuXX3k6ARfvwj08
	eU0h96dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95rw-00000002VIe-3wuC;
	Wed, 15 Oct 2025 18:05:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95ru-00000002VIH-3b0f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:05:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-77f5d497692so8345380b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760551498; x=1761156298; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEscpRiAZP09a2JQp/IONW4mb8MPlVCjQKLrshEfpIA=;
        b=UsiVtTpLzK4VwWH7hJaHkD+leZBIb/4KKhTkeKJrFOwoLZ/OaCcr5p6XQ1eA9DyPz9
         OlVE7Jsm22YDgzp27r6EaDGpMeg6cFWIHi+eLMkBQt1e/e7TvGwMQvWY4KxGJ7Z1GL6r
         /URXYr1nXAJjBMZSNlGaQoBRmWQCRXII7AK8mfGtkY5OOQZcWjBt3KQ0xkiFaFdABo7w
         jp0pk/nLtPSQS+3ymephD3WVUHuuAAITW6fV0oZF7ldm601n87iaomN+/eZ06dn7kYGV
         uPNquOPE8UVBMYR5rd86mUlKi9xabCFCi+8+FVV4hUAYfajmsPugAkwjxubPzxCqqL7t
         c22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760551498; x=1761156298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEscpRiAZP09a2JQp/IONW4mb8MPlVCjQKLrshEfpIA=;
        b=MvGevF5BIQK9wRY2w26b+kSioflXD0rjaAgqFAGhFBqoSBxo21Mih0oy1hXci3ZmmO
         okgB6r//Mx810xGahgQIiF+HlLCyWI82aAtb5nfYAAEq+h6A+YpTRpc3cEwXG1bp5NCZ
         Lfq7RDpdU9sSl+acHFMPaV7002p06+98NdKw/+IROxOSi4qrKZgr5awBze66ygzprHzk
         7YLN36ONPMUoKmAvwIY35yGRAM1UmG/ghZL4+/T9TJEuDViyoX0GTkil/DKDS0LV2sg3
         RSP8jZZftbHaeQe4rD0o2gW1HV2Vp56+Z6kAnEefxdP+8XMYRzb/O/9OiS5KeSXw+l/1
         BQHg==
X-Gm-Message-State: AOJu0YyuGMxgr7gNiRn1WPgr98uuYQaIN9+Rc3UOWS5mVS5riUMWvmbj
	pQCVKuCJnqJ5Lo7MSpTHnXXlblYGE7bUK2eimceEeDGBoBhpxoymeiGS
X-Gm-Gg: ASbGnctfz/3IRJuCEon8+ShuNpIVvfr4KRU/V4g4jNIAmy6TE0eneSdXxfn9L90YgQL
	zSS3zLr8n3Ylpe6HrLeiJTK6z/jQKCne2WKLlUQJdHqiQaSjq5Fr6j67PKWWewdGK8ifjcSTE9O
	kevfkPdgLWdR5c5qOPF5eWnD0oeFquE3kl4JV5zLfMTzjUh8LwfZUQyrjNV7yS1Qf/IOrOH2AgA
	2vUHxCANCqVicWiT2hlgf28DCcK1eBEkIMiYyIUuCNnINAB6rSYf8YSDlmS7F9VXprJYZmKiyJx
	ls34nOUz0NkeCYe4Ao7QUdzRT+EpgvnGfaUf4kRoRCTiT8JDG2lqD0dRPPxAVBLB5QrRajZcRmw
	kb61N7PFeuOICD9W/dGgnsWeIhtbKR32QEtiQ8xNiWuPqLcmpd4E/7dgQau2yKcwz
X-Google-Smtp-Source: AGHT+IE3JywhTW/hBqgapIqK/3OTonypN3JXftjp40udV4Uca3H7ZxC7Dvrc/BK+cWjLzKDvb/Bqww==
X-Received: by 2002:a05:6a20:729c:b0:2f3:f59b:3ae6 with SMTP id adf61e73a8af0-32da80c2d32mr37829511637.11.1760551497771;
        Wed, 15 Oct 2025 11:04:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b7bbc7sm252011a12.22.2025.10.15.11.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:04:57 -0700 (PDT)
Date: Wed, 15 Oct 2025 11:04:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (scmi) Enable sensors to assure they can be read
Message-ID: <9191914e-9bd3-4760-a6d7-74c858ea1984@roeck-us.net>
References: <20251015114953.148706-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015114953.148706-1-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_110458_915638_5ED04056 
X-CRM114-Status: GOOD (  10.64  )
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

On Wed, Oct 15, 2025 at 01:49:28PM +0200, Marek Vasut wrote:
> The SCMI specification states that SENSOR_CONFIG_SET is used to
> enable/disable the sensors. The sensors can be disabled by default,
> which is the case at least on NXP i.MX95. Explicitly trigger the
> SENSOR_CONFIG_SET to enable the sensors, otherwise sensor read may
> fail and won't return valid data.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied.

Thanks,
Guenter

