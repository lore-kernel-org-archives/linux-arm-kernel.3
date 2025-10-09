Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD82CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zj8LfnqLwL+Gx5l1gM/bvFwx6FdJuno6EYMDHRGmO08=; b=1tLbYyqIVXT3VKGgYOJYzaPMWO
	UkXxu+TUr7BItp5J1+PV0wQX7BmG2VQ6SeWYfIY4i9xk4WyuFBpVLmm3hTGxKbezm6xdOX6rkqSuN
	UlIFERH6R0kMqExzyEFeJFlF1dSoufNVZUWOMSalSN3I4ajVhjFBE283fkxWAqMAszv0+9kGyb0e1
	7FNc9UzpZnP30KgQUgl1fIak2bWVhApPzd0oqRaBI46mdUfPEAQ7rc2X1slevuQ9zoXnlOfOXB+mo
	jPpJry3zUr505k3mEjHs9CtyrOmkYnqHJhNlQDANuDSfb6H6rMhB1RT6RxpjMIERztdsh5+qsA4ba
	CB5JcRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t7S-00000006dfv-3PfS;
	Thu, 09 Oct 2025 16:03:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t7R-00000006dfO-1ELJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Oct 2025 16:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Zj8LfnqLwL+Gx5l1gM/bvFwx6FdJuno6EYMDHRGmO08=; b=lWasHItFiufp70iV8qVmEOgwbe
	2OZdB7XvxCqNS8dDAHqxteUw5s7IFCBSyuZdU9VNvfz+idfMajC/Db3J8DjC5alWbdqdpn4jz+8tZ
	yQ7C4gWUIrdexqduuCyqoASGt5sU8wPKlSZjEvd1m+VhJ1Ic9zBvG3s4HryBwZNCki3ZwHCpnLYQg
	MeNUx8tOpOSmvhm9c9NlPzU9p0/1eHwfh48QMLgjk8GVPNHkfRSvwoZmPOgJDQt9LArnhn15wfKxk
	HXS4rG4yhSkn1K/eWqGLyBPBnTFwqhP/4hctZZ+pH3zJ3ucIm2YlfmPor8MMv1yEKk0XOaVCp39On
	HAQtmoTg==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t7N-00000001Y3g-15lg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:03:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3304a57d842so1051514a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760025825; x=1760630625; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj8LfnqLwL+Gx5l1gM/bvFwx6FdJuno6EYMDHRGmO08=;
        b=VzqBbfs49kReIEuYxYHJMKYa3knfihFN/QOxz5l44AVZluQDTRHu3GHQtPEs1XGe2s
         x3DMCNKMsgWY1a+RThm7r7TjucDo44HU7Yd3GLxyJCeEZQCHdy4s4HWH8XJXtMQ7ee20
         dYjSTFRyXAFEZBO6lbaCPdTEO0KY/STHHLlfi9Lk3q6WgPzzT77Tg7/ittbeRGavYUaJ
         RRF23t853WY9OlPBjXt9Ztcl9tGNykFNIC/KUqYckTDrAW2Q830u7o2j6JXleu7b03i+
         dkOaGIfQt3Ww9LcK0f7ubSM08ZKw+RlQ/0Gv6gaCnNrnOsMtZsW5fh05FDElHeznWHjQ
         Hr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760025825; x=1760630625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj8LfnqLwL+Gx5l1gM/bvFwx6FdJuno6EYMDHRGmO08=;
        b=l9TZXs5FzykzE/wrEI4PANamp5VmM0L0/CLds4anRG2dFbFlbgi837Dr6MflTbeWqp
         y5sP3D3R4baAA1QSWNXdZWHqTtvKE1p/byph2s9I7WfUv8VGFeSr/cdw8JiNyVWZHLzA
         cgPHt+VorzZSaXlraf9hALziZJ3J9JLM0TY980hhCMhdRg0p33ktEvmxxFB1+gSkp7+n
         b1uRZ007MO3LUEs83XJs0/nrYRhwRLptp0dixPS2/cd6pC3DMAkj8MQPM0BLSNSwZ2Ww
         4aUhrl4kHkTQY+eVY6UE4orWdiZLGaQP5Ao5oPiUVc7wfa0ZGBMxxw6iF4P9opATTYaj
         mg4A==
X-Forwarded-Encrypted: i=1; AJvYcCWWv99Udea3GwCX/KgT8KlVJpFIyrxZ12KC8Gw34i6/KRty4wh1EA/0eCFVtFDyYKOXHVh1MezfpDY88hiN+rHD@lists.infradead.org
X-Gm-Message-State: AOJu0YzDYQ8XzimcNtnF0KnyNlAG3VliT0J+ZvLgmtx3/LdWGOf5IDmC
	g2ijg+r46xl5vTQax+uk2qpevNl59lo0uI2a0jDEg7t8XZ6kYIcHyXscBgY8mtQFylrgZ4Qm37R
	yrFG9kA7sa6gbRjvRkDQ1j66Rf1aZIEJHO3qvH6Ue+w==
X-Gm-Gg: ASbGncu5CvQOpD4vBmKTOZtG4A4edcXU0eLwa9b3P/NvF4je8ryY7WRctkRLvZbxG2o
	KmXfaqA6hdJ1HHd9wbdNIDwXcqHEzJqa3xc1WqHFC6poVhgWKIo4GV5QpbjPipwjqJez/qODMMV
	6zXYFEq32gTDjIrsxYbG1pkOAn+Xtz2Opw1mA+AzdP5C64RCWGbMMXuQ/cqtcdebsUa/J3vkjjZ
	08C52L0ge6PZJw7g6LnVvloT9l2GiVssaqP
X-Google-Smtp-Source: AGHT+IFWZP1sOUCVxhD5rut22TgyJiSvAxe/PqeY6yT6cbXfcUKECeTUVY2YIzCllx+tjT2TLCT77aX1c7tYXB/6Wdw=
X-Received: by 2002:a17:90b:1b50:b0:332:250e:eec8 with SMTP id
 98e67ed59e1d1-33b51168e20mr11597847a91.15.1760025825128; Thu, 09 Oct 2025
 09:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org> <20251002-james-cs-syncfreq-v3-5-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-5-fe5df2bf91d1@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 9 Oct 2025 17:03:34 +0100
X-Gm-Features: AS18NWBRPxicWlO6Xkw2qzlt4rKgSo68ZX2bh5k8tmBbwfyeBqn1yur95FngjNs
Message-ID: <CAJ9a7VhZwXdGQDDqQ=o3D=yVOjZ5xdqHKvXRdM-Auu6pum6JuQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] coresight: docs: Document etm4x ts_interval
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_170349_375208_D1CFEC2D 
X-CRM114-Status: GOOD (  23.23  )
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

On Thu, 2 Oct 2025 at 11:10, James Clark <james.clark@linaro.org> wrote:
>
> Document how the new field is used, maximum value and the interaction
> with SYNC timestamps.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  Documentation/trace/coresight/coresight.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 806699871b80..0cd83119b83f 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -619,6 +619,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
>         value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
> +   * - ts_level
> +     - Controls frequency of timestamps. The reload value of the
> +       timestamp counter is 2 raised to the power of this value. If the value is
> +       0 then the reload value is 1, if the value is 10 then the reload value is
> +       1024. Maximum allowed value is 15, and setting the maximum disables
> +       generation of timestamps via the counter, freeing the counter resources.
> +       Timestamps will be generated after 2 ^ ts_level cycles.
> +
> +       Separately to this value, timestamps will also be emitted when a SYNC
> +       packet is generated, although this is only for every 4096 bytes of trace.
> +       Therefore it's not possible to generate timestamps less frequently than
> +       that and ts_level timestamps are always in addition to SYNC timestamps.
> +       Timestamps must be enabled for this to have effect.
> +
>
>  How to use the STM module
>  -------------------------
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

