Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8FDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 23:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0B0q4BGZ2XC9IpC6Pjd+pwzTY4I/KdNTGZZcgGIVD2s=; b=MxaaSingOvqJMQtLllTNMoql91
	jnoPK1sRRygcra49RV2fyJTzhC98+3dMptqMcNCnHGjnvx1r7DNTjVJFfoL3D2RzUSJKi/C/9hsZy
	t2202f0m3Q4c0WTYXMAPDAhYDULOl8slYPaF9PtCW8mmQKK7Vntv/2eMdQFi8py0BTlrXAkr5JSQc
	DQ1mBpEoPcv4z5rSnZtwd7lKdOU1YJ3PhlhyLhxMUREdyfZYGiCJFYWyzXek1oC/1Ft/aN6bUSBzQ
	hTPV7s3lkTK1eWFhyRvIj8Nl8auoRjQ00Z1aj6v57aqW7xtkAqvl/z24Oihgg8/+OpTM580LwroOF
	JncHqebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9AoH-000000034h7-28cT;
	Wed, 15 Oct 2025 23:21:33 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9AoF-000000034gd-1a26
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 23:21:32 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-36bd4bea485so15841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760570489; x=1761175289; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B0q4BGZ2XC9IpC6Pjd+pwzTY4I/KdNTGZZcgGIVD2s=;
        b=JC2OFKokQQ/KNwnyJUuSWCEOZMWZhARr9qDn0eDWLW2KIytNIhoq1n+WjQeqyJk3nO
         hkIv1IpUmag46kFbA1GRW9tMoPGe9fIUrZY1F0qm6Yy7UYrPtZyMdL8i1BKDnXzSM3ST
         ybcWzhUYMtD+ALOdtfaG5DcklOFrgvYTnGvwJkBxoKTIisI2B0jPXgYz4x9kUJBHLbsj
         /4i7YeqJkAW6FREh1LAAjY3ayQAK/ekuaU0Cs5dRsIb1TRWmPmp4WLcEuEJu0N5Edpl8
         eLnZ46LKQbIpq6PiJn4Kz0D/AEKHb8r4YN3njtDtegP2xnlolWbbyhZjwWnl81xx79x5
         HVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760570489; x=1761175289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B0q4BGZ2XC9IpC6Pjd+pwzTY4I/KdNTGZZcgGIVD2s=;
        b=r3A9G+qOjWG60Mn4APX0GWDhQXIu3nubqZfJTIWBTTvYaimxOePKpi9zpnxthOavpo
         3O5WZO7iqRYoHjkalWAB0cluEF7VaWhKJZR1ORkzCdA2bFo5WRnAZpvL/pet7YyzIKIw
         t7qoWvNEWCQzQqdhmypWwIYDB4Ai/Puak0vveDhjwtdrAYdYeYrSwDLzOA3DUVGYJdB9
         4bNLEovL8eB6ioMXbbVC/wuHERa1ZleIjCNiuU83k1zFlfIchlZuzNWE8o4ssK5QrdNE
         Wi5ioaF5MuIrG8vJQoiZYnL3EcCpUEnXmD/qc0ydkODd9M+MdLo5LnGDSrPUTVTd596C
         outQ==
X-Gm-Message-State: AOJu0YzjVMR4gpW/pEgOK3Z/RiVU7AB1+Kz7m9sHMb/huXsZpUsxgxXB
	KigEQbDvs2cONIM7UZliqIM0rRYG1U96iXTerIH9LfdVAEaX6W8lXxbUzee5lA7wPAw=
X-Gm-Gg: ASbGncsSUcU4bNfrLnPT62bs5OeBm6pImch8elZyTaRlCBPIUzS1PejzTdRDID013Dv
	3n4AuPA8IOHGdGEaLQEGtR5a5T7E0//f7Hy7zt7SO0ZwupSrWoK4RMfxlphn6T376vv19b8GhL7
	0bR+WJmWdtKIF1gti96NzWVvAS9Vm99S/5oGXB+DzXAxkGK53A83G4IucRzAyKR58pjlNZ6bDQ6
	iamvj0tIp9BrDSty1eJHgKQ0AKqw0lfOa6KiiUJeL3uMJDh4ZODoN7/URRMRVsdrqh5TSBzKvUX
	a7dHe7r9wDODkTMO57rrJKiY1YdfLkyhHoZgcwX6r8N3ONPQLcpu9zEXN7b4c/8B4SO9lcctZUY
	GVuRYheM2srFxgpRMymovEdcUsR3Mx1en0jT0jSKR3pOntozzJUKw/HVvZnbOBs7GFR5XlhlEIm
	cVA1u1KfJpBgkMsmIpvUjzRoMzlVZQDzHRwebylvOmBipj7e/lL7HfIexyoF0=
X-Google-Smtp-Source: AGHT+IFsezevTFX7VRsMPmvaC7e3rUHL6zRBQobMDgZpbCMrsMUto/Rrsx7K6ihOpaTOS8S2VJhQLA==
X-Received: by 2002:a2e:a543:0:b0:372:79e8:ea7f with SMTP id 38308e7fff4ca-37779707285mr8426581fa.7.1760570489271;
        Wed, 15 Oct 2025 16:21:29 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ca04sm51213281fa.4.2025.10.15.16.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 16:21:28 -0700 (PDT)
Message-ID: <47b4dc34-ae75-437f-84ce-84558226cdeb@linaro.org>
Date: Thu, 16 Oct 2025 02:21:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ca8189d0-a518-4716-8b28-e36571cbba5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_162131_580349_54FC13EA 
X-CRM114-Status: GOOD (  11.25  )
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

On 10/15/25 22:58, Bryan O'Donoghue wrote:
> On 15/10/2025 19:49, Vladimir Zapolskiy wrote:
>>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>>> +            power-domain-names = "top";
>>
>> 'power-domain-names' property is redundant, since there is just one
>> power domain.
> 
> Its a required property of the yaml.
> 

Technically it is not a property of the yaml, but I think I understand
what you mean here.

As usual since there is no users of the previously written device tree
node rules, I believe the documentation is still flexible to be updated
to a better shape.

-- 
Best wishes,
Vladimir

