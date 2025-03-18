Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=; b=Tgb1Yzb4poeNwIr2MQBeXNcBux
	MhCZy+Rt3Wftw5wwBsViMFPo3HBBK7AB6VlzxLFyVUpV0UGQzwg3EK8OBS3aVBqQATjAvc34/bOmh
	OaXdqKsw3Iw2nKB/J3Ewl3KhT+bc5zlWxUvyOFRkx1RX/a3aJJBHYEwtrlJobVi1p3eiiK0TCTlYq
	PaLiyj7OPYViTnCtHe8L17OAONsh5X5PRhEgHEI/kwKWqgoScdt3A+1crWToI/s3UQRDmRprsgu1w
	nueOw7dON1zNTAI1wQPk9yIG7N0yi3POle2ZglpZh8tNuoSorpyMabHrOBCNiIARzu+QvmOWv/Z/U
	b8BS3JYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUXn-00000005baN-1qvE;
	Tue, 18 Mar 2025 10:51:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUUO-00000005axZ-1NVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:48:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso22622775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742294882; x=1742899682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
        b=YHEH8KBmzjR5aQlursociZ1f95zdzdkCp+4mdBNoRQRMn+pYiKHoWFJN1XI1iWaB61
         m5jwklBOuATMLLLYCPMxz1QqIHeTUdDYWjYVNXo4vOaMTXbm5/SE3JaDi01F6v3quimY
         RJG+hBqpYLs2Ikqer79h9xpkjCsc3CyGhgr9rNIXWyAsa1/aucwl2NRTTaUyuO6y4tvR
         0WlSWCFX0MxCSY4zLW8xF/SfS6nqTa3HyUP+g9WtlmWOz3wQRC7x2M/gxl4aFnhT1uqv
         0WwlsIFhbR7+OUn3pdP40MpO+dbI6NK9CJ9mQCF9rfxznTkNmM6kitCEegXlMkntBF//
         PH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294882; x=1742899682;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
        b=vKRK+YrL64U0QV1BrMcnrChRVYYuzGuaCxD7ysH+lq3laIuIDcJzOBokOh/zNLiGbS
         0sRSqQrKzVCn9FYBXEnH45Q69SrrNjhtXVkn08QCgoz0ltAk2Z/Vfux72ZlKuo6LI6rB
         X0+VUCMK5AnlzIDBRCrc064dxGmhw3jOdo92D1nXCWtPrIvNZ8bytGT4UTov8KI/PDK8
         np/HAHu9Qc+tIwt8yxt9F6GUMLxmk0Uh4vsvBRD1rwdLzt8R6dfoGLCiRmwfrNE3+JcV
         4OOEw7qLSpxcdMopMj5q0f3+iQ7uZO8fEK9JJeDfWnhVQivUMN7+Y7TtXSl6hVWDFlca
         LQFg==
X-Forwarded-Encrypted: i=1; AJvYcCXzFl+zr75VhqBYaPEbBBa5urf2xlhXaz1XQEuDvE3DGChJg8WnuN547N+UfQGYTBQHrU3GRiQSDGF7KehS3nDK@lists.infradead.org
X-Gm-Message-State: AOJu0YxzPykuB7x9fK0nRlsif8YD96SQYos3XS1xd6NYJolv0ygvNlbb
	58fEi+tuKV+5iNMlZgS4q/yHeTTI2+x0njP4EbY++gV/Hqc+c9GGrTdkUq5DKCg=
X-Gm-Gg: ASbGncug0sEzJhBT1g+SpFUYRBtIPokwZCWXOw39qnJyppfdeXqS/AGO981ohN90A6j
	xKYwhit6GjeQYO0iL9m+qbJbqNYBQp7WQsapgi/zU+iaJLyR+IfNLzSXQhqKh5AEWGC2GNF/7he
	8vg7rpPw0aIvYrZxxdGdR4R7D3sB9PjCXu+rS9biHgMnetgn6asZgaKrhoVGqaVKfUQvOECFfpT
	SFWMw3VPcqD3ed9AYEXYPpPulbUo8M5m3aETok/7DFtJ8AsEMQL9n7C7WPO19wnm/6ZuQB5nhzq
	9u4a+Mk4QXvJ0ZfZ3CJUKWEpx/hAEj5bhOEDewJwgL7I0LFbxSl3mYbs9XzhRcYuDoi4Y0tfkYX
	XByB24QqcV9DHgNNsoIHNsw==
X-Google-Smtp-Source: AGHT+IEvqQm0L33zdjtiaR0kLcpkjVK78vmD/D0qYWBavdIvwJwnojSo58SFbe1jRfiwWGTyvooy4Q==
X-Received: by 2002:a05:600c:1d85:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d3fca93dfmr2270645e9.4.1742294882536;
        Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc4173sm131457905e9.20.2025.03.18.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Message-ID: <a2ecebf5-9d37-49ad-9422-f984d1da8c57@linaro.org>
Date: Tue, 18 Mar 2025 11:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_034804_386778_7D881920 
X-CRM114-Status: GOOD (  14.89  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 18/03/2025 00:24, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> For v6.16
> 
>   drivers/remoteproc/imx_dsp_rproc.c        | 44 ++++++---------
>   drivers/remoteproc/imx_rproc.c            | 65 ++++++++-------------
>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++-------------
>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++---------------
>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++----
>   drivers/remoteproc/qcom_wcnss.c           | 23 +++-----
>   drivers/remoteproc/rcar_rproc.c           | 36 +++++-------
>   drivers/remoteproc/st_remoteproc.c        | 39 ++++++-------
>   drivers/remoteproc/stm32_rproc.c          | 42 ++++++--------
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++++-----
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 49 ++++++----------
>   14 files changed, 213 insertions(+), 347 deletions(-)
> 
<snip>

I get:
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_adsp.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_pas.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_wcnss_pil.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_dsp_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_m4_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_r5_remoteproc.ko] undefined!

when building with arm64 defconfig. I guess a proper:
EXPORT_SYMBOL(devm_ioremap_resource_wc)
is missing.

Neil


