Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F00C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 03:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1AVackadfhPpCMLLKH7Bg03NDXVVtj9z1+w6CdVYcg=; b=kRc82BTqz+51rOgVzEzOlLZz5k
	RedyPRbyz491TORsWFd0Ffb1mzl4eDSk4L1uNoOX9l9zgGmu+EjemAT14jB1W5MV+UOPZQWh+Lkb1
	aUNLjCvtwHxW0T9gusRiPZWBJhEdpaCAUpg8Z+/113+m9N+1GJPDe72ERV5FtqRwEEPqLen4ki8nq
	4WWvz0x//W/lZuirOTfyk1naQzHoeXgDqc4llPowTlDN/ydj3VS526w3CPsnmidiUglXB9oeAVQ6W
	5c2rxI40ISCjHUQlmVla7Z0lUeJKed4/3sw4BmauWUbDBfVlbuYQe5sJyQOovFJxdk93peIzPqaud
	XtuCQbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlK3d-000000041hO-2Dli;
	Fri, 21 Feb 2025 03:50:33 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlK2A-000000041VM-1T1y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 03:49:03 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30a2f240156so15759841fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 19:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740109740; x=1740714540; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d1AVackadfhPpCMLLKH7Bg03NDXVVtj9z1+w6CdVYcg=;
        b=VX+nRVvj6ZoPLXEG2Z0wi04Sr6POBbTzBZd+G9p+Y0XpByUBl3G7tC1pk3e41nR+V+
         HiVkYxHbgBVfJicslug5z4A7KNukSltb3MrDzoKBmY/XIQSEEoKRApeIySym2pl/J1MI
         2uiySspOHfkySUhvuULjVsrqQSLbY81I9HKGb+lSb1syW6ib7f/8FWPacszBDLK6I3JC
         bEtiCSYOK8ViUAp+hQDUog+A/kLaQ4InWtOI2EPy8gG1lk/xyD7eY55MaSKa5nsORMwj
         AB4DoXMIu7w6ZdpeqoiLA3z2ukbLGd/6Blu9sGqzKm7LIUmOUtqMONez5h2YsQTmn8on
         OBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740109740; x=1740714540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1AVackadfhPpCMLLKH7Bg03NDXVVtj9z1+w6CdVYcg=;
        b=Lzr547YT7pRSOQv6bSyQwFI1PTWyPhmrItcNIwQFYn/q6+F5jmuUAd/IshjB0R2uQ+
         rjTrX6WyZuCZUM8IMn7tvphL5wU+ZRDzMV7p9R4T5WNarb4Pu+IR33iazvsPZkB5VwUZ
         PVsbxvAxtH4QC1OJCiJItzMuFZWGfUAymhTn/LfRVPhT8o9gbBkpNdthH5C15cKPT4I0
         CFPK5eKWuZxwSkmnzfK4ZBUA2fhRzf9Us8rEBnsAXPlWhvujVQ7DJcufD385BTxXXD8K
         HiKceNGKl2jCFMIj26ynHnw5dPl2ZXWA65FcAEwF4rLqaHrcWzo+7A1K4RT5XWK8IbFR
         XTGg==
X-Forwarded-Encrypted: i=1; AJvYcCXNXIJiXD1LZNR2d6ue1CWRrig8K8P4ByZrdkPpS16bc4wr+vR5RLFZMKWxS9B57KxUUsGlRddnwOntrkQBgiNU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzdxthiwrgpc3D5vKBS994cC0zGKypegY6Jr5tZXaEs0mfp3bL
	7KVjo2dzW4doBzORijMnk/U8qPWuoU9pUatgN+yfmHPwy2iIapsQR0l0OsAlMfE=
X-Gm-Gg: ASbGncu3PReNfWl/O6va9o3HehSYpYy5+49dMuaXVxIKvj6PTPCUuWw9n2PiBHqDZqn
	Xzmo3E9Fsa++McCAWAOkbjSmC5yW/Ye3XM67dVpUESxkNl6k3lw/ANhDVsB15e8pOiKUVlnyIeb
	WAuC4U6Pp9WhunsS+9u043ED5zqpLarR2eP+h2i14IhBU4BTAYjtbs0r7//0Dimd4mdltjna6+t
	n+sneisVUobgqkR1xPoRxMFeImaiK9X5S7HWK1LbIXeSmJB6BqGqA4OGjcz3ZMz+bRbh9HQNEBv
	z853z2drPxsAKPkbH5saWvzFqjZTiRfQzREYjPHg3Wkgns/E9VHZah/9EgKvtSKnJHImx6iNfp9
	9QfHlog==
X-Google-Smtp-Source: AGHT+IGHQWaI+wsylt7S3+XMOx8A5/5l6dC9pJ61ZYifwIoKtpegMA7wiwgbweb1ZJRIrUmonpuh9w==
X-Received: by 2002:a2e:2c11:0:b0:308:fedf:8c12 with SMTP id 38308e7fff4ca-30a59858cc9mr4238971fa.5.1740109739700;
        Thu, 20 Feb 2025 19:48:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a29ab47adsm16752891fa.97.2025.02.20.19.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:48:58 -0800 (PST)
Date: Fri, 21 Feb 2025 05:48:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <p6ytfgzhcyqzmc3elxkpi5m2sdp3aweladrhzvtwpjpot5jh4w@nbjsg6jumc3s>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
 <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
 <a1dbb65a-d437-46e1-80ac-8dff3c97b81c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1dbb65a-d437-46e1-80ac-8dff3c97b81c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_194902_382490_65ADD914 
X-CRM114-Status: GOOD (  27.95  )
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

On Thu, Feb 20, 2025 at 07:16:44PM -0800, Wesley Cheng wrote:
> Hi Dmitry,
> 
> On 1/14/2025 2:12 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:08PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> >> binding definition for the PHY driver.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
> >>  1 file changed, 84 insertions(+)
> >>
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> >> +    #include <dt-bindings/clock/qcom,rpmh.h>
> >> +    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> > 
> > This a typical comment, please actually update your internal
> > documentation: don't use GCC's and other clock controller's bindings in
> > examples for other blocks.
> > 
> 
> I can see that other examples also reference bindings from external
> drivers, otherwise I think it would throw an error for not being able to
> find the parents in properties such as, resets and clocks.  I tried to
> update my dtschema to ensure that this failure was not missed.

Just use ephemeral nodes. Instead of <&tcsrcc TCSR_USB2_CLKREF_EN> you
can write <&tcsrcc_usb2_clkref_en>. It is an example, nothing more.

> 
> I checked and made sure that no errors were not seen, so I started to
> wonder if maybe when this series was submitted the qcom,sm8750-gcc.h wasn't
> yet present on the kernel tree.  To confirm this, I removed the
> aforementioned header file, and got the same error/issue.  Now that the
> sm8750 gcc header has landed upstream, I believe that this error should be
> resolved.
> 
> Thanks
> Wesley Cheng
> 
> >> +
> >> +    usb_1_hsphy: phy@88e3000 {
> >> +        compatible = "qcom,sm8750-m31-eusb2-phy";
> >> +        reg = <0x88e3000 0x29c>;
> >> +
> >> +        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> >> +        clock-names = "ref";
> >> +
> >> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> >> +
> >> +        #phy-cells = <0>;
> >> +
> >> +        vdd-supply = <&vreg_l2d_0p88>;
> >> +        vdda12-supply = <&vreg_l3g_1p2>;
> >> +
> >> +    };
> >>
> >> -- 
> >> 2.46.1
> >>
> > 

-- 
With best wishes
Dmitry

