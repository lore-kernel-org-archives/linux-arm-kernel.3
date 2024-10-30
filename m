Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9188D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gExNcjrUtvag1nDOnOiDLd7cvI4wjdQFmT0fqwMb11A=; b=qj/h+IeKf5qKsTcbs3TYJ9a7kR
	wR8GY6ZfVhxEzcfB28D2Uj95Djc6s5QPn330MFH4CrT3jIfip8UFwzv/rnwbPUDCq4aUeJ7JqsLiT
	cXYQk2GBxbX12NA1IwEXzLUufoETXEAPyEF1KEQAO/+3mMuyKIBiCSDHvddyTk4w1iCpwk3zeUI82
	3HhbkKzOFyykRxycBTScCscqhs5hC3HD6lAvLFxMz49bs/p6ysaoba/7kjnSgSsNl71NjjzEkfH23
	vVxrE4He50Kr3Eny+JCm0iaXO/bTBLtTYO9ER/DOX5tu+EUJkdqXPeGJ+ljxo1aSd8Ux+hvnbjToD
	2ZpMkkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Gv-0000000HQvU-1ttN;
	Wed, 30 Oct 2024 09:45:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65AY-0000000HPrW-0jFU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:39:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d462c91a9so4546694f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730281152; x=1730885952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gExNcjrUtvag1nDOnOiDLd7cvI4wjdQFmT0fqwMb11A=;
        b=t4mMMlnCW1g1ikTPop6KcSsXD5ozudxEHv7UeXxutbes/Mt7e6ObSuLZsrUCw2qZfV
         WVG9j2MV2J+hqTshNU/N2kjudhLT69ijVpswdj23GH4bEQhVyg+Vm5F0ganMlN+rZivW
         ZCdwqtfN/OZEqt2YW4rregPGi7Jw8m15l6f3q/VRAivcsxNlmKJKKaxzZ0SU83AwBNZ0
         /7oY3ilp03gqEZHpceRlYKhf2irbtmhsUlg99koN0RPrEQ9CVkGLIBrDv6nXEy9IjzXO
         4U3WsRowPLm6MzZ9PVBViFrdqlY8pOVF79Fg/2Et1uQVU1uuBygxlXGGYf3tf3DMVMEw
         lhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281152; x=1730885952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gExNcjrUtvag1nDOnOiDLd7cvI4wjdQFmT0fqwMb11A=;
        b=o3Rrp5B51dcu0MW35xCJL89vgt4Ud1w3hnG/pcIleO+R18VHnGmK+CwDGTCTfpADOP
         yZDsqYmwtgX5R5KRW+lBpGRfG87+GXTPPxhRuNGHhlWQIyinBSfET+fZFADi8NPF4DgR
         X5Y033WWIkFMfeHy47HZSX5Bt614G3Shv1gY18T/3o8Z6kCegES/ZSBxnSuk5IiI51d3
         9kT3DluN3LGCiQsgaaHiyLT70ns+3/fdq7WluU4RK2A09Aq1PD9EltyL1qzm4Xpbw7eZ
         8ooT0XwHVwkKGwRVCv6Jjf0TESOBP6EUbAjaccJmTDtFGMIZHkgtoR6CxG+DkA/nblL4
         8qyA==
X-Forwarded-Encrypted: i=1; AJvYcCUZAuends8PwYMGx7Fy7bRqNxpzR+cVjecB5AR/lDdw0W+3H7SNPGw9VnmRpsmMLvaUf/oGE1s0cciLDHiKbDid@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Dms20xNEOPXADW2SvxDszGU22TVSNHJmSGseZ7aGtzvY1tWl
	hdiGhQkrJq45k9ltgP/i4VJBOr6at8R0owg55PreOAdgYKMOR0qmSa+WeKPF9vY=
X-Google-Smtp-Source: AGHT+IE32/QWwJxt5SXFpIYLSDpj6WX3oAgieA0BND3K1CgVJXvPCDBSisVF5SvFS5ZZDNzolgjR8w==
X-Received: by 2002:adf:ec4f:0:b0:374:c614:73df with SMTP id ffacd0b85a97d-381b710f3f4mr1868603f8f.57.1730281152021;
        Wed, 30 Oct 2024 02:39:12 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70c44sm14816858f8f.80.2024.10.30.02.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 02:39:11 -0700 (PDT)
Message-ID: <430e6dfd-4a7d-44d9-9dd6-64d99c8bc91e@linaro.org>
Date: Wed, 30 Oct 2024 09:39:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] scsi: ufs: exynos: remove tx_dif_p_nsec from
 exynosauto_ufs_drv_init()
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-7-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_023914_265396_48133DDD 
X-CRM114-Status: GOOD (  10.05  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> Firstly exynosauto sets EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR so setting

exynosauto and gs101, the users of exynosauto_ufs_drv_init().

> tx_dif_p_nsec has no effect.

Both set EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR, the conclusion is correct
for gs101 as well.

With this addressed:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

nitpick/personal preference: I wouldn't use the commit body as a
continuation of the subject. I would specify what the commit does in the
body as well. No need to address.

Also, as a side note, I thought of removing tx_dif_p_nsec from
exynos7_uic_attr, but it seems that this struct is used by
exynos_ufs_drvs as well, which don't set
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR. That's a little confusing, I guess
it's more clear if each driver has its own required settings specified.

