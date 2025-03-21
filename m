Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D74C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 05:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU1uq3ftdFeUBHBrd4FxFBQmvi/x+JX/MfO5OssoYEQ=; b=OCDd3Gr541Rt1JI4kYn+seAaMK
	PFKbxI2AUUf2UgX45MRn4TldVscUNWaP7e0xLSg26xrmEwUC2mVPAj1ATJkEQ9hm7vK7UztMIwYel
	HMcZqzAmuOUYVe9Y5RSr4VVOp0ArKR7ZwSNRfrSP3v22OOrnz5+jPK8V6Pc5Qpq33wXQ89ZW2WfBb
	Dr8iXfLiNT9drpmRX5d19AhVS07KEiKirsY+a+vqkksIGZFHwqFCm7yg3RsbqbOBjkkp6tNNzwg7m
	EL4jCZsx6hyrg2bMnYva0PdL/jcnibi07DI88pQREQSKYLGwe727kbHzqPe+sGndc/XGL+Vd2C+70
	3YyvD7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUVd-0000000Dr80-0dQz;
	Fri, 21 Mar 2025 05:01:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUTt-0000000Dqqe-2fNQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 04:59:42 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso2162606a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 21:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742533181; x=1743137981; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jU1uq3ftdFeUBHBrd4FxFBQmvi/x+JX/MfO5OssoYEQ=;
        b=g3LdDs0nt7QSk6qCXm+fJQ+1xH0VEHT7ifls4Px1hcX5R7swzViOuP+K9Ek5mFD4Nn
         I/97/AmTK6DnEC+jQLkIoQ+HEYGSQDhg23CdWvJUZj73OCOKFdTqy7U0RV6EfPkbMJbc
         BTLbah1zLhVeOPO5sOZ8rMJiTj3x3YJhvi3FDZNQZm5oh6iAtq7xpBPwbpjRY+VgpJfy
         uXlZQmGPeIrSblNKWhlML8slcpMjja4ggJy8oo9PAdzAKk8sSOsNNhI+85DudoMXruW8
         7QMYDTDstGtkEEmz3QAAI2L+hhhce8M1RQ2A7AdXvwg3GjRM9/x/SfXxmPFI/R0jY+vz
         rhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742533181; x=1743137981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jU1uq3ftdFeUBHBrd4FxFBQmvi/x+JX/MfO5OssoYEQ=;
        b=UdnqQLY142b4DU31C8IyP58jWINceoTD02TY1pHkHmzMqan6g2dqK7Yki6xVe5gAzK
         pjQLYXoof3N9IbTDrumP8tm4Qr3DN9Geixbv7U3WwUVD/SfW5JOLZXXNj1OW0UiN6BBB
         Z/+m1AAYzN9eg/mLc8CwK1kVNXhDc9FfD9pBfAABSTTRWDdgwobHi6n66mFqz1QqqeJI
         0ZbW6KdNuuHbNKDtdAbCiOuMOlm+XVqcCiW1mBf+c1v6QvvhCSv1GwaenE3eGqu+S9/o
         FN82SAfsxSanQ/8L/e3Ups72nMK+JCgHGQEPwQzDcy6VHKEBEOaPcGnsjyTUaal3a3mV
         bwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhWJjS4drhkyXYaOQW/b93ch76m1TIzA667ngVRDh/KqRWIqq2yJ6vKBvgmlEdRHjGrKCK/eaaKajpmEQoZ6O3@lists.infradead.org
X-Gm-Message-State: AOJu0YwintUPFhXpZuA1eUny17sR5Hoyep07MJVLX3up3iuFKhWpEP2C
	Osi3pq1VuCZAh16cQJDvcT7/Td4a85eoLLpORvWhrPoetaj75suvR+KTqdfZbXc=
X-Gm-Gg: ASbGncshqnop2hq/udInBNIyffQNEkFlqWmmOHTSv5GfuVP1F5qc5DnN4fMTBdeo+zX
	StNNxLcavoK7dq9DNOIf/sniURezyop8Dm5h4FhhUfJ5ct7VODzNXGCOxot8oyqA0RDTT+NJana
	zpfXvtAPXa/Yh4l7JqRIPPCyaoqlnqEG7tfTpUhjm3a7kuLlozWvtQDFphJS05PwNRZZdQs5++R
	uSGAnrEA+zfHej352i39LFAg7awRCBOK2lXzIIurOJoNYsLilwOei/8KbZeEEqyWkVayg2H7QX5
	LOnSaaKdVKmOKOPgKvw3D64JxrVHveizxkLAlBn+JnPDxQ==
X-Google-Smtp-Source: AGHT+IE1MkhF+eIlYdPjXH6Mh2gvQg0KSwaX+hGGWKTe/5F0qYgaHVHgqtmttCIIq/1Wqtv32WWi0A==
X-Received: by 2002:a17:90b:3912:b0:2fa:e9b:33b3 with SMTP id 98e67ed59e1d1-3030fe56ae6mr2439451a91.6.1742533180745;
        Thu, 20 Mar 2025 21:59:40 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf59e2desm4949374a91.23.2025.03.20.21.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 21:59:40 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:29:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 2/3] cpufreq: mediatek: Add CPUFREQ_ASYNC_NOTIFICATION
 flag
Message-ID: <20250321045938.6gnmtlbdcx2i6gmw@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-3-chun-jen.tseng@mediatek.com>
 <20250219054543.4xt4tixsauwoqpst@vireshk-i7>
 <21e1b622c2968a5549b2ff37e4ba329a557968b6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21e1b622c2968a5549b2ff37e4ba329a557968b6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_215941_674184_534D71DD 
X-CRM114-Status: UNSURE (   8.79  )
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

On 20-03-25, 08:34, Chun-Jen Tseng (曾俊仁) wrote:
> For CCI and ARMPLL in different driver, I need to change ARMPLL first
> then use cpufreq notify CCI driver. it can avoid CCI driver get wrong
> ARMPLL frequency and choose WRONG frequency.

That flag is only required if mtk_cpufreq_set_target() isn't able to complete
the freq transition. Which isn't the case here. I don't think your patch is
correct.

-- 
viresh

