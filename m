Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D3BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJKT55bm34PbDyZKSs2QdqQluEMDHDryBLZVBk7djFA=; b=hSFrVP2KtM9pjUrXw4/QyQpAcx
	smVNF/8NVI2TRD7ZNwLc5wTWavPvnsIGBnf88i9okVq1jJYoIRqa7R00MhB2il+/+YgotKIcwD09P
	Tf4Cd+ZUAbG5ucwrjPaPlTminP66AJc7IzqlTwqOYq15zK02XJ3KHQLm+AcLaINL0Mi8pKFQ0lE/f
	Rxy5l9dz5ngvW747vvyrPJZ67H9bQp7eW5GSmS+kzD9aXCq3pbkXa1hirdVu6zMLB/F4QWlcUOXlC
	JjLpfOtRH/RrMmpH1mFqY9zqCO7XDXonYig0H+UdP2tdD7HhlH0ABXfoGsY3GqnLg+q5qK5m2ZbbG
	GcEo1YxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQ5J-0000000Fm16-1uaz;
	Tue, 30 Jun 2026 04:28:33 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQ59-0000000Fm0b-3pwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 04:28:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c825c88744so24680125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 21:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782793703; x=1783398503; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJKT55bm34PbDyZKSs2QdqQluEMDHDryBLZVBk7djFA=;
        b=BLZezVRxGQBgSthbH+t2e8FJcTU+4NIkJZz5YYQDqyKw46zwqpi7JpsPn7Z0iVoCz5
         OljjoPLGrT2bbamO2mDilDwrKqJojw9hHiCbUphrRD2q43tz0FdG5C5ClWEpsaHfVvog
         FtKVETaKNQ9fHigdXEugmivt15J/7/RHYOLBfQqLpKmAFcghv3AysDVKAmQo+J6mPwhF
         JIT3U3sLgRP1btXeP0nGVU/spzbHgKvXoAoQzeLSFITn8V/i+wAfb60UYauZuJEBZ31E
         PTvEOQ+hVvjcfySh87JcKrvcfi8kByvdKGwMJDnqoeDvhKRZj+bJImAGC1/P4LT4jbSL
         1hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782793703; x=1783398503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJKT55bm34PbDyZKSs2QdqQluEMDHDryBLZVBk7djFA=;
        b=g4FJI/CwKozVNH1XIdJ+pk7XlSAMPV9iTzaTil+oAUcrPTaMYroLKv1zMPTJmR0luC
         KFgom2XfrDzxU/xkYzYmW+t8KrL3rHYSylg0F/LsZU6rvBAPLpuF49/Dmb4S/4T4Ir9C
         bWT0osaHM5yfnzECd5ywYL+VZUuK0yPStd8D7yDsuPxnZw44m/ASnfOkYhPwLNhr0ces
         kN19u43PxW3a8OpSdH+0w/fHE1xA0eVi783o3c02oXnivsZYdeVd0ndLONvQvNviNuSJ
         MtssGi2yR+0B+7kTsBldgaKT5IxiUPXv2ZFqmBp953Nbf67ze7aau+q/P/eDf46mSPUi
         pHCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDjVHY+kxE/LBQ+/aludfGDY2JQ9sOmsew2ca1bd6ooWfyssLTc+iedwSSOOau8XQWgWHzLmNvOMYFrI+sJkzV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv2VXBBBzRRp/mbTwF4tWanF4vPGT/saATXozWYSeQFKG7MmpC
	nAfkpD1cVf6feC2AwaFrUKbidtHGvV/Rh33nqaWBtRxXHNjgv2iHS5OI
X-Gm-Gg: AfdE7clNK/I15P3RQgqaFUB4l49VyGEGjztssE7J09sdK3Sbry3a6hf4oufqm8HWQ7r
	e8dXIWfNuW9Iqz9yLK/CmL7E1HWhfI3xsxRVQU/W1vJZs+PY0GXTLDYhBuKdDlIMkmHeTpQ9FOY
	o4zKWx/uzgb/m3sfsC6w5Pv8pQXaUZbpsHQI13NMse6YuW2CdCROldjP1zdhDC4FF07tCQqMDH+
	vGM/kIWB6JzjqirPaMTjUjMXWbsA0t8tYP6N7XKeu/2lurX977mjF6pee6TiGSU0/utU01HHoju
	s6ZKjuKmuVH3pteo//dSIIxDJ2npqY0b0CoRagX0bvLiDvj4yYQEuN2S9N23FM3pb16tsvUB+jK
	Wy4GRxX/ZJh2XnCmvpWz8BvhwfwxCpoxHg9+vrs0PTzwneez7YEkQDMMIZofVo2Y/5Hx72qHulu
	KoNwmEtT7op6t2VgY6+dJpLkBJKimyWFSyMrzX9JstKgIVACQtgB1qMakJvu3cqmCJ
X-Received: by 2002:a17:903:291:b0:2c1:e426:70f4 with SMTP id d9443c01a7336-2ca2e71453bmr14983255ad.23.1782793702521;
        Mon, 29 Jun 2026 21:28:22 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70812sm5085795ad.16.2026.06.29.21.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 21:28:21 -0700 (PDT)
Message-ID: <7ab78656-3413-4230-8214-8cecaaf62735@gmail.com>
Date: Tue, 30 Jun 2026 12:28:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-3-cwweng.linux@gmail.com>
 <66ad5723-6589-473a-91da-b13e2ba90aeb@baylibre.com>
 <5e65eabd-699b-4587-bb38-d8ef5c6d2aaa@gmail.com>
 <f759ad9b-56ef-482a-9389-85ea1e3fd7d3@baylibre.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <f759ad9b-56ef-482a-9389-85ea1e3fd7d3@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_212823_959760_D4174E16 
X-CRM114-Status: GOOD (  17.10  )
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

Hi David,

Thanks for the clarification, and sorry for top-posting. I will reply
inline and trim the irrelevant context next time.

 > This is a simple/small enough driver that it would be fine to still
 > keep all of those features in v2. It would still be fine to split
 > them into separate patches, but you could still send them all as
 > a single patch series.

Understood. I will keep the driver as a single driver patch in v2, but I
will keep the features in the patch and fix the issues raised during
review instead of dropping them only to reduce the initial scope.

For v2, I will keep direct reads, differential channels and triggered
buffer support in the driver patch. DMA support will still not be used by
the driver yet, although the binding will describe the optional DMA
property as discussed in the binding review.

I will address the driver comments in v2, including:
- use regmap for register access and update_bits,
- add optional vref-supply handling and avoid forcing the external
   reference path unconditionally,
- add IIO_CHAN_INFO_SCALE based on the selected reference source,
- handle differential channels with the proper hardware constraints and
   signed output handling,
- fix the buffered scan sequencing so samples are read only after the
   requested scan has completed,
- avoid an unpaced software re-triggering loop,
- use IIO_DECLARE_BUFFER_WITH_TS() for the scan buffer,
- use the new scan_type.format field,
- drop datasheet_name,
- use device_for_each_child_node_scoped(),
- use devm_mutex_init(),
- remove the unused struct device pointer and other cleanup items.

Thanks,
Chi-Wen


