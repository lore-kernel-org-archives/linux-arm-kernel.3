Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F029E6ADDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtE2Y/J5bwqOiQlvpjiP62bROA0RfyMK7PmtzJ5HNbc=; b=3+i31zyEu0lpCoLedjQwcOI9hT
	ccmxXMYTKpbakmRXPU4g5R4e4z0LBYXOEMznX75XelJTeuMIWp+EWd885swKsnPvTcGsTgeF35PrQ
	Dci/FHv+lrw3/BjvHUxLfmms7T9QK0ydBAVNZenAAnxNVTBz3Zp5pLmhuV9j+KfEnizqbxxj7Mf7k
	ANmvb7OdUwC1KukoQWTlvyqqg9S1wMswQk59F+0k1Z+TiOgGLrZCv/IDc7ekZQliNi1GUPiFQQbpn
	7qF2YdhzfzufUEXVDtk4uxhZ0z6e9TK6oIfu4/Dxr/Y9YjVN5zUbQFyk7Dv0+NE4uEnWmHi0UegKC
	c5qOjWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEt0P-00000004bdR-1NZe;
	Sat, 23 Nov 2024 16:29:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEszN-00000004bRM-3p1s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 16:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4F83A4049E;
	Sat, 23 Nov 2024 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17970C4CECD;
	Sat, 23 Nov 2024 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379284;
	bh=4kW1hmaRcvlW822s40y2EmNJ6JjAbCgKF+oCMp92zm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OdjP/2gm7hiTwtGDqfK0SBqJNDJFcKbVC0EY/2C+H0qYmNbeQAhvEUp+uf3cKSsFC
	 zPn/BP7qIIsTA8dHcM9ToBBd5PpdR8mlERcZV1FK8mtkm46H4cPTY3y38RPRON6j/i
	 qbY/RI3amOroUnQdw7QGiKrJH5usRR7lEYxY9NUhZ2IF89sE31ze9/tw1iLlv6ywVP
	 NqbNZhFcWSDIgfIKczxfXRjY6HcGEWlev1BH+aFU4YowMy3oymW29pKSsOl1bXcoYQ
	 dahDTEdSpMlH9U7qFuoZkvkmo4mnrPWaOyXUUluYTHg0HUrEXytlpLvRO8lcpLSnls
	 gLqZpjYOC1OiA==
Date: Sat, 23 Nov 2024 17:28:01 +0100
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
Subject: Re: [PATCH v3 2/9] dt-bindings: display/msm: dsi-controller-main:
 Document SM6150
Message-ID: <grizxfiq3zlquijtufhtjnnwlq2cl264ouzxrglroafreoujoz@lk2rjcaa6lxy>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_082806_148591_BF0978C1 
X-CRM114-Status: GOOD (  12.74  )
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

On Fri, Nov 22, 2024 at 05:56:45PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document general compatibility of the DSI controller on SM6150.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..a7fbb5af4b0583e88ebcad07dd004046c38f95ee 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -30,6 +30,7 @@ properties:
>                - qcom,sdm845-dsi-ctrl
>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl
> +              - qcom,sm6150-dsi-ctrl

This is incomplete change. Where is the rest for clocks? See entire
file.

Best regards,
Krzysztof


