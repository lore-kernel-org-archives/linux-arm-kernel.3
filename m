Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5242ECA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J42GTqlEQ125xUGDakZWJHRN1MJ9s09iVMsl0+Q4Mko=; b=aMJJ6R7OClh9SW8679mhrupevE
	njBP1l4bdO3rgwMH8mTBNEW6cLL4hOPi3e5qSwZpVbzXqUDUlW0RVsO/E7GlQR65wn6izRPDoU3fG
	mpOOjccenrr178AqPgumaPov0MF9zvNWngye0h/Gl/hM71czg3MKiTRslmlYe/GZRYJykfcXZlnt3
	lwB9hQEWM9mLgnjTEFDwqhnliQIWxWKwwldy46reVB/EFpK+RYJ30E4z7/WgxjliKoGDtI4j4IJYZ
	S8d0+xEfJ7Mw5HmmhmCmzUxskOk5Zzbx0J64fyTa1Kpu3tJtsa8W0ljrSQUIygcsVlbJAOV4TW1hS
	0znYaRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhec-00000004mlq-2mFw;
	Tue, 29 Sep 2026 23:54:34 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhea-00000004mlT-2vwR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 23:54:34 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so30297725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 16:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790726071; x=1791330871; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J42GTqlEQ125xUGDakZWJHRN1MJ9s09iVMsl0+Q4Mko=;
        b=PWKl7Gu+BzitLSx9NnOBOqvHUAa8oYu4uoQVpHKI+pZM42pRD3EdSXVu4xz5nrv6s+
         lI5cIK9q8VKZKJTkIXu8OsUX664lIMZ3gu1dXFdH753gJx2eXm7MfshmbgoNDgv5U0LQ
         OBoBkCdVxrBCfRF+DViPzFXP65d693jhNJK2NYzj+ImtqGiMwHey/S2I1YZ5Kg/NxNIc
         wqADJBrrnIiALffyqhUBnvFMGhKn/5E/u5715Hc4Rhs7F2xnK48DCkxDChwNZAgVYfmp
         Ma+99rX3DW+hjqKGsFVK//l+tnozP35F1fG5k1WrrAokX1mVp81W5uVDDXAk/ifu5gi+
         4Zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790726071; x=1791330871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J42GTqlEQ125xUGDakZWJHRN1MJ9s09iVMsl0+Q4Mko=;
        b=lgWnHhNtxZaHkoq5OowcJd7sA7X95eINhGhLR7nHt95MZJHUtLLCCERfqQ4liUQOQ3
         lt1ci/mBfnJtngQ0lZIo1ThroFTZ6SKkm32hKiyBXmyruYWTwv1f23XdeMTJKmp2LlSJ
         fZzqc0whST8oDy1eC+LUUyPyvl7e4zcMDcROUmcAsRfDQmW+URSVPIgNcCOHzmLayd2G
         0uNX+i6tYAH+bECk++OMUL7GTz1twTVLVnMOsiRmjYOyxNS18vCBb6+vvMl+av/T6Tit
         8/4per8oabm18IrUSWOIdT8Tp8CUnIxnV1pKBBI3lakWE6oQ0ouDQ+cd/uan09zL0qxS
         raLw==
X-Forwarded-Encrypted: i=1; AKwUvBzxwMDBIms4AZRPlFGlP1hEgRvsjO73Ow8g0v8bcghlfRPsrjqsq5J2sA0BORjiBPF0RW7aZJ/39wR5HIIIw8eK@lists.infradead.org
X-Gm-Message-State: AFq9FYJVVhPPWBMC+nr6vkuH8CzM6thy6Esc5sLH0Uv4K1c19T3VjsoS
	heg3Pfmc3pRN6NeCK6Yoq9DZ2HY/FZT09ch55i6Lcg7555CMGTx8/ROi8XrHfYyR2uY=
X-Gm-Gg: AYBFou0xpjSeYkWJEYaydUnySWFS7FOWMfCMfTgtqYtP4/FcXTdu84NFlfQYqcFDX3q
	y73P9AtfFqyHb4GvjhftmjW9c/lidftWPdn1ZPWLfRZhtj0Hpv98ltaCwCMP3tewcTtDtRAqbYu
	CfnikYKrpmLJNk6mIxwSp1x+M194tOliDRYEoK0l5+LaKzO+Dybui83xB5x9nxIDbA7e2cly3ye
	t/5J0b7tUvl0J2eU+zQ7h30OMgzZzyz1vMHBhEpPAkqWQJ0itis9HAla0M0XVHrbIBmmN4ZegfL
	NuhzExTzmYRZpdkw5Klf/1Vplhq/OrE+SvwRX9ONaFCgIGjVk8AQnC/yaUI4PRNodqoHoM3Q/qx
	G4LO9ckO9kScZGVWR0oHkzEDu4B+nHGdSccNbBypvBQ+BQiJ5Wk7SdkhPnRYiJMHzv3sSBD+ATb
	ZUwJamSKHG5fyICqDzI1HXNEOeccXF9YOBqxZ9bOVVxsTlQRaKphTTSNToGs4T6sCdeg87Jq6HT
	e7CI6G7gBvOfPsRIog8bTwl36fP4vvk4R4Gh/BWUEaKQE6C1p+2MXFTgbQycmKmpgM3XQ==
X-Received: by 2002:adf:e00b:0:10b0:48a:efc9:a076 with SMTP id ffacd0b85a97d-48afe9c39f1mr969364f8f.49.1790726070845;
        Tue, 29 Sep 2026 16:54:30 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6c1260sm2324232f8f.33.2026.09.29.16.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 16:54:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 00:54:29 +0100
Message-Id: <DLS7EVJTZBPK.1C862CKBRDBV@linaro.org>
Cc: "Alim Akhtar" <alim.akhtar@samsung.com>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org> <20260828-exynos-pmu-cpuhp-idle-fixes-v2-2-06bce6107bd6@linaro.org> <dbdfebba-aa6b-4ea9-b4d6-5e0ef63d8716@kernel.org>
In-Reply-To: <dbdfebba-aa6b-4ea9-b4d6-5e0ef63d8716@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_165432_787077_7E596B2C 
X-CRM114-Status: GOOD (  14.58  )
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

On Mon Sep 7, 2026 at 11:09 AM BST, Krzysztof Kozlowski wrote:
> On 28/08/2026 07:36, Alexey Klimov wrote:
>>  void __iomem *pmu_base_addr;
>> @@ -407,6 +409,17 @@ static struct notifier_block exynos_cpupm_reboot_nb=
 =3D {
>>  	.notifier_call =3D exynos_cpupm_reboot_notifier,
>>  };
>> =20
>> +static void destroy_cpuhp_and_cpuidle(void)
>> +{
>> +	cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
>> +	unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
>> +
>> +	if (pmu_context->cpuhp_prepare_state !=3D CPUHP_INVALID)
>> +		cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
>> +	if (pmu_context->cpuhp_online_state !=3D CPUHP_INVALID)
>> +		cpuhp_remove_state(pmu_context->cpuhp_online_state);
>> +}
>
> cleanup follows the setup usually, so this function should be after
> setup_cpuhp_and_cpuidle().

Thanks. I sent new version where this is updated.

>> +
>>  static int setup_cpuhp_and_cpuidle(struct device *dev)
>>  {
>>  	struct device_node *intr_gen_node __free(device_node) =3D
>> @@ -458,16 +471,46 @@ static int setup_cpuhp_and_cpuidle(struct device *=
dev)
>>  		gs101_cpuhp_pmu_online(cpu);
>> =20
>>  	/* register CPU hotplug callbacks */
>> -	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
>> -			  gs101_cpuhp_pmu_online, NULL);
>> +	pmu_context->cpuhp_prepare_state =3D CPUHP_INVALID;
>> +	pmu_context->cpuhp_online_state =3D CPUHP_INVALID;
>> +
>> +	ret =3D cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepar=
e",
>> +				gs101_cpuhp_pmu_online, NULL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	pmu_context->cpuhp_prepare_state =3D ret;
>> +
>> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online"=
,
>> +				NULL, gs101_cpuhp_pmu_offline);
>> +	if (ret < 0)
>> +		goto clean_cpuhp_states;
>
> You have only one state to clean here, no? Error paths must be specific
> - clean only what's needed, not a catch-all with if-checks.

Heh, I thought it will more readable that way. Yes, one state.
I reworked this error path in new version v3 that I sent.

Thanks,
Alexey

