Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9EBE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvZr/dVKDpLXbb03C5T6q3T96NxB6hILwFKtXlC/Ynk=; b=HieLj4RwdKLvM9OvFOpi+KScJr
	uyCQHThcm7L+7TySv3YEVd5F070ORpPIIE8MitdV1bgjYbBtWNv/GqK7qCCgAt/a9GnDIdhViToWF
	sc0lo2gAtc5oZRix/6VrzzRQsVePXK/LI2irz3eqEZ65VmYutD6W0BjwJUH7sFkvtOp68wZDoLQZu
	qlGbsueKE9yUbwpfIiret6YlclEcN6wnRJj2zKs12FJxSwY2g8PfhcdPpNRVOPkN4v6vXkYMCxW4V
	kti/YN8K5UU7stUsYhBlSCDikin3JvdJbSuDFH8xlRs4jg2IYZV7tUAuKj0I7glYz1sJpjfSp2TuN
	6qMXg4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7BB-00000004RsP-477N;
	Tue, 07 Jan 2025 10:51:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV79w-00000004RWq-2bIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:50:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385d7f19f20so6778341f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 02:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736247002; x=1736851802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FvZr/dVKDpLXbb03C5T6q3T96NxB6hILwFKtXlC/Ynk=;
        b=EdGlaWQ71lII6DbnnGosVt7UikVa7i35D6hMDGjmvEmI/st+VsD/O1CUHXwR3o1HTd
         7r2fHSDbDqN90VfqjSovGdnHPo8cZeG7KP4XKS/n7CJ0lTchVwB4N9OHbJyJveFO+nRH
         RCur7g8+F9JjUaWvg4Vo7psrdzI0tbPeUX0W03suW9FYj4SpI8FmSrrAmHYh4wA5rsZ5
         IY7u/qReR13AizjbgXEQ4f8hyGOFJ884PEePINYZx0PSV38w0K4nwfWgavqeEEXyg3Ic
         shhs8XYlAdXEaxgDP0frybbLbySXdrpJPB40dpkZKKpJgNu6auRtB+UlYTug5vQohCiP
         zGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247002; x=1736851802;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvZr/dVKDpLXbb03C5T6q3T96NxB6hILwFKtXlC/Ynk=;
        b=LnhvnBoMrRJJTcLIs0SwmyGWEDUXDSRwPyLyxc8oWDyByiJixLRfZZScvyX+Hq0TIc
         EpKoenW+91lkWL82wNjSjjtKlSeG7XMbhj2PTGflLnTHMJ8xSwrqcQbcaTVBLwrjds99
         gpH/c9TXvsBsJ8mMvJLmkC8+oK4LzWedWjCStmdzT3LAaNTMpGmfvRj1f2xc0FxudIke
         tN2JqIEZlV13mWjBeNx2lEgPMFyl5eElhV75VQ5/gYA7vcfxw4IHkcn42hnyFgBEq8le
         Kmd0hTCWSbtkpgBwejAVMI5lZHgzxmErL8qqMBWVlQMoDRJekGutsgvTvDiTpHXUpn1h
         iQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUH+XVsyROr+eKipuE93Xo2g7Powhqmpfqj+BRUB9UoNuxzgeyA5YgUOz0U/FgkW0l4tXiR56UQxAppZMUednBm@lists.infradead.org
X-Gm-Message-State: AOJu0YzkVS5XMpG4ipQPBKk+p1kmZM9U6mm4MNNb0Ir6Zj6AYZOO8S20
	+Fl7KEMLdZIKZINfibto5IPSgxbY43E/uVH6YvdVCfSZnYvRj882YcALa/9JTJ0=
X-Gm-Gg: ASbGncsKxe37yH8yS/DQYX1mw9x/nrrm+SXu01PB1URwHozbr8ewqWiVgL9KR5qS2sS
	RPTjQYyqbdqiQo2lkUFWL5jeaRsYVb0ZOy3ZKHyvL39FsIcoxihxV3CdPAbb74L8bZuD/cSxy51
	ZTa7Oo6a+C/qZv31YOtKDwNsdgUeuyu/BgBB7vT3WXZKkOB5PyRNrtSbYyhYdGmd9b38uSSBPUc
	mKgciFUs98zMqvISriFOWy8uIms76/LW1mj4nulWbs1HCGFoCbgIUZwxQEB6i4R
X-Google-Smtp-Source: AGHT+IFWWsclrAudf9l2fMtvDlof68qSNuL9I0XDi2SzEiGNLoR/MT68Eprzp2TyquFNjFKf6bXUlQ==
X-Received: by 2002:a5d:5885:0:b0:385:ef8e:a641 with SMTP id ffacd0b85a97d-38a221ffb82mr55164693f8f.28.1736247002474;
        Tue, 07 Jan 2025 02:50:02 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119d7sm626870095e9.20.2025.01.07.02.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:50:02 -0800 (PST)
Message-ID: <366ab35f-b881-4694-9d36-573f9922175d@linaro.org>
Date: Tue, 7 Jan 2025 10:50:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: add Exynos ACPM protocol driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
 <8e6bade0-5184-4bf7-b1f0-103a77d0f98b@kernel.org>
 <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
 <24963d4d-9d53-4d07-a756-3eb1fc50c3dc@linaro.org>
 <d41fd615-2e6a-4cfb-90c9-fc0122ea992f@linaro.org>
Content-Language: en-US
In-Reply-To: <d41fd615-2e6a-4cfb-90c9-fc0122ea992f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_025004_671182_FCF32B17 
X-CRM114-Status: GOOD (  12.27  )
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



On 1/6/25 10:20 AM, Tudor Ambarus wrote:
>>>>> +static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
>>>>> +						     const char *property)
>>>>> +{
>>>>> +	struct acpm_handle *handle = NULL;
>>>>> +	struct device_node *acpm_np;
>>>>> +	struct acpm_info *info;
>>>>> +
>>>>> +	if (!np) {
>>>>> +		pr_err("I need a device pointer\n");
>>>>> +		return ERR_PTR(-EINVAL);
>>>>> +	}
>>>>> +
>>>>> +	acpm_np = of_parse_phandle(np, property, 0);
>>>>> +	if (!acpm_np)
>>>>> +		return ERR_PTR(-ENODEV);
>>>>> +
>>>>> +	mutex_lock(&acpm_list_mutex);
>>>>> +	list_for_each_entry(info, &acpm_list, node) {
>>>>> +		if (acpm_np == info->dev->of_node) {
>>>>> +			handle = &info->handle;
>>>>> +			info->users++;
>>>>> +			break;
>>>>> +		}
>>>>> +	}
>>>>> +	mutex_unlock(&acpm_list_mutex);
>>>>> +	of_node_put(acpm_np);
>>>>> +
>>>>
>>>> You also need device links and probably try_module_get. See clk.c
>>>> clk_hw_create_clk() or of_qcom_ice_get(). Interestingly, none of them
>>>> perform both operations, which I think is necessary.
>>>>
>>>> I think you could also avoid entire list and mutex by using
>>>> platform_get_drvdata(), see of_qcom_ice_get().

[snip, irrelevant now]

I made my mind, I think the solution is threefold.
1/ use kref with a release callback so that the firmware drvdata will be
destroyed only when there are no consumers. Example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e7c57355a3bc617fc220234889e49fe722a6305

2/ In get_handle() after kref_get_unless_zero() succeeds, I'll be
calling try_module_get() for supplier. Even if kref will make sure that
consumers will still have a valid supplier drvdata, I'd like to delete
the supplier module when there are no consumers left.

3/ use device_link_add() so that when the supplier device unbinds, to
unbind the consumer devices as well.

I'll implement these. Cheers,
ta

