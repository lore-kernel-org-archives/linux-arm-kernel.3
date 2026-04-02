Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C84ECC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:References:From:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/nnvjn0yilI1+9JqC+f0dBa4pcKrV1vrwVGTdHhUA8=; b=03FQdUzC+ldr6tlyQqD2QsCDaI
	GWBizBqWfccmrN3EODU/lDxYaFicRN2wS0zwtekqvd4k3vPRk8sCwh2nhL+OPTkXSabbIqnQq2oqG
	tSzooxltEd1/CRTOYMiL6QQDwJoQqiqJgxKdiQwa0jqB1xE+zwGKS1hRewbnxnefNdC26rcKiF4Tl
	E0dblOeVjL7GAwofOu68GTvERbCuE/MPF2JfteGcPUbW+7vS5uk58mPxG94Q82C1Mm1A2mK+j3gvp
	7X6W4hog0P4OeFvV/G39zqpou12EdewOjIOuXGekzJUfB2RXc7BKRvEW5/HvXvJIAy1AoiVeHj9P0
	fdwf2pOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8C3t-0000000GyYm-25Be;
	Thu, 02 Apr 2026 07:01:53 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8C3q-0000000GyXp-3gnA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:01:52 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-797ab169454so8211357b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 00:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113309; cv=none;
        d=google.com; s=arc-20240605;
        b=kOVkGkgpKtkdJOy2jB6MZCcJ2lPO2VKIVqtmQdA4EezQ0oLL4v6Qg2aQ+4+55MEiBn
         5X8k9nzd6pwCjyKSeJNAgADfLm4T4fxQPkslBdhp68lanYFNkpUb3SB+qqjTbz42HzWD
         i2UWvNsDmmVSq1BH+VRT/RrOXBQnsx24Qk4LjzKIzempup2AVwHovCmRGwiQ6gXNp7zj
         tZ2sR18NBCMNxcZrtZp5UkakYkmboHb0goi9IVBbKMFMtiswBX0+aDZ0GJIWYcFFl+Xv
         L7OHfzvuiq4vskQkPrEyDtZzKkS9IQrUURz4qNzQ5rZUIdkoHr8QVUz0Ys3Ml2015Y8c
         4tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:dkim-signature;
        bh=j/nnvjn0yilI1+9JqC+f0dBa4pcKrV1vrwVGTdHhUA8=;
        fh=qSZ7t/kAjqZbXmA9asuaD6xYoYopO7EAg7+RmRK+qCQ=;
        b=U7Oiz0RZFPKUa9cEacWtr4phr6IQo6290CZ88c2/rnnJSOFaBRDGS07Ck90KxGkPV3
         3L8cAVCCrPssZeWbhWqI8C88aHngeTiXohneXP6YSDjX5HVqniYQMWR/qoNLk4VFHTMj
         J/N2pege6PWMzX+AIzag+MWT+CGvwpWBSVyMqT0ZySkgjNHPM6S+7VQ1pcNyeXjRfIKM
         ONa+B2NFlsaS5oWAj6zvn3LJdgFI1zYK9YIXWVNu7+FvhHdhB6lzLCP0hrNBJj5YbXkr
         WBEBHB2ifWLo+8cBz2WZHshkVikCcC0kMOB+R5PZQxgkwBgGNYxV/bhXPEG7sxm3qdxY
         bYkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1775113309; x=1775718109; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/nnvjn0yilI1+9JqC+f0dBa4pcKrV1vrwVGTdHhUA8=;
        b=eQ/9qGDMVp2f8Nt98W8UC999d+YxhPRjEka2qfdGW54DWGlDSxJmm/LmfRS1ujMSlP
         OxeZomEs5FF2TDa0pQtOY0bbK8QreNO3UEFlVUVUn0ZJjmkMlBzC0X5srE9HIYyQCuFW
         v1dSVvCfXPntKdB9XgRjUaMiZyr2V3CF0vgfVpk2efylaebT0KBYQ2Wqcn2im2p8P9Jd
         Ps7NE5g8l5E4dKoUpc7ZM6NKkSt1bzXVLWD/weo/Qcd+Ooa9ui0Z9bp/ZhxLUMMGJqy4
         3ON7qN/TZGa/z34QnVrugCyoWRCOm1VhILi5BhEI9cWtG2cx2f4WOuh0u8T3CW3XQpeo
         e4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113309; x=1775718109;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/nnvjn0yilI1+9JqC+f0dBa4pcKrV1vrwVGTdHhUA8=;
        b=NAX7RHEausqtaMowMmwfLSLq/O8WbfG2q16z/FcSwi6vqxgYcVYZAHzXppFYKjfds/
         AdZiHTUFMCFmz0TEseumRigHVK6WopLgVTnCKWxudOFxUWWq6SmO5bt/NCxHCgTtawZd
         M1pWDT+G4PSpdA4oGUBnAmMULHNFnffPXSqcaFse+u9mGbescPF0GUQCZbukut4X/HwZ
         QpKycbYG2b/u0PyXkcvMw53tPCt0C3iUkYXCovk60jTeCIJPX1Nh2/cf8u32Yu2W1Zku
         HUy/jQvS2JIkOcZxj/GLkEGDOtLQb1KnEm9TWtlUwHYfuYRMbOvZKGycnIDamABIXOcn
         sQrw==
X-Forwarded-Encrypted: i=1; AJvYcCX/zWtTKT1OVxGBY9YSCj4coB8JxCVCRWgDZRGinLY07KUDGQUeTOcGRWQW9NbUmqhxFJP0nSerDDa7RdhNHQqS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9fWbxKq64/YV5AG833HXBpW0TGKp+xXUe4klwbqoaK+529Y4a
	jS7PDlAyOeuXAvdXT/uqUxfKByE1oXU5GdXtQNu8tyT0dGLlxw7E1ePS2jc13lMQsuIFD+juHT7
	qsUgxG4/7JF3cOpEQdO39Dg44ETgc06LpUeMzIN1nHQ==
X-Gm-Gg: AeBDiet+7cscjyiaM7waqKUkzjMRZsVcYWICX4CVTrhnFIBtlz4rzjItJJdzVFppjGt
	htmbBVhcDURKoiCjI/5Xr73ZVTV+aF5+cQpLzJqEkk0Nas8mx4wFtcrprT6cHkTO9ebWeCHeSDr
	aYXkpvf1JeU91+qGyeDnMuVNFneiPRAUraMWZfSXBn4d+LuYmUTxIdqfAxkEQGm8/zvKju+8wta
	PeZEs3CkD0bFn1xNZTej7uUngACreQ+USL6in21txR62dnAKU5xezwB96suY0A2zlcIlygzOXLM
	4O0fauN8
X-Received: by 2002:a81:8a47:0:b0:79f:b903:88c4 with SMTP id
 00721157ae682-7a21214d9f4mr54532207b3.46.1775113309147; Thu, 02 Apr 2026
 00:01:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 07:01:48 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 07:01:48 +0000
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai> <ac2r9m9mSMZxgHwN@zenone.zhora.eu>
In-Reply-To: <ac2r9m9mSMZxgHwN@zenone.zhora.eu>
Date: Thu, 2 Apr 2026 07:01:48 +0000
X-Gm-Features: AQROBzCvBf6oUImmXQaI0PNI48VmeBhc1PCRPeIfMVg9ZE_RxL6HflqfM9gE5no
Message-ID: <CAGYn4vxjR2Unf9AeORv8x5GsYzfgxZEJhgR6QwkAvPS+nmRxAQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] i2c: xiic: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>, abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_000150_955909_896B5B53 
X-CRM114-Status: UNSURE (   8.07  )
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

On Wed Apr 1, 2026 at 4:41 PM PDT, Andi Shyti wrote:
>> Abdurrahman Hussain (7):
>>       i2c: xiic: switch to devres managed APIs
>>       i2c: xiic: remove duplicate error message
>>       i2c: xiic: switch to generic device property accessors
>>       i2c: xiic: cosmetic cleanup
>>       i2c: xiic: cosmetic: use resource format specifier in debug log
>>       i2c: xiic: use numbered adapter registration
>>       i2c: xiic: skip input clock setup on non-OF systems
>
> Good job Abdurrahman, thanks for following up in all the rounds
> of reviews. I finally merged your patch in i2c/i2c-host.
>
> Thanks,
> Andi

Thank you for merging the changes, Andi. I would also like to express my
appreciation to all reviewers for their valuable feedback and patience
throughout the review process.

Best regards,
Abdurrahman

