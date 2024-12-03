Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E85E64A8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDR0YWnLKGpWYxX3gsPfp6VDfdpjHUDFZy8cOfRDBUk=; b=DiXKPcdj8hXUSfxk+sw+xbATse
	z9j/UdFmff2CuAt5ab7NjNHIzZlrNEuXGpmTV0kTGoUsY2wfzv7ISZN5rTiqoE4CATBXaR5EmmoxE
	HevlIstPNjfZCYSEVR/R6iVPPUXFg1+V9gzU6YfbeNb0rlKroUJXVsg3sE0K5w3ktIDnM2cSyngkp
	C4NPfcfxiWAgIFxK7SSt/xzg+B/6fsLAwl9XJ0W44VcPutCuL5CEHi7VZ8IHQICeHiYywiSsThVBq
	R+CcakI4ufrBNihmP5FhR7jgjqMjRAJO4DOoe+StAFqdaHiH+KiW5pmTrtF+6FZb+RmynhHnz+qNG
	66hEUhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISn1-00000009aIp-1ayQ;
	Tue, 03 Dec 2024 13:18:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISea-00000009YaS-3845
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:09:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso50701725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733231362; x=1733836162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YDR0YWnLKGpWYxX3gsPfp6VDfdpjHUDFZy8cOfRDBUk=;
        b=k2d9BilCYjVwvqib00I6DKoXeD3XpWmzuckWR/fl6v/dq0bFEAwpLG8pzlVU7Bs7vy
         fTMe8zFkpi9qbP7mwZ4XR3bCZ8WtqE5yuOijtY+ceVr9rKL/aAA6aJjjBQ5ogppwXvqB
         URFSrVgBkkSG4NelbbDw/lEkAbHRpgs8uDC8BAvfhzAeKN/lpTF4p004QngAFzMM0BKG
         s1PBv6NvmANEej+h8dW/q0LVZudz6U4svKX9XH/iyosfu+Vu4kIR4pF8yaHbQUE10hbc
         Mm5mM4E4VP6j6ST48MzvkukW3Dq/hoJ/vrxMg2lQ6QveNvxpApWPoCTguqiWBKosB1ke
         Kn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231362; x=1733836162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDR0YWnLKGpWYxX3gsPfp6VDfdpjHUDFZy8cOfRDBUk=;
        b=rWCT/qJz54NaMn3i14FYYK+Qd12Sz5WUTDL/evZxi+qk5M9Xgu5+j3RSJ33KbXJkoF
         MiL3kW8mBznEnahgsfpplOkuqyqVvxhrsKaBahBOnCxyFG2BsdiAsSu/YXO49rHPyRTw
         z9qeFxb1Zrj0VzltxefOdRGT+beCJlUl3bY947qC3nnQ6pCjQFRn5lI0q7/Y4n0gLv+V
         HdGYOqAv+RT3Iuvd1E5+159/beamc/Os4HWVlBP+y4i83SGEwGuOlW8xLJVTQgYbQhr0
         l6jM+dByySlygnpIVSDdgZEbKr8KtNeDCov8iqiDNWJWyjtBXh6tlR1szlgc2qoU6q7c
         Vd7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3N0PBn00PLimyRxzgviS06rubCoJYNftfBBF3ztYXTl3ZtJ3pRxLIj9p04xmibHHEkN/1hCwr1q6Z6/TEEMq5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8ReBKiEKEdpjxxb249Wr57QQSSZuMrI0LkP4BVzzWhbzTDl3f
	6i57bRWAPGx8EWurI1GR9y1TtyGP4k0WiFj4H70T9mjcuP2kPJaNkbrrtWux8jo=
X-Gm-Gg: ASbGnctoI1NhSY6SMApe0QiipELcGbCpsfY3ZYErwDWpZ5NmXe3SNOxudP0djLVnf9N
	sWO0COl74CNihOuWQprdiZWQQqUueZvmb8Q4pxFiobv6JIitIJbRT5BF43yvgXOAlofwm+JRfdX
	kAo2a78gsX4AStsSzf/LAfUaSQ51bGJWtrLzUPHbwvkI3jhZROv3VlL6dOoCFM/pTKEuOIrOAm3
	HxjIs+NfVnoTdIU5xvHL1TWLUpZqS8dRt0TOa+QvQ0W+Dh1BPnJjdGGwQ==
X-Google-Smtp-Source: AGHT+IEgjZh4TC8j5dPhQityM39qffPlfEhObsWPGXvaJj36DpzimRcwsGyIcCWZhT//1+YJClpZ4Q==
X-Received: by 2002:a05:600c:4f87:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-434d0a07e55mr21049565e9.24.1733231362310;
        Tue, 03 Dec 2024 05:09:22 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f32589sm193447135e9.28.2024.12.03.05.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:09:21 -0800 (PST)
Message-ID: <dad1bbd4-0eee-480a-8a2a-08157dd609d8@linaro.org>
Date: Tue, 3 Dec 2024 13:09:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for Google
 Tensor SoC
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_050924_778552_753091C0 
X-CRM114-Status: UNSURE (   6.68  )
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


On 12/3/24 1:03 PM, André Draszik wrote:
> Add myself and Tudor as reviewers for the Google Tensor SoC alongside

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

