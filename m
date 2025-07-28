Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C83C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEuv/0OvcRGSMGgwve29GQ++Tx/D6BPMSmiHsxXgsyA=; b=gN7hVe1dXdK/ZLhZWxCgncRrm2
	0FDlhuPuQBa6OrZ7tSnpiRKJrbx5x+3NNhXSsVgXwSpQiyGxs/fsiC2T0zOZPjGvAQYOBxzXaBQh/
	6KNpBWGhNh8gBJm0UNU1BsvgoAcj0hlpzqIVh2xQFfoWRmZXKDN/hzyRU3eu+OJH+9+ldRhwQjCdc
	XJGxvQnKAcGwhjFMlEfzZH01Gwbf140Ca0p0unkCNKph+qLgUtCeaLs/xMmwjmRTOAgBETF6mneW3
	glTqn6oPEmJ6hdrkPEwKzG8EYxLylz+9WwmhiluEXjcsfwE4hrEVQCLxraZuUMvTvqMOM5XD7SVnn
	lcX+xdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOmz-0000000EfYD-10HT;
	Mon, 28 Jul 2025 14:25:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOdv-0000000Edzc-2Wtp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 14:15:56 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so9202179a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712154; x=1754316954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEuv/0OvcRGSMGgwve29GQ++Tx/D6BPMSmiHsxXgsyA=;
        b=fkg+cH9J2YXCqI4VPw8+M4Age/WkQZfM+FSD+vckY87OV4L2AucSrx0F9+SXbsk52y
         YljQMj+HiAZ0nEN1twp7zcMVa9wrjV+FT1D5TVtywSZRmm9HVa+QRLjTluaL1HUsItaP
         JUQiJc/jjjUrxU9/SemLZlSTEh1liY1TcrJvc0rOtxHU4KZD9cJSm+EbEuMey3L1kolD
         dPFlCndhlzmdSK195F1F3HL3UtGKmgmurQhhZnBfrYHcHz0IUabacrz+I1u/Ysxftirs
         ItB2uXw9RByG4Qih865pFOxLyUvHN5pKTHeQFkBrrUFWCfRRKucZEUb3OehlbzW8h/kq
         lCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712154; x=1754316954;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEuv/0OvcRGSMGgwve29GQ++Tx/D6BPMSmiHsxXgsyA=;
        b=DwOHa9NcqsYBLwkZk6gb3vKlXSbK0bAwl4uo4EQGGCoPArAMvqAGKoRrkWBrwgkSIh
         1Wa+9OnRderxJrMNHxw3nUj0R4lIBoKhyJWrbPh7z3f9rbNH1Br3n+MH/X4K4EBclssU
         qTgTmu7nbWlsOzasygTi1NrCaXiNPM4Fjvga2GdM73rk3Ayw5G/lXNsdoTYzuMneuFbl
         VW4nxNIw7qF08Lkt7Ip10spLNs8vr5tFBgT6Kacr5MAfVch7jAnBPHZfG8+x2g+coOvm
         a/i9uTcuyBXgpMAXVbOAoib05vAQpeD9jX5X8WCcpAg0AaBMocozISs4nVJF5/pYNldF
         J3DA==
X-Gm-Message-State: AOJu0Yzd7s42W1GfvrLleMChbRaQDBeXtfWDRca4rR8xWGgYtaQCaN91
	9VfqM9gAycWmaPa5B9yWR5ty9UF6nSqhSUG14bqPO7J8xT11YKc5UA1IZ0DMblaYhZA=
X-Gm-Gg: ASbGncsVsfYAnuBJiw/7JGk4eKTPQHuAMfvA3nFvkMl6oXxKaYJsd7bk06RtKGoSwW+
	It7HCpfiR2s7WKRRm+LXHXxTE/E0MKjN2OVeu6vGT/prxhGtG2gOqVkITmtBbAK6Q1pG1bnBzVP
	GxSX5Eg/ZPvkEc0AlwbW3QzPCYKwCmN/HsZBV0e8iUuRQh/RbBsmpeJjvh6TcaLr/U/NIQk+ZE7
	jgKvsmILlLRZJDC27AXRd6/3XF8c16GcGmHvg6Wkb8WXpkK/SMG/S+DKikdxDix5ymnWH6AdI+o
	IkIpYP1qRzXcK4F5p2op3lFtoNzrGUPg8L6rGWhs5uJ7V0O9GKlMNhi2QQgTImdlelysF1dMrS6
	KxNcQofKRqCY3q83rCVL2rmqlAb0Al2m8e8+WqmfjRmVQwGKy15G02QD4LSG5X7M1HcE3+0FHcg
	==
X-Google-Smtp-Source: AGHT+IEbup0WGzQKdd/SdReGqdXO/wPA2vfo/bvQOhQ0kc3j2Opi6K31loxxw0o1vQUzbFcAu0y+0A==
X-Received: by 2002:a17:907:7216:b0:af4:20f2:2dcb with SMTP id a640c23a62f3a-af4c242b969mr1664623966b.9.1753712153796;
        Mon, 28 Jul 2025 07:15:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63589c8ffsm419726066b.34.2025.07.28.07.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:15:53 -0700 (PDT)
Message-ID: <48d78f51-c094-46b4-a9af-91a9d855e296@linaro.org>
Date: Mon, 28 Jul 2025 15:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] media: qcom: camss: Add support for CSIPHY QCS8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-7-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-7-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_071555_649558_1E3B6C6F 
X-CRM114-Status: UNSURE (   7.15  )
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

On 11/07/2025 14:11, Vikram Sharma wrote:
> Add support for CSIPHY found on QCS8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Give the commit log a bit of love here.

Please add more text.

---
bod

