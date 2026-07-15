Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB04C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 22:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYKThW6S+/ysG3sBUcQ38b0+BGQHjFHSJabT0tpeyio=; b=NKf+FlruVjbgnSnnGTz8kcgdno
	AM8GZImVzMQ3AmFwxLm7+OSNq7QifX4hgY1JlkV2JPuse4w/QYf+Ca1oSgpOWJssi1/RCkcM/wpHO
	LUc17jqMI+y52fFw0E1z6j7kyVSIBHmaHP7MQdUGWuzU7WAko39apX4YTIY495RLR0CnpIH+YieU0
	jhNlWyIHRTOYZocUJFLrgaIMoNza6PYWKkZ7FiyIyzbOdzOEZoMNSry/Ft3jDXmjxKM0FLtW+AOpE
	1eBbkCEkPI29VOf8sBGApglELuLt2QTGQElHq4fg20DIZBFLtpdvfAsOv4asp1U6fHcQKcBRbZO20
	UoLDaPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8Z1-0000000G3UT-2qBL;
	Wed, 15 Jul 2026 22:58:51 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk8Yy-0000000G3U3-2JxO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 22:58:49 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-517dc520840so43324521cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784156327; x=1784761127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYKThW6S+/ysG3sBUcQ38b0+BGQHjFHSJabT0tpeyio=;
        b=NKrWXjhNaHQrGZPq6knpKb0mY2ktuPweK6fxbzF7eyxO9pcishsNvgd07OXn5oSCN2
         AaHGgePgh0garCy58UC+pMGGYBvU3mSnNrV34plkdYTe7eelaQFHUdE+cd4eUdd2jaCC
         L6Hlbibu13qsXInVXVyW2IgZ7otYPZiyFjVM6BO7hwbl63vLR+PJ7fwOXzL26o7dBfrs
         OX24AEnY7iLKafGGqsiGRPAwOSZkb7ezSYL/lgZWFxP2KYHDl4AgofvMjvfTghk4AgSC
         HkXUqLT/tBN5c2HU/JFsF8VbCLGN9A9Wkbzg6rb8j5Z7LwrgbPmfMJcaIotQWgF0E9lL
         sm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784156327; x=1784761127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MYKThW6S+/ysG3sBUcQ38b0+BGQHjFHSJabT0tpeyio=;
        b=ZSvRjpMOTZ6/8PLKydkxcGAs/t8qcDUFK0wBDcUGvvrYl7XZ4GsVQUqNMB+JaaNbmP
         4rbLARXknWkNnEhFqEvJMFU1mdJ96dIxXOaHQL7XHFWA9r5Aj7Ux23IwFbbMCaJ8MIjF
         Dt8rJotjeQs7fIOXQH+5q0SRruCzUZ0r0k7Ixs0E/rYyvOi7Ei6NBC9NDD1F4d8T6OQD
         D0S53PZlGEoowXk7hZLRxFfGcCRz/i5lDCBuSLf391CORhe/4CHmP+iQso+Xg3ig/9Mn
         i1NAHUzxDR+rQ5q62yKZZyRUFm5NnziAHorIW/LMX2iclU6zYkpMaUc91paGE6+6huYN
         wS+w==
X-Forwarded-Encrypted: i=1; AHgh+RoKajwoz1wPGFcNwrVtQflHxFJ3jpx9QGb/Qmv7/TU1J7HnkXbFsG+B9x4ZnS7zF2jCIxKJj5/7flLyzgdJHhGa@lists.infradead.org
X-Gm-Message-State: AOJu0YzSmGvcUQJwxUM7PIZ74aATkBsSknmmepec629xfTaZAnpwfzAU
	8vdP9/KGQovfg59+oP7NgUuOrRO5fjKPA88c38w+Sv45FlCrqoCvAG0U
X-Gm-Gg: AfdE7cnVTt8dDLGjUwgFxEzVFx30Jd/qYAKlKBuKshNUYXOKxdP72yCnsxaDC7jxD08
	UcmEJnMI3/7Rr52PnkfEci6EUVdEtFKKKNOTpiJIZaO2UQfzvlc2YL7gMLNSNi5oYtx7G2KnScx
	ANLNMy+VKj2ijxd9ztfVufM+DxANCrJLV94GvmGmZDxONtM2osq0pICOJ8TEs4UZHOQUj7hKOpO
	7myUMZR6210XL+1F+wyMpajMUgzc/cB3yquV2eXDtAyAxGGlXJriMLWyMSpo9E58oBlkU0L3Ayq
	ITX1A0BOjOZzzCfqKQPcG61H1gwONUZChXgYkToPhCeTfkLBNYzDiuMCcXtoX8RK2Tb+IoeJ0nM
	o54cJyTDoHncgqj3YeYyWvlCNWDAewId6WDESHVrBKLs5fpTVvv66BHlDepOhnveBuPJ6kUphjA
	ehZtnNvk77fVrcTrPJ8eblbQh7wzz6K7FiFnSIC84kcmZijtvIBHRylC32/kf9fpruBRs4xhljH
	gyJxsP6/GnZL+Et
X-Received: by 2002:a05:622a:15c9:b0:51c:18b3:ed99 with SMTP id d75a77b69052e-51e4f0fd621mr56429541cf.61.1784156326506;
        Wed, 15 Jul 2026 15:58:46 -0700 (PDT)
Received: from ?IPV6:2607:fb90:9361:a991:79a6:af7e:57fc:e61d? ([2607:fb90:9361:a991:79a6:af7e:57fc:e61d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51f1abc739asm12333561cf.1.2026.07.15.15.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 15:58:45 -0700 (PDT)
Message-ID: <9bb44840-c3fe-4bcd-af2d-149dbc2c7c8c@gmail.com>
Date: Wed, 15 Jul 2026 23:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] soc: qcom: Hide all drivers behind selectable menu
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-1-4a907e064281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_155848_609482_71AC5DC0 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi Krzysztof,

On 7/11/26 14:25, Krzysztof Kozlowski wrote:
> 1. Allow compile testing of QCOM_OCMEM, which previously required
>    ARCH_QCOM.
> 
> 2. Hide behind ARCH_QCOM or COMPILE_TEST drivers specific to Qualcomm
>    which should not be available to other kernel builds:
>    QCOM_PMIC_PDCHARGER_ULOG, QCOM_PMIC_GLINK, QCOM_SPM and QCOM_PBS.

I think this patch introduced an unmet dependency:

WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
  Depends on [n]: QCOM_SOC [=n]
  Selected by [y]:
  - QCOM_PDR_HELPERS [=y] && ARCH_QCOM [=y] && NET [=y]

- Julian Braha

