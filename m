Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 20:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXreAV2ANUNLXOCGHNmgwnuxR6Y0ADaUa6Mv3KQ5Clk=; b=hSQqCqxChX2ehcE2mPApvZ5PRz
	xFc65WTF4lH7UTDqVqv19mvVb2USOvwK/+A6j5OoYsoy26gI4NrSNV2ZqfUPiNtKHusTuW4QaJtMo
	dd1IQd1HUFIuys2zkGnqkf6DllfNGkyfRvB7o/cVPTa4m8yCHZ12p856r7A2WbvbtLnnkCsVqkFh/
	5qoCz4nnbPULjeLM0wTOWzJoIgMXvgICn5i1mBAXnQ72//2t62HtcXcB6iAWPdRqtB1z+uoz0MgIq
	BIYSBQrPdpaMIJWSIWsuHlmLP+xMd4amZNeSb2lHH7LVJi9BcSAjkOs67W25PHjXJ5UjROsqJTbnI
	Ng4MIVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudsu-000000073My-1703;
	Tue, 18 Mar 2025 20:50:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tudrD-0000000736u-06Kf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 20:48:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-399676b7c41so1669502f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742330893; x=1742935693; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SXreAV2ANUNLXOCGHNmgwnuxR6Y0ADaUa6Mv3KQ5Clk=;
        b=GD9k211zC1QmfEjgfMjGlz8xp3RA11ib5Cq5K/x88wqLFDy+YM22URlTQi+zRFke+f
         8FNVg8xeQglRjtoWWilMrOYh3M0lTc7t3tU92xdZZlQTTcjnSwtJHWUCIT0nmFUVGbIJ
         KcVT00tG0pTaLIWlLK+e5dEsR3W1YHvvyL2+DCTMXY/i1qjcfrYJ5M7M1+ADOUgCSN4V
         dXqx5DRkA8RbM8MvL70V7mZTQNLAKU0K4TO/0qh8tIuv4kuGNQsIEASNpdKhKni1/uMy
         QS5xUElCye6rh5vxt3caF5O/d2QUMFPQBvWPD6xZypFdfx26+IN7oO320NRFuTKRmHOf
         7vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742330893; x=1742935693;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXreAV2ANUNLXOCGHNmgwnuxR6Y0ADaUa6Mv3KQ5Clk=;
        b=mBNfXdvHqVun5BKUIG0suQ9K56gtcDGKO0sXSw2WB06ZQS6DHypEL26AhWtqrEEkzP
         NKoKdcvzPbdEi4nblpAqu6ZetlfTLiHgMqcCUcfczQuDsungBrLMLAzgG2EVfPoqITY6
         jUu2RkQCSecm/q3UWc9jS6QWq9461e1GjpX2ZidHcZHsDTU84SVAwi2c35adwCWci+BP
         dIPhHKBHKQRn9gsuDbsDNv68nCBmPV/VkGmBq/kMnhjJHtBbE3hXFHE3yLt3Pshocpw3
         WFUXvE4L3W00yTHb6MSIg2scWl1jeAts60eS1okbxRc4ZAwbHNwGw3OLE41Bpl+00dz3
         1yUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOcfOKIwiKKTfn9khXjuApe750CJjz6XL38kCojf4EYF+Jm00vQScmccQVqT9h8RiRHWeU9rbcy0e/QvHH0KXj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvq469lSH5jkCKcUPBoKGL1JUMWpYN4o1frQRgZCkhD6UuZ9tJ
	BaRI/dSXhIaLDnafRveq3nnAwsWBdbHag3jGB/Okq7KKD2pQa2rt0QG9c26x2dq6gJj8WbxNHdG
	e
X-Gm-Gg: ASbGncvPHjyTe4mJs1Rms1Fs3cumx0FcW+R1E47AT8p4F0CP2hX+EIfyqYRMkcyxgFr
	WgyHGzmBHhdXHMo9hvK0b4N72bF1Xjl+Pd+UDeAdF4wktQJE7khA4Ybs6hnz9QevIgSiE2cwOCD
	byva/MwdvW0DhPmeDaiX40W3aXN/5FoR58uxmBOn5Zzkgruh32ISTmOD17vlpK/XpzlacMzZjk9
	M4aOiX/LuT2IC6Mi86dTf3QpwnruRjESq3q1uUn11tdp9DJLQ3vIrqDVRSxuQ5dK5wxp54AYrTk
	l9MDvnUF1xC63Aw+WKYgyK2zjZybfnpumSVFRhvgzwBKxEZn
X-Google-Smtp-Source: AGHT+IGFPGJRCtLFFy23VSE/m+QckBBrVhU9c3ZgD9sj7uRUJ9l394Djfqcd3htbbBE+Wcpd5jsTmg==
X-Received: by 2002:a05:6000:1448:b0:38f:3c01:fb1f with SMTP id ffacd0b85a97d-399739cb086mr153384f8f.30.1742330893184;
        Tue, 18 Mar 2025 13:48:13 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe294b5sm144621675e9.21.2025.03.18.13.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:48:12 -0700 (PDT)
Message-ID: <632522cbc66e456f3b12e884c6c140b38e101aa6.camel@linaro.org>
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error
 on boot
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Tue, 18 Mar 2025 20:48:11 +0000
In-Reply-To: <d2e162cd-b12b-47e2-9190-2ecce3489b9c@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
	 <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
	 <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
	 <d2e162cd-b12b-47e2-9190-2ecce3489b9c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_134815_065407_CD71A6E2 
X-CRM114-Status: GOOD (  16.33  )
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

On Mon, 2025-03-17 at 10:48 +0000, Tudor Ambarus wrote:
>=20
>=20
> On 3/17/25 10:26 AM, Tudor Ambarus wrote:
> >=20
> >=20
> > On 3/14/25 4:40 PM, Andr=C3=A9 Draszik wrote:
> > > This driver emits error messages when client drivers are trying to ge=
t
> > > an interface handle to this driver here before this driver has
> > > completed _probe().
> > >=20
> > > Given this driver returns -EPROBE_DEFER in that case, this is not an
> > > error and shouldn't be emitted to the log, so just remove them.
> > >=20
> > > Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>=20
> I see you kept the error message though for of_find_device_by_node()
> failure. You either get rid of that too, or maybe transform all to dev_db=
g?

Thanks Tudor. Seems I missed that, I'll remove it, too.


Cheers,
A.

