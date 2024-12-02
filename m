Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3248DD7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQXENZQVJNQwnHrGpO9XimeeddczjCL8gDUobO6Gaic=; b=NCL85xJGc56iABEoa9PRLLq3lz
	yLGkhQobmMECcpInVtqMj4Lwthynzy7Rlx8wLxLBIppncnYDBIHL93LcnkqLDKoXjqeVMXYx7UuJ5
	4XQhqewihKeyTU45VsztTVy+irRTOPvstbs8WZd3FXLSpSmOaEGipX7OIK//QVwlGJwVMDjPZ3DNT
	4gUa2+/nho50+2XXFEJoAqeJ5jRBK2Gw8PQ6ikBZIWt5jlKo7Q4tBz869vLlEjzpCzadO0daBfyfZ
	6HBqWWq/N72/XcLhpVvUywvfJV2CztOqtnrZWk9gSAME+lNP4ZVRFb/lyfOnbYtWePTORENy9G+OL
	UcWJazaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Hd-0000000620P-2CBJ;
	Mon, 02 Dec 2024 12:12:09 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Gc-000000061la-3I0g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:11:08 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53df67d6659so6064908e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733141465; x=1733746265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQXENZQVJNQwnHrGpO9XimeeddczjCL8gDUobO6Gaic=;
        b=CrmBXBauDf1ex6xAFyO+5w9LPlx2CIvnfxR+6L0mblLpbq/EXdDL6Akf2tdoB34JIt
         Kno8SHT1E6WeoDXw9aZmPY8IxSHgC6gbk2W3Ra1jFx4HseBzkhYQjN/YIIFlpONJ3/PT
         37QiAHgN3bgvwM1ilYjGyJi4ZzYQX1VyZLb9pGmphmwpAab3fIP5AXZXbC4fYo0WyQLf
         XyIjDBY3nWc5Toywwb/1EwuxgBWdljuAG+fNg6yGLQVRqyDK34MBn8wTa8w/lngLvJRU
         u6dvpAzJRr1o0OfLcvfBCa+rxSobJS7yfPbkTwD8VmwLztEwH3hWLHvS9PSJsF/gXw34
         yUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141465; x=1733746265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQXENZQVJNQwnHrGpO9XimeeddczjCL8gDUobO6Gaic=;
        b=g7NoxpHPCDXUsQwl3D2KXOP4Gn5wXr5nWbm5FM7eKNqML1UqjjMG9AeEwzD08H+wD8
         snIppzUoFTcHlX+fxQMw7p5ZblOjSHItQOtGR3EDsYztA3EF1bKmkeg+7s9Hl+RCNirE
         Zg94jcDEPxjmDPQ6ZEoGy4Lp6pah357n+A1vwuBybEFYrOKop7zGZefynKecQ9+QBs2M
         j87OatJRKsBOXQezbihaFDfjl1xAI/iTbw3ferNGheU+FXFMMmWBoYzKcvVGzaTZyZMf
         EbQipxe55i4Il+nrJnzuZN3Ofl7PpfCRoGod/9uf534nvKegTAo4UrkninZo5Z2T4jLV
         U3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTunazbVpvlUvtuipGRjAjDcqV2HAGv2O9IWxP+om9Xfl1/VKQp7inzRWfeeJGMTlwIleT60WOaBRFOP+DP26e@lists.infradead.org
X-Gm-Message-State: AOJu0YyXb3hxYSqIUNxZ5XVQDcXM0PTqsZLYrEt8dTgpQTFSDQO7bTuM
	k6ZHjCRa1j7nYvtaUfrV/2rZHLDXoMhAbs9n0EgRr892ZZ1JAbxFchjTeNM/Dho=
X-Gm-Gg: ASbGncs+xEbx0v7hnFpbLqpnPDnKDRvsh5dVCgChB4XuknGObiHIhakIAnMbajKefzx
	c8tESZt6Tkxb5+6Y8eIfkESqtBD5Ks+1US0aoG+d/MY3B/jm4VdUSadCBsuputEbY33w0FfOSM8
	ybTYS1TkSPzFwqQOoa4RqaGxbzzdiqHAo1u3TxNqQcdeao3Xj3jKQVIOlqIVmjGHPhfyz0l9ge/
	Y4rJntil3EYNZr07GD1nvWoAE0Pl/YKk0cyshFkznkVOsy5hsGaYyDqUhSr9xDvT+9Rs9qY9dFH
	9dnOGiYQKXw1XVArVq5rGEDSK/LKTQ==
X-Google-Smtp-Source: AGHT+IEzRcIhzwnknvixHamvE9vlf/Jqh7zUcscNKtxe89RF9mRI+5Y0+FdqdzWwutifP0uXEZ5FAQ==
X-Received: by 2002:a05:6512:1247:b0:53d:deb5:3376 with SMTP id 2adb3069b0e04-53df010b17bmr16440685e87.40.1733141464583;
        Mon, 02 Dec 2024 04:11:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64968d6sm1416507e87.200.2024.12.02.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:11:03 -0800 (PST)
Date: Mon, 2 Dec 2024 14:11:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Gabor Juhos <j4g8y7@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 00/11] Add support for videocc, camcc, dispcc and
 gpucc on Qualcomm QCS615 platform
Message-ID: <urlb2pn3cezyx7e6fxxf4j7psmf37amshnlzu7buixp6sxkrgy@mg4zljxn5s3v>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <a4f6ojknv3hats4rwmdg5mw2rxhx7kq4u6axybdawak54crn5s@xnjbl7zno42s>
 <bfabfba2-6688-4461-83d6-b6f4c86b08ab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfabfba2-6688-4461-83d6-b6f4c86b08ab@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_041106_820997_CD765B20 
X-CRM114-Status: GOOD (  19.70  )
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

On Mon, Dec 02, 2024 at 01:09:12PM +0530, Taniya Das wrote:
> 
> 
> On 12/2/2024 9:55 AM, Bjorn Andersson wrote:
> > On Fri, Nov 08, 2024 at 09:39:17AM +0530, Taniya Das wrote:
> > > Add support for multimedia clock controllers on Qualcomm QCS615 platform.
> > > Update the defconfig to enable these clock controllers.
> > > 
> > > Global clock controller support
> > > https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> > > 
> > > Signed-off-by: Taniya Das<quic_tdas@quicinc.com>
> > Dropping this series from my queue, due to lack of response from author.
> > 
> > Taniya, please answer questions/feedback from Dmitry, Vladimir and
> > Bryan, and repose as necessary.
> 
> Sure, Bjorn, I had a dependency on the GCC patch.
> 
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> 
> I will fix the comments once the Global clock controller patch is picked.

I think this makes a good generic feedback (I observe the antipattern in
other engineer's behaviour too): please try responding to the comment
after receiving it, not just before getting back to the series.

For this particular case: there is no need to wait on GCC. Please stop
using the external dt-bindings header and use <&gcc_foo_clock> instead.
This is just an example, not a c&p from the platform's DT.


-- 
With best wishes
Dmitry

