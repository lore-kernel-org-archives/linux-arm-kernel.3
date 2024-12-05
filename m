Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABC9E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VC7qjn2Ue13WwDYjqbV/OAtsUDuWOgrtwnr0NjndRq8=; b=0RRmV38kx5ho7ediSgefyyO1wk
	ED1HYSscRzCtEH6Xgo7AJGF51n1I3NfBGO4eb0RvO7VpsOsgerTpzrJAkK6H4lXjCa69nHFA3OTtx
	xRQp+6ZfIsqvAByBBj4rt/MCIFthzwZ6EVN+oiX4xDAmnKUjtMIl1742rQdmLiQ+0STlxMGpcBLoR
	GNYLWC0Ap53OcCU4OZ0WQgpt1yLNfPUQ+3fpW7nWP+Gjq1N699fMWTlPDtyExWZXXmdydpQ5QADTz
	n3xVzlw+wYwGcVaAbKnI2hveJ1UkYoLsrwJa1DiypA8W7SIHd31MVBwvkL0P4ok+THDDWnwCq8fa6
	nog/feuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFb5-0000000GwLP-3PIV;
	Thu, 05 Dec 2024 17:25:03 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFRk-0000000Gu4G-2M0s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:15:25 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so8816721fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733418922; x=1734023722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VC7qjn2Ue13WwDYjqbV/OAtsUDuWOgrtwnr0NjndRq8=;
        b=dkwSVeE4DHCrg+TlXKBht1lLzlZ2gFZrZGXFjbXw4ixiu9mW0D+ArydtNvFV/kGZH4
         l5/lsh6QhAVCeAu3TWXrSKOgljjtsFiMtaxczzgO393mttNUZXVMJ52rVFNzeehAm75G
         ZevGIC111AempcEQtL1+xAZwPq0k+NuDAMt4frn6zx/gdGm92hqil5rt8nYNXkqh5N1X
         skYi3S9e7kjOJ+F6MY0x3AK/cIDjvjCEBU56WpXYePveo2AvyQxEfdtYVHmGbues6h1Z
         JpxgB7wI+VVTwzoBUT9I0QBvYQpksqXVRotfLACmZ7ZqvkcDHfYq3ezi+dgOL5a33hSV
         xYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418922; x=1734023722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC7qjn2Ue13WwDYjqbV/OAtsUDuWOgrtwnr0NjndRq8=;
        b=E0VTY+VN/3nXbHHrC+Q27nWri0iRXlRjo7GJEiv1HiAEgd2rXDANWoeLQTPD3sHRan
         wiu5SHPXmy4UmfrFcwNlqFpQ4xqdhuAzgMgBnZzoTM48+s01PtPkbSpHPqaI9kr4dJfr
         jeHY+qiV1gGARNSymnnBiBWW0v7OqJ/VqwwenAxcZ7UWeGct2egMA7kliXqX2vr+By/Q
         L+BdqIodp3wRQ1ghOAqzd0dnCFlHD13k8113WEQLNHP3neMFUMRwHXyiJCIcwhhc6Bxb
         LWtthvAZOHmRPUB1hp2cvCn3jJ++1OCdD2oRne0Qh9yXEPdopWpf6MCbDVzg3MHZIbJX
         sdlg==
X-Forwarded-Encrypted: i=1; AJvYcCUVGni2tnbuGruyplXz0mN1IGwyIQZnG43Dm8R5pVh9xG4uAsc9ee8fT+BGc9v26R7hucwEyl307j+dq3frQ2oC@lists.infradead.org
X-Gm-Message-State: AOJu0YznkOsC/Fb8c1eIhwWnki2wXM9L0KX76b1e9L8BI0lUOOxOv58s
	GHUxkOJqVX+0K7jIopO1m2rc8gwk0TSrn03cSuuP0SwC9Ekwb9/SyvYHlXrkNs8=
X-Gm-Gg: ASbGnctgw1zxsdtCeaXt/OCqwPTU1NLjss/XBlcn9iv+aNDM8KRowZB/ezWP/ymkSba
	7KB44dpSVGMGW69a7EtoXo4wm3SoBzdSSC4D7rhG7ZPDUDzR3+Bnpt8dUyQfRHSlq8JYbUn6bSL
	t2k7EzJ8HMlBKNcW/exF53i8KZism5iybzaElIYP3hD8T4wiZ1Om+WIBq5sQZ3zX8K5BpsFIZWS
	ou+liYdEcGmy9e30b9j9GBlAxo3F2JnR0GDDxH137Il7+j9E/4OCRoqCV/ngocb+y3gJHUfONEy
	hdAAl/ZWk2LddMQnS3hUjwxjl019ow==
X-Google-Smtp-Source: AGHT+IGH88KxLDDpR3F7Zua2FFnZVp+X450MYJpG7X6Zbx4IrQuk9wIFPeZ+LGfXcyrUOUfPRq9xtw==
X-Received: by 2002:a05:6512:224d:b0:53d:a99e:b768 with SMTP id 2adb3069b0e04-53e129fff72mr4872910e87.25.1733418922320;
        Thu, 05 Dec 2024 09:15:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba710sm290454e87.140.2024.12.05.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:15:21 -0800 (PST)
Date: Thu, 5 Dec 2024 19:15:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 3/7] arm64: dts: qcom: Add PMIH0108 PMIC
Message-ID: <4i4y5sajd7dmqjm7snjxmj2v64hadj52reo6utztvk4lsulwax@p5yq7swn3z2q>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-3-4d5a8269950b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_dt-v3-3-4d5a8269950b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091524_595955_B8AD1A24 
X-CRM114-Status: UNSURE (   9.99  )
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

On Wed, Dec 04, 2024 at 03:18:03PM -0800, Melody Olvera wrote:
> Add descriptions of PMIH0108 PMIC used on SM8750 platforms.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

