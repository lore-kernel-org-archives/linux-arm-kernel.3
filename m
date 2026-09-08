Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679BEC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 01:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D8OGQX5ee8v+2YrsPvbA+E8GJJ+MSfRQUQGJHg5BhA=; b=RDwYBR+lT/tQ0ffe7HDEQ2lrmw
	4k3n0UGoGOBtZ02IXvO/MYq+SaKwbQbWjlaZ4pq4F3P7Pw4Ph+ATQc4nmyttsD9PRNZ7YKoMUDvHD
	FjSOfufxKHOvPSK6N5ALtakjWYdHRZMIuuQbJHppJjvqzcJfauuCFOqXxqPUzcqqcMvNXIDc836mq
	zR8TnhiG+diksB7TCPpI2V7GgtvAicOi16tS7qfOOp0CUnBrxFq4o/PEh2d3I/ehTSonuLGANX24l
	m9l1s+FxBBTI5oL8RELsto4jVnrfhUl/kKP09tsM5tjqI8rEZWG817JSZQhnjceNmNQcAKUkBgUcJ
	yGn4pU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kwJ-00000007uDy-2ccG;
	Tue, 08 Sep 2026 01:47:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3kwH-00000007uDe-0avg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 01:47:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-398b3c37877so3739319a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 18:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788832076; x=1789436876; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+D8OGQX5ee8v+2YrsPvbA+E8GJJ+MSfRQUQGJHg5BhA=;
        b=J9CrYekEHkThlzCMoW3RhuatKoI1DqYWUgls3hywV2CcM93Gj1XI8hAyQH/g4uH2Lj
         0QrNRAYDSovrZ5brVUsRpF1/++He5TdJa6ZbcVh76Caygs5hkh5XWP1sADocfQXK2lx7
         P4f0s3yMIX1WXowe631TEvACUOKU5/f+C+N8E94qkcddilBmy28s2wFJkgROl8kiVefR
         CWyeUs8pvRQwT00RJXNsNmBTq22Qy0KCKL8Jw/S8DQTNEGSlgZL51fut16gCFk+4IrGx
         VZjb0HUC5FzE4RddVHoN40ysHEjNzJ0J2f1uuTB+ue+plfss0yAgGF3LdkDxVceQFFK8
         X3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788832076; x=1789436876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D8OGQX5ee8v+2YrsPvbA+E8GJJ+MSfRQUQGJHg5BhA=;
        b=BoI5qDiby7fhXbOkd6MN+5DUakb/n2RrKCzhzdix7LEePhlBFdN3jNtsaCIavjmyw5
         4/UvDa0PL5wa6B/tozBv2OsuTk8jvAfk1IgD2sfaNNOVG13PjchCr4tKjo3iDVRQ/mE1
         pllz3xZMP5UmZEUAHRVTp6k5EoltL4dNh1JS8bhPwdaWG4CdJQ3Xf943qLUeeZpdaE+1
         R0AAFiqjZebs/Vo49kvU/xaMuCC2U6NdjBBvL6/ovi4SOnmAa8wCnO3caVauXSAbwl/a
         Vpy3c6bg5EFwvEa3d64oJFdoQoH3YMSZ7OJxzUzlIQ/F70EdF0WpvB5i/cPfdsTXFN9s
         Wizg==
X-Forwarded-Encrypted: i=1; AKwUvByPAhXB8D6l95tdlSwiwKiU6hjO+LbvxWvsOUmdgbluXy+20qKt+VVEgZkWBube5gnWlg6Oo4dqihz37yaxkPLL@lists.infradead.org
X-Gm-Message-State: AFuF++mmnyxK6v0lRsAM6nKaHgedOkVXmWbBFkem+AMmYNlT1yN0BGaQ
	dcPjNp6bUL9cIOc/RNQr4GYLDYozWffJ17iURMtD1EKcTaDBH+Kfh/2w
X-Gm-Gg: AYBFou1Ex7o0yjiDSfILCzQgnR4kvkfjoMnXBMCNsJYF03VKBtdlKS2ck4uLicoM80/
	QaAEtPD+rfYWAOdCb5FhjyeDJmrMryDESgFIcU3EtGi3IhkYYjpSj9fecWo5hSIwhV3iL9J7g10
	vaye//iWdyPUSnZs3GUDdBXAYoEbsvJ1ZO/3UarSgHy5++IaJSNHyitSE4mr80dG/Pydp0Cm0OH
	su1bd/+Uxvg8/chBgO6PAZdasXYiNlRHFau0eJP03OOsoW+qvV+SiGgq4S8/nVI4+hSTRhvkKyd
	p0x+CvM9nYz/sbPWWrGgdJvxHYInq0o9u/xPAuYhKNopW0rAieYeJ2ADkFl6RRgKcOPLlEYzPGm
	eZgQlQFm8x6kOdM8sepBLvZ8MUxeU2QsG2cwYS4rdt8X0Wkbn/1VDDfkRLQTbqHBuD3rvzTlxfy
	TQXsn7nYCLQ9yEgdy7MtmTTr39eKsVvHmSRXjVHXISxIEHZU4klAZ/5CCapj/NBh1sl8xq9bBXi
	IYvm/Zop7u6M3znLZQwgva4uBj3qLq6wi8d
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr37945657a91.23.1788832075923;
        Mon, 07 Sep 2026 18:47:55 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm23052621a91.11.2026.09.07.18.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 18:47:55 -0700 (PDT)
Message-ID: <3dde0b18-ba6e-466d-94f5-e5ca3ee083e8@gmail.com>
Date: Tue, 8 Sep 2026 09:47:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: arnd@arndb.de, olof@lixom.net, soc@lists.linux.dev, ychuang3@nuvoton.com,
 schung@nuvoton.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_184757_201641_5142211B 
X-CRM114-Status: GOOD (  10.94  )
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

Thanks for the review.

I tested the change and confirmed that an accurate 80 MHz CAN clock can be generated.
I've uploaded v3 with this change included.

regards,
Zi-Yu

Marc Kleine-Budde 於 2026/8/24 下午 06:39 寫道:
> On 08.07.2026 16:24:57, Zi-Yu Chen wrote:
>> Add controller nodes for the four Bosch M_CAN blocks found on the
>> Nuvoton MA35D1 SoC.
>>
>> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
>> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
>> the CAN controllers receive the required input clock for 50MHz operation.
> 
> 50 MHz is an unusual CAN clock frequency. Better use a multiple of 40
> MHz. Within the limits of the m_can IP core, the higher the multiple the
> better.
> 
> regards,
> Marc
> 


