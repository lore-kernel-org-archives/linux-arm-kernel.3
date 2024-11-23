Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E449E6ADDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnE1fh8DohPbSNpNzj+HBmWVaNwZTwNhXhEKJ6OB2W4=; b=CU/gW9f+NeOrCjUxgCTxSCjkEe
	WQ4O5tChA0+67crs4VxdRnHlpqWAQNo6Sk/ddZrU4cousIROB/EtNwoDKIMlbehYhelTVyabrPj+X
	RgljAfNwJSz+470arKEgEJqnpsitj+BGFMpqKXb3RRrco/agJUq7TCzSb9TSfUfMiBs8b70diJeGl
	JSaMInRjDho4+RE9+vBqmsIbMK75TMjgXVE9MewxByuIAw3mA8jJ0M7tDixBGprO6g1EOZ5kdLaq0
	XgfWfbMOjkznBSGXKAFRtc2uNWdCxwShOvB9vGaXIP7ZAjcjNZ+2M48LapfdYrY17PvO44owU9V7y
	bQXhCnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEszV-00000004bSz-33Bc;
	Sat, 23 Nov 2024 16:28:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsyZ-00000004bIO-21wh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 16:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5020C5C4993;
	Sat, 23 Nov 2024 16:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE77C4CECD;
	Sat, 23 Nov 2024 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379234;
	bh=rYPtwX96kL+DQx3Yw2qIdybweyPG3Z4vJWWX07F34NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bujCqpfCQ34yd5Vh2n/hK9uYYtnd5t75UcqWdmMD5RrFTo4fZigbAs3gnHvEP4Vqi
	 4L1uEop3JK5ZZIaMRRSkOApUPRgLhJKuCcvXlsy0D/22hYnx70he9Z5UwF1gCRzJbj
	 WU7gDt2UnSvbGHUF0LPE2cmJwQLB+5rlvYMWq01w0MwarIJmMycxY54osEkcO6kgFU
	 xoAc8QI7jbbiaC/mCwse7NI173tmQkJzh/PNVyaejsL01huN+eVmQ1rz8DfzuNR7Wx
	 JIOXiIYy+9fHxXC1HF3lwgQ8PFYbxCgUwVQAs0/Tlyml+dyCrxuAT9uw1GYM2poIuT
	 GmGdGEfDVaStg==
Date: Sat, 23 Nov 2024 17:27:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/9] dt-bindings: display/msm: Add SM6150 DSI phy
Message-ID: <e77zznwyykplengox26j4swdf3lqkd347yulkzngmbcgqrzhjd@bywnfgaigrih>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-1-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-1-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_082715_562884_4609AF9F 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, Nov 22, 2024 at 05:56:44PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add new compatible for SM6150 with dsi_phy_14nm_36mA_regulators
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


