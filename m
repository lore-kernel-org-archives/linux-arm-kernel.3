Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99433CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enWPnFF9uqlsgFFLjvBI4bv4xem3PSExDu33Ls8l+7g=; b=dlnQCpH+bPw2Hwtb2SdVFdM2+f
	qUcZW2nEAmEp/ZvKWRoCS+1xdrwWIEdeQ/Sq8KKXuoqVZRNsyDVL3vL7enLUbqYtFlkGgYed8gvTx
	bxwUyhcQ+xzKkgUyb36Hnf7eiMwkSWaIr1VOAQxEuGgxqkDTjVfs9D1XXcsKUABjxYA6l+MfcUm8Y
	hIytw7nf3XNISigXx0fhjJOj22CX370QISyGOXOA7+8Pie6EAB44SToe3AtxbAwUTFrT3eDK09gJo
	MZBtK4KYiUFU4qYC+iHgfZPtFl1fNqRWMY9GM8i0RMHkahrnDcDJ/jTP6zegr+5WeBIcLCX/okgl/
	HsiIaP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVIB-00000007qqf-3F83;
	Tue, 16 Sep 2025 13:00:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVI8-00000007qqG-3J5v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:00:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32e2794c97eso1987137a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758027615; x=1758632415; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=enWPnFF9uqlsgFFLjvBI4bv4xem3PSExDu33Ls8l+7g=;
        b=XqcamEspU5hKVgb0GUoGBy7Eo2KSuGXSw3ZE1OE9XCXByEIGUQKBD8/2hMwGjagTM2
         JGjqR4jCamRj2wnLAgK82aJZcxVV6PtOA2L12h8YQ/l7AQITe+qnmBBvg9gc856/ArtG
         ob4hP4rGSbfWeV5aAb2ZLHWJP9Ffo6Bf7HXAqiOhBRuOUgYw1pILtafIs1W371ax/2GH
         MjAZz7vSaq3dF+1AjC+LmQY4AL46yNP6H4U/2T8R7P863aeD4O01uJe0HMg/ImmgAya+
         KjTtHKYWzJhrrmtFC/rN2lcmC8cDb6TvS1qoMJqbtkdba1S4rjQj9EfjEzMG37EiTGMk
         Q9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758027615; x=1758632415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enWPnFF9uqlsgFFLjvBI4bv4xem3PSExDu33Ls8l+7g=;
        b=pyAb2oVb3B2T8btq9rOY1D+8mMqqpfobskQ9xxBc0UgYcpUfwXg/wOFWlWwoNF6LD5
         7uCxVKxZUNu2H4/jHk60E1ldq2nA7ukwCE+PkEy0cIaCJAvBC2xV5ObkaFqFmoIbwA5V
         qD+SrnDgznghBgktavOjRMsAwA59w6UZns8DgXUvopI7SVTmq1RN90zi7DlHC22jE/1g
         gqcTuVBjJ0ntDlWRJ6/sNME1kFGxt1hXmhWff3UD4/G5OAQwDE4/XgHFQk1N4xNL3kXw
         QavLzXaRQkDpkkJ5GRhcGyRZ6hCTKScnCALM3AjNv3cNGR2mbQHCpOR3PeW8/ibxdvHu
         Pfvw==
X-Forwarded-Encrypted: i=1; AJvYcCWMbLqO3e8wLT3hbI+cBZIFe5iy00WkT5boFoACMFe8Pjwyzx3+4S7xHl+zwb5q9BdvQWKhtU5s4wj5tV6x3lt8@lists.infradead.org
X-Gm-Message-State: AOJu0YwWyss4i9+5zFu3JjKq3lpUbybHq4SJyJah3bFhpZQmwPVaE7mh
	sz1SpkVDfwtH1B9SiyKNibTdbOTGCRkrDgrfVcOghTeybPCqQ9GKj4xcj3wnvPJ+3Ku0cTnMzVg
	rvhOkwAI2fFdlLI+zu7ow2QQ2BcrA0bPmnxZ8u4zH/g==
X-Gm-Gg: ASbGncuivBSL5k4fUeW8xpijq6axxaqMzoZXsmpF5nyWdIxPhI7bdsE/Ynu/lZnD0mR
	soLZ6BRGT3Ltc7ecarvLW0oojuAaMDEerjas91IFtLcKM9/S8C3faZ/RwjutZMHeAjw4ZOzhtKb
	gmCxxTiZg3JOi0OLZMGlwRbkQYq+FHf8ELwAg5JOmNOplDlcHmGX+CeihcRSypcoPMwO+/RYvSb
	TTYNSJg
X-Google-Smtp-Source: AGHT+IGuQ/ohyWphuBlOtHx2+flX1KQCvCuCmbUoGGofMYdbPyzMKkQ4xeZzDRKvWShPxbaO2iXYgl4CZlPA5sTwbe0=
X-Received: by 2002:a17:90b:2681:b0:32e:b87e:a961 with SMTP id
 98e67ed59e1d1-32eb87eb05amr1186270a91.5.1758027615318; Tue, 16 Sep 2025
 06:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com> <f9d3b3ec-dcf1-42ce-b925-70e5543771ed@oss.qualcomm.com>
In-Reply-To: <f9d3b3ec-dcf1-42ce-b925-70e5543771ed@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 16 Sep 2025 14:00:04 +0100
X-Gm-Features: AS18NWBql9OifdFvQHUMyc5To4QvLJzN5-WAsAMzlnEGRTrG8ZguYOFhnqgDcCM
Message-ID: <CAJ9a7Vivhrx2zss_8Ti+QS1dzakp+4CrAsDj00RKojUaL_t7Sg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] coresight-tnoc: Add support for Interconnect TNOC
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_060016_850770_1219A37B 
X-CRM114-Status: GOOD (  28.74  )
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

Hi,

I'm a little confused as to precisely what this component is.

From the description in the DT - it appears to be very much like a
static trace funnel - multiple inputs, and a single output.
The DT describes the inputs as "Coresight Trace". What is meant here?
- if this is ATB trace then this component is identical to the
coresight trace funnel in functionality so should probably use the
normal CS static funnel driver.

However - if it does not appear on the AMBA bus - how are the
coresight management registers read - these are a mandatory
requirement in the CoreSight specification for any coresight
compatible component?

Thanks

Mike

On Tue, 16 Sept 2025 at 03:35, yuanfang zhang
<yuanfang.zhang@oss.qualcomm.com> wrote:
>
> Hi Suzuki,
>
> Could this patch series be applied? Is there anything I need to update?
>
> thanks,
> yuanfang.
>
> On 9/1/2025 2:58 PM, Yuanfang Zhang wrote:
> > This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
> > (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
> > trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
> > this block does not support aggregation or ATID assignment.
> >
> > Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - Fix unintended blank line removals in trace_noc_enable_hw.
> > - Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com
> >
> > Changes in v3:
> > - Add detail for changes in V2.
> > - Remove '#address-cells' and '#size-cells' properties from in-ports field.
> > - Fix comment indentation for packet description.
> > - Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com
> >
> > Changes in v2:
> > - Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
> > - Dropped the 'select' section from the YAML file.
> > - Updated node name to use a more generic naming convention.
> > - Removed the 'items' property from the compatible field.
> > - Deleted the description for the reg property.
> > - Dropped clock-names and adjusted the order of clock-names and clocks.
> > - Moved additionalProperties to follow the $ref of out-ports.
> > - Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
> > - Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com
> >
> > ---
> > Yuanfang Zhang (3):
> >       dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
> >       coresight-tnoc: add platform driver to support Interconnect TNOC
> >       coresight-tnoc: Add runtime PM support for Interconnect TNOC
> >
> >  .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
> >  drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
> >  2 files changed, 215 insertions(+), 11 deletions(-)
> > ---
> > base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
> > change-id: 20250815-itnoc-460273d1b80c
> >
> > Best regards,
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

