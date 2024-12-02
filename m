Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E9CD7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfgDbmGn22ssjxiKjmQ0kPNy7r0F8TDilTFlsUWSPaw=; b=YXCo3phQdO85Ebkwz6G1A915oP
	v3x8n3zR52P3J00yUqlkqiIesldSa2UhWIKn78AaD1DahA2GOOXFqMascbhP7b9++SM3ZVMqH3+d0
	rHQp7iRFfQBt8isCptpjV3uW5p2vGlm3kHnSLBRSmBGfFZnr3zFu+ekqmEZb7eTrTbasGszTPDTKF
	sbHe6VrRJYMr63i004nrLpmBKJJLnrnbwJKZSdaUvtac5yGqdfa2qW5AcqqQfjdh3/j7f6mBq5D7H
	DqQPKBcjAnfA54TMuBOd5l/p2pFyWT1eh3G+Eqt5ALKAXStN4nlLTbzPDj9mqD/AgQRkIGhu4GrCF
	MMC68R8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI518-00000005yEN-3iDS;
	Mon, 02 Dec 2024 11:55:06 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4z9-00000005xtD-43mU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:53:05 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso48558101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 03:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733140382; x=1733745182; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfgDbmGn22ssjxiKjmQ0kPNy7r0F8TDilTFlsUWSPaw=;
        b=c3RtraXo4j7HxfMv+Kcz0AGsq0h7qCp9ct8bPS8IOJyzfBGbJEV5Ws9TvGi3ybQxoB
         j7/4lMEEsw/5jQw9pL1ZcFv1EDvPVF07rKccXagV17QckuW7lP03nz9UbynXvgUfFw1x
         oylmR3baMUZK9EnzVSCt+2FgsSuPyuJoni5oz0fvf7EZTeJxiS7WieeW+Dea2m3/QPw3
         +b5n8bX1OvmD01Ihn4QSS9Ha9E+1J+mYI/iNPr2MzTjKOd6BdkN+HSRiPGNsDn8ieGCq
         u+PehkhuRrcpdgkTF6sovN1JVLiF37yykJUA9mcXPAHboeniD8urpDKf5hzKvq8DJrxD
         We7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733140382; x=1733745182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfgDbmGn22ssjxiKjmQ0kPNy7r0F8TDilTFlsUWSPaw=;
        b=VowFKF+CGD1z6yn8z82shskBBJPYczBY+4pVC+eYcnPJhn0CmJMRvToDSn2f0WjbPH
         EFL6JoGGaoSF5fQKI0RyhpBWPu3ZxXV0DZIIGrGWEo6vM9Pw90SqeOk9MldwPhb1iSNe
         AFyVRa9EKW0MrN4lUnFIcJPnBNuvMRs+aPo6srRBraFL17zl5QbH3s+3jk3F8Oj8KeiA
         8BYMSWm40xJAe1MViP3GHbLZv1BmJ7lQ8brWd/JX5fvpVDYlGlIW6gU1Voj3LbCk9WQ8
         906qqZDcFj3kGdO1KemTkIc/O9r85yD9AKMDy2WkGUL6S4FdRYs1jQtuph6xWhX1VREI
         SLMw==
X-Forwarded-Encrypted: i=1; AJvYcCVvjEZGS/CafJd4ExdCRPXnhXkR8B4BC6oUzPmuCmOubuAyuxgYH+zyuaK3p7mT8P8OVPIYwo2ENb1ryKCs8cbK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+VqRbmcVmb/C8aPYIfGcw1ftZ3z/ysKREkmj/HoRRtVzLwaOr
	Y8S/7srepAyJ1kIJIGFJoZC3C0vICuanq3+h3KfcH8PkDVFAtkNIypeOtWJBXmw=
X-Gm-Gg: ASbGncsI5EwVGCzZMbGNZWjio2THV15pUePYP9Cb2cvYqReOwLhnfhwFALGHRFSDIPk
	PCmtvsH8hb3uaQs23qYccL23pg8jHY+bhH2WyZKNIWRFxC25bKwQsidiaUi69kl2AX2YQ0bJJ/g
	b+bytP6GLkEQSVMPVOZ2qjzFViwYJBg/FWi3ICQdgNiV2MrY+UtIgrSQ2pxtjgm9EH+6NoKuh0w
	I183IGSj3flVUWyXnRYlqzEqYLWFyIZsgXD+gTvrdZD1T1arI03FzjVR0SDwm5yyBCG242+x+tv
	gzBmgX4CzXOmq1GkoVeS1QbqxPyfRw==
X-Google-Smtp-Source: AGHT+IF7qcUlqwZCH0DJeBeEV13wXeWiYQJ32iffEYuN9hp6lhdLXbyTbs8ChuNW2LVLJzXXZe/bZw==
X-Received: by 2002:a2e:b8c7:0:b0:2ff:559e:c94b with SMTP id 38308e7fff4ca-2ffd6059c0amr97739501fa.17.1733140380217;
        Mon, 02 Dec 2024 03:53:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc097c3sm12501411fa.54.2024.12.02.03.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:52:58 -0800 (PST)
Date: Mon, 2 Dec 2024 13:52:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <afbxakprrm62hnlirqr3244wuf4zzlureejlce76av5xyqsuyy@gadkbshd3dam>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
 <173104478441.565041.9851772057058427001.robh@kernel.org>
 <s5rie2osuh2ngkwd2jinly7ulogqqeqois724h3e54a7rqrn2w@wn3yypxi7wca>
 <74e5b8b5-ee09-4fb5-9643-14ea11c445e5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74e5b8b5-ee09-4fb5-9643-14ea11c445e5@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_035304_005200_FE174DD8 
X-CRM114-Status: GOOD (  23.10  )
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

On Mon, Dec 02, 2024 at 01:05:54PM +0530, Taniya Das wrote:
> 
> 
> On 11/8/2024 5:09 PM, Krzysztof Kozlowski wrote:
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
> > >     19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> > >        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > > make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
> > > make[2]: *** Waiting for unfinished jobs....
> > > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
> > > make: *** [Makefile:224: __sub-make] Error 2
> > > 
> > > doc reference errors (make refcheckdocs):
> > > 
> > > Seehttps://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com
> > > 
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in*this*  patch.
> > I see this patchset being sent again without changes and receiving same
> > errors again, so maybe you expect different results, like some review? I
> > don't know, but just in case that's the case please carefully read
> > message you got.
> > 
> > If lack of review is expected, then of course no problem here.
> 
> The base patch dependency(GCC) clock controller was mentioned in the cover
> letter:
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> 
> Thanks, I will keep a note to notify reviewers explicitly mentioning the
> dependency.

This is usually being solved by:
- specifying correct base id and prerequisites in b4 prep --edit-deps,
- using ephemeral DT nodes in the bindings examples.

I think either of the options could have worked here. I don't know if
the bot picks up prerequisites from the cover letter, but even if it
doesn't, the issue is on its side, not on yours. However we still see
the same issue on and on. Could you please update the internal
guidelines on writing DT bindings so that the issue of (not) using
bindings of (other) clock controllers gets handled there?

-- 
With best wishes
Dmitry

