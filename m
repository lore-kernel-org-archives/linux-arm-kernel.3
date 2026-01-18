Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA85C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jA2WQ8d6BTr0aS7jLj7RgtEbZFsRy9udOY7D18i2rQ=; b=0icV3rzftCKCP7+JxBkJa7Uozk
	NiJ7jAKBOVxEUapAHqXdrzQhBlHNn3f+SrF88ugpAz9Y5kUocPS4M/8UjhBwj/kt6P1z93MnLiF+T
	zQ9LAMrCqUj8PNE4vYBQq2X+YIpqF+w9I0lTHiP8BCuCaZOdXl5xXq4QdlsmBaFoV68ZNMjjsgLII
	yK0OF6bLiXtPhJ2d8b0E4JVS9Z1aPmJukZ5Dg/4inl2Qjzc56w94vwcttt5DSMiFSnO91hNKCvHD4
	XXxuhiFudsrB6h4ierY9gEmlpHoNFxsDtjcwRc+TuWqaEMUm2I+4kYpuJnZIr8pEMzOSgLk/eZ4YQ
	XAcEgneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSMk-000000003Jg-2ePq;
	Sun, 18 Jan 2026 12:58:50 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSMi-000000003Iv-2bYc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 12:58:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so2966587f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768741126; x=1769345926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jA2WQ8d6BTr0aS7jLj7RgtEbZFsRy9udOY7D18i2rQ=;
        b=iC/viPXG5feczTTijx+7Mv8oVLcFlfO5culwAas0DDsP+71tUYqGVVAVrh46WsHSjU
         Sl1rbTMMMKbM4Tbj5OBejXce5SpXl8uHmecMeSTI8CaS8V+tCcylFuzDUeyoKxOmezm/
         hDMskxXeDHgjVmkeEtIZtNQSfL6P8/3nJUHvNnTk2TzC6ZhLhfBteC+BKzwNZS+ANMDt
         OAK2V8sw890T55GA/gjJvTT4U59NUssrF2pg6hXlpWEWu1ZNdLMIj7dKIxygURObI8D+
         x4yOrxFaXLyf+TZOOTWP8kMbLrC+MJOr4MvJ88T2XReOj0qK1+1mqc0YMcMuYnc8pRAz
         tf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768741126; x=1769345926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jA2WQ8d6BTr0aS7jLj7RgtEbZFsRy9udOY7D18i2rQ=;
        b=j3O8lS1rbTxN/Xby6tnIWaZVtWZWsCmFyUV+jz+cJT4YzrsuoX+06YIaq2ovID8v4f
         fNf7qlbYXMj1GdD8hi7yckbUUM3t6DFa0WDWRWlOjLspYaLnVd/RMliPSNw+pvUiOohf
         p94Wlo9GjQLlYiLb6n8hEJM/HiYtiBSOS7ec6Cp2inPKTUobP2vDngVVn9KehGxLVE10
         LQn9Izw7AVHakUbdEBcNFk6uQ5UiyKvGw67ow/BPB0h1zfeIxO588BNIVPTrKk+WLkzD
         TYcUATOoGQBzgkJpiUPCnHEaKLKJ/b+WhBQkGlbZVG1qDIoqGnHNxsayJ11O2rLDbX+o
         3QJA==
X-Forwarded-Encrypted: i=1; AJvYcCVZh2cD9hqudXtAf4SqwM2YN9drNgqqF1oAnBdXMbTPrO1uzKyq3XFtdPUQ5r7El/45Hqqs3hRsKCy5s2b//yvD@lists.infradead.org
X-Gm-Message-State: AOJu0YyNyD92EHxbRrlKqMxReisH/sQRdG3dAhqC/IJgINJmLwcslK2L
	xQmvYpvkGbYNmfFv53HuMr/ZoIrB+ZbQnoe9rksDY9YIkEP0nowCeshboXRD1Gx8wnQ=
X-Gm-Gg: AY/fxX6yJqHoYyNO8XYrzo1isEiOsh/rxaEb8AQ/CZ/e0AP+c0ml55aiecl/ukfdTBc
	aUm4YYMFHRfsGR/VjKodbzJTsYR5oxBIhnGOtgZROmoT9jdMF1o7DKqmPCID8NYrR6E/YsQ+Sme
	NGPQjCp9mm3ZSDLvF3gAXSEtrZl9gsSlXpao/anRFBxtiH4Fs7w6h2fCQX0BEY/rMJdRLhIoSFc
	zOkkLWUZAM9KcXakYdDKZZaGE8wMhLuaDbkNd0XKTKCbimbxulv6W9TERWUB8FpDcFn0X+1BBeK
	Ec7/jCbvg3oldq6MhPeRe7D8DhbjWQxe1NrE3+FdJ+N/ArqOTfmL7LhPvDEklCsdg2TDwSrSod8
	IPtiMrDsq+kU8dvBawdJmWEM8QbgeEIV/my+shTzurvS+X/FJ+LvvaFp2odErrplyze9SjlMTEc
	Mqx0xPYtSnqI4Ffzwb
X-Received: by 2002:a05:6000:1861:b0:432:dd71:8f2c with SMTP id ffacd0b85a97d-4356a03321dmr11019244f8f.10.1768741125893;
        Sun, 18 Jan 2026 04:58:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569998240sm16311789f8f.43.2026.01.18.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:58:45 -0800 (PST)
Date: Sun, 18 Jan 2026 15:58:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Felix Gu <gu_0233@qq.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: firmware: arm_scpi: Fix a reference leak on device node
Message-ID: <aWzZAqhGIYIpoalf@stanley.mountain>
References: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
 <9d44f5c6-9197-44ec-b7fe-50c2a686a751@web.de>
 <aWpaOYy6M_wNiMJU@bogus>
 <9438c328-c5be-42c3-b7b0-17dae62fac98@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9438c328-c5be-42c3-b7b0-17dae62fac98@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_045848_702794_82B8A98B 
X-CRM114-Status: UNSURE (   6.79  )
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

Markus, there are real issues to discuss with this patch.  You're
derailing the email thread for no reason.

regards,
dan carpenter

