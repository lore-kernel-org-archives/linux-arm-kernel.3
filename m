Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DA8C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZuijAJRPJZ+p2n09IvIvH7D3TfvZOkc/364B+Mx6Yg=; b=EobzvwmTu7VpPvQNOTkKBN52Pi
	gPFAwhzkxT7gyEO3siit13EmlqmEY/bvg0zyvOtQozbJ4LxjuXEc5HbKlo22XQ2+ybYtICZcfu4we
	7v+0sIhirLdNomOLFdghGPqiLjRhdnFVH58hQnZyDV3cxHiZTYfQaRDJv75o2lkMqkI3vQ2Phgeav
	puQ5MOSFkgxLb1l5RlEmla82gRazBS+DkfEPV3qRj8FnM8GspZoq9vNY4cQ1fICVdZcbFBkvI5/TX
	tkWjQGQZAKIYBb7xF0dOWWp32mwyy4zzlP258bbYyLfFyxX7UESDuulBEbZma3/YTPrJp9oxFv6tK
	9O8U7sZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI51C-00000000zZ0-2nCF;
	Thu, 22 May 2025 12:27:26 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4zA-00000000zQk-3T63
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 12:25:21 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6019b564d0bso11016214a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747916719; x=1748521519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZuijAJRPJZ+p2n09IvIvH7D3TfvZOkc/364B+Mx6Yg=;
        b=WRgXVfndCbKpLqEmp8nm2ktYB4Itkfe9V1AEhMULgiVeWM4zHxN2lCtj8o4gMzkTIL
         qNcQvhHFiQnwyDy/DqQ99HXrH/V453kD3F4Sz2CW62RDuS6++TUCjzNlD6LktqfSJBFX
         SFXI7MorSuvqBgw1AavYUBtN3k0f30f/2dCc9hDEr2hWAyy4ClivAft8uCd/B4dr5MdR
         iKekh2c4s7NaU5fTIrdhyzEKIrD2xKrkVIvSlu0l1OoApKqoM6ru80mpFC56RKrQ1Qrz
         3d/6gYZfgOrpiFuuAoc9f+FwvArLRdgx5Bh1jhgoXzGBvXV/g0p1G140A3w0Csd0NmZP
         SGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916719; x=1748521519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZuijAJRPJZ+p2n09IvIvH7D3TfvZOkc/364B+Mx6Yg=;
        b=w/6jM+pRkpuW5JuJZ8L9sdykUtR2yy1EwmmAhXclwovIiurGpQA1/g4QSt/41o2W43
         ripjVb7aFFc6huklSrg4SdMQ1yM31o8yOp5jPR9QBbiPYPCWdE+WV45TUZEDLBXMJz0S
         FVk3x3aLRAtygDtM2duFAGknWq6iEyVquoqf7Is7iCB2XN7Mdb3mu0coc6NxR1aXRFC/
         OiRO+7exlQZUGM+VWca2xV+eKpj+wZiFwnDjeQXJkSWc1IQjuIvhHIjtKKnOPtxP/As+
         +gQN567P1b9bU6MzH7hcXD3kSZcUKnCRG/Na/cLslzpv76c7JGuXajSSLubyc5X2JxN/
         3ZxA==
X-Forwarded-Encrypted: i=1; AJvYcCUwAjTj5YVCoes0ACmJuEArpLiYETpdOsMb0rQn2kQy7G7sgpOAyK2uPibnRtwuD5+00FjLXOOIsZMFoHqgxMjm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxepob9D7Ygu0GdWgQVfjNQFmm3X08fBjifyDZ/51PvqRZunjsD
	kjpbmh215xzCPgTgnw9rvfCk8OhRKHQf0Sp7LG6ZwB1DNlcg9lHuZxXH9J9wrIp+OK0=
X-Gm-Gg: ASbGnctfg7TW5GXW5rDAhu+hATieq6XO6lSM2joy67n52RUnSNrNrFGZzVX2HYLpsom
	KXcsLDXEH+5IkoH6VV93rE3ae4//E1lgrNlIT8ZBEfGok4ELnNyyQEpkOiiaFl4nYoOnbvKVhVY
	LQDDvw+HgP1kGGtpetDH23ei2j/HvQ31XrQUBAj9mnzC4NJp9JF3wwkYyonEQdpXFI9wOXMWa4p
	1HSMmdnwkKEykhwRnEdBT9pJMZ2J1Th14JMHrAwcc6f07t1FNc9H/NOI6avs/4AzvhxuYwta8T4
	8wo2bFQ8MRYNwtbS9zEBeqY7BNNrGkr1lFXSutjqMuZi7Ka8
X-Google-Smtp-Source: AGHT+IHcT2PY89g15o0bxhhQt0NPg7NGUlq73S+uSn8e6SJg6l2RRfQQixZwQtfKRbnT5KPfhf/pwg==
X-Received: by 2002:a17:907:8690:b0:ad5:4fdb:a2d6 with SMTP id a640c23a62f3a-ad54fdbb14fmr1991573666b.43.1747916718712;
        Thu, 22 May 2025 05:25:18 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ea7b7sm1081211266b.177.2025.05.22.05.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:25:17 -0700 (PDT)
Date: Thu, 22 May 2025 15:25:15 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aC8Xq949p6NNDXa7@linaro.org>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org>
 <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
 <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_052520_877029_9C1FAEE8 
X-CRM114-Status: GOOD (  14.11  )
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

On 25-05-22 15:18:00, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 25/04/2025 08:49, Abel Vesa wrote:
> > > On 25-04-21 15:00:13, Melody Olvera wrote:
> > >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> > >>
> > >> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> > >
> > > Nitpick: Drop the double space from the beginning of each phrase.
> >
> > Sorry, but why? That's a correct grammar.
> 
> 
> Being absolutely nitpicky, this depends on the country. In some cases
> (US) typography settled on using double space after full-stop. In
> other cases it's a normal space.

Okay then. Please ignore my comment.

> 
> 
> -- 
> With best wishes
> Dmitry
> 

