Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6D6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBHO5DkgwwLeTufaaCOE3ZnuCbkH/gU+aNGIgHEYT4A=; b=ni3WjHtt2zpbUytlRiqOKKzi2p
	01YJmMMDvVE3GvFqoAsproCZYc8fBvn6Xw2t31/YHBir+bNBGMjExvwTuyqXcxyrK+iDlxWOdYVVk
	BRR81b/v2ThPMn5CJjXGHXceM+eK0NtaIoiv2ZGmMeAuzKX6NjqgfxH0I6Gxf79+HfzxDUsI/Qxyl
	FLwqVD7BvK3+0y8xuK92lmROmqZbRYmqMG7+ex3EtkMfstgm4rEWPEzjWY5Mlh48UnMmpCGMm6Ug5
	y7n1TJWOrjBDPOZmeMOnXiOiU4L/uY+OwPcORd2vzHh17e+YDJwWGmwcRm4498NRrdhecqm9QVdqV
	UsGNNoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmQX-00000005ueE-0ip7;
	Fri, 31 Oct 2025 10:32:13 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmQT-00000005udV-2azV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:32:12 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-88e51cf965dso313202885a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761906728; x=1762511528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBHO5DkgwwLeTufaaCOE3ZnuCbkH/gU+aNGIgHEYT4A=;
        b=sMimPTWY9FHO342YEok24FVSVygmc98xHE3NVIKOkAPWfBJts4h6cxNMa8yvPqNlXX
         hm0gAPQPCo2HcJpC/Gs3sQkBX/BDSiGQtezOCOGV+enFoH7jEh+7Fq+sqOKdmo6MG4KM
         AAXTufU+Ed8+CbrXlAyCK4f82IcawI7v0OmmAnFwtXebRQMvU76T1ZJecDuc0eC49kTd
         vJmciD55JEAM326vvuAJ7l9mghd0adawaXsWzRmlNNKO+34LnbfPlxQdNk4RVKJiLt+o
         4Ca/PljvgBmAxGYTf7W0MO1QR4muRhdsdddGeFDDrP5RlrJXSM11s2rvsMTpUJdyfwko
         G1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761906728; x=1762511528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBHO5DkgwwLeTufaaCOE3ZnuCbkH/gU+aNGIgHEYT4A=;
        b=iNzQXonK8WfyLym0HZARLmiuda7RNVDv7DbyDVNu0tLVMb/klebdV3cgni6+1zwCE1
         1AZHFEfst0REHYhpdeoaEeoC/RCgD3V1+wS7EnZRcg/tME7V0NA5zt0OJThSYR9bTsxs
         ibigZsDWAAuDjrcuV3UUpXbFkEhZm+ad3fTANDGI/4adyBrppFMe7sBTQ9MNSQr9BBde
         uQr96c7YGjShmtx2rZ7MpaPFAjfiljAt4thcilC94SoUvGLinWZXOHgwyhdKnPFFWPi6
         AcqF2xKdx/xLqm3Zf3kRgT03J7RvA9MyGzLS6HszAy6VyVd1+vZGCkbbgLJSosEOYGIw
         jswA==
X-Forwarded-Encrypted: i=1; AJvYcCWjmlHh3CXMOsc5VLG7Pe5vK0iJbFs10oKV3/iS/VCKlUUPQ+6nY2fBjjar2zTocSmmPKW6eNMFgHYS6YFWGRi7@lists.infradead.org
X-Gm-Message-State: AOJu0YwzBFyzOz/F5eU5hv85zfFQPH+MMfDLSGXGil+nGeaYkhBrtOkd
	2veX1AdkAkIBye+Qnv4f5IPViuaAgE5YHeS4HzdcOV1lCnK4Rj+F/kPVpJ6Z8wQIE0bzVtB+WYO
	qJslRi5uU/ZuW6k3ACp3bW4XMVto/yLEa6xLcZv23lw==
X-Gm-Gg: ASbGncs84+njwsIxWrY0KHRtUhBVjv6F9mCSpED9P4Lo1UkyNNDJgIM99c8SXomws6k
	5VV2uLdHmRtKWmgava8ghimPN36GH+X0bOKkuWcVxmaL9IXKBjgg2PAq28e9/U0oLN59UIi2Aaw
	boswaYqj4dPfUIwqJzZKnevW63ofwgSlw0ESArMX4FTpVtEoMq9X7XAe0vpYoAw4SpBY8vijNZS
	paqYkB+QdJEC4WAK5+4izc+CGPiMv870vCmGtCum58Mrv/NpdMb6B3hgyDit0cccc72jBBOEwF2
	baOVpfYihjQgQFGmvg==
X-Google-Smtp-Source: AGHT+IHu+NHlSWMWZgBbLXx+pIUFMav8YMQmxFZfBPTCoDQCkEpCLEoQ8xm5xc5cOQvFGZ4xecaH79wXPEyhGj06zgA=
X-Received: by 2002:a05:620a:4590:b0:8a5:4246:686b with SMTP id
 af79cd13be357-8ab998806ffmr315842185a.36.1761906728163; Fri, 31 Oct 2025
 03:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com>
In-Reply-To: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 31 Oct 2025 10:31:57 +0000
X-Gm-Features: AWmQ_bnPKuVtHaksPvutzIO9xzBxS0KRp3OKWBqD3D-KPtG6AzFEkqk1d4z4hs0
Message-ID: <CAJ9a7VjTqBczkdMYXqb1WmDRUYhC--dY6Ky5R=NfUZaYkiWmVw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Jinlong Mao <jinglong.mao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033210_788857_18AB3CF5 
X-CRM114-Status: GOOD (  26.05  )
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

This set is looking good now and appears to be getting close to being ready=
.

There are a few minor issues in the second patch and a few items that
need to be confirmed.
1) I note that you removed the code to prevent calling claim/disclaim.
Does this mean that you confirm that you have tested the patch update
for claim tags I posted works on your system?
2) In patch 2 I made some comments in regard to ARCH values - please
confirm that these are accurate and have been tested as working on
your system
3) As mentioned in the comments to patch 2 - you need to update the
docs for the new sysfs selection file you have added

Thanks and Regards

Mike

On Mon, 20 Oct 2025 at 08:12, Yingchao Deng
<yingchao.deng@oss.qualcomm.com> wrote:
>
> The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=99s=
 CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs on
> another processor on the same SoC, or even between SoCs.
>
> QCOM extended CTI supports up to 128 triggers. And some of the register
> offsets are changed.
>
> The commands to configure CTI triggers are the same as ARM's CTI.
>
> Changes in v5:
> 1. Move common part in qcom-cti.h to coresight-cti.h.
> 2. Convert trigger usage fields to dynamic bitmaps and arrays.
> 3. Fix holes in struct cti_config to save some space.
> 4. Revert the previous changes related to the claim tag in
>    cti_enable/disable_hw.
> Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-=
v4-1-7677de04b416@oss.qualcomm.com/
>
> Changes in v4:
> 1. Read the DEVARCH registers to identify Qualcomm CTI.
> 2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
> coresight_cti_reg_store() functions accordingly.
> 3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
> Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294=
-1-quic_jinlmao@quicinc.com/
>
> Changes in v3:
> 1. Rename is_extended_cti() to of_is_extended_cti().
> 2. Add the missing 'i' when write the CTI trigger registers.
> 3. Convert the multi-line output in sysfs to single line.
> 4. Initialize offset arrays using designated initializer.
> Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_ji=
nlmao@quicinc.com/
>
> Changes in V2:
> 1. Add enum for compatible items.
> 2. Move offset arrays to coresight-cti-core
>
> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
> Yingchao Deng (2):
>       coresight: cti: Convert trigger usage fields to dynamic bitmaps and=
 arrays
>       coresight: cti: Add Qualcomm extended CTI support
>
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 144 +++++++++++++--=
-
>  .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 184 +++++++++++++++=
------
>  drivers/hwtracing/coresight/coresight-cti.h        |  60 ++++++-
>  drivers/hwtracing/coresight/qcom-cti.h             |  29 ++++
>  5 files changed, 346 insertions(+), 87 deletions(-)
> ---
> base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
> change-id: 20251016-extended_cti-2a426c8894b1
>
> Best regards,
> --
> Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>


--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

