Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1271C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptH7TdqJ1a9RBPR6TZDZBqzzcIS8gfN8+gNc7Nchtao=; b=ZgDSf8uHCim/20E13VYQdKdfFV
	wHS+2un7nmnlNGjuBB8mtp0DF1QV2J41StZKSSt/Scm6Bf3DCEgv4yupqr97+sSIxpcf0s0EpkyLK
	1U2rmoVhUogfDqSJGYo4Ict28TIEDi1HBJzxCQ/91g7KFQvRbl41E1jZQmkklYbjW7MM6ea6zu9An
	/gMKEflT+zLlqasQyJPtH1bMbKYWJKnsRb6i5redbsMXwVkDjlDYZisvCS/IQdJW5y3P1holksMDX
	jNzU0UclPuRkOhXMs2PmgUkM9oHfXpmpMSbQrStuMQ0ZHt5X/B29JdlsGow0XBRBcWWPIhUF8uHfw
	qjcyUl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBi6-00000002Mwk-2CHk;
	Tue, 22 Jul 2025 12:03:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBfb-00000002MR1-1VDc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:00:32 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-75bd436d970so1337135b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753185630; x=1753790430; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ptH7TdqJ1a9RBPR6TZDZBqzzcIS8gfN8+gNc7Nchtao=;
        b=mHMsVrV7nWAHkRGp9IMiIV+kt2HE7vAPW//gld07RkUaeQ1cFPy4+n9Il7NWeRAKYa
         vpkM3ygyHWoyZsPaFd30pCUM5rDvg7IbZY8I5/YUFY76S8VTQvm3W0mogUmI31QQxBw4
         PGdEWSFiJom5XF4NOCT1Rp9tgwCU4iyWFnHCEbbOJl2XApDRn18OTC5dVPWhQIWgC/mJ
         rKnPk3iPYgYXJBuMx29wOrhKSzNqNwk+SCOzuHqh8B3/rthRSFzQ3HxhFQ87Ba79rzTp
         PdYAPLJfd/J5UYw9Z4SfT3sLMY8xG2DQQYaXCKWh1OW94VlXVn0Estet8/bq4oJgYc3g
         zFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185630; x=1753790430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptH7TdqJ1a9RBPR6TZDZBqzzcIS8gfN8+gNc7Nchtao=;
        b=ikhXQMaSAcwEElci1qbdMclONbMc3sAP6znb+WtMn8L8Av12JS+zwTTsuL5l3vbiZB
         HchV3uGeXQS0Oy1DuzXuUyiSDkvzpY5LoVX6zmcLttN0f1Zbljhbvry9CNTuJdp5n0Vp
         N0e1Y0KKyp+gfSbhG01upktU1Y9vodUJMwyGUisDlRWVGvggwI1i7BqGi/iYT8eK7Viz
         hUtJL1fuYm0fYq99cgBvy3J3XaUnlhrkxDF8fqaRccWTB8zaKdzuloWBvx33QzyI/i3W
         ZoWbJCjuXTVakFJqRvgtEPwLhZvkWyrtxmk9Y11mKURJZ5npxo7xVj9jCdzAU5mEgjW1
         3N0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPomGz8eeN7DWPGEqT1KtoUx7Posgyu7rvY3ot3hQq8yfym7wdCdcALgz85kvpHYdLZIh1jE+rx/EgQIiX+4y6@lists.infradead.org
X-Gm-Message-State: AOJu0YxxfW9A4yFcAwvPMmZjLWozF4ZR0P1rvOYyXK91AapA9rwQjPqw
	YhD4YQpPEvWBVy9IAUUOqoFKc0NmkZX9rIHtUrf1K4oYo4Jm1lNKJYVTOJLPkvi98S47dL4B/lm
	RjJ1TSEIgOwzpUafXXl+NLqXpFNVIEbFXqQaxHsz8cg==
X-Gm-Gg: ASbGncuGvvPtkKEqlEnqbVzmcZvSVNTssoLpbM3Qrd0jM5B//BS6tsv47LcK8Y0VQM/
	DKy5dHWYnP8oFpGi5NCUqOpZHgfTbyPmph18VkbW5bwNxRXpoEFhIto2ym9it0LjnboVLgdadFg
	Nta8fpmw/hU6llCa4vp2S8db2q3TcXa2BqwpYnMrpqfWKKpaMUYGOTDLGTLlDIeDwBONl9kTzWz
	Qxg5Koa
X-Google-Smtp-Source: AGHT+IGTyCeY3UMh/uN26NrX+9pLVitYu44Yg1Cv05hntn0WmZXzyYQmgf2Srl3Zso4XLkxJAtt8NFNBvWJVP5c1/co=
X-Received: by 2002:a05:6a21:6016:b0:1ee:a914:1d67 with SMTP id
 adf61e73a8af0-23810e50f83mr36040966637.2.1753185629855; Tue, 22 Jul 2025
 05:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com>
In-Reply-To: <20250722091425.GH3137075@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 13:00:18 +0100
X-Gm-Features: Ac12FXxwWOJchARr8CvJVCGpP9c_3WusEBTfWMpJDyd4T_uRT6DBiailwW2ufC8
Message-ID: <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_050031_409139_92CE200E 
X-CRM114-Status: GOOD (  28.89  )
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

Hi

On Tue, 22 Jul 2025 at 10:14, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Jul 22, 2025 at 09:49:28AM +0100, Suzuki Kuruppassery Poulose wrote:
> > On 22/07/2025 09:14, Mao Jinlong wrote:
> > > From: Yingchao Deng <quic_yingdeng@quicinc.com>
> > >
> > > Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> > > extended CTI supports up to 128 triggers.
> > >
> > > Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> > > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> > > ---
> > >   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > > index 2d5545a2b49c..1aa27461f5bc 100644
> > > --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> > > @@ -84,7 +84,9 @@ properties:
> > >             - const: arm,coresight-cti
> > >             - const: arm,primecell
> > >         - items:
> > > -          - const: arm,coresight-cti-v8-arch
> > > +          - enum:
> > > +              - arm,coresight-cti-v8-arch
> > > +              - qcom,coresight-cti-extended
> >
> > Why not call it qcom,coresight-cti ?
> >
> > There are no other "qcom,coresight-cti", so "extended" is not required.
> > Is this specific to CPU (i.e., CPU bound) ?
>
> I roughly went through the second path. Combining two patches in this
> series, I am wandering if can directly check registers (e.g. PID/CID)
> to find CTI with qcom extension. If so, you do not need an extra DT
> binding, right?
>
> Thanks,
> Leo
>
> > Suzuki
> >
> > >             - const: arm,coresight-cti
> > >             - const: arm,primecell
> >
> > _______________________________________________
> > CoreSight mailing list -- coresight@lists.linaro.org
> > To unsubscribe send an email to coresight-leave@lists.linaro.org

For a change of this magnitude to a CS component, that the ID
registers will also have to change. This is a requirement of the
Visible Component Architecture in the CoreSight specification.
External tools cannot see the device tree.

This is effectively no longer an ARM designed component, so the
CoreSight specification requires that the DEVARCH register change to
show qualcomm as the designer, and the architecture value change to
represent this component.
DEVID should be used to allow the driver to pick up parameters such as
number of triggers as per the existing CTI component.

If this component is Coresight compliant then the driver can use the
ID registers to configure to the extended trigger architecture.

With complete remapping of most of the registers, and the dropping of
claim tag compatibility - which appears to be a breach of the
CoreSight specification - it may be better to have a completely
separate driver for this component.

Regards


Mike

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

