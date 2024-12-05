Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1114FE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8UuJPAg4uzKsmRkl80xAfQvVQX+ZS1np+zrvtyOjdU=; b=KV60DLef+/zLNlRNhPPHn7dSpB
	q2fWqRhOkyKuPkQo/jS/sReptW/rHNdZZcrFo73Vg/jQhDd9AjHFm7UsQRKBw4uf3mbBdbUhzyx5G
	V/pLFvMA0yIPAlU6nR7x476TnhTYop/KEMdWdI05SJKqcpVLtKLsj2y6/dABKLfRfQIL6La7pj+4z
	d+L/s71S1HoyGIUukNIx+Ll+6qtBI6Oif3978YGfoJyis3p2RTjKCWwtMfLG1qLHyH+eSRz1wjFfZ
	RXrnXdyTzkU0loy2x/mwexRMdz9/ejdgCVtMz122K6Gh+BzvJZi6PdHLU7dLXbvno+YKW01HRbBGK
	Mq39VCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Yw-0000000FQRl-0D1J;
	Thu, 05 Dec 2024 09:54:22 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Xu-0000000FQND-2rZm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:53:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385d6e36de7so626409f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733392397; x=1733997197; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8UuJPAg4uzKsmRkl80xAfQvVQX+ZS1np+zrvtyOjdU=;
        b=sgFV+7PhPnGoBmknRBG9rBfB0aMFDmNAYdu3IvKEcIWZY6GUBkcvVMgYMKRkvdEgTv
         PIwQJSQMzSeiVxh2D2uhM1PSS1wTSRD9BWxfx1vlNTQOOPJ9pbaKDwJQfpX9QmzDD3yj
         09u9/fWvGrT4NlCSrFNu6vLO4wk6SUr8dffL8ns/7FwG5JW4e1yIX1NQo0j45zS5nh3t
         sCxL2WCSERP2l/Hn71wD78D+biR/Tg/lB4zniKokUyXrkFPvdFyu9LHjLHy3PaBjIMkN
         dEzTkIXIjheq8f7t8+w58xjBsVK+t2+kIfNMK9wMGCZK/SOZqkJma05zPoKR87WU0GqQ
         SfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733392397; x=1733997197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8UuJPAg4uzKsmRkl80xAfQvVQX+ZS1np+zrvtyOjdU=;
        b=JQv0+kU0CEFuCrekpqHy+FdpqbzB263S6CHUTa0oA5h48JZO5L6hhRiIwk8flmmVCk
         oTTxsn3vFzx/l5GjnX0ZjfPZGn+xAQbhzJtlo2HfAZ0qf0961j0bSwL3SK1Z9Zem9AhB
         38oN+eEPTfC/GWwEcE3OjiSw5GlDJpIlKPFUMtgi6jltrQUF0W4Q4/rHO0saXz0ayaXg
         5PdD3T3jTnWRP6rto43/ZyK5cWOy0B98yqczSIdQk5CmvnVnTFSpqWgYoDkcIcslxldf
         0Dov4REc7IX76KR9GIzxE312BmKoCZe9l4ie1X5y0ZS+lmTHYN0soLOyZNo0iD+eyXEP
         Kksg==
X-Gm-Message-State: AOJu0Yya3/lXDb41L+5S9yhQtC+gKeTHvbtGflZNR1gnk/9PtcCKGB9d
	Vch+xBskH5/nW8Tb5rPJW91feGHv99Btzvz5CEvUUXC519UOnsMaIO7u3hr62As=
X-Gm-Gg: ASbGncu1N6EM4wHo+7hu9xDz2dkjxZPXWQH+8NG0vXRI1vg1QfxDWpRCgnaLv7AJQPV
	cKiOSqAXEMkibBUj7YXJL4UxtZrqlKKjxAX02WFpCMOkhHe3ZoVDro8FE4lwx/FYiplpIsTeF51
	nKGLNMm7Xor/5y2LNS3BynNQNKblT127+u7PnLay7FtTtyJq+UCEYFktWX6fPGQNsLjuSlNGvKh
	QKjc58Ja8XI+hEmpVJ8kWlLmUnhrYoWub6caL2C9bhtUpRhyAZ7Y42UMEnD6tg=
X-Google-Smtp-Source: AGHT+IEVsK2hb41ndk08DsAN+R8x9yzNiSD3Xnxn/d42LtoWyp9X9Q3Lvp8+NitADR+4PPEFGgGGsA==
X-Received: by 2002:a05:6000:4009:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-385fd43556bmr9734740f8f.38.1733392397068;
        Thu, 05 Dec 2024 01:53:17 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4087sm1529194f8f.5.2024.12.05.01.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:53:16 -0800 (PST)
Message-ID: <02a2660f-b577-42b5-9c3d-4fb0429d8c67@linaro.org>
Date: Thu, 5 Dec 2024 09:53:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241204100003.300123-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_015318_747719_64C26E2F 
X-CRM114-Status: UNSURE (   5.78  )
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

On 04/12/2024 09:59, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

