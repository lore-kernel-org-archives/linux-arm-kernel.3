Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C98E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 00:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZHQT3+1AXOHwySh7rmIQ56owPwbOS+jVtet/I/oewQ=; b=zTg7lxiJT/0tQ6Cd/FWCIQKKCX
	tNpZCAUC52BycfBC5A/Uvxb2NlIZqILNBf5Nm7hsDTyCCys/FrfAtVP69QxMRY/EFAc4sxVBUU11e
	kxitf9dHR7mq5X1Z++9uPoFEajxfS04Bot5zKDksqV6b+1Ur8lcmH12dbs5E5aY63ApbGGUje0usQ
	CJMRpJDEFl/3/iQXqVpFAFVPypLC3RUahRecSa8xMJtrnlor3Qy4QR508lR7fvL22kohXN462HZ1V
	jnobxX48b/3huGyhKMS2CWLv5pIr48yvjAVSSZbiM4cZhsEfNiA5i0eU/5B2SQGZW4mJEevku64Dt
	BpKFP3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGN6-00000005QWW-3nCR;
	Sat, 14 Dec 2024 00:51:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGM1-00000005QNK-25BL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:49:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso2081256f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734137395; x=1734742195; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZHQT3+1AXOHwySh7rmIQ56owPwbOS+jVtet/I/oewQ=;
        b=oRxVwb8wW4ND6uj2xtlew+MLeQ7WGLgQbEA99hPLbQR7bWZ4atcj42w/tESITV9X4X
         XOpKD/BZTkA2uYkpk0Oow2krklTnrrFkvfS828OEPbjUpzEc9Tobq+5/8rlBpyWLa2hd
         o1f0Y+D2QQEe+SR1jc2/goIBoZ6C94XGyXgMxQhyv3uUA4QaermySXqBpSaOnhSAXlJx
         8kMtb37TM5TU9QW9xAauoefmStZd9PHwO8y342ASiOYRIUQGhIDsAL0Isss5fsVJya3Z
         ardadLgX2y/Z7pChqg1iPTFvRFNL7MYo7bzEK4ZCR2PnQG2/fQk5BJ9Po0k4hE0d6NgN
         /5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137395; x=1734742195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZHQT3+1AXOHwySh7rmIQ56owPwbOS+jVtet/I/oewQ=;
        b=JasZIi5ar4wosC5accqN2EhRDSPpycAa7/hiJeD/k1MgQZzIhhuTJ1TaZKxQJQt2Nw
         lpQru5qwZvYyIvDrxO6f0Yzl2VUs6PYcaZHG6RLgzJxFznK9cGqMFTNjhFsE1jXHwITE
         3lqqi2IKGGGnKm6IbP+LXYuewEVKZd7iRwZ10DnfUAbJlAORlwJrYK36QO2sIjqvxCae
         MfpQ+MGHk7zj5NtiIVjTIuaUfQZVEAv9sJzdIOHBBPEwQFqWm4pssKaKfb4zMweqTKBf
         nb1e9DPryBjgG23ic5LTkJ10aA41ASIslq+UB8dwhr8whxKfEmrtGXhP8yk1lG0TaX53
         Wt0Q==
X-Gm-Message-State: AOJu0Yza4GMB4R68o9RZKLNsEmU/pWbOLC2NM3lllCfJm1nnSRQAxv2j
	CybhfonI0dW22oXSTtJZzYJt4I/b7StFORF5rnGfFx+ljigWLKpYbldgVZvL15c=
X-Gm-Gg: ASbGnctG1P5cXa/VkJjZYUqz/aXNqBbIZBMNi1uAGDNMu1dqjctVUDoySKeFDg1yOgk
	JLtMzwOwEUjdNxNp2BjywP/Zrag3TEzGMwL7mN78hvzxcqXEkP6fs29009QMU2zJXgZ66TQ5DZB
	VKJ+3eGxzwhAxXy0/wY6c8QAoPmo0yNhDVfRQv1q/7wWS6k18S+03F6Om4PlFEK3uQm8Gc3Co7V
	uGg9NJDEPl/8lZOYUr4ZV7az/u5/2ZEQvzON9Ld1S6K4WQ2WAEAqgGgMceqm+gpXtVcbg==
X-Google-Smtp-Source: AGHT+IHGByL+SnFZLh6TJ7bPmNjCMhZaO4qaTKsbRPxcaxQjrB96T87kcly1ELijtAI4mJfcF9Gh8g==
X-Received: by 2002:a5d:5985:0:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-38880ae14c3mr3370858f8f.32.1734137395326;
        Fri, 13 Dec 2024 16:49:55 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80165c5sm995925f8f.25.2024.12.13.16.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:49:54 -0800 (PST)
Message-ID: <08241f60-a6a1-4b69-bdb9-c9b83ec504f3@linaro.org>
Date: Sat, 14 Dec 2024 00:49:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: qcom: camss: Add sc7280 support
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_164957_591670_BBF7AA9B 
X-CRM114-Status: UNSURE (   9.78  )
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

On 06/12/2024 19:18, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> 
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
> sensor. Verified both TPG and IMX577 sensor.
> 
> Used following tools for the sanity check of these changes.
You should state in your cover-letter that you depend on a prior series.

Unfortunately I found a bug in your depends series:

https://lore.kernel.org/linux-arm-msm/1a570c17-c501-4a29-a4f7-020f41563f3d@linaro.org

v9 will have to be gated on that series being fixed.

---
bod

