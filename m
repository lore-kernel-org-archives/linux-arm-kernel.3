Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A78CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ2IHJqYxmFCyCy0y/0mCJBJ621zTHkH62ufit0bSyQ=; b=Zj3cRdD7cL5+gNaWW75YO5l6Nj
	M1Mhd9NGpHP6ptvrS3LOOnMRov827fGTt/mXtcgNJS0xMszrRNm8mOD5DT5bzCYzHp6Dyb/vsL9rP
	Va9pOsTfPBJqBBxhTlsoA3+onOBBwVLu5kJtFIy0ylt7A8AqPymrAX3l8fwUh57C8HY1s37idMaqx
	mZFtuNJY1c46LpcDQjwhjgtD7mhgASrjChmMRSyRMU+EWt1U0iupbyqO3yoe3OAg9FyHUw6f70hOp
	f4w6SiFRQrpvj6M+iB09eh0WHGCw8oLUCc3KCStc+ADNaqCm6rV5rDWM0NZGyDCd7sUAOfNgeKtZG
	HXD5fnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkN4-00000005G25-0OCh;
	Wed, 20 May 2026 17:06:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkN0-00000005G0v-0Uv5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:06:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so55371795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 10:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779296768; x=1779901568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ2IHJqYxmFCyCy0y/0mCJBJ621zTHkH62ufit0bSyQ=;
        b=kT4cKNi9X1iodDoA+OU2G7xzebTz4ZfmlhFhIQQCp+07+iFSBlX4tfd8h1/+fCZ4ME
         lbVieAO+kI08eb35oYJX7IYsnRNJtmGg7PpOJTdG1EkjTJVof0Uq3FLIWobnC1Y4BX2S
         E4aBV8zGhXYNg1iAFG0OQRZdqF8e2YJQeBbLfySyBWs7EDjgQoM8ebS3xEk2o9ZX6GTO
         XTk1lsZWTWhB/HnU5stdMLmLaN7KFanlTRMPtrcU1almrCXMHrJYQ0EiZDibyiyRWLJC
         dnntuQCDHwsoh/r0qwlbaK4kszUyITcHEPC/GhgzqxIeV7cHrwG1GAbJUTOWdIY8v3/D
         Yk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779296768; x=1779901568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJ2IHJqYxmFCyCy0y/0mCJBJ621zTHkH62ufit0bSyQ=;
        b=XRbM2v8Ss7Usc9wW3CEHfHOwtJfDu5TgoXsX+gmoTGk6nGEhKNFuDBX4+zyI7EoLU9
         c8MegsKiwwMXxBPzhxnR1t96l0eZoVibe6VGXgsoEKM9dGYb37gjewJ+ph23qMhC+mKi
         ZxZiYNfhabLquczZn7YKzSVvhRLaZEZGPZpfjcIxu82XLBeediWuQKYCXlsV98yfVJyL
         sz3r4LeKMSycjAcwkAx6c4JoKCgOPTi8iAMOYW6slXqzf/9c+FnJOreo/893yU2Dt+52
         w0IGNNilVhv+yUMJ91yz5HqBsU49ouQcWVTBWJsIH62eR8hwHW0pmMv3ZPwRImG8ESvv
         8bCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zD3um3/Ild/CZZ2bJb7K++T5lUcz9YBSg4WjMLdRaLfWcQL66ktyrq7NbYubtwYVuSCckUTRLZz4+YvYk5LFR@lists.infradead.org
X-Gm-Message-State: AOJu0YydjcvmcmySnV5MfG0KPirVyJDRvbJ26yFFvzTJDuAX4GDpyKGI
	8573L2JmQAfi18IXtXlxOAALUez1afzUqKV170b3/8tjSUDr5cRvhCtBAXDMdw79FrY=
X-Gm-Gg: Acq92OELNb3ZZ1sg4+yBLsfpINMi6AMxtfWy9P8gL60pBmWT/Mr6gk84GRjUJ3N3AF6
	d1nk2Gd0NMACff8l8BdxXEqM/AGDfao0MaIVyS6+t9PITau51YD7o0uHALl7Cr93tj/Wl6IrPXp
	T8z/9FNCGHcm9im38uRx9YnZxafe5fxkppyQiatbs1TMlr0UJsgn0IV8oj73OC2i0xAhfYnzNwS
	8HOMfGcnE5VSxr1sUWY+6GfDdVInZc7MYO9rChmHqMldgBL4pKDTa5SGnjSFGVeGp0G5GJkRAvR
	3dpa2nq9zYu50x5wYdQ6xNcbS8Rjqmwuvth13K0Z/Vl7C2z9AcOJ64a+WOpAl/fysnz5aClm+OS
	CeiwZfN4L3xTexjHWDd4EnaXREbJunCdCpTkBJimq8Gm1YU9AJawQZ4SQ6XhDWtr1qiKm3VKJGx
	W7m+v3c2jbDmVHlGbOvU1fytzRHrjWkAg=
X-Received: by 2002:a05:600c:46cf:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-48fe66267eemr368182925e9.28.1779296767731;
        Wed, 20 May 2026 10:06:07 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d5f21dsm5156135e9.13.2026.05.20.10.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 10:06:07 -0700 (PDT)
Message-ID: <3d0ef4a0-f943-444b-acc3-6d44e690fa16@linaro.org>
Date: Wed, 20 May 2026 20:06:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Remove error print for
 devm_add_action_or_reset()
To: Waqar Hameed <waqar.hameed@axis.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@axis.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <pnd34a6m7tc.a.out@axis.com> <pnd7bx2j2pi.a.out@axis.com>
 <pndjysynn55.a.out@axis.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <pndjysynn55.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_100610_181387_759C746C 
X-CRM114-Status: GOOD (  12.49  )
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



On 5/20/26 5:58 PM, Waqar Hameed wrote:
> On Fri, Oct 10, 2025 at 15:39 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:
> 
>> On Tue, Aug 05, 2025 at 11:33 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:
> 
> [...]
> 
>> Friendly ping incoming!
> 
> Friendly ping 2 incoming!
> 
> This will be the last ping for the original patch [1]. I'll interpret
> the silence as a NACK (though it would preferable to get an explicit

The patch is fine, I think it just slipped through the cracks:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> one...). All other patches in the previous patch series has been merged
> [2].
> 
> [1] https://lore.kernel.org/all/pnd34a6m7tc.a.out@axis.com/
> [2] https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/
> 


