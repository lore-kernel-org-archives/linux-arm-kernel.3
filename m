Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5460FD6B6AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upSDuC1ThIa1MLUW5v1BgSDrV6IlSUCAGHtCh8ZshGc=; b=RP8KfsGje/GBGUzHxCyhk7ZGFk
	F3MHGNHIzd6YEcALxcoXYChinSIsbL3kL2Ixpd4BKety9FWZ2oWVKxlkMnbXgsj5O4pRRyXDN4VyL
	UCBL/Lo/kS69MjpXeBOZ+rMmA3af7/nGqescYv9yrnVFTAXTpOfhb+JVxqArYfyRf73hu4m/w1D33
	AOHYIbfiWDZofagRMwd5SRnoT5q0tZQDe6FafEhpH7uExghb7BE7p1t8OwdIfxj47VfjGyyOGKvPZ
	W/XWcEiET9v+O8NMK1rvQgW6lE2RN4xwDZo9x0qNrurGrBqOfG0l4vo3RYpfsx2lnHf5qRXm/tm32
	u4H4NB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Bo9-000000016sT-1qvy;
	Wed, 30 Oct 2024 16:44:33 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BmV-000000016fm-10MI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:42:52 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3e606cba08eso47369b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730306569; x=1730911369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=upSDuC1ThIa1MLUW5v1BgSDrV6IlSUCAGHtCh8ZshGc=;
        b=DWzZx/OkKiKCgpde+lLoIg9fdiqjNk7LP2+Ker0N1maL+8jEsvkgoP+FmxBW93XGV2
         ZoecCbHo9gcB8GHDtgR9A1KKUpwxaDQJ/0KXEruJbiQ/uMIb2AHU8c7G6IsX9l8kgBo7
         gWRzF7I2drwFzBv/uR5ut6jCcuY7taQ+RA1UdcU2qWjZ8CuLHLa0ppYOqY8ZJ87OKT5r
         UjjJbzEsn+XpwK/XC0JPRWY8biYJELc4l1F/wFSdGILLbcbzgqYQ+ZrvooIpHZqz16Q7
         3xDQGNLCp0rTCnWZ/A07CHRml67yumTP9MLWxC4/Jt7KOag1KncckzZMMxgqpr7MiPMx
         1fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730306569; x=1730911369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upSDuC1ThIa1MLUW5v1BgSDrV6IlSUCAGHtCh8ZshGc=;
        b=iqf0RevGIIe2vNB/rXojnG0x0dOikKOiHlFVwVR0bRkUWn6auMnIgJ8z/Oj5IsMfXQ
         v+Q8x6V4yTrSiVo0xfxctns0wRmeHacrL0A0XHIOxSCbXjpqScflhCg7Lgyp2VAV3h58
         H6ExnjPaduFWz+M3oRepaDUMKDCcq2+zUCJWKiIOkTMFGju04BF+wV7++89yhdPj8QHj
         upI9PlLpC8m1RX03Ai/ggcuxzpZAv/URsiEHID6Uq+5TXt1ELTeqWDMpx+3r9HjKYnX6
         BWJTTgfIHj4F6KGxTp+LGvky4qa0d3xsgOyq2F9Lh36ht1cxKJYkAZ5JWrAMp3gaFIoS
         l53w==
X-Forwarded-Encrypted: i=1; AJvYcCVWPZsh3DfFrYTfxbZf03hyBQMETxIquCXgvGV0iRE1QKzR1tcuKMjmyx7eJqcfLyk30q+r4rn+k4eKUgdaQotj@lists.infradead.org
X-Gm-Message-State: AOJu0YztqPQuVIpco2OZnVqVuz99Q1JouNYtQK7wsvhmz5vWOPYt7tsf
	uVL5KEdWB/3EEYfNvL7seMxOHKC4aELQjswbe1AtBj/aLkH3Eeuk
X-Google-Smtp-Source: AGHT+IHL1aIqEXulP9B4SfFxolZuQqmmUNNlYSLSaXx4g8iw5vjflDUjFis9TIxnhkRmWiBuQlo1PA==
X-Received: by 2002:a05:6808:30a9:b0:3e6:1473:19d6 with SMTP id 5614622812f47-3e6583bdbcemr4558447b6e.29.1730306569452;
        Wed, 30 Oct 2024 09:42:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d1798a84absm53560346d6.39.2024.10.30.09.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 09:42:47 -0700 (PDT)
Message-ID: <f4142cda-c8e0-48c8-aff3-4dfa942b37fa@gmail.com>
Date: Wed, 30 Oct 2024 09:42:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, johan@kernel.org, ulf.hansson@linaro.org,
 jassisinghbrar@gmail.com, dmitry.baryshkov@linaro.org
Cc: linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 konradybcio@kernel.org, linux-pm@vger.kernel.org, tstrudel@google.com,
 rafael@kernel.org, Johan Hovold <johan+linaro@kernel.org>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20241030125512.2884761-4-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_094251_318899_E041649F 
X-CRM114-Status: UNSURE (   7.99  )
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

On 10/30/24 05:55, Sibi Sankar wrote:
> Duplicate opps reported by buggy SCP firmware currently show up
> as warnings even though the only functional impact is that the
> level/index remain inaccessible. Make it less scary for the end
> user by using dev_info instead, along with FW_BUG tag.
> 
> Suggested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

