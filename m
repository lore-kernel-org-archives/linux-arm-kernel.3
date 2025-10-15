Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CA4CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X93ngL5NMyRYdgDq3leVhpEnsjXz8ZNeGovlsQr2X3w=; b=JM/UIyu+fzBlhe66VTrfpFKr+j
	ey0npRlkNGYTyBcsF9TjzPB+YGrOCCjjTl/Fk6HW3HV/JFZ2uSpzV6BOTfNuiXzOYG5Yr2KQoEIHf
	da4wi4bJOeYxCFbOo3QRWA7/OcBBVoeOi7hvkbVMPXgOTTLWvPVuvrq0IacJw/07v4VUtd52cioCj
	mlUkV9yzUQ/HyeYBsoOGLXp8uye3OsKoLjHLG+KS4HK877JxvQtpsh+3YyodLnoSFy8wtt2/zS1FW
	AJpC12Xmyofkyh+qeRPtla7cvg0/tiKrckrk7Jq6f7SaxF6pQ/ipXa8UyhT/Ae56GBSNj/Es/jUfl
	p0R4vMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97dO-00000002o3u-1eG4;
	Wed, 15 Oct 2025 19:58:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97dL-00000002o3C-3FEd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 19:58:05 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so12312599a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 12:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760558282; x=1761163082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X93ngL5NMyRYdgDq3leVhpEnsjXz8ZNeGovlsQr2X3w=;
        b=sL+AS9hd61w2400UebobYYKbT7h22WAWJYk0ZNgjUdv5NSbuCfOCp8lBip2pwUReID
         WkCIV9KulKMy0/fOhV6gKX+kq+RHatHxCy0O9N/37d1jlcgDHHzjikoL5CkXn8+E/3NB
         V1tivYJSV7sq1wvOGda3gObreQTYqaJ7RMax2CHTVaxz7y/cQ1sMVKjKqEUsDqnhgaVE
         zzAC+ciZbUR88ly9kuaao2NgX26DdT12FvBCNemymqojQx6GQT+pBPvXy4r9w/YBkdnj
         tG6JHo5KlTj+wz4vhln7QlX0Nj+xwzHKth+kE+XQpE4gQHjIzTQ55D3b3CXX/6VlmhfO
         M49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558282; x=1761163082;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X93ngL5NMyRYdgDq3leVhpEnsjXz8ZNeGovlsQr2X3w=;
        b=tUteZHkQsbnDvYBkmkUWXA9cPuINoGmumIoGqRUmoRWVr4ePDQIt/Jt6fLuhs7ScR6
         mi/vgi7+8jfS1ewNitYAbYw+7F2grn3IlnolNGmebPfymaUKjaELgRMwe8l+d1RQGimo
         ZWh0IlbtfqCeKvGvI8QClA7JQzfVSpv0b3VkgHKq+INFCnFBlXZsC0GIGDPChCAzf7mv
         MRe4Ec03pVxl56Q7FemMNYZyR52wYDmdtCD/CSVG0h3mrtvl3HhkpGBqma/0o3BOlalw
         SsR337U/rM/ATApVPKB5BQWAOBh+KW/XG3aHbxWlh4DBIhYZ7TDRAJxoPO4y5VCcuO6z
         7wKg==
X-Gm-Message-State: AOJu0YxzdWG+OzdpJOU4Jfvf5Xz2kE6ngEFmymtLDX8IxIakQuC7mpgJ
	EYjodeMc/MnSHDtevun1vQbF0CtRA72xF6LyL/IM6+WM0LzEA9coiHVGKEbVG5PgF6s=
X-Gm-Gg: ASbGnctys27Lg+ET51QK490XE9hJHXLc8m3KUXs7NjOb6nDOojzuZhnzjB0eP/muZSW
	MsnslX9whlGvP8XB6KVCtjKNZXF0sr3MrH0KIz24l6SFHVP0GUJS3PrMdKMX4UkfLslIqhwGFGR
	QAbN/2xKp//lmwnyyg/XpvLTqjJY/61DZnpWPRFul+ea32bp8fYkEzQV77QXptzA4fR3jOkFGkl
	Fx3OvLtXavG/7lnNNptPMQcGQQoX3NmAgTWI4zpGr+R0IzHyCH+Jg0DUwnYfL/WAbm4q5btlw7q
	F28upoj9J0Ve1sKzmt1vDMEv8QzY8NHGhpM39gMM6mx3PeiOMg53SKZbdPcAcOy6sUrJ1T8BwCb
	EwgKQuiqT5GD4R++LppdH/doAauS667E1KpQ0/8km2DVIo+udAIt+KAJmhIyTyD0xwNPMucPfVk
	8/vjFziAtDeUrShXrrwK6vzQ==
X-Google-Smtp-Source: AGHT+IHf2Th1L2XYSlYRjMvRiaQwEPPv0rm4KoRAruPpObpOgoCaczpFuMinqPxSmwcgVKfFpOWD/w==
X-Received: by 2002:a05:6402:23c9:b0:634:c03f:c605 with SMTP id 4fb4d7f45d1cf-639d5c75dbfmr27308818a12.36.1760558282021;
        Wed, 15 Oct 2025 12:58:02 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b71443sm13887338a12.26.2025.10.15.12.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:58:01 -0700 (PDT)
Message-ID: <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
Date: Wed, 15 Oct 2025 20:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_125803_819140_D8D5DAB9 
X-CRM114-Status: UNSURE (   7.71  )
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

On 15/10/2025 19:49, Vladimir Zapolskiy wrote:
>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +            power-domain-names = "top";
> 
> 'power-domain-names' property is redundant, since there is just one 
> power domain.

Its a required property of the yaml.

---
bod

