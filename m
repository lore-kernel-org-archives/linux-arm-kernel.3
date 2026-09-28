Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3050CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/Ho7D9pnwA8vFx1jX3g6jxL7io7VVBJIDHq0PV6nYs=; b=g+3d63lxQOk5Z6u33OJqiKy95o
	EF0VAkhu75enadLtARCfOeEY9n6YQmbpbejl8MF1nsV36oyKWgwOs2t/Wuu/akQmlaXRq9P3TrWS7
	VcY9VAJhgBGpdrE3Cy9s+ch90J3xOhN9vaVmWzT0JG/UhGPCEQZf+6Fbsy73NekmPrQzcq+MC2AKj
	wjAbWE99/By5wBI0B7aCsl6seftpr3m3Nsb9QxUX+/tA91DSdG9d4zvAYm5tpDioI7+E9QgzbX75t
	slVL+veyr91bxigGpuE2VI09e8jp6yQOBHEa7nVtMezU/icG/wOMvdrdLdXP9k4EoW49ex9i9fGPH
	dkUmw2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0Aw-0000000H7PA-2Hvs;
	Mon, 28 Sep 2026 01:29:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0Au-0000000H7Of-1jUN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/Ho7D9pnwA8vFx1jX3g6jxL7io7VVBJIDHq0PV6nYs=;
	b=AfaSuEIVJYhxPBIxTIrDwUHaMLcI6NEa17vPc5mvpFDD5qWE3pNeG17tzoj0qcjB/uWJgY
	+tGeCN0hbHECiYG488GOen35HYexvfXu8WAE3+RnKyrJa1N6zokqJcgj5G6onaNJeAVOzL
	igjjE4nqiyy9qQf2gI0/EeVK/S5Dvtc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-jPctOP1xMECejnAyXlteug-1; Sun, 27 Sep 2026 21:28:57 -0400
X-MC-Unique: jPctOP1xMECejnAyXlteug-1
X-Mimecast-MFC-AGG-ID: jPctOP1xMECejnAyXlteug_1790558937
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8d1e91c9so37722075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558937; x=1791163737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/Ho7D9pnwA8vFx1jX3g6jxL7io7VVBJIDHq0PV6nYs=;
        b=WUmbJrRWbt1okq8WFSqt/eGTPW78lHSvHcSL6D67DBv0n9FbEaMpU1BR+9sJtGodTg
         DPkUOiFzp9aiiqplFAVq/irW0c6BLA0GiEYwVdLvwtAUOuz5nwt+4tUU+qkUR9O26DPn
         ISCwyA16PzbKCCiUkmbL4hFvry13fqy/1amMhZDebdxeAQEol5wHsWTZkUsNDoDHuaGJ
         UyovFoO0aj0oBrjubzPIB3ZVTLkBbd3FpGGTCfzjiK6L3+y0DAEhG9U91HKsj0ETGwVC
         NUw3DyspoJqfqJxe02A+qCxkwgEI9v+5HGIPENs6Dzg/W24J9g10rYmSOn3MuokMjC/k
         z8Ww==
X-Forwarded-Encrypted: i=1; AKwUvByzzPPIEWjCl3T1W55A9xqUkxSHMMQywusMbgN2KZZnhIrqP0mGQyZEzbpqHpgC66Ha1xC0FtgEPkLjnXkXcIaC@lists.infradead.org
X-Gm-Message-State: AFq9FYIFyhzanIQQyuWQ9VxtAEg+MJYmS49W6WKp7Mhs+Jt6bvLu29rB
	fDu16SQToGnHGyO70RD3MKb23bl41OMSF9Y0g64RT3qfRQLcRs8ZiZ62zu84ez62Ijf66Zmf4sl
	LKnRgBD6eAcMrr/ZBcMXXgTZAMpJWXKk1xCqY1GuDGvpRXcxLci7pb8fL73NVtNXHgV7VOUNE/Y
	we
X-Gm-Gg: AYBFou0+rRkKx3DEvUphlfh8sHlsMT/62X9GotzjVGwbJ9+o5VFWQRe6Emhz6akR3I0
	7hj/eXQ2kI16A8USjMj70z0lGsJyRsQUCUx1Um2ZoArTlQMdwJrVWgDqvYMxBcXRb1FV1VJ51dG
	hf1jMBrGw5E77m/npY8ZpjQIoZtBrzQ0uBSsPzrOAkya8z79mDrMziXpd7qPII4rQRhQ7HELyPz
	b1fBbJQoHhH4Pjy4NP3KAir6heaNaJI/wSpnZ1XNKIIKg3bx04qg8OtAEo2PGgz+4WtjBJOuvGe
	KYYCFv0xCNU7yEnkR2VArAi+SZB6nthmFL7rVhrw5Fn/5SuThDqHpLXSlQ0q1Xye9UdawUF34Uq
	csUU9XPWHsmTTlui7N9D9mpU1FtWmpfjGWaRMZmaTRA==
X-Received: by 2002:a17:902:cf0d:b0:2e2:91f:40e5 with SMTP id d9443c01a7336-2e2091f44f2mr12401665ad.59.1790558936710;
        Sun, 27 Sep 2026 18:28:56 -0700 (PDT)
X-Received: by 2002:a17:902:cf0d:b0:2e2:91f:40e5 with SMTP id d9443c01a7336-2e2091f44f2mr12401385ad.59.1790558936289;
        Sun, 27 Sep 2026 18:28:56 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142b00dsm33448475ad.49.2026.09.27.18.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:28:55 -0700 (PDT)
Message-ID: <699c086a-afb1-4738-bddf-54e98b8a3c34@redhat.com>
Date: Mon, 28 Sep 2026 11:28:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 17/20] KVM: arm64: CCA: WARN on injected undef
 exceptions
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-18-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-18-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VifADAt_3rRvH-AZaGyG2d8IqIRoxm-qreuHRy8Iz08_1790558937
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_182900_526157_82BCFC03 
X-CRM114-Status: GOOD (  10.58  )
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

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v15:
>   * Switch to KVM_BUG() to mark the VM as bugged as well.
> Changes since v6:
>   * if (x) WARN(1, ...) makes no sense, just WARN(x, ...)!
> ---
>   arch/arm64/kvm/inject_fault.c | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


