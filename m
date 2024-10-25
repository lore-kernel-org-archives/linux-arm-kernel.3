Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC52D0C5F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV3rdZguaCClNEqVe787I0Vt/8PGTZ52ISSdbaUDUE8=; b=sOL5CGloWBMvbUTjcF3xkIDnQE
	UeTraj2Me8+O1EnNo4rR5it2Azm6XP9754qNSPKD5pGJHvj7KL0ZQu1GiaVKHGq/KmioZboTnUbUL
	UNiKNu09SHK9r7LpPgAXRTaTi1iwyU8+QCZrx7SyXEkyUwLGlhV6L67Fc/Wa05zFrr7dlAUArhA1x
	kusueVqmZWDLGTUjjxNSnj1maWA2+pXPRwzr9SimtKxWMPb5yGD1yAzsktfp7vUKd+CNM/Z+DOOYQ
	4RUM1SJ//QNF6bxj+ziqppJfB72dTB/pjAAQoWawbx3F7SH9tCasdrL/13c1U+qsdCvg85HbOt4ND
	cebFQing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Gu5-00000003EoU-23pn;
	Fri, 25 Oct 2024 09:46:45 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GsH-00000003ECO-3mmT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:44:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a99cc265e0aso263158466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729849492; x=1730454292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TV3rdZguaCClNEqVe787I0Vt/8PGTZ52ISSdbaUDUE8=;
        b=mxgjeEPAlwUTRstCeLAjJGLyyzV/rPPDHbRrYSUKPVutLj/UmEoqyvI3B/Ek55GCmA
         v9/8pfcJBdbwT+ltdCwGw77G7W6zGJAZRCmApCNxCbytaYSCvgJfoN24rraIABvaH/0b
         fOxxxlNci48U99RXU/AJ2jOxLpnxNkdKdkVtk1z8k2/VQEF6LOKIBp3JY3DFnl1nAHI2
         p3m9xTJciz1oP2qm6Ox14zR2IIjxgcNcMh+ufMM7PeYsGxRBwbiMFB0Xklbh61EF88Gd
         Oksb4J9pVIk7MB40ZvLd+q5Xj1feEG4NL2q25O29Xkxwpo/ejBQ8IqUXBtygcysybss2
         rvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849492; x=1730454292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TV3rdZguaCClNEqVe787I0Vt/8PGTZ52ISSdbaUDUE8=;
        b=hTM+Fej/rbw+hP0TILzaxpoa96gdZ5e5GtJccrnzFuP5CrZM9fClKk6IfM4lyao5pa
         XJ4nMB2Vyp+8Np9VWDUkyc/VBDxPo6F/xijSDjIENy5QvYkyh2MUy4wFQtQeshCt0cCV
         jb0eClClKDjGqZ+ZV84I3TDiX0kmoYG5k2hEUPR5U3OeVmlrPN/idkEJhwIqlQDNFwjB
         ygQ/VCEQIdgA6YUxsl/FXJfIplCzrei1uQdwTrZNctOOBZ1KLbx9+5a+ZYllLOkqxku3
         aYX6Xz+1mnmYL4jdkilrCbzN7JsK41hzD/DqTsIs0WfHbV+btJyDUK+jqAoo7FrAMjFo
         ouWg==
X-Forwarded-Encrypted: i=1; AJvYcCXBxf9X8+HbedGSRETbwXvF4EkoWliJEGmCknc23W4D2k3E7muEb205FnMs1wbLpNLZS/A7WfgK9W+l2aSgPK0X@lists.infradead.org
X-Gm-Message-State: AOJu0Yz46vnCBlczoKpCtRN6/p5vl9OYklEXriS8LpJSghF7Ez9MxjnE
	JX6fTm5yO925A5GhaRw1PunthySLrH1mXlPOFYf4F7RusbK7pV1SxOyQYRPkxCg=
X-Google-Smtp-Source: AGHT+IGvMaHhp0yBItJqMrGnh8WZFy1BosQ2JJpGEG7L5fd6mP/jhMEMMgdVrFkbCial7NwjOHcdTw==
X-Received: by 2002:a17:906:730f:b0:a99:f8db:68b2 with SMTP id a640c23a62f3a-a9ad2730a9amr471160666b.18.1729849491793;
        Fri, 25 Oct 2024 02:44:51 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029511sm50430366b.62.2024.10.25.02.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 02:44:51 -0700 (PDT)
Message-ID: <c889ceae-f605-49e8-8aa6-e6d7fc78a641@linaro.org>
Date: Fri, 25 Oct 2024 10:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org
Cc: mst@redhat.com, javierm@redhat.com, tzimmermann@suse.de,
 bartosz.golaszewski@linaro.org, luzmaximilian@gmail.com,
 sudeep.holla@arm.com, conor.dooley@microchip.com, bjorn@rivosinc.com,
 ulf.hansson@linaro.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 marcan@marcan.st, neal@gompa.dev, alyssa@rosenzweig.io, broonie@kernel.org,
 andre.draszik@linaro.org, willmcvicker@google.com, peter.griffin@linaro.org,
 kernel-team@android.com, vincent.guittot@linaro.org,
 daniel.lezcano@linaro.org, Jassi Brar <jassisinghbrar@gmail.com>
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <CGME20241017163705epcas5p1ead3359adb4da5eda00310f93a882971@epcas5p1.samsung.com>
 <20241017163649.3007062-3-tudor.ambarus@linaro.org>
 <0da701db23d8$ed5684e0$c8038ea0$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <0da701db23d8$ed5684e0$c8038ea0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_024454_037390_844F9164 
X-CRM114-Status: GOOD (  13.58  )
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



On 10/21/24 5:47 PM, Alim Akhtar wrote:
> Hi Tudor

Hi, Alim!

Thanks for the review!

>> diff --git a/drivers/firmware/samsung/Kconfig
>> b/drivers/firmware/samsung/Kconfig
>> new file mode 100644
>> index 000000000000..f908773c1441
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/Kconfig
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config EXYNOS_ACPM
> 
> This looks misleading to me, as you mentioned below, ACPM is a FW which runs
> on APM module, and 
> The proposed driver is a communication method between Application processor
> and APM module,
> Which is via MAILBOX.
> So preferably EXYNOS_MAILBOX_APM is more meaningful here.

This seems more accurate indeed. The design document that I have refers
to the protocol as "ACPM IPC", so maybe I shall stick with EXYNOS_ACPM_IPC.

I'll also need to prefix all the definitions in the driver with
exynos_acpm_ipc_* which will result in long names. But I guess there's
nothing we can do about it.

Cheers,
ta

