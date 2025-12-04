Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BAED1F9B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUsSSlUcY7wQnlMDz+NJbRcKuFysd8RLpXnuMwJEeMI=; b=LKzRap3AxRYCMjjpbH8ayTofow
	KojdoEyKUnWG4qm20MBjZERan+xry4rChZpzPwFdj+pEVTg1x/pXg2LI7WgwnBRZgnD5t6ms6PrvX
	OaszLrcG5Q+9GW3Lc0QJohKFhGqNgUSRw7JpQPWSgM4/WbeY+ZuRxN6kcWkObIq2k/eJ33RUVdsIv
	7w8LhLYqosPVIC0mfY5/2WbMFc0+IaWOXFSq+HZqtsYEQRQkBX8F/2xrzO21lzTj+S+YAE4EN4Hr5
	DyKBTr57hQEEpKcOj5jrzz/w9JQt5T0rNpjoNA5Ykp6QiesVNWFp1Fau+Q3Nui9zl7FOj4uNePitr
	V4EAWCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6zq-00000007sUu-2Ptn;
	Thu, 04 Dec 2025 10:55:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6zm-00000007sUE-2zVa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:55:37 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso1150878a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764845732; x=1765450532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUsSSlUcY7wQnlMDz+NJbRcKuFysd8RLpXnuMwJEeMI=;
        b=N436HfjgsxQHb5uag5JKO47lEc5ulztFxaxSseQ6ancS64Y5dM9LcQKAhl5ORAN96N
         r5jWtJfedTNYOwYKTSvIoOedxtrg/DoFXtjYPJ5/SvnsrQfT19o8H+ysmGG7BMeAbvyH
         jqwwTBy+jdTeNmLpvjh9K0apuCY61JP2UGWDwsD/PWozNy2SEEF1DO3lZ41iccti7rZg
         LSVhEkDUZZXRmN6TApJpcG/IRN77bYqggO42tRPvKFPI7zOx5gHpMIMolPDWMV0oXOw+
         X7qjpHX6WKMPYi3Q+AtlYjSIwLSxMQYuecTkrTbM5C8Sw+6Z+Ow1uf1X3vAmjYmmpNbT
         T8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764845732; x=1765450532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUsSSlUcY7wQnlMDz+NJbRcKuFysd8RLpXnuMwJEeMI=;
        b=MRAfEP09S76sOD10C6tShxePJt4dug36pamppMYPDKobxkMDzyysWauCNw/vOBaALn
         WPWMV848okI+4kjDphl28xhO8253kdubsTgeOctq2aDby+GfuycsUS3sLgf+vADYmxFE
         wu5W/APgmE1CaJzRsGYOvt/3IQfYtLpTcdQd5LkwI3p34Nc0be5Umevlp+Npb4u3xpII
         BoYQRNIm1QhGQIreZ6TFAWEdlb/bX+Nte7/IPQzljfQUACMQi5gQlbyJzKKYW7EiekLx
         +ycmitC6MYrPnqFXbg/fBt/HxE0vyoeflHW4stpPqGsPNYVvZ/Kr/5sD/pub9l1uBd5v
         kRgA==
X-Forwarded-Encrypted: i=1; AJvYcCUFVi6noAk4i+PD4IfJpO1ptL8L1cKKH6MkW/ofUJ6AN3RIJCmv36146Zr2lwIs/uA/CdEd8ISOD/whPTUc+H02@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3bG0NWhg/ZVSKkqFkTSGQa6saBrojvRmBig2t85iw33i1L92E
	Tf3Co4/9L8Ix2iYQtOVuoeVoxowJMJow1yr34a/xBG/jozyTUZjhuKO6rxjyxie8cAo=
X-Gm-Gg: ASbGncs73ZK7+YW3CMEmMD2+d6kPxcqRjd07GViwFCbT5rkGbU2vpb7MAMKKp8QFqxT
	sfZ1aCG5arz0eW4jHfJjDU+WmbAFNixduTf89HgpAN+S7k+Fw71zAJn5ySWYkpEq9f1zBc+XyJA
	c74MnreocrNbqQrkUtOsMu+be64QGQSAoeWBOJwSGAVbqZ4bj4O6leGipQu/ezyckvD30WOL9z9
	yYhcN0uZ/JEtvuveA64UO75ol/wKhc9wSxHLVEY/WmtEjIIJfm5WJafC8XHj1n2HfnnzTSteS2R
	sTapp4Rq1H6jSH30+NO6U5Gl6LdD4VYrfF85dILhsHoOFynX9TQyf2Wenr8AiJHzts+b01uM4ne
	bfqGjO6DkRKLbZaf2Th/SLCFJ3dJOGmneXrDL+K1JH+82LwZ70FFlPqBsJU5CoETe7apG9Qte1d
	FNyPoRzo4+lQxRRns0hT24/maRZfI=
X-Google-Smtp-Source: AGHT+IENHvhi6pXKaJ+5f7nedg49gxJBxX0xpyd3BktUKwCryE/FZ4iNGolJufGPapWBjNh9KBoiMA==
X-Received: by 2002:a05:6402:1d4e:b0:647:a570:b74b with SMTP id 4fb4d7f45d1cf-647abd99511mr2072101a12.14.1764845732199;
        Thu, 04 Dec 2025 02:55:32 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412dd8csm976684a12.33.2025.12.04.02.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 02:55:31 -0800 (PST)
Message-ID: <6661f623-0b27-429d-92ee-785caf04e682@linaro.org>
Date: Thu, 4 Dec 2025 10:55:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] perf tools: apply evsel__set_config_if_unset() to all
 config fields
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-2-22ecbbf8007c@linaro.org>
 <20251202111403.GS724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251202111403.GS724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_025534_819683_FDD40A7D 
X-CRM114-Status: GOOD (  13.83  )
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



On 02/12/2025 11:14 am, Leo Yan wrote:
> On Mon, Dec 01, 2025 at 04:41:05PM +0000, Coresight ML wrote:
> 
> [...]
> 
>>   void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>>   				const char *config_name, u64 val)
>>   {
>>   	u64 user_bits = 0, bits;
>> -	struct evsel_config_term *term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
>> +	struct evsel_config_term *term;
>> +	struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
>> +	__u64 *vp;
> 
> Should check (format == NULL) here and bail out for a unknown config name?
> 

Good point, yes I'll return without any errors. It will be slightly 
inconsistent with the other config functions that return an error if 
it's not found, but it's consistent with the existing function which is 
a nop in that case.

>> +
>> +	switch (format->value) {
>> +	case PERF_PMU_FORMAT_VALUE_CONFIG:
>> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG);
>> +		vp = &evsel->core.attr.config;
>> +		break;
>> +	case PERF_PMU_FORMAT_VALUE_CONFIG1:
>> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG1);
>> +		vp = &evsel->core.attr.config1;
>> +		break;
>> +	case PERF_PMU_FORMAT_VALUE_CONFIG2:
>> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG2);
>> +		vp = &evsel->core.attr.config2;
>> +		break;
>> +	case PERF_PMU_FORMAT_VALUE_CONFIG3:
>> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG3);
>> +		vp = &evsel->core.attr.config3;
>> +		break;
>> +	case PERF_PMU_FORMAT_VALUE_CONFIG4:
>> +		term = evsel__get_config_term(evsel, USR_CHG_CONFIG4);
>> +		vp = &evsel->core.attr.config4;
>> +		break;
>> +	default:
>> +		pr_err("Unknown format value: %d\n", format->value);
>> +		return;
>> +	}
>>   
>>   	if (term)
>>   		user_bits = term->val.cfg_chg;
>> @@ -1396,20 +1436,8 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>>   		return;
>>   
>>   	/* Otherwise replace it */
>> -	evsel->core.attr.config &= ~bits;
>> -	evsel->core.attr.config |= field_prep(bits, val);
>> -}
>> -
>> -static struct perf_pmu_format *
>> -pmu_find_format(const struct list_head *formats, const char *name)
>> -{
>> -	struct perf_pmu_format *format;
>> -
>> -	list_for_each_entry(format, formats, list)
>> -		if (!strcmp(format->name, name))
>> -			return format;
>> -
>> -	return NULL;
>> +	*vp &= ~bits;
>> +	*vp |= FIELD_PREP(bits, val);
>>   }


