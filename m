Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0327C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uxiqPgqs4MERopy3QM6Zed1EBCGngYHtZhorQ/3Qy0=; b=HXxXgN5AI/ojADvk/rHD+oQo8A
	ltF8ZUT6vH2smkiFWwBtefrOEtFzh3zYQuRlYgsDiPNEM/hbsIMp87JkMVLOs+sy3bTP0vU2GTsss
	S30abqWymHWfX0gGyDBdvlIa0hA4DOUIChtqqBWD6NVZXldHbdDJQMWj2JRIZlF2b8n8L9ECICYul
	KOo1o8kvmTAKI6KaaOT4k///w/PqzGwaETUEwptZ+9/xxFlGbA+ItllAsWSjCa9U+wup6Oep2K4wg
	A6Pz8DmwhBxWJYCkJ/JQb1l3IfZDLTkUv9JGir4klziDiXYsJ5JvA05wK1gLhunlD3EmIevQtQ6Vc
	FiUBMz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gpY-0000000613D-06RK;
	Tue, 15 Apr 2025 14:00:04 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ghS-00000005z2B-14MD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:51:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so4980266f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725100; x=1745329900; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uxiqPgqs4MERopy3QM6Zed1EBCGngYHtZhorQ/3Qy0=;
        b=dHDYc2YxsDpu0hdODMvvI8vhCO5V6x2mooEy07hvOOqhFts1MezYjzUPFe9L2vnQWV
         H3JDOoXPDJxe8oGwlpW6l6KndvjCpFka6T/O3t25qUDIyhzXVBc/6SsV3MZg0582NjYC
         vowe/GLE0FFY0QY5tQn4t90927FmPYVbsSbas2NsuuwodYxh6H2oABITA7xKZsns3c9E
         Wz430a6BKrxbrFr9L6yJxxiMWDsq/CW0Yj6UT+B5rs1QUiKbN2JlsBOQoyrIbilF8Yb8
         dKgtda0JslTkPFR0I7KahO/i7YIryQhXTLok1FCyLrd3OhBAAUKUj8l31UDi0SGmqi38
         SBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725100; x=1745329900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uxiqPgqs4MERopy3QM6Zed1EBCGngYHtZhorQ/3Qy0=;
        b=RdmahyA1uGR4MFHFCn0/r+S3wx6HE1MX2m/zi686ZcM8HeODkKBgBKZZlCI3UpA1VZ
         oT5bMVX9rc5n47B7YpSZtgvm6uEQIrxtpHTv0MO138XdFuYqJDjBX1yz0/vbrDDcpAWX
         uByrwCa/lRApwM0SfmnSQ0Re+67IFz+xEAAHwN9mcURyF315okugseskXRicJI1XrnIf
         6zeBwaDV+l6Y8h/Zh9FT1gMisQQKtjV8UwTRgmNTQrMQkOai+tL+BKNY6R61EcLfXLDz
         7G+KEo9bqtAs7t2HEIPnJqeugv8IG47yrEYTOHk94m3b2wXFbP0iXEWNEhSFshEqQY9I
         ZO5A==
X-Forwarded-Encrypted: i=1; AJvYcCXS7p9ohInfDKh+Ce1RgpmJ52CAfgAsvS99eJmymUHYHXtTDrtkDCgGSdn5zyLUcBRyUjy08hgWR0Rbb6vJmSTj@lists.infradead.org
X-Gm-Message-State: AOJu0Yytyu7elgheZEVWLbrjPf4ZjRIWLet/dYD0msfc6HtqvPZOVUz5
	hTn+YIG5B+IeJbonQa3GzwB80evB9rXT2dXpATGokxutcQGSEpN8GvBYndQvq/I=
X-Gm-Gg: ASbGnct/ePSyfeulqscdv8uJ464tXjr9lHONv1/aYXY1rSLn7Tye86s+OwK+B42C51J
	0g33zC/ZmDZxPAoOHDWTseF8X9k3izBZqh2Z40lkfDbtiddexh5LBo1d/03a9XpicjmANWyv0N9
	FO1UJAboAvhRDE4ifYp6gL/JMkdiTGFz+Ep1L1OUfX33cc1jQcY70tREO+bq5eSUf0HBJxPuXhN
	VhSz2O8q9MR3z/OBqejg5ueU8Np2mz+L2R3z8EO8V0Sb6fqR753Urj9C8yU2iqakLNog+elFtPZ
	whO/O+c/fqjn7wTooSAyZ4DbJALiTo3km63pt94DiiKWBdRr8uO3wQ==
X-Google-Smtp-Source: AGHT+IFQjbRWWPWnXrdkJHVnDwqcGcHfF9uwpPgeKOFyRZHe1CETzGQ7LKb7u2GUPWdd1at8v+uIzw==
X-Received: by 2002:a05:6000:401f:b0:39c:141b:904a with SMTP id ffacd0b85a97d-39ea51ecad1mr14249426f8f.11.1744725100601;
        Tue, 15 Apr 2025 06:51:40 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44571fsm14191129f8f.84.2025.04.15.06.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:51:40 -0700 (PDT)
Message-ID: <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org>
Date: Tue, 15 Apr 2025 14:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250408195922.770377-1-yabinc@google.com>
 <20250408195922.770377-3-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250408195922.770377-3-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_065142_295116_4E1BA0A5 
X-CRM114-Status: GOOD (  18.49  )
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



On 08/04/2025 8:59 pm, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..a56ba9087538 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			 * that need disabling. Disabling the path here
>   			 * would mean we could disrupt an existing session.
>   			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev);

Hi Yabin,

Unfortunately coresight_disable_helpers() takes a path pointer now so 
this needs to be updated.

I tested with that change made and it works ok.

>   				goto out;
> +			}
>   			break;
>   		case CORESIGHT_DEV_TYPE_SOURCE:
>   			/* sources are enabled from either sysFS or Perf */
> @@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			parent = list_prev_entry(nd, link)->csdev;
>   			child = list_next_entry(nd, link)->csdev;
>   			ret = coresight_enable_link(csdev, parent, child, source);
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev);
>   				goto err;
> +			}
>   			break;
>   		default:
> +			coresight_disable_helpers(csdev);

Minor nit, you could collapse these last two into "goto 
err_disable_helpers" and add another label before err: that disables 
helpers before falling through to err:.

Other than that:

Reviewed-by: James Clark <james.clark@linaro.org>

>   			goto err;
>   		}
>   	}


