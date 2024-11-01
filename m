Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6966E6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6TkXEo4x1I5Rzwt8fjqhUP2t7jAOO31BIJtURlqSmc=; b=DGdL9cP+dOHXvPvxaXiXgpzVgp
	g87J5jbyIFyKeHtBM3XlA7TdNmQRq4vn6rXSNMP5epVc5ci41EVVi3plJPLwD6YBJJYJTv7uCdVAn
	daMu68n3zKiQAcsiqgCJ7pai9n7YSq1A37fmH72zJuHUX4bSeOL3VcmbUe3vKJQKrGDRnKbEBDoSA
	qGk24DnnLlO6Hb44Nm+JqoW82NTkrTkixAl9+LCIcLHwWIBQjbk8i8u/YNTad08XcJrjKyi9x6V65
	1wv/vFS3/gwafL1imjkSCpRpib8TjIKSPsBp9tdyHKLY+ZfrWTYm/+ebPvArYoieYzFO43ElzI72a
	yfz9jMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tdr-00000007VzM-39uR;
	Fri, 01 Nov 2024 15:32:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tYj-00000007VQW-2zrv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:27:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cec7c058f8so205117a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1730474851; x=1731079651; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6TkXEo4x1I5Rzwt8fjqhUP2t7jAOO31BIJtURlqSmc=;
        b=dvIyOGoNd++BezOWGSCzR0rxb10I2iLlGe8bzND+48dYgBoqjLV9Z03gz4isUqmCjJ
         t1QTVEiMMsF/I4kXFOMn6LGuCQVOOeGjg87t+mwfFqrvVQLs+uSGhFZSd/Wggs8B4usH
         Oxwi+y6SKeC/v0EdU+TKzjfOSeS4hxSINQplfse1PgBvSNWUccy1luc3CmAnXDaBGYo9
         u7r5x0LV8m7LL+XInb4d5CV3vBP1qTStA7sYcOP4QQedbVAwzyxQhwPykYY5/xdPlOod
         Ifa2aIVtRqD3NvL1yw1eH4FrgSMqMVBtxFjtVjffwpsMdaoQbJBWJ5XdjaYV360AeOWk
         Xw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730474851; x=1731079651;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K6TkXEo4x1I5Rzwt8fjqhUP2t7jAOO31BIJtURlqSmc=;
        b=DMjQz52Id1Hkvs3QJGHSPN3QTsV8uiGE5RurJRbRcnh51bF3pIV5ECK8rl9+oJE7Ar
         rXd7yhWGzavCUX74DEumJ23BgG98qkJJCq3rLYPdcLzUQcP9USHqVp9lvxTi07ZNREjz
         RTLzbI3FrpYIa1hIZy5wq91EOjcAIcXUkWDkth+5agXu/kd+zpBZ1lK2Ce7o0tRotjMt
         RSkXClZ8fY9sMeHACVnM43pEHz4wxr9A/lrenl7M9//qLgD/bRLJ3ad+KtRpmpjX3Ut2
         HKq+jNZvMsEcHCMK8chqkgrB+ZEqvabyiGZx6newJjL71E6c/aR7wGt1pysSeSX3hBRk
         xh8g==
X-Gm-Message-State: AOJu0Yx2+p8g4qvlpk8GMBCnaY+TCRAlPLb1axKhLdbybvoHvsM7yLsM
	ubPh2L4HDlDg7IcfUd2EaJ3PZ2OYqnu+hftxqDgoQXPn5LTohnVMTMXqm9sMb/8=
X-Google-Smtp-Source: AGHT+IHBNPcncBQHtNtb7STpigHQlaFGA7NJY+pQaXbjyeqQZ6bXscULA7A1iluv+zMZo2STz3vLvw==
X-Received: by 2002:a05:6402:2695:b0:5c2:6d16:ad5e with SMTP id 4fb4d7f45d1cf-5ceb92a7bc4mr2823312a12.19.1730474851261;
        Fri, 01 Nov 2024 08:27:31 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac5cb8fbsm1607974a12.0.2024.11.01.08.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 08:27:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Nov 2024 16:27:30 +0100
Message-Id: <D5AY4ZK858IO.3BH1USXK7NTAD@fairphone.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [PATCH v4 0/6] media: qcom: camss: Add sc7280 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikram Sharma" <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
 <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <akapatra@quicinc.com>, <hariramp@quicinc.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
In-Reply-To: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_082733_791765_CECC6E79 
X-CRM114-Status: GOOD (  23.86  )
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

On Wed Oct 30, 2024 at 11:53 AM CET, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY=
,
> CSID, VFE/RDI interfaces in SC7280.
>
> SC7280 provides
>
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
>
> The changes are verified on SC7280 qcs6490-rb3gen2 board, with attached v=
ision mezzanine
> the base dts for qcs6490-rb3gen2 is:
> https://lore.kernel.org/all/20231103184655.23555-1-quic_kbajaj@quicinc.co=
m/

Hi Vikram!

Two things:

You use the property "power-domains-names" in both bindings and dtsi but
this property is never parsed in the kernel. This should be
"power-domain-names"

Second, I still can't get the test pattern to work on my QCM6490-based
phone (Fairphone 5). Could you please try if the commands as per [0]
work on your board?

[0] https://lore.kernel.org/linux-arm-msm/c912f2da-519c-4bdc-a5cb-e19c3aa63=
ea8@linaro.org/

Regards
Luca

>
> Changes in V4:
> - V3 had 8 patches and V4 is reduced to 6.
> - Removed [Patch v3 2/8] as binding change is not required for dtso.
> - Removed [Patch v3 3/8] as the fix is already taken care in latest
>   kernel tip.=20
> - Updated alignment for dtsi and dt-bindings.
> - Adding qcs6490-rb3gen2-vision-mezzanine as overlay.=20
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20241011140932.174412=
4-1-quic_vikramsa@quicinc.com/
>
> Changes in V3:
> - Added missed subject line for cover letter of V2.
> - Updated Alignment, indentation and properties order.
> - edit commit text for [PATCH 02/10] and [PATCH 03/10].
> - Refactor camss_link_entities.
> - Removed camcc enablement changes as it already done.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20240904-camss_on_sc7=
280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com/
>
> Changes in V2:
> - Improved indentation/formatting.
> - Removed _src clocks and misleading code comments.
> - Added name fields for power domains and csid register offset in DTSI.
> - Dropped minItems field from YAML file.
> - Listed changes in alphabetical order.
> - Updated description and commit text to reflect changes
> - Changed the compatible string from imx412 to imx577.
> - Added board-specific enablement changes in the newly created vision
>   board DTSI file.
> - Fixed bug encountered during testing.
> - Moved logically independent changes to a new/seprate patch.
> - Removed cci0 as no sensor is on this port and MCLK2, which was a
>   copy-paste error from the RB5 board reference.
> - Added power rails, referencing the RB5 board.
> - Discarded Patch 5/6 completely (not required).
> - Removed unused enums.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20240629-camss_first_=
post_linux_next-v1-0-bc798edabc3a@quicinc.com/
>
> Suresh Vankadara (1):
>   media: qcom: camss: Add support for camss driver on SC7280
>
> Vikram Sharma (5):
>   media: dt-bindings: media: camss: Add qcom,sc7280-camss binding
>   media: qcom: camss: Sort CAMSS version enums and compatible strings
>   media: qcom: camss: Restructure camss_link_entities
>   arm64: dts: qcom: sc7280: Add support for camss
>   arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
>     mezzanine
>
>  .../bindings/media/qcom,sc7280-camss.yaml     | 439 +++++++++++++++
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  73 +++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 208 ++++++++
>  .../media/platform/qcom/camss/camss-csid.c    |   1 -
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         |  13 +-
>  .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
>  .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe.c |   8 +-
>  drivers/media/platform/qcom/camss/camss.c     | 500 ++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss.h     |   1 +
>  11 files changed, 1190 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-c=
amss.yaml
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezza=
nine.dtso


