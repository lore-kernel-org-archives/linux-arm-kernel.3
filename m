Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ABAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tecvAy+u2nTgNfC9RdDCsqyar8u41Y2yinoQJZWxPw=; b=wAduadW1J8PklMFavTzslSTOhx
	uWeJhzChEfJfVWth42N2y1w43rXTHTKp/OR/4/7kxuk8QucDcC443/FokG0BwZGna8vlp8wJ+kvok
	Id7CPrvaZpT0th5Q53MrEEmunn0n9qWdd7scVduzUW2IzcDYuU0eadouejvZkJqlnvkkp68pSlWf9
	hGISZWVeka32LWv1fR7WrcyJobd6m42J+JzOLX2i6hdijP4/tGiVj14Y82F2zz/bufF5HEpV/hFKV
	vN4EsGYq/31WiylsrqrlBjCbMotKLGy72WJl+10fYXFB5ybxaO6PiVl4sR3LAJ4xVuI6nxYW/x+vC
	WIIu73LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4N0-00000006d3k-0kXG;
	Tue, 11 Mar 2025 18:30:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts43W-00000006ZRz-3wmQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:10:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390cf7458f5so5598451f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 11:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741716617; x=1742321417; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7tecvAy+u2nTgNfC9RdDCsqyar8u41Y2yinoQJZWxPw=;
        b=o7atib6HZutYCb5tFw2o1uNp0ia/NVepKxcZebDQf2X9Vep3zkSM4LIBDXKe53eeOx
         AgkXDwPdJjwI0WNls1ZdW8Y1xwQPeLMAWvnwb2mRkmux8+18uWmGfRfEgnYNoPElq2Gm
         geQ3CFl1Sop1VQz1u77TkYjrZ/9vQF0f+6b2eTINVR4xw1YGcPEnK2TU0cYOUlNvtFkJ
         kg0IgBfCwdGGSo+5NnwEWwKcN20Ya4GLnU7Y2JeHOhNK4n+5xxYaK0TdQa/UbbOhqcMN
         FyKqLunUmGCc9xtZhKqTY8y1FuVwpWb5sPCQLiis/5ihVcPnOJ+yYh1gdz3tXeiOSNWl
         BZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716617; x=1742321417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tecvAy+u2nTgNfC9RdDCsqyar8u41Y2yinoQJZWxPw=;
        b=MSuCtENtYnRMXGxWBmGhmPq2d2rXrhmiYvFN965rBVM1zrkX7GeRHQEdJOSXQ3tve4
         bwAMyhcDibWFT3roAGBTKdZC+TBqcUX5bGiw3EM/nxnUReCUHOsbyDsfk9l8Xciixu6/
         EqZPCcP6TsII+q3o7fKXEPWN98nrRPdA0MIret+Gz4/jqcZnHpGBR04a3w9oqWfsstr6
         4YdB28kcBSP+hlBIBpVvJmtVFJmRRXilcbHt0uJd/LUTeCzbGukmyfPG9wwGViJOrl6C
         gv7c1/EZ+304YrFqIFaPgY5xyPYv7IdYxBn25OwrC519lJJmsUNWDHk5Abi8mFI9DvAS
         RMdA==
X-Gm-Message-State: AOJu0YzL6F/4hLo7ITC2KdTJVcvD1bA8ZBNcfDCHvbUPsWrFpH1GEgGJ
	4DU5ad3SXNns0vScZhex2T3ZotB7TwKVEdnS2FqiNfv7O4Hq5CoNvZ/Swj9ag0rvg2k24V0qo08
	4dmlTCZoWgji6dQQlH+6qx288pgK2EqytcCIoNQ==
X-Gm-Gg: ASbGncumvoQ4I0IJAS1LATRRJ3CoTSvjdsFcNLV2rWuNhyfWXNCg2UL1S5zjZn4jJK+
	laNGkvMa3R8awqlSdsLfF/EzFVA2nVy9VLgidxZAKYWJQivHiY5lgqSraWQUajMdfNMjlICgSq1
	551EfpmPYvSKmS906aex86nObCwPc=
X-Google-Smtp-Source: AGHT+IEoMIu2qa0ouzgu4WMGPB2l4x9tF1jT5ThBiiWJB8oICkXYch22N7BWvOSIBrMFeOfJO4XpxafHp8QkcQy5AgE=
X-Received: by 2002:a05:6000:402a:b0:391:888:f534 with SMTP id
 ffacd0b85a97d-39132d39209mr19655289f8f.20.1741716617093; Tue, 11 Mar 2025
 11:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
In-Reply-To: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 11 Mar 2025 19:10:06 +0100
X-Gm-Features: AQ5f1Jog8mLk3h4VXg6PLgDM_85qkXGsgrKxdx2EG0uqVayo6r93gzulMiKOPb8
Message-ID: <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111018_995179_A77B5C8A 
X-CRM114-Status: GOOD (  20.99  )
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

I sent this patch to start the discussion, some things I found:

1) Some interconnects are missing from arm defconfig. Should they be =y too ?
$ grep CONFIG_INTERCONNECT_QCOM arch/arm/configs/qcom_defconfig
CONFIG_INTERCONNECT_QCOM=y
CONFIG_INTERCONNECT_QCOM_MSM8974=m
CONFIG_INTERCONNECT_QCOM_SDX55=m

2) Some interconnects are missing from arm64 defconfig (which should
probably be in there) (I have included just two examples):
$ grep CONFIG_INTERCONNECT drivers/interconnect/qcom/Makefile
obj-$(CONFIG_INTERCONNECT_QCOM_QCS615) += qnoc-qcs615.o
obj-$(CONFIG_INTERCONNECT_QCOM_SM7150) += qnoc-sm7150.o

I can handle these in follow-up or v2 of the patchset as follow-up
commits, please let me know what you'd prefer.

On Tue, 11 Mar 2025 at 19:03, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Currently some Qualcomm interconnect drivers are enabled
> as modules which isn't overly useful since the interconnects
> are required to be loaded during early boot.
>
> Loading the interconnects late (e.g. in initrd or as module)
> can cause boot issues, such as slowdown or even not booting
> at all (since the interconnect would be required for storage
> devices).
>
> Be consistent and enable all of the Qualcomm interconnect
> drivers as built-in to the kernel image.
>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_IMX8MP=y
>  CONFIG_INTERCONNECT_QCOM=y
> -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> +CONFIG_INTERCONNECT_QCOM_MSM8916=y
>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> -CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_QCS404=y
>  CONFIG_INTERCONNECT_QCOM_QCS615=y
>  CONFIG_INTERCONNECT_QCOM_QCS8300=y
>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
>
> ---
> base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
>
> Best regards,
> --
> Christopher Obbard <christopher.obbard@linaro.org>
>

