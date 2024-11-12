Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBA0D41D5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e90Eas/uN+CMCjttr3SXpKE5ydwUVfeG05npd83rlog=; b=w5Ok0t2+aHNpJTNmcEe27ijGkl
	XO5s/mvS5nGSztstxEyM9pIzPsYuvYLEji+wDMPTnllqPZyDE9fVhdaj1Io876eiuaT2sOHaLGLiz
	pB4+m8ew/ivZ1uim0Ddz63+yfJt5K/HE59hIxQWzpeq6ehA4/blelK3hO3KBdJv1JwZthpx47m3oz
	zYB1//Hm5l1DUbOk3dBE6x2Z32nU8AAhAGDYkr8A7Mllu428Gjth0+FB8RSbRI9O2V0ZIbLqpXPVp
	4rJQDjj8yHxLAm20RZIlP6PNyM2Xj8pe91jqn0+PsCGJo3WJMnPMrtipLbiDx7cpHfei1zEDlG+aJ
	+iC1BWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkzP-00000002Pjv-3sDq;
	Tue, 12 Nov 2024 07:07:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAktw-00000002Ojr-2PlR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:01:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d4ba20075so3553463f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 23:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731394882; x=1731999682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e90Eas/uN+CMCjttr3SXpKE5ydwUVfeG05npd83rlog=;
        b=S3qp/WfNxeAo14FDjVX2mdMT/1cCFf7/C+dvC7pPhcq7BDKrBGVdJn+v3UvrMdcOxt
         E+pbyZtcsfPy6igJwAlYHycySpeRryV89JMEtx5EuKdJnd2yV+3dA8aenhnsVGgv7UwV
         dS0vdXSiz7SiadqCrWJnRo3OyTfb+Vt3z22EWD9VlfzkaseybuPt0UaBY7MwswEcZkQJ
         C+FvT/CczxvuZzA6ujNowcxZXkoVYa4vtieqr6znZUSS5rDP7WOeLX2AxbiinAVpT6Vi
         9xGa24a9mENVBFsWmpK7zG6EGCuVRRNKB92YMFLJEdmXnDpB8Olx9IDHAynCuKgcSkPC
         WO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731394882; x=1731999682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e90Eas/uN+CMCjttr3SXpKE5ydwUVfeG05npd83rlog=;
        b=h808Wwu2PC+PzATPNCUxw7is7oCmu+bGxibiHgm4b7AN6sPxYaoJALuj5dPJl4+mfe
         QLi40WArX8zt4Mwz7AaOdz9fs0o9SH1Uq1l8u6hqc3C3r3HM8OXELnwkSGFgxjE1UeTW
         jQb/XalAtrVXpTalyd5EtsqjmmxQA1G2Y5kglGwQ/Sd2wxT6e1+oTCpu+pdzkicIL7vj
         1f+bKE2jBgD35KvnuPqrhzJ7Ett5HnrNcwGpVGiB1AxbtNlxxC9Z2PRc3xua3Sn8REtB
         M5mayAE7m7lewSQQDYGXgkrog9UlLh3Hu1FrRjf+bRXrtDf1L+x9SKkkHiYmSVP1JD/j
         dYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf3bpUESEA57oPozzXQMZ2C1v/gDvrE/dmq1v1swOHZrF4HRwO5ZdPI2vvzoAX7GI5FKxWzg+HLjJhRbxn9ppS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4IunF6jQuJlgnobM3Ljxb8ckfQE84FAXqi+mPsWcIgK1Vx7zI
	H8t4lhUYWq4n26t3LeTBPD4vWA67UUvOQRsnJhYPTZb8PJlmUXPoVWSRvStHvdA=
X-Google-Smtp-Source: AGHT+IGzjqCewg7v6LJsuluGeAw1t5n9E9T4ICaCzkpdT98/eoBBrmLzKDxDD8P1qsH+agtyBhgBiQ==
X-Received: by 2002:a05:6000:1ace:b0:37c:d11f:c591 with SMTP id ffacd0b85a97d-381f172a8d1mr13824302f8f.17.1731394882338;
        Mon, 11 Nov 2024 23:01:22 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8dfbsm14807593f8f.73.2024.11.11.23.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 23:01:21 -0800 (PST)
Message-ID: <7d5dcd4e-967c-4627-92d5-86232492c7e3@linaro.org>
Date: Tue, 12 Nov 2024 07:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 2/2] mtd: spi-nor: support vcc-supply regulator
To: Pratyush Yadav <pratyush@kernel.org>
Cc: peng.fan@oss.nxp.com, m.felsch@pengutronix.de, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
References: <20241029102238.44673-1-tudor.ambarus@linaro.org>
 <20241029102238.44673-2-tudor.ambarus@linaro.org>
 <mafs0zfm57tsy.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0zfm57tsy.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_230124_660202_4F2C1DB7 
X-CRM114-Status: GOOD (  10.72  )
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



On 11/11/24 2:02 PM, Pratyush Yadav wrote:
> On Tue, Oct 29 2024, Tudor Ambarus wrote:
> 
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> SPI NOR flashes needs power supply to work properly. The power supply
>> maybe software controllable per board design. So add the support
>> for an vcc-supply regulator.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>> [ta: move devm_regulator_get_enable() to spi_nor_probe(). Add local dev
>> variable to avoid dereferences.]
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> 

thanks, Pratyush. I sent a v5 here, where I introduce the temporary
variable to struct device in its dedicated patch. Would you mind adding
the R-b tag there?
https://lore.kernel.org/linux-mtd/20241111111946.9048-1-tudor.ambarus@linaro.org/

btw, I try to keep patchwork in sync, so you can see the status of
patches there as well:

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=&state=&q=spi-nor&archive=&delegate=

Thanks!

