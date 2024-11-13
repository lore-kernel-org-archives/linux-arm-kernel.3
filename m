Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5839FD41C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGtyXwzMBHOXtnkZD1IDl7RIyBTD4iUeJ455sdaUv4M=; b=TZzslamUYQk0UDziPHfw1Ls3Am
	hQPqeE2f+K8cxGR2p4vmWJ7uzMOhBU5YyTmLkrlzndVBOGILAEM4cGn9PQcyLokSoViE6ztffAkc6
	BaZrvcY8U9V3qdhyfGl+7Kp6Xewq0XspV8h1L0o+U1wWfRIglNODadT9Ft0D2BdToGSP2kVYCvWH6
	tgnMtv+0pepDOh3WlIzazkwCHivzfBEJMEj6A6Vf7P/MxI3aKWKY7Jrv2e9wMciWXkr4vsF+0ihyb
	ucuHSGB2eQjI3IqEL3Pd5PcVUjUrc9yBLUdtfw6fW/uK13GRf7Ju+YfwCA3mdn4gBDAw7hUYIQE9J
	PEKj807Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCJC-00000006jcJ-2VCt;
	Wed, 13 Nov 2024 12:17:18 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCAI-00000006hoK-19RL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:08:07 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6e3cdbc25a0so68445077b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 04:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731499685; x=1732104485; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UGtyXwzMBHOXtnkZD1IDl7RIyBTD4iUeJ455sdaUv4M=;
        b=RCCW1rI5no6kHsskECbRr0HlmbIEJCrnKVbO5dr+BNh0Pvg6p6Gyz/CEG/gsiobRaK
         SnA7iHoQ1sHIK9ELDtKHZ+Ite5vvbUm9RJNAPh9Z3zDHX1y4PeZEtZGbvNTDXkA/Pd2E
         UjpE5gLzbSwFsl2OtiSP7Kebb+NuByXNWZLkAm3NMuKSDRXLbiP1FSsyt7vDnka/WRit
         QjudlrlYPVr47r3KVAPLJg3Us2/QQ253Wm3HGJ2WPRrSBx+Ire7qCAbI/TSKAud77Hk0
         Ndv8xVRDpgS0TYTTyRDj6CJniJ5Bk91/YI/1DJXHryKJe3pEUoUWrhpgBC5Exq2yRDD6
         SeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731499685; x=1732104485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGtyXwzMBHOXtnkZD1IDl7RIyBTD4iUeJ455sdaUv4M=;
        b=l54qLCdQCnvH4lDPINI/9huSZhUGBDUzUJOoRJVO5E2oNpmRJTrUNLzCzc+LS0U8zf
         1nSwBrPKuMgCQQ6KqMXc/bQF7VaN+Zicj/lxrU7a3Zs8htfaiVQD78iJECmALQlHOhOr
         Q4phAwfX9dB8ginCvka/+uFrpASY8jnRaxq9yVXjpXapnuawxUIk0NlptO7dFZWgsTUJ
         eu9fR8ABJzvIW6LBdw5BVI4kjktF447bOC3zLTXbx3JhRTPEYbRYlo4Rrl5yb4IvJJS+
         NfeUn8NAtrRlQhbOxG9X7fn1lqkNgSLQmuv9MFcjYAwc+SxLLbQjiGYH2fnsfm3AnU2C
         t3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3r4+FBzohyewXAzP7xIqAddRkZfvCbJMHaYodZsoeI3jdfPoAkZBgpyYVXV9fJwTzhDZeL70q9jK4lNxtb7Bn@lists.infradead.org
X-Gm-Message-State: AOJu0YwFLZAl5I35tLXhkYjda66iyzAGR4cIgPbv8GtuFV7VUntSQBFv
	P6Cv9UM+yLIstYgBQnswTvQgtjzJwaK+PzQ9w+CsdBo1Px9+tecT/1TEY3b9fu2OWig/gfg9275
	CBOt7w5o4EKdumzucGfhzwZVp6fztd5T/Cou3yw==
X-Google-Smtp-Source: AGHT+IGfdj17ZRR0vuBfO1QBwX6EXMq129/94BCmEcrTpxI9KLT5gLVvRTesocXnNuXdBrs2dgVgRPYFjcVuJRn6J6s=
X-Received: by 2002:a05:690c:7485:b0:6e2:2c72:3aaf with SMTP id
 00721157ae682-6eaddf81805mr207193107b3.31.1731499684980; Wed, 13 Nov 2024
 04:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-1-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-1-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:07:53 +0200
Message-ID: <CAA8EJpqQA3zDBRpm9FY5X-vS0aDgoGNFfDoTh9p1A2MqVa7KNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: display/msm: Add QCS615 DSI phy
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_040806_344687_2C1D75D6 
X-CRM114-Status: GOOD (  15.20  )
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> QCS615 platform uses the 14nm DSI PHY driver.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 52bbe132e6dae57246200757767edcd1c8ec2d77..babd73cdc44f6d12fdc59c6bef27c544d91f1afa 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-2290
> +      - qcom,dsi-phy-14nm-615

As stated in the comment to v1, no, this is not acceptable.


>        - qcom,dsi-phy-14nm-660
>        - qcom,dsi-phy-14nm-8953
>        - qcom,sm6125-dsi-phy-14nm
>
> --
> 2.34.1
>


--
With best wishes
Dmitry

