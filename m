Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A6CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2QdJEetTz7G8fczLPIsJNR1ytZ7zxdk7c3bXt/pSJY=; b=SKRHUA/NS83VedP702qcLYVdyY
	1A6g/7kFnE1NylElYQF5wG+uytDXME30sDg9TW2bIcpzCVive3RkDuLaTytfmoVl51fbmVInHadBY
	cy2RAIQ8sRPkP4cuZiROyy0Za63IF9WquhPZTTGf4WFhqKT/LQJ3d/QyaQxNxGtYPXjxTf3+Mpyd1
	MkZarzlwgPvrsch4adNL4bx7GVD8G9VPrQOrcs88kg8J2xWZmaz0ovotdYtxEpixnCO4FdddT0aXB
	S1lFJVSYiGav42vwdm//xYmXp8VvIPUz194bKSvXRnVDip6t5uCO8TDHsrG1jiraQxDrA1qd1on+i
	jJK4ur/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OGL-00000004uy3-2hZa;
	Thu, 16 Oct 2025 13:43:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OGI-00000004uwS-2aBU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 13:43:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4060b4b1200so689476f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622200; x=1761227000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2QdJEetTz7G8fczLPIsJNR1ytZ7zxdk7c3bXt/pSJY=;
        b=xxNk7Ivr5wysD9sCpJMe/4UL07yUSF+rw9t9FinPTkFiHnHivpqzQHgwSPIvvV/wjO
         awUtPu0VV4mnkuNnik2DGyAq8V5tFrXq5N9YhUsK/VJEJbNQ9C6HC5RnY6WqNzBQNspF
         vVMnj4ePGiLlpNy/h4qdOns5WiRvjQmI0UTuSMBmgEVnPdtIQHleWDks6QXqOsY4GMP+
         9lvldqCMtHzHWKpcuLNe6EefrHv8Rt70XpCuCL0zxCFvd6DI1aPjdmvQbUCavB6GpVG9
         I59vAkT0RnmIMvHx8hqARcKPHwCQWEUNnIDFpdzigScRISU5+d+KNNQMWiZa9KBRQ2L7
         hVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622200; x=1761227000;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2QdJEetTz7G8fczLPIsJNR1ytZ7zxdk7c3bXt/pSJY=;
        b=eScifCISz3gg8avffQ+qbWO7EB0eDnCy+4KzJX9uQBtUC/SC+Bd1gVdTtT1oPpDex3
         X3mCQ9aRZ55TVJviz5NokxK0Aj+Df38i/yVWIzPyYh9SgjSSnC/8nEeuvTlY+9cJpNPN
         FDBARkyT7CrWKSP/PCbIvmGXD/3sNxcJ6MHlop+jSiXlUCIeGrgLzqojtQWCLBKl/R+E
         brTK2Jn7A9/aFvBvcsqJTOjG2skASxu9BxRpJdJuI0xoUjhA9wfMyJ7UFr44WL6L+CIr
         8he9ywDAlMItVcpPoOA34DiY7QLI2OAE60+hYyTac1JqLxEo5ge6aFRek0SjMUjQ6DaG
         qCmw==
X-Gm-Message-State: AOJu0Yx9x7BgybUYTEDKhiWYPUiBWlgxMjiWX6yPRDuIsjNN2ZhpFLug
	vUfPhW5Iipa271QwUQs+O0StI8ynLrCsXLNXqsTQGB0ttdIVhw/bNywHQCEhi7lxs4c=
X-Gm-Gg: ASbGnctoDA1pZz+mfFvNnYmeuJuPjW0uwPZ7UnukVgK6KLACIyo6SQM6pr1bBRaHw0+
	6UanleiK56BUdxch7Wx0F4MOriWwXJcUJi8OSHlW5YuIu0Zgeh5S9/3bGbLM7eVzxjLP5EuVWxe
	hXkpgU1UZEYGUE+gsGrN+w2eI7sWtDe6kHKc4N0T5Jo/mksxKqk+GBf80BziumVeB//KNOa5TOc
	/h2cVTvFYNcmA1sioQPJPF2qIH17pgyjkU4VblrLmdvPUCFbMQHskyv7ZpSfCv/HTTOqk7SPElo
	eWYNFNLy8aCzNMPApWf2Z6/ZSO2hR9zXycqDj7Y8WRBdEezjZpkIggLRWq1zdG2zl6l9m4xGIqe
	7Me8M1t4JNGUoMOVYtVcXQviQO5y2EesBIi8ZF5EGnZ8sr3SBEJGit3EjzVOZCcmdaVo+A2uxZo
	PXyA7F9lc59zrLrXcs8ACXMaf+mz+pxFbhk23KmwUlxTa4AgSkJusO+INt
X-Google-Smtp-Source: AGHT+IFS4bL1OHrvlJ7NauXkhXRppJ+gq5qkliJnQbz4dYw/SqTcv90p5EoSsU8V1stfZIXijs5KTg==
X-Received: by 2002:a5d:5f46:0:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-42704d966ddmr122992f8f.29.1760622200498;
        Thu, 16 Oct 2025 06:43:20 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114461debsm31418275e9.18.2025.10.16.06.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:43:20 -0700 (PDT)
Message-ID: <e7469a02-1159-472c-811f-2004fa7b8c64@linaro.org>
Date: Thu, 16 Oct 2025 14:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
 <84f17b74-a3ea-46bd-a6d4-efa79c1cb43a@linaro.org>
 <e0e0fa36-b75f-4d04-b179-772fa4b9d10c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e0e0fa36-b75f-4d04-b179-772fa4b9d10c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_064322_667915_63BB2295 
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

On 16/10/2025 13:04, Nihal Kumar Gupta wrote:
> I assume you're referring to update s/lemans/Lemans
> 
> Codename for QCS8775P SoC corresponds to Lemans while QCS8300 SoC corresponds to Monaco
> 
> https://lore.kernel.org/all/20250923-rename-dts- 
> v1-0-21888b68c781@oss.qualcomm.com/ 
> Following the above change,  I will update the commit message from
> "Qualcomm QCS8300 SoC contains 3 Camera.. " to "Monaco contains three Camera .."

Eh you're right "Lemans" is incidental, you're comparing to not 
declaring "this is".

Seems not really worth updated text in that context. Feel free to ignore.

---
bod

